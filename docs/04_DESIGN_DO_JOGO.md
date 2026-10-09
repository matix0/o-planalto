# 04 — Design do Jogo

**Documento de Design do Jogo "O Planalto"**

Este documento define o design completo do jogo, incluindo a premissa, os medidores, a estrutura de turnos, os modos institucionais, os atores políticos, o sistema de cartas, as Cartas de Aprendizado e os finais. Cada seção apresenta a fundamentação teórica e pedagógica que embasa as decisões de design.

---

## 04.01 — Visão Geral e Premissa

### 04.01.1. Identidade do Jogo

| Item | Definição |
| :--- | :--- |
| **Nome** | O Planalto |
| **Gênero** | Jogo educativo de conscientização política |
| **Mecânica central** | Arrastar cartas para esquerda ou direita |
| **Inspiração principal** | *Reigns* (Nerial, 2016) |
| **Inspiração secundária** | *Senhor Presidente* (Icon Games, 2016) |
| **Público-alvo** | Jovens de 15 a 30 anos, periféricos e estudantes |
| **Duração** | 30-40 minutos |
| **Plataformas** | Mobile, Web e PC |
| **Stack** | Godot 4.7 + MCP + Agentes de IA |
| **Salvamento** | Sem salvamento de progresso |
| **Classificação etária** | Livre |
| **Idioma** | Português (Brasil) |

### 04.01.2. Premissa

O jogador assume o papel de **governante de uma cidade-estado fictícia** chamada **Vila Nova** (ou **Aurora**). Durante **4 anos de mandato**, ele precisa tomar decisões que afetam a vida da população, equilibrando forças políticas, econômicas e sociais.

O jogo não busca doutrinar. Busca **conscientizar**: mostrar que toda escolha política tem um preço, e que **politização ≠ polarização**.

> *"Você decide. Mas alguém vai pagar a conta."*

### 04.01.3. Objetivo Central

**Conscientização política, não doutrinação.**

O jogo busca:

1. Mostrar que **toda escolha política tem um preço**.
2. Ensinar que **politização ≠ polarização**.
3. Fazer o jogador **sentir na pele** as consequências de decisões políticas.
4. Desmistificar os mecanismos de manipulação de **ambos os lados**.
5. Promover a **soberania nacional**, a **dignidade** e a **consciência crítica**.
6. Ensinar, de forma prática, como funcionam as instituições brasileiras: Congresso, STF, orçamento público, mídia, bancadas.

### 04.01.4. Cenário Fictício

A escolha por uma **cidade-estado fictícia** se justifica por três razões:

| Razão | Descrição |
| :--- | :--- |
| **Evita polarização** | Sem nomes reais, o jogador não se sente atacado. |
| **Permite alegorias** | É possível falar de privatização da Eletrobras sem citar a Eletrobras. |
| **Protege o jogo juridicamente** | Sem nomes reais, não há risco de processos. |

**Elementos do cenário:**

- **Nome:** Vila Nova (ou Aurora)
- **População:** Fictícia, mas com problemas reais (desigualdade, violência, desemprego)
- **Economia:** Mista (indústria, agronegócio, serviços)
- **Território:** Centro urbano, periferia, zona rural, área estratégica
- **Instituições:** Congresso, Judiciário, mídia, bancadas

### 04.01.5. Fundamentação Teórica

O design do jogo é baseado em três pilares pedagógicos:

**1. Pedagogia da Libertação (Paulo Freire)**

> "A educação não transforma o mundo. Educação muda as pessoas. Pessoas transformam o mundo." — Paulo Freire

O jogo não ensina por transmissão de conteúdo (educação bancária), mas por **experiência dialógica**. O jogador não decora conceitos; ele os **vivencia** e reflete sobre eles.

**2. Teoria da Aprendizagem Experiencial (David Kolb)**

O ciclo de Kolb é aplicado em cada decisão:

| Etapa | O que acontece |
| :--- | :--- |
| **Experiência Concreta** | O jogador arrasta a carta |
| **Observação Reflexiva** | Ele vê a consequência |
| **Conceituação Abstrata** | Ele lê a Carta de Aprendizado |
| **Experimentação Ativa** | Ele aplica o que aprendeu na próxima decisão |

**3. Teoria do Flow (Mihaly Csikszentmihalyi)**

A curva de dificuldade progressiva (Lua de Mel → Realidade Bate → Crise → Desfecho) mantém o jogador no "canal de fluxo", onde o desafio é compatível com a habilidade.

### 04.01.6. Referências

- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.
- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.
- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- ICON GAMES. *Senhor Presidente*. 2016.

---

## 04.02 — Medidores

### 04.02.1. Visão Geral

O jogo possui **8 medidores principais** e **3 sub-medidores econômicos**. Cada medidor representa uma dimensão da luta política.

### 04.02.2. Os 8 Medidores Principais

| # | Medidor | Categoria | O que mede | Final se chegar a 0 | Final se chegar a 100 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **Dignidade** | Indicador Social | Acesso a direitos básicos: saúde, educação, moradia, alimentação, lazer | Barbárie | Dependência Assistencialista |
| 2 | **Consciência** | Indicador Social | Politização, pensamento crítico, educação, acesso à informação | Alienação Total | Revolução Permanente |
| 3 | **Soberania** | Indicador Social | Autonomia nacional: controle de recursos, independência geopolítica, BRICS | Colônia | Isolacionismo Paranoico |
| 4 | **Segurança** | Indicador Social | Percepção de proteção e ordem, mas também segurança humana | Autogestão Popular | Estado Policial |
| 5 | **Verdade** | Indicador Social | Integridade do debate público, confiança nas instituições, resistência à desinformação | Pós-Verdade Total | Transparência Totalitária |
| 6 | **Caixa** | Recurso de Poder | Dinheiro disponível para investir | Paralisia Fiscal | Prosperidade Compartilhada |
| 7 | **Capital Político** | Recurso de Poder | Apoio no Congresso, capacidade de aprovar leis | Impeachment | Governabilidade Democrática |
| 8 | **Legitimidade** | Recurso de Poder | Apoio popular direto, confiança da população | Revolta Popular | Apoio Popular Crítico |

### 04.02.3. Os 3 Sub-medidores Econômicos

| # | Sub-medidor | O que mede | Efeito |
| :--- | :--- | :--- | :--- |
| 1 | **Desemprego** | Taxa de desocupação | Quanto maior, menor a `Dignidade` e a `Legitimidade`. |
| 2 | **Inflação** | Aumento generalizado dos preços | Quanto maior, menor o `Caixa` e a `Dignidade`. |
| 3 | **Juros** | Taxa de juros da dívida pública | Quanto maior, menor o `Caixa` e a `Prosperidade`. |

### 04.02.4. Valores Iniciais

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

**Justificativa:** O jogador começa com uma situação difícil, mas não impossível. Há margem para errar e aprender.

### 04.02.5. Faixas de Risco

| Faixa | Cor | Valor | Significado |
| :--- | :--- | :--- | :--- |
| **Crítico** | 🔴 Vermelho | 0-20 | Risco iminente de final catastrófico. |
| **Baixo** | 🟠 Laranja | 21-40 | Situação preocupante. |
| **Médio** | 🟡 Amarelo | 41-60 | Equilíbrio instável. |
| **Alto** | 🟢 Verde | 61-80 | Situação favorável. |
| **Extremo** | 🔵 Azul | 81-100 | Pode ser bom ou ruim, dependendo do medidor. |

### 04.02.6. Revisão dos Medidores Cheios (Ambíguos)

**Comentário do Professor Alisson:** *"O extremos devem ser ruins, certo? Aqui seria válido destacar que o excesso de dinheiro disponível não é obrigatoriamente uma vantagem. Dinheiro deve ser investido para melhorar a vida do povo."*

| Medidor | Cheio (100) | Ambiguidade |
| :--- | :--- | :--- |
| **Caixa** | Prosperidade Compartilhada | **Ambíguo:** dinheiro guardado sem investimento é ruim. |
| **Capital Político** | Governabilidade Democrática | **Ambíguo:** só existe 100% de apoio do Congresso para quem se corrompeu com o Centrão. |
| **Legitimidade** | Apoio Popular Crítico | **Ambíguo:** apoio popular sem crítica é fanatismo. |
| **Segurança** | Estado Policial | **Negativo:** ordem total é repressão. |
| **Verdade** | Transparência Totalitária | **Negativo:** transparência total é vigilância. |

### 04.02.7. Relações entre Medidores

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

### 04.02.8. Cadeias de Consequências

| Cadeia | Descrição |
| :--- | :--- |
| **Cadeia da Barbárie** | Dignidade cai → Consciência cai → Legitimidade sobe → Capital Político sobe → Soberania cai. |
| **Cadeia da Revolta** | Dignidade cai → Consciência sobe → Legitimidade cai → Capital Político cai → Impeachment. |
| **Cadeia da Dependência** | Soberania cai → Caixa sobe → Dignidade cai → Consciência cai → Verdade cai → Pós-Verdade. |
| **Cadeia da Resistência** | Consciência sobe → Verdade sobe → Dignidade sobe → Soberania sobe → Legitimidade sobe → República Soberana. |

### 04.02.9. Efeitos Não-Lineares (Limiares)

| Limiar | Efeito |
| :--- | :--- |
| **Verdade < 20** | Todos os outros medidores perdem 1 ponto por turno. |
| **Consciência < 15** | O povo não reage a nenhuma crise. |
| **Soberania < 15** | O país se torna um protetorado. |
| **Legitimidade > 90** | O povo idolatra o governante. Consciência -10 por turno. |

### 04.02.10. Fundamentação Teórica

A escolha por **8 medidores + 3 sub-medidores** se baseia em:

1. **Teoria dos Sistemas Complexos** — jogos sérios funcionam melhor quando múltiplas variáveis interagem.
2. **Design de *Reigns*** — o jogo original usa 4 medidores; o nosso expande para 8 para cobrir mais dimensões.
3. **Cobertura temática** — cada medidor cobre uma dimensão da luta política.

> "Os jogos sérios devem simular a complexidade dos sistemas políticos e a tomada de decisão ética." — Design de jogos sérios

### 04.02.11. Referências

- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.
- ALLIOT, François. *Reigns: Design Philosophy*. 2016.

---

## 04.03 — Turnos e Progressão

### 04.03.1. Estrutura de Turnos

O jogo é dividido em **4 turnos**, cada um representando **1 ano de mandato**.

| Turno | Ano | Fase | Foco | Cartas |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Ano 1 | Lua de Mel | Apresentação dos medidores e atores | 6-8 |
| 2 | Ano 2 | A Realidade Bate | Eventos encadeados, pressão dos atores | 6-8 |
| 3 | Ano 3 | A Crise | Impeachment pode ser acionado | 6-8 |
| 4 | Ano 4 | O Desfecho | Finais se definem, eixo ideológico revelado | 6-8 |

**Total de cartas jogadas:** 24-32.

### 04.03.2. Fases do Jogo

**Ano 1 — Lua de Mel**

- Medidores começam em valores médios.
- Consequências são leves (multiplicador ×0.25).
- Atores se apresentam.
- Limiar de proteção: 30 (nenhum medidor cai abaixo de 30).

**Ano 2 — A Realidade Bate**

- Medidores começam a cair.
- Eventos encadeados do Ano 1 aparecem.
- Multiplicador: ×0.75.
- Limiar de proteção: 20.

**Ano 3 — A Crise**

- Medidores estão baixos.
- Impeachment pode ser acionado.
- Multiplicador: ×1.0.
- Limiar de proteção: 10.

**Ano 4 — O Desfecho**

- Medidores definem o final.
- Eixo ideológico é revelado.
- Multiplicador: ×1.5.
- Limiar de proteção: 0 (sem proteção).

### 04.03.3. Multiplicador de Dificuldade

| Ano | Multiplicador | Justificativa |
| :--- | :--- | :--- |
| Ano 1 | ×0.25 | Lua de Mel: consequências muito leves |
| Ano 2 | ×0.75 | Realidade Bate: consequências moderadas |
| Ano 3 | ×1.0 | Crise: consequências normais |
| Ano 4 | ×1.5 | Desfecho: consequências graves |

### 04.03.4. Limiares de Proteção

| Ano | Limite Mínimo | O que Acontece |
| :--- | :--- | :--- |
| Ano 1 | 30 | Nenhum medidor cai abaixo de 30 |
| Ano 2 | 20 | Nenhum medidor cai abaixo de 20 |
| Ano 3 | 10 | Nenhum medidor cai abaixo de 10 |
| Ano 4 | 0 | Sem proteção |

### 04.03.5. Mecanismos de Recuperação

| Mecanismo | Como Funciona |
| :--- | :--- |
| **Carta de Recuperação** | Restaura um medidor em crise |
| **Evento de Boa Vontade** | Ator oferece ajuda sem cobrar |
| **Bônus por Equilíbrio** | Se todos os medidores > 40, ganha +5 em todos |
| **Segunda Chance** | Se um medidor chega a 10, oferece escolha crítica para recuperá-lo |

### 04.03.6. Sorteio (Prioridade Narrativa)

| Regra | Descrição |
| :--- | :--- |
| **1. Prioridade Narrativa** | Se uma decisão anterior gerou uma consequência, a carta da consequência aparece obrigatoriamente no turno correto. |
| **2. Prioridade de Ator** | Se um ator está insatisfeito (satisfação < 30), ele aparece obrigatoriamente no próximo turno. |
| **3. Prioridade de Medidor** | Se um medidor está < 30, cartas relacionadas a ele aparecem obrigatoriamente no próximo turno. |
| **4. Variedade** | Se um modo já apareceu no turno, ele não aparece de novo no mesmo turno. |
| **5. Aleatoriedade Controlada** | As cartas restantes são sorteadas aleatoriamente, mas com peso igual. |

### 04.03.7. Fundamentação Teórica

A progressão em **4 fases** é baseada em:

1. **Teoria do Flow (Csikszentmihalyi)** — a dificuldade aumenta gradualmente.
2. **Scaffolding (Wood, Bruner e Ross)** — cada fase fornece o suporte necessário para a próxima.
3. **Zona de Desenvolvimento Proximal (Vygotsky)** — os desafios são progressivos, mas alcançáveis.
4. **Aprendizagem Experiencial (Kolb)** — o ciclo de aprendizagem é aplicado em cada turno.

### 04.03.8. Referências

- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.
- VYGOTSKY, Lev. *A Formação Social da Mente*. São Paulo: Martins Fontes, 1984.
- WOOD, David; BRUNER, Jerome; ROSS, Gail. *The Role of Tutoring in Problem Solving*. Journal of Child Psychology and Psychiatry, 1976.

---

## 04.04 — Modos Institucionais

### 04.04.1. Visão Geral

O jogo possui **10 modos institucionais**, cada um ensinando um mecanismo diferente do sistema político brasileiro.

| # | Modo | Medidor Principal | O que ensina |
| :--- | :--- | :--- | :--- |
| 1 | **Congresso** | Capital Político | Bicameralismo, comissões, relatores, barganha |
| 2 | **Orçamento** | Dignidade | Teto de gastos, dívida pública, emendas |
| 3 | **Currículo e Mídia** | Consciência | BNCC, concessões de TV, censura |
| 4 | **Geopolítico** | Soberania | BRICS, desdolarização, dependência externa |
| 5 | **Prisional e Policial** | Segurança / Dignidade | Encarceramento em massa, política de drogas |
| 6 | **Emendas** | Caixa | Presidencialismo de coalizão, moeda de troca |
| 7 | **Bancadas** | Capital Político | BBB (Boi, Bíblia, Bala), bancadas de direitos |
| 8 | **Impeachment** | Legitimidade | Processo, quórum, golpe institucional |
| 9 | **Judiciário** | Consciência / Verdade | Venda de sentenças, blindagem, suspeição |
| 10 | **Influenciador / Desinformação** | Verdade / Consciência | Fake news, deepfakes, bets |

### 04.04.2. Fundamentação Teórica

Cada modo é uma **unidade de aprendizagem autônoma** que ensina um mecanismo institucional específico. A escolha por 10 modos se baseia em:

1. **Cobertura temática** — os modos cobrem todas as instituições discutidas no projeto.
2. **Progressão narrativa** — os modos aparecem conforme o contexto do jogo.
3. **Variedade** — a cada turno, o jogador é exposto a um modo diferente.

---

## 04.05 — Atores Políticos

### 04.05.1. Visão Geral

O jogo possui **20 atores**, divididos em **14 base** e **6 de expansão**. Cada ator é uma caricatura de um tipo social brasileiro.

### 04.05.2. Atores Base (14)

| # | Ator | Arquétipo | Oferece | Cobra | Preço (Medidores) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **Coronel** | Senhor de engenho, chefe local | Capital Político | Autonomia e impunidade | -Dignidade, -Verdade |
| 2 | **Tecnocrata** | Planejador militar, economista | Caixa, Capital Político | Cortes sociais e privatizações | -Dignidade, -Soberania |
| 3 | **Populista** | Líder carismático e messiânico | Legitimidade | Lealdade absoluta | -Consciência, -Capital Político |
| 4 | **Miliciano** | Policial-bandido, senhor do território | Segurança (superficial) | Impunidade e controle econômico | -Dignidade, -Verdade, -Soberania |
| 5 | **Pastor** | Imperador midiático da fé | Legitimidade, Capital Político | Censura e controle ideológico | -Consciência, -Verdade |
| 6 | **Banqueiro/Ruralista** | Capital financeiro e agronegócio | Caixa, acesso a mercados | Privatizações e desregulamentação | -Dignidade, -Soberania |
| 7 | **Professor** | Educador libertador e sucateado | Consciência, Legitimidade | Investimento e liberdade de cátedra | +Consciência, -Capital Político |
| 8 | **Médico do SUS** | Sanitarista e resistência | Dignidade, Legitimidade | Investimento e fim do teto | +Dignidade, -Caixa |
| 9 | **Coach Digital** | Novo pastor da prosperidade | Legitimidade, Capital Político | Desregulamentação e isenções | -Consciência, -Verdade |
| 10 | **Jornalista Independente** | Imprensa alternativa e resistência | Verdade, Consciência | Liberdade de imprensa e proteção | +Verdade, -Capital Político |
| 11 | **Artista Engajado** | Cultura como trincheira | Consciência, Paixão Nacional | Financiamento e liberdade de criação | +Consciência, -Capital Político |
| 12 | **Burocrata** | Servidor público de carreira | Caixa, Capital Político | Estabilidade e aumento salarial | +Caixa, -Dignidade (se acomodar) |
| 13 | **Empresário da Saúde** | Dono de hospitais e planos | Caixa, Capital Político | Privatização do SUS | -Dignidade |
| 14 | **Reitor Privatista** | Financeirização do ensino | Caixa, Capital Político | Cortes na educação pública | -Consciência, -Dignidade |

### 04.05.3. Atores de Expansão (6)

| # | Ator | Oferece | Cobra | Preço |
| :--- | :--- | :--- | :--- | :--- |
| 15 | **Sindicalista** | Legitimidade, Consciência | Direitos trabalhistas | +Legitimidade, -Caixa |
| 16 | **Estudante** | Consciência, Legitimidade | Educação, liberdade | +Consciência, -Capital Político |
| 17 | **Ambientalista** | Soberania, Dignidade | Proteção ambiental | +Soberania, -Caixa |
| 18 | **Indígena** | Soberania, Consciência | Demarcação de terras | +Soberania, -Capital Político |
| 19 | **Quilombola** | Dignidade, Consciência | Titulação de terras | +Dignidade, -Capital Político |
| 20 | **Influenciador Progressista** | Consciência, Verdade | Apoio nas redes | +Consciência, -Capital Político |

### 04.05.4. Sistema de Satisfação

| Nível | Estado | O que Acontece |
| :--- | :--- | :--- |
| 0-20 | Furioso | Aparece obrigatoriamente. Pode atacar o governo. |
| 21-40 | Insatisfeito | Aparece com alta probabilidade. Pode fazer exigências. |
| 41-60 | Neutro | Aparece normalmente. |
| 61-80 | Satisfeito | Aparece com baixa probabilidade. Pode oferecer bônus. |
| 81-100 | Aliado | Aparece apenas se necessário. Oferece apoio incondicional. |

### 04.05.5. Fundamentação Teórica

Cada ator é uma **caricatura de um tipo social brasileiro** que se repete ao longo da história:

| Ator | Herança Histórica |
| :--- | :--- |
| Coronel | Senhor de engenho, coronel da Guarda Nacional |
| Tecnocrata | Planejador militar, economista da ditadura |
| Populista | Líder carismático, messiânico |
| Miliciano | Capitão do mato, policial-bandido |
| Pastor | Igreja colonial, poder religioso |
| Banqueiro/Ruralista | Barões do café, capital financeiro |
| Professor | Paulo Freire, educador libertador |
| Médico do SUS | Sanitarista, Reforma Sanitária |
| Coach Digital | Novo pastor da prosperidade |
| Jornalista Independente | Imprensa alternativa, Pasquim |
| Artista Engajado | Tropicália, Chico Buarque |
| Burocrata | Servidor público de carreira |
| Empresário da Saúde | Mercantilização da saúde |
| Reitor Privatista | Financeirização do ensino |

### 04.05.6. Referências

- CAMPBELL, Joseph. *The Hero with a Thousand Faces*. New York: Pantheon, 1949.
- PROPP, Vladimir. *Morphology of the Folktale*. Austin: University of Texas Press, 1968.
- RIBEIRO, Darcy. *O Povo Brasileiro*. São Paulo: Companhia das Letras, 1995.

---

## 04.06 — Sistema de Cartas

### 04.06.1. Composição do Baralho

| Tipo de Carta | Quantidade | Código |
| :--- | :--- | :--- |
| **Institucionais** | 200 (10 modos × 20) | INST-XXX |
| **Temáticas** | 70 (7 temas × 10) | THEM-XXX |
| **Atores** | 70 (14 atores × 5) | ATOR-XXX |
| **Total** | **340** | — |

### 04.06.2. Estrutura de Cada Carta

```
┌─────────────────────────────────────────┐
│  CARTA: [Título]                        │
│  [Cor partidária na borda]              │
│                                         │
│  [Descrição do problema]                │
│                                         │
│  ◀ ESQUERDA           DIREITA ▶         │
│  [Opção A]            [Opção B]         │
│                                         │
│  CUSTO: X             CUSTO: Y          │
│  EFEITOS:             EFEITOS:          │
│  - Medidor +X         - Medidor -Y      │
│  - Medidor -Y         - Medidor +X      │
│                                         │
│  CONSEQUÊNCIA:        CONSEQUÊNCIA:     │
│  [Frase curta]        [Frase curta]     │
│                                         │
│  CARTA DE APRENDIZADO:                  │
│  [Explicação do conceito]               │
└─────────────────────────────────────────┘
```

### 04.06.3. Cores Partidárias

| Cor | Espectro | Referência |
| :--- | :--- | :--- |
| **Vermelho** | Esquerda | PT, PDT, PSOL |
| **Azul** | Centro-direita | PSDB, PSB |
| **Verde** | Agronegócio | Bancada ruralista |
| **Amarelo** | Centro | MDB, Centrão |
| **Roxo** | Esquerda radical | PSOL, PSTU |
| **Laranja** | Direita liberal | NOVO, Republicanos |
| **Preto** | Extrema-direita | PL, bolsonarismo |

### 04.06.4. Status da Auditoria

| Categoria | Quantidade | Status |
| :--- | :--- | :--- |
| Cartas inventariadas | 340 | ✅ |
| Cartas que precisam de `Verdade` | 145 | ✅ Reescritas |
| Cartas de Aprendizado validadas | 145 | ✅ |

### 04.06.5. Fundamentação Teórica

O sistema de cartas é baseado no **design de *Reigns***, que utiliza um "saco de cartas" que aumenta e diminui conforme o estado do reino.

> "Assim que ponderamos as decisões do jogador com consequências nas 4 dimensões de poder, demos muito significado a gestos muito simples de deslizar." — François Alliot, criador de *Reigns*

### 04.06.6. Referências

- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- NERIAL. *Reigns: Game Design Document*. 2016.

---

## 04.07 — Cartas de Aprendizado

### 04.07.1. Estrutura (4 Blocos)

| Bloco | Conteúdo | Função |
| :--- | :--- | :--- |
| **1. O que você acabou de vivenciar** | Resumo da decisão tomada | Conectar a experiência do jogo com o conceito |
| **2. O conceito por trás** | Explicação do mecanismo institucional | Ensinar como o sistema funciona |
| **3. Dados reais** | Números e fatos da realidade brasileira | Mostrar que o jogo reflete o Brasil |
| **4. Fonte** | Origem dos dados | Dar credibilidade |
| **5. Frase de impacto** | Reflexão final | Memorabilidade |

### 04.07.2. Exemplos Escritos (16)

| # | Carta | Conceito | Dados Reais |
| :--- | :--- | :--- | :--- |
| 1 | Privatização da estatal | Poder de agenda do relator | Eletrobras: 5 mil demitidos, investimento 1/5 do prometido |
| 2 | Retirada de direitos trabalhistas | Bicameralismo | Reforma Trabalhista de 2017: informalidade e precarização |
| 3 | CPI contra o governo | Instrumento de fiscalização | CPI das Bets: relatório rejeitado por 4 votos a 3 |
| 4 | Corte na saúde | Orçamento público ≠ orçamento doméstico | Teto de gastos: R$ 37 bi do SUS, expectativa de vida caiu |
| 5 | Emenda para show | Emendas parlamentares | R$ 5 bi em cachês, agro recebeu 56× mais que agricultura familiar |
| 6 | Retirada de Filosofia/Sociologia | Lei 13.415/2017 | Desativação do pensamento crítico |
| 7 | Concessão de TV para pastor | Concessão de serviço público | 9 dos 50 veículos são de líderes religiosos |
| 8 | Adesão ao BRICS | Desdolarização | BRICS Pay, BRICS Bridge, BRICS Clear |
| 9 | Venda de lítio | Soberania tecnológica | Reprimarização: exportamos matéria-prima, importamos tecnologia |
| 10 | Operação policial letal | Estado penal vs. Estado social | 11 mortes por dia, 86% negras, Operação Contenção: 121 mortos |
| 11 | Descriminalização da maconha | Guerra às drogas | 69% da população carcerária é negra |
| 12 | Escândalo no STF | Blindagem institucional | Banco Master: 52 mensagens, CPI pediu impeachment |
| 13 | Influenciador financiado por bets | Cachê da desgraça alheia | Blaze: R$ 330 mi, ofertas de R$ 10 mi por contrato |
| 14 | Deepfake viral | Desinformação como arma | Crescimento de 308%, 554 vídeos nas eleições |
| 15 | Coronel cobra favor | Clientelismo | Lei de Terras de 1850, coronelismo adaptado |
| 16 | Professor ameaça greve | Resistência cultural | Piso salarial desrespeitado, evasão de 8,5 mi |

### 04.07.3. Fundamentação Teórica

As Cartas de Aprendizado são baseadas em **três princípios pedagógicos**:

1. **Aprendizagem Experiencial (Kolb)** — o jogador vivencia a decisão, depois reflete sobre ela.
2. **Educação Dialógica (Freire)** — o jogo não impõe conceitos, ele problematiza a realidade.
3. **Microlearning** — cada carta é uma unidade curta e autônoma de conhecimento.

---

## 04.08 — Finais (26 Consolidados)

### 04.08.1. Visão Geral

O jogo possui **26 finais**, divididos em 6 categorias:

| Categoria | Quantidade | Descrição |
| :--- | :--- | :--- |
| **Catástrofe** | 7 | Falência de um medidor |
| **Captura** | 3 | Captura do Estado por projeto autoritário |
| **Perda da Democracia** | 5 | Erosão democrática |
| **Extermínio e Exploração** | 2 | Projeto bolsonarista |
| **Fortalecimento** | 5 | Democracia fortalecida |
| **Cuidado e Soberania** | 4 | Projeto lulista |

### 04.08.2. 💀 CATÁSTROFE (7)

| # | Final | Condição | Citação | Autor |
| :--- | :--- | :--- | :--- | :--- |
| 1 | **Barbárie** | Dignidade = 0 | *"O povo é o que há de mais reles. Seu destino é ser uma mera força de trabalho, um carvão humano que se queima na produção."* | Darcy Ribeiro |
| 2 | **Alienação Total** | Consciência = 0 | *"A massa não pensa, a massa segue. Quem não pensa, obedece."* | MV Bill |
| 3 | **Colônia** | Soberania = 0 | *"Em lugar do cidadão formou-se um consumidor, que aceita ser chamado de usuário."* | Milton Santos |
| 4 | **Autogestão Popular** | Segurança = 0 | *"A liberdade não é um presente dos governantes, mas uma conquista dos governados."* | Errico Malatesta |
| 5 | **Pós-Verdade Total** | Verdade = 0 | *"Uma mentira repetida mil vezes torna-se verdade."* | Joseph Goebbels |
| 6 | **Impeachment** | Capital Político = 0 | *"Uma condenação política exige obrigatoriamente a ocorrência de um crime de responsabilidade..."* | Dilma Rousseff |
| 7 | **Revolta Popular** | Legitimidade = 0 | *"Liberdade ainda que tardia."* | Inconfidência Mineira |

### 04.08.3. 👑 CAPTURA (3)

| # | Final | Condição | Citação | Autor |
| :--- | :--- | :--- | :--- | :--- |
| 8 | **Estado Policial** | Segurança = 100 | *"Brasil, ame-o ou deixe-o."* | Ditadura Militar |
| 9 | **Hegemonia Autoritária** | Capital Político = 100 | *"Tudo no Estado, nada fora do Estado, nada contra o Estado."* | Mussolini |
| 10 | **Ufanismo Vazio** | Legitimidade = 100 | *"Crer, obedecer, combater."* | Mussolini |

### 04.08.4. ⚖️ PERDA DA DEMOCRACIA (5)

| # | Final | Condição | Citação | Autor |
| :--- | :--- | :--- | :--- | :--- |
| 11 | **Autoritarismo Eleitoral** | Consciência < 30, Verdade < 30, Legitimidade > 70 | *"A gente vota, mas quem decide é outro."* | Oliveira Vianna (adaptação) |
| 12 | **Golpe Militar** | Segurança > 80, Dignidade < 30, Consciência < 30 | *"Se você não está preparado para ser impiedoso, você não vai a lugar nenhum."* | Adolf Hitler |
| 13 | **Golpe Institucional** | Capital Político > 80, Consciência < 30, Soberania < 30 | *"Hoje temo a morte da democracia..."* | Dilma Rousseff |
| 14 | **Populismo Autoritário** | Legitimidade > 80, Consciência < 30, Verdade < 30 | *"O indivíduo nada é e nada vale."* | Adolf Hitler |
| 15 | **Colônia Digital** | Soberania < 30, Verdade < 30, Dignidade < 30 | *"Sem regras, as Big Techs vão instituir a era do colonialismo digital..."* | Luiz Inácio Lula da Silva |

### 04.08.5. 💀 EXTERMÍNIO E EXPLORAÇÃO (2)

| # | Final | Condição | Citação | Autor |
| :--- | :--- | :--- | :--- | :--- |
| 16 | **Genocídio Institucionalizado** | Dignidade < 20, Verdade < 20, Consciência < 30, Segurança > 80 | *"E daí? Lamento. Quer que eu faça o quê? Eu não sou coveiro, tá certo?"* | Jair Bolsonaro |
| 17 | **Exploração Necropolítica** | Soberania < 20, Dignidade < 20, Caixa > 80, Verdade < 30 | *"Índio já tem terra demais, vamos tratá-los como seres humanos... não quer viver em um zoológico?"* | Jair Bolsonaro |

### 04.08.6. 🌱 FORTALECIMENTO DA DEMOCRACIA (5)

| # | Final | Condição | Citação | Autor |
| :--- | :--- | :--- | :--- | :--- |
| 18 | **República Soberana e Popular** | Dignidade > 80, Consciência > 70, Soberania > 70, Verdade > 70 | *"A educação é o único caminho para emancipar o homem..."* | Leonel Brizola |
| 19 | **Democracia Participativa** | Consciência > 70, Verdade > 70, Dignidade > 60, Legitimidade > 60 | *"Ninguém liberta ninguém, ninguém se liberta sozinho..."* | Paulo Freire |
| 20 | **Desenvolvimento Soberano** | Soberania > 80, Caixa > 60, Dignidade > 60 | *"Queremos um Brasil forte e independente..."* | Leonel Brizola |
| 21 | **Cidadania Ativa e Mobilizada** | Consciência > 80, Verdade > 80, Legitimidade > 70 | *"A democracia não é só o direito de votar..."* | Luiz Inácio Lula da Silva |
| 22 | **Paz Social e Justiça** | Segurança > 70, Dignidade > 70, Consciência > 60 | *"Sem justiça, a paz é enganosa e falsa."* | Dom Helder Câmara |

### 04.08.7. 🌱 CUIDADO E SOBERANIA (4)

| # | Final | Condição | Citação | Autor |
| :--- | :--- | :--- | :--- | :--- |
| 23 | **Cuidado como Política de Estado** | Dignidade > 80, Verdade > 70, Consciência > 70, Segurança > 50 | *"Quero mostrar ao mundo que é possível cuidar do povo pobre."* | Luiz Inácio Lula da Silva |
| 24 | **Soberania que Alimenta** | Soberania > 80, Dignidade > 70, Verdade > 60, Caixa > 50 | *"Ninguém é pobre porque quer..."* | Luiz Inácio Lula da Silva |
| 25 | **Fome como Escolha Política** | Dignidade > 80, Consciência > 70, Soberania > 60 | *"A fome não é um problema de produção, mas de distribuição."* | Josué de Castro |
| 26 | **Protecionismo Soberano** | Soberania > 80, Caixa > 60, Dignidade > 60 | *"Queremos um Brasil forte e independente."* | Leonel Brizola |

### 04.08.8. Fundamentação Teórica

Os 26 finais foram construídos para cobrir **todas as possibilidades** de governo:

1. **Catástrofes** — representam a falência de um medidor.
2. **Capturas** — representam a captura do Estado por um projeto autoritário.
3. **Perdas da democracia** — representam a erosão democrática.
4. **Extermínio e exploração** — representam o projeto bolsonarista.
5. **Fortaleci mentos** — representam a democracia fortalecida.
6. **Cuidado e soberania** — representam o projeto lulista.

Cada final tem uma **citação de impacto**, escolhida para ser um "soco no estômago".

---

## 04.09 — Eixo Ideológico (Modelo 9axes)

### 04.09.1. Abordagem Anterior (Descartada)

- "Você escolheu 15 soluções de esquerda e 9 de direita"
- Rotulava o jogador, reforçava a polarização

### 04.09.2. Nova Abordagem (Adotada)

**Comentário do Professor Alisson:** *"Use como base testes como o 9 axes ou 11 axes para revelar este eixo."*

**Modelo 9axes (adaptado):**

| Eixo | Extremo A | Extremo B |
| :--- | :--- | :--- |
| **Economia** | Coletivismo | Mercado |
| **Diplomacia** | Nacionalismo | Globalismo |
| **Sociedade** | Conservadorismo | Progressismo |
| **Estado** | Autoritarismo | Liberdade |

### 04.09.3. Como Funciona

- Cada escolha do jogador soma pontos em um dos extremos.
- No final, o jogo revela um **gráfico de radar** com os 4 eixos.
- O jogador vê seu **espectro político** sem rótulos binários.

### 04.09.4. Revelação Final

| Padrão | Revelação |
| :--- | :--- |
| **Dignidade, Consciência e Soberania altos** | *"Seu governo priorizou a dignidade, a educação e a soberania..."* |
| **Segurança, Capital Político e Caixa altos** | *"Seu governo priorizou a ordem, a estabilidade e a economia..."* |
| **Equilíbrio entre todos** | *"Seu governo buscou equilíbrio entre diferentes valores..."* |
| **Verdade e Consciência baixos** | *"Seu governo negligenciou a verdade e a educação..."* |
| **Dignidade e Soberania baixos** | *"Seu governo negligenciou o povo e a soberania..."* |

### 04.09.5. Fundamentação Teórica

O modelo 9axes é uma adaptação do **Political Compass** e do **8values**. Ele permite uma representação **multidimensional** do espectro político, evitando a dicotomia simplista esquerda-direita.

---

## 04.10 — Calibração Inicial/Final

### 04.10.1. Calibração Inicial (6 Perguntas)

| # | Pergunta | Resposta A | Resposta B | Medidor Afetado |
| :--- | :--- | :--- | :--- | :--- |
| 1 | O governo deve priorizar segurança ou prevenção? | Segurança | Prevenção | Segurança / Dignidade |
| 2 | O Brasil deve se alinhar aos EUA ou ao BRICS? | EUA | BRICS | Soberania |
| 3 | O Estado deve investir em educação ou cortar gastos? | Educação | Cortar | Consciência / Caixa |
| 4 | A mídia deve ser livre ou regulada? | Livre | Regulada | Verdade |
| 5 | O governo deve taxar grandes fortunas? | Sim | Não | Dignidade / Caixa |
| 6 | O povo deve participar das decisões? | Sim | Não | Legitimidade / Consciência |

**Como funciona:** Cada resposta define +10 ou -10 em um medidor. O jogador pode pular.

### 04.10.2. Calibração Final (Eixo Ideológico)

- Gráfico de radar com 4 eixos (9axes adaptado).
- Revelação suavizada do padrão de valores.
- Frase de impacto: *"O país que você construiu reflete os valores que você priorizou."*

### 04.10.3. Fundamentação Teórica

A calibração inicial é baseada no modelo da **Bússola 2026**, que usa 12 perguntas para calcular a afinidade do eleitor com cada candidato. A calibração final é baseada no **9axes**, que revela o espectro político do jogador.

---

## 04.11 — Modo Influenciador

### 04.11.1. Conceito

O Modo Influenciador ensina como a desinformação é financiada, como os influenciadores são cooptados e como o jogador pode resistir. Baseado no **IAgora?** e na **"teoria da inoculação"**.

### 04.11.2. Técnicas de Manipulação Ensinadas

| Técnica | Descrição |
| :--- | :--- |
| **Desmoralização** | Destruir a reputação do adversário com mentiras |
| **Pânico Moral** | Criar medo sobre um tema |
| **Deepfake** | Vídeo falso com IA |
| **Fazenda de IA** | Rede de perfis coordenados |
| **Cachê da Desgraça** | Comissão sobre perdas de apostadores |
| **Didatismo Acusatório** | Pedagogia invertida que ensina a odiar |

### 04.11.3. Mecânica de Resistência (Teoria da Inoculação)

| Elemento | Definição |
| :--- | :--- |
| **Exposição Controlada** | O jogador é exposto a uma narrativa manipulada |
| **Escolha** | O jogador decide como reagir |
| **Consequência** | Se aceitar, perde `Verdade` e `Consciência`. Se recusar, perde `Legitimidade`. Se investigar, perde `Capital Político`, mas ganha `Verdade`. |
| **Carta de Aprendizado** | Explica a técnica e como reconhecê-la |

### 04.11.4. Exemplo de Carta

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

### 04.11.5. Fundamentação Teórica

A **"teoria da inoculação"** defende que a exposição controlada a técnicas de manipulação desenvolve **resistência psicológica** contra elas. O IAgora? usa essa teoria para treinar eleitores a identificar fake news.

---

## 04.12 — Modo Impeachment

### 04.12.1. Conceito

O impeachment não é negociação. É uma **cena de golpe**.

**Comentário do Professor Alisson:** *"Acho que poderia ser a partir do ano 2."*

### 04.12.2. Gatilho de Acionamento

| Condição | Descrição |
| :--- | :--- |
| **Gatilho Principal** | `Legitimidade` < 20 **E** `Capital Político` < 20 |
| **Gatilho Alternativo** | O jogador tomou **3 decisões consecutivas** que contrariaram a maioria do Congresso |
| **Gatilho de Crise** | `Verdade` < 20 **E** `Consciência` < 20 |

**Correção:** O impeachment pode ser acionado a partir do **Ano 2**, não apenas do Ano 3.

### 04.12.3. Estrutura (5 Cartas)

| Fase | O que Acontece | Condição de Sobrevivência |
| :--- | :--- | :--- |
| **1. O Pedido** | A oposição protocola. O presidente da Câmara aceita. | Apelar ao povo (Legitimidade > 60) ou confiar na base (Capital Político > 50) |
| **2. A Comissão** | Comissão formada por adversários. Relator inimigo. | Denunciar o golpe (Verdade > 60) ou negociar (Caixa > 60) |
| **3. A Votação** | Câmara vota. Resultado depende do apoio popular. | Convocar manifestações (Legitimidade > 70) ou aceitar |
| **4. O Julgamento** | Senado julga. Resultado depende da correlação de forças. | Renunciar (Consciência > 60) ou lutar até o fim |
| **5. O Desfecho** | Se o jogador tiver apoio popular massivo, o golpe falha. | Legitimidade > 60 E Consciência > 50 = Absolvição |

**Observação:** Se o jogador tiver `Consciência` < 30 E `Verdade` < 30, o impeachment é **automaticamente consumado**.

### 04.12.4. Fundamentação Teórica

O impeachment como **cena de golpe** é baseado na análise do impeachment de Dilma Rousseff em 2016, que foi amplamente interpretado como um **golpe parlamentar, jurídico e midiático**.

> "O impeachment não é justiça. É o Congresso te dando um recado: você não soube jogar o jogo deles." — Adaptação

A pesquisa acadêmica confirma que o processo foi marcado por **fragilidade jurídica**, **retaliação política** e **midiática**.

---

## 04.13 — Eventos Encadeados (78 Mapeados)

### 04.13.1. Conceito

Os eventos encadeados são **consequências de decisões anteriores** que se manifestam 1-2 turnos depois. O jogador vê um aviso especial quando um evento é ativado. Ele não pode ser evitado.

### 04.13.2. Eventos por Ator (42)

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

### 04.13.3. Eventos por Modo (20)

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

### 04.13.4. Eventos por Medidor (16)

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

### 04.13.5. Fundamentação Teórica

O sistema de eventos encadeados é baseado no conceito de **"Ripple Chains"** (Cadeias de Ondas) do jogo *World Order*, que mostra como "uma única força cascateia através da nação".

No *Reigns*, o sistema de cartas é descrito como "um saco que aumenta e diminui de conteúdo", onde cartas são removidas se não se encaixam no estado atual.

---

## 04.14 — Pesos e Gatilhos (Prioridade Narrativa)

### 04.14.1. Conceito

O sistema de sorteio é **narrativamente orientado**, não matematicamente ponderado. As cartas aparecem porque a história exige, não porque um cálculo de probabilidade determinou.

### 04.14.2. Regras de Sorteio

| # | Regra | Descrição |
| :--- | :--- | :--- |
| 1 | **Prioridade Narrativa** | Se uma decisão anterior gerou uma consequência, a carta da consequência aparece obrigatoriamente no turno correto. |
| 2 | **Prioridade de Ator** | Se um ator está insatisfeito (satisfação < 30), ele aparece obrigatoriamente no próximo turno. |
| 3 | **Prioridade de Medidor** | Se um medidor está < 30, cartas relacionadas a ele aparecem obrigatoriamente no próximo turno. |
| 4 | **Variedade** | Se um modo já apareceu no turno, ele não aparece de novo no mesmo turno. |
| 5 | **Aleatoriedade Controlada** | As cartas restantes são sorteadas aleatoriamente, mas com peso igual. |

### 04.14.3. Fundamentação Teórica

O sistema de *Reigns* é descrito como "um saco que aumenta e diminui de conteúdo". François Alliot, criador do jogo, descreve: "Assim que ponderamos as decisões do jogador com consequências nas 4 dimensões de poder, demos muito significado a gestos muito simples de deslizar".

No nosso jogo, o sistema é **narrativamente orientado**, não matematicamente ponderado. As cartas aparecem porque a história exige, não porque um cálculo de probabilidade determinou.

---

## 04.15 — Balanceamento

### 04.15.1. Valores Iniciais (Revisados)

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

### 04.15.2. Multiplicador de Dificuldade

| Ano | Multiplicador |
| :--- | :--- |
| Ano 1 | ×0.25 |
| Ano 2 | ×0.75 |
| Ano 3 | ×1.0 |
| Ano 4 | ×1.5 |

### 04.15.3. Limiares de Proteção

| Ano | Limite Mínimo | O que Acontece |
| :--- | :--- | :--- |
| Ano 1 | 30 | Nenhum medidor cai abaixo de 30 |
| Ano 2 | 20 | Nenhum medidor cai abaixo de 20 |
| Ano 3 | 10 | Nenhum medidor cai abaixo de 10 |
| Ano 4 | 0 | Sem proteção |

### 04.15.4. Mecanismos de Recuperação

| Mecanismo | Como Funciona |
| :--- | :--- |
| **Carta de Recuperação** | Restaura um medidor em crise |
| **Evento de Boa Vontade** | Ator oferece ajuda sem cobrar |
| **Bônus por Equilíbrio** | Se todos os medidores > 40, ganha +5 em todos |
| **Segunda Chance** | Se um medidor chega a 10, oferece escolha crítica para recuperá-lo |

### 04.15.5. Fundamentação Teórica

O balanceamento foi revisado para ser **menos punitivo**, com base em:

1. **Teoria do Flow (Csikszentmihalyi)** — o jogo não deve ser frustrante a ponto de afastar o jogador.
2. **Erro como Aprendizado** — o erro deve ser informativo, não punitivo.
3. **Reforço Positivo** — o jogo deve recompensar boas escolhas, não apenas punir más escolhas.

---

## 04.16 — Referências

- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- CAMPBELL, Joseph. *The Hero with a Thousand Faces*. New York: Pantheon, 1949.
- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.
- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- ICON GAMES. *Senhor Presidente*. 2016.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.
- NERIAL. *Reigns: Game Design Document*. 2016.
- PROPP, Vladimir. *Morphology of the Folktale*. Austin: University of Texas Press, 1968.
- RIBEIRO, Darcy. *O Povo Brasileiro*. São Paulo: Companhia das Letras, 1995.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.
- VYGOTSKY, Lev. *A Formação Social da Mente*. São Paulo: Martins Fontes, 1984.
- WOOD, David; BRUNER, Jerome; ROSS, Gail. *The Role of Tutoring in Problem Solving*. Journal of Child Psychology and Psychiatry, 1976.
- Alisson, Professor. *Comentários sobre o Livro do Projeto*. 2026.

---

**Última atualização:** Outubro de 2026
**Versão:** 2.0 (completa)
