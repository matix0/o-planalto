# 14 — UI/UX Design

**Documento de Design de Interface e Experiência do Usuário do Jogo "O Planalto"**

Este documento define a interface do usuário (UI) e a experiência do usuário (UX) do jogo, incluindo wireframes, fluxo de telas, paleta de cores, tipografia, ícones, layout das cartas, feedback visual, animações e acessibilidade. Cada seção apresenta a fundamentação teórica e prática que embasa cada decisão.

---

## 14.01 — Fundamentação Teórica

### 14.01.1. Por Que UI/UX é Essencial

A interface e a experiência do usuário são essenciais em jogos educativos por três razões:

1. **Acessibilidade** — uma interface clara permite que qualquer pessoa jogue, independentemente de familiaridade com tecnologia.
2. **Engajamento** — uma experiência fluida mantém o jogador envolvido.
3. **Aprendizado** — uma interface que comunica bem facilita a compreensão dos conceitos.

> "O design não é apenas o que parece e o que sente. O design é como funciona." — Steve Jobs

### 14.01.2. Princípios de Design

O design do "O Planalto" segue **7 princípios fundamentais**:

| # | Princípio | Descrição |
| :--- | :--- | :--- |
| 1 | **Simplicidade** | Um gesto (arrastar) controla tudo. Sem menus complexos. |
| 2 | **Clareza** | Cada informação é visível e legível em menos de 3 segundos. |
| 3 | **Feedback imediato** | Cada ação tem uma resposta visual clara. |
| 4 | **Consistência** | Todas as telas seguem o mesmo padrão visual. |
| 5 | **Acessibilidade** | O jogo é jogável por pessoas com diferentes habilidades. |
| 6 | **Brasilidade** | A identidade visual remete ao Brasil sem estereótipos. |
| 7 | **Minimalismo** | Sem elementos desnecessários. Foco no conteúdo. |

### 14.01.3. Metodologia de Design

O design foi construído com base em:

| Fonte | Contribuição |
| :--- | :--- |
| **Análise de *Reigns*** | Mecânica de swipe, layout de carta única |
| **Análise de *Senhor Presidente*** | Modularidade temática, ícones de facções |
| **Pedagogia freiriana** | Linguagem dialógica, acessível |
| **Design de jogos sérios** | Microlearning, clareza, impacto |
| **Comentários do Professor Alisson** | Ajustes de cores, tipografia, acessibilidade |

### 14.01.4. Referências

- NORMAN, Donald. *The Design of Everyday Things*. New York: Basic Books, 1988.
- KRUG, Steve. *Don't Make Me Think*. San Francisco: New Riders, 2000.
- LIDWELL, William; HOLDEN, Kritina; BUTLER, Jill. *Universal Principles of Design*. Beverly: Rockport, 2010.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.

---

## 14.02 — Paleta de Cores

### 14.02.1. Paleta Principal

A paleta principal é composta por **3 cores** que remetem à esperança, confiança e neutralidade:

| Cor | HEX | Uso | Significado |
| :--- | :--- | :--- | :--- |
| **Verde** | `#2E7D32` | Cor primária, esperança, Brasil | Esperança, natureza, povo |
| **Azul** | `#1565C0` | Cor secundária, confiança, instituições | Confiança, estabilidade, instituições |
| **Cinza** | `#37474F` | Cor terciária, neutralidade, fundo | Neutralidade, seriedade |

### 14.02.2. Paleta Secundária

A paleta secundária é usada para **alertas e destaques**:

| Cor | HEX | Uso | Significado |
| :--- | :--- | :--- | :--- |
| **Vermelho** | `#C62828` | Alerta, perigo, urgência | Urgência, perigo, crise |
| **Amarelo** | `#F9A825` | Destaque, coletividade, atenção | Atenção, coletividade, povo |
| **Laranja** | `#EF6C00` | Destaque secundário | Mudança, transformação |
| **Roxo** | `#6A1B9A` | Destaque especial | Resistência, transformação |

### 14.02.3. Paleta de Medidores

Cada medidor tem uma cor própria que o identifica visualmente:

| Medidor | Cor | HEX | Significado |
| :--- | :--- | :--- | :--- |
| **Dignidade** | Verde | `#2E7D32` | Direitos básicos |
| **Consciência** | Roxo | `#6A1B9A` | Pensamento crítico |
| **Soberania** | Azul-escuro | `#0D47A1` | Autonomia nacional |
| **Segurança** | Azul-claro | `#1976D2` | Proteção |
| **Integridade** | Ciano | `#00838F` | Debate público |
| **Caixa** | Amarelo | `#F9A825` | Dinheiro |
| **Capital Político** | Laranja | `#EF6C00` | Apoio no Congresso |
| **Legitimidade** | Vermelho | `#C62828` | Apoio popular |

### 14.02.4. Paleta de Cores Partidárias

As cores partidárias sinalizam a inclinação política das cartas:

| Cor | HEX | Espectro | Referência |
| :--- | :--- | :--- | :--- |
| **Vermelho** | `#C62828` | Esquerda | PT, PDT, PSOL |
| **Azul** | `#1565C0` | Centro-direita | PSDB, PSB |
| **Verde** | `#2E7D32` | Agronegócio | Bancada ruralista |
| **Amarelo** | `#F9A825` | Centro | MDB, Centrão |
| **Roxo** | `#6A1B9A` | Esquerda radical | PSOL, PSTU |
| **Laranja** | `#EF6C00` | Direita liberal | NOVO, Republicanos |
| **Preto** | `#212121` | Extrema-direita | PL, bolsonarismo |

### 14.02.5. Fundo e Contraste

| Elemento | Cor | HEX |
| :--- | :--- | :--- |
| **Fundo principal** | Cinza-escuro | `#263238` |
| **Fundo das cartas** | Cinza-médio | `#37474F` |
| **Texto principal** | Branco | `#FFFFFF` |
| **Texto secundário** | Cinza-claro | `#B0BEC5` |
| **Bordas** | Cinza-médio | `#546E7A` |

### 14.02.6. Fundamentação Teórica

A escolha das cores se baseia em:

1. **Psicologia das Cores (Eva Heller)** — cada cor tem um significado universal.
2. **Comunicação Política (Norberto Bobbio)** — as cores comunicam posicionamentos antes do texto.
3. **Acessibilidade (WCAG)** — contraste mínimo de 4.5:1 para texto.

> "As cores não são apenas um elemento estético. Elas comunicam valores e posicionamentos políticos antes mesmo que o leitor processe o texto." — Norberto Bobbio

### 14.02.7. Referências

- BOBBIO, Norberto. *Direita e Esquerda: Razões e Significados de uma Distinção Política*. São Paulo: UNESP, 1995.
- HELLER, Eva. *A Psicologia das Cores*. São Paulo: G. Gili, 2013.
- WCAG. *Web Content Accessibility Guidelines*. 2023.

---

## 14.03 — Tipografia

### 14.03.1. Fontes Utilizadas

O jogo usa **2 fontes** principais:

| Uso | Fonte | Justificativa |
| :--- | :--- | :--- |
| **Títulos** | Poppins | Moderna, geométrica, legível |
| **Corpo** | Inter | Legível em telas pequenas, neutra |

### 14.03.2. Tamanhos de Fonte

| Elemento | Tamanho | Peso |
| :--- | :--- | :--- |
| **Título da carta** | 24px | Bold (700) |
| **Problema da carta** | 18px | Regular (400) |
| **Opções** | 16px | Medium (500) |
| **Consequências** | 14px | Italic (400) |
| **Medidores (números)** | 14px | Bold (700) |
| **Medidores (nomes)** | 12px | Regular (400) |
| **Carta de Aprendizado (título)** | 20px | Bold (700) |
| **Carta de Aprendizado (corpo)** | 16px | Regular (400) |
| **Finais (título)** | 28px | Bold (700) |
| **Finais (citação)** | 18px | Italic (400) |
| **Finais (autor)** | 14px | Regular (400) |

### 14.03.3. Regras de Tipografia

| Regra | Descrição |
| :--- | :--- |
| **Maiúsculas** | Usar apenas em títulos e rótulos curtos |
| **Itálico** | Usar para citações e consequências |
| **Negrito** | Usar para destaque de palavras-chave |
| **Espaçamento** | 1.5 entre linhas para corpo de texto |
| **Alinhamento** | Alinhado à esquerda (nunca justificado) |
| **Comprimento de linha** | Máximo 60 caracteres por linha |

### 14.03.4. Fundamentação Teórica

A escolha tipográfica se baseia em:

1. **Legibilidade** — Poppins e Inter são fontes sem serifa, legíveis em telas pequenas.
2. **Modernidade** — ambas são fontes contemporâneas, alinhadas com o público jovem.
3. **Acessibilidade** — ambas têm boa legibilidade em diferentes tamanhos.

> "A tipografia é a arte de tornar a linguagem visível." — Robert Bringhurst, *The Elements of Typographic Style*

### 14.03.5. Referências

- BRINGHURST, Robert. *The Elements of Typographic Style*. Vancouver: Hartley & Marks, 1992.
- LUPTON, Ellen. *Thinking with Type*. New York: Princeton Architectural Press, 2004.

---

## 14.04 — Wireframes das Telas

### 14.04.1. Tela Inicial

┌─────────────────────────────────────────────────────────────┐
│ │
│ O PLANALTO │
│ │
│ [Logo do jogo — ícone estilizado] │
│ │
│ │
│ ► INICIAR JOGO │
│ │
│ ⚙ CONFIGURAÇÕES │
│ │
│ ℹ SOBRE O JOGO │
│ │
│ │
│ │
│ "Você decide. Mas alguém vai pagar a conta." │
│ │
└─────────────────────────────────────────────────────────────┘
text


**Elementos:**

| Elemento | Descrição |
| :--- | :--- |
| **Título** | "O PLANALTO" em Poppins Bold, 48px, verde |
| **Logo** | Ícone estilizado do Palácio do Planalto |
| **Botão Iniciar** | Botão retangular, verde, com ícone de play |
| **Botão Configurações** | Botão secundário, cinza |
| **Botão Sobre** | Botão secundário, cinza |
| **Frase** | Frase de impacto, itálico, cinza-claro |

### 14.04.2. Tela de Calibração Inicial

┌─────────────────────────────────────────────────────────────┐
│ CALIBRAÇÃO INICIAL 1/6 │
├─────────────────────────────────────────────────────────────┤
│ │
│ O governo deve priorizar segurança ou prevenção? │
│ │
│ ┌─────────────────────┐ ┌─────────────────────┐ │
│ │ │ │ │ │
│ │ SEGURANÇA │ │ PREVENÇÃO │ │
│ │ │ │ │ │
│ └─────────────────────┘ └─────────────────────┘ │
│ │
│ │
│ [PULAR CALIBRAÇÃO] │
│ │
└─────────────────────────────────────────────────────────────┘
text


**Elementos:**

| Elemento | Descrição |
| :--- | :--- |
| **Indicador de progresso** | "1/6" no canto superior direito |
| **Pergunta** | Poppins Bold, 24px, branco |
| **Opções** | Dois botões grandes, lado a lado |
| **Botão pular** | Botão pequeno, cinza, canto inferior direito |

### 14.04.3. Tela Principal (Carta)

┌─────────────────────────────────────────────────────────────┐
│ DIGNIDADE CONSCIÊNCIA SOBERANIA SEGURANÇA │
│ ████████░░ ██████░░░░ ███████░░░ ████████░░ │
│ │
│ INTEGRIDADE CAIXA CAP. POLÍTICO LEGITIMIDADE │
│ ███████░░░ ██████░░░░ ████████░░ ███████░░░ │
├─────────────────────────────────────────────────────────────┤
│ │
│ ┌─────────────────────────────────────────────────────┐ │
│ │ [Borda colorida — cor partidária] │ │
│ │ │ │
│ │ MINISTRO DA ECONOMIA │ │
│ │ │ │
│ │ "Senhor Presidente, a inflação está subindo. │ │
│ │ Precisamos conter os preços." │ │
│ │ │ │
│ │ ◀ ESQUERDA DIREITA ▶ │ │
│ │ Congelar preços Aumentar juros │ │
│ │ │ │
│ └─────────────────────────────────────────────────────┘ │
│ │
│ ANO 1 — MÊS 3/48 💰 R$ 500M │
└─────────────────────────────────────────────────────────────┘
text


**Elementos:**

| Elemento | Descrição |
| :--- | :--- |
| **Barra de medidores** | Topo da tela, 8 medidores com barras |
| **Carta** | Centro da tela, com borda colorida |
| **Personagem** | Nome do ator (ex: MINISTRO DA ECONOMIA) |
| **Problema** | Texto do dilema |
| **Opções** | Esquerda (◀) e Direita (▶) |
| **Rodapé** | Ano, mês, dinheiro |

### 14.04.4. Tela de Consequência

┌─────────────────────────────────────────────────────────────┐
│ DIGNIDADE CONSCIÊNCIA SOBERANIA SEGURANÇA │
│ ████████░░ ██████░░░░ ███████░░░ ████████░░ │
├─────────────────────────────────────────────────────────────┤
│ │
│ │
│ CONSEQUÊNCIA │
│ │
│ │
│ "Os preços congelados, mas as lojas │
│ ficaram sem produtos." │
│ │
│ │
│ │
│ │
│ [ CONTINUAR ] │
│ │
└─────────────────────────────────────────────────────────────┘
text


**Elementos:**

| Elemento | Descrição |
| :--- | :--- |
| **Barra de medidores** | Topo da tela (atualizada) |
| **Título** | "CONSEQUÊNCIA" em Poppins Bold |
| **Texto** | Frase curta, itálico, centralizado |
| **Botão** | "CONTINUAR" para avançar |

### 14.04.5. Tela de Carta de Aprendizado

┌─────────────────────────────────────────────────────────────┐
│ CARTA DE APRENDIZADO │
├─────────────────────────────────────────────────────────────┤
│ │
│ O QUE VOCÊ ACABOU DE VIVENCIAR: │
│ Você decidiu se aceitava ou não as mudanças do relator. │
│ │
│ O CONCEITO POR TRÁS: │
│ O relator tem poder de alterar o texto de um projeto. │
│ Isso se chama "poder de agenda". │
│ │
│ DADOS REAIS: │
│ A Eletrobras investiu apenas 1/5 do prometido após a │
│ privatização. 5 mil concursados foram demitidos. │
│ │
│ FONTE: Agência Senado, 2026. │
│ │
│ "O relator tem poder. Quem controla a pauta, controla o país."│
│ │
│ [ CONTINUAR ] │
│ │
└─────────────────────────────────────────────────────────────┘
text


**Elementos:**

| Elemento | Descrição |
| :--- | :--- |
| **Título** | "CARTA DE APRENDIZADO" |
| **Blocos** | Vivencia, Conceito, Dados, Fonte |
| **Frase de impacto** | Citação final em itálico |
| **Botão** | "CONTINUAR" para avançar |

### 14.04.6. Tela de Impeachment

┌─────────────────────────────────────────────────────────────┐
│ │
│ IMPEACHMENT PROCESS! │
│ │
│ VOTING │
│ │
│ │
│ [Silhueta Humana] │
│ │
│ │
│ ┌─────────────┐ ┌─────────────┐ │
│ │ 112 │ │ 62 │ │
│ │ (VERDE) │ │ (VERMELHO) │ │
│ └─────────────┘ └─────────────┘ │
│ │
│ │
│ A favor: 112 Contra: 62 │
│ │
└─────────────────────────────────────────────────────────────┘
text


**Elementos:**

| Elemento | Descrição |
| :--- | :--- |
| **Título** | "IMPEACHMENT PROCESS!" |
| **Subtítulo** | "VOTING" |
| **Figura** | Silhueta humana |
| **Placar** | Dois retângulos (verde e vermelho) |
| **Texto** | Contagem de votos |

### 14.04.7. Tela de Final

┌─────────────────────────────────────────────────────────────┐
│ │
│ │
│ BARBÁRIE │
│ │
│ │
│ O povo é reduzido à mera sobrevivência. │
│ A vida não vale nada. │
│ O Estado não existe mais para o povo. │
│ │
│ │
│ "O povo é o que há de mais reles. │
│ Seu destino é ser uma mera força de trabalho, │
│ um carvão humano que se queima na produção." │
│ │
│ — Darcy Ribeiro │
│ │
│ │
│ [ JOGAR NOVAMENTE ] [ COMPARTILHAR ] │
│ │
└─────────────────────────────────────────────────────────────┘
text


**Elementos:**

| Elemento | Descrição |
| :--- | :--- |
| **Título** | Nome do final (ex: "BARBÁRIE") |
| **Descrição** | 3 linhas sobre o final |
| **Citação** | Frase de impacto em itálico |
| **Autor** | Nome do autor |
| **Botões** | "JOGAR NOVAMENTE" e "COMPARTILHAR" |

### 14.04.8. Fundamentação Teórica

Os wireframes foram construídos com base em:

1. **Hierarquia Visual** — o que é mais importante aparece primeiro.
2. **Lei de Fitts** — botões maiores e mais próximos são mais fáceis de clicar.
3. **Princípio da Proximidade** — elementos relacionados ficam juntos.

### 14.04.9. Referências

- NORMAN, Donald. *The Design of Everyday Things*. New York: Basic Books, 1988.
- KRUG, Steve. *Don't Make Me Think*. San Francisco: New Riders, 2000.
- LIDWELL, William; HOLDEN, Kritina; BUTLER, Jill. *Universal Principles of Design*. Beverly: Rockport, 2010.

---

## 14.05 — Ícones

### 14.05.1. Ícones dos Medidores

| Medidor | Ícone | Descrição Visual |
| :--- | :--- | :--- |
| **Dignidade** | 🏠 | Casa (moradia, direitos) |
| **Consciência** | 📚 | Livro (educação, pensamento) |
| **Soberania** | 🇧🇷 | Bandeira (autonomia nacional) |
| **Segurança** | 🛡️ | Escudo (proteção) |
| **Integridade** | 🔍 | Lupa (verdade, transparência) |
| **Caixa** | 💰 | Moeda (dinheiro) |
| **Capital Político** | 🏛️ | Congresso (poder político) |
| **Legitimidade** | 👥 | Povo (apoio popular) |

### 14.05.2. Ícones dos Atores

| Ator | Ícone | Descrição Visual |
| :--- | :--- | :--- |
| **Latifundiários** | 🌾 | Trigo (terra) |
| **Investidores da Faria Lima** | 📈 | Gráfico (mercado financeiro) |
| **Construtoras** | 🏗️ | Construção (especulação) |
| **Empresariado Industrial** | 🏭 | Fábrica (indústria) |
| **Setor de Universidades Privadas** | 🎓 | Diploma (ensino privado) |
| **Mercado** | 💹 | Gráfico crescente (capital) |
| **Tecnocratas** | 📊 | Gráfico (planejamento) |
| **Militares** | 🎖️ | Medalha (hierarquia) |
| **Servidores Públicos** | 🏛️ | Prédio público (Estado) |
| **Diplomatas do Itamaraty** | 🌐 | Globo (política externa) |
| **Líder da Câmara** | 🗳️ | Urna (Congresso) |
| **Pastores** | ✝️ | Cruz (religião) |
| **Sindicato dos Professores** | 📚 | Livro (educação) |
| **Profissionais da Saúde** | 🩺 | Estetoscópio (saúde) |
| **Líder Sindical** | ✊ | Punho erguido (trabalhadores) |
| **MTST** | 🏘️ | Casa (moradia) |
| **MST** | 🌱 | Planta (terra) |
| **Movimentos Ambientais** | 🌳 | Árvore (meio ambiente) |
| **Artista Engajado** | 🎨 | Paleta (arte) |
| **Meta** | 📱 | Celular (tecnologia) |
| **Impérios Geopolíticos** | 🌍 | Mundo (geopolítica) |
| **Coach Digital** | 💪 | Braço forte (meritocracia) |
| **Jornalista Independente** | 📰 | Jornal (imprensa) |
| **Influenciador Progressista** | 📢 | Megafone (redes sociais) |

### 14.05.3. Ícones de Interface

| Elemento | Ícone | Descrição |
| :--- | :--- | :--- |
| **Iniciar** | ▶ | Play |
| **Configurações** | ⚙ | Engrenagem |
| **Sobre** | ℹ | Informação |
| **Continuar** | → | Seta |
| **Jogar Novamente** | ↺ | Seta circular |
| **Compartilhar** | ↗ | Seta para fora |
| **Pular** | ⏭ | Avançar |

### 14.05.4. Estilo dos Ícones

| Característica | Descrição |
| :--- | :--- |
| **Estilo** | Vetorial, minimalista |
| **Cor** | Branco ou cinza-claro |
| **Fundo** | Transparente |
| **Tamanho** | 24x24px (interface), 32x32px (medidores) |
| **Biblioteca** | Font Awesome (CC0) ou similar |

### 14.05.5. Fundamentação Teórica

A escolha dos ícones se baseia em:

1. **Reconhecimento Imediato** — ícones universais (casa, livro, escudo) são reconhecidos rapidamente.
2. **Consistência Visual** — todos os ícones seguem o mesmo estilo.
3. **Acessibilidade** — ícones com contraste alto e descrição textual.

### 14.05.6. Referências

- LIDWELL, William; HOLDEN, Kritina; BUTLER, Jill. *Universal Principles of Design*. Beverly: Rockport, 2010.
- FONT AWESOME. *Free Icons*. 2026.

---

## 14.06 — Feedback Visual

### 14.06.1. Feedback das Barras de Medidores

| Ação | Feedback Visual | Duração |
| :--- | :--- | :--- |
| **Medidor sobe** | Barra enche com animação verde | 0.5s |
| **Medidor desce** | Barra esvazia com animação vermelha | 0.5s |
| **Medidor crítico** | Barra pisca em vermelho | Contínuo |
| **Medidor extremo** | Barra pisca em azul | Contínuo |

### 14.06.2. Feedback das Cartas

| Ação | Feedback Visual | Duração |
| :--- | :--- | :--- |
| **Arrastar para esquerda** | Carta inclina para esquerda | Contínuo |
| **Arrastar para direita** | Carta inclina para direita | Contínuo |
| **Soltar carta** | Carta desaparece para o lado escolhido | 0.3s |
| **Nova carta** | Carta aparece do centro | 0.3s |

### 14.06.3. Feedback dos Botões

| Ação | Feedback Visual | Duração |
| :--- | :--- | :--- |
| **Hover** | Botão muda de cor (mais claro) | 0.2s |
| **Click** | Botão escurece | 0.1s |
| **Desabilitado** | Botão fica cinza | — |

### 14.06.4. Feedback dos Eventos Encadeados

| Ação | Feedback Visual | Duração |
| :--- | :--- | :--- |
| **Evento ativado** | Tela pisca em amarelo | 0.5s |
| **Aviso especial** | Mensagem aparece no topo | 3s |
| **Efeito aplicado** | Medidores piscam | 0.5s |

### 14.06.5. Fundamentação Teórica

O feedback visual se baseia em:

1. **Feedback Imediato (Norman)** — o usuário deve saber imediatamente o resultado de sua ação.
2. **Reforço Positivo** — animações de sucesso reforçam o comportamento.
3. **Alerta Visual** — cores de alerta (vermelho, amarelo) chamam atenção para problemas.

> "O feedback é a informação que o usuário recebe sobre o resultado de sua ação." — Donald Norman

### 14.06.6. Referências

- NORMAN, Donald. *The Design of Everyday Things*. New York: Basic Books, 1988.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.

---

## 14.07 — Animações

### 14.07.1. Animações de Transição

| Transição | Descrição | Duração |
| :--- | :--- | :--- |
| **Tela inicial → Calibração** | Fade out/in | 0.5s |
| **Calibração → Jogo** | Slide da esquerda | 0.5s |
| **Carta → Consequência** | Fade out/in | 0.3s |
| **Consequência → Carta de Aprendizado** | Slide de baixo | 0.3s |
| **Carta de Aprendizado → Próxima Carta** | Fade out/in | 0.3s |
| **Jogo → Final** | Fade para preto | 1.0s |

### 14.07.2. Animações de Elementos

| Elemento | Animação | Duração |
| :--- | :--- | :--- |
| **Medidores** | Preenchimento da barra | 0.5s |
| **Cartas** | Entrada do centro | 0.3s |
| **Botões** | Hover e click | 0.2s |
| **Ícones** | Pulso em alertas | 0.5s |
| **Texto** | Aparecimento letra por letra | 0.05s por letra |

### 14.07.3. Princípios de Animação

O design das animações segue os **12 princípios de animação da Disney**:

| # | Princípio | Aplicação no Jogo |
| :--- | :--- | :--- |
| 1 | **Squash and Stretch** | Botões comprimem ao clicar |
| 2 | **Anticipation** | Carta inclina antes de sair |
| 3 | **Staging** | Foco no elemento principal |
| 4 | **Straight Ahead / Pose to Pose** | Animações frame a frame |
| 5 | **Follow Through / Overlapping** | Elementos continuam após a ação |
| 6 | **Slow In / Slow Out** | Animações começam e terminam devagar |
| 7 | **Arc** | Elementos se movem em arcos |
| 8 | **Secondary Action** | Elementos secundários reforçam a ação |
| 9 | **Timing** | Duração adequada para cada ação |
| 10 | **Exaggeration** | Ênfase em ações importantes |
| 11 | **Solid Drawing** | Elementos com volume e peso |
| 12 | **Appeal** | Animações agradáveis e envolventes |

### 14.07.4. Fundamentação Teórica

As animações se baseiam em:

1. **12 Princípios da Disney** — os princípios clássicos de animação.
2. **Teoria do Flow (Csikszentmihalyi)** — animações suaves mantêm o jogador no flow.
3. **Feedback Visual (Norman)** — animações são feedback.

### 14.07.5. Referências

- THOMAS, Frank; JOHNSTON, Ollie. *The Illusion of Life: Disney Animation*. New York: Hyperion, 1981.
- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.

---

## 14.08 — Acessibilidade

### 14.08.1. Recursos de Acessibilidade

| Recurso | Descrição |
| :--- | :--- |
| **Modo daltônico** | Padrões além de cores (ícones, formas) |
| **Tamanho de texto ajustável** | 3 tamanhos (pequeno, médio, grande) |
| **Leitor de tela** | Descrições de áudio para as cartas |
| **Alto contraste** | Modo de alto contraste para baixa visão |
| **Navegação por teclado** | Suporte a teclado para PC |

### 14.08.2. Modo Daltônico

| Elemento | Cor Padrão | Modo Daltônico |
| :--- | :--- | :--- |
| **Medidor positivo** | Verde | ✅ + padrão de bolinhas |
| **Medidor neutro** | Amarelo | ⚠️ + padrão de listras |
| **Medidor negativo** | Vermelho | ❌ + padrão de cruzes |
| **Cores partidárias** | Cores | Padrões distintos para cada espectro |

### 14.08.3. Tamanho de Texto

| Tamanho | Descrição |
| :--- | :--- |
| **Pequeno** | 14px (padrão) |
| **Médio** | 18px |
| **Grande** | 22px |

### 14.08.4. Leitor de Tela

| Elemento | Descrição |
| :--- | :--- |
| **Cartas** | Texto lido em voz alta |
| **Medidores** | Nome e valor lidos |
| **Botões** | Nome e função lidos |
| **Consequências** | Texto lido em voz alta |

### 14.08.5. Fundamentação Teórica

A acessibilidade se baseia em:

1. **Design Universal (Ron Mace)** — o design deve ser acessível ao maior número possível de pessoas.
2. **WCAG** — diretrizes de acessibilidade para conteúdo web.
3. **Inclusão** — o jogo deve incluir pessoas com deficiências.

> "O design universal não é um luxo. É uma necessidade." — Ron Mace

### 14.08.6. Referências

- MACE, Ron. *Universal Design: Housing for the Lifespan of All People*. 1988.
- WCAG. *Web Content Accessibility Guidelines*. 2023.

---

## 14.09 — Layout das Cartas

### 14.09.1. Estrutura da Carta

┌─────────────────────────────────────────────────────────────┐
│ [Borda colorida — cor partidária — 4px] │
│ │
│ ┌─────────────────────────────────────────────────────┐ │
│ │ │ │
│ │ [NOME DO ATOR] │ │
│ │ Poppins Bold, 16px, cinza-claro │ │
│ │ │ │
│ │ [PROBLEMA] │ │
│ │ Inter Regular, 18px, branco │ │
│ │ │ │
│ │ ◀ ESQUERDA DIREITA ▶ │ │
│ │ [OPÇÃO A] [OPÇÃO B] │ │
│ │ Inter Medium, 16px Inter Medium, 16px │ │
│ │ │ │
│ └─────────────────────────────────────────────────────┘ │
│ │
└─────────────────────────────────────────────────────────────┘
text


### 14.09.2. Dimensões da Carta

| Elemento | Dimensão |
| :--- | :--- |
| **Largura** | 100% da tela (mobile), 600px (PC) |
| **Altura** | 60% da tela (mobile), 400px (PC) |
| **Padding** | 24px |
| **Borda** | 4px (cor partidária) |
| **Border-radius** | 16px |
| **Sombra** | 0 4px 12px rgba(0,0,0,0.3) |

### 14.09.3. Cores da Carta

| Elemento | Cor | HEX |
| :--- | :--- | :--- |
| **Fundo** | Cinza-médio | `#37474F` |
| **Borda** | Cor partidária | Variável |
| **Nome do ator** | Cinza-claro | `#B0BEC5` |
| **Problema** | Branco | `#FFFFFF` |
| **Opções** | Branco | `#FFFFFF` |

### 14.09.4. Fundamentação Teórica

O layout das cartas se baseia em:

1. **Hierarquia Visual** — nome do ator, problema, opções.
2. **Lei de Fitts** — botões grandes e próximos.
3. **Contraste** — texto claro em fundo escuro.

### 14.09.5. Referências

- LIDWELL, William; HOLDEN, Kritina; BUTLER, Jill. *Universal Principles of Design*. Beverly: Rockport, 2010.
- NORMAN, Donald. *The Design of Everyday Things*. New York: Basic Books, 1988.

---

## 14.10 — Checklist de Qualidade

### 14.10.1. Para UI

| # | Item | ✅ |
| :--- | :--- | :--- |
| 1 | A interface é clara em menos de 3 segundos? | ☐ |
| 2 | As cores têm contraste adequado? | ☐ |
| 3 | A tipografia é legível em mobile? | ☐ |
| 4 | Os ícones são reconhecíveis? | ☐ |
| 5 | Os botões são grandes o suficiente? | ☐ |
| 6 | O feedback visual é imediato? | ☐ |
| 7 | As animações são suaves? | ☐ |
| 8 | O layout é consistente? | ☐ |
| 9 | A navegação é intuitiva? | ☐ |
| 10 | O jogo é acessível? | ☐ |

### 14.10.2. Para UX

| # | Item | ✅ |
| :--- | :--- | :--- |
| 1 | O jogador entende o objetivo do jogo? | ☐ |
| 2 | O jogador entende as mecânicas? | ☐ |
| 3 | O jogador se sente engajado? | ☐ |
| 4 | O jogador aprende algo novo? | ☐ |
| 5 | O jogador quer jogar novamente? | ☐ |
| 6 | O jogo é frustrante demais? | ☐ |
| 7 | O jogo é fácil demais? | ☐ |
| 8 | O jogo respeita o tempo do jogador? | ☐ |
| 9 | O jogo é acessível? | ☐ |
| 10 | O jogo cumpre seu objetivo educativo? | ☐ |

---

## 14.11 — Referências

### 14.11.1. Design

- BRINGHURST, Robert. *The Elements of Typographic Style*. Vancouver: Hartley & Marks, 1992.
- HELLER, Eva. *A Psicologia das Cores*. São Paulo: G. Gili, 2013.
- KRUG, Steve. *Don't Make Me Think*. San Francisco: New Riders, 2000.
- LIDWELL, William; HOLDEN, Kritina; BUTLER, Jill. *Universal Principles of Design*. Beverly: Rockport, 2010.
- LUPTON, Ellen. *Thinking with Type*. New York: Princeton Architectural Press, 2004.
- NORMAN, Donald. *The Design of Everyday Things*. New York: Basic Books, 1988.

### 14.11.2. Animação

- THOMAS, Frank; JOHNSTON, Ollie. *The Illusion of Life: Disney Animation*. New York: Hyperion, 1981.

### 14.11.3. Acessibilidade

- MACE, Ron. *Universal Design: Housing for the Lifespan of All People*. 1988.
- WCAG. *Web Content Accessibility Guidelines*. 2023.

### 14.11.4. Design de Jogos

- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.
- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.

### 14.11.5. Comunicação Política

- BOBBIO, Norberto. *Direita e Esquerda: Razões e Significados de uma Distinção Política*. São Paulo: UNESP, 1995.

---

**Última atualização:** Outubro de 2026
**Versão:** 1.0 (completa)