"""Apply reviewed changes to a wave: card table fields and Learning Card JSON keys.
Usage: python3 wavefix.py <wave_dir> <changes.json>
changes.json: {"cards": {"INST-184": {"Problema": "...", "Efeitos A": "..."}},
               "learning": {"APR-184": {"data": "..."}}, "sync_titles": true, "event_period": true}"""
import json, re, sys, unicodedata
wave, changes = sys.argv[1], json.load(open(sys.argv[2], encoding="utf-8"))
cpath, lpath = wave + "/cartas.md", wave + "/aprendizados.json"
text = open(cpath, encoding="utf-8").read()

def block_span(t, cid):
    m = re.search(r"(?m)^### %s — .*$" % re.escape(cid), t)
    nxt = re.search(r"(?m)^(### |## )", t[m.end():])
    return m.start(), (m.end() + nxt.start()) if nxt else len(t)

for cid, fields in changes.get("cards", {}).items():
    a, b = block_span(text, cid)
    block = text[a:b]
    for name, value in fields.items():
        pat = re.compile(r"(?m)^\| \*\*%s\*\* \| .* \|$" % re.escape(name))
        assert len(pat.findall(block)) == 1, (cid, name)
        block = pat.sub(lambda _m: "| **%s** | %s |" % (name, value), block)
    text = text[:a] + block + text[b:]
if changes.get("event_period"):
    def add_period(m):
        ev = m.group(2)
        return m.group(1) + ('"%s."' % ev[1:-1] if not ev[1:-1].rstrip().endswith((".", "!", "?")) else ev)
    text = re.sub(r'(?m)^(\| \*\*Evento [AB]\*\* \| )("[^"]*")', add_period, text)
open(cpath, "w", encoding="utf-8").write(text)

titles = {}
for m in re.finditer(r"(?m)^### ((?:INST|THEM|ATOR)-\d{3}) — .*$", text):
    a, b = block_span(text, m.group(1))
    t = re.search(r"(?m)^\| \*\*Título\*\* \| (.*) \|$", text[a:b])
    titles[m.group(1)] = t.group(1).strip()
data = json.load(open(lpath, encoding="utf-8"))
for item in data:
    for k, v in changes.get("learning", {}).get(item["code"], {}).items():
        item[k] = v
    if changes.get("sync_titles") and item["card_id"] in titles:
        item["title"] = titles[item["card_id"]]
json.dump(data, open(lpath, "w", encoding="utf-8"), ensure_ascii=False, indent=2)
for item in data:
    for k, lim in (("lived", 110), ("concept", 170), ("data", 165), ("impact", 55), ("source", 50)):
        n = len(unicodedata.normalize("NFC", item.get(k, "")))
        if n > lim:
            print("LIMITE: %s %s %d > %d" % (item["code"], k, n, lim))
print("ok", wave)
