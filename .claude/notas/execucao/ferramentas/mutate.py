"""Mutation run (P-014 etapa 6, V-009): change one number of jogo/data/endings.json or
balance.json by one unit, run the fast tests, count the mutations some test kills.
Usage: python3 mutate.py <project_copy> <godot> <xdg> [tests...] [--file endings|balance]"""
import json, os, subprocess, sys, copy

proj, godot, xdg = sys.argv[1:4]
args = sys.argv[4:]
only = None
extra = []
if "--behavior-only" in args:
    args.remove("--behavior-only"); extra = ["--", "--behavior-only"]
if "--file" in args:
    i = args.index("--file"); only = args[i + 1]; del args[i:i + 2]
tests = args or ["test_core_endings", "test_core_meters", "test_core_state", "test_data", "test_core_axis",
                 "test_core_actors_events", "test_core_cards_draw", "test_core_impeachment", "test_core_save"]
env = dict(os.environ, XDG_DATA_HOME=xdg)

def leaves(node, path=()):
    if isinstance(node, dict):
        for k, v in node.items():
            yield from leaves(v, path + (k,))
    elif isinstance(node, list):
        for i, v in enumerate(node):
            yield from leaves(v, path + (i,))
    elif isinstance(node, bool):
        return
    elif isinstance(node, (int, float)):
        yield path, node

def set_at(node, path, value):
    for p in path[:-1]:
        node = node[p]
    node[path[-1]] = value

def run_tests():
    for t in tests:
        r = subprocess.run([godot, "--headless", "--path", proj, "-s", "res://tests/%s.gd" % t] + extra,
                           env=env, capture_output=True, text=True, timeout=300)
        if r.returncode != 0 or "SCRIPT ERROR" in r.stdout + r.stderr:
            return t
    return None

report = []
for name in ("endings", "balance"):
    if only and only != name:
        continue
    path = os.path.join(proj, "data", name + ".json")
    original = open(path, encoding="utf-8").read()
    data = json.loads(original)
    for lp, v in list(leaves(data)):
        steps = [0.25, -0.25] if isinstance(v, float) else [1, -1]
        for d in steps:
            nv = v + d
            if nv < 0:
                continue
            m = copy.deepcopy(data)
            set_at(m, lp, nv)
            open(path, "w", encoding="utf-8").write(json.dumps(m, ensure_ascii=False, indent=2))
            killer = run_tests()
            report.append((name, "/".join(map(str, lp)), v, nv, killer))
            print("%-8s %-45s %6s→%-6s %s" % (name, "/".join(map(str, lp)), v, nv, killer or "SURVIVED"), flush=True)
    open(path, "w", encoding="utf-8").write(original)

for name in ("endings", "balance"):
    rows = [r for r in report if r[0] == name]
    if rows:
        k = sum(1 for r in rows if r[4])
        print("%s: %d/%d killed (%.0f%%)" % (name, k, len(rows), 100.0 * k / len(rows)))
