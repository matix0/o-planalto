---
description: Sincroniza toda a documentação (00-13)
allowed-tools: Read, Grep, Glob, Write, Edit
---

# /sync-docs — Sincronização Completa

## Passo a Passo

1. Ler todos os arquivos `docs/00` a `docs/13` e `gestao/decisoes.md`.
2. Identificar discrepâncias (com `arquivo:linha` dos dois lados).
3. Apresentar as discrepâncias ao PO antes de editar.
4. Atualizar os arquivos afetados.
5. Gerar relatório.
6. Commit.

Trabalho grande: usar subagentes em ondas (máximo 3 em paralelo, `.claude/rules/subagentes.md`).
