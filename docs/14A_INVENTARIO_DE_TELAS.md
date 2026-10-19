# 14A — Inventário de Telas e Componentes

**Anexo do doc 14 (UI/UX Design): a lista completa de wireframes e componentes que precisam ser criados**

Este anexo não cria regras. Ele lista, em forma de checklist, o que os docs 14, 15 e 16 e os GDDs de sistema já definem: cada tela, cada estado e cada componente. Use-o como pauta para os wireframes (Claude Design) e para a etapa 8 do protótipo (UI). Toda linha cita a fonte; o que ainda não foi decidido aparece como `[a definir]` e está reunido em §14A.07.

---

## 14A.01 — Como usar

| Código | O que é |
| :--- | :--- |
| `T-xx` | Tela (um wireframe) |
| `T-xx.y` | Estado ou variante da tela (um quadro a mais no wireframe) |
| `C-xx` | Componente reutilizável (vai para a folha de componentes) |
| `F-xx` | Fluxo ou storyboard (sequência de quadros) |

**Status:** ⏳ a fazer · 🎨 wireframe pronto · ✅ aprovado pelo PO. Hoje, tudo está ⏳.

**Regras que valem para todas as telas:**

| # | Regra | Fonte |
| :--- | :--- | :--- |
| 1 | Retrato; mobile em tela cheia; PC e Web em coluna central | doc 14 §14.02 (`docs/14_UI_UX_DESIGN.md:27-29`) |
| 2 | Nunca escrever "esquerda", "direita", "◀" ou "▶" | D-084 (`docs/14_UI_UX_DESIGN.md:90`) |
| 3 | Nenhuma pista sobre os medidores durante o arraste | doc 14 §14.05 |
| 4 | Medidores sem números durante a partida; números só na tela final | `docs/14_UI_UX_DESIGN.md:59` |
| 5 | Borda partidária sempre com contorno branco de 2-3 px; não há borda neutra | doc 14 §14.04.3 |
| 6 | Sem meses e sem reais: `Caixa` é um medidor de 0 a 100 | doc 14 §14.02 |
| 7 | Texto padrão 18 px (16 / 20 / 24 nas configurações); Poppins nos títulos, Inter no corpo | doc 14 §14.11.4 |
| 8 | Retratos em silhueta genérica com nome, até o TA propor o estilo | D-142 |
| 9 | Ícones só CC0; fontes do Google Fonts com crédito | D-140 |

---

## 14A.02 — Telas (wireframes)

### T-01 — Tela inicial

Fonte: doc 14 §14.12; doc 15 §15.03; GDD §14.3 (`gdd/GDD.md:762`).

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-01.1 | Sem partida salva | Título, avisos de conteúdo (Genocídio, Tortura, Violência policial, Linguagem direta), Novo mandato, Configurações, Sobre | ⏳ |
| T-01.2 | Com partida salva | Igual a T-01.1, mais **Continuar** | ⏳ |
| T-01.3 | Confirmação de "Novo mandato" com partida salva | Modal (C-14): a partida salva será apagada, sem gerar final | ⏳ |
| T-01.4 | Salvamento ilegível | Aviso "Não foi possível continuar o mandato" (`gdd/sistemas/10_estado_partida.md` §5) | ⏳ |

### T-02 — Tutorial

Fonte: doc 14 §14.12; doc 16 Parte B (`docs/16_MANUAL_DO_JOGADOR.md:376-385`). Quatro telas, textos aprovados.

| Código | Tela | Texto | Status |
| :--- | :--- | :--- | :--- |
| T-02.1 | Arrastar | "Você é o Presidente. Cada carta traz um problema. Arraste para um lado ou para o outro para decidir." | ⏳ |
| T-02.2 | Medidores | "No topo estão os 8 medidores do país. Se um deles zerar, seu mandato acaba na hora." | ⏳ |
| T-02.3 | Pontos de efeito | "Depois de decidir, pontos mostram quais medidores mudaram. Toda escolha tem custo." | ⏳ |
| T-02.4 | Carta de Aprendizado | "Depois de cada decisão, a Carta de Aprendizado explica o que está por trás. Toque em 'saiba mais' para ver dados e fontes." | ⏳ |

### T-03 — Calibração

Fonte: doc 15 §15.04 (`docs/15_FLUXO_DO_JOGO.md:69-86`); doc 14 §14.10.1 (igual à carta, sem pontos).

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-03.1 | Pergunta parada | Pergunta, carta arrastável (C-04), progresso 1/6 a 6/6 | ⏳ |
| T-03.2 | Arrastando para um lado | Texto da resposta revelado; sem pontos de efeito; borda só com filete branco (D-166) | ⏳ |
| T-03.3 | Arrastando para o outro lado | Idem, com a outra resposta | ⏳ |
| T-03.4 | Abandonar na calibração | Modal (C-14): volta ao início, sem final (`gdd/sistemas/10_estado_partida.md` §3.3) | ⏳ |

As 6 perguntas e respostas: doc 15 §15.04. Conteúdo de exemplo: "O governo deve priorizar segurança ou prevenção?" (Segurança × Prevenção).

### T-04 — Cartão de virada de ano

Fonte: doc 14 §14.10.2; doc 15 §15.05.1; `gdd/sistemas/02_finais.md` §3.4.

| Código | Variante | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-04.1 | Ano 1 | "Ano 1 · Lua de Mel" | ⏳ |
| T-04.2 | Ano 2 | "Ano 2 · Realidade Bate" | ⏳ |
| T-04.3 | Ano 3 | "Ano 3 · Crise" | ⏳ |
| T-04.4 | Ano 4 | "Ano 4 · Desfecho" | ⏳ |
| T-04.5 | Ano 4 com aviso de Captura | T-04.4 + aviso curto, sem número, citando o medidor em extremo (`Segurança`, `Capital Político` ou `Legitimidade` ≥ 81) | ⏳ |

### T-05 — Aviso de evento encadeado

Fonte: doc 15 §15.08; `gdd/sistemas/08_eventos.md` §3.3; doc 14 §14.10.1.

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-05.1 | Um evento | Destaque na borda da tela + ícone + `texto` do evento; HUD mudando | ⏳ |
| T-05.2 | Vários eventos no mesmo turno | Um aviso por evento, na ordem de agendamento | ⏳ |
| T-05.3 | Evento zera um medidor | Corte para o final (F-04) | ⏳ |

### T-06 — Tela de jogo (carta)

Fonte: doc 14 §14.02-14.04; `gdd/sistemas/05_cartas.md` §3.4.

Estrutura, de cima para baixo: HUD (C-01) → quem fala (C-03) → problema → carta (C-04) → rodapé (C-07).

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-06.1 | Carta parada | Sem texto de opção e sem cor de borda | ⏳ |
| T-06.2 | Arrastando para um lado | Carta inclina; texto da opção + borda na cor dela | ⏳ |
| T-06.3 | Arrastando para o outro lado | Idem, com a outra opção e a outra cor | ⏳ |
| T-06.4 | Soltou antes do limite | Carta volta ao centro; nada muda | ⏳ |
| T-06.5 | Soltou além do limite | Carta sai pelo lado escolhido. O flick só confirma se o texto já apareceu ou a carta andou 20-25% (D-153) | ⏳ |
| T-06.6 | Carta de ator | Quem fala = um dos 24 atores (retrato em silhueta + nome) | ⏳ |
| T-06.7 | Carta de instituição | Quem fala = instituição do modo (ex.: Câmara, Senado, STF) | ⏳ |
| T-06.8 | Carta do modo Influenciador | Mesmo layout; o tratamento visual próprio, se houver, está `[a definir]` | ⏳ |
| T-06.9 | Toque numa metade (alternativa ao arraste) | Revela a opção daquele lado: texto + borda, sem rótulo de lado (D-145) | ⏳ |
| T-06.10 | Segundo toque na mesma metade | Confirma, só depois de 0,5 s do 1º toque (D-157); a carta sai pelo lado (D-145). Tocar a outra metade troca; tocar fora cancela | ⏳ |

Conteúdo de exemplo (`docs/17_ROTEIRO_DAS_CARTAS.md:55-71`): "Privatização da estatal" · "O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora." · "Nomear relator adversário" (vermelho) × "Aceitar as mudanças" (laranja).

### T-07 — Efeito e consequência

Fonte: doc 14 §14.05-14.06.

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-07.1 | Pontos de efeito | Ponto pequeno (até 10) ou grande (mais de 10) sobre cada medidor que mudou; o ícone enche ou esvazia | ⏳ |
| T-07.2 | Medidor muda de faixa | Troca de cor + pulso no ícone (C-01) | ⏳ |
| T-07.3 | Consequência | Frase de 1 linha sobre o HUD atualizado; espera o toque | ⏳ |

### T-08 — Carta de Aprendizado

Fonte: doc 14 §14.07; doc 18 (`docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:74-101`).

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-08.1 | Resumo | Conceito por trás (bloco 2) + frase de impacto (bloco 5) + "saiba mais" | ⏳ |
| T-08.2 | "Saiba mais" aberto | O que você vivenciou (1), dados reais (3), fonte com link (4) | ⏳ |
| T-08.3 | Releitura após reabrir o app | Consequência e Aprendizado só para leitura (`gdd/sistemas/10_estado_partida.md` §5) | ⏳ |

### T-09 — Cena de impeachment

Fonte: doc 14 §14.08; doc 15 §15.07; `gdd/sistemas/03_impeachment.md` §3.2-3.3.

| Código | Fase / estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-09.1 | Entrada | Corte dramático; tela escurece | ⏳ |
| T-09.2 | 1. O Pedido | Carta com moldura de crise (C-10); opções povo × Congresso | ⏳ |
| T-09.3 | 2. A Comissão | Carta + placar da comissão (C-11) | ⏳ |
| T-09.4 | 3. A Votação | Carta + placar da Câmara: 342 de 513 | ⏳ |
| T-09.5 | 4. O Julgamento | Carta + placar do Senado só com a meta: — / 81, quórum 54 (D-168) | ⏳ |
| T-09.6 | 5. O Desfecho | Carta da última fase | ⏳ |
| T-09.7 | Absolvição | Resultado; volta ao ponto em que o jogo parou | ⏳ |
| T-09.8 | Condenação | Resultado; segue para o final "Impeachment" (T-10) | ⏳ |
| T-09.9 | Condenação automática | Cena começa com `Consciência` < 15 e `Integridade` < 15 | ⏳ |

Os placares mostram o resultado; não há cálculo na tela (`gdd/sistemas/03_impeachment.md:41`).

### T-10 — Tela final

Fonte: doc 14 §14.09; `gdd/sistemas/02_finais.md`; `gdd/sistemas/04_eixo.md` §3.3.

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-10.1 | Completa (rolagem) | Nome e categoria do final, descrição curta, citação + autor (C-12), epílogo, radar (C-13), texto do eixo predominante, 8 medidores com números (C-01 com valor), Jogar novamente, Compartilhar | ⏳ |
| T-10.2 | Final sem citação | Sem o bloco de citação (D-091) | ⏳ |
| T-10.3 | Sem epílogo | Sem eventos pendentes, sem o bloco de epílogo | ⏳ |
| T-10.4 | Catástrofe | Chegada direta após medidor em 0 (F-04) | ⏳ |
| T-10.5 | Renúncia | Final completo após abandonar o mandato (`gdd/sistemas/10_estado_partida.md` §3.3) | ⏳ |

Exemplo: "Paralisia Fiscal" (Catástrofe) — "O bem que o Estado pode fazer é limitado; o mal, infinito." — Roberto Campos (`gdd/sistemas/02_finais.md` §3.5).

### T-11 — Menu de pausa

Fonte: doc 15 §15.02; `gdd/sistemas/10_estado_partida.md` §3.3.

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-11.1 | Menu aberto | Continuar, Configurações, Abandonar mandato | ⏳ |
| T-11.2 | Confirmação de abandono | Modal (C-14): leva ao final "Renúncia" (na calibração: T-03.4) | ⏳ |

Botão de pausa no rodapé, à direita, alvo de 48×48 dp, fora da área de arraste; Esc no PC (D-150).

### T-12 — Configurações

Fonte: doc 14 §14.12-14.12.1; doc 14 §14.10.3.

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-12.1 | Padrão | Áudio (controles `[a definir]`), tamanho do texto (16 / 20 / 24), reduzir movimento, alto contraste, sensibilidade do arraste 25–40% (D-158) | ⏳ |

### T-13 — Sobre

Fonte: doc 14 §14.12; D-140.

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-13.1 | Padrão | Créditos, licenças dos assets CC0, aviso de licença das fontes Poppins e Inter (Google Fonts, OFL) | ⏳ |

### T-14 — Avisos do sistema

Fonte: `gdd/sistemas/10_estado_partida.md` §5.

| Código | Estado | Conteúdo | Status |
| :--- | :--- | :--- | :--- |
| T-14.1 | Falha ao gravar | Aviso discreto, 1× por partida | ⏳ |

### T-15 — Variantes de acessibilidade

Fonte: doc 14 §14.12.1.

| Código | Variante | Status |
| :--- | :--- | :--- |
| T-15.1 | T-06 com texto 16 px | ⏳ |
| T-15.2 | T-06 com texto 24 px | ⏳ |
| T-15.3 | T-06 em alto contraste (base: P2, D-169) | ⏳ |
| T-15.4 | T-08.2 com texto 24 px (pior caso de texto longo) | ⏳ |
| T-15.6 | T-06 com texto 36 px (base: P1, D-169) | ⏳ |
| T-15.5 | Foco de teclado em T-01 e T-06 (PC): setas revelam a metade, Enter confirma, Esc cancela (D-156) | ⏳ |

### T-16 — Layout PC e Web

Fonte: doc 14 §14.02.

| Código | Tela | Status |
| :--- | :--- | :--- |
| T-16.1 | T-01 em coluna central | ⏳ |
| T-16.2 | T-06 em coluna central | ⏳ |
| T-16.3 | T-10 em coluna central | ⏳ |

---

## 14A.03 — Componentes

| Código | Componente | Variantes e estados | Fonte | Status |
| :--- | :--- | :--- | :--- | :--- |
| C-01 | Ícone de medidor | 8 ícones (casa, livro, bandeira, escudo, lupa, moeda, Congresso, povo); preenchimento proporcional; 5 faixas de cor; pulso na troca de faixa; estilhaço no 0; versão com número (só na T-10); rastro do nível anterior no preenchimento (D-161) | doc 14 §14.03, §14.10.1, §14.11.3 | ⏳ |
| C-02 | HUD | 8 C-01 na ordem: Sociais (Dignidade, Consciência, Soberania, Segurança, Integridade) e Poder (Caixa, Capital Político, Legitimidade) | doc 14 §14.03 | ⏳ |
| C-03 | Quem fala | Retrato em silhueta + nome; ator ou instituição; dado do campo `quem_fala` (D-164) | doc 14 §14.04.1; D-142 | ⏳ |
| C-04 | Carta arrastável | Parada; arrastando (inclinada); voltando ao centro; saindo pelo lado; opção revelada por toque (D-145); dica contextual do toque (D-163) | doc 14 §14.04.4 | ⏳ |
| C-05 | Borda partidária | 7 cores (vermelho, azul, verde, amarelo, roxo, laranja, preto), sempre com contorno branco de 2-3 px dos dois lados da faixa (D-156) | doc 14 §14.11.2 | ⏳ |
| C-06 | Texto da opção | Oculto; revelado (fade + deslize de 8-12 px) | doc 14 §14.04.2, §14.10.1 | ⏳ |
| C-07 | Rodapé | "Ano X · Fase · carta n/7" | doc 14 §14.02 | ⏳ |
| C-08 | Ponto de efeito | Pequeno (até 10: círculo branco sólido ~6 dp); grande (mais de 10: ~10 dp + anel ~14 dp); sem direção (D-156) | doc 14 §14.05 | ⏳ |
| C-09 | Folha de Aprendizado | Modal com fundo escurecido (D-160); resumo; "saiba mais" aberto; link de fonte | doc 14 §14.07 | ⏳ |
| C-10 | Moldura de crise | Carta de impeachment | doc 14 §14.08 | ⏳ |
| C-11 | Placar | Comissão; Câmara (342 / 513); Senado (54 / 81); Senado na fase 4 só com a meta (D-168); resultado alcançado × não alcançado; barra branco × escuro hachurado com linha de quórum, sem verde nem vermelho (D-156) | doc 14 §14.08; `gdd/sistemas/03_impeachment.md` §3.3 | ⏳ |
| C-12 | Bloco de citação | Frase + autor; ausente | doc 14 §14.09; D-091 | ⏳ |
| C-13 | Radar ideológico | 8 pontas (4 eixos × 2 polos); dois traçados, "o que você disse" × "como você governou" | doc 14 §14.09; `gdd/sistemas/04_eixo.md` | ⏳ |
| C-14 | Modal de confirmação | Novo mandato; abandonar (calibração); abandonar (partida) | doc 15 §15.03; `gdd/sistemas/10_estado_partida.md` §3.3 | ⏳ |
| C-15 | Botão | Primário; secundário; foco de teclado | doc 14 §14.12.1 | ⏳ |
| C-16 | Cartão de ano | 4 anos; com aviso de Captura | doc 14 §14.10.2; `gdd/sistemas/02_finais.md` §3.4 | ⏳ |
| C-17 | Aviso de evento | Destaque na borda + ícone + texto | doc 14 §14.10.1 | ⏳ |
| C-18 | Aviso de conteúdo | Lista dos 4 avisos da tela inicial | GDD §14.3 | ⏳ |
| C-19 | Indicador de progresso | Tutorial (1/4 a 4/4); calibração (1/6 a 6/6) | doc 16 Parte B; doc 15 §15.04 | ⏳ |
| C-20 | Controles de configuração | Seletor de tamanho (16 / 18 / 20 / 24, D-165); chaves de reduzir movimento e alto contraste; áudio `[a definir]` | doc 14 §14.12.1 | ⏳ |
| C-21 | Aviso discreto | Falha ao gravar; salvamento ilegível | `gdd/sistemas/10_estado_partida.md` §5 | ⏳ |

---

## 14A.04 — Fluxos e storyboards

| Código | Fluxo | Quadros | Fonte | Status |
| :--- | :--- | :--- | :--- | :--- |
| F-01 | Partida completa | T-01 → T-02 → T-03 → (T-04 → T-05 → T-06 ×7) ×4 → T-10 | doc 15 §15.02 | ⏳ |
| F-02 | Uma carta | T-06.1 → T-06.2 → T-06.5 → T-07.1 → T-07.3 → T-08.1 → próxima | doc 15 §15.06 | ⏳ |
| F-03 | Arraste cancelado | T-06.2 → T-06.4 → T-06.1 | doc 14 §14.04.4 | ⏳ |
| F-04 | Medidor em 0 | Carta solta → ícone se estilhaça → fade para preto → T-10.4 (sem consequência nem Aprendizado) | doc 14 §14.10; `gdd/sistemas/05_cartas.md` §5 | ⏳ |
| F-05 | Impeachment | Gatilho → T-09.1 → T-09.2 a T-09.6 → T-09.7 (volta ao jogo) ou T-09.8 (T-10) | doc 15 §15.07 | ⏳ |
| F-06 | Abandonar mandato | T-11.1 → T-11.2 → T-10.5; na calibração, T-03.4 → T-01 | `gdd/sistemas/10_estado_partida.md` §3.3 | ⏳ |
| F-07 | Continuar partida | T-01.2 → retoma no ponto exato (inclusive T-08.3 e o meio da cena de impeachment) | doc 15 §15.03; `gdd/sistemas/10_estado_partida.md` §5 | ⏳ |
| F-08 | Virada de ano com evento | Fechamento → T-04 → T-05 → T-06 | doc 15 §15.05 | ⏳ |

---

## 14A.05 — Animações a anotar nos wireframes

Durações de referência, a validar no protótipo (doc 14 §14.10).

| Elemento | Animação | Duração |
| :--- | :--- | :--- |
| Medidor muda de valor | Preenchimento sobe ou desce | 300-500 ms |
| Medidor muda de faixa | Cor + pulso 1,0 → 1,1 → 1,0 | 200 + 250 ms |
| Pontos de efeito | "Pop" e somem | 400-600 ms, 100 ms após soltar |
| Texto da opção | Fade + deslize de 8-12 px | 150 ms |
| Carta sai | Desliza para o lado escolhido | 250-350 ms |
| Carta de Aprendizado | Sobe de baixo | 300 ms |
| Aviso de evento | Destaque na borda + ícone | 400 ms |
| Medidor em 0 | Estilhaço; corte para o final | 500-800 ms |
| Impeachment | Escurece; placares em sequência | 1,5-2,5 s |
| Menu → Calibração | Fade | 300 ms |
| Calibração → Ano 1 | Fade com leve zoom | 400 ms |
| Virada de ano | Cartão "Ano X" | 600-800 ms |
| Jogo → Final | Fade para preto + pausa | ≥ 500 ms |

Com "reduzir movimento": sem pulsos, "pop", deslizes, zoom e flash; ficam os fades curtos e o preenchimento dos medidores (doc 14 §14.10.3).

---

## 14A.06 — Tokens

Cores e fontes: doc 14 §14.11 (paleta da interface, 7 cores partidárias, 5 faixas de ciano dos medidores, Poppins e Inter). Não repetidas aqui para não divergir.

---

## 14A.07 — Em aberto

| # | Pendência | Afeta | Fonte |
| :--- | :--- | :--- | :--- |
| 1 | Ajuste fino do limite de arraste (inicial: 40% da largura ou 700 px/s, D-146), trava do flick (D-153) e `screen_velocity` × `velocity` (D-154); cancelamento do toque resolvido (D-157) | T-06.4, T-06.5, T-06.9, C-04 | doc 14 §14.13 #1 |
| 2 | Escala dos títulos para cada tamanho de texto | T-15 | doc 14 §14.13 #3 |
| 3 | Estilo final dos retratos (hoje, silhueta) | C-03 | doc 14 §14.13 #4; D-142 |
| 4 | ~~Como abrir o menu de pausa~~ — resolvido: botão no rodapé à direita + Esc (D-150) | T-11 | D-150 |
| 5 | Controles de áudio | T-12, C-20 | não definido nos docs |
| 6 | Tratamento visual do modo Influenciador | T-06.8 | não definido nos docs |
| 7 | Conteúdo de "Compartilhar" | T-10.1 | não definido nos docs |
| 8 | Tamanho das pranchetas (mobile e PC) | Todas | não definido nos docs |
| 9 | Modo daltônico | C-01, C-05 | pós-MVP (doc 14 §14.13 #6) |
| 10 | Leitor de tela no Android e no iOS | Todas | aguardando suporte do Godot (D-152) |
| 11 | Nova escala de ciano dos medidores | C-01, C-02 | D-162 |
| 12 | Texto e tempo da dica do toque | C-04, T-06 | D-163 |

---

**Total:** 16 telas (64 estados e variantes), 21 componentes, 8 fluxos.

**Última atualização:** 2026-10-19 (avaliação dos wireframes, D-161 a D-169)
**Versão:** 1.0
