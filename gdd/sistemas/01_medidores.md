# 01 — Medidores

**Sistema:** 01 (`gdd/sistemas/00_INDICE.md`) · **Inclui:** 8 medidores, relações, turnos e fases, calibração inicial
**Status:** ✅ Aprovado pelo PO (2026-10-14) · **Pendências:** P-6, P-8, P-11

---

## 1. Visão geral

Os medidores são o estado do país. São **8 medidores principais**, de 0 a 100 — 5 sociais (Dignidade, Consciência, Soberania, Segurança, Integridade) e 3 de poder (Caixa, Capital Político, Legitimidade). Não há sub-medidores (D-094). Cada opção de carta muda de 2 a 4 medidores, ajustada pelo multiplicador do ano; no fim de cada turno, as relações entre medidores são aplicadas. Os valores iniciais vêm da tabela base mais a calibração inicial. Medidor em 0 encerra a partida na hora (D-089), exceto `Capital Político`, que abre o impeachment (D-095).

## 2. Fantasia do jogador

O jogador sente o país como um sistema frágil e interligado: não dá para encher tudo, e cuidar de um medidor custa outro. Aprende que toda política tem custo (pilar 4) e que algumas consequências chegam com atraso, porque as relações agem turno a turno. Como os ícones não mostram números, ele lê tendências, não faz contas (doc 14 §14.03).

## 3. Regras detalhadas

### 3.1. Medidores

8 medidores inteiros de 0 a 100 (tabela, final em 0 e final em 100: `gdd/GDD.md` §6.1.1). **Não há sub-medidores** (D-094): Desemprego, Inflação e Juros saíram; temas econômicos ficam nos efeitos das cartas e nas Cartas de Aprendizado.

### 3.2. Valores iniciais

Tabela base (`gdd/GDD.md` §13.1): Dignidade 45 · Consciência 40 · Soberania 40 · Segurança 50 · Integridade 40 · Caixa 55 · Capital Político 50 · Legitimidade 55. Somam-se as 6 respostas da calibração (±5 cada; `docs/15_FLUXO_DO_JOGO.md` §15.04); resultado limitado a 0-100.

### 3.3. Efeito de uma carta (na hora, nesta ordem)

1. Efeito base da opção × multiplicador do ano (×0,25 / ×0,75 / ×1,0 / ×1,5), para ganhos e perdas.
2. Se `Integridade` < 30, a perda de `Consciência` é dobrada.
3. Arredonda para o inteiro mais próximo; no empate (,5), afasta do zero. Se o efeito base não é zero, o resultado é no mínimo ±1.
4. Limita a 0-100.
5. Medidor em 0 → final catastrófico na hora (D-089).

### 3.4. Fechamento do turno (nesta ordem)

1. "Foto" dos 8 valores.
2. Com a foto, calcula: as 8 relações (`gdd/GDD.md` §6.1.3); os 2 limiares (`Integridade` < 20 → −1 em cada um dos outros 7; `Legitimidade` > 90 → `Consciência` −10); o bônus por equilíbrio (todos > 45 → +3 em todos).
3. Soma tudo de uma vez, **sem** multiplicador do ano; limita a 0-100.
4. Medidor em 0 → final catastrófico.
5. Medidor ≤ 10 → a próxima carta é de emergência para ele, 1× por medidor por partida (escolha da carta: GDD 06 Sorteio).
6. Checa o gatilho de impeachment (GDD 03).

**Fim do Ano 4:** depois da última carta não há os passos 1-5; só o passo 6 (gatilho de impeachment), seguido dos finais (`gdd/sistemas/02_finais.md` §3.3).

### 3.5. Repetição

Toda relação e todo limiar valem a cada fim de turno enquanto a condição durar.

### 3.6. Fora deste sistema

Carta de recuperação → GDD 06 Sorteio. Evento de boa vontade → GDD 07 Atores. Os medidores só recebem o efeito.

## 4. Fórmulas

### 4.1. Efeito da carta em um medidor

`Δ = arred(E × M × D)` · `novo = limite(atual + Δ; 0; 100)`

| Variável | Significado | Faixa |
| :--- | :--- | :--- |
| `E` | Efeito base da opção (doc 17) | −30 a +30 nas cartas atuais |
| `M` | Multiplicador do ano | 0,25 / 0,75 / 1,0 / 1,5 |
| `D` | 2 se o medidor é `Consciência`, `E` < 0 e `Integridade` **antes da carta** < 30; senão 1 | 1 ou 2 |
| `arred` | Inteiro mais próximo; no ,5, afasta do zero; se `E` ≠ 0, |Δ| ≥ 1 | — |

**Exemplo** (Ano 1, INST-001, Opção B, valores iniciais sem calibração):

| Medidor | E | × 0,25 | Δ | Antes → depois |
| :--- | :--- | :--- | :--- | :--- |
| Capital Político | +10 | +2,5 | +3 | 50 → 53 |
| Soberania | −15 | −3,75 | −4 | 40 → 36 |
| Caixa | +10 | +2,5 | +3 | 55 → 58 |
| Integridade | −5 | −1,25 | −1 | 40 → 39 |

### 4.2. Fechamento do turno

`novo_m = limite(foto_m + Σ relações(foto) + Σ limiares(foto) + bônus(foto); 0; 100)`

- `bônus(foto)` = +3 em cada medidor se todos os 8 > 45; senão 0.

**Exemplo:** foto com Dignidade 28 e os demais entre 35 e 58 → Dignidade < 30 dá `Consciência` −5 (35 → 30); sem bônus (Dignidade ≤ 45); nenhum medidor em 0 ou ≤ 10.

## 5. Casos-limite

| Caso | O que acontece |
| :--- | :--- |
| Dois ou mais medidores chegam a 0 na mesma carta | Final catastrófico na hora; qual final: GDD 02 Finais (P-3) |
| Medidor em 0 e gatilho de impeachment no mesmo fechamento | O 0 vence (ordem de §3.4) |
| Medidor passaria de 100 | Fica em 100; final por medidor em 100: pendente no GDD 02 |
| Calibração levar a uma espiral sem cartas | Não acontece: nas 64 combinações, sem cartas, o menor valor após 4 fechamentos é 30 (simulação do ECO e conferência, 2026-10-14). Pior início: Consciência 40 − 10 = 30; Dignidade 45 − 10 = 35 |
| Vários medidores ≤ 10 no mesmo fechamento | Emergência primeiro para o de menor valor; empate pela ordem da tabela §6.1.1; os outros nas cartas seguintes, um por vez |
| Medidor volta a ≤ 10 depois de usar a emergência | Sem segunda emergência; fica em risco |
| Efeito pequeno some no arredondamento (ex.: ±1 × 0,25) | Não some: se o efeito base ≠ 0, o resultado é no mínimo ±1 |
| Relação e bônus no mesmo medidor | Somam (§4.2) |

## 6. Dependências

| Sistema | Relação com 01 |
| :--- | :--- |
| 02 Finais | Usa o medidor em 0 e os valores finais |
| 03 Impeachment | Gatilhos leem os medidores; o fechamento do turno chama o gatilho |
| 04 Eixo | Revelação final |
| 05 Cartas | Fornece os efeitos de cada opção |
| 06 Sorteio | Recebe o pedido de carta de emergência; medidor < 30 puxa cartas ligadas |
| 07 Atores | Evento de boa vontade aplica efeito nos medidores |
| 08 Eventos | Aplica efeitos nos medidores |
| 10 Estado da partida | Executa o efeito da carta e o fechamento do turno |

Cada um desses GDDs deve citar o 01 de volta.

## 7. Parâmetros de ajuste

Faixas seguras revisadas pelo ECO (2026-10-14).

| Parâmetro | Atual | Faixa segura | O que afeta |
| :--- | :--- | :--- | :--- |
| Valores iniciais | 40-55 | 35-60; Consciência e Dignidade ≥ 35 | Distância até o 0 no começo |
| Peso de cada resposta da calibração | ±5 | ±5 a ±10 | Personalização do início |
| Multiplicadores por ano | 0,25 / 0,75 / 1,0 / 1,5 | 0,25-0,5 / 0,5-1 / 1 / 1,25-1,5 | Curva de dificuldade |
| Limites das relações | 30 / 60 / 70 | ±5 | Frequência das relações |
| Valores das relações | −3 a +10 | perdas até ±25% | Velocidade das cascatas |
| Bônus por equilíbrio | +3 com todos > 45 | +3 a +5; limite 40-45 | Recompensa do equilíbrio (risco de estratégia dominante) |
| Limite da emergência | ≤ 10 | 10-15 (a maior perda por relação é −10) | Rede de segurança |
| Dobro da Consciência | ×2 com Integridade < 30 | ×1,5 a ×2 | Peso da desinformação |

## 8. Critérios de aceite

1. Ano 1, efeito −15 → medidor cai 4; Ano 4, efeito −15 → cai 23 (−22,5 afastado do zero).
2. Ano 1, efeito −1 → cai 1, nunca 0.
3. Nenhum medidor sai de 0-100 após uma carta ou um fechamento.
4. Medidor em 0 após uma carta → a tela final abre antes da consequência.
5. Integridade 29 antes da carta, efeito −10 em Consciência no Ano 3 → cai 20.
6. Fechamento com Dignidade 28 → Consciência −5, independente da ordem das relações.
7. Todos os medidores > 45 no fechamento → todos +3.
8. Medidor em 9 no fechamento → próxima carta de emergência para ele; de novo em 9 depois → sem emergência.
10. Após a última carta do Ano 4 não há relações nem bônus; só o gatilho de impeachment.
9. As 64 combinações da calibração, sem cartas, não zeram nenhum medidor em 4 fechamentos.
