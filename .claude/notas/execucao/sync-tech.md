# Nota — /sync-tech (doc 13) — P-014 etapa 1

**Data:** 2026-10-20 · **Papel:** AIW/DEV · **Branch:** claude/p014-p015 · **Sem commit.**
**Escopo de escrita:** `docs/13_ARQUITETURA_TECNICA.md`, `docs/13.1_RELATORIO_SINCRONIZACAO.md`, esta nota. Nenhum outro arquivo.

## Progresso

- [x] Leitura de `.claude/commands/sync-tech.md` (7 passos; passo 4 = apresentar ao PO antes de editar; passo 7 = commit, mas o prompt proíbe commit).
- [x] Leitura de `gestao/prompts/correcoes-p014.md` (etapa 1: "/sync-tech: docs/13 com chaves em EN (D-136; hoje `opcao_a`, `cartas.json`)").
- [x] Leitura integral do doc 13 (777 linhas).
- [x] Leitura de `gestao/decisoes.md` (D-130 a D-142, D-164, D-177, D-189, D-190). Pontos-chave: D-133 (autoload MCP em `tools/mcp/`) foi REVISADA por D-189; D-138 JSON, não `.tres` (doc 13:468 recomenda Resources = diverge); D-136 EN; D-137 `jogo/`; D-165 seletor 16/18/20/24 (doc 13:739 diz 3 tamanhos).
- [x] Leitura de jogo/data/*.json, game_data.gd, core/*.gd (todos), autoload/*.gd (todos), README, project.godot, run_all.sh, main.gd (início), tokens.gd (início), tests (cabeçalhos), .mcp.json, site/docs-map.mjs.
- [x] Lista de divergências (doc 13 linha x jogo linha) — SY-01..SY-39 + SY-40..SY-45 (abaixo).
- [x] Edição do doc 13 (22:4x): gravado por splice a partir da cópia do original (`scratchpad/sync-tech/build_doc13.py`); 777 -> 968 linhas; lint markdown 0 problemas; blocos JSON conferidos contra `jogo/data/*.json` (meters, actors, endings, cards[0] idênticos).
- [x] Relatório `docs/13.1_RELATORIO_SINCRONIZACAO.md` (gerado por `scratchpad/sync-tech/build_report.py`): 48 divergências = 41 corrigidas + 6 "(planejado)" + 1 aberta; 3 pontos para o PO (P-1 descrição do final, P-2 D-055, P-3 GDD §12).
- [x] Verificação final: ver "Fechamento" no fim desta nota.

## Observações iniciais (doc 13 antes da edição)

- Doc 13 usa chaves PT: `titulo`, `modo`, `tipo`, `problema`, `opcao_a/b`, `texto`, `cor`, `eixo`, `efeitos`, `atores`, `eventos`, `consequencia`, `aprendizado_id`, `pre_requisitos.ano_minimo`, `tecnica`, `reacao`, `teste`.
- Arquivos citados: `cartas.json`, `medidores.json`, `atores.json`, `finais.json`, `calibracao.json`, `eixo_ideologico.json`, `dialogos.json`, `eventos.json` (pasta `dados/`).
- Pastas: `dados/`, `cenas/`, `scripts/gerenciador_*.gd`, `sistema_*.gd` (seção 13.7), tudo PT.
- 13.2.5 diz "Godot 4.7 (download em godotengine.org)", MCP "Configuração adiada para o P-005 (D-072)", "[não verificado]" para addon.
- 13.3.5 "Estado da Partida" sem formato salvo real (precisar conferir run_state.gd / save_manager.gd).
- 13.5.2 exemplo `cartas.json` em PT.
- 13.9.2 acessibilidade: "3 tamanhos" (verificar Settings: 16/18/20/24/36?).

## Achados da leitura dos dados (jogo/data, estado do working tree ~22:05)

- AVISO: outros agentes editam o working tree em paralelo (arquivos de 21:58-22:03: balance.json, learning.json, game_data.gd, axis_rules.gd, ending_rules.gd, game_flow.gd, test_core_endings/impeachment, test_data, test_shell, docs/16). Linhas citadas = estado lido hoje; REVALIDAR no fim.
- data/*.json reais (9): actors, balance, calibration, cards, endings, impeachment, learning, meters, modes. NÃO existem: eixo_ideologico.json, dialogos.json, eventos.json.
- meters.json: id,name,category(social|power),initial,zero_ending,capture_ending. (doc 13: nome, categoria, valor_inicial/atual/minimo/maximo, final_zero, final_cem, cor, icone)
- actors.json: id,name,category(capital|state|civil_society|media_tech),archetype,offers,costs,cards{attack,demand,offer}. (doc 13: oferece, cobra, ataque, exigencia, oferta)
- cards.json: id,title,mode(id EN),type(institutional|thematic|actor|impeachment),speaker,problem,option_a/b{text,color(EN),axis,effects,actors,events[{text,delay,effects}],consequence,reaction?},learning_id,prerequisites{min_year},technique?
- IDs de carta seguem INST-/THEM-/ATOR- (CARD_PREFIX game_data.gd:15) e ator ACT- (D-104); APR-xxx em learning.json.
- GameData constantes: COLORS red/blue/green/yellow/purple/orange/black (game_data.gd:16); TECHNIQUES 6 (17); REACTIONS accept/refuse/investigate (18); OPTION_TEXT_MAX=25 (12).
- balance.json: year_multipliers, relations(10), awareness_loss_doubling, thresholds(2), balance_bonus, emergency_at_or_below, linked_card_below, calibration_step, actor_initial/step/levels, cards_per_turn, max_mandatory_per_turn, capture_at_or_above(95), capture_warning_at_or_above(81), reveal_high_above(60), reveal_low_below(40).
- project.godot: autoloads GameData, Settings, SaveManager, Game (linhas 18-23); 390x844, canvas_items+expand; gl_compatibility; config/features 4.7. NÃO há autoload MCP, nem `tools/mcp/`, nem export_presets.cfg.

## Contexto colhido (2026-10-20 ~22:10)

- Outros agentes mexem em `jogo/` ao mesmo tempo (P-014 etapas 3-5): main.gd já tem `get_tree().quit()` no Voltar (D-185, main.gd:~102-106); about_screen.gd já lê OFL de assets/fonts mas ainda tem `ASSETS_TEXT := "Kenney (CC0) e outros"` (about_screen.gd:19); game_flow.gd já tem D-179/D-182; save_manager.gd ainda NÃO atômico (save_manager.gd:21-25); export_presets.cfg e pre-commit NÃO existem (.git/hooks só samples). => No doc 13 usar "(P-014 etapa N)" e REVERIFICAR no fim.
- Site: `site/src/docs-map.mjs` lista docs explicitamente; `docs/13.1_RELATORIO_SINCRONIZACAO.md` NÃO é publicado nem quebra o build. Doc 13 É publicado (docs-map.mjs:39) -> manter numeração de seções (refs externas: §13.2.5 D-132, §13.3.1/13.3.2/13.3.4/13.3.5/13.3.6 em gdd/sistemas/*, validate-finals.md:12,19, §13.5 D-138).
- Nota do GD (d175-gd.md §1.5, §4.4): textos da revelação em docs 04/05/13/15 (doc 13:413-417) serão ajustados num /sync-docs posterior (5 textos + 6ª linha). NÃO duplicar/alterar esses 5 textos; só acrescentar limiares e ponteiro ao GDD §9.2.
- Fora do meu escopo (só sinalizar): gdd/GDD.md:650-694 (§12 com `opcao_a`, `dados/`, `cenas/`), docs/05:179-198, docs/14:89, README.md:82-85 (dados/ cenas/ scripts/ addons/), .claude/commands/validate-finals.md:10-19 (dados/finais.json; campos descricao/cor/icone), gdd/sistemas/05_cartas.md:29-34 (`quem_fala`, `opcao_a`...), docs/14A:234 (`quem_fala`).
- Cabeçalho "Medidor Afetado | Medidor que Afeta" invertido (doc 13:421, docs/04:160, docs/05:114): não é divergência com o jogo; só sinalizar.
- `.claude/notas/p005/` existe localmente mas é gitignored (.gitignore: `.claude/notas/`) -> NÃO citar no doc 13.
- Pre-existentes no jogo (não são do doc 13): game.gd:3 e main.gd:11 citam `.claude/notas/p005/*` (P-014 etapa 5 manda tirar).

## Divergências (rascunho; numeração SY-nn) — doc13:linha(original) × jogo:linha

A. Chaves/valores PT x EN (D-136)
- SY-01 carta `titulo/modo/tipo/problema/opcao_a/opcao_b/aprendizado_id/pre_requisitos.ano_minimo` (13:229-256, 261-271) × cards.json:2-62 `title/mode/type/problem/option_a/option_b/learning_id/prerequisites.min_year`
- SY-02 opção `texto/cor/eixo/efeitos/atores/eventos/consequencia/reacao/teste` (13:236-244, 275-284) × `text/color/axis/effects/actors/events/consequence/reaction/test` (game_data.gd:160-215)
- SY-03 evento `texto/atraso/efeitos` (13:282) × `text/delay/effects` (cards.json:28-36; game_data.gd:195-204)
- SY-04 valores de enum/chaves em PT: `"modo":"Congresso"`, `"tipo":"Institucional"`, `"cor":"vermelho"`, efeitos por nome de exibição (`"Capital Político"`) (13:233-234, 238-239, 249) × ids EN `congress`/`institutional`/`red`/`political_capital` (modes.json, game_data.gd:14,16, meters.json)
- SY-05 `reacao` aceitar/recusar/investigar (13:284) × accept/refuse/investigate (game_data.gd:18); `tecnica`: 6 ids EN (game_data.gd:17)
- SY-06 medidor `nome/categoria/valor_inicial/valor_atual/valor_minimo/valor_maximo/final_zero/final_cem/cor/icone` (13:289-301, 306-318) × `id/name/category(social|power)/initial/zero_ending/capture_ending` (meters.json:2-8); só 3 medidores têm `capture_ending` (D-096) — `final_cem` por medidor é de antes
- SY-07 ator `nome/categoria/arquetipo/oferece/cobra/cartas{ataque,exigencia,oferta}` (13:324-331, 334) × `name/category/archetype/offers/costs/cards{attack,demand,offer}` (actors.json:2-18; game_data.gd:19-20)
- SY-08 final `FINAL-001/nome/categoria/condicao{}/descricao/citacao/autor/cor/icone` (13:355-365, 370-380) × `END-001/name/category/trigger/conditions[{meter,op,value}]/quote/author/source`; sem descricao/cor/icone (endings.json:2-15; game_data.gd:260-271)
- SY-09 categorias de final: 6 (13:374) × 8 + 4 gatilhos (game_data.gd:21-22; ending_rules.gd:8-17)

B. Arquivos e pastas
- SY-10 arquivos PT `cartas/medidores/atores/finais/calibracao/eixo_ideologico/dialogos.json` (13:460-466) × `jogo/data/{cards,meters,actors,endings,calibration,modes,learning,impeachment,balance}.json` (game_data.gd:7); `eixo_ideologico.json` e `dialogos.json` não existem
- SY-11 raiz `{ "cartas": [...] }` (13:473-503) × raiz é array (cards.json:1; game_data.gd:58,387-389)
- SY-12 "Recomendamos Resources (.tres)" (13:468) × D-138 JSON
- SY-13 árvore (13:626-676) na raiz do repo, PT × `jogo/` (D-137) EN; sem `addons/`
- SY-14 `dados/eventos.json` na árvore (13:640) × D-111 / 13:506 (não existe)
- SY-15 scripts PT `gerenciador_*.gd/sistema_*.gd` (13:654-662) × `scripts/core/*_rules.gd`, `game_flow.gd`, `autoload/*.gd`, `game_data.gd`

C. Estrutura e lógica
- SY-16 estado salvo sem formato (13:337-350) × `RunState.to_dict` (run_state.gd:63-97), `user://save.json`, `format_version=1` (run_state.gd:7), seed/rng como string (run_state.gd:66-67,152-159); autosave a cada passo (game.gd:161-179); gravação não atômica (save_manager.gd:21-25; V-008)
- SY-17 `speaker` (D-164) ausente (13:229-271) × cards.json:7; game_data.gd:81-95,115-120; alias `quem_fala` (game_data.gd:82,116)
- SY-18 ids: `INST/THEM/ATOR` (13:263) × + `IMP-n` com `phase` (impeachment.json)
- SY-19 `texto` "1 linha" (13:277) × ≤ 25 caracteres (D-177; game_data.gd:12,164-165)
- SY-20 revelação sem limiares/6º texto (13:409-417) × balance.json:151-152, axis_rules.gd:33-46,95-117 (D-175)
- SY-21 "Antes: pendente (P-9)" (13:407) × implementado axis_rules.gd:52-69
- SY-22 fluxo da carta: "VERIFICAR EVENTOS ENCADEADOS" após Aprendizado (13:565) × evento agendado ao escolher (game_flow.gd:262) e disparado no início do turno de destino (game_flow.gd:155-165; D-112); após Aprendizado: gatilho alternativo (game_flow.gd:306-315; D-179)
- SY-23 fluxo do turno: "(evento encadeado?)" no fechamento (13:547) × game_flow.gd:574-604 (sem evento no fechamento)
- SY-24 fluxo geral sem tutorial/cartão de ano (13:521-526) × STATES (game_flow.gd:11-14), main.gd:30-40
- SY-25 gatilho alternativo sem momento/zeragem (13:595) × game_flow.gd:311-312,498-499 (D-179)
- SY-26 estados "Calibração, Turno, Carta, Aprendizado, Impeachment, Final" (13:58) × 9 estados (game_flow.gd:11-12)
- SY-27 padrões Factory/Observer/Strategy (13:58-60) × sem fábrica (game_data.gd:30,58-65), GameFlow puro sem signals (game_flow.gd:3-5), sorteio estático (draw_rules.gd)

D. Stack e ferramentas
- SY-28 Godot 4.7 (13:5,66,69,81) × 4.7.2 (D-130; project.godot:15)
- SY-29 MCP "Recomendação" (13:131) × adotado tugcantopaloglu (D-053/D-131)
- SY-30 passos 2-5 do fluxo (13:187-203) × D-131/D-132 (.mcp.json:4-7 com ${VAR:-…})
- SY-31 sem regra de isolamento do MCP (13:163-175) × D-189 (revisa D-133); project.godot:18-23 sem autoload MCP; sem pre-commit (planejado)
- SY-32 card-framework recomendado (13:219; D-055) × SwipeCard próprio; grep card-framework em jogo/ vazio
- SY-33 sem testes no doc × 18 tests + run_all.sh + shot_*.gd (D-134)
- SY-34 acessibilidade (13:738-741): 3 tamanhos / daltônico / leitor de tela × settings.gd:10-11 (16/18/20/24 + 36 de teste), D-151/D-178 pós-MVP, D-152
- SY-35 exportação (13:755-760) × 1º preset só Web (D-188); export_presets.cfg não existe
- SY-36 assets (13:686-709) × ícones próprios provisórios (assets/icons/README.md), Inter/Poppins OFL (assets/fonts/OFL-*.txt); "Kenney (CC0)" indevido em about_screen.gd:19 (P-014 etapa 5)
- SY-37 versionamento SemVer (13:748-751) × `format_version=1` do save; project.godot sem config/version; D-065 pendente
- SY-38 "sem nomes reais" (13:39) × D-083/D-086; RC-08
- SY-39 intro "base para a implementação do protótipo" (13:5) × protótipo existe (P-005)

SEM divergência (conferido): relações entre medidores e limiares (13:421-448) == balance.json:8-114; sorteio (13:388) == draw_rules.gd; satisfação (13:392) == actor_rules.gd:8-23 + balance.json:118-146; gatilhos do impeachment (13:591-596, 598-601) == impeachment_rules.gd:24-52; eventos (13:613) == event_rules.gd:10-28.

## Atualizações (2026-10-20 ~22:45)

- DP-009 chegou (decisoes-provisorias.md): textos da revelação + 6º texto já estão em GDD §9.2 (gdd/GDD.md:534-539), docs 04/05/15 e `axis_rules.gd:35-47`. A nota do GD (d175-gd.md:171) mandava o doc 13 esperar o /sync-docs; como 04/05/15 já foram sincronizados, atualizei também doc 13:413-417 (5 textos sem reticências + 6ª linha) e avisei no relatório. Reverter junto se o PO reverter a DP-009.
- Cabeçalho da tabela de relações (doc 13:421) estava invertido em relação ao `balance.json` (`source` = quem dispara). Corrigido só no doc 13; docs 04:160 e 05:114 seguem invertidos (fora do escopo).
- SY-40 revelação: 5 textos + "sem padrão" (13:413-417) × gdd/GDD.md:534-539, axis_rules.gd:38-47 (DP-009).
- SY-41 cabeçalho invertido da tabela de relações (13:421) × balance.json:8-90 (`source` -> `effects`).
- SY-42 "Final" sem `descricao` nos dados, mas doc 14 §14.09 / 14A:T-10.1 pedem descrição curta; tela mostra marcador (`game_flow.gd:28,459`). PONTO PARA O PO.
- SY-43 `learning.json`, `impeachment.json`, `modes.json`, `balance.json`: esquemas ausentes no doc 13 (só havia cartas/medidores/atores/finais) × game_data.gd:313-374. Adicionado §13.3.8.
- SY-44 configurações do jogador (`user://settings.cfg`) ausentes (13:337-350) × settings.gd:8-19. Adicionado §13.3.7.
- SY-45 regra de licença D-140 ausente em 13.8 × assets/fonts/OFL-*.txt, assets/icons/README.md:1-3. Adicionado §13.8.6.
- Itens P-014 ainda NÃO feitos (marcados "(planejado)" no doc 13): V-008 save atômico (save_manager.gd:21-25), export_presets.cfg, pre-commit D-189, aviso de licença/lista de assets D-188 (about_screen.gd:19).
- Arquivos do jogo modificados no working tree por outros agentes (git status): axis_rules.gd, main.gd, tokens.gd, swipe_card.gd etc. -> reverificar citações de main.gd/axis_rules.gd no fim.

## Fechamento (2026-10-20 ~22:55)

- Doc 13: 777 -> 971 linhas; 523 linhas do original idênticas (67%); 76 trechos alterados; lint 0; 122 citações `arquivo:linha` resolvem; exemplos JSON == primeiro item dos dados. Acrescentado após o início: `jogo/tools/` (commit 3106d04, DP-017) em §13.5.1 e §13.7.2 (linha da árvore + parágrafo "Fonte das cartas reais").
- Relatório 13.1: 220 linhas; 129 citações resolvem; lint 0; tabelas sem células soltas; sem HTML cru. Correções feitas na revisão do próprio relatório: `meters.json:51` (não `:3`) para `political_capital`; Captura é ≥ 95 no fim do mandato (não "final em 100"); relações = 10 regras de 7 medidores (as 8 linhas da tabela incluem o dobro da Consciência); RC-08 em `estado.md:151`; `final_screen.gd:4,91`; `14_UI_UX_DESIGN.md:184`; `validate-finals.md:10,17`; streak: `game_flow.gd:232,498-499`; P-3 cobre GDD §12.2 a §12.4 (`gdd/GDD.md:653-707`).
- Commits de outro agente que levaram o doc 13: 601168b (22:37) e ded652b (22:41). Eu NÃO fiz commit. Em 22:53 o working tree tinha: doc 13 (+4/-1, `tools/`), relatório 13.1 (novo), e do P-014 `save_manager.gd` + `test_core_save.gd` (V-008, não commitado).
- SE o V-008 for commitado: tirar "(planejado)" de doc 13 §13.3.5 (linha ~396), re-citar `save_manager.gd`, e ajustar a linha A-14 e a seção "Volatilidade" do relatório. Rodar /sync-tech de novo ao fim da etapa 5.
- Memória: nada a salvar além do que está no relatório final ao fio principal.
