---
description: Valida as 342 cartas (estrutura, efeitos, consistência)
allowed-tools: Read, Grep, Glob
---

# /validate-cards — Validação de Cartas

## Fonte

- Dados: `dados/cartas.json` (P-005) ou, antes disso, `docs/17_ROTEIRO_DAS_CARTAS.md`.
- Se nenhuma fonte existir, reportar isso ao PO e parar.
- Regras de referência: `docs/04_DESIGN_DO_JOGO.md` e `docs/13_ARQUITETURA_TECNICA.md` §13.3.1–13.3.2. Em divergência com esta lista, reportar.

## Validações

1. **Estrutura:** Cada carta tem título, problema, opções, efeitos, consequência, Carta de Aprendizado.
2. **IDs únicos:** Cada carta tem um ID único.
3. **Efeitos:** Cada opção afeta 2-4 medidores.
4. **Cores:** Cada carta tem uma cor partidária.
5. **Consistência:** Verificar se o tom está alinhado com `docs/10_GUIA_DE_ESTILO_E_TOM.md`.

## Relatório

Gerar relatório de erros e avisos, com o ID da carta e `arquivo:linha`.
