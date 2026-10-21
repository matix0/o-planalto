# 05 — Sistemas e Mecânicas

**Documento de Definição dos Sistemas e Mecânicas do Jogo "O Planalto"**

Este documento define todos os sistemas e mecânicas do jogo, incluindo o Modo Impeachment, os Eventos Encadeados, os Pesos e Gatilhos, o Balanceamento, o Eixo Ideológico, a Calibração Inicial/Final, o Modo Influenciador, o Sistema de Satisfação dos Atores e o Sistema de Relações entre Medidores. Cada seção apresenta a fundamentação teórica e os algoritmos que regem o funcionamento do jogo.

---

## 05.01 — Visão Geral dos Sistemas

### 05.01.1. Mapa dos Sistemas

O jogo "O Planalto" é composto por **9 sistemas interconectados**:

```
┌─────────────────────────────────────────────────────────────┐
│                    SISTEMAS DO JOGO                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. SISTEMA DE MEDIDORES                                    │
│     └──▶ 8 medidores (D-094)                                │
│                                                             │
│  2. SISTEMA DE CARTAS                                       │
│     └──▶ 340 cartas + Cartas de Aprendizado                 │
│                                                             │
│  3. SISTEMA DE SORTEIO                                      │
│     └──▶ 7 cartas por turno; até 3 obrigatórias             │
│                                                             │
│  4. SISTEMA DE SATISFAÇÃO DOS ATORES                        │
│     └──▶ 24 atores com níveis de satisfação                 │
│                                                             │
│  5. SISTEMA DE EVENTOS ENCADEADOS                           │
│     └──▶ Consequências das opções, 1-2 turnos depois        │
│                                                             │
│  6. SISTEMA DE IMPEACHMENT                                  │
│     └──▶ Cena de golpe em 5 cartas                          │
│                                                             │
│  7. SISTEMA DE EIXO IDEOLÓGICO                              │
│     └──▶ Modelo 9axes adaptado                              │
│                                                             │
│  8. SISTEMA DE CALIBRAÇÃO                                   │
│     └──▶ 6 perguntas iniciais + revelação final             │
│                                                             │
│  9. SISTEMA DE DESINFORMAÇÃO                                │
│     └──▶ Modo Influenciador com teoria da inoculação        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 05.01.2. Interconexão dos Sistemas

| Sistema | Afeta | É afetado por |
| :--- | :--- | :--- |
| **Medidores** | Todos os sistemas | Todos os sistemas |
| **Cartas** | Medidores, Atores, Eventos | Sorteio |
| **Sorteio** | Cartas | Medidores, Atores, Eventos |
| **Satisfação dos Atores** | Sorteio, Eventos | Cartas |
| **Eventos Encadeados** | Medidores, Atores | Cartas |
| **Impeachment** | Fim de jogo | Medidores |
| **Eixo Ideológico** | Final | Escolhas do jogador |
| **Calibração** | Medidores iniciais | Escolhas do jogador |
| **Desinformação** | Medidores, Atores | Cartas |

### 05.01.3. Fundamentação Teórica

A arquitetura de sistemas interconectados é baseada em:

1. **Teoria dos Sistemas Complexos** — sistemas complexos emergem da interação entre partes simples.
2. **Design de Jogos Sérios** — jogos educativos funcionam melhor quando múltiplas variáveis interagem.
3. **Ciclo de Aprendizagem de Kolb** — o jogador vivencia, reflete, conceitua e experimenta.

> "Os jogos sérios devem simular a complexidade dos sistemas políticos e a tomada de decisão ética." — Design de jogos sérios

---

## 05.02 — Sistema de Medidores

### 05.02.1. Visão Geral

O sistema de medidores é o **coração do jogo**. Ele define o estado do país e as consequências das decisões.

| Tipo | Quantidade | Medidores |
| :--- | :--- | :--- |
| **Indicadores Sociais** | 5 | Dignidade, Consciência, Soberania, Segurança, Integridade |
| **Recursos de Poder** | 3 | Caixa, Capital Político, Legitimidade |

### 05.02.2. Valores Iniciais

| Medidor | Valor Inicial | Justificativa |
| :--- | :--- | :--- |
| Dignidade | 45 | O país tem problemas sociais graves, mas não está falido |
| Consciência | 40 | A despolitização é a regra |
| Soberania | 40 | Dependência externa, mas com margem de manobra |
| Segurança | 50 | Violência urbana, mas não é caos total |
| Integridade | 40 | Desinformação crescente |
| Caixa | 55 | Ainda há algum dinheiro |
| Capital Político | 50 | Congresso fragmentado, mas com base |
| Legitimidade | 55 | O povo está esperançoso (Lua de Mel) |

**Total:** 375 pontos (D-141).

### 05.02.3. Faixas de Risco

| Faixa | Cor | Valor | Significado |
| :--- | :--- | :--- | :--- |
| **Crítico** | 🔴 Vermelho | 0-20 | Risco iminente de final catastrófico |
| **Baixo** | 🟠 Laranja | 21-40 | Situação preocupante |
| **Médio** | 🟡 Amarelo | 41-60 | Equilíbrio instável |
| **Alto** | 🟢 Verde | 61-80 | Situação favorável |
| **Extremo** | 🔵 Azul | 81-100 | Pode ser bom ou ruim |

### 05.02.4. Relações entre Medidores

| Medidor Afetado | Medidor que Afeta | Tipo de Relação | Efeito |
| :--- | :--- | :--- | :--- |
| **Dignidade** | Consciência | Cascata | Quando Dignidade < 30, Consciência -5 por turno. Quando Dignidade > 70, Consciência +3 por turno. |
| **Consciência** | Legitimidade | Assimétrica | Quando Consciência > 60, Legitimidade -5 por turno. Quando Consciência < 30, Legitimidade +5 por turno. |
| **Soberania** | Caixa | Imediata | Quando Soberania < 30, Caixa +10 no turno, mas Dignidade -5. |
| **Segurança** | Dignidade | Condicional | Quando Segurança < 30, Dignidade -10. |
| **Integridade** | Consciência | Multiplicadora | Quando Integridade < 30, efeitos negativos em Consciência são dobrados. |
| **Caixa** | Legitimidade | Invertida | Quando Caixa > 70, Legitimidade -3 por turno. Quando Caixa < 30, Legitimidade -5 por turno. |
| **Capital Político** | Caixa | Direta | Quando Capital Político < 30, Caixa -10. |
| **Legitimidade** | Capital Político | Direta | Quando Legitimidade < 30, Capital Político -10. |

**Aplicação:** as relações de cascata são aplicadas no fechamento do turno, de uma vez, sem multiplicador do ano. A relação Integridade < 30 (perdas de Consciência dobradas) age nas cartas, na hora. Detalhes: `gdd/sistemas/01_medidores.md` (§3.4).

### 05.02.5. Cadeias de Consequências

| Cadeia | Descrição |
| :--- | :--- |
| **Cadeia da Barbárie** | Dignidade cai → Consciência cai → Legitimidade sobe → Capital Político sobe → Soberania cai. |
| **Cadeia da Revolta** | Dignidade cai → Consciência sobe → Legitimidade cai → Capital Político cai → Impeachment. |
| **Cadeia da Dependência** | Soberania cai → Caixa sobe → Dignidade cai → Consciência cai → Integridade cai → Desintegração. |
| **Cadeia da Resistência** | Consciência sobe → Integridade sobe → Dignidade sobe → Soberania sobe → Legitimidade sobe → República Soberana. |

### 05.02.6. Efeitos Não-Lineares (Limiares)

| Limiar | Efeito |
| :--- | :--- |
| **Integridade < 20** | Os outros 7 medidores perdem 1 ponto no fechamento do turno. |
| **Legitimidade > 90** | O povo idolatra o governante. Consciência −10 no fechamento do turno. |

Detalhes: `gdd/sistemas/01_medidores.md`.

### 05.02.7. Sub-medidores Econômicos

**Removidos pela D-094.** Os temas econômicos (desemprego, inflação, juros) ficam nas cartas e nas Cartas de Aprendizado.

### 05.02.8. Fundamentação Teórica

O sistema de medidores é baseado em:

1. **Teoria dos Sistemas Complexos** — múltiplas variáveis interagem.
2. **Design de *Reigns*** — 4 medidores no original; expandido para 8.
3. **Cobertura temática** — cada medidor cobre uma dimensão da luta política.

---

## 05.03 — Sistema de Cartas

### 05.03.1. Composição do Baralho

| Tipo de Carta | Quantidade | Código |
| :--- | :--- | :--- |
| **Institucionais** | 200 (10 modos × 20) | INST-XXX |
| **Temáticas** | 70 (7 temas × 10) | THEM-XXX |
| **Atores** | 70 cartas de ator, distribuídas entre os 24 atores | ATOR-XXX |
| **Total** | **340** | — |

### 05.03.2. Estrutura de Cada Carta

```json
{
  "id": "INST-001",
  "titulo": "Privatização da estatal",
  "modo": "Congresso",
  "tipo": "Institucional",
  "problema": "O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora.",
  "opcao_a": {
    "texto": "Nomear relator adversário",
    "cor": "vermelho",
    "eixo": [-1, 0, 0, 0],
    "efeitos": { "Capital Político": -10, "Soberania": 10 },
    "atores": {},
    "eventos": [],
    "consequencia": "O relator é adversário. O projeto avança."
  },
  "opcao_b": {
    "texto": "Aceitar as mudanças",
    "cor": "laranja",
    "eixo": [1, 0, 0, 0],
    "efeitos": { "Capital Político": 10, "Soberania": -15, "Caixa": 10, "Integridade": -5 },
    "atores": {},
    "eventos": [],
    "consequencia": "A lei passa. O povo paga a conta."
  },
  "aprendizado_id": "APR-001",
  "pre_requisitos": { "ano_minimo": 1 }
}
```

Campo único `efeitos`, com sinal (D-098); `atores` (D-106); `eventos` na opção (D-111); só `ano_minimo` (D-117). Valores do exemplo: `docs/17_ROTEIRO_DAS_CARTAS.md` (INST-001). Regras completas: `gdd/sistemas/05_cartas.md`; esquema: `docs/13_ARQUITETURA_TECNICA.md` §13.3.1.

### 05.03.3. Cores Partidárias

| Cor | Espectro | Referência |
| :--- | :--- | :--- |
| **Vermelho** | Esquerda | PT, PDT, PSOL |
| **Azul** | Centro-direita | PSDB, PSB |
| **Verde** | Agronegócio | Bancada ruralista |
| **Amarelo** | Centro | MDB, Centrão |
| **Roxo** | Esquerda radical | PSOL, PSTU |
| **Laranja** | Direita liberal | NOVO, Republicanos |
| **Preto** | Extrema-direita | PL, bolsonarismo |

**Regra vigente:** a cor é **por opção** (D-092) — cada opção mostra quem a propõe. O lado do swipe não indica ideologia (D-084).

### 05.03.4. Fundamentação Teórica

O sistema de cartas é baseado no **design de *Reigns***, que utiliza um "saco de cartas" que aumenta e diminui conforme o estado do reino.

> "Assim que ponderamos as decisões do jogador com consequências nas 4 dimensões de poder, demos muito significado a gestos muito simples de deslizar." — François Alliot, criador de *Reigns*

---

## 05.04 — Sistema de Sorteio

Regras completas: `gdd/sistemas/06_sorteio.md` (D-113 a D-117).

- 7 cartas por turno, 28 por partida, sem repetir carta.
- Elegíveis: Aprendizado aprovado (D-102), `ano_minimo` alcançado, carta de ator na função do nível atual.
- Até 3 obrigatórias por turno: emergência (medidor ≤ 10) → ataque de ator Furioso → carta ligada a medidor < 30. Carta ligada = alguma opção com efeito positivo no medidor.
- Vagas restantes: peso igual, no máximo 1 carta por modo (relaxa se faltar carta).
- Eventos encadeados não são cartas: disparam antes do sorteio.

O *Reigns* usa "um saco que aumenta e diminui de conteúdo"; aqui o sorteio é **narrativamente orientado**, não ponderado.

---

## 05.05 — Sistema de Satisfação dos Atores

Regras completas: `gdd/sistemas/07_atores.md` (D-104 a D-108).

| Nível | Faixa | Carta do ator sorteável |
| :--- | :--- | :--- |
| Furioso | 0-20 | Ataque (obrigatória no turno seguinte) |
| Insatisfeito | 21-40 | Exigência |
| Neutro | 41-60 | Exigência |
| Satisfeito | 61-80 | Oferta |
| Aliado | 81-100 | Oferta |

- Satisfação começa em 50 para os 24 atores (`ACT-001` a `ACT-024`).
- Cada opção traz `atores: { "ACT-xxx": ±1 }` (0-3 atores); ±1 = ±10 de satisfação.
- 70 cartas ATOR: 22 atores × 3 (ataque, exigência, oferta) + 2 × 2 (sem oferta).
- Evento de Boa Vontade: na carta de oferta, uma opção pode não ter efeito negativo (D-108).

Base: as facções de *Reigns* (Igreja, Povo, Exército, Tesouro).

---

## 05.06 — Sistema de Eventos Encadeados

Regras completas: `gdd/sistemas/08_eventos.md` (D-109 a D-112).

- Eventos vêm só das opções das cartas: 0 ou 1 por opção, com `texto`, `atraso` (1 ou 2 turnos) e `efeitos`.
- Disparam no início do turno de destino, antes da primeira carta, com o multiplicador do ano; não podem ser evitados.
- Destino depois do Ano 4 → epílogo do final, sem efeito.
- As antigas tabelas fixas por ator, modo e medidor (78 eventos, D-024) foram removidas (D-109).

Base: as "Ripple Chains" de *World Order* — "uma única força cascateia através da nação".

---

## 05.07 — Sistema de Impeachment

### 05.07.1. Conceito

O impeachment não é negociação. É uma **cena de golpe**.

**Comentário do Professor Alisson:** *"Acho que poderia ser a partir do ano 2."*

### 05.07.2. Gatilho de Acionamento

| Gatilho | Condição | A partir de |
| :--- | :--- | :--- |
| **Principal** | `Legitimidade` < 20 **E** `Capital Político` < 20 | Ano 2 |
| **Crise** | `Integridade` < 20 **E** `Consciência` < 20 | Ano 2 |
| **Alternativo** | 3 opções seguidas com efeito negativo em `Capital Político` | Ano 2 |
| **Capital em 0** | `Capital Político` = 0 (D-095) | Ano 1 |

**Correção:** O impeachment pode ser acionado a partir do **Ano 2**, não apenas do Ano 3 (exceto Capital em 0, que vale em qualquer ano).

### 05.07.3. Estrutura (5 Cartas)

- A cena tem **5 cartas extras** (não contam nas cartas do turno).
- Fases 1-4: cada opção tem um teste; teste vencido = +1 apoio.
- Desfecho: **absolvição** se apoio ≥ 2 (≥ 3 se a cena abriu por `Capital Político` = 0) e o teste da opção passar; senão, **condenação**.
- `Consciência` < 15 **E** `Integridade` < 15 no início → **condenação automática**.
- No máximo **1 impeachment por partida**.

Detalhes: `gdd/sistemas/03_impeachment.md`.

### 05.07.4. Fluxo do Impeachment

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUXO DO IMPEACHMENT                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  GATILHO (principal, crise, alternativo ou Capital em 0)    │
│  └──▶ CARTA 1 (O Pedido)                                   │
│       └──▶ CARTA 2 (A Comissão)                            │
│            └──▶ CARTA 3 (A Votação)                        │
│                 └──▶ CARTA 4 (O Julgamento)                │
│                      └──▶ CARTA 5 (O Desfecho)             │
│                           └──▶ ABSOLVIÇÃO ou CONDENAÇÃO    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 05.07.5. Fundamentação Teórica

O impeachment como **cena de golpe** é baseado na análise do impeachment de Dilma Rousseff em 2016, que foi amplamente interpretado como um **golpe parlamentar, jurídico e midiático**.

> "O impeachment não é justiça. É o Congresso te dando um recado: você não soube jogar o jogo deles." — Adaptação

A pesquisa acadêmica confirma que o processo foi marcado por **fragilidade jurídica**, **retaliação política** e **midiática**.

---

## 05.08 — Sistema de Eixo Ideológico

### 05.08.1. Abordagens Anteriores (Descartadas)

- "Você escolheu 15 soluções de esquerda e 9 de direita"
- Rotulava o jogador, reforçava a polarização
- Pontuar o eixo pelo **lado** do swipe (esquerda/direita) — descartado: o lado não indica ideologia (D-084)

### 05.08.2. Nova Abordagem (Adotada)

**Comentário do Professor Alisson:** *"Use como base testes como o 9 axes ou 11 axes para revelar este eixo."*

**Modelo 9axes (adaptado):**

| Eixo | Extremo A | Extremo B | Pontuação |
| :--- | :--- | :--- | :--- |
| **Economia** | Coletivismo | Mercado | -10 a +10 |
| **Diplomacia** | Nacionalismo | Globalismo | -10 a +10 |
| **Sociedade** | Conservadorismo | Progressismo | -10 a +10 |
| **Estado** | Autoritarismo | Liberdade | -10 a +10 |

### 05.08.3. Algoritmo de Cálculo

- Cada opção de carta traz um **vetor** de −2 a +2 por eixo.
- `pos(eixo) = (Σ valores ≠ 0 / nº de opções com valor ≠ 0 nesse eixo) × 5`; nenhuma opção tocou o eixo → `pos = 0`. Faixa: −10 a +10.
- No final, um **radar** mostra dois traçados: "o que você disse" (calibração) × "como você governou" (cartas).

Detalhes: `gdd/sistemas/04_eixo.md`.

### 05.08.4. Revelação Final

| Padrão | Revelação |
| :--- | :--- |
| **Dignidade, Consciência e Soberania altos** | *"Seu governo priorizou a dignidade, a educação e a soberania."* |
| **Segurança, Capital Político e Caixa altos** | *"Seu governo priorizou a ordem, a estabilidade e a economia."* |
| **Equilíbrio entre todos** | *"Seu governo buscou equilíbrio entre diferentes valores."* |
| **Integridade e Consciência baixos** | *"Seu governo deixou a verdade e a educação em segundo plano."* |
| **Dignidade e Soberania baixos** | *"Seu governo deixou os direitos do povo e a soberania em segundo plano."* |
| **Nenhum dos anteriores** (D-175) | *"Nenhum padrão resume seu governo. Os números contam o resto."* |

### 05.08.5. Fundamentação Teórica

O modelo 9axes é uma adaptação do **Political Compass** e do **8values**. Ele permite uma representação **multidimensional** do espectro político, evitando a dicotomia simplista esquerda-direita.

---

## 05.09 — Sistema de Calibração Inicial/Final

### 05.09.1. Calibração Inicial (6 Perguntas)

| # | Pergunta | Resposta A | Resposta B | Medidor Afetado |
| :--- | :--- | :--- | :--- | :--- |
| 1 | O governo deve priorizar segurança ou prevenção? | Segurança | Prevenção | Segurança / Dignidade |
| 2 | O Brasil deve se alinhar aos EUA ou ao BRICS? | EUA | BRICS | Soberania |
| 3 | O Estado deve investir em educação ou cortar gastos? | Educação | Cortar | Consciência / Caixa |
| 4 | A mídia deve ser livre ou regulada? | Livre | Regulada | Integridade |
| 5 | O governo deve taxar grandes fortunas? | Sim | Não | Dignidade / Caixa |
| 6 | O povo deve participar das decisões? | Sim | Não | Legitimidade / Consciência |

**Como funciona:** Cada resposta define +10 ou -10 em um medidor. O jogador pode pular.

### 05.09.2. Calibração Final (Eixo Ideológico)

- Gráfico de radar com 4 eixos (9axes adaptado).
- Revelação suavizada do padrão de valores.
- Frase de impacto: *"O país que você construiu reflete os valores que você priorizou."*

### 05.09.3. Fundamentação Teórica

A calibração inicial é baseada no modelo da **Bússola 2026**, que usa 12 perguntas para calcular a afinidade do eleitor com cada candidato. A calibração final é baseada no **9axes**, que revela o espectro político do jogador.

---

## 05.10 — Sistema de Desinformação (Modo Influenciador)

### 05.10.1. Conceito

O Modo Influenciador ensina como a desinformação é financiada, como os influenciadores são cooptados e como o jogador pode resistir. Baseado no **IAgora?** e na **"teoria da inoculação"**.

### 05.10.2. Técnicas de Manipulação Ensinadas

| Técnica | Descrição |
| :--- | :--- |
| **Desmoralização** | Destruir a reputação do adversário com mentiras |
| **Pânico Moral** | Criar medo sobre um tema |
| **Deepfake** | Vídeo falso com IA |
| **Fazenda de IA** | Rede de perfis coordenados |
| **Cachê da Desgraça** | Comissão sobre perdas de apostadores |
| **Didatismo Acusatório** | Pedagogia invertida que ensina a odiar |

### 05.10.3. Mecânica de Resistência (Teoria da Inoculação)

Sistema de conteúdo, sem mecânica nova (D-118). Regras: `gdd/sistemas/09_desinformacao.md`.

| Elemento | Definição |
| :--- | :--- |
| **Exposição** | A carta do modo mostra uma técnica (campo `tecnica`, 1 de 6, D-119) |
| **Escolha** | As duas opções opõem duas reações (`reacao`: aceitar, recusar, investigar, D-120) |
| **Consequência** | A opção `aceitar` perde `Integridade` ou `Consciência`. Custos típicos (guia): recusar perde `Legitimidade`; investigar perde `Capital Político` e ganha `Integridade` |
| **Carta de Aprendizado** | Nomeia a técnica e ensina a reconhecê-la |

### 05.10.4. Exemplo de Carta

> **Carta:** *"Um influenciador com 10 milhões de seguidores oferece apoio. Ele pede R$ 2 milhões por mês. O dinheiro viria de uma casa de apostas."*
>
> **Opção A (`reacao`: recusar):** *"Não vou me aliar a quem lucra com a miséria alheia."*
> - **Efeitos:** `Consciência` +10, `Integridade` +5, `Legitimidade` -10
> - **Consequência:** *"O influenciador faz campanha contra você. Mas sua consciência está limpa."*
>
> **Opção B (`reacao`: aceitar):** *"Vou aceitar. Preciso de alcance nas redes."*
> - **Efeitos:** `Capital Político` +10, `Legitimidade` +15, `Consciência` -15, `Integridade` -10
> - **Consequência:** *"O influenciador elogia seu governo. Mas o dinheiro vem da perda de apostadores."*
>
> **Carta de Aprendizado:** *"As bets financiam influenciadores com comissão sobre as perdas dos seguidores. O 'cachê da desgraça alheia' é uma das formas mais perversas de exploração digital."*

### 05.10.5. Fundamentação Teórica

A **"teoria da inoculação"** defende que a exposição controlada a técnicas de manipulação desenvolve **resistência psicológica** contra elas. O IAgora? usa essa teoria para treinar eleitores a identificar fake news.

---

## 05.11 — Sistema de Balanceamento

### 05.11.1. Valores Iniciais

| Medidor | Valor Inicial |
| :--- | :--- |
| Dignidade | 45 |
| Consciência | 40 |
| Soberania | 40 |
| Segurança | 50 |
| Integridade | 40 |
| Caixa | 55 |
| Capital Político | 50 |
| Legitimidade | 55 |

**Total:** 375 pontos (D-141).

### 05.11.2. Multiplicador de Dificuldade

| Ano | Multiplicador |
| :--- | :--- |
| Ano 1 | ×0.25 |
| Ano 2 | ×0.75 |
| Ano 3 | ×1.0 |
| Ano 4 | ×1.5 |

### 05.11.3. Limiares de Proteção

**Removidos pela D-082.** Nenhum piso por ano; medidor em 0 encerra a partida (D-089). O multiplicador do ano (05.11.2) segue vigente.

### 05.11.4. Mecanismos de Recuperação

| Mecanismo | Como Funciona |
| :--- | :--- |
| **Carta de Recuperação** | Carta ligada ao medidor em crise, obrigatória com medidor < 30 (D-115, `gdd/sistemas/06_sorteio.md`) |
| **Evento de Boa Vontade** | Carta de oferta de ator Satisfeito/Aliado: uma opção sem efeito negativo (D-108) |
| **Bônus por Equilíbrio** | +3 em todos se todos > 45, 1× por turno |
| **Segunda Chance** | Medidor ≤ 10 no fechamento → a próxima carta é de emergência para ele, 1× por medidor |

### 05.11.5. Fundamentação Teórica

O balanceamento foi revisado para ser **menos punitivo**, com base em:

1. **Teoria do Flow (Csikszentmihalyi)** — o jogo não deve ser frustrante a ponto de afastar o jogador.
2. **Erro como Aprendizado** — o erro deve ser informativo, não punitivo.
3. **Reforço Positivo** — o jogo deve recompensar boas escolhas, não apenas punir más escolhas.

---

## 05.12 — Diagrama de Fluxo dos Sistemas

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUXO DOS SISTEMAS                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  CALIBRAÇÃO INICIAL (6 perguntas)                          │
│  └──▶ MEDIDORES INICIAIS                                   │
│       └──▶ TURNO 1 (Ano 1)                                 │
│            └──▶ SORTEIO DE CARTAS                          │
│                 └──▶ DECISÃO DO JOGADOR                    │
│                      └──▶ EFEITOS NOS MEDIDORES            │
│                           └──▶ ATUALIZAÇÃO DE ATORES       │
│                                └──▶ REGISTRO DE EVENTOS    │
│                                     └──▶ VERIFICAÇÃO       │
│                                          (medidor zerado?)  │
│                                          (impeachment?)     │
│                                          (evento encadeado?)│
│                                                             │
│  ... REPETE ATÉ O TURNO 4 ...                              │
│                                                             │
│  TURNO 4 (Ano 4)                                           │
│  └──▶ FIM DE JOGO                                          │
│       └──▶ CÁLCULO DO EIXO IDEOLÓGICO                      │
│            └──▶ REVELAÇÃO FINAL                            │
│                 └──▶ CITAÇÃO DE IMPACTO                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 05.13 — Referências

- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.
- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.
- MCGUIRE, William. *Resistance to Persuasion*. 1964.
- VAN DER LINDEN, Sander. *Inoculation Theory*. 2022.
- WORLD ORDER. *Ripple Chains*. 2024.
- Revista Acervo (Arquivo Nacional). *Os sentidos do golpe*. Rio de Janeiro: Arquivo Nacional, 2025.
- Alisson, Professor. *Comentários sobre o Livro do Projeto*. 2026.

---

**Última atualização:** Outubro de 2026
**Versão:** 2.0 (completa)
