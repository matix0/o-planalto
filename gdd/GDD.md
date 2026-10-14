# GDD — Game Design Document
## O Planalto

**Versão:** 1.2
**Data:** 2026-10-14
**Autor:** Mateus (consolidação assistida)
**Status:** Rascunho — documento mestre (D-081)
**Documentos-fonte:** `00` a `18`

---

## Sumário

1. [Visão Geral](#1-visão-geral)
2. [Pilares de Design](#2-pilares-de-design)
3. [Público-Alvo e Objetivos](#3-público-alvo-e-objetivos)
4. [Core Loop](#4-core-loop)
5. [Mecânicas Centrais](#5-mecânicas-centrais)
6. [Sistemas](#6-sistemas)
7. [Progressão e Fases](#7-progressão-e-fases)
8. [Conteúdo](#8-conteúdo)
9. [Finais e Eixo Ideológico](#9-finais-e-eixo-ideológico)
10. [UI/UX](#10-uiux)
11. [Direção de Arte e Áudio](#11-direção-de-arte-e-áudio)
12. [Arquitetura Técnica](#12-arquitetura-técnica)
13. [Balanceamento](#13-balanceamento)
14. [Localização e Acessibilidade](#14-localização-e-acessibilidade)
15. [Produção](#15-produção)
16. [Anexos](#16-anexos)

---

## 1. Visão Geral

### 1.1. Pitch

**O Planalto** é um jogo educativo de conscientização política em formato curto (~15 min). O jogador é o Presidente do Brasil por 4 anos, tomando decisões via cartas que arrasta para esquerda ou direita. Cada escolha afeta 8 medidores interligados e gera consequências imediatas e de longo prazo. Ao final, o jogador descobre o país que construiu e o espectro de valores que guiou seu governo.

**Frase-síntese:** *"Você decide. Mas alguém vai pagar a conta."*

### 1.2. Identidade

| Item | Definição |
| :--- | :--- |
| **Nome** | O Planalto |
| **Gênero** | Jogo educativo de conscientização política |
| **Mecânica central** | Swipe de cartas (esquerda/direita) |
| **Inspiração principal** | *Reigns* (Nerial, 2016) |
| **Inspiração secundária** | *Senhor Presidente* (Icon Games, 2016) |
| **Plataformas** | Mobile, Web, PC |
| **Engine** | Godot 4.7 |
| **Duração** | ~15 minutos (D-088) |
| **Modo** | Singleplayer |
| **Salvamento** | Nenhum (partida única) |
| **Classificação** | Livre (recomendado 12+) |
| **Idioma** | Português (Brasil) |

### 1.3. Premissa

O jogador é o **Presidente do Brasil** (D-087), que enfrenta desigualdade, violência, dependência externa, desinformação e captura do Estado. Durante **4 anos de mandato**, decide como lidar com essas pressões — e descobre que toda escolha tem preço.

### 1.4. Cenário

O jogo se passa no **Brasil**, com instituições, dados e atores reais (D-086, que revisa a D-006). O cenário fictício (Vila Nova/Aurora) foi abandonado em 2026-10-13: por ser um jogo educativo, o PO decidiu usar o cenário real.

**Instituições em jogo:** Presidência, Congresso (Câmara e Senado), STF, mídia, bancadas.

**Nomes reais (D-083):** atores e citações dos finais mantêm os nomes reais atuais (ex.: Faria Lima, Meta, MST; citações de figuras públicas). Risco RC-08 segue ativo, com parecer jurídico pendente.

### 1.5. Objetivo Central

**Conscientização política, não doutrinação.**

O jogo busca:
1. Mostrar que **toda escolha política tem um preço**.
2. Ensinar que **politização ≠ polarização**.
3. Fazer o jogador **sentir na pele** as consequências de decisões políticas.
4. Desmistificar mecanismos de manipulação de **ambos os lados**.
5. Promover **soberania, dignidade e consciência crítica**.
6. Ensinar, na prática, como funcionam as instituições brasileiras.

### 1.6. O Que o Jogo NÃO É

| Não é | Por quê |
| :--- | :--- |
| **Panfleto partidário** | Não defende partido, candidato ou ideologia |
| **Jogo de "ganhar"** | Não há vitória — há consequências |
| **Simulador realista** | É uma alegoria, não uma simulação |
| **Jogo de reflexo** | É um jogo de escolha, não de habilidade motora |
| **Ferramenta de doutrinação** | Apresenta os dois lados e seus custos |

---

## 2. Pilares de Design

Os 5 pilares que guiam todas as decisões de design:

| # | Pilar | Descrição |
| :--- | :--- | :--- |
| **1** | **Consequência > Escolha** | O peso está no que acontece depois, não na escolha em si. |
| **2** | **Simplicidade > Complexidade** | Um gesto controla tudo. Sem menus profundos. |
| **3** | **Vivência > Explicação** | O jogador aprende jogando, não lendo. |
| **4** | **Ambos os lados > Um lado** | Toda proposta tem custo. Não há "resposta certa". |
| **5** | **Reflexão > Resposta** | O jogo problematiza, não conclui. |

### 2.1. Aplicação dos Pilares

| Pilar | Como se manifesta |
| :--- | :--- |
| **Consequência > Escolha** | Cartas de Aprendizado só aparecem *depois* da decisão. |
| **Simplicidade > Complexidade** | 4 turnos, 8 medidores, um gesto. Sem tutorial longo. |
| **Vivência > Explicação** | O conceito vem depois da experiência (ciclo de Kolb). |
| **Ambos os lados > Um lado** | Cada carta tem duas opções legítimas, com custos. |
| **Reflexão > Resposta** | O final revela o padrão, não julga o jogador. |

---

## 3. Público-Alvo e Objetivos

### 3.1. Público

| Item | Definição |
| :--- | :--- |
| **Faixa etária** | 15 a 30 anos |
| **Perfil** | Jovens, periféricos, estudantes |
| **Contexto** | Escolas, universidades, cursinhos populares |
| **Conhecimento prévio** | Nenhum (não precisa saber política) |
| **Familiaridade com jogos** | Média a baixa |

### 3.2. Justificativa do Público

1. **Faixa etária mais afetada pela desinformação digital.**
2. **Faixa etária com maior potencial de transformação.**
3. **Faixa etária com menor familiaridade institucional.**

### 3.3. Objetivos de Aprendizagem

Ao final do jogo, o jogador deve ser capaz de:

| # | Objetivo | Como é medido |
| :--- | :--- | :--- |
| 1 | Explicar o que é um medidor de poder | Cartas de Aprendizado |
| 2 | Identificar o custo de uma escolha política | Consequências das cartas |
| 3 | Diferenciar politização de polarização | Eixo ideológico final |
| 4 | Reconhecer técnicas de manipulação | Modo Influenciador |
| 5 | Entender o funcionamento do Congresso | Modo Congresso |
| 6 | Entender o orçamento público | Modo Orçamento |
| 7 | Refletir sobre o próprio espectro político | Gráfico final |

### 3.4. Fundamentação Pedagógica

| Teoria | Aplicação |
| :--- | :--- |
| **Pedagogia da Libertação (Freire)** | Educação dialógica, não bancária |
| **Aprendizagem Experiencial (Kolb)** | Ciclo: experiência → reflexão → conceito → ação |
| **Teoria do Flow (Csikszentmihalyi)** | Dificuldade progressiva compatível com habilidade |
| **Zona de Desenvolvimento Proximal (Vygotsky)** | Desafios progressivos, mas alcançáveis |
| **Scaffolding (Wood, Bruner, Ross)** | Suporte gradualmente removido |

---

## 4. Core Loop

### 4.1. Diagrama do Core Loop

```
┌─────────────────────────────────────────────────────────────┐
│                       CORE LOOP                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌──────────────┐                                          │
│   │  CARTA       │                                          │
│   │  (Problema)  │                                          │
│   └──────┬───────┘                                          │
│          │                                                  │
│          ▼                                                  │
│   ┌──────────────┐                                          │
│   │  ESCOLHA     │◄──── Swipe esquerda ou direita           │
│   │  (Swipe)     │                                          │
│   └──────┬───────┘                                          │
│          │                                                  │
│          ▼                                                  │
│   ┌──────────────┐                                          │
│   │  EFEITOS     │◄──── Medidores mudam                     │
│   │  (Medidores) │                                          │
│   └──────┬───────┘                                          │
│          │                                                  │
│          ▼                                                  │
│   ┌──────────────┐                                          │
│   │  CONSEQUÊNCIA│◄──── Frase curta                         │
│   └──────┬───────┘                                          │
│          │                                                  │
│          ▼                                                  │
│   ┌──────────────┐                                          │
│   │  APRENDIZADO │◄──── 5 blocos explicativos               │
│   └──────┬───────┘                                          │
│          │                                                  │
│          ▼                                                  │
│   ┌──────────────┐                                          │
│   │  PRÓXIMA     │                                          │
│   │  CARTA       │                                          │
│   └──────────────┘                                          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 4.2. Duração de Cada Etapa

Aprovada pelo PO no P-010 (doc 15 §15.02.1).

| Etapa | Duração |
| :--- | :--- |
| **Leitura da carta** | 5–8 s |
| **Arraste** | 2–3 s |
| **Efeitos + consequência** | 2–3 s |
| **Carta de Aprendizado (resumo)** | 5–8 s |
| **Total por carta** | ≈ 15–22 s |
| **Turno (6–8 cartas)** | 2–3 min |
| **Partida** | ≈ 12–18 min |

### 4.3. Loop Macro

```
Calibração → Turno 1 → Turno 2 → Turno 3 → Turno 4 → Final + Eixo
```

### 4.4. Loop de Sessão

| Sessão | Duração | O que acontece |
| :--- | :--- | :--- |
| **Sessão completa** | ~15 min | Uma partida inteira |
| **Sessão parcial** | 5–10 min | Um turno (se pausado) |

**Nota:** O jogo **não tem salvamento**. Cada partida é uma sessão completa.

---

## 5. Mecânicas Centrais

### 5.1. Mecânica de Swipe

**Descrição:** O jogador arrasta a carta para a esquerda ou direita para escolher uma das duas opções.

**Regra (D-084):** os lados existem no design, mas **o jogo nunca rotula as opções como "esquerda" ou "direita"** nem associa o lado a uma ideologia. Ao arrastar, o jogador vê apenas o texto da opção daquele lado e o que ela provoca.

| Elemento | No design (dados) | Para o jogador |
| :--- | :--- | :--- |
| **Opções** | `opcao_a` / `opcao_b`, cada uma com sua cor partidária (D-092) | O lado é sorteado a cada partida; sem rótulo |
| **Opção** | Texto + efeitos | Texto da opção, mostrado durante o arraste |
| **Espectro** | Pontos no eixo ideológico (§6.6) | Oculto até o final |

Nenhum lado é fixo como "social" ou "de mercado": o jogo sorteia o lado de cada opção. Durante o arraste, a borda mostra a cor de quem propõe a opção; não há pista sobre os medidores (doc 14 §14.05).

### 5.2. Mecânica de Medidores

**Descrição:** 8 medidores principais + 3 sub-medidores econômicos. Cada decisão afeta 2–4 medidores.

| Faixa | Valor | Significado |
| :--- | :--- | :--- |
| 🔴 Crítico | 0–20 | Risco iminente de final catastrófico |
| 🟠 Baixo | 21–40 | Situação preocupante |
| 🟡 Médio | 41–60 | Equilíbrio instável |
| 🟢 Alto | 61–80 | Situação favorável |
| 🔵 Extremo | 81–100 | Pode ser bom ou ruim |

**Regra de morte:** Se qualquer medidor chegar a **0**, o jogo termina com final catastrófico imediato, em qualquer ano (sem limiares de proteção — D-082).

### 5.3. Mecânica de Cartas

**Descrição:** Cada carta é uma unidade de decisão com:
- **Título** (5 palavras)
- **Problema** (2 linhas)
- **Duas opções** (1 linha cada)
- **Efeitos** (medidores afetados)
- **Consequência** (1 linha)
- **Carta de Aprendizado** (5 blocos)

**Composição:** 340 cartas (200 institucionais + 70 temáticas + 70 de atores).

### 5.4. Mecânica de Turnos

**Descrição:** 4 turnos, um por ano de mandato.

| Turno | Ano | Fase | Cartas |
| :--- | :--- | :--- | :--- |
| 1 | Ano 1 | Lua de Mel | 6–8 |
| 2 | Ano 2 | Realidade Bate | 6–8 |
| 3 | Ano 3 | Crise | 6–8 |
| 4 | Ano 4 | Desfecho | 6–8 |

### 5.5. Mecânica de Calibração

**Descrição:** Antes do jogo começar, o jogador responde 6 perguntas que ajustam os medidores iniciais.

| # | Pergunta | Efeito |
| :--- | :--- | :--- |
| 1 | Segurança vs. Prevenção | `Segurança` / `Dignidade` |
| 2 | EUA vs. BRICS | `Soberania` |
| 3 | Educação vs. Cortes | `Consciência` / `Caixa` |
| 4 | Mídia livre vs. Regulada | `Integridade` |
| 5 | Taxar fortunas vs. Não | `Dignidade` / `Caixa` |
| 6 | Participação vs. Não | `Legitimidade` / `Consciência` |

---

## 6. Sistemas

### 6.1. Sistema de Medidores

#### 6.1.1. Os 8 Medidores Principais

| # | Medidor | Categoria | Final se 0 | Final se 100 |
| :--- | :--- | :--- | :--- | :--- |
| 1 | **Dignidade** | Social | Barbárie | Dependência Assistencialista |
| 2 | **Consciência** | Social | Alienação Total | Revolução Permanente |
| 3 | **Soberania** | Social | Colônia | Isolacionismo Paranoico |
| 4 | **Segurança** | Social | Autogestão Popular | Estado Policial |
| 5 | **Integridade** | Social | Desintegração | Transparência Totalitária |
| 6 | **Caixa** | Poder | Paralisia Fiscal | Prosperidade Compartilhada |
| 7 | **Capital Político** | Poder | Impeachment | Governabilidade Democrática |
| 8 | **Legitimidade** | Poder | Revolta Popular | Apoio Popular Crítico |

#### 6.1.2. Os 3 Sub-medidores

| Sub-medidor | Efeito |
| :--- | :--- |
| **Desemprego** | ↑ Desemprego → ↓ `Dignidade`, ↓ `Legitimidade` |
| **Inflação** | ↑ Inflação → ↓ `Caixa`, ↓ `Dignidade` |
| **Juros** | ↑ Juros → ↓ `Caixa`, ↓ `Prosperidade` |

#### 6.1.3. Relações entre Medidores

| Medidor afetado | Afeta | Tipo | Efeito |
| :--- | :--- | :--- | :--- |
| **Dignidade** | Consciência | Cascata | < 30 → −5/turno; > 70 → +3/turno |
| **Consciência** | Legitimidade | Assimétrica | > 60 → −5/turno; < 30 → +5/turno |
| **Soberania** | Caixa | Imediata | < 30 → Caixa +10, Dignidade −5 |
| **Segurança** | Dignidade | Condicional | < 30 → Dignidade −10 |
| **Integridade** | Consciência | Multiplicadora | < 30 → efeitos negativos dobrados |
| **Caixa** | Legitimidade | Invertida | > 70 → −3/turno; < 30 → −5/turno |
| **Capital Político** | Caixa | Direta | < 30 → Caixa −10 |
| **Legitimidade** | Capital Político | Direta | < 30 → Capital Político −10 |

### 6.2. Sistema de Sorteio

#### 6.2.1. Regras (Prioridade Narrativa)

| # | Regra | Descrição |
| :--- | :--- | :--- |
| 1 | **Prioridade Narrativa** | Consequências de decisões anteriores aparecem obrigatoriamente no turno certo |
| 2 | **Prioridade de Ator** | Ator com satisfação < 30 aparece obrigatoriamente |
| 3 | **Prioridade de Medidor** | Medidor < 30 → cartas relacionadas aparecem |
| 4 | **Variedade** | Um modo não aparece duas vezes no mesmo turno |
| 5 | **Aleatoriedade Controlada** | Restante é sorteado aleatoriamente |

#### 6.2.2. Algoritmo (pseudocódigo)

```
funcao sortear_cartas(turno, medidores, atores, cartas_jogadas):
    cartas_disponiveis = filtrar(cartas_jogadas, turno)

    para evento em eventos_encadeados:
        se evento.turno == turno:
            adicionar_carta_obrigatoria(evento.carta)

    para ator em atores:
        se ator.satisfacao < 30:
            adicionar_carta_obrigatoria(ator.cartas[0])

    para medidor em medidores:
        se medidor.valor < 30:
            adicionar_carta_obrigatoria(medidor.cartas_relacionadas)

    remover_cartas_do_mesmo_modo(cartas_disponiveis)

    return sortear_aleatoriamente(cartas_disponiveis, 6-8)
```

### 6.3. Sistema de Satisfação dos Atores

| Nível | Estado | Comportamento |
| :--- | :--- | :--- |
| 0–20 | Furioso | Aparece obrigatoriamente. Pode atacar. |
| 21–40 | Insatisfeito | Alta probabilidade. Faz exigências. |
| 41–60 | Neutro | Aparece normalmente. |
| 61–80 | Satisfeito | Baixa probabilidade. Oferece bônus. |
| 81–100 | Aliado | Apoio incondicional. |

**Algoritmo:**

```
se escolha.atende_ator(ator):
    ator.satisfacao += 10
senão se escolha.contraria_ator(ator):
    ator.satisfacao -= 10
ator.satisfacao = clamp(0, 100)
```

### 6.4. Sistema de Eventos Encadeados

**Descrição:** Decisões geram consequências 1–2 turnos depois.

| Exemplo | Efeito (1 ou 2 turnos depois, definido por evento) |
| :--- | :--- |
| Cortar verba da saúde | Epidemia na periferia (`Dignidade` −15) |
| Privatizar a água | Aumento de tarifas (`Dignidade` −10) |
| Investir em educação | Cooperativa jovem (`Dignidade` +10) |

**Total:** 78 eventos mapeados. Eventos que cairiam depois do Ano 4 aparecem no epílogo do final.

### 6.5. Sistema de Impeachment

#### 6.5.1. Gatilhos

| Condição | Descrição |
| :--- | :--- |
| **Principal** | `Legitimidade` < 20 E `Capital Político` < 20 |
| **Alternativo** | 3 decisões consecutivas contra o Congresso |
| **Crise** | `Integridade` < 20 E `Consciência` < 20 |

**Ano mínimo:** Ano 2.

#### 6.5.2. Estrutura (5 cartas)

| Fase | Sobrevivência |
| :--- | :--- |
| 1. O Pedido | `Legitimidade` > 60 ou `Capital Político` > 50 |
| 2. A Comissão | `Integridade` > 60 ou `Caixa` > 60 |
| 3. A Votação | `Legitimidade` > 70 |
| 4. O Julgamento | `Consciência` > 60 |
| 5. O Desfecho | `Legitimidade` > 60 E `Consciência` > 50 |

**Se `Consciência` < 30 E `Integridade` < 30 → impeachment automático.**

### 6.6. Sistema de Eixo Ideológico

**Modelo:** 9axes adaptado para 4 eixos.

| Eixo | Extremo A | Extremo B |
| :--- | :--- | :--- |
| **Economia** | Coletivismo | Mercado |
| **Diplomacia** | Nacionalismo | Globalismo |
| **Sociedade** | Conservadorismo | Progressismo |
| **Estado** | Autoritarismo | Liberdade |

**Cálculo:** Cada escolha soma pontos em um dos extremos. No final, é gerado um gráfico de radar. Os pontos ficam nos dados da carta, nunca no lado do swipe (D-084).

### 6.7. Sistema de Calibração

**Inicial:** 6 perguntas ajustam medidores iniciais.
**Final:** Gráfico de radar + revelação suavizada.

### 6.8. Sistema de Desinformação (Modo Influenciador)

**Base:** Teoria da Inoculação (McGuire, 1964; van der Linden, 2022).

| Etapa | Descrição |
| :--- | :--- |
| **Exposição Controlada** | Jogador é exposto a narrativa manipulada |
| **Escolha** | Decide como reagir |
| **Consequência** | Aceitar → perde `Integridade` e `Consciência`; Recusar → perde `Legitimidade`; Investigar → perde `Capital Político`, ganha `Integridade` |
| **Aprendizado** | Explica a técnica |

---

## 7. Progressão e Fases

### 7.1. As 4 Fases

| Fase | Ano | Foco | Multiplicador |
| :--- | :--- | :--- | :--- |
| **Lua de Mel** | 1 | Apresentação | ×0,25 |
| **Realidade Bate** | 2 | Eventos encadeados | ×0,75 |
| **Crise** | 3 | Impeachment | ×1,0 |
| **Desfecho** | 4 | Finais | ×1,5 |

### 7.2. Mecanismos de Recuperação

| Mecanismo | Como funciona |
| :--- | :--- |
| **Carta de Recuperação** | Restaura um medidor em crise |
| **Evento de Boa Vontade** | Ator oferece ajuda sem cobrar |
| **Bônus por Equilíbrio** | Todos os medidores > 40 → +5 em todos |
| **Segunda Chance** | Medidor em 10 → escolha crítica para recuperá-lo |

---

## 8. Conteúdo

### 8.1. Cartas

| Tipo | Quantidade | Código |
| :--- | :--- | :--- |
| **Institucionais** | 200 | INST-XXX |
| **Temáticas** | 70 | THEM-XXX |
| **Atores** | 70 | ATOR-XXX |
| **Total** | **340** | — |

**Status:** 22 cartas totalmente escritas, 340 inventariadas, roteiro completo em desenvolvimento (arquivo `17`).

### 8.2. Modos Institucionais

| # | Modo | Medidor principal | Cartas |
| :--- | :--- | :--- | :--- |
| 1 | Congresso | `Capital Político` | INST-001 a INST-020 |
| 2 | Orçamento | `Dignidade` | INST-021 a INST-040 |
| 3 | Currículo e Mídia | `Consciência` | INST-041 a INST-060 |
| 4 | Geopolítico | `Soberania` | INST-061 a INST-080 |
| 5 | Prisional e Policial | `Segurança` | INST-081 a INST-100 |
| 6 | Emendas | `Caixa` | INST-101 a INST-120 |
| 7 | Bancadas | `Capital Político` | INST-121 a INST-140 |
| 8 | Impeachment | `Legitimidade` | INST-141 a INST-160 |
| 9 | Judiciário | `Consciência` / `Integridade` | INST-161 a INST-180 |
| 10 | Influenciador | `Integridade` / `Consciência` | INST-181 a INST-200 |

### 8.3. Atores

**Total:** 24 atores (14 base + 6 expansão + 4 adicionais) — D-085.

| Categoria | Atores |
| :--- | :--- |
| **Capital** | Latifundiários, Investidores da Faria Lima, Construtoras, Empresariado Industrial, Setor de Universidades Privadas, Mercado |
| **Estado** | Tecnocratas, Militares, Servidores Públicos, Diplomatas do Itamaraty, Líder da Câmara |
| **Sociedade Civil** | Pastores, Sindicato dos Professores, Profissionais da Saúde, Líder Sindical, MTST, MST, Movimentos Ambientais, Artista Engajado |
| **Mídia e Tecnologia** | Meta, Impérios Geopolíticos, Coach Digital, Jornalista Independente, Influenciador Progressista |

### 8.4. Cartas de Aprendizado

Cada carta tem uma Carta de Aprendizado com 5 blocos:

| Bloco | Conteúdo |
| :--- | :--- |
| 1 | O que você acabou de vivenciar |
| 2 | O conceito por trás |
| 3 | Dados reais |
| 4 | Fonte |
| 5 | Frase de impacto |

**Status:** 22 ligadas às cartas (17 com dados verificados e link) e 127 em rascunho no doc 18 (P-010).

### 8.5. Finais

**Total:** 26 finais em 6 categorias.

| Categoria | Qtd | Exemplos |
| :--- | :--- | :--- |
| Catástrofe | 7 | Barbárie, Alienação Total, Colônia |
| Captura | 3 | Estado Policial, Hegemonia Autoritária |
| Perda da Democracia | 5 | Golpe Militar, Autoritarismo Eleitoral |
| Extermínio | 2 | Genocídio Institucionalizado |
| Fortalecimento | 5 | República Soberana e Popular |
| Cuidado e Soberania | 4 | Fome como Escolha Política |

---

## 9. Finais e Eixo Ideológico

### 9.1. Condições de Finais (amostra)

| Final | Condição | Citação |
| :--- | :--- | :--- |
| **Barbárie** | Dignidade = 0 | Darcy Ribeiro |
| **Alienação Total** | Consciência = 0 | MV Bill |
| **Colônia** | Soberania = 0 | Milton Santos |
| **Impeachment** | Capital Político = 0 | Dilma Rousseff |
| **Revolta Popular** | Legitimidade = 0 | Inconfidência Mineira |
| **Estado Policial** | Segurança = 100 | Ditadura Militar |
| **Genocídio Institucionalizado** | Combinação | Jair Bolsonaro |
| **República Soberana e Popular** | Combinação | Leonel Brizola |
| **Fome como Escolha Política** | Combinação | Josué de Castro |

### 9.2. Eixo Ideológico

**Revelação:** Gráfico de radar com 4 eixos.

| Padrão | Revelação |
| :--- | :--- |
| Dignidade, Consciência, Soberania altos | *"Seu governo priorizou a dignidade, a educação e a soberania..."* |
| Segurança, Capital Político, Caixa altos | *"Seu governo priorizou a ordem, a estabilidade e a economia..."* |
| Equilíbrio | *"Seu governo buscou equilíbrio entre diferentes valores..."* |
| Integridade e Consciência baixos | *"Seu governo negligenciou a verdade e a educação..."* |
| Dignidade e Soberania baixos | *"Seu governo negligenciou o povo e a soberania..."* |

**Frase final:** *"O país que você construiu reflete os valores que você priorizou."*

---

## 10. UI/UX

### 10.1. Paleta de Cores

| Uso | Cor | HEX |
| :--- | :--- | :--- |
| Primária | Verde | `#2E7D32` |
| Secundária | Azul | `#1565C0` |
| Terciária | Cinza | `#37474F` |
| Alerta | Vermelho | `#C62828` |
| Destaque | Amarelo | `#F9A825` |
| Fundo | Cinza-escuro | `#263238` |
| Texto | Branco | `#FFFFFF` |

**Faixas dos medidores:** escala ciano `#0097A7` · `#00ACC1` · `#26C6DA` · `#4DD0E1` · `#80DEEA` (0-20 a 81-100; doc 14 §14.11.3). **Bordas partidárias:** contorno branco de 2-3 px.

### 10.2. Tipografia

| Uso | Fonte | Tamanho |
| :--- | :--- | :--- |
| Títulos | Poppins Bold | 24px |
| Corpo | Inter Regular | 18px padrão (16/20/24 configurável) |
| Citação | Inter Italic | 18px |

### 10.3. Telas

| Tela | Descrição |
| :--- | :--- |
| **Tela Inicial** | Título + botões (Iniciar, Config, Sobre) |
| **Calibração** | 6 perguntas, uma por tela |
| **Carta** | Barra de medidores + carta central; ao arrastar, mostra só o texto da opção daquele lado (D-084) |
| **Consequência** | Frase curta + botão continuar |
| **Carta de Aprendizado** | 5 blocos + botão continuar |
| **Impeachment** | 5 cartas sequenciais |
| **Final** | Nome do final + citação + botões |

### 10.4. Ícones

- **Medidores:** Casa (Dignidade), Livro (Consciência), Bandeira (Soberania), Escudo (Segurança), Lupa (Integridade), Moeda (Caixa), Congresso (Capital Político), Povo (Legitimidade).
- **Atores:** 24 ícones distintos (trigo, gráfico, fábrica, etc.).
- **Interface:** Play, engrenagem, info, seta, repetir, compartilhar.

### 10.5. Acessibilidade

| Recurso | Descrição |
| :--- | :--- |
| **Modo daltônico** | Padrões além de cores (pós-MVP) |
| **Tamanho de texto** | 3 tamanhos (16/20/24px; padrão 18) |
| **Leitor de tela** | Descrições de áudio |
| **Alto contraste** | Modo para baixa visão |
| **Navegação por teclado** | Suporte a teclado |

---

## 11. Direção de Arte e Áudio

### 11.1. Direção de Arte

| Elemento | Definição |
| :--- | :--- |
| **Estilo** | Minimalista, vetorial, geométrico |
| **Paleta** | Verde, azul, cinza (principal); vermelho, amarelo (secundária) |
| **Cartas** | Fundo escuro, texto branco, borda colorida |
| **Ícones** | Font Awesome ou similar (CC0) |
| **Animações** | Swipe + feedback visual + transições suaves |

### 11.2. Restrição Fundamental

**Não será usada IA generativa para arte, música ou assets.**

**Justificativa:**
1. **Ética** — respeitar o trabalho de artistas humanos.
2. **Qualidade** — assets CC0 de qualidade disponíveis.
3. **Consistência** — assets públicos têm estilo coeso.

### 11.3. Fontes de Assets

| Categoria | Fontes |
| :--- | :--- |
| **Ícones** | Kenney, OpenGameArt |
| **Fontes** | Google Fonts (Poppins, Inter) |
| **Música** | FreeMusicArchive, Freesound |
| **Efeitos** | Freesound, GameSounds.xyz |
| **Texturas** | BurningWell, OpenClipArt |

### 11.4. Direção de Áudio

| Elemento | Definição |
| :--- | :--- |
| **Música** | Ambiente discreto, tenso em momentos-chave |
| **Efeitos** | Swipe, impacto, alerta, celebração |
| **Voz** | Nenhuma (texto apenas) |
| **Mixagem** | Música baixa, efeitos médios |

---

## 12. Arquitetura Técnica

### 12.1. Stack

| Camada | Componente | Função |
| :--- | :--- | :--- |
| **Engine** | Godot 4.7 | Motor, editor, exportação |
| **Protocolo** | MCP | Ponte entre agente de IA e editor |
| **Agente** | Claude Code | Escrita de código, cenas, testes |

### 12.2. Estrutura de Dados

**Cartas, medidores, atores, finais e eventos** são armazenados em **Resources** (`.tres`) ou **JSON**.

#### Exemplo de carta (JSON):

```json
{
  "id": "INST-001",
  "titulo": "Privatização da estatal",
  "modo": "Congresso",
  "tipo": "Institucional",
  "problema": "...",
  "opcao_a": {
    "texto": "...",
    "cor": "vermelho",
    "custo": { "Capital Político": -10 },
    "efeitos": { "Soberania": 10 },
    "consequencia": "..."
  },
  "opcao_b": { ... },
  "aprendizado_id": "APR-001",
  "pre_requisitos": { ... },
  "eventos_encadeados": [ ... ]
}
```

`opcao_a` / `opcao_b` são chaves internas; o jogo sorteia o lado de cada uma e nunca escreve "esquerda/direita" (D-084). Cada opção tem sua cor (D-092); o texto da Carta de Aprendizado fica no doc 18 (D-090). Esquema completo: doc 13 §13.3.

### 12.3. Estrutura de Pastas

```
o-planalto/
├── assets/
├── dados/          # JSON/Resources
├── cenas/          # .tscn
├── scripts/        # .gd
├── addons/         # MCP
├── docs/           # Documentação
├── gdd/            # GDD mestre (fora do site)
└── gestao/         # Docs vivos
```

### 12.4. Fluxo de Desenvolvimento

```
Godot 4.7 + MCP + Claude Code
    ↓
Agente cria cenas, scripts, testa
    ↓
Desenvolvedor revisa e valida
    ↓
Exportação: Web, Android, Windows
```

---

## 13. Balanceamento

### 13.1. Valores Iniciais

| Medidor | Valor |
| :--- | :--- |
| Dignidade | 45 |
| Consciência | 35 |
| Soberania | 40 |
| Segurança | 50 |
| Integridade | 40 |
| Caixa | 55 |
| Capital Político | 50 |
| Legitimidade | 55 |
| **Total** | **380** |

### 13.2. Multiplicador de Dificuldade

| Ano | Multiplicador |
| :--- | :--- |
| 1 | ×0,25 |
| 2 | ×0,75 |
| 3 | ×1,0 |
| 4 | ×1,5 |

### 13.3. Princípios de Balanceamento

Não há limiares de proteção por ano (D-082). A suavização da dificuldade vem do multiplicador (§13.2) e dos mecanismos de recuperação (§7.2).

1. **Menos punitivo** — o erro deve ser informativo, não frustrante.
2. **Flow** — dificuldade compatível com habilidade.
3. **Reforço positivo** — boas escolhas são recompensadas.
4. **Consequência clara** — o jogador entende o que causou o quê.

---

## 14. Localização e Acessibilidade

### 14.1. Localização

| Idioma | Status |
| :--- | :--- |
| Português (Brasil) | Principal |
| Inglês | Futuro |
| Espanhol | Futuro |

### 14.2. Acessibilidade

| Recurso | Status |
| :--- | :--- |
| Modo daltônico | Planejado |
| Tamanho de texto | Planejado |
| Leitor de tela | Planejado |
| Alto contraste | Planejado |
| Navegação por teclado | Planejado |

### 14.3. Avisos de Conteúdo

| Aviso | Onde |
| :--- | :--- |
| Genocídio | Tela inicial |
| Tortura | Tela inicial |
| Violência policial | Tela inicial |
| Linguagem direta | Tela inicial |

---

## 15. Produção

### 15.1. Equipe

| Membro | Função |
| :--- | :--- |
| **Mateus** | Idealizador, programação, documentação |
| **Vini** | A definir |
| **Professor interlocutor** | Validação pedagógica |
| **Professor Alisson** | Revisão crítica |

### 15.2. Cronograma

| Etapa | Prazo | Status |
| :--- | :--- | :--- |
| Documentação (00-13) | Out/2026 | ✅ |
| Arquivos 14-18 | Out–Nov/2026 | ⏳ |
| GDD Completo | Nov/2026 | ⏳ Rascunho 1.1 (este documento) |
| Protótipo Técnico | Nov/2026 (6-7 dias) | ⏳ |
| Testes (3-5 pessoas) | Nov/2026 | ⏳ |
| Validação Educador | Nov/2026 | ⏳ |
| Publicação | Dez/2026 | ⏳ |

### 15.3. Riscos Principais

| ID | Risco | Mitigação |
| :--- | :--- | :--- |
| RP-07 | Cartas inconsistentes | Guia de estilo + validação |
| RC-01 | Conteúdo doutrinário | Revisão ética |
| RC-02 | Dados desatualizados | Validação com fontes 2026 |
| RC-08 | Nomes reais mantidos (D-083) | Aviso de conteúdo (D-075); parecer jurídico pendente |
| RT-01 | Godot 4.7 + MCP inexperiente | Seguir fluxo documentado |

### 15.4. Próximos Passos

1. Resolver as pendências da §16.4.
2. Completar roteiro das 340 cartas (`17`).
3. Completar roteiro das 340 Cartas de Aprendizado (`18`).
4. Montar protótipo técnico em Godot 4.7.
5. Testar com 3-5 pessoas.
6. Validar com educador.
7. Publicar e divulgar.

---

## 16. Anexos

### 16.1. Glossário Rápido

| Termo | Definição |
| :--- | :--- |
| **Medidor** | Indicador de estado do país |
| **Carta** | Unidade de decisão |
| **Carta de Aprendizado** | Card explicativo pós-decisão |
| **Turno** | Ano de mandato |
| **Fase** | Período do jogo (Lua de Mel, etc.) |
| **Ator** | Personagem que interage com o jogador |
| **Evento Encadeado** | Consequência de longo prazo |
| **Eixo Ideológico** | Espectro de valores do jogador |

### 16.2. Referências Principais

**Design de Jogos:**
- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- ICON GAMES. *Senhor Presidente*. 2016.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play*. MIT Press, 2003.
- SCHELL, Jesse. *The Art of Game Design*. CRC Press, 2008.

**Pedagogia:**
- FREIRE, Paulo. *Pedagogia do Oprimido*. 1968.
- KOLB, David. *Experiential Learning*. 1984.
- CSIKSZENTMIHALYI, Mihaly. *Flow*. 1990.
- VYGOTSKY, Lev. *A Formação Social da Mente*. 1984.

**Teoria do Brasil:**
- RIBEIRO, Darcy. *O Povo Brasileiro*. 1995.
- CASTRO, Josué de. *Geografia da Fome*. 1946.
- SANTOS, Milton. *O Espaço do Cidadão*. 1987.

**Ciência Política:**
- BOBBIO, Norberto. *Direita e Esquerda*. 1995.
- Revista Acervo (Arquivo Nacional). *Os sentidos do golpe*. 2025.

### 16.3. Documentos Relacionados

| Arquivo | Descrição |
| :--- | :--- |
| `00_INDICE_GERAL.md` | Índice geral |
| `01_CONTEXTO_E_MOTIVACAO.md` | Origem e motivação |
| `02_IDENTIDADE_E_NOMENCLATURA.md` | Nome e identidade visual |
| `03_PESQUISAS_E_ESTUDOS.md` | 20 pesquisas temáticas |
| `04_DESIGN_DO_JOGO.md` | Medidores, turnos, modos, atores |
| `05_SISTEMAS_E_MECANICAS.md` | Sistemas detalhados |
| `06_REFERENCIAS_E_INSPIRACOES.md` | Referências externas |
| `07_HISTORICO_DE_DECISOES.md` | Decisões e correções |
| `08_PRODUCAO_E_PROXIMOS_PASSOS.md` | Produção |
| `09_GLOSSARIO.md` | Termos |
| `10_GUIA_DE_ESTILO_E_TOM.md` | Regras de escrita |
| `11_FICHAS_DOS_ATORES.md` | 24 atores |
| `12_FICHAS_DOS_MODOS.md` | 10 modos |
| `13_ARQUITETURA_TECNICA.md` | Stack e estrutura de dados |
| `14_UI_UX_DESIGN.md` | Telas e HUD |
| `15_FLUXO_DO_JOGO.md` | Fluxo completo |
| `16_MANUAL_DO_JOGADOR.md` | Guia do jogador |
| `17_ROTEIRO_DAS_CARTAS.md` | 340 cartas |
| `18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md` | 340 Cartas de Aprendizado |

### 16.4. Pendências Conhecidas

Levantadas na revisão de 2026-10-13. Cada item vira decisão do PO ou GDD de sistema.

| ID | Pendência | Seção |
| :--- | :--- | :--- |
| P-1 | Dois impeachments: final instantâneo (`Capital Político` = 0) e sistema de 5 cartas — falta prioridade | §6.5, §9.1 |
| P-2 | ✅ Resolvida: partida de ~15 min (D-088) | §1.1, §4.2 |
| P-3 | Medidor em 0 encerra na hora (D-089). Pendentes: desempate entre finais, dois medidores zerando no mesmo swipe, final por medidor em 100, final quando nenhuma condição é atendida | §9 |
| P-4 | Cartas obrigatórias podem passar de 8 por turno; "remover do mesmo modo" ambíguo | §6.2.2 |
| P-5 | Font Awesome Free não é CC0 (ícones CC BY 4.0); Freesound/FMA misturam licenças | §11.1, §11.3 |
| P-6 | `Prosperidade` citada como medidor, mas é nome de final | §6.1.2 |
| P-7 | MCP listado em `addons/` do jogo, mas é ferramenta de desenvolvimento; Godot instalado 4.6 (RT-08) | §12 |
| P-8 | Fórmulas: multiplicador vale para todos os efeitos ou só negativos? Ordem das relações por turno? Frequência do bônus por equilíbrio? | §6.1.3, §7.2, §13.2 |
| P-9 | Eixo ideológico: como cada escolha pontua os 4 eixos; revelação usa medidores, não eixos | §6.6, §9.2 |
| P-10 | Atores: satisfação inicial; critério de "atende/contraria" | §6.3 |
| P-11 | Calibração: valores por resposta; revisão PSI da pergunta "EUA vs. BRICS" | §5.5 |
| P-12 | "Sessão parcial (se pausado)" × sem salvamento; risco no mobile | §4.4 |
| P-13 | ✅ Resolvida: 22 cartas escritas; 22 Cartas de Aprendizado ligadas e 127 em rascunho (P-010) | §8.1, §8.4 |
| P-14 | Faltam casos-limite, parâmetros de ajuste e critérios de aceite testáveis | todo |

### 16.5. Controle de Versões

| Versão | Data | Mudanças |
| :--- | :--- | :--- |
| 0.1 | Out/2026 | Estrutura inicial |
| 1.0 | Out/2026 | Consolidação completa |
| 1.2 | 2026-10-14 | P-010: cenário Brasil e jogador Presidente (D-086/087); ~15 min (D-088); fim imediato (D-089); Aprendizado no doc 18 (D-090); dados verificados (D-091); cor por opção e lado sorteado (D-092); paleta das faixas e tamanhos de texto (doc 14) |
| 1.1 | 2026-10-13 | Salvo em `gdd/` como rascunho mestre (D-081); limiares de proteção removidos (D-082); nomes reais mantidos (D-083); swipe sem rótulo "esquerda/direita" (D-084); 24 atores (D-085); pendências em §16.4 |

---

**Última atualização:** 2026-10-14
**Versão:** 1.2
**Status:** Rascunho
