---
description: Revisão cruzada dos GDDs de sistema e do GDD mestre (só relatório)
allowed-tools: Read, Grep, Glob
---

# /revisar-gdds — Revisão Cruzada

Adaptado do Claude Code Game Studios (MIT, D-093). Não altera arquivos.

## Fontes

`gdd/GDD.md`, `gdd/sistemas/*.md`, `docs/17_ROTEIRO_DAS_CARTAS.md`.

## Checagens

| # | Checagem |
| :--- | :--- |
| 1 | Contradições entre GDDs (mesma regra com valores diferentes) |
| 2 | Referências obsoletas (sistema, medidor ou decisão que mudou) |
| 3 | Dependências de um lado só |
| 4 | Seções obrigatórias faltando ou com `[a definir]` (`.claude/rules/design-docs.md`) |
| 5 | Regras numéricas sem fórmula ou sem exemplo |
| 6 | Estratégia dominante (uma escolha sempre melhor) |
| 7 | Saldo por cor partidária desequilibrado (D-092) |
| 8 | Desvio dos pilares (GDD §2) |
| 9 | Pendências do GDD §16.4 ainda abertas |

## Relatório

- Veredito: **OK** (sem bloqueios) · **ATENÇÃO** (problemas não bloqueantes) · **BLOQUEIA** (inconsistência que impede o protótipo).
- Cada achado com `arquivo:linha`, o trecho e se bloqueia ou é recomendação.
