"""Verifica estructura SVG y compara visualmente SVG con Chromium."""
import base64, html, json, math, xml.etree.ElementTree as ET
from pathlib import Path
from PIL import Image, ImageChops, ImageStat, ImageDraw
from playwright.sync_api import sync_playwright

ROOT=Path(__file__).resolve().parent
report=json.loads((ROOT/'validacion.json').read_text(encoding='utf-8'))
results=[]
with sync_playwright() as pw:
    browser=pw.chromium.launch(channel='chrome',headless=True)
    for item in report['screens']:
        path=ROOT/item['file']
        tree=ET.parse(path)
        root=tree.getroot()
        width=int(root.attrib['width'])
        height=int(root.attrib['height'])
        images=tree.findall('.//{http://www.w3.org/2000/svg}image')
        external=[i.attrib for i in images if not (i.get('{http://www.w3.org/1999/xlink}href') or i.get('href','')).startswith('data:')]
        page=browser.new_page(viewport={'width':width,'height':min(height,1000)},device_scale_factor=1)
        payload=base64.b64encode(path.read_bytes()).decode()
        page.set_content(f'<html><body style="margin:0"><img width="{width}" height="{height}" src="data:image/svg+xml;base64,{payload}"></body></html>')
        page.wait_for_function('document.images[0].complete')
        output=page.screenshot(full_page=True)
        import io
        actual=Image.open(io.BytesIO(output)).convert('RGB')
        ref=Image.open(path.with_suffix('.png')).convert('RGB')
        actual=actual.crop((0,0,ref.width,ref.height))
        diff=ImageChops.difference(actual,ref)
        mae=sum(ImageStat.Stat(diff).mean)/3
        if mae>8:
            (ROOT/'revision').mkdir(exist_ok=True)
            actual.save(ROOT/'revision'/(path.stem+'.png'))
        results.append({'file':item['file'],'mean_absolute_pixel_error_0_255':round(mae,3),'external_images':len(external),'vector_paths':len(tree.findall('.//{http://www.w3.org/2000/svg}path')),'horizontal_overflow_in_html':item['metrics']['width']>width})
        print(f'VERIFICADO {item["file"]}: {mae:.3f}',flush=True)
        page.close()
    browser.close()
(ROOT/'comparacion-svg.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
for mode in ['escritorio','celular']:
    items=[s for s in report['screens'] if s['mode']==mode]
    thumbw,thumbh=260,450
    sheet=Image.new('RGB',(thumbw*5,math.ceil(len(items)/5)*(thumbh+45)),'#e2e8f0')
    draw=ImageDraw.Draw(sheet)
    for n,item in enumerate(items):
        pic=Image.open((ROOT/item['file']).with_suffix('.png')).convert('RGB')
        pic.thumbnail((thumbw-16,thumbh-8))
        x=(n%5)*thumbw; y=(n//5)*(thumbh+45)
        sheet.paste(pic,(x+8,y+35))
        draw.text((x+8,y+5),item['label'].split(' · ')[1]+' '+item['screen'],fill='black')
    sheet.save(ROOT/f'vista-general-{mode}.jpg')
cards=[]
for item in report['screens']:
    file=html.escape(item['file'])
    cards.append(f'<article><h2>{html.escape(item["label"])} — {item["mode"]}</h2><a href="{file}">Abrir SVG</a> · <a href="{file[:-4]}.png">Referencia PNG</a><br><a href="{file}"><img loading="lazy" src="{file[:-4]}.png"></a></article>')
(ROOT/'indice.html').write_text('<!doctype html><html lang="es"><meta charset="utf-8"><title>ESEJUR · SVG</title><style>body{font:16px system-ui;background:#f1f5f9;padding:24px}main{display:grid;grid-template-columns:repeat(auto-fit,minmax(320px,1fr));gap:24px}article{background:white;padding:16px;border-radius:12px}h2{font-size:16px}img{max-width:100%;max-height:600px;object-fit:contain;object-position:top;margin-top:12px}</style><h1>ESEJUR · Pantallas SVG</h1><p>HTML principal, estado inicial de cada pantalla. Escritorio: 1440 px. Celular: 390 px. Sin barra de revisión. SVG estáticos con texto trazado.</p><main>'+''.join(cards)+'</main></html>',encoding='utf-8')
print(json.dumps({'count':len(results),'max_error':max(r['mean_absolute_pixel_error_0_255'] for r in results),'external_images':sum(r['external_images'] for r in results),'overflow':[r['file'] for r in results if r['horizontal_overflow_in_html']]},ensure_ascii=False),flush=True)
