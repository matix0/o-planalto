# Prompt — Wireframes completos no Claude Design

**Para quem:** membro da equipe que vai rodar os wireframes no Claude Design (Opus 5.5, esforço máximo).
**Como usar:** dê ao Claude Design acesso ao repositório https://github.com/matix0/o-planalto e cole o bloco abaixo inteiro.
**Citações:** todas as linhas foram conferidas no commit `c9d3752`. Para abrir uma citação fixa, use `https://github.com/matix0/o-planalto/blob/c9d3752/<arquivo>#L<início>-L<fim>`. Se o `main` mudar depois, o `main` vale; avise o PO se encontrar divergência.
**Decisões:** D-084 a D-169 em `gestao/decisoes.md`. Atualizado em 2026-10-19 (correções da 2ª rodada).

---

```
# Papel
Você é um designer de UX/UI sênior especializado em jogos mobile de cartas (gênero "Reigns"). Produza os WIREFRAMES COMPLETOS do jogo "O Planalto", em média fidelidade, prontos para virar telas no Godot 4.7.

# Fonte de verdade
O repositório https://github.com/matix0/o-planalto é a fonte de verdade. As citações abaixo usam `arquivo:linhas` e foram conferidas no commit c9d3752 (link fixo: https://github.com/matix0/o-planalto/blob/c9d3752/<arquivo>#L<início>-L<fim>). Antes de desenhar, ABRA E LEIA estes arquivos:
- docs/14_UI_UX_DESIGN.md (inteiro) — regras de interface.
- docs/14A_INVENTARIO_DE_TELAS.md (inteiro) — checklist oficial de telas, estados, componentes e fluxos. Os códigos T-xx, C-xx e F-xx abaixo são os deste arquivo.
- docs/15_FLUXO_DO_JOGO.md:21-207 — fluxo da partida.
- docs/16_MANUAL_DO_JOGADOR.md:376-385 — textos aprovados do tutorial.
- gestao/decisoes.md:95-172 — decisões D-084 a D-160.
Se este prompt e o repositório divergirem, siga o repositório e liste a divergência no fim.

# Regra de ouro
Use SOMENTE o que está neste prompt e nos arquivos citados. Não invente mecânicas, textos, números, telas ou regras. Onde faltar informação, use um placeholder visível "[a definir]". Propostas próprias só em variantes separadas, com o selo "PROPOSTA".

# O jogo
- Jogo educativo de conscientização política (não de doutrinação). Público: jovens de 15 a 30 anos, periféricos e estudantes (CLAUDE.md). O jogador é o Presidente do Brasil (D-087, gestao/decisoes.md).
- Arrasta (ou toca) cartas; 4 anos = 4 turnos de 7 cartas; partida de ~15 min (docs/15_FLUXO_DO_JOGO.md:21-54).
- Interface em PT-BR.

# Restrições obrigatórias (com fonte)
1. Retrato. Mobile em tela cheia; PC e Web em coluna central (docs/14_UI_UX_DESIGN.md:23-29).
2. NUNCA escrever "esquerda", "direita", "◀" ou "▶"; o lado de cada opção é sorteado (docs/14_UI_UX_DESIGN.md:84-91; D-084, gestao/decisoes.md:95).
3. Nenhuma pista sobre os medidores durante o arraste ou o toque de revelação (docs/14_UI_UX_DESIGN.md:122-126).
4. Medidores sem números durante a partida; números só na tela final (docs/14_UI_UX_DESIGN.md:59).
5. O texto da opção e a borda partidária só aparecem durante o arraste ou depois do 1º toque naquela metade (docs/14_UI_UX_DESIGN.md:91, 106-110).
6. Toda opção tem cor partidária; não há borda neutra; contorno branco de 2-3 px dos DOIS lados da faixa (docs/14_UI_UX_DESIGN.md:93-99; D-092, D-156).
7. Sem meses e sem reais: "Caixa" é um medidor de 0 a 100 (docs/14_UI_UX_DESIGN.md:50).
8. Texto padrão de 18 px (16/20/24 nas configurações); Poppins nos títulos, Inter no corpo (docs/14_UI_UX_DESIGN.md:276-283). A escala até 200% ainda vai ser testada (D-149, gestao/decisoes.md:161): desenhe a variante de 24 px e uma variante "PROPOSTA" de 36 px.
9. Retratos em silhueta genérica com nome (D-142, gestao/decisoes.md:154). Ícones só CC0, em formas simples, no estilo Kenney (D-140, gestao/decisoes.md:152).
10. Verde e vermelho NUNCA significam "a favor/contra" nem "ganho/perda" em nenhum lugar: são cores partidárias (docs/14_UI_UX_DESIGN.md:246-258; D-156).

# Interação da carta (com fonte)
- Arrastar: a carta acompanha o dedo e inclina; soltar antes do limite volta ao centro; soltar além do limite confirma e a carta sai pelo lado (docs/14_UI_UX_DESIGN.md:102-108).
- Limite: 40% da largura da carta ou flick de 700 px/s (D-146, docs/14_UI_UX_DESIGN.md:112). O flick só confirma se o texto daquela opção já apareceu ou se a carta já andou 20-25% (D-153, docs/14_UI_UX_DESIGN.md:114).
- Alternativa ao arraste (WCAG 2.2, 2.5.7): tocar numa metade revela aquela opção; tocar de novo na mesma metade confirma, só depois de 0,5 s; tocar a outra metade troca; tocar fora da carta cancela; sem tempo limite (D-145, D-157; docs/14_UI_UX_DESIGN.md:109-116). As metades não têm rótulo visível.
- Sensibilidade ajustável nas Configurações: limite de 25% a 40% (D-158, docs/14_UI_UX_DESIGN.md:118).
- Teclado no PC: as setas revelam a metade, Enter confirma, Esc cancela (D-156, docs/14_UI_UX_DESIGN.md:304).
- Desenhe uma linha tracejada com o rótulo "limite 40% (ajustável)" nos quadros de arraste.

# Design tokens (com fonte)
- Fundo #263238 · fundo da carta #37474F · texto #FFFFFF · texto secundário #B0BEC5 (docs/14_UI_UX_DESIGN.md:230-241).
- Cor primária: branco #FFFFFF, neutra (D-159, docs/14_UI_UX_DESIGN.md:234).
- Secundária, alerta e destaque: no doc 14 estão como azul #1565C0, vermelho #C62828 e amarelo #F9A825 (docs/14_UI_UX_DESIGN.md:235-238), mas essas cores coincidem com cores partidárias. Nos wireframes, use branco e cinzas e marque cada uso como "[a definir — paleta]".
- Cores partidárias, só na borda da carta: vermelho #C62828, azul #1565C0, verde #2E7D32, amarelo #F9A825, roxo #6A1B9A, laranja #EF6C00, preto #212121 (docs/14_UI_UX_DESIGN.md:246-258; hex mantidos por D-151).
- Faixas dos medidores, em escala de ciano e exclusivas dos medidores (o claro NÃO significa "bom"): 0-20 #0097A7 · 21-40 #00ACC1 · 41-60 #26C6DA · 61-80 #4DD0E1 · 81-100 #80DEEA (docs/14_UI_UX_DESIGN.md:262-272).
- Estilo: estrutura em tons de cinza; cor só onde tem função.

# HUD e feedback (com fonte)
- 8 ícones que "enchem", nesta ordem: Dignidade (casa), Consciência (livro), Soberania (bandeira), Segurança (escudo), Integridade (lupa) | Caixa (moeda), Capital Político (Congresso), Legitimidade (povo) (docs/14_UI_UX_DESIGN.md:54-76).
- Depois de soltar a carta: um ponto branco sobre cada medidor que mudou, sem direção. O pequeno (até 10) é um círculo sólido de ~6 dp; o grande (acima de 10) tem ~10 dp com anel de ~14 dp. A direção aparece no próprio ícone, que enche ou esvazia (docs/14_UI_UX_DESIGN.md:122-133; D-156).
- Frase de consequência de 1 linha; a tela espera o toque (docs/14_UI_UX_DESIGN.md:137-139).
- Carta de Aprendizado em folha MODAL, com fundo escurecido. O resumo traz o conceito e a frase de impacto; "Saiba mais" mostra o que você vivenciou, os dados reais e a fonte (docs/14_UI_UX_DESIGN.md:143-152; D-160).
- No PC, o leitor de tela anuncia a faixa do medidor ("faixa 2 de 5"), nunca o número (docs/14_UI_UX_DESIGN.md:306). Anote isso nos quadros de C-01.

# Telas — desenhe TODOS os estados do inventário
Siga docs/14A_INVENTARIO_DE_TELAS.md:36-225 (T-01 a T-16, 63 estados). Resumo com o conteúdo real:

T-01 Inicial (14A:38-47; docs/15_FLUXO_DO_JOGO.md:56-67): os 4 avisos de conteúdo — Genocídio, Tortura, Violência policial, Linguagem direta (gdd/GDD.md:762-769) — como etiquetas sóbrias, sem estética de alerta (D-156); botões Continuar (só com partida salva) e Novo mandato (docs/15_FLUXO_DO_JOGO.md:60-61), mais Configurações e Sobre. Divergência conhecida: docs/14_UI_UX_DESIGN.md:291 ainda diz "Iniciar"; use "Novo mandato". Estados .1 a .4, incluindo o modal de confirmação e o aviso "Não foi possível continuar o mandato" (gdd/sistemas/10_estado_partida.md:91).

T-02 Tutorial (14A:49-58): 4 telas com os textos aprovados, sem mudar nada (docs/16_MANUAL_DO_JOGADOR.md:382-385); progresso 1/4 a 4/4; avanço só por ação do jogador.

T-03 Calibração (14A:60-71; docs/15_FLUXO_DO_JOGO.md:69-86): 6 perguntas, mesma interação da carta (arraste ou toque duplo), progresso 1/6 a 6/6. Exemplo: "O governo deve priorizar segurança ou prevenção?" — Segurança × Prevenção (docs/15_FLUXO_DO_JOGO.md:75). Cada resposta ajusta ±5 os medidores iniciais e forma o traçado "o que você disse" (gdd/sistemas/01_medidores.md:22-24). Inclua o modal de abandono, que volta ao início sem final (gdd/sistemas/10_estado_partida.md:41-45).

T-04 Cartão de ano (14A:73-83; docs/15_FLUXO_DO_JOGO.md:101-108): "Ano 1 · Lua de Mel", "Ano 2 · Realidade Bate", "Ano 3 · Crise", "Ano 4 · Desfecho"; e o Ano 4 com aviso de Captura, sem número (gdd/sistemas/02_finais.md:46-48).

T-05 Aviso de evento encadeado (14A:85-93; docs/15_FLUXO_DO_JOGO.md:180-194): destaque na borda + ícone + texto; vários eventos em sequência; evento que zera um medidor leva ao F-04.

T-06 Jogo (14A:95-114): HUD → quem fala → problema (2 linhas) → carta → rodapé "Ano 1 · Lua de Mel · 3/7" com o botão de pausa à direita, 48×48 dp, fora da área de arraste (D-150, gestao/decisoes.md:162). São 10 estados, do T-06.1 ao T-06.10, incluindo o toque em 2 passos (T-06.9 e T-06.10). Conteúdo real (docs/17_ROTEIRO_DAS_CARTAS.md:56-71): "Privatização da estatal" · "O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora." · "Nomear relator adversário" (vermelho) × "Aceitar as mudanças" (laranja) · consequência B: "A lei passa. O povo paga a conta."

T-07 Efeito e consequência (14A:116-124): pontos de efeito, troca de faixa, frase de consequência.

T-08 Carta de Aprendizado (14A:126-134; docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:74-101): resumo ("O relator tem poder de alterar o texto de um projeto. Isso se chama 'poder de agenda'." + "O relator tem poder. Quem controla a pauta, controla o país."); "Saiba mais" com o dado ("Cerca de 3,6 mil trabalhadores foram demitidos sem justa causa após a privatização da Eletrobras, em 2022.") e a fonte ("Agência Senado, 2025", com link); releitura ao reabrir o app (gdd/sistemas/10_estado_partida.md:88).

T-09 Impeachment (14A:136-152; docs/14_UI_UX_DESIGN.md:156-170; gdd/sistemas/03_impeachment.md:29-41): entrada; 5 fases (Pedido, Comissão, Votação com 342/513, Julgamento com 54/81, Desfecho); absolvição, condenação e condenação automática. Placar: barra com os votos favoráveis em branco e os contrários em fundo escuro hachurado, linha fixa no quórum e número grande; os números vêm do resultado, não de cálculo (gdd/sistemas/03_impeachment.md:41).

T-10 Final (14A:154-166; docs/14_UI_UX_DESIGN.md:175-187): nome e categoria do final, descrição, citação + autor, epílogo, radar ideológico e os 8 medidores com números; botões Jogar novamente e Compartilhar. O radar tem 4 eixos e 8 pontas — Economia (Coletivismo × Mercado), Diplomacia (Nacionalismo × Globalismo), Sociedade (Conservadorismo × Progressismo), Estado (Autoritarismo × Liberdade) — e 2 traçados, "o que você disse" × "como você governou" (gdd/sistemas/04_eixo.md:18-25). NÃO inclua os medidores no radar. Texto do eixo predominante: gdd/sistemas/04_eixo.md:34-44. Exemplo: "Paralisia Fiscal" — "O bem que o Estado pode fazer é limitado; o mal, infinito." — Roberto Campos (gdd/sistemas/02_finais.md:61). Variantes: sem citação, sem epílogo, Catástrofe e Renúncia.

T-11 Pausa (14A:168-177): Continuar, Configurações, Abandonar mandato → modal → final "Renúncia" (gdd/sistemas/10_estado_partida.md:41-45). Não acrescente outros botões.

T-12 Configurações (14A:179-185): áudio "[a definir]", tamanho do texto, reduzir movimento, alto contraste, sensibilidade do arraste de 25% a 40% (D-158).

T-13 Sobre (14A:187-193): créditos, licenças dos assets CC0 e aviso de licença das fontes Poppins e Inter (Google Fonts, OFL) (D-140).

T-14 Avisos do sistema (14A:195-201): falha ao gravar, aviso discreto 1× por partida (gdd/sistemas/10_estado_partida.md:92).

T-15 Variantes de acessibilidade (14A:203-213): T-06 com 16 px, com 24 px e em alto contraste; T-08.2 com 24 px; foco de teclado.

T-16 PC/Web em coluna central (14A:215-225).

# Componentes
Folha de componentes C-01 a C-21, com todas as variantes de docs/14A_INVENTARIO_DE_TELAS.md:227-251.

# Fluxos
Fluxograma navegável F-01 a F-08 (docs/14A_INVENTARIO_DE_TELAS.md:255-266).

# Animações (anotar nos quadros)
Durações de docs/14_UI_UX_DESIGN.md:191-220 e docs/14A_INVENTARIO_DE_TELAS.md:270-292. Com "Reduzir movimento", saem pulso, pop, deslize, zoom e flash; ficam os fades curtos e o preenchimento (docs/14_UI_UX_DESIGN.md §14.10.3).

# Em aberto (não decida; marque "[a definir]")
Itens de docs/14A_INVENTARIO_DE_TELAS.md:300-315, mais: secundária, alerta e destaque da paleta; escala de 36 px (D-149); controles de áudio; visual do modo Influenciador; conteúdo de "Compartilhar"; tamanho das pranchetas; modo daltônico (pós-MVP).

# Entregáveis
1. Todas as telas e estados, nomeados com o código (ex.: "T-06.9").
2. A folha de componentes C-01 a C-21.
3. O fluxograma F-01 a F-08.
4. Anotações em cada tela: componente, estado, interação, animação e a citação `arquivo:linhas` da regra aplicada.
5. A lista final "Pontos em aberto e divergências", com tudo o que ficou "[a definir]", cada "PROPOSTA" e cada divergência entre este prompt e o repositório.

# Processo
1. Leia os arquivos da seção "Fonte de verdade".
2. Resuma em 5-10 linhas o fluxo e as restrições.
3. Entregue na ordem T-01 → T-16, C-01 → C-21, F-01 → F-08.
4. Antes de finalizar, confira cada tela contra as 10 restrições obrigatórias e contra a interação da carta.

# Correções da 2ª rodada (avaliação de 2026-10-19; .claude/notas/avaliacao-wireframes/consolidado.md)
Refaça só os quadros afetados; mantenha o resto da 1ª rodada.
1. T-06.2, T-06.3, T-03.2-3, C-06: o texto da opção não pode sair da tela durante o arraste. Ancore o texto na metade da carta voltada para o centro da tela e teste com a opção mais longa.
2. C-01, C-02, T-07.1-2: desenhe o rastro do nível anterior durante o preenchimento, sem número nem direção (D-161).
3. C-01: faixas de ciano "[em revisão — TA, D-162]"; mantenha os hex atuais e anote a pendência.
4. T-06.5, T-07.1: os pontos de efeito começam ao fim da saída da carta e ficam até o fim do preenchimento; anote os tempos como "a validar" (docs/14_UI_UX_DESIGN.md §14.10).
5. Novo quadro "Reduzir movimento" (T-07.1/T-07.2): pontos com fade, troca de faixa sem pulso, rastro mantido (docs/14_UI_UX_DESIGN.md §14.10.3).
6. T-06.1, C-04: dica contextual do toque em 2 passos quando a carta fica parada; texto e tempo "[a definir]"; sem rótulo de lado (D-163, D-084).
7. C-03, T-06.1, T-06.7: quem fala vem do campo `quem_fala` (D-164).
8. T-12.1, C-20: seletor 16 / 18 / 20 / 24 px, 18 marcado (D-165).
9. T-03.2-3: borda só com filete branco; tire o "[a definir]" (D-166).
10. T-11.1, T-15.5, T-16.2: Esc — com metade revelada, o 1º cancela e o 2º abre a pausa (D-167).
11. T-09.5, C-11: Senado na fase 4 só com a meta (— / 81, quórum 54) (D-168).
12. T-15.2-P vira T-15.6 (36 px) e T-15.3 sai de PROPOSTA (D-169).
Influenciador é INST-181 (docs/17_ROTEIRO_DAS_CARTAS.md:526-534).
```
