# 14 — UI/UX Design

**Interface e experiência do jogador em "O Planalto"**

Este documento define as telas, o HUD, a carta, o gesto de arrastar, as animações e a acessibilidade do jogo. Foi **reescrito do zero no P-010** (2026-10-13): a versão anterior trazia telas, números e citações inventados. Tudo aqui vem de decisão do PO ou do GDD (`gdd/GDD.md`); o que ainda não foi decidido está em §14.13.

---

## 14.01 — Princípios

Os pilares do GDD (§2) aplicados à interface:

| Pilar | Na interface |
| :--- | :--- |
| **Consequência > Escolha** | Durante o arraste não há pista sobre os medidores; o efeito só aparece depois da escolha (§14.05) |
| **Simplicidade > Complexidade** | Um gesto (arrastar) controla a carta e a calibração; sem menus profundos |
| **Vivência > Explicação** | A Carta de Aprendizado é curta; o detalhe fica em "saiba mais" (§14.07) |
| **Ambos os lados > Um lado** | Sem rótulo "esquerda/direita"; o lado de cada opção é sorteado (§14.04) |
| **Reflexão > Resposta** | Números dos medidores só aparecem no final (§14.09) |

---

## 14.02 — Orientação e Layout

| Item | Definição |
| :--- | :--- |
| **Orientação** | Retrato (vertical) |
| **Mobile** | Tela cheia |
| **PC e Web** | Coluna central em retrato; laterais vazias ou decoradas |

**Estrutura da tela de jogo (de cima para baixo):**

```
┌───────────────────────────────┐
│  HUD — 8 ícones de medidor    │
├───────────────────────────────┤
│                               │
│   Retrato de quem fala        │
│   Nome do ator / instituição  │
│                               │
│   Problema (2 linhas)         │
│                               │
│   [carta arrastável]          │
│                               │
├───────────────────────────────┤
│  Ano · Fase · carta X/Y       │
└───────────────────────────────┘
```

O rodapé mostra só ano, fase e posição no turno (ex.: "Ano 1 · Lua de Mel · 3/7"). Não há meses nem dinheiro em reais: o `Caixa` é um medidor de 0 a 100.

---

## 14.03 — HUD dos Medidores

| Item | Definição |
| :--- | :--- |
| **Forma** | 8 ícones que "enchem" (preenchimento proporcional ao valor) |
| **Números** | Não aparecem durante a partida; só na tela final (§14.09) |
| **Cor** | Muda conforme a faixa do medidor (paleta própria, §14.11.3) |
| **Ordem** | Sociais (Dignidade, Consciência, Soberania, Segurança, Integridade) e Poder (Caixa, Capital Político, Legitimidade) — GDD §6.1.1 |

**Ícones (GDD §10.4):**

| Medidor | Ícone |
| :--- | :--- |
| Dignidade | Casa |
| Consciência | Livro |
| Soberania | Bandeira |
| Segurança | Escudo |
| Integridade | Lupa |
| Caixa | Moeda |
| Capital Político | Congresso |
| Legitimidade | Povo |

---

## 14.04 — A Carta

### 14.04.1. Quem fala

A carta mostra o **retrato e o nome de quem apresenta o problema**: um dos **24 atores** (`docs/11_FICHAS_DOS_ATORES.md`) ou uma **instituição** dos 10 modos (ex.: Câmara, Senado, STF). Não há outros personagens (D-087: o jogador é o Presidente; a carta fala com ele).

### 14.04.2. Opções e lado

| Regra | Definição |
| :--- | :--- |
| **Duas opções** | `opcao_a` e `opcao_b` nos dados (doc 13, doc 17) |
| **Lado sorteado** | A cada partida, o jogo sorteia qual opção vai para cada lado |
| **Sem rótulo** | O jogo nunca escreve "esquerda", "direita", "◀" ou "▶" (D-084) |
| **Texto revelado** | O texto da opção aparece só enquanto o jogador arrasta para aquele lado |

### 14.04.3. Borda partidária

Cada opção tem uma **cor partidária** (D-092). Enquanto o jogador arrasta, a borda da carta muda para a cor de quem propõe a opção daquele lado.

- Toda opção tem cor; não há borda neutra.
- A borda tem **contorno branco de 2-3 px** em todas as cores, para garantir contraste (§14.11.2).
- As cores e o significado de cada uma estão em §14.11.2.

### 14.04.4. Gesto

| Ação | Resposta |
| :--- | :--- |
| Arrastar | A carta acompanha o dedo e inclina; o texto da opção e a cor da borda aparecem. Nenhuma pista sobre os medidores |
| Soltar antes do limite | A carta volta ao centro |
| Soltar além do limite | A escolha é confirmada e a carta sai pelo lado |

O limite de arraste fica para o protótipo (§14.13).

---

## 14.05 — Pontos de Efeito

**Durante o arraste não há pista** sobre os medidores (decisão do PO, 2026-10-13). **Depois de soltar a carta**, aparece um ponto sobre cada medidor que mudou, enquanto o ícone enche ou esvazia.

| Tamanho do ponto | Efeito |
| :--- | :--- |
| **Pequeno** | Até 10 pontos |
| **Grande** | Acima de 10 pontos |

O ponto **não indica direção**; a direção aparece no próprio ícone, que enche ou esvazia.

---

## 14.06 — Consequência

Depois da escolha, aparece a **frase de consequência** (1 linha) sobre o HUD já atualizado. A tela **espera o toque** do jogador para seguir.

---

## 14.07 — Carta de Aprendizado

| Camada | Conteúdo |
| :--- | :--- |
| **Resumo (sempre)** | Conceito por trás (bloco 2) + frase de impacto (bloco 5) |
| **"Saiba mais" (ao tocar)** | O que você vivenciou (1), dados reais (3) e fonte (4) |

O texto vem do doc 18 (D-090). Dado sem fonte verificada não aparece no jogo (D-091).

---

## 14.08 — Impeachment

Cena especial, separada do fluxo normal de cartas.

| Fase (GDD §6.5.2) | Tela |
| :--- | :--- |
| 1. O Pedido | Carta com moldura de crise |
| 2. A Comissão | Carta + placar da comissão especial |
| 3. A Votação | Carta + placar da Câmara: 513 deputados, 342 votos (2/3) para autorizar |
| 4. O Julgamento | Carta + placar do Senado: 81 senadores, 54 votos (2/3) para condenar |
| 5. O Desfecho | Absolvição ou condenação |

- Transição de entrada: corte dramático; tela escurece e os placares entram em sequência (§14.10).
- Como os votos de cada placar são calculados fica para o GDD do sistema de Impeachment (§14.13).

---

## 14.09 — Tela Final

| Elemento | Conteúdo |
| :--- | :--- |
| **Nome do final** | Um dos 26 finais |
| **Descrição** | Curta |
| **Citação** | Frase e autor (doc 04; nomes reais mantidos — D-083) |
| **Epílogo** | Eventos encadeados que voltariam depois do Ano 4 |
| **Eixo ideológico** | Gráfico de radar com os 4 eixos (GDD §6.6) |
| **Medidores** | Valores finais dos 8 medidores, agora com números |
| **Botões** | Jogar novamente · Compartilhar |

Medidor em 0 leva a esta tela **na hora** (D-089).

---

## 14.10 — Animações e Transições

Proposta do GF aprovada pelo PO (2026-10-13). **Todas as durações devem ser validadas no protótipo**; a API de animação do Godot não foi conferida `[não verificado]`.

### 14.10.1. Animações

| Elemento | Animação | Duração |
| :--- | :--- | :--- |
| Medidor muda de valor | Preenchimento sobe ou desce suavemente | 300-500 ms |
| Medidor muda de faixa | Troca de cor + pulso (escala 1,0 → 1,1 → 1,0) | 200 ms (pulso) + 250 ms (cor) |
| Pontos sobre os medidores | Surgem com "pop" e somem | 400-600 ms, 100 ms após soltar |
| Borda partidária | Muda de cor junto com o arraste | Contínua |
| Texto da opção | Fade + leve deslize (8-12 px) | 150 ms |
| Carta sai | Desliza e some para o lado escolhido | 250-350 ms |
| Consequência | Fade-in; espera o toque | — |
| Carta de Aprendizado | Sobe de baixo, como uma folha | 300 ms |
| Aviso de evento encadeado | Destaque na borda da tela + ícone | 400 ms |
| Medidor chega a 0 | Ícone se estilhaça; corte para o final | 500-800 ms |
| Impeachment | Tela escurece; placares em sequência | 1,5-2,5 s |
| Calibração | Igual à carta, sem pontos | Igual à carta |

### 14.10.2. Transições

| De → Para | Transição | Duração |
| :--- | :--- | :--- |
| Menu → Calibração | Fade | 300 ms |
| Calibração → Ano 1 | Fade com leve zoom | 400 ms |
| Virada de ano | Cartão "Ano X" | 600-800 ms |
| Jogo → Impeachment | Corte dramático | ≥ 500 ms |
| Jogo → Final | Fade para preto, depois o texto | ≥ 500 ms + pausa |

### 14.10.3. Reduzir movimento

Opção nas configurações. Remove pulsos, "pop", deslizes, zoom e flash. Mantém fades curtos e o preenchimento dos medidores (é informação, não decoração).

---

## 14.11 — Paleta e Tipografia

### 14.11.1. Paleta da interface (GDD §10.1)

| Uso | Cor | HEX |
| :--- | :--- | :--- |
| Primária | Verde | `#2E7D32` |
| Secundária | Azul | `#1565C0` |
| Terciária | Cinza | `#37474F` |
| Alerta | Vermelho | `#C62828` |
| Destaque | Amarelo | `#F9A825` |
| Fundo | Cinza-escuro | `#263238` |
| Fundo da carta | Cinza-médio | `#37474F` |
| Texto | Branco | `#FFFFFF` |
| Texto secundário | Cinza-claro | `#B0BEC5` |

**Contraste do texto (calculado pelo TA, WCAG):** branco sobre `#263238` 13,24:1; branco sobre `#37474F` 9,65:1; `#B0BEC5` sobre `#263238` 6,94:1; `#B0BEC5` sobre `#37474F` 5,06:1. Todos passam AA.

### 14.11.2. Cores partidárias (D-030, D-092)

Mantidas pelo PO com referência a partidos reais.

| Cor | HEX | Espectro | Referência |
| :--- | :--- | :--- | :--- |
| Vermelho | `#C62828` | Esquerda | PT, PDT, PSOL |
| Azul | `#1565C0` | Centro-direita | PSDB, PSB |
| Verde | `#2E7D32` | Agronegócio | Bancada ruralista |
| Amarelo | `#F9A825` | Centro | MDB, Centrão |
| Roxo | `#6A1B9A` | Esquerda radical | PSOL, PSTU |
| Laranja | `#EF6C00` | Direita liberal | NOVO, Republicanos |
| Preto | `#212121` | Extrema-direita | PL, bolsonarismo |

**Contraste da borda sobre `#263238` (TA):** Amarelo 6,72:1 e Laranja 4,30:1 passam o mínimo de 3:1; Verde 2,58, Vermelho 2,36, Azul 2,30, Roxo 1,41 e Preto 1,22 não passam. Por isso **toda borda partidária tem contorno branco de 2-3 px**.

### 14.11.3. Cores das faixas dos medidores

Paleta própria, separada das cores partidárias e da paleta da interface. Escala única de ciano, do escuro (crítico) ao claro (extremo). O claro **não** significa "bom": 81-100 é instável (GDD §5.2). Proposta do TA, aprovada pelo PO (2026-10-13).

| Faixa | Significado (GDD §5.2) | HEX | Contraste sobre `#263238` |
| :--- | :--- | :--- | :--- |
| 0-20 | Crítico | `#0097A7` | 3,78:1 |
| 21-40 | Baixo | `#00ACC1` | 4,83:1 |
| 41-60 | Médio | `#26C6DA` | 6,41:1 |
| 61-80 | Alto | `#4DD0E1` | 7,20:1 |
| 81-100 | Extremo | `#80DEEA` | 8,55:1 |

Padrões para o futuro modo daltônico (proposta do TA, pós-MVP): 0-20 sólido + "!"; 21-40 hachura densa; 41-60 pontilhado; 61-80 hachura leve; 81-100 contorno vazado + "?".

### 14.11.4. Tipografia

| Uso | Fonte |
| :--- | :--- |
| Títulos | Poppins |
| Corpo | Inter |

**Tamanhos de texto (configuração):** 16, 20 e 24 px; **padrão 18 px** (revisa GDD §10.2 e §10.5). A escala dos títulos fica para o protótipo (§14.13).

---

## 14.12 — Telas de Apoio

| Tela | Conteúdo |
| :--- | :--- |
| **Inicial** | Título, avisos de conteúdo (GDD §14.3), Iniciar, Configurações, Sobre |
| **Tutorial** | 3-4 telas curtas antes da calibração: arrastar, medidores, pontos de efeito, Carta de Aprendizado (texto no doc 16) |
| **Calibração** | 6 perguntas, uma por tela, respondidas **arrastando** como as cartas (doc 15) |
| **Configurações** | Áudio e as opções de acessibilidade de §14.12.1 |
| **Sobre** | Créditos e licenças (doc 16) |

### 14.12.1. Acessibilidade

| Recurso | Status |
| :--- | :--- |
| Tamanho de texto (16/20/24) | Planejado (GDD §10.5) |
| Reduzir movimento | Planejado (proposta GF aprovada) |
| Alto contraste | Planejado (GDD §10.5) |
| Navegação por teclado (PC) | Planejado (GDD §10.5) |
| Leitor de tela | Planejado; suporte no Godot `[não verificado]` |
| Modo daltônico (padrões nos medidores + símbolo do partido na carta) | **Depois do MVP** |

---

## 14.13 — Pendências

| # | Pendência | Dono |
| :--- | :--- | :--- |
| 1 | Limite de arraste para confirmar a escolha | Protótipo (GF/DEV) |
| 2 | Fórmula dos votos nos placares do impeachment | GDD de Impeachment |
| 3 | Escala dos títulos para cada tamanho de texto | Protótipo (UX) |
| 4 | Estilo dos retratos: geométricos simples ou arte vetorizada, CC0 ou feitos à mão, sem IA generativa (D-007) | TA + PO |
| 5 | Validação das durações de animação no Godot | Protótipo (DEV) |
| 6 | Modo daltônico | Pós-MVP |

---

**Última atualização:** 2026-10-13 (P-010)
**Versão:** 2.0 (reescrita)
