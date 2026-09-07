"""Exporta el HTML original con Chromium: PDF vectorial -> SVG autocontenido."""
import argparse, functools, hashlib, http.server, json, math, re, threading, unicodedata
from pathlib import Path
import pymupdf as fitz
from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT.parent.parent / 'PROTOTIPO HTML'
HTML = SOURCE / 'Prototipo ESEJUR.dc.html'

class QuietHandler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, *args): pass

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--limit', type=int, default=0)
    parser.add_argument('--screen')
    parser.add_argument('--mode',choices=['escritorio','celular'])
    args = parser.parse_args()
    source = HTML.read_text(encoding='utf-8')
    target_keys = {'adminUsuarios', 'adminBase', 'adminEditor'}
    seen = set()
    screens = []
    for key, label in re.findall(r"\{ id: '([^']+)', label: '([^']+)' \}", source):
        if key in target_keys and re.match(r'^(EP02|ADM) · PF-', label) and key not in seen:
            seen.add(key)
            screens.append((key, label))
    if args.limit: screens = screens[:args.limit]
    if args.screen: screens = [(key,label) for key,label in screens if key==args.screen]
    server = http.server.ThreadingHTTPServer(('127.0.0.1', 0), functools.partial(QuietHandler, directory=str(SOURCE)))
    threading.Thread(target=server.serve_forever, daemon=True).start()
    report = []
    if (args.screen or args.mode) and (ROOT/'validacion.json').exists():
        report=[item for item in json.loads((ROOT/'validacion.json').read_text(encoding='utf-8'))['screens'] if not ((not args.screen or item['screen']==args.screen) and (not args.mode or item['mode']==args.mode))]
    with sync_playwright() as pw:
        browser = pw.chromium.launch(channel='chrome', headless=True)
        for mode, width, height in [('escritorio',1440,1000), ('celular',390,844)]:
            if args.mode and mode!=args.mode: continue
            folder = ROOT / mode
            folder.mkdir(exist_ok=True)
            for screen, label in screens:
                context = browser.new_context(viewport={'width':width,'height':height}, device_scale_factor=1)
                page = context.new_page()
                errors = []
                page.on('pageerror', lambda e: errors.append(str(e)))
                state = {'pantalla':screen,'device':'movil' if mode=='celular' else 'desktop'}
                context.add_init_script('localStorage.setItem("esejur-proto-v3", '+json.dumps(json.dumps(state))+');')
                page.goto(f'http://127.0.0.1:{server.server_port}/Prototipo%20ESEJUR.dc.html',wait_until='networkidle')
                page.wait_for_timeout(1200)
                page.wait_for_function("window.__dcSetProps && !document.body.innerText.includes('{{')")
                page.evaluate("window.__dcSetProps(window.__dcRootName(), {mostrarBarraReview:false})")
                page.wait_for_timeout(150)
                page.evaluate("""async () => {
                  await document.fonts.ready;
                  await Promise.all(Array.from(document.images).map(i => i.complete ? Promise.resolve() : new Promise(r=>{i.onload=r;i.onerror=r;setTimeout(r,8000)})));
                }""")
                page.add_style_tag(content='* { animation:none!important; transition:none!important; -webkit-print-color-adjust:exact!important; print-color-adjust:exact!important; }')
                page.evaluate("""() => {
                  for (const e of document.querySelectorAll('[style]')) {
                    for (const p of ['height','min-height','max-height']) {
                      if (/vh|vw/.test(e.style.getPropertyValue(p))) e.style.setProperty(p,getComputedStyle(e).getPropertyValue(p));
                    }
                  }
                }""")
                metrics = page.evaluate("""() => ({height:Math.max(document.body.scrollHeight,document.documentElement.scrollHeight),width:document.documentElement.scrollWidth, sections:Array.from(document.querySelectorAll('[data-screen-label]')).filter(e=>e.getBoundingClientRect().height>0).map(e=>e.dataset.screenLabel), brokenImages:Array.from(document.images).filter(i=>!i.naturalWidth).map(i=>i.src), fonts:Array.from(document.fonts).map(f=>({family:f.family,status:f.status}))})""")
                if not metrics['sections']: raise RuntimeError(f'No se renderizo {screen}: {errors}')
                slug = re.sub(r'[^a-zA-Z0-9]+','-',unicodedata.normalize('NFKD',label).encode('ascii','ignore').decode()).strip('-')
                name = f'{slug}-{mode}'
                if mode == 'celular':
                    # Export viewport-sized views, never shrink a long page into a phone.
                    offsets = [('principal',0)]
                    if screen == 'catalogo':
                        top=page.get_by_role('heading',name='Programas disponibles').evaluate('(e)=>e.getBoundingClientRect().top')
                        offsets.append(('cursos',max(0,round(top-24))))
                    if screen == 'registro':
                        top=page.locator('h1').first.evaluate('(e)=>e.getBoundingClientRect().top')
                        start=max(0,round(top-90))
                        offsets=[('formulario',start),('contrasena-y-confirmacion',max(start,metrics['height']-844))]
                    metrics['original_height']=metrics['height']
                    metrics['height']=844
                    page.emulate_media(media='screen')
                    full_pdf=page.pdf(width='390px',height=f'{metrics["original_height"]+1}px',print_background=True,margin={'top':'0','bottom':'0','left':'0','right':'0'})
                    # A clipped viewport wrapper reproduces a scroll position in a vector PDF.
                    page.evaluate("""() => {
                      const wrap=document.createElement('div');wrap.id='export-viewport-content';
                      for(const node of Array.from(document.body.childNodes))wrap.appendChild(node);
                      document.body.appendChild(wrap);
                      document.documentElement.style.cssText+=';height:844px;overflow:hidden;';
                      document.body.style.cssText+=';margin:0;height:844px;overflow:hidden;';
                    }""")
                    for variant,offset in offsets:
                        page.evaluate('(y)=>document.getElementById("export-viewport-content").style.transform=`translateY(-${y}px)`',offset)
                        mobile_name=f'{name}-{variant}'
                        page.screenshot(path=str(folder/(mobile_name+'.png')),full_page=False)
                        page.emulate_media(media='screen')
                        doc=fitz.open(stream=full_pdf,filetype='pdf')
                        if len(doc)!=1: raise RuntimeError('El PDF movil completo debe tener una sola pagina')
                        scale=72/96
                        doc[0].set_cropbox(fitz.Rect(0,offset*scale,390*scale,(offset+844)*scale))
                        svg=doc[0].get_svg_image(text_as_path=True)
                        svg=re.sub(r'width="[^"]+" height="[^"]+"','width="390" height="844"',svg,count=1)
                        (folder/(mobile_name+'.svg')).write_text(svg,encoding='utf-8')
                        report.append({'screen':screen,'label':label+' · '+variant,'mode':mode,'file':f'{mode}/{mobile_name}.svg','metrics':dict(metrics),'scroll_y':offset,'errors':errors})
                    (ROOT/'validacion.json').write_text(json.dumps({'source_sha256':hashlib.sha256(HTML.read_bytes()).hexdigest(),'screens':report},ensure_ascii=False,indent=2),encoding='utf-8')
                    print(f'OK celular {screen}: {len(offsets)} vistas de 390x844',flush=True)
                    context.close()
                    continue
                page.screenshot(path=str(folder / (name+'.png')),full_page=True)
                # Screen media keeps the source responsive rules, unlike print styles.
                page.emulate_media(media='screen')
                pdf = page.pdf(width=f'{width}px',height=f'{metrics["height"]+1}px',print_background=True,margin={'top':'0','bottom':'0','left':'0','right':'0'},prefer_css_page_size=False)
                doc = fitz.open(stream=pdf,filetype='pdf')
                if len(doc)!=1: raise RuntimeError(f'{name}: PDF dividido en {len(doc)} paginas')
                svg = doc[0].get_svg_image(text_as_path=True)
                svg = re.sub(r'width="[^"]+" height="[^"]+"',f'width="{width}" height="{metrics["height"]+1}"',svg,count=1)
                (folder / (name+'.svg')).write_text(svg,encoding='utf-8')
                report.append({'screen':screen,'label':label,'mode':mode,'file':f'{mode}/{name}.svg','metrics':metrics,'errors':errors})
                (ROOT/'validacion.json').write_text(json.dumps({'source_sha256':hashlib.sha256(HTML.read_bytes()).hexdigest(),'screens':report},ensure_ascii=False,indent=2),encoding='utf-8')
                print(f'OK {mode} {label} {width}x{metrics["height"]} overflow={metrics["width"]>width}',flush=True)
                context.close()
        browser.close()
    server.shutdown()

if __name__ == '__main__': main()
