---
paths:
  - "gdd/sistemas/**"
---

# Regra de Documento de Design (GDD de sistema)

Adaptada do Claude Code Game Studios (MIT, D-093).

## As 8 seções obrigatórias

| # | Seção | Exigência |
| :--- | :--- | :--- |
| 1 | Visão geral | O que o sistema faz, em 3-5 linhas |
| 2 | Fantasia do jogador | O que o jogador sente e aprende com o sistema |
| 3 | Regras detalhadas | Regras completas, sem "deve parecer bom" |
| 4 | Fórmulas | Variáveis definidas, faixa esperada e um exemplo calculado |
| 5 | Casos-limite | Dizer o que acontece em cada caso, não "tratar adequadamente" |
| 6 | Dependências | Sempre nos dois sentidos: se A depende de B, o GDD de B cita A |
| 7 | Parâmetros de ajuste | Faixa segura e o que cada parâmetro afeta |
| 8 | Critérios de aceite | Testáveis: QA consegue dizer passou/falhou |

## Como escrever

- Esqueleto primeiro (as 8 seções com `[a definir]`), depois uma seção por vez.
- Cada seção só é gravada depois da aprovação do PO; decisões em aberto viram pergunta com 2-4 alternativas.
- Número de balanceamento aponta a fórmula ou o motivo de onde veio.
- Dado real só com fonte verificada (D-091).
- Toda afirmação sobre outro doc cita `arquivo:linha` (regra `citacoes.md`).
