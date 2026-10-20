# Prompt — P-014 Correções da validação ponta a ponta

**Para quem:** membro da equipe, numa sessão nova do Claude Code (Opus 5.5) aberta na raiz do repositório.
**Como usar:** crie a branch `claude/p014-correcoes` a partir de `claude/game-end-to-end-validation-8f501a` (ponta da branch: protótipo do P-005 + este plano) enquanto o P-005 não estiver no `main`; depois que entrar, a partir do `main` e cole o bloco abaixo inteiro.
**Insumos:** `gestao/validacao-2026-10-20.md` (relatório; os IDs V-xxx vêm da seção 4), decisões D-174 a D-190 (`gestao/decisoes.md`), plano P-014 (`gestao/plano-de-acao.md`). Atualizado em 2026-10-20.
**Roda em paralelo com:** P-015 (cartas, `gestao/prompts/criacao-cartas.md`). A etapa 2 deste plano destrava a Onda 1 do P-015: termine-a cedo e avise o PO.

---

```
# Papel
Você é o fio principal do P-014 do "O Planalto" (CLAUDE.md): corrigir o protótipo Godot 4.7.2 (`jogo/`), os GDDs e os docs com base na validação ponta a ponta de 2026-10-20. Você orquestra os subagentes do projeto (`.claude/agents/`) e as skills GodotPrompter. O PO aprova o que tiver conteúdo novo.

# Governança (obrigatória)
- Leia CLAUDE.md, gestao/estado.md e .claude/rules/*.md antes de começar.
- Só o PO decide. Número, texto ou escolha nova que este prompt não traz → pergunte com 2-4 alternativas, prós, contras e recomendação, e só grave depois da resposta.
- Cite `arquivo:linha` ou marque `[não verificado]`. Confira 5 afirmações de cada subagente (.claude/rules/verificacao.md).
- Subagentes: no máximo 3 em paralelo, notas incrementais em .claude/notas/p014/, retorno ≤ 400 palavras (.claude/rules/subagentes.md).
- GDD de sistema: seção por seção, cada seção aprovada pelo PO antes de gravar (.claude/rules/design-docs.md).
- Antes de implementar qualquer sistema Godot, carregue a skill `godot-prompter:*` correspondente (godot-ui, input-handling, save-load, export-pipeline, godot-testing, gdscript-patterns, responsive-ui…).
- Responda ao PO no formato "Fase / Insumos / Decisões pendentes (≤5) / Próximo passo".

# Isolamento (obrigatório)
- Testes e execuções do jogo só numa cópia: `cp -r jogo <scratchpad>/pt`, `godot --headless --path <scratchpad>/pt --import`, e SEMPRE com `XDG_DATA_HOME=<scratchpad>/xdg` (o `user://` real "O Planalto" guarda o save do PO).
- Testes: `XDG_DATA_HOME=<scratchpad>/xdg GODOT=$(which godot) jogo/tests/run_all.sh <scratchpad>/pt`.
- NUNCA rode o MCP do Godot (`run_project`) em `jogo/`: ele injeta `mcp_interaction_server.gd` e uma linha `[autoload]` no `project.godot` (D-189). Use-o só na cópia.

# Decisões já tomadas (não reabrir)
D-174 final mais específico vence · D-175 revelação: alto > 60, baixo < 40 + 6º texto "sem padrão" · D-176 P-006 espera o doc 17 · D-177 opção até 25 caracteres + rótulo do arraste na largura visível da carta · D-178 alto contraste mantido · D-179 alternativo após o Aprendizado; sequência zera no Ano 2 · D-180 "mais perdeu" = queda aplicada · D-181 finais do Ano 4 com valores pós-cena · D-182 evento ao epílogo na condenação · D-183 calibração sem a caixa do HUD · D-184 fade para preto + pausa; Captura espera toque · D-185 Voltar na tela de título sai; Enter sem 0,5 s · D-186 36 px: títulos menores, quebra só em espaços · D-187 modal destrutivo variante A · D-188 licença do Godot por `Engine.get_license_text()`; 1º preset só Web · D-189 MCP só em cópia + pre-commit · D-190 avisos de conteúdo unificados; citações de políticos vivos esperam RC-08.
Texto completo: gestao/decisoes.md (D-174 a D-190). Contexto e evidência: gestao/validacao-2026-10-20.md.

# Ainda com o PO (pergunte na etapa em que aparecer)
- Texto do 6º padrão "sem padrão" (D-175): o GD rascunha, o PSI revisa, o PO aprova.
- Lista unificada de avisos de conteúdo (D-190): o PO escolhe, o PSI revisa.
- Qualquer número de layout novo (largura mínima do rótulo do arraste, escala de títulos a 36 px, duração da pausa antes do final).

# Etapas
## 1. GDDs e docs (GD + AIW; PO aprova cada seção)
- gdd/sistemas/02_finais.md §3.2 (D-180), §3.3 passo 5 e §4 (D-174: desempate por especificidade; CA nova "#14 Populismo Autoritário sai com Leg 85, Cons 20, Int 20"), §3.3/§4 (D-181).
- gdd/sistemas/03_impeachment.md §3.1 (D-179). gdd/sistemas/08_eventos.md §5 (D-182). gdd/sistemas/01_medidores.md §3.3.2 (dobro da Consciência vale também para evento e carta da cena).
- gdd/GDD.md §9.2 e gdd/sistemas/04_eixo.md §3.3 (D-175; o PSI revisa "negligenciou" e as reticências — achado P-07 do relatório).
- gdd/sistemas/05_cartas.md §3.3 e gdd/GDD.md §5.3 (D-177: "frase curta, até 25 caracteres"); docs/10_GUIA_DE_ESTILO_E_TOM.md:104 ("máx. 60 caracteres" → 25).
- /sync-docs: gdd/GDD.md §13.1 (soma 375, D-141), §10.1 × D-172 (secundária/alerta/destaque neutras), avisos de conteúdo GDD §14.3 × docs/16 §16.13 (D-190).
- /sync-tech: docs/13_ARQUITETURA_TECNICA.md com chaves em EN (D-136; hoje `opcao_a`, `cartas.json`).
- jogo/README.md (tabela "A validar" com as decisões D-174 a D-190; cobertura real das cartas fictícias); .claude/agents/qa.md ("26 finais" → 28).

## 2. /validate-cards (fazer primeiro; destrava o P-015)
- .claude/commands/validate-cards.md: fonte `jogo/data/cards.json` (hoje diz `dados/cartas.json`); opção ≤ 25 caracteres (D-177); `quem_fala` obrigatório (D-164).
- jogo/scripts/game_data.gd (`validate_card`, `_validate_option`): mesmas duas regras; teste negativo em jogo/tests/test_data.gd. As 40 cartas fictícias não têm `quem_fala`: pergunte ao PO se ganham o campo ou se a regra vale só para o conteúdo real.

## 3. Regras (DEV; skill gdscript-patterns)
- jogo/scripts/core/ending_rules.gd `end_of_term` (D-174).
- jogo/scripts/core/axis_rules.gd `meter_reveal`: limiares lidos do balance.json + texto "sem padrão" (D-175).
- jogo/scripts/core/game_flow.gd: `run.capital_streak = 0` em `_begin_year` ao abrir o Ano 2 (D-179); em `_finish`, o `last_result.pending_events` vai ao epílogo quando a cena termina em condenação (D-182).
- `capture_at_or_above` do balance.json lido pelas condições de Captura (hoje fixo em endings.json; achado V-035).
- jogo/scripts/core/draw_rules.gd `is_eligible`: carta cujo Aprendizado falha na validação de fonte fica fora do baralho (V-015).

## 4. Interface (DEV + UX; skills godot-ui, responsive-ui, input-handling)
- jogo/scripts/ui/components/swipe_card.gd (`_layout_option`, `_set_drag`): no arraste, o rótulo ocupa a parte visível da carta e nunca sai da tela, de 16 a 36 px e no limite de 25% a 40% (D-177).
- 36 px: escala menor dos títulos (tokens.gd) e quebra só em espaços (autowrap WORD) no título e na opção (D-186).
- Dica do toque com quebra e largura máxima da carta (swipe_card.gd `_show_hint`; V-022).
- Link da fonte com alvo de 48 px (scenes/components/learning_sheet.tscn; V-024).
- Sem a caixa "[HUD na calibração]" (calibration_screen.gd; D-183).
- Ida ao final: camada preta + pausa antes da T-10 (main.gd `FINAL_FADE`); aviso de Captura espera toque (year_card.gd `CAPTURE_WAITS_TAP = true`) (D-184).
- Voltar do Android na tela de título sai do jogo (main.gd NOTIFICATION_WM_GO_BACK_REQUEST; D-185).
- Área segura no Web em celular (main.gd `_safe_insets`: features web_android/web_ios; V-026).
- Modal destrutivo: confirmar que a variante A fica (confirm_modal.gd `VARIANT`; D-187) e tirar o "a validar".

## 5. Técnico (DEV; skills save-load, export-pipeline)
- jogo/scripts/autoload/save_manager.gd: gravar em `save.json.tmp` e renomear (V-008); no Web, teste de fechar a aba logo após uma escolha.
- jogo/scripts/ui/screens/about_screen.gd: aviso do Godot com `Engine.get_license_text()`, lista real de assets (ícones hoje são próprios, `jogo/assets/icons/README.md`; tirar o crédito "Kenney (CC0)") (D-188).
- jogo/export_presets.cfg: preset Web, excluindo `scenes/dev/*` e `tests/*` (D-188).
- Checagem no pre-commit que barra `mcp_interaction_server` no `jogo/project.godot` (D-189). Pergunte ao PO onde fica (hook do git ou hook do Claude Code em .claude/settings.json).
- Tirar dos comentários as referências a `.claude/notas/p005/*` (não existem).

## 6. Testes (QA + DEV; skill godot-testing)
- Testes de tabela: as condições dos 28 finais (endings.json) e as 10 relações do balance.json. Meta: mudar 1 unidade em qualquer valor desses arquivos faz algum teste falhar em ≥ 90% dos casos (na validação, 53 de 54 mudanças nos finais e 27 de 46 no balance.json passavam).
- jogo/tests/test_e2e.gd: o final esperado passa a ser calculado jogando a mesma política só pela API (hoje é a constante `EXPECTED_ENDING`).
- Novos: D-174 (END-015 sai), D-175 (o marcador "[a definir…]" nunca aparece), D-177 (rótulo dentro da tela no limite do arraste, 16-36 px), D-179, D-180, D-182; medidor em 0 pela interface; retomada na calibração e num aviso de evento pela interface.

## 7. Verificação ponta a ponta
- run_all.sh verde na cópia isolada.
- Simulação headless de ~2.000 partidas pela classe GameFlow (perfis: aleatório, sempre A, sempre B, cuidadoso, afundar o Capital, maximizar/minimizar cada medidor), checando: medidores 0-100, determinismo por semente, salvar → JSON → restaurar no meio dá o mesmo resultado, atraso dos eventos. Esperado: END-015 aparece; nenhuma tela final com marcador. O script fica no scratchpad, fora do repositório.
- Capturas em janela real em 390×844, 360×800 e PC (jogo/tests/shot_*.gd; sem xvfb, rode em escala 0,75: 292×633, 270×600), com texto 16/18/20/24/36 e alto contraste.
- QA confere 5 citações de cada subagente.

## 8. Fechamento
- /fechar-plano (atualiza decisoes, changelog, estado e o P-014 em gestao/plano-de-acao.md).
- PR de `claude/p014-correcoes` para o `main`. Avise o PO para que o P-015 faça merge antes da migração das cartas.

# Fora do escopo
Cartas reais (P-015), áudio, modo daltônico (D-178), preset Android/PC, localização.

# Critério de "pronto"
Os 17 itens D-174 a D-190 aplicados (ou registrados como "só GDD"); os achados V-xxx citados nas etapas 3-5 corrigidos; testes da etapa 6 verdes; simulação e capturas da etapa 7 sem regressão; PO aprovou os GDDs alterados.
```
