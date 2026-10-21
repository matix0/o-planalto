#!/usr/bin/env python3
"""Cards of docs/17 and Learning Cards of docs/18 → checks and the game's JSON (P-015).

Usage, from the repository root:
  python3 jogo/tools/cards_doc.py check [--ids INST-061,INST-063] [--wave-report]
  python3 jogo/tools/cards_doc.py export --out <dir>

`check` applies the per-card rules of gestao/prompts/criacao-cartas.md ("Regras por carta",
also .claude/commands/validate-cards.md) and prints the deck warnings ("Regras de baralho").
Characters are counted in NFC, like the game (String.length(), accent = 1).
`export` writes cards.json, impeachment.json, learning.json and actor_cards.json (the `cards`
field of actors.json) in the game's format (DP-014). Format of the doc: docs/17 §17.01.1.
"""
import argparse
import json
import os
import re
import sys
import unicodedata

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
DOC17 = os.path.join(ROOT, "docs", "17_ROTEIRO_DAS_CARTAS.md")
DOC18 = os.path.join(ROOT, "docs", "18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md")
ACTORS = os.path.join(ROOT, "jogo", "data", "actors.json")

METERS = {"Dignidade": "dignity", "Consciência": "awareness", "Soberania": "sovereignty",
          "Segurança": "security", "Integridade": "integrity", "Caixa": "treasury",
          "Capital Político": "political_capital", "Legitimidade": "legitimacy"}
MODES = {"Congresso": "congress", "Orçamento": "budget", "Currículo e Mídia": "curriculum_media",
         "Geopolítico": "geopolitics", "Prisional e Policial": "prison_police", "Emendas": "amendments",
         "Bancadas": "caucuses", "Impeachment": "impeachment", "Judiciário": "judiciary",
         "Influenciador": "influencer"}
MODE_RANGES = {"congress": (1, 20), "budget": (21, 40), "curriculum_media": (41, 60),
               "geopolitics": (61, 80), "prison_police": (81, 100), "amendments": (101, 120),
               "caucuses": (121, 140), "impeachment": (141, 160), "judiciary": (161, 180),
               "influencer": (181, 200)}
TYPES = {"Institucional": "institutional", "Temática": "thematic", "Ator": "actor",
         "Impeachment": "impeachment"}
THEMES = {"Reforma Agrária": "land_reform", "Meio Ambiente": "environment", "Fome": "hunger",
          "Saúde": "health", "Trabalho": "labor", "Racismo": "racism", "Cultura": "culture"}
THEME_BLOCKS = ["land_reform", "environment", "hunger", "health", "labor", "racism", "culture"]
COLORS = {"Vermelho": "red", "Azul": "blue", "Verde": "green", "Amarelo": "yellow",
          "Roxo": "purple", "Laranja": "orange", "Preto": "black"}
TECHNIQUES = {"Desmoralização": "demoralization", "Pânico Moral": "moral_panic",
              "Deepfake": "deepfake", "Fazenda de IA": "ai_farm",
              "Cachê da Desgraça": "doom_cache", "Didatismo Acusatório": "accusatory_didacticism"}
REACTIONS = {"Aceitar": "accept", "Recusar": "refuse", "Investigar": "investigate"}
ROLES = {"Exigência": "demand", "Ataque": "attack", "Oferta": "offer"}
NO_OFFER = {"ACT-010", "ACT-021"}
SIDE_WORDS = ("esquerda", "direita")
CARD_FIELDS = {"Título", "Tipo", "Modo", "Tema", "Função", "Fase", "Quem fala", "Ano mínimo",
               "Técnica", "Problema", "Aprendizado", "Status"}
OPTION_FIELDS = {"Opção", "Cor", "Efeitos", "Consequência", "Eixo", "Atores", "Evento",
                 "Reação", "Teste"}
LIMITS = {"title_words": 5, "problem": 140, "option": 25, "consequence": 80}


def nfc_len(text):
    return len(unicodedata.normalize("NFC", text))


def actor_roles():
    """DP-015: ATOR ids are sequential per actor, demand → attack → offer (no offer for
    ACT-010 and ACT-021). Returns {ATOR-nnn: (ACT-xxx, role)}."""
    out = {}
    n = 1
    for a in range(1, 25):
        act = "ACT-%03d" % a
        for role in ("demand", "attack", "offer"):
            if role == "offer" and act in NO_OFFER:
                continue
            out["ATOR-%03d" % n] = (act, role)
            n += 1
    return out


# --- Parsing -----------------------------------------------------------------------------------

def parse_doc17(path=DOC17):
    text = open(path, encoding="utf-8").read()
    cards = []
    for m in re.finditer(r"(?m)^### ((?:INST|THEM|ATOR)-\d{3}|IMP-[1-5]) — (.*)$", text):
        start = m.end()
        nxt = re.search(r"(?m)^(### |## |---)", text[start:])
        body = text[start:start + nxt.start()] if nxt else text[start:]
        line_no = text.count("\n", 0, m.start()) + 1
        fields = {}
        errors = []
        for ln in body.split("\n"):
            row = re.match(r"^\| \*\*(.+?)\*\* \| (.*) \|\s*$", ln)
            if not row:
                continue
            name, value = row.group(1).strip(), row.group(2).strip()
            if name in fields:
                errors.append("linha repetida: %s" % name)
            fields[name] = value
        cards.append({"id": m.group(1), "header": m.group(2).strip(), "line": line_no,
                      "fields": fields, "parse_errors": errors})
    return cards


def parse_doc18(path=DOC18):
    """Learning Cards linked to cards (§18.02-18.13): code → blocks, source and link."""
    text = open(path, encoding="utf-8").read()
    stop = text.find("## 18.14")
    linked = text[:stop] if stop > 0 else text
    out = {}
    for m in re.finditer(r"(?m)^### (APR-(?:\d{3}|THEM-\d{3}|ATOR-\d{3}|IMP-[1-5])) — (.*)$", linked):
        start = m.end()
        nxt = re.search(r"(?m)^(### |## )", linked[start:])
        body = linked[start:start + nxt.start()] if nxt else linked[start:]
        box = re.search(r"```(.*?)```", body, re.S)
        lines = []
        if box:
            for ln in box.group(1).split("\n"):
                ln = ln.strip()
                if ln.startswith("│"):
                    inner = ln.strip("│").strip()
                    lines.append(inner)
        blocks = _blocks(lines)
        link = re.search(r"\*\*Fonte verificada[^*]*\*\*:?\s*\[([^\]]+)\]\((https?://[^)]+)\)", body)
        out[m.group(1)] = {"title": m.group(2).strip(), "blocks": blocks, "line": text.count("\n", 0, m.start()) + 1,
                           "link_label": link.group(1) if link else "", "url": link.group(2) if link else ""}
    return out


def _blocks(lines):
    """Box lines → lived, concept, data, source, impact (doc 18 §18.01)."""
    keys = {"O QUE VOCÊ ACABOU DE VIVENCIAR:": "lived", "O CONCEITO POR TRÁS:": "concept",
            "DADOS REAIS:": "data"}
    blocks = {"lived": [], "concept": [], "data": [], "source": "", "impact": [], "technique": ""}
    cur = None
    started = False
    for ln in lines:
        if ln.startswith("CARTA DE APRENDIZADO"):
            continue
        if not started:
            if ln in keys:
                started = True
            else:
                continue   # card title line
        if ln in keys:
            cur = keys[ln]
            continue
        if ln.startswith("FONTE:"):
            blocks["source"] = ln[len("FONTE:"):].strip()
            cur = "after_source"
            continue
        if ln.startswith("TÉCNICA:"):
            blocks["technique"] = ln[len("TÉCNICA:"):].strip()
            continue
        if ln == "":
            if cur in ("lived", "concept", "data"):
                cur = None
            continue
        if cur in ("lived", "concept", "data"):
            blocks[cur].append(ln)
        elif cur == "after_source":
            blocks["impact"].append(ln)
    return blocks


def _join(lines):
    return re.sub(r"\s+", " ", " ".join(lines)).strip()


# --- Field parsers -----------------------------------------------------------------------------

def parse_effects(value, errs, tag, event=False):
    out = {}
    if value in ("", "—"):
        return out
    for part in [p.strip() for p in value.split(",") if p.strip()]:
        m = re.match(r"^`([^`]+)`\s*([+\-−])\s*(\d+)$", part)
        if not m:
            errs.append("%s: efeito ilegível '%s'" % (tag, part))
            continue
        meter = METERS.get(m.group(1))
        if not meter:
            errs.append("%s: medidor desconhecido '%s'" % (tag, m.group(1)))
            continue
        v = int(m.group(3)) * (-1 if m.group(2) in "-−" else 1)
        out[meter] = v
    return out


def parse_axis(value, errs, tag):
    m = re.match(r"^\[(.*)\]$", value.strip())
    if not m:
        errs.append("%s: eixo ilegível" % tag)
        return [0, 0, 0, 0]
    try:
        vals = [int(x.strip().replace("−", "-").replace("+", "")) for x in m.group(1).split(",")]
    except ValueError:
        errs.append("%s: eixo ilegível" % tag)
        return [0, 0, 0, 0]
    if len(vals) != 4 or any(abs(v) > 2 for v in vals):
        errs.append("%s: eixo precisa de 4 inteiros entre −2 e +2" % tag)
    return vals


def parse_actors(value, errs, tag, known):
    out = {}
    if value in ("", "—"):
        return out
    for part in [p.strip() for p in value.split(",") if p.strip()]:
        m = re.match(r"^`(ACT-\d{3})`\s*([+\-−])1$", part)
        if not m:
            errs.append("%s: ator ilegível '%s' (use `ACT-xxx` +1 ou -1)" % (tag, part))
            continue
        if m.group(1) not in known:
            errs.append("%s: ator desconhecido %s" % (tag, m.group(1)))
        out[m.group(1)] = -1 if m.group(2) in "-−" else 1
    return out


def parse_event(value, errs, tag):
    if value in ("", "—"):
        return []
    parts = [p.strip() for p in value.split("·")]
    if len(parts) != 3:
        errs.append("%s: evento precisa de \"texto\" · atraso N · efeitos" % tag)
        return []
    text = parts[0].strip().strip('"').strip("“”")
    m = re.match(r"^atraso\s+(\d)$", parts[1])
    delay = int(m.group(1)) if m else 0
    if delay not in (1, 2):
        errs.append("%s: atraso do evento deve ser 1 ou 2" % tag)
    effects = parse_effects(parts[2], errs, tag + " (evento)", event=True)
    if not 1 <= len(effects) <= 3:
        errs.append("%s: evento com 1-3 medidores" % tag)
    for meter, v in effects.items():
        if v % 5 or not 5 <= abs(v) <= 20:
            errs.append("%s: efeito do evento em %s fora de ±5..±20 (múltiplo de 5)" % (tag, meter))
    if not text:
        errs.append("%s: evento sem texto" % tag)
    return [{"text": text, "delay": delay, "effects": effects}]


def parse_test(value, errs, tag):
    m = re.match(r"^`([^`]+)`\s*(<=|>=|<|>)\s*(\d+)", value)
    if not m or m.group(1) not in METERS:
        errs.append("%s: teste ilegível" % tag)
        return {}
    return {"meter": METERS[m.group(1)], "op": m.group(2), "value": int(m.group(3))}


def unquote(text):
    t = text.strip()
    if len(t) >= 2 and t[0] in "\"“" and t[-1] in "\"”":
        return t[1:-1]
    return t


# --- Card build and checks ---------------------------------------------------------------------

def build_card(c, known_actors, roles_by_id):
    f = c["fields"]
    errs = list(c["parse_errors"])
    cid = c["id"]
    prefix = cid.split("-")[0]
    for name in f:
        base = name[:-2] if name[-2:] in (" A", " B") else name
        if name not in CARD_FIELDS and base not in OPTION_FIELDS:
            errs.append("linha desconhecida: %s" % name)
    card = {"id": cid}
    title = f.get("Título", "")
    card["title"] = title
    if not title:
        errs.append("sem título")
    elif len(title.split()) > LIMITS["title_words"]:
        errs.append("título com mais de 5 palavras")
    ctype = TYPES.get(f.get("Tipo", ""))
    expected = {"INST": "institutional", "THEM": "thematic", "ATOR": "actor", "IMP": "impeachment"}[prefix]
    if ctype != expected:
        errs.append("tipo '%s' não bate com o ID" % f.get("Tipo", ""))
    card["type"] = expected
    mode = MODES.get(f.get("Modo", ""))
    if not mode:
        errs.append("modo desconhecido '%s'" % f.get("Modo", ""))
    card["mode"] = mode or ""
    num = int(cid.split("-")[-1])
    if prefix == "INST" and mode:
        lo, hi = MODE_RANGES[mode]
        if not lo <= num <= hi:
            errs.append("INST-%03d fora da faixa do modo %s (%d-%d)" % (num, mode, lo, hi))
    if prefix == "THEM":
        theme = THEMES.get(f.get("Tema", ""))
        if not theme:
            errs.append("tema desconhecido '%s'" % f.get("Tema", ""))
        elif THEME_BLOCKS[(num - 1) // 10] != theme:
            errs.append("THEM-%03d fora do bloco do tema %s" % (num, f.get("Tema")))
        card["theme"] = theme or ""
    elif "Tema" in f:
        errs.append("linha Tema só em carta temática")
    owner = None
    if prefix == "ATOR":
        m = re.match(r"^`(ACT-\d{3})`\s*·\s*(\S+)$", f.get("Função", ""))
        exp = roles_by_id.get(cid)
        if not m or m.group(2) not in ROLES:
            errs.append("função ilegível (use `ACT-xxx` · Exigência/Ataque/Oferta)")
        elif not exp or (m.group(1), ROLES[m.group(2)]) != exp:
            errs.append("função %s · %s não bate com a numeração (esperado %s)" % (m.group(1), m.group(2), exp))
        if m:
            owner = m.group(1)
            card["_owner"] = (m.group(1), ROLES.get(m.group(2), ""))
    elif "Função" in f:
        errs.append("linha Função só em carta de ator")
    if prefix == "IMP":
        try:
            card["phase"] = int(f.get("Fase", "0"))
        except ValueError:
            card["phase"] = 0
        if card["phase"] != num:
            errs.append("fase deve ser %d" % num)
    who = f.get("Quem fala", "").strip()
    m = re.match(r"^`(ACT-\d{3})`$", who)
    if not who or who == "—":
        errs.append("sem Quem fala (D-164)")
    elif m:
        who = m.group(1)
        if who not in known_actors:
            errs.append("Quem fala: ator desconhecido %s" % who)
    card["speaker"] = who
    try:
        min_year = int(f.get("Ano mínimo", ""))
    except ValueError:
        min_year = 0
    if prefix != "IMP" and not 1 <= min_year <= 4:
        errs.append("Ano mínimo deve ser 1-4")
    card["prerequisites"] = {"min_year": min_year if min_year else 1}
    influencer = mode == "influencer"
    if influencer:
        tech = TECHNIQUES.get(f.get("Técnica", ""))
        if not tech:
            errs.append("Influenciador sem técnica válida")
        card["technique"] = tech or ""
    elif "Técnica" in f:
        errs.append("Técnica só no modo Influenciador")
    problem = f.get("Problema", "")
    card["problem"] = problem
    if not problem:
        errs.append("sem problema")
    elif nfc_len(problem) > LIMITS["problem"]:
        errs.append("problema com %d caracteres (máx. 140)" % nfc_len(problem))
    options = {}
    for x in ("A", "B"):
        tag = "opção " + x
        o = {}
        text = f.get("Opção " + x, "")
        o["text"] = text
        if not text:
            errs.append(tag + ": sem texto")
        elif nfc_len(text) > LIMITS["option"]:
            errs.append("%s: %d caracteres (máx. 25, D-177)" % (tag, nfc_len(text)))
        color = COLORS.get(f.get("Cor " + x, ""))
        if not color:
            errs.append(tag + ": cor inválida '%s'" % f.get("Cor " + x, ""))
        o["color"] = color or ""
        o["axis"] = parse_axis(f.get("Eixo " + x, ""), errs, tag)
        o["effects"] = parse_effects(f.get("Efeitos " + x, ""), errs, tag)
        cons = unquote(f.get("Consequência " + x, ""))
        o["consequence"] = cons
        if not cons:
            errs.append(tag + ": sem consequência")
        elif nfc_len(cons) > LIMITS["consequence"]:
            errs.append("%s: consequência com %d caracteres (máx. 80)" % (tag, nfc_len(cons)))
        if prefix == "IMP":
            o["test"] = parse_test(f.get("Teste " + x, ""), errs, tag)
            o["actors"] = {}
            o["events"] = []
        else:
            if "Atores " + x not in f or "Evento " + x not in f:
                errs.append(tag + ": faltam as linhas Atores e Evento (use — quando vazio)")
            o["actors"] = parse_actors(f.get("Atores " + x, "—"), errs, tag, known_actors)
            o["events"] = parse_event(f.get("Evento " + x, "—"), errs, tag)
            if "Teste " + x in f:
                errs.append(tag + ": Teste só na cena")
        if influencer:
            r = REACTIONS.get(f.get("Reação " + x, ""))
            if not r:
                errs.append(tag + ": reação inválida")
            o["reaction"] = r or ""
        elif "Reação " + x in f:
            errs.append(tag + ": Reação só no modo Influenciador")
        options[x] = o
    # Effects (D-098, D-108): 2-4 meters, multiples of 5, ±5..±30, ≥ 1 negative.
    role = card.get("_owner", (None, None))[1]
    goodwill_used = False
    for x, o in options.items():
        eff = o["effects"]
        tag = "opção " + x
        if not 2 <= len(eff) <= 4:
            errs.append(tag + ": 2-4 medidores")
        for meter, v in eff.items():
            if v % 5 or not 5 <= abs(v) <= 30:
                errs.append("%s: %s %+d fora de ±5..±30 (múltiplo de 5)" % (tag, meter, v))
        if eff and not any(v < 0 for v in eff.values()):
            if role == "offer" and not goodwill_used:
                goodwill_used = True   # Boa Vontade (D-108)
            else:
                errs.append(tag + ": precisa de ≥ 1 efeito negativo")
        if len(o["actors"]) > 3:
            errs.append(tag + ": no máximo 3 atores")
        if prefix == "ATOR" and owner and o["actors"].get(owner, 0) == 0:
            errs.append(tag + ": carta de ator cita o próprio ator nas duas opções")
    if options["A"]["color"] and options["A"]["color"] == options["B"]["color"]:
        errs.append("as duas opções com a mesma cor (D-103)")
    if influencer:
        ra, rb = options["A"].get("reaction"), options["B"].get("reaction")
        if ra and ra == rb:
            errs.append("reações iguais nas duas opções")
        for x, o in options.items():
            if o.get("reaction") == "accept" and o["effects"].get("integrity", 0) >= 0 and o["effects"].get("awareness", 0) >= 0:
                errs.append("opção %s: 'Aceitar' precisa perder Integridade ou Consciência" % x)
    card["option_a"] = options["A"]
    card["option_b"] = options["B"]
    apr = f.get("Aprendizado", "").split(" ")[0].strip()
    expected_apr = {"INST": "APR-%03d" % num, "THEM": "APR-THEM-%03d" % num,
                    "ATOR": "APR-ATOR-%03d" % num, "IMP": "APR-IMP-%d" % num}[prefix]
    if apr != expected_apr:
        errs.append("Aprendizado deve ser %s (DP-015)" % expected_apr)
    card["learning_id"] = apr
    if "Status" not in f:
        errs.append("sem Status")
    card["_status"] = f.get("Status", "")
    player_text = [title, problem] + [o["text"] for o in options.values()] + [o["consequence"] for o in options.values()]
    for o in options.values():
        for ev in o["events"]:
            player_text.append(ev["text"])
    for t in player_text:
        low = t.lower()
        for w in SIDE_WORDS:
            if re.search(r"\b%s\b" % w, low):
                errs.append("palavra de lado '%s' no texto (D-084)" % w)
        if "[não verificado" in t or "[a definir" in t:
            errs.append("marcador no texto ao jogador: %s" % t[:40])
    return card, errs


def check_learning(code, l, warnings=None):
    """Errors keep the card out; line counts of approved cards are warnings (the box line is
    an approximation of the screen line, and the PO approved those texts)."""
    errs = []
    b = l["blocks"]
    for key, label, max_lines in (("lived", "vivência", 2), ("concept", "conceito", 3), ("data", "dados", 3)):
        if not b[key]:
            errs.append("%s: sem bloco %s" % (code, label))
        elif len(b[key]) > max_lines:
            msg = "%s: bloco %s com %d linhas (máx. %d)" % (code, label, len(b[key]), max_lines)
            if warnings is not None:
                warnings.append(msg)
            else:
                errs.append(msg)
    if not b["source"]:
        errs.append("%s: sem FONTE" % code)
    if not b["impact"]:
        errs.append("%s: sem frase de impacto" % code)
    if not l["url"]:
        errs.append("%s: sem link de fonte verificada — a carta fica fora do baralho (D-091, D-102)" % code)
    for key in ("lived", "concept", "data", "impact"):
        txt = _join(b[key])
        if "[não verificado" in txt or "[a definir" in txt:
            errs.append("%s: marcador no texto ao jogador (%s)" % (code, key))
    if "[não verificado" in b["source"]:
        errs.append("%s: FONTE marcada [não verificado]" % code)
    return errs


def deck_report(cards):
    """Deck warnings (criacao-cartas.md "Regras de baralho"), over cards inside the 340."""
    deck = [c for c in cards if c["type"] != "impeachment"]
    opts = [c[k] for c in deck for k in ("option_a", "option_b")]
    n = len(opts) or 1
    lines = []
    ev = sum(1 for o in opts if o["events"])
    lines.append("Eventos: %d de %d opções (%.0f%%; meta 15-25%%, D-125)" % (ev, n, 100.0 * ev / n))
    for i, axis in enumerate(("Economia", "Diplomacia", "Sociedade", "Estado")):
        k = sum(1 for o in opts if o["axis"][i] != 0)
        flag = "" if 100.0 * k / n >= 15 else "  ⚠ abaixo de 15% (D-126)"
        lines.append("Eixo %s ≠ 0: %d (%.0f%%)%s" % (axis, k, 100.0 * k / n, flag))
    by_color = {}
    for o in opts:
        acc = by_color.setdefault(o["color"], {})
        for m, v in o["effects"].items():
            acc[m] = acc.get(m, 0) + v
    for color, acc in sorted(by_color.items()):
        neg = [m for m, v in acc.items() if v < 0]
        flag = "" if neg else "  ⚠ nenhum medidor com saldo negativo (D-100)"
        lines.append("Cor %s: %s%s" % (color, ", ".join("%s %+d" % (m, v) for m, v in sorted(acc.items())), flag))
    tech = {}
    for c in deck:
        if c.get("technique"):
            tech[c["technique"]] = tech.get(c["technique"], 0) + 1
    for t in TECHNIQUES.values():
        k = tech.get(t, 0)
        flag = "" if k >= 2 else "  ⚠ menos de 2 cartas (D-119)"
        lines.append("Técnica %s: %d%s" % (t, k, flag))
    for meter in METERS.values():
        pos = [c for c in deck for k in ("option_a", "option_b") if c[k]["effects"].get(meter, 0) > 0]
        late = [c for c in pos if c["prerequisites"]["min_year"] >= 2]
        lines.append("Carta ligada — %s: %d opções com efeito positivo (%d com ano mínimo 2-4)" % (meter, len(pos), len(late)))
    counts = {}
    for c in deck:
        key = c["mode"] if c["type"] == "institutional" else c["type"]
        counts[key] = counts.get(key, 0) + 1
    lines.append("Cartas por modo/tipo: " + ", ".join("%s %d" % kv for kv in sorted(counts.items())))
    return lines


def load_all(doc17=DOC17, doc18=DOC18):
    known = {a["id"] for a in json.load(open(ACTORS, encoding="utf-8"))}
    roles = actor_roles()
    raw = parse_doc17(doc17)
    learning = parse_doc18(doc18) if doc18 else {}
    built = []
    for c in raw:
        card, errs = build_card(c, known, roles)
        card["_line"] = c["line"]
        card["_errors"] = errs
        built.append(card)
    return built, learning


def cmd_check(args):
    cards, learning = load_all(args.doc17, None if args.no_learning else args.doc18)
    want = set(x.strip() for x in args.ids.split(",")) if args.ids else None
    seen = {}
    total_err = 0
    for c in cards:
        if c["id"] in seen:
            c["_errors"].append("ID repetido (linha %d)" % seen[c["id"]])
        seen[c["id"]] = c["_line"]
        if want and c["id"] not in want:
            continue
        errs = list(c["_errors"])
        warns = []
        l = learning.get(c["learning_id"])
        if args.no_learning:
            pass
        elif not l:
            errs.append("Aprendizado %s não está no doc 18 — carta fora do baralho" % c["learning_id"])
        else:
            approved = c["_status"].startswith("aprovado")
            errs.extend(check_learning(c["learning_id"], l, warns if approved else None))
        if errs:
            total_err += len(errs)
            print("✗ %s (docs/17:%d)" % (c["id"], c["_line"]))
            for e in errs:
                print("    - " + e)
        elif args.verbose:
            print("✓ %s" % c["id"])
        for w in warns:
            print("  ⚠ %s: %s" % (c["id"], w))
    checked = len([c for c in cards if not want or c["id"] in want])
    print("\n%d cartas conferidas, %d erros." % (checked, total_err))
    if args.wave_report or not want:
        print("\nAvisos do baralho (todas as cartas do doc 17):")
        for ln in deck_report(cards):
            print("  " + ln)
    return 1 if total_err else 0


def cmd_export(args):
    cards, learning = load_all()
    bad = [c["id"] for c in cards if c["_errors"]]
    os.makedirs(args.out, exist_ok=True)
    deck, scene, owners, apr = [], [], {}, []
    for c in cards:
        if c["_errors"] or c["learning_id"] not in learning or check_learning(c["learning_id"], learning[c["learning_id"]], []):
            continue
        clean = {k: v for k, v in c.items() if not k.startswith("_")}
        if c["type"] == "impeachment":
            scene.append(clean)
        else:
            deck.append(clean)
        if "_owner" in c:
            act, role = c["_owner"]
            owners.setdefault(act, {})[role] = c["id"]
        l = learning[c["learning_id"]]
        b = l["blocks"]
        entry = {"id": c["learning_id"], "lived": _join(b["lived"]), "concept": _join(b["concept"]),
                 "data": _join(b["data"]), "source": {"label": b["source"], "url": l["url"]},
                 "impact": _join(b["impact"]).strip('"“”')}
        apr.append(entry)
    for name, data in (("cards.json", deck), ("impeachment.json", scene), ("learning.json", apr),
                       ("actor_cards.json", owners)):
        with open(os.path.join(args.out, name), "w", encoding="utf-8") as fh:
            fh.write(json.dumps(data, indent=2, ensure_ascii=False) + "\n")
    print("exportadas %d cartas, %d da cena, %d Aprendizados; %d com erro ficaram de fora: %s"
          % (len(deck), len(scene), len(apr), len(bad), ", ".join(bad)))
    return 0


# --- Doc 18 box -------------------------------------------------------------------------------

BOX_INNER = 59   # text width inside "│  " … "│" (doc 18 §18.02)


def _wrap(text, width=BOX_INNER):
    words, lines, cur = text.split(), [], ""
    for w in words:
        if cur and nfc_len(cur) + 1 + nfc_len(w) > width:
            lines.append(cur)
            cur = w
        else:
            cur = (cur + " " + w).strip()
    if cur:
        lines.append(cur)
    return lines


def render_box(a):
    """a: {code, card_id, title, lived, concept, data, source, impact, technique?, url, url_label,
    verified_note?} → the doc 18 block (### header, box, "Fonte verificada" line)."""
    def row(text=""):
        return "│  " + text + " " * max(0, BOX_INNER - nfc_len(text)) + "│"
    out = ["### %s — %s" % (a["code"], a["title"]), "", "```",
           "┌" + "─" * (BOX_INNER + 2) + "┐",
           row("CARTA DE APRENDIZADO — " + a["card_id"]), row(a["title"]),
           "├" + "─" * (BOX_INNER + 2) + "┤", row()]
    for label, key in (("O QUE VOCÊ ACABOU DE VIVENCIAR:", "lived"), ("O CONCEITO POR TRÁS:", "concept"),
                       ("DADOS REAIS:", "data")):
        out.append(row(label))
        out.extend(row(ln) for ln in _wrap(a[key]))
        out.append(row())
    if a.get("technique"):
        out.append(row("TÉCNICA: " + a["technique"]))
        out.append(row())
    out.append(row("FONTE: " + a["source"]))
    out.append(row())
    out.extend(row(ln) for ln in _wrap('"%s"' % a["impact"].strip('"“”')))
    out.append(row())
    out.append("└" + "─" * (BOX_INNER + 2) + "┘")
    out.append("```")
    out.append("")
    note = a.get("verified_note", "P-015")
    out.append("**Fonte verificada (%s):** [%s](%s)" % (note, a["url_label"], a["url"]))
    return "\n".join(out) + "\n"


def cmd_box(args):
    items = json.load(open(args.json, encoding="utf-8"))
    for a in items:
        sys.stdout.write(render_box(a) + "\n")
    return 0


# --- insert: writes a reviewed wave into doc 17 and doc 18 -------------------------------------

SECTION_17 = {"congress": "## 17.02", "budget": "## 17.03", "curriculum_media": "## 17.04",
              "geopolitics": "## 17.05", "prison_police": "## 17.06", "amendments": "## 17.07",
              "caucuses": "## 17.08", "impeachment": "## 17.09", "judiciary": "## 17.10",
              "influencer": "## 17.11", "thematic": "## 17.12", "actor": "## 17.13"}
SECTION_18 = {"congress": "## 18.02", "budget": "## 18.03", "curriculum_media": "## 18.04",
              "geopolitics": "## 18.05", "prison_police": "## 18.06", "amendments": "## 18.07",
              "caucuses": "## 18.08", "impeachment": "## 18.09", "judiciary": "## 18.10",
              "influencer": "## 18.11", "thematic": "## 18.12", "actor": "## 18.13"}
SCENE_DRAFTS = {"APR-143", "APR-144", "APR-145"}   # §18.14 drafts that repeat the scene (doc 18:7)


def _section_of(card_id):
    kind, num = card_id.split("-")[0], int(card_id.split("-")[1])
    if kind == "THEM":
        return "thematic"
    if kind == "ATOR":
        return "actor"
    for mode, (lo, hi) in MODE_RANGES.items():
        if lo <= num <= hi:
            return mode
    raise ValueError("sem modo para %s" % card_id)


def _wave_blocks(path):
    """Card blocks of a wave file: [(id, text)] with the heading and the table only."""
    text = open(path, encoding="utf-8").read()
    out = []
    for m in re.finditer(r"(?m)^### ((?:INST|THEM|ATOR)-\d{3}) — .*$", text):
        lines = text[m.start():].split("\n")
        block = [lines[0], ""]
        started = False
        for ln in lines[1:]:
            if ln.startswith("|"):
                started = True
                block.append(ln)
            elif started:
                break
        out.append((m.group(1), "\n".join(block) + "\n"))
    return out


def _set_status(block, status):
    return re.sub(r"(?m)^\| \*\*Status\*\* \| .* \|$", "| **Status** | %s |" % status, block)


def _insert_sorted(text, heading, item_id, block, item_re):
    """Puts `block` in the section that starts with `heading`, before the first item with a
    larger number of the same kind, or after the last item of the section."""
    start = text.index("\n" + heading) + 1
    nxt = re.search(r"(?m)^## ", text[start + 3:])
    end = start + 3 + nxt.start() if nxt else len(text)
    section = text[start:end]
    kind, num = item_id.split("-")[0], int(item_id.split("-")[1])
    items = [(m.group(1), m.start()) for m in re.finditer(item_re, section)]
    if any(i == item_id for i, _ in items):
        raise ValueError("%s já está no documento" % item_id)
    pos = None
    for iid, at in items:
        if iid.split("-")[0] == kind and iid.split("-")[1].isdigit() and int(iid.split("-")[1]) > num:
            pos = start + at
            break
    if pos is None:
        # After the section's last line of content: before the closing "---" if there is one.
        tail = section.rstrip("\n")
        close = tail.rfind("\n---")
        pos = start + (close + 1 if close >= 0 and tail[close:].strip() == "---" else len(tail) + 1)
        return text[:pos] + "\n" + block + "\n" + text[pos:] if not text[pos - 2:pos] == "\n\n" else text[:pos] + block + "\n" + text[pos:]
    return text[:pos] + block + "\n" + text[pos:]


def _drop_draft(text, code):
    """Removes the §18.14 draft `#### code — …` (up to the next heading or ruler)."""
    m = re.search(r"(?m)^#### %s — .*$" % re.escape(code), text)
    if not m or m.start() < text.find("## 18.14"):
        return text, False
    nxt = re.search(r"(?m)^(#### |### |## |---)", text[m.end():])
    stop = m.end() + nxt.start() if nxt else len(text)
    return text[:m.start()] + text[stop:], True


def _recount(t17, t18):
    cards = parse_doc17_text(t17)
    inst = sum(1 for c in cards if c["id"].startswith("INST-"))
    them = sum(1 for c in cards if c["id"].startswith("THEM-"))
    ator = sum(1 for c in cards if c["id"].startswith("ATOR-"))
    total = inst + them + ator
    t17 = re.sub(r"Status: \d+ de 340 cartas escritas", "Status: %d de 340 cartas escritas" % total, t17)
    t17 = re.sub(r"(?m)^\| \*\*Institucionais\*\* \| \d+ \| 200 \|$", "| **Institucionais** | %d | 200 |" % inst, t17)
    t17 = re.sub(r"(?m)^\| \*\*Temáticas\*\* \| \d+ \| 70 \|$", "| **Temáticas** | %d | 70 |" % them, t17)
    t17 = re.sub(r"(?m)^\| \*\*Atores\*\* \| \d+ \| 70 \|$", "| **Atores** | %d | 70 |" % ator, t17)
    t17 = re.sub(r"(?m)^\| \*\*Total\*\* \| \*\*\d+\*\* \| \*\*340\*\* \|$", "| **Total** | **%d** | **340** |" % total, t17)
    stop = t18.find("## 18.14")
    linked = re.findall(r"(?m)^### (APR-(?:\d{3}|THEM-\d{3}|ATOR-\d{3}))", t18[:stop])
    drafts = re.findall(r"(?m)^#### (APR-\d{3}) — ", t18[stop:])
    useful = [d for d in drafts if d not in SCENE_DRAFTS]
    l_inst = sum(1 for c in linked if re.match(r"APR-\d{3}$", c))
    l_them = sum(1 for c in linked if c.startswith("APR-THEM"))
    l_ator = sum(1 for c in linked if c.startswith("APR-ATOR"))
    l_all = l_inst + l_them + l_ator
    for mode, head in SECTION_18.items():
        a = t18.index("\n" + head) + 1
        b = t18.index("\n## ", a + 3)
        n = len(re.findall(r"(?m)^### APR-(?:\d{3}|THEM-\d{3}|ATOR-\d{3}) — ", t18[a:b]))
        line_end = t18.index("\n", a)
        line = t18[a:line_end]
        new = re.sub(r"\(\d+ de (20|70)\)", "(%d de \\1)" % n, line)
        new = re.sub(r"comuns: \d+ de 20", "comuns: %d de 20" % n, new)
        t18 = t18[:a] + new + t18[line_end:]
    t18 = re.sub(r"\d+ Cartas de Aprendizado ligadas às \d+ cartas do doc 17 \(\d+ dentro das 340",
                 "%d Cartas de Aprendizado ligadas às %d cartas do doc 17 (%d dentro das 340" % (l_all + 5, l_all + 5, l_all), t18)
    t18 = re.sub(r"e \d+ rascunhos úteis aguardando carta", "e %d rascunhos úteis aguardando carta" % len(useful), t18)
    t18 = re.sub(r"(?m)^\| \*\*Institucionais\*\* \| \d+ \| \d+ \| 200 \|$", "| **Institucionais** | %d | %d | 200 |" % (l_inst, len(useful)), t18)
    t18 = re.sub(r"(?m)^\| \*\*Temáticas\*\* \| \d+ \| \d+ \| 70 \|$", "| **Temáticas** | %d | 0 | 70 |" % l_them, t18)
    t18 = re.sub(r"(?m)^\| \*\*Atores\*\* \| \d+ \| \d+ \| 70 \|$", "| **Atores** | %d | 0 | 70 |" % l_ator, t18)
    t18 = re.sub(r"(?m)^\| \*\*Total\*\* \| \*\*\d+\*\* \| \*\*\d+\*\* \| \*\*340\*\* \|$",
                 "| **Total** | **%d** | **%d** | **340** |" % (l_all, len(useful)), t18)
    return t17, t18, total


def parse_doc17_text(text):
    tmp = os.path.join(os.path.dirname(DOC17), ".doc17_tmp.md")
    try:
        open(tmp, "w", encoding="utf-8").write(text)
        return parse_doc17(tmp)
    finally:
        os.remove(tmp)


def cmd_insert(args):
    t17 = open(args.doc17, encoding="utf-8").read()
    t18 = open(args.doc18, encoding="utf-8").read()
    learning = {a["code"]: a for a in json.load(open(args.learning, encoding="utf-8"))}
    note = "P-015"
    dropped = []
    for cid, block in _wave_blocks(args.cards):
        sec = _section_of(cid)
        t17 = _insert_sorted(t17, SECTION_17[sec], cid, _set_status(block, args.status),
                             r"(?m)^### ((?:INST|THEM|ATOR)-\d{3}|IMP-[1-5]) — ")
        code = "APR-" + cid.split("-", 1)[1] if cid.startswith("INST-") else "APR-" + cid
        a = learning.get(code)
        if a is None:
            print("aviso: %s sem Aprendizado no JSON" % code)
            continue
        a = dict(a, verified_note=note)
        box = render_box(a)
        if a.get("strength") in ("imprensa", "fraca"):
            box = box.rstrip("\n") + " — fonte %s\n" % ("de imprensa" if a["strength"] == "imprensa" else "fraca")
        box += "\n**Status:** %s\n" % args.status
        t18 = _insert_sorted(t18, SECTION_18[sec], code, box, r"(?m)^### (APR-(?:\d{3}|THEM-\d{3}|ATOR-\d{3}|IMP-[1-5])) — ")
        t18, gone = _drop_draft(t18, code)
        if gone:
            dropped.append(code)
    t17, t18, total = _recount(t17, t18)
    if args.dry_run:
        sys.stdout.write("cartas escritas depois da onda: %d; rascunhos retirados da §18.14: %s\n" % (total, ", ".join(dropped) or "nenhum"))
        return 0
    open(args.doc17, "w", encoding="utf-8").write(t17)
    open(args.doc18, "w", encoding="utf-8").write(t18)
    print("doc 17 e doc 18 gravados: %d cartas escritas; rascunhos retirados: %s" % (total, ", ".join(dropped) or "nenhum"))
    return 0


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = p.add_subparsers(dest="cmd", required=True)
    c = sub.add_parser("check")
    c.add_argument("--ids", default="")
    c.add_argument("--wave-report", action="store_true")
    c.add_argument("-v", "--verbose", action="store_true")
    c.add_argument("--doc17", default=DOC17, help="arquivo com cartas no formato do doc 17 (ex.: rascunho de uma onda)")
    c.add_argument("--doc18", default=DOC18)
    c.add_argument("--no-learning", action="store_true", help="não confere o Aprendizado (rascunho de cartas)")
    e = sub.add_parser("export")
    e.add_argument("--out", required=True)
    b = sub.add_parser("box", help="renders doc 18 boxes from a JSON list (see render_box)")
    b.add_argument("--json", required=True)
    i = sub.add_parser("insert", help="grava uma onda revisada no doc 17 e no doc 18, em ordem, e refaz as contagens")
    i.add_argument("--cards", required=True, help="arquivo da onda com as cartas no formato do doc 17")
    i.add_argument("--learning", required=True, help="JSON dos Aprendizados (formato do box)")
    i.add_argument("--status", required=True, help='ex.: "provisório (DP-020)"')
    i.add_argument("--doc17", default=DOC17)
    i.add_argument("--doc18", default=DOC18)
    i.add_argument("--dry-run", action="store_true")
    args = p.parse_args()
    handler = {"check": cmd_check, "export": cmd_export, "box": cmd_box, "insert": cmd_insert}[args.cmd]
    sys.exit(handler(args))


if __name__ == "__main__":
    main()
