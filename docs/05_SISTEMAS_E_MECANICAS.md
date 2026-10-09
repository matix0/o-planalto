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
│     └──▶ 8 medidores + 3 sub-medidores                      │
│                                                             │
│  2. SISTEMA DE CARTAS                                       │
│     └──▶ 340 cartas + Cartas de Aprendizado                 │
│                                                             │
│  3. SISTEMA DE SORTEIO                                      │
│     └──▶ Prioridade narrativa                               │
│                                                             │
│  4. SISTEMA DE SATISFAÇÃO DOS ATORES                        │
│     └──▶ 20 atores com níveis de satisfação                 │
│                                                             │
│  5. SISTEMA DE EVENTOS ENCADEADOS                           │
│     └──▶ 78 eventos com gatilhos de longo prazo             │
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
| **Indicadores Sociais** | 5 | Dignidade, Consciência, Soberania, Segurança, Verdade |
| **Recursos de Poder** | 3 | Caixa, Capital Político, Legitimidade |
| **Sub-medidores Econômicos** | 3 | Desemprego, Inflação, Juros |

### 05.02.2. Valores Iniciais

| Medidor | Valor Inicial | Justificativa |
| :--- | :--- | :--- |
| Dignidade | 45 | O país tem problemas sociais graves, mas não está falido |
| Consciência | 35 | A despolitização é a regra |
| Soberania | 40 | Dependência externa, mas com margem de manobra |
| Segurança | 50 | Violência urbana, mas não é caos total |
| Verdade | 40 | Desinformação crescente |
| Caixa | 55 | Ainda há algum dinheiro |
| Capital Político | 50 | Congresso fragmentado, mas com base |
| Legitimidade | 55 | O povo está esperançoso (Lua de Mel) |

**Total:** 380 pontos.

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
| **Verdade** | Consciência | Multiplicadora | Quando Verdade < 30, efeitos negativos em Consciência são dobrados. |
| **Caixa** | Legitimidade | Invertida | Quando Caixa > 70, Legitimidade -3 por turno. Quando Caixa < 30, Legitimidade -5 por turno. |
| **Capital Político** | Caixa | Direta | Quando Capital Político < 30, Caixa -10. |
| **Legitimidade** | Capital Político | Direta | Quando Legitimidade < 30, Capital Político -10. |

### 05.02.5. Cadeias de Consequências

| Cadeia | Descrição |
| :--- | :--- |
| **Cadeia da Barbárie** | Dignidade cai → Consciência cai → Legitimidade sobe → Capital Político sobe → Soberania cai. |
| **Cadeia da Revolta** | Dignidade cai → Consciência sobe → Legitimidade cai → Capital Político cai → Impeachment. |
| **Cadeia da Dependência** | Soberania cai → Caixa sobe → Dignidade cai → Consciência cai → Verdade cai → Pós-Verdade. |
| **Cadeia da Resistência** | Consciência sobe → Verdade sobe → Dignidade sobe → Soberania sobe → Legitimidade sobe → República Soberana. |

### 05.02.6. Efeitos Não-Lineares (Limiares)

| Limiar | Efeito |
| :--- | :--- |
| **Verdade < 20** | Todos os outros medidores perdem 1 ponto por turno. |
| **Consciência < 15** | O povo não reage a nenhuma crise. |
| **Soberania < 15** | O país se torna um protetorado. |
| **Legitimidade > 90** | O povo idolatra o governante. Consciência -10 por turno. |

### 05.02.7. Sub-medidores Econômicos

| Sub-medidor | Efeito |
| :--- | :--- |
| **Desemprego** | Quanto maior, menor a `Dignidade` e a `Legitimidade`. |
| **Inflação** | Quanto maior, menor o `Caixa` e a `Dignidade`. |
| **Juros** | Quanto maior, menor o `Caixa` e a `Prosperidade`. |

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
| **Atores** | 70 (14 atores × 5) | ATOR-XXX |
| **Total** | **340** | — |

### 05.03.2. Estrutura de Cada Carta

```json
{
  "id": "INST-001",
  "titulo": "Privatização da estatal",
  "modo": "Congresso",
  "tipo": "Institucional",
  "cor": "laranja",
  "problema": "O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora.",
  "opcao_esquerda": {
    "texto": "Nomear relator adversário",
    "custo": { "Capital Político": -10 },
    "efeitos": { "Soberania": 10 },
    "consequencia": "A lei passa. O povo paga a conta."
  },
  "opcao_direita": {
    "texto": "Aceitar as mudanças",
    "custo": { "Capital Político": 10, "Caixa": 10 },
    "efeitos": { "Soberania": -15, "Verdade": -5 },
    "consequencia": "O relator é adversário. O projeto avança."
  },
  "aprendizado": {
    "vivencia": "Você decidiu se aceitava ou não as mudanças do relator.",
    "conceito": "Poder de agenda",
    "dados_reais": "A Eletrobras investiu apenas 1/5 do prometido após a privatização.",
    "fonte": "Agência Senado",
    "frase_impacto": "O relator tem poder. Quem controla a pauta, controla o país."
  },
  "pre_requisitos": {
    "ano_minimo": 1,
    "modo_nao_jogado": true
  },
  "eventos_encadeados": [
    {
      "turno_gatilho": 2,
      "evento": "Aumento de tarifas de energia",
      "efeitos": { "Dignidade": -10, "Soberania": -5 }
    }
  ]
}
```

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

### 05.03.4. Fundamentação Teórica

O sistema de cartas é baseado no **design de *Reigns***, que utiliza um "saco de cartas" que aumenta e diminui conforme o estado do reino.

> "Assim que ponderamos as decisões do jogador com consequências nas 4 dimensões de poder, demos muito significado a gestos muito simples de deslizar." — François Alliot, criador de *Reigns*

---

## 05.04 — Sistema de Sorteio (Prioridade Narrativa)

### 05.04.1. Conceito

O sistema de sorteio é **narrativamente orientado**, não matematicamente ponderado. As cartas aparecem porque a história exige, não porque um cálculo de probabilidade determinou.

### 05.04.2. Algoritmo de Sorteio

```
funcao sortear_cartas(turno, medidores, atores, cartas_jogadas):
    # 1. Filtrar cartas disponíveis
    cartas_disponiveis = filtrar_cartas(cartas_jogadas, turno)
    
    # 2. Prioridade narrativa
    for evento in eventos_encadeados:
        if evento.turno == turno:
            adicionar_carta_obrigatoria(evento.carta)
    
    # 3. Prioridade de ator
    for ator in atores:
        if ator.satisfacao < 30:
            adicionar_carta_obrigatoria(ator.cartas[0])
    
    # 4. Prioridade de medidor
    for medidor in medidores:
        if medidor.valor_atual < 30:
            adicionar_carta_obrigatoria(medidor.cartas_relacionadas)
    
    # 5. Variedade
    remover_cartas_do_mesmo_modo(cartas_disponiveis)
    
    # 6. Aleatoriedade controlada
    cartas_sorteadas = sortear_aleatoriamente(cartas_disponiveis, 6-8)
    
    return cartas_sorteadas
```

### 05.04.3. Regras de Sorteio

| # | Regra | Descrição |
| :--- | :--- | :--- |
| 1 | **Prioridade Narrativa** | Se uma decisão anterior gerou uma consequência, a carta da consequência aparece obrigatoriamente no turno correto. |
| 2 | **Prioridade de Ator** | Se um ator está insatisfeito (satisfação < 30), ele aparece obrigatoriamente no próximo turno. |
| 3 | **Prioridade de Medidor** | Se um medidor está < 30, cartas relacionadas a ele aparecem obrigatoriamente no próximo turno. |
| 4 | **Variedade** | Se um modo já apareceu no turno, ele não aparece de novo no mesmo turno. |
| 5 | **Aleatoriedade Controlada** | As cartas restantes são sorteadas aleatoriamente, mas com peso igual. |

### 05.04.4. Fundamentação Teórica

O sistema de *Reigns* é descrito como "um saco que aumenta e diminui de conteúdo". No nosso jogo, o sistema é **narrativamente orientado**, não matematicamente ponderado.

---

## 05.05 — Sistema de Satisfação dos Atores

### 05.05.1. Conceito

Cada ator tem um **nível de satisfação** (0-100) que sobe ou desce conforme as decisões do jogador.

### 05.05.2. Níveis de Satisfação

| Nível | Estado | O que Acontece |
| :--- | :--- | :--- |
| 0-20 | Furioso | Aparece obrigatoriamente. Pode atacar o governo. |
| 21-40 | Insatisfeito | Aparece com alta probabilidade. Pode fazer exigências. |
| 41-60 | Neutro | Aparece normalmente. |
| 61-80 | Satisfeito | Aparece com baixa probabilidade. Pode oferecer bônus. |
| 81-100 | Aliado | Aparece apenas se necessário. Oferece apoio incondicional. |

### 05.05.3. Algoritmo de Atualização

```
funcao atualizar_satisfacao(ator, escolha):
    if escolha.atende_ator(ator):
        ator.satisfacao += 10
    elif escolha.contraria_ator(ator):
        ator.satisfacao -= 10
    else:
        ator.satisfacao += 0
    
    ator.satisfacao = clamp(ator.satisfacao, 0, 100)
```

### 05.05.4. Consequências da Insatisfação

| Ator | Consequência se Insatisfeito |
| :--- | :--- |
| **Coronel** | Articula golpe ou fuga de capital |
| **Tecnocrata** | Pede mais cortes ou sai do governo |
| **Populista** | Convoca plebiscito ou ataca o Congresso |
| **Miliciano** | Domina território ou ataca o governo |
| **Pastor** | Faz campanha contra o governo |
| **Banqueiro/Ruralista** | Chantageia o mercado |
| **Professor** | Convoca greve |
| **Médico do SUS** | Denuncia o colapso hospitalar |
| **Coach Digital** | Faz campanha contra o governo |
| **Jornalista Independente** | Denuncia escândalos |
| **Artista Engajado** | Cria festival de resistência |
| **Burocrata** | Trava o governo |
| **Empresário da Saúde** | Pressiona por privatização |
| **Reitor Privatista** | Pressiona por cortes |

### 05.05.5. Fundamentação Teórica

O sistema de satisfação é baseado no **design de *Reigns***, onde cada facção (Igreja, Povo, Exército, Tesouro) tem um nível de satisfação que afeta o reinado.

---

## 05.06 — Sistema de Eventos Encadeados

### 05.06.1. Conceito

Os eventos encadeados são **consequências de decisões anteriores** que se manifestam 1-2 turnos depois. O jogador vê um aviso especial quando um evento é ativado. Ele não pode ser evitado.

### 05.06.2. Eventos por Ator (42)

| Ator | Evento 1 | Evento 2 | Evento 3 |
| :--- | :--- | :--- | :--- |
| **Coronel** | Cobra favor (Ano 2) | Ameaça invadir terra (Ano 3) | Milícia domina região (Ano 4) |
| **Tecnocrata** | Propõe choque de gestão (Ano 2) | Pede mais cortes (Ano 3) | Crise fiscal (Ano 4) |
| **Populista** | Convoca plebiscito (Ano 2) | Enfraquece Congresso (Ano 3) | Culto ao líder (Ano 4) |
| **Miliciano** | Domina território (Ano 2) | Chacina policial (Ano 3) | Estado de Caos (Ano 4) |
| **Pastor** | Pânico moral (Ano 2) | Censura aos costumes (Ano 3) | Ufanismo Vazio (Ano 4) |
| **Banqueiro/Ruralista** | Chantagem do mercado (Ano 2) | Desmatamento acelerado (Ano 3) | Colônia Digital (Ano 4) |
| **Professor** | Greve nas escolas (Ano 2) | Geração sem pensamento crítico (Ano 3) | Alienação Total (Ano 4) |
| **Médico do SUS** | Colapso hospitalar (Ano 2) | Mortalidade infantil (Ano 3) | Barbárie (Ano 4) |
| **Coach Digital** | Influenciador eleito (Ano 2) | Políticas contra o governo (Ano 3) | Colapso da verdade (Ano 4) |
| **Jornalista Independente** | Censura à imprensa (Ano 2) | Escândalo internacional (Ano 3) | Pós-Verdade Total (Ano 4) |
| **Artista Engajado** | Festival de resistência (Ano 2) | Cultura silenciada (Ano 3) | Perda de identidade (Ano 4) |
| **Burocrata** | Greve no serviço público (Ano 2) | Paralisia administrativa (Ano 3) | Colapso do Estado (Ano 4) |
| **Empresário da Saúde** | Planos de saúde sobem (Ano 2) | Hospitais lotados (Ano 3) | Barbárie (Ano 4) |
| **Reitor Privatista** | EAD de baixa qualidade (Ano 2) | Universidades sucateadas (Ano 3) | Alienação Total (Ano 4) |

### 05.06.3. Eventos por Modo (20)

| Modo | Evento 1 | Evento 2 |
| :--- | :--- | :--- |
| **Congresso** | CPI contra o governo (Ano 2) | Impeachment (Ano 3) |
| **Orçamento** | Crise fiscal (Ano 2) | Falência (Ano 3) |
| **Currículo e Mídia** | Geração sem pensamento crítico (Ano 2) | Pós-Verdade (Ano 3) |
| **Geopolítico** | Dependência externa (Ano 2) | Colônia (Ano 3) |
| **Prisional e Policial** | Rebelião em presídios (Ano 2) | Estado de Caos (Ano 3) |
| **Emendas** | Escândalo de desvio (Ano 2) | Impeachment (Ano 3) |
| **Bancadas** | Agenda conservadora avança (Ano 2) | Hegemonia Autoritária (Ano 3) |
| **Impeachment** | Processo instaurado (Ano 3) | Condenação ou absolvição (Ano 4) |
| **Judiciário** | Escândalo no STF (Ano 2) | Crise institucional (Ano 3) |
| **Influenciador** | Deepfake viral (Ano 2) | Pós-Verdade (Ano 3) |

### 05.06.4. Eventos por Medidor (16)

| Medidor | Evento 1 | Evento 2 |
| :--- | :--- | :--- |
| **Dignidade** | Epidemia na periferia (Ano 2) | Barbárie (Ano 3) |
| **Consciência** | Geração alienada (Ano 2) | Alienação Total (Ano 3) |
| **Soberania** | Dependência externa (Ano 2) | Colônia (Ano 3) |
| **Segurança** | Chacina policial (Ano 2) | Autogestão Popular (Ano 3) |
| **Verdade** | Desinformação total (Ano 2) | Pós-Verdade (Ano 3) |
| **Caixa** | Crise fiscal (Ano 2) | Paralisia (Ano 3) |
| **Capital Político** | Perda de apoio no Congresso (Ano 2) | Impeachment (Ano 3) |
| **Legitimidade** | Revolta popular (Ano 2) | Queda do governo (Ano 3) |

### 05.06.5. Fluxo dos Eventos Encadeados

```
┌─────────────────────────────────────────────────────────────┐
│                FLUXO DOS EVENTOS ENCADEADOS                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  DECISÃO (Turno X)                                          │
│  └──▶ REGISTRAR EVENTO (Turno X+2)                         │
│       └──▶ NO TURNO X+2:                                   │
│            └──▶ EXIBIR AVISO ESPECIAL                      │
│                 └──▶ APLICAR EFEITOS                       │
│                      └──▶ CONTINUAR JOGO                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 05.06.6. Fundamentação Teórica

O sistema de eventos encadeados é baseado no conceito de **"Ripple Chains"** (Cadeias de Ondas) do jogo *World Order*, que mostra como "uma única força cascateia através da nação".

---

## 05.07 — Sistema de Impeachment

### 05.07.1. Conceito

O impeachment não é negociação. É uma **cena de golpe**.

**Comentário do Professor Alisson:** *"Acho que poderia ser a partir do ano 2."*

### 05.07.2. Gatilho de Acionamento

| Condição | Descrição |
| :--- | :--- |
| **Gatilho Principal** | `Legitimidade` < 20 **E** `Capital Político` < 20 |
| **Gatilho Alternativo** | O jogador tomou **3 decisões consecutivas** que contrariaram a maioria do Congresso |
| **Gatilho de Crise** | `Verdade` < 20 **E** `Consciência` < 20 |

**Correção:** O impeachment pode ser acionado a partir do **Ano 2**, não apenas do Ano 3.

### 05.07.3. Estrutura (5 Cartas)

| Fase | O que Acontece | Condição de Sobrevivência |
| :--- | :--- | :--- |
| **1. O Pedido** | A oposição protocola. O presidente da Câmara aceita. | Apelar ao povo (Legitimidade > 60) ou confiar na base (Capital Político > 50) |
| **2. A Comissão** | Comissão formada por adversários. Relator inimigo. | Denunciar o golpe (Verdade > 60) ou negociar (Caixa > 60) |
| **3. A Votação** | Câmara vota. Resultado depende do apoio popular. | Convocar manifestações (Legitimidade > 70) ou aceitar |
| **4. O Julgamento** | Senado julga. Resultado depende da correlação de forças. | Renunciar (Consciência > 60) ou lutar até o fim |
| **5. O Desfecho** | Se o jogador tiver apoio popular massivo, o golpe falha. | Legitimidade > 60 E Consciência > 50 = Absolvição |

**Observação:** Se o jogador tiver `Consciência` < 30 E `Verdade` < 30, o impeachment é **automaticamente consumado**.

### 05.07.4. Fluxo do Impeachment

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUXO DO IMPEACHMENT                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  GATILHO (Legitimidade < 20 E Capital Político < 20)       │
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

### 05.08.1. Abordagem Anterior (Descartada)

- "Você escolheu 15 soluções de esquerda e 9 de direita"
- Rotulava o jogador, reforçava a polarização

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

```
funcao calcular_eixo(escolhas):
    eixo = {
        "economia": 0,
        "diplomacia": 0,
        "sociedade": 0,
        "estado": 0
    }
    
    for escolha in escolhas:
        if escolha.opcao == "esquerda":
            eixo["economia"] -= 1
            eixo["sociedade"] += 1
            eixo["estado"] += 1
        elif escolha.opcao == "direita":
            eixo["economia"] += 1
            eixo["sociedade"] -= 1
            eixo["estado"] -= 1
    
    return normalizar(eixo, -10, 10)
```

### 05.08.4. Revelação Final

| Padrão | Revelação |
| :--- | :--- |
| **Dignidade, Consciência e Soberania altos** | *"Seu governo priorizou a dignidade, a educação e a soberania..."* |
| **Segurança, Capital Político e Caixa altos** | *"Seu governo priorizou a ordem, a estabilidade e a economia..."* |
| **Equilíbrio entre todos** | *"Seu governo buscou equilíbrio entre diferentes valores..."* |
| **Verdade e Consciência baixos** | *"Seu governo negligenciou a verdade e a educação..."* |
| **Dignidade e Soberania baixos** | *"Seu governo negligenciou o povo e a soberania..."* |

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
| 4 | A mídia deve ser livre ou regulada? | Livre | Regulada | Verdade |
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

| Elemento | Definição |
| :--- | :--- |
| **Exposição Controlada** | O jogador é exposto a uma narrativa manipulada |
| **Escolha** | O jogador decide como reagir |
| **Consequência** | Se aceitar, perde `Verdade` e `Consciência`. Se recusar, perde `Legitimidade`. Se investigar, perde `Capital Político`, mas ganha `Verdade`. |
| **Carta de Aprendizado** | Explica a técnica e como reconhecê-la |

### 05.10.4. Exemplo de Carta

> **Carta:** *"Um influenciador com 10 milhões de seguidores oferece apoio. Ele pede R$ 2 milhões por mês. O dinheiro viria de uma casa de apostas."*
>
> **◀ ESQUERDA (Recusar):** *"Não vou me aliar a quem lucra com a miséria alheia."*
> - **Efeitos:** `Consciência` +10, `Verdade` +5, `Legitimidade` -10
> - **Consequência:** *"O influenciador faz campanha contra você. Mas sua consciência está limpa."*
>
> **DIREITA ▶ (Aceitar):** *"Vou aceitar. Preciso de alcance nas redes."*
> - **Efeitos:** `Capital Político` +10, `Legitimidade` +15, `Consciência` -15, `Verdade` -10
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
| Consciência | 35 |
| Soberania | 40 |
| Segurança | 50 |
| Verdade | 40 |
| Caixa | 55 |
| Capital Político | 50 |
| Legitimidade | 55 |

**Total:** 380 pontos.

### 05.11.2. Multiplicador de Dificuldade

| Ano | Multiplicador |
| :--- | :--- |
| Ano 1 | ×0.25 |
| Ano 2 | ×0.75 |
| Ano 3 | ×1.0 |
| Ano 4 | ×1.5 |

### 05.11.3. Limiares de Proteção

| Ano | Limite Mínimo | O que Acontece |
| :--- | :--- | :--- |
| Ano 1 | 30 | Nenhum medidor cai abaixo de 30 |
| Ano 2 | 20 | Nenhum medidor cai abaixo de 20 |
| Ano 3 | 10 | Nenhum medidor cai abaixo de 10 |
| Ano 4 | 0 | Sem proteção |

### 05.11.4. Mecanismos de Recuperação

| Mecanismo | Como Funciona |
| :--- | :--- |
| **Carta de Recuperação** | Restaura um medidor em crise |
| **Evento de Boa Vontade** | Ator oferece ajuda sem cobrar |
| **Bônus por Equilíbrio** | Se todos os medidores > 40, ganha +5 em todos |
| **Segunda Chance** | Se um medidor chega a 10, oferece escolha crítica para recuperá-lo |

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
