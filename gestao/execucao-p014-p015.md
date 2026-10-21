# Diário da execução — P-014 e P-015

**Prompt:** `gestao/prompts/execucao-p014-p015.md` · **Branch:** `claude/p014-p015` (a partir do `main` em `1aed866`)
**Especificações:** `gestao/prompts/correcoes-p014.md` (P-014) · `gestao/prompts/criacao-cartas.md` (P-015)
**Decisões provisórias:** `gestao/decisoes-provisorias.md` (DP-nnn; o PO aprova ou reverte no fim)
**Início:** 2026-10-20

## Fases

| Fase | O que | Status | Evidência |
| :--- | :--- | :--- | :--- |
| 1 | P-014 etapa 2 — `/validate-cards` (opção ≤ 25 caracteres, `quem_fala`) | ✅ | `game_data.gd`, `test_data.gd`, `validate-cards.md`; DP-001; 18/18 testes |
| 2 | P-014 etapa 1 (GDDs e docs) + P-015 Onda 0 | ✅ | `4dc9c8e`, `ded652b`; `/sync-tech` (docs 13 e 13.1); DP-002 a DP-017 |
| 3 | P-014 etapas 3-5 (código) + ondas de cartas | ✅ | Etapas 3-5 ✅ (`4177ec1`, `601168b`, etapa 5 neste registro) |
| 4 | P-014 etapas 6-7 (testes e verificação); ondas continuam | ✅ | Etapas 6 e 7 ✅ (P-014 pronto para o fechamento junto com o P-015) |
| 5 | Ondas de cartas até o número-alvo (ECO a cada ~40 cartas) | 🟡 | Ondas 1-4 gravadas (57 de 340 + 5 da cena; DP-021 a DP-024) |
| 6 | P-015 migração para `jogo/data/` + simulação do ECO com o baralho real | ⏳ | — |
| 7 | Verificação final e entrega ao PO | ⏳ | — |

## Fila das ondas do P-015 (plano do fio principal; IDs pela DP-011 a DP-015)

Cada onda: GD (rascunho em `.claude/notas/execucao/onda-NN/`, kit em `kit-gd.md`) → fontes na web (subagente; 5 conferidas à mão) → PSI → gravação com `jogo/tools/cards_doc.py insert` e uma DP por onda. ECO a cada ~40 cartas.

| Onda | Cartas | Status |
| :--- | :--- | :--- |
| 1 | Influenciador INST-182..191 | ✅ gravada (DP-021) |
| 2 | Geopolítico INST-063..072 | ✅ gravada (DP-022) |
| 3 | Influenciador INST-192..200 | ✅ gravada (DP-023) |
| 4 | Geopolítico INST-073..080 | ✅ gravada (DP-024) |
| 5 | Congresso INST-007..016 | GD ✅; fontes 7/10 (parada) |
| 6 | Congresso INST-017..020 + Orçamento INST-023..028 | GD ✅; fontes 3/10 (parada) |
| 7 | Orçamento INST-029..038 | GD só começou (refazer) |
| 8 | Orçamento INST-039..040 + Currículo INST-043..050 | — |
| 9 | Currículo INST-051..060 | — |
| 10 | Prisional INST-083..092 | — |
| 11 | Prisional INST-093..100 + Emendas INST-102..103 | — |
| 12 | Emendas INST-104..113 | — |
| 13 | Emendas INST-114..120 + Bancadas INST-122..124 | — |
| 14 | Bancadas INST-125..134 | — |
| 15 | Bancadas INST-135..140 + Impeachment INST-141..144 | — |
| 16 | Impeachment INST-145..154 | — |
| 17 | Impeachment INST-155..160 + Judiciário INST-162..165 | — |
| 18 | Judiciário INST-166..175 | — |
| 19 | Judiciário INST-176..180 | — |
| 20-26 | Temáticas: THEM-002..010, 011..020, 021..030, 031..040, 041..050, 051..060, 061..070 (um tema por onda) | — |
| 27-33 | Atores: ATOR-002..011, 012..021, 022..031, 032..041, 042..051, 052..061, 062..070 | — |

## Ponto de parada (2026-10-21, 11:35) — para continuar

Parado a pedido do membro (limite de uso semanal). Tudo está commitado e no `origin/claude/p014-p015`.

**Feito**
- P-014 completo (etapas 1-7): 20/20 testes, mutação 100%, Web testada; fecha junto com o P-015.
- P-015: Ondas 0-4 gravadas nos docs 17 e 18 — 57 de 340 cartas + 5 da cena (Influenciador e Geopolítico completos), DP-011 a DP-024, `cards_doc.py check` com 0 erros.
- Ensaio da fase 6: `cards_doc.py export` exporta as 57 cartas, as 5 da cena e 62 Aprendizados, 0 de fora.

**Em andamento** (rascunhos em `.claude/notas/execucao/`, commitados com `git add -f` só para esta passagem; podem sair do índice depois da validação)
- Onda 5 (Congresso INST-007..016): GD ✅ (`onda-05/cartas.md`, `aprendizados.md`). Fontes 7/10 (`onda-05/fontes.md`: APR-007..013 verificados; faltam APR-014, 015 e 016; falta gerar o `aprendizados.json`). Alertas do pesquisador no próprio arquivo: APR-009 (taxa zerada em set/2026), APR-010 e 012 (temas vivos), conceito do APR-013 e eventos INST-010 B e INST-012 B, que não se sustentam como estão (reescrita proposta).
- Onda 6 (Congresso INST-017..020 + Orçamento INST-023..028): GD ✅; fontes 3/10 (APR-017..019).
- Onda 7 (Orçamento INST-029..038): o GD só abriu o arquivo; recomeçar.

**Como continuar (por onda)**
1. Fontes: subagente (Sonnet) continua o checklist do `onda-NN/fontes.md` e gera o `onda-NN/aprendizados.json` (formato do `cards_doc.py box`, com o campo `strength`).
2. Fio principal reabre 5 fontes (WebFetch).
3. PSI (Opus) grava `onda-NN/psi.md` com veredito e texto exato por carta (pode juntar 2 ondas).
4. Aplicar os ajustes: `python3 .claude/notas/execucao/ferramentas/wavefix.py .claude/notas/execucao/onda-NN <mudancas.json>` (formato no topo do script) e uma linha DP nova em `gestao/decisoes-provisorias.md` (próxima: DP-025).
5. `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py insert --cards .claude/notas/execucao/onda-NN/cartas.md --learning .claude/notas/execucao/onda-NN/aprendizados.json --status "provisório (DP-nnn)"`, depois `cards_doc.py check --style` (0 erros).
6. Commit, push e atualizar a fila acima. Novas ondas do GD: kit em `.claude/notas/execucao/kit-gd.md` (com o estado do baralho).

**Depois das ondas**
- Fase 6: exportar para `jogo/data/` (sai o baralho fictício); regenerar o campo `cards` do `actors.json` a partir do `actor_cards.json` (a numeração fictícia difere da DP-015: hoje ATOR-001 é o ataque do `ACT-001` nos dados e a exigência no doc); `test_data` lendo as contagens dos dados; `run_all.sh` numa cópia; simulação do ECO com o baralho real (`.claude/notas/execucao/ferramentas/sim.gd`; o END-015 deve aparecer).
- Fase 7: `gestao/entrega-p014-p015.md`, `/fechar-plano`, PR para o `main` sem merge e mensagem ao PO.

## Bloqueios para o PO

| # | Bloqueio | Por que não decidi | Onde |
| :--- | :--- | :--- | :--- |
| B-1 | `site/src/content/docs/sobre.md:20` diz que o jogo não usa políticos reais (D-005), contra a D-083 | Depende do parecer jurídico (RC-08) e de publicar o site, que fica com o PO | Achado do PSI (D-190) |

## Pendências para o PO (não bloqueiam)

- Revelação dos medidores: só os medidores sociais têm padrão "baixo" (achado do PSI); rever com o baralho real (RT-10).
- Calibração CAL-5: "taxar grandes fortunas: Sim" tira Caixa (`docs/15_FLUXO_DO_JOGO.md:79`), o que sugere que taxar os ricos esvazia o cofre (achado do PSI, fora do escopo).
- Classificação etária: `docs/16_MANUAL_DO_JOGADOR.md` §16.13 diz "Livre (recomendado para maiores de 12 anos)", que se contradiz; o PSI sugere 14+ e lembra que a classificação oficial vem do IARC.
- Descrição curta dos finais (relatório do `/sync-tech`, P-1): `endings.json` não tem o campo e a tela final mostra "[descrição curta do final — a definir]" em toda partida (`jogo/scripts/core/game_flow.gd:28, 459`). Alternativas: A) escrever as 28 com GD e PSI (recomendada pelo agente); B) tirar a descrição da tela e dos docs 14/14A; C) manter o marcador até o P-006. Fora do escopo do P-014; não decidi.
- D-055 (card-framework) segue aberta (relatório do `/sync-tech`, P-2): A) nova decisão "não adotado" (recomendada); B) manter como recomendação; C) migrar depois.
- `gdd/GDD.md` §12.2-12.4 ainda com chaves em PT (P-3): A) trocar por ponteiro ao doc 13 (recomendada); B) copiar o esquema EN; C) deixar.
- Bets proibidas em 2026: a MP 1.394/2026 (setembro) proibiu as bets no Brasil, com recurso no STF (Senado, sumário da MPV 1394). A carta aprovada INST-181 e as INST-193/194 da Onda 3 supõem bets legais. Provisório (DP-023): as caixas seguem com o fato de 2025 e os APR-193/194 são reconferidos quando a MP for votada ou caducar ou quando o STF decidir (texto pronto em `.claude/notas/execucao/onda-03/psi.md`); a INST-181 (aprovada antes) fica com o PO.
- Tela Sobre: os textos completos das licenças de terceiros do Godot (`Engine.get_license_info()`, ~77 mil caracteres) não aparecem; a tela lista componentes, licenças e copyrights (DP-019). Decidir se entram (tela, arquivo ao lado do build Web ou link).

## Registro

### 2026-10-20 — abertura
- Branch criada a partir do `main` (`1aed866`), que já tem o protótipo do P-005.
- Lidos: CLAUDE.md, `gestao/estado.md`, `.claude/rules/*.md`, os prompts de especificação e `gestao/validacao-2026-10-20.md`.
- **Processo:** os agentes GD, PSI e QA do projeto só leem e devolvem ≤ 400 palavras. Rascunhos longos (10 cartas por onda) vão para `.claude/notas/execucao/` por um subagente geral no papel do GD (modelo Opus), com retorno ≤ 400 palavras. A busca das fontes na web também vai para um subagente; o fio principal confere 5 fontes por onda.
- Próximo passo: fase 1.

### 2026-10-20 — fase 1 (P-014 etapa 2)
- `jogo/scripts/game_data.gd`: opção até 25 caracteres (`OPTION_TEXT_MAX`, D-177) e `speaker`/`quem_fala` obrigatório, com `ACT-xxx` existente (D-164).
- Dados: `speaker` nas 40 cartas fictícias e nas 5 da cena; opções da cena encurtadas (DP-001).
- Testes: casos negativos em `jogo/tests/test_data.gd` (26 caracteres com acento, sem quem fala, ator inexistente); `test_core_cards_draw.gd` ajustado. `run_all.sh` 18/18 OK numa cópia com `XDG_DATA_HOME` próprio.
- `.claude/commands/validate-cards.md`: fonte `jogo/data/*.json` e as duas regras novas.
- A Onda 1 do P-015 está destravada.
- Próximo passo: fase 2 (GDDs e docs + Onda 0).

### 2026-10-20 — fase 2 (em andamento) e começo da fase 3
- P-014 etapa 1: GDDs 01, 02, 03, 05, 08, GDD §5.3/§10.1/§13.1/§14.3, docs 04, 05, 10 e 16 (avisos e FAQ do salvamento), README do jogo e `qa.md` (DP-002 a DP-008). Faltam: texto "sem padrão" (D-175, GD → PSI) e `/sync-tech` do doc 13.
- D-190: lista do PSI (opção B) aplicada no jogo, no GDD e no manual (DP-008). Na tela de título a 36 px os botões passam da tela (a tela não rola): corrigir na etapa 4 com a D-186.
- P-014 etapa 3 (adiantada): D-174 (`EndingRules.implies`), D-179 (contagem zera no Ano 2), D-182 (evento ao epílogo na condenação), V-035 (Captura lê `capture_at_or_above`), V-015 (Aprendizado sem link verificado sai dos dados e a carta sai do baralho; as 45 fictícias levam `"fictitious": true`), limiares da revelação no `balance.json`. Testes novos em `test_core_endings`, `test_core_impeachment` e `test_data`; 18/18 OK.
- Conferidas 5 citações do PSI (`content_warnings.gd:9`, `docs/16` §16.13 e FAQ, `site/.../sobre.md:20`, `gdd/GDD.md` §14.3): 5/5 ✅. A citação de racismo em `endings.json:360` é a fala contra indígenas; ajustei o texto do GDD.

### 2026-10-20 — D-175 e P-014 etapa 4 (interface)
- D-175: GD propôs o 6º texto e a revisão dos 5; o PSI reprovou a 1ª frase do GD e propôs "Nenhum padrão resume seu governo. Os números contam o resto." e "deixou … em segundo plano" no lugar de "negligenciou" (DP-009). Aplicado no jogo, no GDD §9.2, no GDD 04 e nos docs 04, 05 e 15; testes de fronteira (39/40) e de limite lido do `balance.json`.
- Etapa 4: rótulo do arraste na parte visível da carta, que para com ≥ 60% na tela (D-177); 36 px com títulos menores, quebra só em espaços e fonte que encolhe se uma palavra não couber (D-186); dica do toque com quebra (V-022); link da fonte com alvo de 48 px (V-024); calibração sem a caixa do HUD (D-183); ida ao final com camada preta e pausa de 0,8 s, aviso de Captura que espera toque (D-184); Voltar do Android no título sai (D-185); área segura no Web em celular (V-026); modal variante A sem "a validar" (D-187). Números novos em DP-010.
- Achados e corrigidos na conferência por capturas: a tela de título a 36 px escondia "Sobre" (agora rola e o título cabe numa linha); o rodapé a 36 px cortava o "n/7" porque o Label não crescia (V-048: `update_minimum_size`).
- Pendência registrada (PSI): só os medidores sociais têm padrão "baixo"; um governo de "ordem" que derruba Integridade e Consciência recebe só o texto do P2. Recomendação do PSI: manter na D-175 e rever com o baralho real (RT-10).
- `run_all.sh` 18/18 OK.

### 2026-10-20 — `/sync-tech`, P-014 etapa 5 e Ondas 1-2 (rascunho)
- `/sync-tech` (agente): `docs/13_ARQUITETURA_TECNICA.md` com chaves em EN (D-136) e árvore de `jogo/`; relatório `docs/13.1_RELATORIO_SINCRONIZACAO.md` (48 divergências: 41 corrigidas, 6 planejadas, 1 aberta). Conferidas 5 citações do relatório: `game_flow.gd:28, 459` (marcador da descrição do final), `:155-165` (eventos na abertura do turno), `:306-315` e `:498-499` (gatilho alternativo e zerar no Ano 2), `game_data.gd:58, 387-389` (raiz array), 9 arquivos em `jogo/data/`: 5/5 ✅. Pendências P-1 a P-3 do relatório acima.
- Etapa 5:
  - Save atômico (V-008): grava em `save.json.tmp` e renomeia; `.tmp` sozinho conta como save; `delete()` apaga os dois. Teste `_atomic_write` em `test_core_save.gd`.
  - Tela Sobre (D-188): lista real dos assets (sem "Kenney"), aviso MIT do Godot por `Engine.get_license_text()` e componentes de terceiros por `Engine.get_copyright_info()`, dobrados; o teste confere que todo arquivo de `jogo/assets/` está na lista (DP-019).
  - Preset Web (D-188): `jogo/export_presets.cfg` sem threads, sem `scenes/dev`, `tests` e `tools`, com os avisos OFL (`assets/fonts/*.txt`), que a tela Sobre lê como texto e ficavam fora do pacote.
  - Teste da Web: só os modelos Web oficiais do 4.7.2 (baixados por intervalo do `.tpz`, no scratchpad) → exportação → Chromium headless (Playwright). O jogo abre, a tela Sobre mostra os avisos OFL e do Godot. Fechar a aba depois de responder a 1ª pergunta da calibração: aos 300, 450, 600 e 1.000 ms a partida volta em 2/6; aos 0 e 150 ms volta em 1/6 (fica o salvamento anterior, sem corromper). Scripts no scratchpad (`webtest/close_tab.py`).
  - Pre-commit do MCP (D-189): `.githooks/pre-commit` + hook `PreToolUse` do Claude Code (DP-018). Testado num clone no scratchpad: commit com o autoload barrado; arquivo do MCP solto barrado; limpo passa. `git config core.hooksPath .githooks` ativado neste clone.
  - V-046: comentários sem `.claude/notas/p005/*` (`main.gd`, `app_screen.gd`, `game_screen.gd`, `game.gd`, `test_final_screen.gd`).
  - `run_all.sh` 18/18 OK numa cópia com `XDG_DATA_HOME` próprio.
- Ondas 1 (Influenciador, INST-182..191) e 2 (Geopolítico, INST-063..072): rascunhos do GD prontos em `.claude/notas/execucao/onda-01/` e `onda-02/`, `cards_doc.py check` com 0 erros. Conferidas 5 citações da Onda 2 (`docs/12:226, 247, 255`, `docs/03:436`, `docs/11:484`): 5/5 ✅. Próximo: fontes na web e PSI.

### 2026-10-20 — P-014 etapa 6 (testes) e começo da etapa 7
- Testes novos: `test_table_endings.gd` (28 finais: dados = tabela do doc 04 §04.08 e do GDD 02; fronteira de cada condição; cada final vence no próprio limite, inclusive END-015 sobre END-012 pela D-174; D-180) e `test_table_balance.gd` (relações, limiares, bônus, dobro, multiplicadores, emergência, carta ligada, aviso de Captura, níveis dos atores, revelação; 3.000 estados sem marcador, D-175). `test_e2e.gd` calcula o final esperado jogando a mesma política só pelo `GameFlow` (V-033). `test_ui_kit.gd`: rótulo do arraste dentro da tela e da parte visível de 16 a 36 px, nos limites 25% e 40% (D-177). `test_game_screen.gd`: retomada num aviso de evento e na calibração pelo "Continuar" do título; medidor em 0 pela interface até a tela final. D-179 e D-182 já tinham teste (`test_core_impeachment.gd`).
- Mutação de 1 unidade em cada número de `endings.json` e `balance.json` (script no scratchpad, `qa/mutate.py`, testes rápidos): antes, 5/115 e 36/79 mortas; agora, 115/115 e 79/79 (100%). Só com os testes de comportamento (sem conferir dados = tabela): 102/115 e 77/79; as 15 que sobram não mudam o jogo (o "= 0" das 7 Catástrofes, que vem do `meters.json`; os 6 valores de Captura, que o carregador troca pelo do `balance.json`; o máximo 100 do nível Aliado).
- Simulação headless de 2.116 partidas pelo `GameFlow` (23 perfis: aleatório, sempre A, sempre B, cuidadoso, afundar o Capital, populista, populista com piso, máximo e mínimo de cada medidor; script no scratchpad, `sim/sim.gd`): medidores sempre em 0-100; mesma semente → mesma partida; salvar → JSON → restaurar no meio dá o mesmo resultado; 8.202 eventos, todos no ano-alvo; nenhuma partida travada. Com o baralho fictício, 83% terminam em Catástrofe, 16% em Impeachment e 1% no fim do mandato (RT-10). **END-015 não aparece** com o baralho fictício: quase nenhuma partida chega ao fim do Ano 4; a D-174 está provada no teste de tabela (END-015 vence no próprio limite). Refazer com o baralho real (P-015, fase 6). Marcadores na tela final: nenhum "[a definir" na revelação (D-175 ✅); a descrição curta do final mostra "[descrição curta do final — a definir]" em todas as partidas (pendência P-1 acima); os epílogos mostram "[Fictício]" (dados fictícios).
- `run_all.sh` 20/20 OK.

### 2026-10-20 — P-014 etapa 7 (verificação ponta a ponta)
- Capturas com xvfb (sem escala 0,75: a tela virtual cabe o tamanho real), numa cópia, com as opções novas `--text=N` e `--hc` dos `shot_*.gd`: 390×844 (casca, jogo, final, cena; jogo a 16, 20 px e alto contraste; casca a 16 px), 360×800 (casca, jogo, final, cena) e PC 1500×844 (casca, final, cena). 15 rodadas, todas com saída 0; folhas de contato no scratchpad (`sheet-*.png`).
- Achado nas capturas e corrigido: a 20 px o rótulo do arraste encostava na borda da tela. Causa: a inclinação de 5° no limite (pivô no centro de baixo) leva o topo da carta ~25 px para o lado, o recuo inteiro; o teste de 16-36 px rodava com "Reduzir movimento" (sem inclinação). O rótulo agora desconta a inclinação (`swipe_card.gd` `_layout_option`); teste novo com a inclinação ligada, que falhava antes (`test_ui_kit.gd`).
- Sem regressão nas outras capturas: coluna de 430 no PC (D-171), título e Sobre a 16 px, rodapé a 36 px, cena e tela final. Os marcadores "[… — a definir]" que aparecem são textos ainda não escritos (contagem da validação: 125) e a descrição curta do final (P-1).
- Exportação Web e fechar a aba: ver o registro da etapa 5. Simulação e mutação: registro da etapa 6.
- `run_all.sh` 20/20 OK depois da correção.

### 2026-10-21 — Ondas 1-4 (rascunhos) e checagem do baralho com 57 cartas
- Rascunhos do GD prontos nas Ondas 1-4 (37 cartas; Geopolítico e Influenciador completos), todos com `cards_doc.py check` sem erros. Conferências: Onda 2 5/5, Onda 3 5/5 (`docs/12:101, 290, 383, 575, 577`; `cards_doc.py:44`; 0 erros), Onda 4 5/5 (`docs/17:430, 457`; `docs/11:492`; 0 erros; 5 cartas de Ano 2-4).
- Fontes da Onda 1: 10/10 com trecho literal (8 primárias, 2 de imprensa pública). Reabri 5 links (APR-182, 185, 187, 189, 191): 5/5 conferem; dois textos ajustados para ficarem iguais à fonte (APR-182, APR-187).
- Checagem do baralho (papel do ECO, feita por script: `cards_doc.py check --wave-report` sobre o doc 17 + Ondas 1-4 numa cópia): eventos em 15% (piso), eixos todos ≥ 20% (Diplomacia saiu de 10% para 43%), as 7 cores com saldo negativo, técnicas 3-4 cada; carta ligada fraca em Dignidade (2 opções positivas com Ano 2-4) e Segurança (5). Orientação nova no kit do GD. A simulação do ECO fica para a migração (fase 6), com o baralho real.
- Novo no `cards_doc.py`: `check --style` (frase > 20 palavras, gerúndio, advérbio, futuro; doc 10 §10.03.2).

### 2026-10-21 — Ondas 1 e 2 gravadas nos docs 17 e 18
- Fontes da Onda 2: 10/10 com trecho literal; reabri 5 (APR-064, 065, 068, 071, 072): 5/5 conferem.
- PSI das Ondas 1 e 2: 9 aprovar, 11 ajustar, 0 reprovar (`.claude/notas/execucao/onda-01/psi.md`, `onda-02/psi.md`). Ajustes aplicados com textos exatos do PSI; pontos que ficavam com o PO decididos de forma provisória (DP-021, DP-022). QA: títulos do JSON iguais aos das cartas, ponto final nos eventos da Onda 2, "Sinal:" no APR-191, fonte de imprensa marcada nas caixas APR-184, 191 e 072.
- Gravação com `cards_doc.py insert` (cartas no modo, em ordem; caixas no doc 18; rascunhos APR-063..072 retirados da §18.14; contagens refeitas): doc 17 com 40 de 340 + 5 da cena, `cards_doc.py check` com 0 erros.
- Doc 03 §03.13: a citação sobre desdolarização era de Gao Bai (Tricontinental, 2024), não do IPEA (achado do pesquisador; conferido no link). Atribuição corrigida (D-190).

### 2026-10-21 — pausa pelo limite de uso e retomada
- 01:50: o limite de uso da conta parou o GD da Onda 6 e as fontes da Onda 5 no meio (RP-09); o PSI das Ondas 3-4 não chegou a abrir. As notas incrementais guardaram o progresso. Retomado às 10:55: os dois agentes continuam do ponto em que pararam (SendMessage) e o PSI das Ondas 3-4 começou.
- Fontes da Onda 3 (9/9, 2 de imprensa) e da Onda 4 (8/8, todas primárias): 5 reabertas em cada, 10/10 conferem. Ajustes de texto para ficar igual à fonte: APR-192 (a norma revogada era a das transferências do Pix) e APR-074 ("anunciaram a intenção de", como a fonte).

### 2026-10-21 — Ondas 3 e 4 gravadas nos docs 17 e 18
- PSI das Ondas 3 e 4: 6 aprovar, 11 ajustar, 0 reprovar (`.claude/notas/execucao/onda-03/psi.md`, `onda-04/psi.md`). Ajustes aplicados com os textos exatos do PSI; pontos que ficavam com o PO decididos de forma provisória (DP-023, DP-024). Os mais sensíveis: INST-193 no masculino (RC-08), INST-195 e INST-200 com "É falso", INST-073 sem a China (muda o tema do doc 12), INST-080 com a cor B Laranja.
- QA: APR-197 com a base "de 16 anos ou mais"; INST-080 A "Propor a suspensão" (a suspensão no Mercosul exige consenso, Protocolo de Ushuaia, art. 6); evento extra na INST-196 B (eventos do baralho em 16%).
- Gravação com `cards_doc.py insert`: doc 17 com 57 de 340 + 5 da cena; rascunhos APR-073..080 retirados da §18.14; `cards_doc.py check` com 0 erros (avisos de estilo só em cartas aprovadas antes: INST-062, INST-082, ATOR-001).
- Para as próximas cartas do `ACT-021` (proposta do GD da Onda 4): "comprar terras" e "base militar" já viraram INST-073, 074 e 077; a exigência e o ataque do ator usam outros temas.
- Pendente para o PO: a lista de cartas planejadas do doc 12 (MOD-010 e Geopolítico) não bate mais com as cartas escritas; regravar a lista quando o PO aprovar as ondas.
