# Prompt — Validação ponta a ponta do protótipo (P-005)

**Para quem:** sessão do Claude Code (Opus 5.5, esforço alto) aberta na raiz do repositório, na branch que contém `jogo/`.
**Como usar:** cole o bloco abaixo inteiro. Ele só gera relatório; não altera código, dados nem docs.
**Citações:** `arquivo:linha` no código e nos dados; § nos docs e GDDs (as linhas mudam).
**Decisões:** D-001 a D-173 em `gestao/decisoes.md`. Atualizado em 2026-10-20.
**Insumos desta versão:** `jogo/README.md`, `gdd/sistemas/00_INDICE.md`, `docs/14A_INVENTARIO_DE_TELAS.md`, `gestao/plano-de-acao.md` (P-005).

---

```
# Papel
Você é o líder de QA e auditor técnico do "O Planalto", um jogo de cartas estilo Reigns em Godot 4.7.2 (GL Compatibility). A implementação inicial (P-005, etapas 3 a 9) está em `jogo/`. Sua missão é uma validação PONTA A PONTA: jogar, testar, ler o código e comparar tudo com o GDD e as decisões do PO. Você NÃO corrige nada. Você entrega um relatório que responde, com evidência:

1. O que FALTA desenvolver (existe no GDD/docs, não existe no jogo).
2. O que precisa ser MODIFICADO (bug, regra errada, UX quebrada, código frágil).
3. O que DIVERGE do GDD (implementado diferente do que está escrito).
4. O que está CONFORME (para o PO saber o que já pode ser dado como fechado).
5. Afins: docs desatualizados, testes ausentes, riscos técnicos, pontos que dependem do PO.

# Regras do projeto (obrigatórias)
- Leia `CLAUDE.md`, `gestao/estado.md` e `.claude/rules/*.md` antes de começar.
- Só o PO decide. Você propõe; toda decisão vai como pendência com 2-4 alternativas, prós, contras e recomendação.
- Nunca invente. Toda afirmação com `arquivo:linha`, § do doc ou `[não verificado]`.
- Nenhuma alteração em `jogo/`, `docs/`, `gdd/`, `gestao/` ou `site/`. Única pasta de escrita: `.claude/notas/validacao-e2e/`. Ao final, `git status` deve mostrar só essa pasta.
- Isolamento (`.claude/rules/isolamento.md`): rode o jogo e os testes SÓ numa cópia no scratchpad. Scripts temporários (simulação, capturas extras) ficam só na cópia, nunca em `jogo/`.
- Dados do protótipo são fictícios por decisão (D-135, D-139). Não aponte "cartas fictícias" como divergência; aponte só o que falta para trocar pelo conteúdo real.
- Nenhum número de dado real inventado (D-091). Não sugira textos novos de carta; se faltar texto, marque "[a definir]".
- Economia de tokens: bullets e tabelas; nada de prosa longa.

# Skills e agentes
- GodotPrompter: antes de cada frente técnica, carregue a skill correspondente: `godot-prompter:godot-testing`, `godot-code-review`, `godot-debugging`, `gdscript-patterns`, `state-machine`, `save-load`, `godot-ui`, `responsive-ui`, `hud-system`, `input-handling`, `tween-animation`, `localization`, `mobile-development`, `export-pipeline`, `godot-optimization`, `audio-system`.
- Subagentes (`.claude/rules/subagentes.md`): no máximo 3 em paralelo, em ondas; retorno ≤ 400 palavras com `arquivo:linha`; notas incrementais em `.claude/notas/validacao-e2e/` desde o início. Para localizar código e revisar trechos, prefira `cavecrew-investigator` e `cavecrew-reviewer` se existirem; senão, `Explore` e `godot-prompter:godot-code-reviewer`.
- Ondas sugeridas:
  - Onda 1: `qa` (Fase 1 e Fase 2), `gd` (Fase 3, sistemas 01-05), `gd` (Fase 3, sistemas 06-10).
  - Onda 2: `ux` (Fase 5), `godot-prompter:godot-code-reviewer` (Fase 6), `eco` (Fase 4, simulação e cobertura de finais).
  - Onda 3: `psi` (textos da tela, Fase 5.4); depois o fio principal consolida (Fase 8).
- O fio principal confere 5 citações de cada subagente por amostragem (`.claude/rules/verificacao.md`) antes de usar o resultado.

# Fontes de verdade (ordem de precedência)
1. `gestao/decisoes.md` — a decisão mais recente vence (ex.: D-122 revisa D-096; D-172 revisa a paleta do doc 14).
2. `gdd/sistemas/01..10_*.md` — regras (§3), fórmulas (§4), casos-limite (§5), parâmetros (§7), critérios de aceite (§8).
3. `gdd/GDD.md` — visão, pilares, core loop, UI, áudio, acessibilidade, balanceamento (§13).
4. `docs/14_UI_UX_DESIGN.md`, `docs/14A_INVENTARIO_DE_TELAS.md` (16 telas, 64 estados, 21 componentes, 8 fluxos), `docs/15_FLUXO_DO_JOGO.md`, `docs/16_MANUAL_DO_JOGADOR.md` Parte B (tutorial).
5. `docs/13_ARQUITETURA_TECNICA.md` — estrutura de dados (§13.3), formato (§13.5), pastas (§13.7).
6. `jogo/README.md` — o que a implementação declara. Trate como AFIRMAÇÃO A CONFERIR, não como verdade.
Se duas fontes divergirem entre si, registre na seção "Conflitos entre docs" sem escolher lado. Se o `main` estiver à frente desta branch nos docs, compare com `git show main:<caminho>` (`.claude/rules/leitura.md`) e registre.

# Fase 0 — Preparação e linha de base
1. `godot --version` (esperado 4.7.2, D-130). Registre a saída.
2. Copie `jogo/` para `<scratchpad>/pt`. Rode `GODOT=$(which godot) jogo/tests/run_all.sh <scratchpad>/pt`. Registre OK/FAIL de cada um dos 18 testes e o tempo total.
3. Rode o projeto headless com `--quit-after` suficiente para abrir o título e capture TODOS os avisos e erros do log (WARNING, SCRIPT ERROR, recursos órfãos, UID ausente).
4. MCP Godot (D-131, D-132): confira se as ferramentas `mcp__godot__*` respondem (`get_godot_version`, `get_project_info`). Se responderem, use-as na Fase 4 para rodar e clicar no jogo. Se não, use `xvfb-run` com os `tests/shot_*.gd` (modo de usar no cabeçalho de cada arquivo).
5. Inventário: conte arquivos `.gd`, cenas, testes, linhas; liste os `[Fictício]`, `[a definir]`, `TODO`, `FIXME`, `push_warning` e constantes "a validar" (grep em `jogo/`).
Nota: `00-baseline.md`.

# Fase 1 — Dados (`jogo/data/*.json`)
Para cada arquivo, confira contra `docs/13` §13.3/§13.5 e o GDD de sistema dono:
- Contagens: 8 medidores, 24 atores (D-085), 10 modos, 28 finais (D-096, D-122), 6 perguntas de calibração (docs/15 §15.04), cena de 5 fases (gdd 03 §3).
- Valores iniciais e soma 375 (D-141, GDD §13.1). Parâmetros de `balance.json` × gdd 01 §7 e demais §7: cada número tem origem citável? Número sem origem = divergência.
- Integridade referencial: todo id citado existe (ator, modo, medidor, evento encadeado, Aprendizado, final). Nenhum órfão; nenhum id duplicado.
- Esquema da carta e da opção × gdd 05 §3 e docs/13 §13.3.1-13.3.2: campos obrigatórios, cor partidária por opção (D-092), vetor de eixo (gdd 04), `quem_fala` (D-164), efeitos em atores (gdd 07), gatilho de evento (gdd 08, D-109), marca de desinformação (gdd 09).
- Chaves em EN, texto ao jogador em PT-BR (D-136).
- Dados reais (medidores, atores, finais, calibração) batem com a fonte (docs 11, 12, 15, gdd 02)? Diferença de texto ou número = divergência.
Nota: `01-dados.md`.

# Fase 2 — Testes existentes
- Leia cada `jogo/tests/test_*.gd`: o que cobre de verdade? Asserções fracas (só "não quebrou") contam como lacuna.
- Mapeie cada critério de aceite (§8 de cada GDD de sistema) para o teste que o cobre, ou "sem teste".
- O `test_e2e.gd` realmente compara o final da UI com o da API (README "Testes")? Confira.
Nota: `02-testes.md`.

# Fase 3 — Rastreabilidade GDD × código (núcleo da auditoria)
Para CADA um dos 10 sistemas (`gdd/sistemas/00_INDICE.md`), monte uma tabela com uma linha por regra (§3), fórmula (§4), caso-limite (§5), parâmetro (§7) e critério de aceite (§8):

| Item do GDD (§) | Onde está no código (`arquivo:linha`) | Teste | Status | Evidência / observação |

Status: ✅ conforme · ⚠️ parcial · ❌ ausente · ≠ divergente · ❓ não verificável.

Pontos de atenção por sistema (confira no GDD, não assuma):
- 01 Medidores (`meter_rules.gd`): ordem de aplicação do efeito (§3.3) e do fechamento do turno (§3.4), multiplicador por fase, recuperação, limites 0-100, medidor em 0 encerra na hora (D-089), relações entre medidores.
- 02 Finais (`ending_rules.gd`): os 28 finais, ordem de prioridade, desempate, epílogo com eventos (gdd 08), Renúncia (D-122). Cada final é alcançável? (ver Fase 4.3).
- 03 Impeachment (`impeachment_rules.gd`, `impeachment_screen.gd`): Capital Político em 0 abre a cena (D-095), só a partir do Ano 2, gatilho alternativo, 5 fases, placares (Câmara 513, Senado — D-168), absolvição × condenação e o final de condenação.
- 04 Eixo (`axis_rules.gd`): 4 eixos, pontos vindos da opção (D-084), calibração, revelação só no final, limiares de revelação (GDD §9.2; README cita > 60 e < 40).
- 05 Cartas (`card_rules.gd`, `swipe_card.gd`): opções A/B, lado sorteado (D-099), cor por opção e saldo por cor, texto da opção em 1 linha (§3.3).
- 06 Sorteio (`draw_rules.gd`): obrigatórias, prioridade narrativa, 7 cartas por ano, sem repetição indevida, comportamento com baralho pequeno (40 cartas) × baralho real (340).
- 07 Atores (`actor_rules.gd`): níveis, atualização, consequências, 24 atores.
- 08 Eventos (`event_rules.gd`): só das opções (D-109), atraso de 1-2 turnos, aviso (T-05), epílogo.
- 09 Desinformação (`disinfo_rules.gd`): Modo Influenciador, inoculação, aviso de Captura (README: 700 ms).
- 10 Estado da partida (`game_flow.gd`, `run_state.gd`, `save_manager.gd`): máquina de estados completa, transições proibidas, fim imediato, sessão, salvamento a cada passo, retomada em modo leitura sem repetir efeito.
Notas: `03-sistemas-01-05.md`, `03-sistemas-06-10.md`.

# Fase 4 — Jogar de ponta a ponta
## 4.1 Roteiros pela interface (MCP ou xvfb + `shot_*.gd`), com captura de cada tela
Execute e registre o que acontece em cada passo, com captura e log de erros:
1. 1ª abertura: título → avisos de conteúdo → tutorial (só na 1ª vez; textos × docs/16 Parte B) → calibração (6 perguntas, borda só com filete branco, D-166) → Ano 1.
2. Partida completa até o fim dos 4 anos sem impeachment.
3. Partida que zera um medidor no meio do ano (fim imediato, D-089).
4. Partida que zera o Capital Político no Ano 1 (NÃO deve abrir impeachment) e no Ano 2+ (deve abrir).
5. Cena de impeachment com absolvição e com condenação.
6. Evento encadeado: escolha que agenda evento → aviso 1-2 turnos depois → aparece no epílogo.
7. Carta de desinformação e aviso de Captura.
8. Fechar o app em cada estado (carta, opção revelada, consequência, Aprendizado, aviso de evento, cartão de ano, cena, final) e reabrir: "Continuar" retoma certo, sem repetir efeitos (gdd 10).
9. Pausa, Configurações (texto 16/18/20/24 e 36 de teste — D-165, D-169; reduzir movimento; alto contraste; limite do arraste 25-40% — D-158), Sobre (créditos OFL — D-140), Esc em cada contexto (D-167), "Abandonar mandato" com confirmação → final Renúncia completo (D-122).
10. Só teclado do começo ao fim; só toque em 2 passos (D-145, D-157); arraste com flick (D-153); dica do toque (D-163).
11. Resoluções: 360×800, 390×844, 430×932 e janela de PC larga (coluna ≤ 430 px, D-170, D-171). Nada cortado, texto da opção nunca sai da tela.

## 4.2 Invariantes a checar em TODAS as capturas
- Nenhuma palavra ou seta de lado ("esquerda", "direita", "◀", "▶") (D-084).
- Nenhum número de medidor antes da tela final; nenhuma pista de efeito durante o arraste (docs/14 §14.03, §14.05).
- Sem meses e sem reais no HUD e no rodapé (docs/14 §14.02).
- Verde/vermelho só como cor de partido, só na borda da carta; secundária, alerta e destaque neutras (D-156, D-172).
- Retratos em silhueta + nome (D-142); ícones CC0 (D-140).
- Foco visível com teclado; nomes acessíveis para leitor de tela.

## 4.3 Simulação em massa (só na cópia do scratchpad)
Escreva um script headless que joga N partidas (ex.: 2.000) pela API do autoload `Game`, com perfis: sempre A, sempre B, aleatório com seed, "maximiza um medidor", "minimiza Capital Político". Reporte:
- Distribuição dos finais; quais dos 28 NUNCA saem (com 40 cartas fictícias, separe "inalcançável pela regra" de "inalcançável por falta de carta").
- Taxa de impeachment, de fim imediato e de partidas completas; duração média em cartas.
- Erros, asserts, estados impossíveis, medidor fora de 0-100.
Nota: `04-partidas.md` (capturas em `.claude/notas/validacao-e2e/capturas/`).

# Fase 5 — UI/UX contra o inventário 14A
- Checklist do `docs/14A`: para cada uma das 16 telas (T-01..T-16), 64 estados, 21 componentes (§14A.03), 8 fluxos (§14A.04), animações (§14A.05) e tokens (§14A.06): existe? conforme? Tabela com status e `arquivo:linha` da cena/script.
- Tempos e durações × docs/15 §15.02.1 e §14A.05; "reduzir movimento" remove o quê?
- Tabela "A validar com o PO" do `jogo/README.md`: para cada linha, confirme no código o valor declarado e se há decisão D-xxx que já resolve. Sem decisão = pendência do PO.
- 5.4 (onda 3, `psi`): todos os textos exibidos ao jogador (tutorial, avisos, finais, epílogos, Sobre) × `docs/10_GUIA_DE_ESTILO_E_TOM.md`. Só aponte; não reescreva.
Nota: `05-ui-ux.md`.

# Fase 6 — Qualidade técnica (skill `godot-code-review`)
- Arquitetura: `Game` é a única API das telas? Regras puras em `scripts/core/` sem dependência de UI? Sinais × chamadas diretas; acoplamento entre telas; código morto (ex.: `placeholder.tscn`/`placeholder_screen.gd` ainda é usado?).
- GDScript: tipagem estática, `@onready`, `await` seguro (nó liberado no meio), tweens órfãos, `queue_free`, vazamento de nós.
- Salvamento: arquivo corrompido, versão do save, gravação atômica, `user://` no Web/Android.
- Entrada: toque × mouse × teclado sem conflito; `quit_on_go_back=false` e botão Voltar do Android.
- Desempenho em celular de entrada (GL Compatibility): shaders (`hatch.gdshader`, `tutorial_dim.gdshader`), redesenhos do radar, quantidade de nós.
- Localização: textos fixos no código × `tr()` (GDD §14.1); está pronto para tradução ou não?
- Exportação: `export_presets.cfg` existe? `scenes/dev/gallery.tscn` e `tests/` ficam fora do build? D-133 prevê autoload do MCP em `tools/mcp/` só em debug — existe? (`jogo/project.godot` [autoload]).
Nota: `06-tecnico.md`.

# Fase 7 — O que falta para a versão 1.0 (fora do protótipo, mas no GDD/docs)
Liste, com a fonte:
- Conteúdo: 340 cartas (doc 17) e Aprendizados (doc 18); textos `[a definir]`; ícones e retratos finais (TA); cores das faixas (D-162).
- Áudio (GDD §11.4), exportação Web/Android/PC e teste em aparelho (área segura, vibração, leitor de tela), publicação (P-007).
- Tudo o que a Fase 3 e a Fase 5 marcaram ❌.
- Docs vivos desatualizados: `gestao/plano-de-acao.md` (P-005 etapas 3-9), `gestao/estado.md`, `jogo/README.md` (branch citada), `docs/13` e GDD §12 (D-136), soma 375 (D-141).
Nota: `07-falta.md`.

# Fase 8 — Consolidação
Arquivo final: `.claude/notas/validacao-e2e/relatorio.md`, nesta ordem:
1. Resumo executivo (≤ 10 linhas): % de itens do GDD conformes, nº de bugs por severidade, veredito (pronto para playtest P-006? sim/não e por quê).
2. Linha de base (Fase 0).
3. Matriz de rastreabilidade resumida por sistema (✅/⚠️/❌/≠/❓ em números) com link para as notas.
4. Bugs e modificações necessárias — tabela: ID (V-001…), severidade, onde (`arquivo:linha`), passos para reproduzir, esperado (fonte §), obtido, sugestão.
   - 🔴 Bloqueante: quebra a partida, perde save, regra central errada, viola D-084/§14.03.
   - 🟠 Alta: regra do GDD divergente com efeito no jogo, acessibilidade quebrada.
   - 🟡 Média: UX, tempos, parâmetros, código frágil.
   - 🔵 Baixa: estilo, limpeza, docs.
5. Divergências do GDD — tabela: regra (fonte §), o que o código faz (`arquivo:linha`), impacto, recomendação: "corrigir o código" / "atualizar o GDD" / "decisão do PO".
6. O que falta desenvolver — backlog priorizado (P0-P3) com esforço (P/M/G) e dependências.
7. Lacunas de teste (critério de aceite sem teste).
8. Conflitos entre docs.
9. Decisões pendentes do PO — cada uma com 2-4 alternativas, prós, contras e recomendação.
10. Riscos novos (formato da tabela de riscos de `gestao/estado.md`).
11. Amostragem de verificação: 5 citações conferidas, com resultado.

# Critérios de aceite deste trabalho
- Os 10 sistemas e as 16 telas do 14A têm tabela completa; nenhum item sem status.
- Todo bug tem passos para reproduzir e fonte do esperado.
- Toda divergência cita o § do GDD ou a D-xxx e o `arquivo:linha` do código.
- Os 18 testes foram rodados e o resultado está registrado.
- Nenhuma alteração fora de `.claude/notas/validacao-e2e/` (`git status` no fim).

# Resposta final no chat (formato do PO)
Fase: P-005 — validação ponta a ponta
Insumos: [fontes e comandos usados]
Decisões pendentes (≤5, as mais importantes; o resto está no relatório):
  - [Decisão] — [A / B / C] (recomendação: X)
Próximo passo: [o que fazer em seguida]
Depois: link para `relatorio.md` e os totais (bugs por severidade, % conforme, finais alcançáveis).
```
