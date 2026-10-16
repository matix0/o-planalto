# 06 — Sorteio

**Sistema:** 06 (`gdd/sistemas/00_INDICE.md`) · **Inclui:** prioridade narrativa, cartas obrigatórias
**Status:** ✅ Aprovado pelo PO (2026-10-16) · **Pendências resolvidas:** P-4

---

## 1. Visão geral

O sorteio escolhe as 7 cartas de cada turno (28 por partida), sem repetir nenhuma. Parte das cartas elegíveis: Aprendizado aprovado (D-102), ainda não jogadas, `ano_minimo` já alcançado e, nas cartas de ator, função igual ao nível atual do ator (GDD 07). Até 3 vagas por turno são obrigatórias, nesta prioridade: emergência de medidor ≤ 10, ataque de ator Furioso, carta ligada a medidor < 30. As demais são sorteadas com peso igual, no máximo 1 por modo. Eventos encadeados não são cartas e disparam antes do sorteio (GDD 08).

## 2. Fantasia do jogador

O jogador sente que o país reage a ele: quando um medidor afunda, chegam problemas daquela área; quando um grupo se enfurece, ele bate à porta. Ao mesmo tempo, cada turno traz assuntos variados e nenhum dilema se repete — o mandato parece uma sequência de crises reais, não um baralho em círculo. Aprende que a agenda de um governo é imposta pela realidade e pelos grupos de pressão, não só escolhida (pilares 1 e 3), e que até a crise traz chance de reparo: a carta ligada ao medidor em risco oferece uma saída, com custo (D-097).

## 3. Regras detalhadas

### 3.1. Elegibilidade

Carta elegível cumpre tudo:

1. Aprendizado aprovado (D-102).
2. Ainda não saiu nesta partida.
3. `ano_minimo` ≤ ano atual (único pré-requisito; 1-4, padrão 1).
4. Carta de ator: função igual ao nível atual do ator (`gdd/sistemas/07_atores.md` §3.2).
5. Não é do tipo `Impeachment` (só sai na cena, GDD 03).

### 3.2. Carta ligada

Carta ligada ao medidor M: alguma opção tem efeito positivo em M. A "carta de recuperação" (`gdd/GDD.md:457`) é uma carta ligada.

### 3.3. Início do turno

Depois dos eventos (GDD 08), monta a lista de obrigatórias:

1. **Emergência:** para cada medidor que fechou o turno anterior em ≤ 10 e ainda não teve emergência, uma carta ligada a ele; ordem do GDD 01 (`gdd/sistemas/01_medidores.md:91`). Ignora o teto.
2. **Ator:** para cada ator Furioso cuja carta de ataque não saiu, essa carta; menor satisfação primeiro, empate pelo menor `id`.
3. **Medidor:** para cada medidor < 30, uma carta ligada a ele; menor valor primeiro, empate pela ordem da tabela do GDD 01.

Ator e medidor entram até completar 3 obrigatórias; o excedente é descartado e checado de novo no turno seguinte. As obrigatórias saem primeiro, nesta ordem.

### 3.4. Vagas sorteadas

As vagas restantes até 7 são preenchidas uma a uma, na hora de mostrar a carta: peso igual entre as elegíveis cujo `modo` ainda não apareceu no turno (contando as obrigatórias). Sem carta de modo novo, a regra de modo é relaxada.

### 3.5. Fora do sorteio

- Lado de cada opção: sorteado na exibição (`gdd/sistemas/05_cartas.md` §3.4).
- Cena de impeachment: cartas extras, fora das 7 (`gdd/sistemas/03_impeachment.md:31`).

## 4. Fórmulas

| Variável | Definição | Faixa |
| :--- | :--- | :--- |
| `N` | Cartas por turno | 7 |
| `T` | Teto de obrigatórias | 3 |
| `Em` | Emergências pendentes no turno | 0-8 |
| `C` | Candidatas de ator e de medidor | ≥ 0 |
| `O` | Obrigatórias do turno | 0-8 |
| `E` | Elegíveis de modo novo no momento do sorteio | ≥ 0 |

- **Obrigatórias:** `O = Em + min(C, max(0, T − Em))`.
- **Vagas sorteadas:** `S = max(0, N − O)`.
- **Chance numa vaga sorteada:** `1 / E`; se `E` = 0, relaxa o modo e `E` passa a contar todas as elegíveis.

**Exemplo:** início do Ano 3; `Dignidade` fechou em 8 (`Em` = 1); Latifundiários Furiosos e `Caixa` em 25 (`C` = 2). `O` = 1 + min(2, 3 − 1) = 3 — emergência de `Dignidade`, ataque dos Latifundiários, carta ligada a `Caixa` — e `S` = 4. Com 3 modos já vistos e 40 elegíveis de modo novo, cada uma tem 1/40 na quinta carta.

A emergência conta para o teto: com `Em` ≥ 3, nenhuma carta de ator ou de medidor é obrigatória naquele turno.

## 5. Casos-limite

| Caso | O que acontece |
| :--- | :--- |
| Ano 1 | Sem emergência (não houve fechamento); nenhum ator Furioso (todos em 50); medidor < 30 vindo da calibração vale |
| Mais emergências que vagas (`Em` > 7) | As 7 cartas são de emergência; as restantes são as primeiras do turno seguinte |
| Nenhuma carta ligada elegível para a obrigatória | A vaga vai ao sorteio; a emergência não é gasta e pode voltar no próximo fechamento em ≤ 10 |
| Mesma carta atende duas obrigações | Conta uma vez; entra a próxima candidata |
| Obrigatória deixa de ser elegível antes de aparecer | Elegibilidade checada de novo na exibição; se falhar, a vaga vai ao sorteio |
| Faltam elegíveis para completar 7 (hoje 22 jogáveis para 28 vagas, D-102) | O turno termina com as cartas que houver e fecha normalmente; no Ano 4, finais (GDD 02). Partida curta aceita pelo PO |
| Turno sem nenhuma elegível | Fecha sem cartas; eventos e fechamento acontecem normalmente |
| Fim do Ano 4 com medidor ≤ 10 | Sem emergência: o mandato acabou (`gdd/sistemas/02_finais.md:101`) |
| Cena de impeachment no meio do turno | Depois da cena, o turno continua com as vagas restantes |
| Fim imediato (medidor em 0) | O sorteio para; as cartas restantes não aparecem |

## 6. Dependências

**Depende de:** 01 Medidores (valores, pedido de emergência, ordem de desempate) · 05 Cartas (`modo`, `tipo`, `pre_requisitos`, `efeitos` para a carta ligada) · 07 Atores (nível e função das cartas de ator) · 08 Eventos (disparam antes do sorteio).

**É usado por / citado em:**

| Sistema | Uso | Cita o 06? |
| :--- | :--- | :--- |
| 01 Medidores | Emergência e carta de recuperação | ✅ `gdd/sistemas/01_medidores.md:40,51,104` |
| 05 Cartas | `pre_requisitos`; cartas esgotadas | ✅ `gdd/sistemas/05_cartas.md:32,88,101` |
| 07 Atores | Nível → obrigatória; "1× por partida" | ✅ `gdd/sistemas/07_atores.md` §3.2, §3.4, §6 |
| 08 Eventos | Disparo antes da primeira carta | ✅ `gdd/sistemas/08_eventos.md:73,92` |
| 09 Desinformação | Cartas do modo puxadas por medidor < 30 | ✅ `gdd/sistemas/09_desinformacao.md` §3.4 |
| 02 Finais | Fim do Ano 4 sem emergência; turno curto | ✅ `gdd/sistemas/02_finais.md` §6 |
| 03 Impeachment | Cartas da cena fora das 7 | ✅ `gdd/sistemas/03_impeachment.md` §6 |
| 10 Estado da partida | Guarda cartas jogadas; chama o sorteio a cada carta | ✅ `gdd/sistemas/10_estado_partida.md` §3 |

## 7. Parâmetros de ajuste

| Parâmetro | Atual | Faixa segura | O que afeta |
| :--- | :--- | :--- | :--- |
| Cartas por turno `N` | 7 | 6-8 | Duração da partida (D-088, ~15 min); 28 cartas |
| Teto de obrigatórias `T` | 3 | 2-4 | Pressão × variedade; 4 em 7 = mais da metade do turno em cobrança (pilar 2) |
| Limite do medidor obrigatório | < 30 | 25-35 | Quando a crise puxa cartas; acima da emergência (≤ 10, `gdd/sistemas/01_medidores.md:123`) |
| Limite por modo (sorteadas) | 1 | 1-2 | Variedade de assuntos no turno |
| Peso das sorteadas | Igual | Fixo | Sorteio "narrativo, não ponderado" (`docs/05_SISTEMAS_E_MECANICAS.md` §05.04.1) |
| `ano_minimo` | 1-4 | 1-4 | Concentra cartas de crise nos anos finais |

Atuais: decisões do PO no P-012; limite de 30 de `gdd/GDD.md:347`. Faixas seguras: proposta aprovada pelo PO (2026-10-16), sem simulação do ECO `[não verificado]`.

## 8. Critérios de aceite

| # | Critério | Como testar | Passa se |
| :--- | :--- | :--- | :--- |
| CA-01 | Sem repetição | 1.000 partidas simuladas | Nenhuma carta 2× na mesma partida |
| CA-02 | Tamanho do turno | Partida com baralho cheio | Cada turno com exatamente 7 cartas (fora a cena de impeachment) |
| CA-03 | Elegibilidade | APR em rascunho; `ano_minimo` 3 no Ano 2; carta de impeachment | Nenhuma é sorteada |
| CA-04 | Função do ator | Ator em Neutro | Só a exigência dele pode sair |
| CA-05 | Ataque obrigatório | Ator Furioso no fim do turno | Ataque entre as 3 primeiras cartas do turno seguinte |
| CA-06 | Emergência | `Dignidade` fecha em 8 | 1ª carta do turno seguinte tem opção com `Dignidade` positiva |
| CA-07 | Teto | 1 emergência, 2 atores Furiosos, 2 medidores < 30 | 3 obrigatórias: emergência, ator de menor satisfação, o outro ator; nenhum medidor |
| CA-08 | Excedente | No caso da CA-07, o 2º ator volta a Insatisfeito | O ataque dele não é obrigatório no turno seguinte |
| CA-09 | Variedade | Turno sem obrigatórias, baralho cheio | 7 cartas de 7 modos diferentes |
| CA-10 | Relaxa o modo | Só restam elegíveis de modos já vistos | O turno se completa com elas |
| CA-11 | Baralho curto | 22 cartas jogáveis | Partida termina com 22 cartas, sem travar; finais checados |
| CA-12 | Chance igual | 10.000 sorteios de uma vaga com 40 elegíveis | Cada carta entre 2,0% e 3,0% (esperado 2,5%; ±3 desvios-padrão) |
| CA-13 | Ano 4 | Medidor ≤ 10 no fechamento do Ano 4 | Sem emergência; tela final |

## Ajustes para outros docs

Aplicar no `/sync-docs` e na etapa 7 do P-012 (não alterados por este GDD):

- `gdd/GDD.md` §6.2: trocar regras e pseudocódigo por este GDD (sem "Prioridade Narrativa" por evento; ator Furioso, não < 30; teto 3; variedade só nas sorteadas).
- Doc 05 §05.04 (`docs/05_SISTEMAS_E_MECANICAS.md`): idem.
- Doc 13 §13.3.1: `pre_requisitos` só com `ano_minimo` (sai `modo_nao_jogado`).
- `gdd/GDD.md` §5.4: "6–8" cartas por turno → 7.
- GDDs 02 e 03: citar o 06 nas dependências.
