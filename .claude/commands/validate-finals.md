---
description: Valida os 26 finais (estrutura, condições, consistência)
allowed-tools: Read, Grep, Glob
---

# /validate-finals — Validação de Finais

## Fonte

- Dados: `dados/finais.json` (P-005) ou, antes disso, a lista de finais em `docs/04_DESIGN_DO_JOGO.md`.
- Se nenhuma fonte existir, reportar isso ao PO e parar.
- Regras de referência: `docs/13_ARQUITETURA_TECNICA.md` §13.3.6. Em divergência com esta lista, reportar.

## Validações

1. **Contagem:** Existem exatamente 26 finais.
2. **Estrutura:** Cada final tem id, nome, categoria, condição, descrição, citação, autor, cor, ícone.
3. **IDs únicos:** Cada final tem um ID único.
4. **Categorias:** Só categorias previstas no §13.3.6.
5. **Condições:** Cada condição referencia medidores existentes; nenhum par de finais com condição idêntica.
6. **Citações:** Toda citação tem autor e fonte verificável (ou `[não verificado]`).
7. **Consistência:** Tom alinhado com `docs/10_GUIA_DE_ESTILO_E_TOM.md`.

## Relatório

Gerar relatório de erros e avisos, com o ID do final e `arquivo:linha`.
