#!/bin/sh
# Hook PreToolUse (Bash) do Claude Code — D-189. Antes de um comando com "git ... commit",
# roda a mesma checagem do hook do git (.githooks/pre-commit --worktree). Saída 2 barra o
# comando e devolve a mensagem ao agente; vale mesmo sem "git config core.hooksPath".
input=$(cat)
case "$input" in
	*git*commit*) ;;
	*) exit 0 ;;
esac
root=$(cd "$(dirname "$0")/../.." && pwd) || exit 0
[ -f "$root/.githooks/pre-commit" ] || exit 0
cd "$root" || exit 0
if ! sh .githooks/pre-commit --worktree; then
	exit 2
fi
exit 0
