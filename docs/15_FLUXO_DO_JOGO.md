# 15 — Fluxo do Jogo

**Documento de Definição do Fluxo Completo do Jogo "O Planalto"**

Este documento define o fluxo completo da experiência do jogador, incluindo o fluxo geral, o fluxo de um turno, o fluxo de uma carta, o fluxo do impeachment, o fluxo dos eventos encadeados, o fluxo dos finais e o fluxo da calibração. Cada seção apresenta a fundamentação teórica e prática que embasa cada decisão.

---

## 15.01 — Fundamentação Teórica

### 15.01.1. Por Que o Fluxo é Essencial

O fluxo do jogo é essencial por três razões:

1. **Orientação** — o jogador sabe o que fazer e para onde ir.
2. **Ritmo** — o fluxo define a cadência da experiência.
3. **Aprendizado** — o fluxo guia o jogador pela jornada de aprendizagem.

> "O design de jogos é o design de fluxos." — Jesse Schell, *The Art of Game Design*

### 15.01.2. Princípios de Fluxo

O fluxo do "O Planalto" segue **5 princípios fundamentais**:

| # | Princípio | Descrição |
| :--- | :--- | :--- |
| 1 | **Progressão clara** | O jogador sabe em que momento está e o que vem a seguir |
| 2 | **Ritmo variado** | Alternância entre momentos de tensão e relaxamento |
| 3 | **Feedback constante** | O jogador sempre sabe o resultado de suas ações |
| 4 | **Escolhas significativas** | Cada decisão tem impacto real |
| 5 | **Recompensa** | O jogador sente que está avançando |

### 15.01.3. Referências

- SCHELL, Jesse. *The Art of Game Design: A Book of Lenses*. Boca Raton: CRC Press, 2008.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.

---

## 15.02 — Fluxo Geral do Jogo

### 15.02.1. Diagrama do Fluxo Geral

┌─────────────────────────────────────────────────────────────┐
│ FLUXO GERAL DO JOGO │
├─────────────────────────────────────────────────────────────┤
│ │
│ TELA INICIAL │
│ └──▶ CALIBRAÇÃO (6 perguntas) │
│ └──▶ TURNO 1 (Ano 1 - Lua de Mel) │
│ └──▶ TURNO 2 (Ano 2 - Realidade Bate) │
│ └──▶ TURNO 3 (Ano 3 - Crise) │
│ └──▶ TURNO 4 (Ano 4 - Desfecho) │
│ └──▶ FINAL │
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.02.2. Descrição do Fluxo Geral

| Etapa | Descrição | Duração |
| :--- | :--- | :--- |
| **Tela Inicial** | O jogador vê o título e as opções | 10-30s |
| **Calibração** | O jogador responde 6 perguntas | 1-2 min |
| **Turno 1** | Ano 1 — Lua de Mel | 6-8 min |
| **Turno 2** | Ano 2 — Realidade Bate | 6-8 min |
| **Turno 3** | Ano 3 — Crise | 6-8 min |
| **Turno 4** | Ano 4 — Desfecho | 6-8 min |
| **Final** | Revelação do final + eixo ideológico | 1-2 min |
| **Total** | — | **30-40 min** |

### 15.02.3. Fundamentação Teórica

O fluxo geral se baseia em:

1. **Teoria do Flow (Csikszentmihalyi)** — a dificuldade aumenta gradualmente.
2. **Scaffolding (Wood, Bruner e Ross)** — cada fase fornece suporte para a próxima.
3. **Zona de Desenvolvimento Proximal (Vygotsky)** — os desafios são progressivos.

### 15.02.4. Referências

- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.
- VYGOTSKY, Lev. *A Formação Social da Mente*. São Paulo: Martins Fontes, 1984.
- WOOD, David; BRUNER, Jerome; ROSS, Gail. *The Role of Tutoring in Problem Solving*. Journal of Child Psychology and Psychiatry, 1976.

---

## 15.03 — Fluxo da Tela Inicial

### 15.03.1. Diagrama do Fluxo

┌─────────────────────────────────────────────────────────────┐
│ FLUXO DA TELA INICIAL │
├─────────────────────────────────────────────────────────────┤
│ │
│ TELA INICIAL │
│ ├──▶ [INICIAR JOGO] ──▶ CALIBRAÇÃO │
│ ├──▶ [CONFIGURAÇÕES] ──▶ MENU DE CONFIGURAÇÕES │
│ └──▶ [SOBRE] ──▶ TELA SOBRE │
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.03.2. Descrição do Fluxo

| Ação | O que acontece |
| :--- | :--- |
| **Iniciar Jogo** | Vai para a Calibração Inicial |
| **Configurações** | Abre menu com opções (áudio, acessibilidade) |
| **Sobre** | Mostra informações sobre o jogo |

### 15.03.3. Fundamentação Teórica

O fluxo da tela inicial se baseia em:

1. **Hierarquia Visual** — a opção principal (Iniciar) é a mais visível.
2. **Lei de Fitts** — botões grandes e próximos.
3. **Menu Mínimo** — apenas 3 opções, sem complexidade.

### 15.03.4. Referências

- NORMAN, Donald. *The Design of Everyday Things*. New York: Basic Books, 1988.
- KRUG, Steve. *Don't Make Me Think*. San Francisco: New Riders, 2000.

---

## 15.04 — Fluxo da Calibração Inicial

### 15.04.1. Diagrama do Fluxo

┌─────────────────────────────────────────────────────────────┐
│ FLUXO DA CALIBRAÇÃO │
├─────────────────────────────────────────────────────────────┤
│ │
│ CALIBRAÇÃO INICIAL │
│ ├──▶ PERGUNTA 1 (Segurança vs. Prevenção) │
│ ├──▶ PERGUNTA 2 (EUA vs. BRICS) │
│ ├──▶ PERGUNTA 3 (Educação vs. Cortes) │
│ ├──▶ PERGUNTA 4 (Mídia Livre vs. Regulada) │
│ ├──▶ PERGUNTA 5 (Taxar Fortunas vs. Não) │
│ ├──▶ PERGUNTA 6 (Participação vs. Não) │
│ └──▶ FIM DA CALIBRAÇÃO ──▶ TURNO 1 │
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.04.2. Descrição do Fluxo

| Etapa | Descrição |
| :--- | :--- |
| **Pergunta 1** | "O governo deve priorizar segurança ou prevenção?" |
| **Pergunta 2** | "O Brasil deve se alinhar aos EUA ou ao BRICS?" |
| **Pergunta 3** | "O Estado deve investir em educação ou cortar gastos?" |
| **Pergunta 4** | "A mídia deve ser livre ou regulada?" |
| **Pergunta 5** | "O governo deve taxar grandes fortunas?" |
| **Pergunta 6** | "O povo deve participar das decisões?" |
| **Fim** | Os medidores iniciais são ajustados |

### 15.04.3. Efeitos das Respostas

| Pergunta | Resposta A | Efeito | Resposta B | Efeito |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Segurança | `Segurança` +10, `Dignidade` -10 | Prevenção | `Dignidade` +10, `Segurança` -10 |
| 2 | EUA | `Soberania` -10 | BRICS | `Soberania` +10 |
| 3 | Educação | `Consciência` +10, `Caixa` -10 | Cortar | `Caixa` +10, `Consciência` -10 |
| 4 | Livre | `Integridade` +10 | Regulada | `Integridade` -10 |
| 5 | Sim | `Dignidade` +10, `Caixa` -10 | Não | `Caixa` +10, `Dignidade` -10 |
| 6 | Sim | `Legitimidade` +10, `Consciência` -10 | Não | `Consciência` +10, `Legitimidade` -10 |

### 15.04.4. Fundamentação Teórica

A calibração inicial se baseia em:

1. **Bússola 2026** — ferramenta de bússola eleitoral com 12 perguntas.
2. **Teoria da Proximidade Espacial (Downs)** — eleitores votam no candidato mais próximo.
3. **Personalização** — a experiência é adaptada ao jogador.

### 15.04.5. Referências

- BÚSSOLA 2026. *Ferramenta de bússola eleitoral*. 2026.
- DOWNS, Anthony. *An Economic Theory of Democracy*. New York: Harper & Row, 1957.

---

## 15.05 — Fluxo de um Turno

### 15.05.1. Diagrama do Fluxo

┌─────────────────────────────────────────────────────────────┐
│ FLUXO DE UM TURNO │
├─────────────────────────────────────────────────────────────┤
│ │
│ ABERTURA DO TURNO │
│ └──▶ SORTEIO DE CARTAS (6-8) │
│ └──▶ CARTA 1 (Problema + Escolha + Consequência) │
│ └──▶ CARTA DE APRENDIZADO 1 │
│ └──▶ CARTA 2 │
│ └──▶ CARTA DE APRENDIZADO 2 │
│ └──▶ ... │
│ └──▶ FECHAMENTO DO TURNO │
│ └──▶ VERIFICAÇÃO │
│ (medidor zerado?) │
│ (impeachment?) │
│ (evento encadeado?)│
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.05.2. Descrição do Fluxo

| Etapa | Descrição |
| :--- | :--- |
| **Abertura** | O jogo mostra o ano e a fase |
| **Sorteio** | O jogo sorteia 6-8 cartas |
| **Cartas** | O jogador joga uma carta por vez |
| **Fechamento** | O jogo mostra o impacto acumulado |
| **Verificação** | O jogo verifica se algum medidor zerou |

### 15.05.3. As 4 Fases do Jogo

| Fase | Ano | Foco | Multiplicador | Limiar |
| :--- | :--- | :--- | :--- | :--- |
| **Lua de Mel** | 1 | Apresentação | ×0.25 | 30 |
| **Realidade Bate** | 2 | Eventos encadeados | ×0.75 | 20 |
| **Crise** | 3 | Impeachment | ×1.0 | 10 |
| **Desfecho** | 4 | Finais | ×1.5 | 0 |

### 15.05.4. Fundamentação Teórica

O fluxo de um turno se baseia em:

1. **Teoria do Flow (Csikszentmihalyi)** — a dificuldade aumenta gradualmente.
2. **Ciclo de Kolb** — o jogador vivencia, reflete, conceitua e experimenta.
3. **Microlearning** — cada carta é uma unidade curta de conhecimento.

### 15.05.5. Referências

- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.

---

## 15.06 — Fluxo de uma Carta

### 15.06.1. Diagrama do Fluxo

┌─────────────────────────────────────────────────────────────┐
│ FLUXO DE UMA CARTA │
├─────────────────────────────────────────────────────────────┤
│ │
│ EXIBIR PROBLEMA │
│ └──▶ JOGADOR ARRASTA PARA ESQUERDA OU DIREITA │
│ └──▶ APLICAR EFEITOS NOS MEDIDORES │
│ └──▶ EXIBIR CONSEQUÊNCIA │
│ └──▶ EXIBIR CARTA DE APRENDIZADO │
│ └──▶ VERIFICAR EVENTOS ENCADEADOS │
│ └──▶ PRÓXIMA CARTA │
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.06.2. Descrição do Fluxo

| Etapa | Descrição | Duração |
| :--- | :--- | :--- |
| **Exibir Problema** | A carta aparece na tela | 0.3s |
| **Escolha** | O jogador arrasta para esquerda ou direita | 1-3s |
| **Efeitos** | Os medidores são atualizados | 0.5s |
| **Consequência** | Uma frase curta aparece | 1-2s |
| **Carta de Aprendizado** | Um card explicativo aparece | 3-5s |
| **Verificação** | O jogo verifica eventos encadeados | 0.1s |
| **Próxima Carta** | Uma nova carta aparece | 0.3s |
| **Total** | — | **6-12s por carta** |

### 15.06.3. Fundamentação Teórica

O fluxo de uma carta se baseia em:

1. **Ciclo de Kolb** — experiência, observação, conceituação, experimentação.
2. **Feedback Imediato (Norman)** — o jogador vê o resultado imediatamente.
3. **Microlearning** — cada carta é uma unidade curta.

### 15.06.4. Referências

- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.
- NORMAN, Donald. *The Design of Everyday Things*. New York: Basic Books, 1988.

---

## 15.07 — Fluxo do Impeachment

### 15.07.1. Diagrama do Fluxo

┌─────────────────────────────────────────────────────────────┐
│ FLUXO DO IMPEACHMENT │
├─────────────────────────────────────────────────────────────┤
│ │
│ GATILHO (Legitimidade < 20 E Capital Político < 20) │
│ └──▶ CARTA 1 (O Pedido) │
│ └──▶ CARTA 2 (A Comissão) │
│ └──▶ CARTA 3 (A Votação) │
│ └──▶ CARTA 4 (O Julgamento) │
│ └──▶ CARTA 5 (O Desfecho) │
│ └──▶ ABSOLVIÇÃO ou CONDENAÇÃO │
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.07.2. Descrição do Fluxo

| Fase | O que Acontece | Condição de Sobrevivência |
| :--- | :--- | :--- |
| **1. O Pedido** | A oposição protocola | Legitimidade > 60 ou Capital Político > 50 |
| **2. A Comissão** | Comissão formada | Integridade > 60 ou Caixa > 60 |
| **3. A Votação** | Câmara vota | Legitimidade > 70 |
| **4. O Julgamento** | Senado julga | Consciência > 60 |
| **5. O Desfecho** | Resultado final | Legitimidade > 60 E Consciência > 50 |

### 15.07.3. Fundamentação Teórica

O fluxo do impeachment se baseia em:

1. **Análise do Impeachment de 2016** — golpe parlamentar, jurídico e midiático.
2. **Teoria do Golpe Institucional** — uso das instituições para derrubar um governo eleito.
3. **Estrutura Dramática** — 5 atos, cada um com tensão crescente.

### 15.07.4. Referências

- Revista Acervo (Arquivo Nacional). *Os sentidos do golpe*. Rio de Janeiro: Arquivo Nacional, 2025.
- Rocha, Daniel França da. *Golpe versus impeachment*. Recife: UFPE, 2021.

---

## 15.08 — Fluxo dos Eventos Encadeados

### 15.08.1. Diagrama do Fluxo

┌─────────────────────────────────────────────────────────────┐
│ FLUXO DOS EVENTOS ENCADEADOS │
├─────────────────────────────────────────────────────────────┤
│ │
│ DECISÃO (Turno X) │
│ └──▶ REGISTRAR EVENTO (Turno X+2) │
│ └──▶ NO TURNO X+2: │
│ └──▶ EXIBIR AVISO ESPECIAL │
│ └──▶ APLICAR EFEITOS │
│ └──▶ CONTINUAR JOGO │
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.08.2. Descrição do Fluxo

| Etapa | Descrição |
| :--- | :--- |
| **Decisão** | O jogador toma uma decisão no Turno X |
| **Registro** | O jogo registra o evento para o Turno X+2 |
| **Aviso** | No Turno X+2, um aviso especial aparece |
| **Efeitos** | Os efeitos do evento são aplicados |
| **Continuação** | O jogo continua normalmente |

### 15.08.3. Exemplos de Eventos Encadeados

| Decisão (Turno X) | Evento (Turno X+2) | Efeitos |
| :--- | :--- | :--- |
| Cortar verba da saúde | Epidemia na periferia | `Dignidade` -15, `Segurança` -10 |
| Privatizar a água | Aumento de tarifas | `Dignidade` -10, `Legitimidade` -10 |
| Cortar Bolsa Família | Fome volta ao mapa | `Dignidade` -20, `Legitimidade` -15 |
| Investir em educação | Jovens criam cooperativa | `Dignidade` +10, `Caixa` +5 |

### 15.08.4. Fundamentação Teórica

O fluxo dos eventos encadeados se baseia em:

1. **Ripple Chains (World Order)** — uma força cascateia através da nação.
2. **Design de *Reigns*** — o "saco de cartas" que aumenta e diminui.
3. **Causalidade** — decisões têm consequências de longo prazo.

### 15.08.5. Referências

- WORLD ORDER. *Ripple Chains*. 2024.
- ALLIOT, François. *Reigns: Design Philosophy*. 2016.

---

## 15.09 — Fluxo dos Finais

### 15.09.1. Diagrama do Fluxo

┌─────────────────────────────────────────────────────────────┐
│ FLUXO DOS FINAIS │
├─────────────────────────────────────────────────────────────┤
│ │
│ FIM DO TURNO 4 │
│ └──▶ VERIFICAÇÃO DE CONDIÇÕES │
│ ├──▶ MEDIDOR ZERADO? ──▶ FINAL CATASTRÓFICO │
│ ├──▶ MEDIDOR CHEIO? ──▶ FINAL DE CAPTURA │
│ ├──▶ COMBINAÇÃO? ──▶ FINAL DE PERDA OU FORTALECIMENTO│
│ └──▶ EQUILÍBRIO? ──▶ FINAL VIRTUOSO │
│ │
│ └──▶ CÁLCULO DO EIXO IDEOLÓGICO │
│ └──▶ REVELAÇÃO FINAL │
│ └──▶ CITAÇÃO DE IMPACTO │
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.09.2. Descrição do Fluxo

| Etapa | Descrição |
| :--- | :--- |
| **Fim do Turno 4** | O jogo termina |
| **Verificação** | O jogo verifica as condições dos medidores |
| **Final** | O jogo revela o final correspondente |
| **Eixo Ideológico** | O jogo calcula o eixo ideológico |
| **Revelação** | O jogo revela o padrão de escolhas |
| **Citação** | O jogo mostra a citação de impacto |

### 15.09.3. Os 26 Finais

| Categoria | Quantidade | Exemplos |
| :--- | :--- | :--- |
| **Catástrofe** | 7 | Barbárie, Alienação Total, Colônia |
| **Captura** | 3 | Estado Policial, Hegemonia Autoritária |
| **Perda da Democracia** | 5 | Autoritarismo Eleitoral, Golpe Militar |
| **Extermínio e Exploração** | 2 | Genocídio Institucionalizado |
| **Fortalecimento** | 5 | República Soberana e Popular |
| **Cuidado e Soberania** | 4 | Cuidado como Política de Estado |

### 15.09.4. Fundamentação Teórica

O fluxo dos finais se baseia em:

1. **Teoria dos Finais Múltiplos** — cada escolha leva a um final diferente.
2. **Eixo Ideológico (9axes)** — o jogo revela o espectro político do jogador.
3. **Citações de Impacto** — cada final tem uma citação que resume a mensagem.

### 15.09.5. Referências

- 9AXES. *Teste de espectro político*. 2026.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.

---

## 15.10 — Fluxo do Eixo Ideológico

### 15.10.1. Diagrama do Fluxo

┌─────────────────────────────────────────────────────────────┐
│ FLUXO DO EIXO IDEOLÓGICO │
├─────────────────────────────────────────────────────────────┤
│ │
│ FIM DO JOGO │
│ └──▶ CÁLCULO DO EIXO │
│ ├──▶ ECONOMIA (Coletivismo vs. Mercado) │
│ ├──▶ DIPLOMACIA (Nacionalismo vs. Globalismo) │
│ ├──▶ SOCIEDADE (Conservadorismo vs. Progressismo) │
│ └──▶ ESTADO (Autoritarismo vs. Liberdade) │
│ │
│ └──▶ GRÁFICO DE RADAR │
│ └──▶ REVELAÇÃO SUAVIZADA │
│ └──▶ "O país que você construiu reflete │
│ os valores que você priorizou." │
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.10.2. Descrição do Fluxo

| Etapa | Descrição |
| :--- | :--- |
| **Cálculo** | O jogo calcula os 4 eixos |
| **Gráfico** | O jogo mostra um gráfico de radar |
| **Revelação** | O jogo revela o padrão de escolhas |
| **Frase** | O jogo mostra uma frase de impacto |

### 15.10.3. Os 4 Eixos

| Eixo | Extremo A | Extremo B |
| :--- | :--- | :--- |
| **Economia** | Coletivismo | Mercado |
| **Diplomacia** | Nacionalismo | Globalismo |
| **Sociedade** | Conservadorismo | Progressismo |
| **Estado** | Autoritarismo | Liberdade |

### 15.10.4. Revelação Final

| Padrão | Revelação |
| :--- | :--- |
| **Dignidade, Consciência e Soberania altos** | *"Seu governo priorizou a dignidade, a educação e a soberania..."* |
| **Segurança, Capital Político e Caixa altos** | *"Seu governo priorizou a ordem, a estabilidade e a economia..."* |
| **Equilíbrio entre todos** | *"Seu governo buscou equilíbrio entre diferentes valores..."* |
| **Consciência e Integridade baixos** | *"Seu governo negligenciou a verdade e a educação..."* |
| **Dignidade e Soberania baixos** | *"Seu governo negligenciou o povo e a soberania..."* |

### 15.10.5. Fundamentação Teórica

O fluxo do eixo ideológico se baseia em:

1. **9axes** — teste de espectro político multidimensional.
2. **Political Compass** — referência histórica.
3. **8values** — base para o 9axes.

### 15.10.6. Referências

- 9AXES. *Teste de espectro político*. 2026.
- POLITICAL COMPASS. *The Political Compass*. 2001.
- 8VALUES. *8values*. 2017.

---

## 15.11 — Fluxo da Calibração Final

### 15.11.1. Diagrama do Fluxo

┌─────────────────────────────────────────────────────────────┐
│ FLUXO DA CALIBRAÇÃO FINAL │
├─────────────────────────────────────────────────────────────┤
│ │
│ FIM DO JOGO │
│ └──▶ GRÁFICO DE RADAR (4 eixos) │
│ └──▶ REVELAÇÃO DO PADRÃO │
│ └──▶ CITAÇÃO DE IMPACTO │
│ └──▶ [JOGAR NOVAMENTE] [COMPARTILHAR] │
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.11.2. Descrição do Fluxo

| Etapa | Descrição |
| :--- | :--- |
| **Gráfico** | O jogo mostra um gráfico de radar com os 4 eixos |
| **Revelação** | O jogo revela o padrão de escolhas |
| **Citação** | O jogo mostra a citação de impacto do final |
| **Botões** | O jogador pode jogar novamente ou compartilhar |

### 15.11.3. Fundamentação Teórica

O fluxo da calibração final se baseia em:

1. **Bússola 2026** — ferramenta de bússola eleitoral.
2. **9axes** — teste de espectro político.
3. **Reflexão** — o jogador reflete sobre suas escolhas.

### 15.11.4. Referências

- BÚSSOLA 2026. *Ferramenta de bússola eleitoral*. 2026.
- 9AXES. *Teste de espectro político*. 2026.

---

## 15.12 — Fluxo Completo (Resumo)

### 15.12.1. Diagrama do Fluxo Completo

┌─────────────────────────────────────────────────────────────┐
│ FLUXO COMPLETO │
├─────────────────────────────────────────────────────────────┤
│ │
│ TELA INICIAL │
│ └──▶ CALIBRAÇÃO INICIAL (6 perguntas) │
│ └──▶ TURNO 1 (Ano 1) │
│ ├──▶ CARTA 1 ──▶ APRENDIZADO 1 │
│ ├──▶ CARTA 2 ──▶ APRENDIZADO 2 │
│ ├──▶ ... │
│ └──▶ FECHAMENTO DO TURNO │
│ └──▶ TURNO 2 (Ano 2) │
│ └──▶ ... │
│ └──▶ TURNO 3 (Ano 3) │
│ └──▶ ... │
│ └──▶ TURNO 4 (Ano 4) │
│ └──▶ ... │
│ └──▶ FINAL │
│ └──▶ EIXO│
│ │
└─────────────────────────────────────────────────────────────┘
text


### 15.12.2. Duração de Cada Etapa

| Etapa | Duração |
| :--- | :--- |
| **Tela Inicial** | 10-30s |
| **Calibração Inicial** | 1-2 min |
| **Turno 1** | 6-8 min |
| **Turno 2** | 6-8 min |
| **Turno 3** | 6-8 min |
| **Turno 4** | 6-8 min |
| **Final + Eixo** | 1-2 min |
| **Total** | **30-40 min** |

### 15.12.3. Fundamentação Teórica

O fluxo completo se baseia em:

1. **Teoria do Flow (Csikszentmihalyi)** — a dificuldade aumenta gradualmente.
2. **Ciclo de Kolb** — o jogador vivencia, reflete, conceitua e experimenta.
3. **Scaffolding (Wood, Bruner e Ross)** — cada fase fornece suporte para a próxima.

### 15.12.4. Referências

- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.
- WOOD, David; BRUNER, Jerome; ROSS, Gail. *The Role of Tutoring in Problem Solving*. Journal of Child Psychology and Psychiatry, 1976.

---

## 15.13 — Referências

### 15.13.1. Design de Jogos

- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.
- SCHELL, Jesse. *The Art of Game Design: A Book of Lenses*. Boca Raton: CRC Press, 2008.

### 15.13.2. Pedagogia

- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.
- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.
- VYGOTSKY, Lev. *A Formação Social da Mente*. São Paulo: Martins Fontes, 1984.
- WOOD, David; BRUNER, Jerome; ROSS, Gail. *The Role of Tutoring in Problem Solving*. Journal of Child Psychology and Psychiatry, 1976.

### 15.13.3. Ciência Política

- 9AXES. *Teste de espectro político*. 2026.
- BÚSSOLA 2026. *Ferramenta de bússola eleitoral*. 2026.
- DOWNS, Anthony. *An Economic Theory of Democracy*. New York: Harper & Row, 1957.
- POLITICAL COMPASS. *The Political Compass*. 2001.
- 8VALUES. *8values*. 2017.

### 15.13.4. Teoria do Brasil

- Revista Acervo (Arquivo Nacional). *Os sentidos do golpe*. Rio de Janeiro: Arquivo Nacional, 2025.
- Rocha, Daniel França da. *Golpe versus impeachment*. Recife: UFPE, 2021.

### 15.13.5. Design de Interface

- NORMAN, Donald. *The Design of Everyday Things*. New York: Basic Books, 1988.
- KRUG, Steve. *Don't Make Me Think*. San Francisco: New Riders, 2000.

---

**Última atualização:** Outubro de 2026
**Versão:** 1.0 (completa)

