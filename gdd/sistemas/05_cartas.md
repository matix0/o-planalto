# 05 — Cartas

**Sistema:** 05 (`gdd/sistemas/00_INDICE.md`) · **Inclui:** estrutura, opções A/B, sorteio do lado, cor por opção e saldo por cor
**Status:** ✅ Aprovado pelo PO (2026-10-16)

---

## 1. Visão geral

A carta é a unidade de decisão do jogo: 340 cartas — 200 institucionais (INST), 70 temáticas (THEM) e 70 de atores (ATOR) (`gdd/GDD.md:466-475`). Cada carta traz um problema e duas opções (`opcao_a` / `opcao_b`), cada uma com texto, cor partidária, vetor de eixo, efeitos nos medidores e consequência (`gdd/GDD.md:677-702`). O lado de cada opção é sorteado a cada partida e nunca recebe rótulo ideológico (D-084); a cor é a de quem propõe a opção (D-092). O ECO valida o saldo de efeitos por cor, e toda opção tem custo real em algum medidor (D-097).

## 2. Fantasia do jogador

O jogador sente o peso de decidir sozinho, com um gesto, um problema sem resposta limpa: as duas opções são legítimas e as duas custam algo (pilares 2 e 4). Como o lado é sorteado e não tem rótulo, ele escolhe pelo conteúdo, não por reflexo ideológico (D-084). A cor mostra quem propõe cada saída, e ele aprende que toda proposta tem dono e interesse (D-092). O sentido da escolha só chega depois: na consequência, na Carta de Aprendizado e no radar do final (pilares 1 e 5, `gdd/GDD.md:98-114`).

## 3. Regras detalhadas

### 3.1. Composição

340 cartas: 200 INST (10 modos × 20), 70 THEM (7 temas × 10) e 70 ATOR, distribuídas entre os 24 atores (`docs/05_SISTEMAS_E_MECANICAS.md:163-168`). `tipo` aceita Institucional, Temática, Ator e Impeachment; eventos não são cartas (GDD 08). As cartas de Impeachment ficam fora das 340, têm o campo `teste` por opção e seguem as regras do GDD 03 (`gdd/sistemas/03_impeachment.md:31-33`).

### 3.2. Estrutura da carta

| Campo | Regra |
| :--- | :--- |
| `id` | Único: `INST-xxx`, `THEM-xxx`, `ATOR-xxx` |
| `titulo` | Até 5 palavras (`gdd/GDD.md` §5.3) |
| `modo` | Um dos 10 modos |
| `problema` | Até 2 linhas |
| `opcao_a` / `opcao_b` | §3.3 |
| `aprendizado_id` | `APR-xxx`, mesmo número da carta; texto no doc 18 (D-090) |
| `tecnica` | Só no modo Influenciador: uma de 6 técnicas (`gdd/sistemas/09_desinformacao.md` §3.1) |
| `pre_requisitos` | Declarado aqui; regras no GDD 06 |

### 3.3. Opção

| Campo | Regra |
| :--- | :--- |
| `texto` | 1 linha |
| `cor` | Uma das 7 cores partidárias; sem cor neutra (D-092) |
| `eixo` | `[Eco, Dip, Soc, Est]`, inteiros −2 a +2 (`gdd/sistemas/04_eixo.md` §3.2) |
| `efeitos` | Campo único, com sinal. De 2 a 4 medidores; ≥ 1 negativo (D-097), exceto uma opção da carta de oferta de ator (Boa Vontade, `gdd/sistemas/07_atores.md` §5); valores múltiplos de 5, de ±5 a ±30 |
| `consequencia` | Frase curta, mostrada após a escolha |
| `atores` | `{ "ACT-xxx": ±1 }`, de 0 a 3 atores; a carta de um ator o cita nas duas opções (`gdd/sistemas/07_atores.md` §3.3-3.4) |
| `eventos` | 0 ou 1 evento encadeado (`gdd/sistemas/08_eventos.md` §3.1) |
| `reacao` | Só no modo Influenciador: `aceitar`, `recusar` ou `investigar` (`gdd/sistemas/09_desinformacao.md` §3.2) |

### 3.4. Lado e exibição

- A cada exibição, o lado de `opcao_a` é sorteado com 50%, sem depender das outras cartas; `opcao_b` fica no lado oposto.
- A UI nunca escreve "esquerda/direita" (D-084).
- Durante o arraste: texto da opção e borda na cor dela; nenhuma pista sobre os medidores (`gdd/GDD.md` §5.1).

### 3.5. Resolução

Ao soltar a carta, nesta ordem:

1. Aplica os `efeitos` nos medidores (GDD 01).
2. Soma o `eixo` ao traçado "como você governou" (GDD 04).
   2b. Atualiza a satisfação dos atores citados em `atores` (GDD 07).
3. Agenda o evento da opção (GDD 08).
4. Mostra a `consequencia` e, depois, a Carta de Aprendizado.

## 4. Fórmulas

| Variável | Definição | Faixa |
| :--- | :--- | :--- |
| `e(o,m)` | Efeito base da opção `o` no medidor `m` | ±5 a ±30, múltiplos de 5 (§3.3) |
| `S(c,m)` | Saldo da cor `c` no medidor `m`: soma de `e(o,m)` em todas as opções de cor `c` | Livre |
| `P(lado)` | Chance de `opcao_a` aparecer num dado lado | 0,5 |

- **Efeito aplicado:** fórmula do GDD 01 (`gdd/sistemas/01_medidores.md:28-31`); não é repetida aqui.
- **Custo real por cor (D-092, D-097):** para cada cor `c`, existe ao menos um `m` com `S(c,m) < 0`. O resto do saldo é só relatório do ECO, sem limite (não se neutraliza o "moral" por cor).

**Exemplo:** INST-001, opção A, Vermelho (`docs/17_ROTEIRO_DAS_CARTAS.md:66`) soma `Capital Político` −10 e `Soberania` +10 a `S(Vermelho, ·)`. No Ano 1 (×0,25), o jogador recebe −2,5 → −3 e +2,5 → +3 (empate afasta do zero).

## 5. Casos-limite

| Caso | O que acontece |
| :--- | :--- |
| Opção leva medidor a 0 (exceto `Capital Político`) | Aplica todos os efeitos da opção e soma o eixo; então final catastrófico (D-089). Eventos, consequência e Aprendizado não ocorrem |
| Dois ou mais medidores em 0 juntos | Prioridade do GDD 02 (`gdd/sistemas/02_finais.md:41`) |
| `Capital Político` em 0 | Abre o impeachment (D-095, GDD 03) após o passo 2 da §3.5 |
| Ganho em medidor já em 100 | Limita a 100 (`gdd/sistemas/01_medidores.md:31`); final por medidor em 100: GDD 02 |
| Opção sem nenhum ganho | Permitida: a regra exige ≥ 1 negativo, não ≥ 1 positivo (§3.3) |
| Carta solta antes do limite de arraste | Volta ao centro; nada é aplicado (`docs/14_UI_UX_DESIGN.md:106`) |
| Mesma cor em A e B | Proibido; `/validate-cards` reprova |
| Dado inválido (cor fora das 7, eixo fora de −2..+2, efeitos fora da §3.3, `id` repetido) | `/validate-cards` reprova; no jogo, a carta é excluída do baralho e o erro vai ao log |
| Aprendizado em rascunho ou sem fonte (D-091) | A carta não entra no baralho até o texto ser aprovado. Hoje: 22 cartas jogáveis (`gdd/GDD.md:923`) |
| Cartas elegíveis esgotadas | GDD 06 Sorteio |

## 6. Dependências

**Depende de:** 01 Medidores (aplicação dos efeitos: multiplicador e arredondamento) · 04 Eixo (campo `eixo` e soma dos pontos).

**É usado por:**

| Sistema | Uso | Cita o 05? |
| :--- | :--- | :--- |
| 01 Medidores | Recebe os `efeitos` de cada opção | ✅ `gdd/sistemas/01_medidores.md` §6 |
| 03 Impeachment | Cartas do tipo `Impeachment` (§3.1) | ✅ `gdd/sistemas/03_impeachment.md:80` |
| 04 Eixo | Lê o `eixo` de cada opção | ✅ `gdd/sistemas/04_eixo.md` §6 |
| 06 Sorteio | Lê `pre_requisitos`, `modo` e `tipo` | ⏳ a escrever |
| 07 Atores | Lê o campo `atores` e as cartas ATOR | ✅ `gdd/sistemas/07_atores.md` §3 |
| 08 Eventos | Lê o campo `eventos` da opção | ✅ `gdd/sistemas/08_eventos.md` §3 |
| 09 Desinformação | Campos `tecnica` e `reacao` no modo Influenciador | ✅ `gdd/sistemas/09_desinformacao.md` §3 |
| 10 Estado da partida | Executa a resolução (§3.5) | ⏳ a escrever |
| 02 Finais | Recebe o fim imediato (§5) | ❌ não cita o 05 — ajuste na etapa 7 do P-012 |

## 7. Parâmetros de ajuste

| Parâmetro | Atual | Faixa segura | O que afeta |
| :--- | :--- | :--- | :--- |
| Medidores por opção | 2 a 4 | 1 a 5 | Legibilidade × peso da escolha; ≥ 5 dilui a causa e efeito (pilar 2) |
| Magnitude do efeito base | ±5 a ±30 | ±5 a ±40 | Velocidade até 0 ou 100; ±30 × 1,5 (Ano 4) = 45 pontos de uma vez (`gdd/sistemas/01_medidores.md:28`) |
| Passo do efeito | 5 | 5 | Números redondos para a escrita e para o ECO |
| Negativos mínimos por opção | 1 | 1 | Custo real (D-097) |
| Chance do lado de A | 0,5 | 0,5 fixo | Outro valor cria um "lado certo" (D-084) |
| Custo por cor | ≥ 1 medidor com `S(c,m) < 0` | ≥ 1 | Nenhuma cor "de graça" (§4) |

Faixas atuais: contagem das 44 opções escritas (`docs/17_ROTEIRO_DAS_CARTAS.md`). Faixas seguras: proposta aprovada pelo PO (2026-10-16), sem simulação do ECO `[não verificado]`.

## 8. Critérios de aceite

| # | Critério | Como testar | Passa se |
| :--- | :--- | :--- | :--- |
| CA-01 | Estrutura | `/validate-cards` | Toda carta tem os campos da §3.2; `tipo` é um dos 4 valores |
| CA-02 | Opção válida | `/validate-cards` | Cor entre as 7; eixo −2..+2; 2-4 efeitos, múltiplos de 5, ±5 a ±30; ≥ 1 negativo |
| CA-03 | Cores distintas | `/validate-cards` | Nenhuma carta com a mesma cor em A e B |
| CA-04 | Custo por cor | Relatório do ECO | Cada uma das 7 cores tem ≥ 1 medidor com `S(c,m) < 0` |
| CA-05 | Sorteio do lado | 1.000 exibições da mesma carta no protótipo | `opcao_a` à esquerda entre 45% e 55% (±3 desvios-padrão) |
| CA-06 | Sem rótulo | Inspeção da UI | Nenhuma tela mostra "esquerda/direita" nem associa lado a ideologia |
| CA-07 | Ordem de resolução | Teste no protótipo | Efeitos → eixo → eventos → consequência → Aprendizado (§3.5) |
| CA-08 | Fim imediato | Opção que zera `Dignidade` | Efeitos todos aplicados e eixo somado; tela final sem consequência nem Aprendizado |
| CA-09 | Impeachment | Opção que zera `Capital Político` | A cena do GDD 03 abre após o passo 2 |
| CA-10 | Soltar cedo | Soltar antes do limite de arraste | Nenhum medidor muda |
| CA-11 | Carta inválida | Carregar carta com cor inválida | Carta fora do baralho; erro no log |
| CA-12 | Aprendizado pendente | Carta com APR em rascunho | Nunca é sorteada |

## Ajustes para outros docs

Aplicar no `/sync-docs` e na etapa 7 do P-012 (não alterados por este GDD):

- Docs 05 e 13 e `gdd/GDD.md` §12.2: trocar `custo` + `efeitos` por um único `efeitos` com sinal (§3.3).
- Doc 13 (`docs/13_ARQUITETURA_TECNICA.md:274`): trocar o tipo "Evento" por "Impeachment" (§3.1).
- Doc 05 (`docs/05_SISTEMAS_E_MECANICAS.md:183,190`): consequências de A e B trocadas no exemplo.
- GDD 02: citar o 05 nas dependências (§6).
