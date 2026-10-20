#!/usr/bin/env bash
# Runs every headless test (D-134). Usage, from the repository root:
#   GODOT=/path/to/godot jogo/tests/run_all.sh [project_dir]
# Policy (.claude/rules/isolamento.md): run it on a copy of jogo/ in the scratchpad.
set -u
G="${GODOT:-godot}"
P="${1:-$(cd "$(dirname "$0")/.." && pwd)}"
"$G" --headless --path "$P" --import >/dev/null 2>&1 || true
fail=0
for t in "$P"/tests/test_*.gd; do
	name=$(basename "$t")
	out=$("$G" --headless --path "$P" -s "res://tests/$name" 2>&1)
	code=$?
	if [ $code -eq 0 ] && ! grep -q "SCRIPT ERROR" <<<"$out"; then
		echo "OK   $name"
	else
		echo "FAIL $name (exit $code)"
		grep -E "FAIL|ERROR|error" <<<"$out" | head -20
		fail=1
	fi
done
exit $fail
