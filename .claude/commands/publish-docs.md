---
description: Publica a documentação no GitHub Pages
allowed-tools: Read, Bash(git status:*), Bash(git log:*), Bash(git remote:*), Bash(git push:*), Bash(gh run:*)
---

# /publish-docs — Publicação no GitHub Pages

O site é gerado de `docs/` pelo projeto em `site/` (Astro Starlight) e publicado pelo workflow `.github/workflows/site.yml` (D-077): todo push no `main` que altera `docs/` ou `site/` dispara build e deploy.

## Passo a Passo

1. Build local para conferir: `cd site && npm run build` (Node ≥ 22.12).
2. Verificar se a árvore está limpa (`git status`) e se há remote (`git remote -v`). Sem remote → reportar ao PO e parar.
3. **Confirmar com o PO** antes do push.
4. `git push origin main`.
5. Acompanhar o deploy: `gh run list --workflow site.yml` e `gh run watch`.

## Configuração única (no GitHub, feita pelo PO)

Settings → Pages → Source: *GitHub Actions*.
