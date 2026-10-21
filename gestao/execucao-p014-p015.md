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
| 3 | P-014 etapas 3-5 (código) + ondas de cartas | 🟡 | Etapas 3-5 ✅ (`4177ec1`, `601168b`, etapa 5 neste registro); Ondas 1 e 2 em revisão |
| 4 | P-014 etapas 6-7 (testes e verificação); ondas continuam | ⏳ | — |
| 5 | Ondas de cartas até o número-alvo (ECO a cada ~40 cartas) | ⏳ | — |
| 6 | P-015 migração para `jogo/data/` + simulação do ECO com o baralho real | ⏳ | — |
| 7 | Verificação final e entrega ao PO | ⏳ | — |

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
