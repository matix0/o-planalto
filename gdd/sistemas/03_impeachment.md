# 03 — Impeachment

**Sistema:** 03 (`gdd/sistemas/00_INDICE.md`) · **Inclui:** gatilhos, cena de 5 fases, placares
**Status:** ✅ Aprovado pelo PO (2026-10-15) · **Pendências resolvidas:** P-1 (com D-095)

---

## 1. Visão geral

Cena especial de 5 cartas em que o Congresso tenta derrubar o Presidente, **uma vez por partida**. Cada fase oferece uma opção ligada ao povo (A) e uma ligada ao Congresso (B); cada opção tem um teste de medidor. As fases vencidas viram "apoio", e o Desfecho decide entre **absolvição** e **condenação** (final "Impeachment", `gdd/sistemas/02_finais.md`).

## 2. Fantasia do jogador

O jogador sente o cerco: o processo é político, não jurídico. Sobreviver exige combinar rua e plenário — escolher só um lado leva à derrota. Perder a base no Congresso tem preço.

## 3. Regras detalhadas

### 3.1. Gatilhos

| Gatilho | Condição | Desde |
| :--- | :--- | :--- |
| Principal | `Legitimidade` < 20 E `Capital Político` < 20 | Ano 2 |
| Crise | `Integridade` < 20 E `Consciência` < 20 | Ano 2 |
| Alternativo | 3 opções seguidas com efeito negativo em `Capital Político` | Ano 2 |
| Capital em 0 | `Capital Político` = 0 (D-095) | Ano 1 |

Os gatilhos de medidor são checados no passo 6 do fechamento do turno (`gdd/sistemas/01_medidores.md` §3.4); `Capital Político` = 0 e o alternativo, logo após a carta ou o evento (`gdd/sistemas/08_eventos.md` §5).

### 3.2. A cena

1. Começa logo após o gatilho; são 5 cartas **extras** (não contam nas 7 do turno, D-113).
2. Se começa com `Consciência` < 15 E `Integridade` < 15 → **condenação automática**.
3. Fases 1-4: o teste da opção escolhida usa o valor **antes** do efeito da carta; teste vencido = +1 apoio. Efeitos **sem** multiplicador do ano (×1).
4. Desfecho (fase 5): **absolvição** se apoio ≥ 2 (≥ 3 quando a cena abriu por `Capital Político` = 0) **e** o teste da opção escolhida passar; senão, **condenação**.
5. Absolvição: `Capital Político` = máx(atual; 20); `Legitimidade` +10.
6. Depois da cena, não há outro impeachment na partida; `Capital Político` em 0 de novo → final "Impeachment" direto.
7. Durante a cena, `Capital Político` em 0 não dispara nada; outro medidor em 0 → Catástrofe (`02_finais.md` §3.2).

### 3.3. Placares (doc 14 §14.08)

Derivados do resultado, não calculados: Comissão aprova o parecer se a fase 2 foi perdida; Câmara atinge 342 de 513 se a fase 3 foi perdida; Senado atinge 54 de 81 na condenação. Na vitória, os números ficam abaixo do mínimo.

## 4. Fórmulas

### 4.1. Testes e efeitos (proposta do ECO, aprovada pelo PO)

| Fase | A (povo): teste → efeitos | B (Congresso): teste → efeitos |
| :--- | :--- | :--- |
| 1 Pedido | `Consciência` > 45 → Consciência +10, Legitimidade +5, Segurança −5 | `Caixa` > 45 → Capital Político +10, Caixa −10 |
| 2 Comissão | `Integridade` > 45 → Integridade +5, Consciência +5, Segurança −5 | `Capital Político` > 25 → Capital Político +10, Caixa −10, Integridade −5 |
| 3 Votação | `Consciência` > 55 → Legitimidade +10, Soberania −5, Segurança −5 | `Capital Político` > 35 → Capital Político +5, Soberania −10, Segurança −5 |
| 4 Julgamento | `Dignidade` > 50 → Consciência +10, Caixa −5 | `Capital Político` > 40 → Capital Político +5, Legitimidade +5, Dignidade −10 |
| 5 Desfecho | `Legitimidade` > 45 → Legitimidade +10, Caixa −5 | `Integridade` > 51 → Integridade +5, Soberania −5 |

`apoio = Σ testes vencidos nas fases 1-4` · `absolvição = apoio ≥ mín E teste(Desfecho)` · `mín = 3 se gatilho = Capital em 0, senão 2`.

### 4.2. Taxas simuladas (ECO, 20 mil partidas por linha, ×1)

| Gatilho | Absolvição |
| :--- | :--- |
| Principal | 37% |
| Crise | 53% (25% condenação automática) |
| Alternativo | 82% |
| Capital em 0 | 47% jogador atento / 5% aleatório, com apoio ≥ 3 (ECO, P-013) |

Diferença entre gatilhos aceita como intencional pelo PO. Sempre A ou sempre B ≈ 0%; melhor roteiro fixo (AAAAB) 35%.

## 5. Casos-limite

| Caso | O que acontece |
| :--- | :--- |
| Gatilho no fim do Ano 4 | A cena acontece antes dos finais (`02_finais.md` §3.3) |
| Dois gatilhos ao mesmo tempo | Uma cena; se um deles é Capital em 0, vale apoio ≥ 3 |
| Medidor (exceto Capital) em 0 na cena | Catástrofe; a cena é interrompida |
| Caixa muito baixo na entrada | Pode chegar perto de 0 (< 0,1% das simulações) |
| Gatilho depois da cena já ter ocorrido | Ignorado; só Capital em 0 vale (final direto) |

## 6. Dependências

01 Medidores (passo 6 do fechamento; valores) · 02 Finais (condenação; cena antes dos finais no Ano 4) · 04 Eixo (as cartas da cena pontuam os eixos) · 05 Cartas (as 5 cartas da cena) · 06 Sorteio (cartas da cena fora das 7) · 08 Eventos (cartas da cena sem eventos; a cena interrompe o disparo) · 10 Estado da partida. Cada um deve citar o 03 de volta.

## 7. Parâmetros de ajuste

| Parâmetro | Atual | Faixa | O que afeta |
| :--- | :--- | :--- | :--- |
| Limites dos testes | §4.1 | ±5 | Taxa de absolvição |
| Apoio mínimo | 2 (3 com Capital em 0) | 2-3 | Dificuldade |
| Capital mínimo na absolvição | 20 | 15-25 | Fôlego após a cena |
| Condenação automática | < 15 e < 15 | 10-20 | Peso da desinformação |

## 8. Critérios de aceite

1. Legitimidade 18 e Capital Político 15 no Ano 2 → a cena abre.
2. Integridade 12 e Consciência 12 na entrada → condenação automática.
3. Apoio 1 → condenação, qualquer que seja o Desfecho.
4. Absolvição com Capital Político 40 → continua 40.
5. Segunda vez com Capital Político em 0 → final "Impeachment" direto.
6. Cena por Capital em 0, apoio 2 e Desfecho passando → condenação.
7. Efeito de carta da cena no Ano 4 → sem multiplicador (×1).
