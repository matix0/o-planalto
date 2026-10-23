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
| **Rastro** | Durante o preenchimento, um rastro marca o nível anterior, para a variação pequena ficar visível; sem número nem direção (D-161) |
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

A carta mostra o **retrato e o nome de quem apresenta o problema**: um dos **24 atores** (`docs/11_FICHAS_DOS_ATORES.md`) ou uma **instituição** dos 10 modos (ex.: Câmara, Senado, STF). Não há outros personagens (D-087: o jogador é o Presidente; a carta fala com ele). O dado vem do campo `quem_fala` da carta (D-164, `gdd/sistemas/05_cartas.md` §3.2).

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
- O filete branco fica **dos dois lados** da faixa partidária, porque roxo e preto quase somem contra o fundo da carta (D-156).
- As cores e o significado de cada uma estão em §14.11.2.
- **Calibração:** as respostas não têm cor partidária; a borda é só o filete branco (D-166, exceção à regra acima).

### 14.04.4. Gesto

| Ação | Resposta |
| :--- | :--- |
| Arrastar | A carta acompanha o dedo e inclina; o texto da opção e a cor da borda aparecem. Nenhuma pista sobre os medidores |
| Soltar antes do limite | A carta volta ao centro |
| Soltar além do limite | A escolha é confirmada e a carta sai pelo lado |
| Tocar numa metade da carta (alternativa ao arraste) | Revela a opção daquele lado: texto e cor da borda, como no arraste |
| Tocar de novo na mesma metade | A escolha é confirmada e a carta sai pelo lado |

**Limite de arraste (D-146):** 40% da largura da carta ou flick de 700 px/s, valores iniciais a ajustar no protótipo.

**Trava do flick (D-153):** o flick só confirma se o texto daquela opção já apareceu ou se a carta já andou 20-25% da largura, para o jogador não decidir sem ler. Qual medida de velocidade usar no Godot (`screen_velocity` ou `velocity`) é testado no protótipo (D-154).

**Alternativa ao arraste (D-145):** exigida pelo WCAG 2.2, critério 2.5.7 (nível AA). Não mostra rótulo de lado (D-084). Tocar a outra metade troca a opção revelada; tocar fora da carta cancela; sem tempo limite. O 2º toque só é aceito 0,5 s depois do 1º (D-157).

**Dica contextual (D-163):** se a carta fica parada 4 s, aparece "Arraste a carta ou toque em um lado para ver a opção" (P-017). As duas opções também ficam sempre nos cantos de baixo da carta, com seta (D-202).

**Sensibilidade (D-158):** nas Configurações, o jogador pode baixar o limite de arraste de 40% até 25% da largura.

---

## 14.05 — Pontos de Efeito

**Durante o arraste não há pista** sobre os medidores (decisão do PO, 2026-10-13). **Depois de soltar a carta**, aparece um ponto sobre cada medidor que mudou, enquanto o ícone enche ou esvazia.

| Tamanho do ponto | Efeito |
| :--- | :--- |
| **Pequeno** | Até 10 pontos |
| **Grande** | Acima de 10 pontos |

Os dois diferem também pela forma (D-156): o pequeno é um círculo branco sólido (~6 dp); o grande é um círculo de ~10 dp com anel externo (~14 dp). Valores a validar nos wireframes.

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

A folha é **modal**, com fundo escurecido, para que um toque na folha não dispare a próxima carta (D-160).

O texto vem do doc 18 (D-090). Dado sem fonte verificada não aparece no jogo (D-091).

---

## 14.08 — Impeachment

Cena especial, separada do fluxo normal de cartas.

| Fase (GDD §6.5.2) | Tela |
| :--- | :--- |
| 1. O Pedido | Carta com moldura de crise |
| 2. A Comissão | Carta + placar da comissão especial |
| 3. A Votação | Carta + placar da Câmara: 513 deputados, 342 votos (2/3) para autorizar |
| 4. O Julgamento | Carta + placar do Senado só com a meta (— / 81, quórum 54); a barra preenchida aparece no resultado (D-168) |
| 5. O Desfecho | Absolvição ou condenação |

**Placares (D-156):** barra com os votos favoráveis em branco e os contrários em fundo escuro hachurado, mais uma linha fixa marcando o quórum (342 ou 54) e o número grande. Nunca verde nem vermelho, que são cores partidárias.

- Transição de entrada: corte dramático; tela escurece e os placares entram em sequência (§14.10).
- Como os votos de cada placar são calculados fica para o GDD do sistema de Impeachment (§14.13).

---

## 14.09 — Tela Final

| Elemento | Conteúdo |
| :--- | :--- |
| **Nome do final** | Um dos 28 finais (D-096, D-122) |
| **Descrição** | Curta |
| **Citação** | Frase e autor (doc 04; nomes reais mantidos — D-083) |
| **Epílogo** | Eventos encadeados que voltariam depois do Ano 4 |
| **Eixo ideológico** | Radar de 8 pontas com dois traçados ("o que você disse" × "como você governou") + texto do eixo predominante (`gdd/sistemas/04_eixo.md`) |
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

**D-199 (P-017, 2026-10-22):** volta a paleta da "ideia inicial" e revê a D-159 e a D-172. A cor partidária continua só na borda da opção (D-092); a cor do medidor só no HUD. Viewport base 390×844 com `canvas_items` + `expand` (D-170); coluna do PC até 430 px (D-171). Valores em `jogo/scripts/ui/tokens.gd`.

| Uso | Cor | HEX |
| :--- | :--- | :--- |
| Botão primário | Verde (texto branco, 5,1:1) | `#2E7D32` (hover `#296F2D`, pressionado `#256428`) |
| Destaque (quem fala, título da carta, cabeçalho da calibração) | Ciano | `#80DEEA` |
| Impeachment e medidor crítico (≤ 20) | Vermelho | `#EF5350` |
| Medidor subiu / caiu (D-203) | Verde-claro / vermelho-claro | `#A5D6A7` / `#FF8A80` |
| Fundo | Cinza-escuro | `#263238` |
| Fundo da carta | Cinza-médio | `#37474F` |
| Fundo da cena de impeachment | Quase preto | `#1A1416` |
| Texto | Branco | `#FFFFFF` |
| Texto secundário | Cinza-claro | `#B0BEC5` |

**Cor de cada medidor no HUD** (clareada a ≥ 3:1 sobre o poço `#37474F`): Dignidade `#4CAF50`, Consciência `#CE93D8`, Soberania `#9FA8DA`, Segurança `#42A5F5`, Integridade `#26A69A`, Caixa `#F9A825`, Capital Político `#FF7043`, Legitimidade `#E57373`.

**Tela final** (fundo e selo por categoria): catástrofe e extermínio `#4A1010` + selo `#EF5350`; perda da democracia `#0D2A4A` + `#EF5350`; captura `#3E1F4F` + `#CE93D8`; fortalecimento e cuidado `#1B5E20` + `#81C784`; neutro e saída `#455A64` + `#F9A825`. Alto contraste: fundo preto.

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

Paleta própria, separada das cores partidárias e da paleta da interface. Escala única de ciano, do escuro (crítico) ao claro (extremo). O claro **não** significa "bom": 81-100 é instável (GDD §5.2). Proposta do TA, aprovada pelo PO (2026-10-13). **Em revisão (D-162):** faixas vizinhas têm só 1,12–1,33:1 entre si e a 0-20 tem 2,75:1 contra o poço `#37474F`; o TA propõe nova escala (faixa 0-20 ≥ 3:1, WCAG 1.4.11). Os hex abaixo valem até lá.

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
| Títulos | Plus Jakarta Sans (Bold e ExtraBold) — D-206 |
| Corpo | DM Sans (Regular, SemiBold e Itálico) — D-206 |

**Escala do texto (configuração):** 100%, 125% e 150%; **padrão 100%** (D-207, revisa a D-165 e a D-148). O jogador vê só a porcentagem; 100% é o corpo de 18 px, 125% = 22 px e 150% = 27 px. Os títulos acompanham (`jogo/scripts/ui/tokens.gd`, tabela `TYPE`). No 150%, o retrato do falante some e o problema da carta rola (P1, D-169).

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
| Escala do texto 100/125/150% (D-207; P1 no 150%, D-169) | Pronto no protótipo |
| Reduzir movimento | Planejado (proposta GF aprovada) |
| Alto contraste | Planejado (GDD §10.5); base de teste: fundo preto, textos e contornos brancos, cores partidárias e faixas inalteradas (D-169) |
| Navegação por teclado (PC) | Planejado (GDD §10.5): setas revelam a metade, Enter confirma, Esc cancela; com metade revelada, o 1º Esc cancela e o 2º abre a pausa (D-167) |
| Escolha sem arrastar (toque em 2 passos, D-145) | Planejado (WCAG 2.2, 2.5.7) |
| Leitor de tela | PC: `accessibility_name`/`accessibility_description` nos Controls (AccessKit, Godot 4.5+); cada medidor anuncia a faixa ("faixa 2 de 5"), nunca o número (D-156). Android e iOS: aguardando suporte do Godot (D-152) |
| Modo daltônico (padrões nos medidores + símbolo do partido na carta) | **Depois do MVP** |

---

## 14.13 — Pendências

| # | Pendência | Dono |
| :--- | :--- | :--- |
| 1 | Limite de arraste: valor inicial 40% / 700 px/s (D-146); ajuste fino, trava do flick (D-153) e medida de velocidade (D-154); cancelamento do toque resolvido (D-157) | Protótipo (GF/DEV) |
| 2 | Fórmula dos votos nos placares do impeachment | GDD de Impeachment |
| 3 | Escala dos títulos para cada tamanho de texto | Protótipo (UX) |
| 4 | Estilo dos retratos: geométricos simples ou arte vetorizada, CC0 ou feitos à mão, sem IA generativa (D-007) | TA + PO |
| 5 | Validação das durações de animação no Godot | Protótipo (DEV) |
| 6 | Modo daltônico | Pós-MVP |
| 7 | Nova escala de ciano (D-162) | TA + PO |
| 8 | Texto e tempo da dica do toque (D-163) | UX + PO |

---

## 14.14 — Atualização pós-playtest (P-017 e P-018, 2026-10-22)

O playtest de 2026-10-21 mudou estas regras. Onde este doc diz outra coisa, vale esta seção.

| Tema | Agora | Decisão | Revê |
| :--- | :--- | :--- | :--- |
| HUD | Sigla sob cada medidor (DIGN, CONS…), cor própria, borda vermelha ≤ 20; tocar ou passar o mouse abre uma faixa com nome e função. Continua sem números na partida | D-199 | — |
| Animação do medidor | Rastro e borda verdes ao subir, vermelhos ao cair; os pontos seguem sem direção | D-203 | D-156 |
| Opções | Sempre visíveis nos cantos de baixo da carta, "← A" e "B →"; somem quando uma é revelada. Setas permitidas; "esquerda/direita" seguem proibidas | D-202 | D-084 |
| Impacto | Não aparece antes da escolha | D-204 | — |
| Calibração | Cabeçalho "ALINHAMENTO INICIAL" + subtítulo no lugar do HUD; rodapé "Alinhamento · n/6" | P-017 | D-183 |
| Impeachment | Cabeçalho vermelho "Processo de Impeachment · Fase n/5"; rodapé "Impeachment · Fase n/5" / "· Resultado" | D-201 | — |
| Créditos | Saem da tela inicial; "Créditos e licenças" em Configurações | D-198 | — |
| Tela final | Fundo por categoria; descrição curta de cada final em `endings.json`; radar com Prática (ciano) e Promessa (dourado) + 4 barras por eixo | D-199 | — |
| Textos | Nenhum `[a definir]` na tela (`jogo/tests/test_no_placeholders.gd`); textos em D-200/DP-025 | D-200, D-201 | — |
| Folha de Aprendizado | O "Saiba mais" aberto deixa o dedo rolar até a fonte | P-017 | — |
| Responsividade | Conferida em 390×680, 390×844 e 1280×720 (`.claude/notas/execucao/ferramentas/varredura-resolucoes.sh`); o cartão do ano cresce quando o texto grande não cabe | P-018 | — |
| Fontes | Plus Jakarta Sans (títulos) e DM Sans (corpo) no lugar de Poppins e Inter; o download do jogo cai uns 1,9 MB (`gestao/estudo-fontes/`) | D-206 | D-140 (só a lista de fontes) |
| Escala do texto | Só 100%, 125% e 150%; sem pixels na tela; migra o valor salvo em px | D-207 | D-165, D-148 |

---

**Última atualização:** 2026-10-19 (avaliação dos wireframes, D-161 a D-169)
**Versão:** 2.0 (reescrita)
