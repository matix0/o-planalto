---
description: Publica a documentação no GitHub Pages
allowed-tools: Read, Bash(git status:*), Bash(git log:*), Bash(git remote:*), Bash(git push:*)
---

# /publish-docs — Publicação no GitHub Pages

Publicação via **Deploy from a branch** (`main`, pasta `/docs`), sem workflow próprio.

## Passo a Passo

1. Verificar se `docs/_config.yml` existe.
2. Verificar se há remote (`git remote -v`). Sem remote → reportar ao PO e parar.
3. Verificar se a árvore está limpa (`git status`).
4. **Confirmar com o PO** antes do push.
5. `git push origin main`.
6. Verificar o deploy em Actions → `pages-build-deployment`.

## Configuração única (no GitHub, feita pelo PO)

Settings → Pages → Source: *Deploy from a branch* → `main` / `/docs`.
