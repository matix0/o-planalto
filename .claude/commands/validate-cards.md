---
description: Valida as 340 cartas (estrutura, efeitos, consistência)
allowed-tools: Read, Grep, Glob
---

# /validate-cards — Validação de Cartas

## Fonte

- Dados: `dados/cartas.json` (P-005) ou, antes disso, `docs/17_ROTEIRO_DAS_CARTAS.md` e `docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md`.
- Se nenhuma fonte existir, reportar isso ao PO e parar.
- Regras de referência: critérios de aceite (§8) dos GDDs `gdd/sistemas/05_cartas.md`, `07_atores.md`, `08_eventos.md`, `09_desinformacao.md` e `04_eixo.md` §7. Em divergência, os GDDs mandam.

## Validações (reprovam)

1. **Estrutura e IDs:** campos da carta (GDD 05 §3.2); `id` único; `tipo` entre Institucional, Temática, Ator, Impeachment.
2. **Opção:** cor entre as 7 e diferente nas duas opções; eixo −2..+2; 2-4 efeitos, múltiplos de 5, ±5..±30, ≥ 1 negativo (exceto uma opção de carta de oferta — Boa Vontade) (D-098, D-103, D-108).
3. **Atores:** 0-3 por opção, `ACT-xxx` existente, ±1; carta de ator cita o ator nas duas opções (D-106).
4. **Eventos:** 0 ou 1 por opção; `atraso` 1-2; 1-3 efeitos, ±5..±20; nenhum em carta de impeachment (D-111, D-125).
5. **Modo Influenciador:** `tecnica` obrigatório; `reacao` distinta nas duas opções; opção `aceitar` perde `Integridade` ou `Consciência`; campos ausentes fora do modo (D-119, D-120).
6. **Aprendizado:** `APR-xxx` existe no doc 18 com fonte verificada; sem isso a carta fica fora do baralho (D-090, D-091, D-102).
7. **Tom:** alinhado com `docs/10_GUIA_DE_ESTILO_E_TOM.md`; sem rótulo "esquerda/direita" (D-084).

## Avisos (não reprovam)

- **Custo por cor:** cada cor com ≥ 1 medidor de saldo negativo no baralho (D-100); demais saldos só em relatório.
- **Cobertura do eixo:** cada eixo com valor ≠ 0 em ≥ 15% das opções (`gdd/sistemas/04_eixo.md` §7, D-126).
- **Eventos:** 15%-25% das opções com evento (D-125).
- **Técnicas:** cada técnica em ≥ 2 cartas do modo Influenciador (D-119).

## Relatório

Gerar relatório de erros e avisos, com o ID da carta e `arquivo:linha`.
