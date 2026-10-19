# Prompt — Wireframes, rodada final (pronta para codar)

**Para quem:** membro da equipe que vai rodar no Claude Design (Opus 5.5, esforço máximo).
**Como usar:** dê acesso ao repositório https://github.com/matix0/o-planalto e cole o bloco abaixo inteiro. Anexe (ou dê o link) da 1ª rodada de wireframes para servir de base.
**Citações:** por seção (§), não por linha, porque as linhas mudam. Use o `main`; se algo divergir, siga o repositório e liste a divergência.
**Decisões:** D-084 a D-173 em `gestao/decisoes.md`. Atualizado em 2026-10-19.
**Insumos desta versão:** avaliação consolidada (`.claude/notas/avaliacao-wireframes/consolidado.md`), notas da rodada 3 (`.claude/notas/rodada3/ux.md`, `godot-ui.md`, `web.md`).

---

```
# Papel
Você é um designer de UX/UI sênior de jogos mobile de cartas (gênero "Reigns") e conhece a UI do Godot 4.7 (Control nodes). Esta é a ÚLTIMA rodada de wireframes de "O Planalto" antes da implementação. O resultado precisa ser implementável sem adivinhação: cada quadro diz o que é, como se comporta, com que medidas, tokens, nós e animações.

# Fonte de verdade (leia antes de desenhar)
Repositório https://github.com/matix0/o-planalto (branch main):
- docs/14_UI_UX_DESIGN.md (inteiro) — regras de interface.
- docs/14A_INVENTARIO_DE_TELAS.md (inteiro) — checklist oficial: 16 telas, 64 estados, 21 componentes, 8 fluxos.
- docs/15_FLUXO_DO_JOGO.md §15.02-15.08 — fluxo e durações.
- docs/16_MANUAL_DO_JOGADOR.md Parte B — textos aprovados do tutorial.
- docs/17_ROTEIRO_DAS_CARTAS.md (INST-001, INST-003, INST-141 a 145, INST-181, ATOR-001) e docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md (APR-001).
- gdd/sistemas/02_finais.md §3, 03_impeachment.md §3, 04_eixo.md §3-4, 05_cartas.md §3, 10_estado_partida.md §3-5.
- gestao/decisoes.md — D-084 a D-173.
Base visual: a 1ª rodada de wireframes. Mantenha o que estava conforme; refaça só o que este prompt pede e complete o que falta.

Referências de implementação (Godot, skills GodotPrompter v1.13.2, MIT — leia os links se não tiver as skills):
- UI e Theme: https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/godot-ui/SKILL.md
- Multi-resolução: https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/responsive-ui/SKILL.md
- HUD: https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/hud-system/SKILL.md
- Entrada (toque, mouse, teclado): https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/input-handling/SKILL.md
- Tweens: https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/tween-animation/SKILL.md
- Mobile: https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/mobile-development/SKILL.md
- Tradução e leitor de tela: https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/localization/SKILL.md
- Agente de UI (papel de referência): https://github.com/jame581/GodotPrompter/blob/v1.13.2/agents/godot-ui-designer.md

# Regra de ouro
Use SOMENTE o repositório e este prompt. Não invente mecânicas, textos, números, telas ou regras. Onde faltar, placeholder visível "[a definir]". Ideias próprias só em variante separada com o selo "PROPOSTA". Se este prompt e o repositório divergirem, siga o repositório e liste a divergência.

# O jogo
Jogo educativo de conscientização política (não de doutrinação). Público: 15 a 30 anos, periféricos e estudantes, maioria no celular de entrada, familiaridade com jogos média a baixa (gdd/GDD.md §3.1). O jogador é o Presidente do Brasil (D-087). 4 anos × 7 cartas; partida de ~15 min. Interface em PT-BR.

# Restrições obrigatórias
1. Retrato. Viewport base 390×844, stretch canvas_items + aspect expand; conferir em 360×800 e 430×932 (D-170). PC/Web: coluna central de no máximo 430 px, laterais vazias ou decoradas "[a definir]" (D-171).
2. NUNCA "esquerda", "direita", "◀", "▶" ou setas de lado na interface; o lado de cada opção é sorteado (D-084, D-099).
3. Nenhuma pista sobre os medidores durante o arraste ou depois do 1º toque (docs/14 §14.05).
4. Medidores sem números durante a partida; números só na tela final (docs/14 §14.03).
5. Texto da opção e borda partidária só durante o arraste ou depois do 1º toque naquela metade (docs/14 §14.04.2, §14.04.4).
6. Toda opção de carta tem cor partidária, com filete branco de 2-3 px dos DOIS lados da faixa (D-092, D-156). Exceção: na calibração a borda é só o filete branco (D-166).
7. Sem meses e sem reais no HUD e no rodapé; Caixa é medidor de 0 a 100 (docs/14 §14.02). Texto aprovado de carta fica como está (ex.: INST-181).
8. Texto padrão 18 px; seletor 16 / 18 / 20 / 24 (D-165); 36 px como variante de teste (D-169). Poppins nos títulos, Inter no corpo. Escala dos títulos por passo: proponha uma tabela marcada "a validar" (docs/14 §14.13 #3).
9. Retratos em silhueta genérica + nome (D-142); dado do campo quem_fala (D-164). Ícones só CC0, estilo Kenney (D-140).
10. Verde e vermelho NUNCA significam "a favor/contra" nem "ganho/perda": são cores de partido (docs/14 §14.11.2; D-156). Secundária, alerta e destaque são neutras (branco e cinzas) (D-172).

# Interação da carta
- Arrastar: acompanha o dedo e inclina (pivô embaixo-centro); soltar antes do limite volta ao centro; além do limite confirma e sai pelo lado (docs/14 §14.04.4).
- Limite: 40% da largura da carta ou flick de 700 px/s; o flick só confirma se o texto daquela opção já apareceu ou a carta andou 20-25% (D-146, D-153). Sensibilidade ajustável 25-40% (D-158). Linha tracejada "limite 40% (ajustável)" nos quadros de arraste.
- O TEXTO DA OPÇÃO NUNCA SAI DA TELA: ancore-o na metade da carta voltada para o centro da tela e teste com a opção mais longa ("Nomear relator adversário", "Selar um pacto com o Congresso"). Se quebrar em 2 linhas, mostre e liste como divergência com gdd/sistemas/05_cartas.md §3.3 (1 linha).
- Toque em 2 passos (WCAG 2.2 SC 2.5.7, https://www.w3.org/WAI/WCAG22/Understanding/dragging-movements.html): 1º toque numa metade revela; 2º toque na mesma metade confirma, aceito só após 0,5 s; outra metade troca; tocar fora cancela; sem tempo limite (D-145, D-157). Metades sem rótulo.
- Dica contextual do toque quando a carta fica parada; texto e tempo "[a definir]"; sem rótulo de lado (D-163).
- Teclado no PC: setas revelam a metade, Enter confirma, Esc cancela; com metade revelada, 1º Esc cancela e 2º abre a pausa (D-156, D-167). Mouse: arrastar ou clicar em 2 passos.
- Desenhe também um estado "armado" ao cruzar o limite como PROPOSTA (ex.: borda mais grossa); vibração curta opcional, Input.vibrate_handheld (Android, iOS, Web: https://docs.godotengine.org/en/stable/classes/class_input.html).

# Tokens
- Fundo #263238 · carta #37474F · texto #FFFFFF · texto secundário #B0BEC5 · primária branca (D-159) · secundária, alerta e destaque neutras (D-172).
- 7 cores partidárias só na borda: vermelho #C62828, azul #1565C0, verde #2E7D32, amarelo #F9A825, roxo #6A1B9A, laranja #EF6C00, preto #212121 (D-151).
- Faixas dos medidores, só nos medidores: 0-20 #0097A7 · 21-40 #00ACC1 · 41-60 #26C6DA · 61-80 #4DD0E1 · 81-100 #80DEEA — EM REVISÃO pelo TA (D-162): mantenha e anote "[em revisão — TA]". O claro não significa "bom".
- Contraste: texto ≥ 4,5:1 (https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html); componentes e gráficos ≥ 3:1 (https://www.w3.org/WAI/WCAG22/Understanding/non-text-contrast.html). Anote a razão de cada par novo.
- Espaçamento: defina uma escala de tokens (ex.: 4/8/12/16/24/32) e use só ela nas medidas.
- Alvo de toque mínimo 48×48 (Android: https://developer.android.com/guide/topics/ui/accessibility/apps).

# HUD e feedback
- 8 ícones que enchem, ordem: Dignidade (casa), Consciência (livro), Soberania (bandeira), Segurança (escudo), Integridade (lupa) | Caixa (moeda), Capital Político (Congresso), Legitimidade (povo) (docs/14 §14.03).
- Rastro do nível anterior durante o preenchimento, sem número nem direção (D-161). Mostre num quadro com variação pequena (±1 a ±4, Ano 1) e noutro com grande.
- Pontos de efeito sem direção: pequeno (até 10) círculo sólido ~6; grande (acima de 10) ~10 com anel ~14 (D-156). Comecem ao fim da saída da carta e fiquem até o fim do preenchimento (tempos "a validar", docs/14 §14.10).
- Consequência: frase de 1 linha sobre o HUD atualizado; espera o toque (docs/14 §14.06). Indicação de "toque para continuar": "[a definir]".
- Carta de Aprendizado: folha modal com fundo escurecido; resumo (conceito + frase de impacto) e "Saiba mais" (vivência, dados, fonte com link) (docs/14 §14.07; D-160).
- Leitor de tela (só PC; mobile aguarda o Godot, D-152): medidor anuncia "Dignidade, faixa 2 de 5", nunca o número.

# Telas — TODOS os 64 estados de docs/14A §14A.02
Use o mesmo conteúdo real da 1ª rodada (INST-001 etc.). Pontos que mudam ou faltam:
- T-01: avisos de conteúdo como etiquetas sóbrias; "Novo mandato" (docs/15 §15.03; doc 14 ainda diz "Iniciar" — listar).
- T-03: borda só com filete branco, sem "[a definir]" (D-166). HUD na calibração: "[a definir]".
- T-04.5: aviso de Captura no cartão do Ano 4; duração 600-800 ms "a validar"; desenhe também a variante que espera o toque (PROPOSTA).
- T-05: evento; desenhe como PROPOSTA a variante com a origem (título da carta que causou).
- T-06: estrutura HUD → quem fala → problema → carta → rodapé com pausa 48×48 à direita (D-150). O problema real ocupa ~4 linhas: mantenha e liste a divergência D3 (regra de 2 linhas).
- T-07: novo quadro do rastro; pontos após a saída da carta.
- T-09.5: Senado só com a meta "— / 81", quórum 54; barra só no resultado (D-168).
- T-12.1: seletor com 18 marcado; estados "Reduzir movimento" e "Alto contraste" ligados; sensibilidade em 25% e 40%.
- T-15: 16, 24, 36 px (T-15.6, base P1, D-169), alto contraste (T-15.3, base P2, D-169), T-08.2 a 24 px, foco de teclado.
- T-16: coluna até 430 px (D-171) numa janela 1920×1080 e 1280×800.
- Retomada (F-07): quadro retomando no meio do impeachment e em T-08.3.

# Componentes C-01 a C-21 (docs/14A §14A.03), com:
- C-05: corte com as 3 camadas e a largura de cada uma (branco / partido / branco).
- C-14: variante A (cancelar primário) e variante B (confirmar primário) lado a lado para o PO escolher (D-173). Textos "[a definir]".
- C-15: normal, pressionado, foco, desabilitado; mínimo 48×48.
- C-20: seletor 16/18/20/24; chaves desligada/ligada; slider 25-40% (passo "[a definir]").
- Legenda das cores partidárias: só como PROPOSTA, sem associar valor (D-173).

# Fluxos F-01 a F-08 (docs/14A §14A.04), navegáveis.

# Animações
Para cada linha de docs/14 §14.10 e docs/14A §14A.05, anote: elemento, propriedade, de → para, duração, curva (ex.: cúbica, saída) e o substituto com "Reduzir movimento" (saem pulso, pop, deslize, zoom e flash; ficam fades curtos, preenchimento e rastro — docs/14 §14.10.3). Desenhe um quadro "Reduzir movimento" para T-06.5 → T-07.2. Defina como "a validar" o que não tiver duração no doc (entrada da carta, retorno ao centro, modais, retomar).

# Anotações para implementação (em cada quadro)
- Árvore de nós Godot sugerida (ex.: MarginContainer de área segura → VBoxContainer → HUD / quem fala / problema / CardSlot / rodapé). Referência: notas godot-ui (skills acima).
- Âncoras e o que estica/encolhe; área segura (notch) como variável safe_top/safe_bottom (DisplayServer.get_display_safe_area, Android e iOS: https://docs.godotengine.org/en/stable/classes/class_displayserver.html).
- Token de estilo de cada texto e painel (variação de Theme: Title, Body, Caption, Footer; Primary, Secondary; Card, CardCrisis, Sheet, Modal, Toast).
- Medidas só com tokens de espaçamento; tamanhos mínimos.
- Ordem de foco numerada (PC) e accessibility_name de cada controle.
- Folga de +30% de texto para tradução futura; RTL fora do escopo.

# Em aberto (não decida; "[a definir]")
docs/14A §14A.07 inteiro, mais: controles de áudio; visual do modo Influenciador; conteúdo de "Compartilhar"; texto dos modais, avisos, abertura e resultados do impeachment e descrições curtas dos finais; texto e tempo da dica do toque; escala dos títulos; nova escala de ciano.

# Entregáveis
1. Todos os 64 estados, nomeados pelo código, nos tamanhos 390×844 (e as conferências 360×800 e 430×932 para T-06.1, T-10.1 e T-08.2).
2. Folha de componentes C-01 a C-21 com todos os estados.
3. Fluxograma F-01 a F-08 navegável.
4. Tabela de tokens (cores com contraste, tipografia por passo, espaçamento).
5. Tabela de animações (elemento, propriedade, de→para, ms, curva, reduzir movimento).
6. Anotações de implementação por quadro (seção acima).
7. Lista final "Pontos em aberto, PROPOSTAS e divergências", incluindo: D3 (problema > 2 linhas), D10 (manual com 27 finais e sem salvamento, docs/16), "Iniciar" × "Novo mandato", 1 linha × 2 linhas nas opções, qualquer outra divergência achada.

# Processo
1. Leia a fonte de verdade e as referências.
2. Resuma em 5-10 linhas o fluxo e as restrições.
3. Entregue na ordem T-01 → T-16, C-01 → C-21, F-01 → F-08, tokens, animações.
4. Antes de finalizar, confira cada quadro contra as 10 restrições e a interação da carta, e responda sim/não:
   a. Algum texto de opção sai da tela em algum quadro de arraste?
   b. Alguma cor partidária aparece fora da borda da carta?
   c. Algum número de medidor aparece antes da tela final?
   d. Todos os 64 estados, 21 componentes e 8 fluxos estão presentes?
   e. Toda medida usa token e todo quadro tem árvore de nós e animação anotadas?
```

---

## Referências GodotPrompter (repositório original da skill)

Repositório: https://github.com/jame581/GodotPrompter (v1.13.2, commit `eae755a`, licença MIT). Usadas nesta rodada:

| Item | Uso | Link |
| :--- | :--- | :--- |
| `using-godot-prompter` | Índice e fluxo | https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/using-godot-prompter/SKILL.md |
| `godot-ui` | Theme, containers, borda C-05, FoldableContainer | https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/godot-ui/SKILL.md |
| `responsive-ui` | Viewport, stretch, coluna do PC | https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/responsive-ui/SKILL.md |
| `hud-system` | HUD, medidor, rastro | https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/hud-system/SKILL.md |
| `input-handling` | Arraste, toque, teclado | https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/input-handling/SKILL.md |
| `tween-animation` | Animações e "Reduzir movimento" | https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/tween-animation/SKILL.md |
| `mobile-development` | Área segura, orientação | https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/mobile-development/SKILL.md |
| `localization` | accessibility_name, folga de texto | https://github.com/jame581/GodotPrompter/blob/v1.13.2/skills/localization/SKILL.md |
| Agente `godot-ui-designer` | Anotações Godot por quadro | https://github.com/jame581/GodotPrompter/blob/v1.13.2/agents/godot-ui-designer.md |

Para a implementação (próxima fase), consultar também: `scene-organization`, `state-machine`, `save-load`, `resource-pattern`, `godot-testing`, `godot-code-review` (mesmo padrão de link: `.../blob/v1.13.2/skills/<nome>/SKILL.md`) e os agentes `godot-game-architect`, `godot-game-dev`, `godot-code-reviewer` (`.../blob/v1.13.2/agents/<nome>.md`).

APIs do Godot conferidas no class reference 4.7.2 gerado localmente (`godot --doctool`): `custom_maximum_size`, `offset_transform_*`, `pivot_offset_ratio`, `accessibility_name`/`accessibility_live`, `FoldableContainer`, `TextureProgressBar.FILL_BOTTOM_TO_TOP`.
