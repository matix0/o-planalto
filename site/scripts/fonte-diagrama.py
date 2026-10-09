"""Gera site/src/fonts/planalto-diagrama.woff2 a partir da Noto Sans Mono (OFL 1.1).

Por quê: os diagramas ASCII dos docs (ex.: docs/13_ARQUITETURA_TECNICA.md §13.6)
usam ┌─│└▶ contando cada caractere como 1 coluna. Na Noto Sans Mono, ▶ e outros
glifos de setas/formas têm largura dupla (1200 unidades), o que desalinha as caixas.
Esta fonte derivada contém só esses blocos, com todos os glifos em 600 unidades.

Uso (uma vez, quando precisar regenerar):
    python3 -m venv /tmp/venv && /tmp/venv/bin/pip install fonttools brotli
    /tmp/venv/bin/python site/scripts/fonte-diagrama.py /usr/share/fonts/truetype/noto/NotoSansMono-Regular.ttf

A OFL exige outro nome para fontes modificadas: "Planalto Diagrama".
"""

import sys
from pathlib import Path

from fontTools import subset
from fontTools.pens.transformPen import TransformPen
from fontTools.pens.ttGlyphPen import TTGlyphPen
from fontTools.ttLib import TTFont

RANGES = [(0x2190, 0x21FF), (0x2500, 0x257F), (0x25A0, 0x25FF)]
CELL = 600
# Triângulos cheios de largura dupla trocados pelos "pointers" de largura simples.
REMAP = {0x25B6: 0x25BA, 0x25C0: 0x25C4}
FAMILY = "Planalto Diagrama"

src = Path(sys.argv[1])
out = Path(__file__).resolve().parent.parent / "src" / "fonts" / "planalto-diagrama.woff2"

font = TTFont(src)
for table in font["cmap"].tables:
    if table.isUnicode():
        for wide, narrow in REMAP.items():
            if narrow in table.cmap:
                table.cmap[wide] = table.cmap[narrow]

cmap = font.getBestCmap()
glyf, hmtx, glyphset = font["glyf"], font["hmtx"], font.getGlyphSet()
for start, end in RANGES:
    for cp in range(start, end + 1):
        name = cmap.get(cp)
        if name is None or hmtx[name][0] == CELL:
            continue
        scale = CELL / hmtx[name][0]
        pen = TTGlyphPen(glyphset)
        glyphset[name].draw(TransformPen(pen, (scale, 0, 0, 1, 0, 0)))
        glyf[name] = pen.glyph()
        glyf[name].recalcBounds(glyf)
        hmtx[name] = (CELL, getattr(glyf[name], "xMin", 0))

options = subset.Options()
options.flavor = "woff2"
options.hinting = False
options.layout_features = []
options.name_IDs = [0, 1, 2, 3, 4, 5, 6, 13, 14, 16, 17]
subsetter = subset.Subsetter(options)
subsetter.populate(unicodes=[cp for s, e in RANGES for cp in range(s, e + 1)])
subsetter.subset(font)

names = font["name"]
for record in list(names.names):
    if record.nameID in (1, 16):
        record.string = FAMILY
    elif record.nameID == 4:
        record.string = f"{FAMILY} Regular"
    elif record.nameID == 6:
        record.string = "PlanaltoDiagrama-Regular"
    elif record.nameID == 3:
        record.string = f"{FAMILY};derivada de Noto Sans Mono"

out.parent.mkdir(parents=True, exist_ok=True)
font.save(out)
print(f"{out} ({out.stat().st_size} bytes)")
