# Relatório — Validação ponta a ponta do protótipo (P-005)

> **Cópia versionada** do relatório da validação ponta a ponta do protótipo (2026-10-20). As notas de apoio citadas abaixo (`00-baseline`, `03-sistemas-*`, `04-partidas`, `04-simulacao`, `05-ui-ux`, `06-tecnico`, etc.) ficam em `.claude/notas/validacao-e2e/` na máquina do PO (pasta ignorada pelo git). Decisões tomadas a partir deste relatório: D-174 a D-190 (`gestao/decisoes.md`). Planos: P-014 (correções) e P-015 (cartas) em `gestao/plano-de-acao.md`.


**Data:** 2026-10-20 · **Branch:** `claude/game-end-to-end-validation-8f501a` = `claude/p005-prototipo` (`fb8fce3`) · **Prompt:** `gestao/prompts/validacao-ponta-a-ponta.md`
**Notas:** `00-baseline` · `01-dados` · `02-testes` · `03-sistemas-01-05` · `03-sistemas-06-10` · `04-partidas` · `04-simulacao` · `05-ui-ux` · `05b-textos-psi` · `06-tecnico` · `07-falta` · `capturas/`
**Quem fez:** fio principal + subagentes GD ×2, QA, UX, revisor Godot e PSI. GD e QA pararam no limite de uso da sessão: o fio principal completou GD 08-10, Fase 1, Fase 2 e a simulação (ECO). Nada foi alterado em `jogo/`, `docs/`, `gdd/`, `gestao/` ou `site/`.

## 1. Resumo executivo

- **O jogo roda de ponta a ponta sem bug bloqueante:** 18/18 testes OK; 13 roteiros pela interface (título → tutorial → calibração → 4 anos → cena → final, retomada em 11 estados, abandono, entrada) sem violação de D-084, §14.03 ou §14.02; 2.880 partidas simuladas sem estado impossível, com determinismo e save/restauração exatos.
- **Conformidade:** sistemas 86,5% ✅ (334 de 386 itens do GDD); telas 70,9% ✅ (90 de 127 itens do 14A); total 82,7%.
- **Achados:** 🔴 0 · 🟠 9 · 🟡 24 · 🔵 17 (seção 4).
- **Divergências do GDD que mudam o jogo:** final #14 inalcançável; texto da opção em 2-6 linhas (GDD pede 1); gatilho alternativo no momento e na contagem diferentes; finais do Ano 4 com valores pós-cena; Aprendizado sem fonte continua sorteável.
- **Pronto para playtest (P-006)? Não.** Motivos: tela final mostra "[a definir]" em 51% das partidas; com o baralho fictício só 1,3% chegam ao fim do mandato (72% de catástrofe no jogador atento); dezenas de textos "[a definir]" na tela; mecânica de atores nunca aparece. Um teste interno de interação (toque, arraste, fluxo) já é possível.

## 2. Linha de base

| Item | Resultado |
| :--- | :--- |
| Godot | 4.7.2.stable (D-130 ✅) |
| Testes | 18/18 OK em 76 s; avisos só de testes negativos |
| Abertura headless | 0 avisos, 0 erros |
| MCP | responde; `run_project` não usado (injeta autoload e usa o `user://` real do PO) |
| Capturas | janela real em escala 0,75 (tela 1366×768, sem xvfb); ~420 PNG |
| Inventário | 51 scripts (10.553 linhas), 18 testes + 5 de captura (6.414), 32 cenas; 125 "a definir", 60 "a validar", 11 "PROPOSTA" |

## 3. Matriz de rastreabilidade (resumo)

| Sistema | ✅ | ⚠️ | ❌ | ≠ | ❓ | Nota |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 01 Medidores | 49 | 1 | 0 | 0 | 0 | 03-sistemas-01-05 |
| 02 Finais | 36 | 6 | 0 | 1 | 0 | idem |
| 03 Impeachment | 31 | 4 | 0 | 0 | 2 | idem |
| 04 Eixo | 21 | 1 | 0 | 0 | 1 | idem |
| 05 Cartas | 42 | 8 | 0 | 1 | 3 | idem |
| 06 Sorteio | 49 | 3 | 0 | 0 | 1 | 03-sistemas-06-10 |
| 07 Atores | 38 | 6 | 0 | 0 | 3 | idem |
| 08 Eventos | 28 | 3 | 0 | 0 | 0 | idem |
| 09 Desinformação | 13 | 4 | 1 | 0 | 0 | idem |
| 10 Estado da partida | 27 | 2 | 0 | 0 | 1 | idem |
| **Sistemas** | **334** | **38** | **1** | **2** | **11** | 386 itens |
| Telas 14A (64 estados) | 46 | 16 | 0 | 0 | 2 | 05-ui-ux |
| Componentes (21) | 11 | 10 | 0 | 0 | 0 | idem |
| Fluxos (8) | 7 | 0 | 0 | 1 | 0 | idem |
| Animações (13) | 11 | 1 | 0 | 1 | 0 | idem |
| Regras gerais (9) | 7 | 2 | 0 | 0 | 0 | idem |
| Tokens (12) | 8 | 3 | 0 | 1 | 0 | idem |
| **UI/UX** | **90** | **32** | **0** | **3** | **2** | 127 itens |

## 4. Bugs e modificações necessárias

Severidade (prompt): 🔴 bloqueante · 🟠 alta · 🟡 média · 🔵 baixa. "Ref." = achado na nota de origem (G1/G2 = sistemas, U = UX, T = técnico, P = PSI).

### 🟠 Alta

| ID | Ref. | Onde | Reproduzir | Esperado (fonte) | Obtido | Sugestão |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| V-001 | G1-01 | `ending_rules.gd:33-52`; `endings.json` END-012 × END-015 | `EndingRules.end_of_term(endings, {legitimacy: 85, awareness: 20, integrity: 20, resto 50})` | 28 finais alcançáveis (D-096) | END-015 nunca sai: condições contidas nas do END-012, mesmo peso, END-012 antes. 0 em 2.880 partidas e em 6.000 vetores | Decisão do PO (seção 9) |
| V-002 | G1-10, P-01, P-07 | `axis_rules.gd:36-47` | Simulação: 1.463 de 2.880 partidas | Revelação dos medidores (GDD §9.2) | "[a definir — nenhum padrão do GDD §9.2 se aplica]" na tela final de 51% das partidas; limiares > 60 / < 40 sem fonte; "negligenciou…" julga | Decisão do PO + texto de reserva |
| V-003 | 04-simulacao | dados `cards.json` (fictício) | `val_sim.gd` (2.880 partidas) | Partida de ~28 cartas, ~15 min (D-088); "catástrofe do jogador atento: 15%" (gdd 08 §7) | Fim do mandato em 1,3%; jogador atento 72% catástrofe, 21,9 cartas; aleatório 14 cartas | Rebalancear o baralho do protótipo antes do P-006 ou esperar o doc 17 (decisão) |
| V-004 | T-01, U-10 | `about_screen.gd:19,21,27` | Abrir Sobre | Créditos e licenças exatos (D-140); aviso MIT do Godot | "[a definir]" nos avisos; "Kenney (CC0)" sem asset Kenney (ícones são próprios) | Corrigir antes de qualquer build público |
| V-005 | U-02 | `theme_builder.gd:20-23`; `tokens.gd:28` | Alto contraste + opção preta ou roxa (`capturas/hc_borda_preta.png`) | Borda partidária reconhecível (doc 14 §14.11.2; D-169) | Preto 1,30:1 e roxo 2,24:1 contra `#000` | Decisão do PO (revisa D-169) |
| V-006 | T-02 | sem `export_presets.cfg` | — | Exportar Web/Android/PC (GDD §12.1) | Sem presets; galeria e `tests/` iriam no `.pck`; permissão VIBRATE não configurada | Criar presets com filtros de exclusão |
| V-007 | T-03 | `~/.local/share/godot-mcp/build/index.js:266-330` | `run_project` em `jogo/` | D-133: autoload do MCP em `tools/mcp/`, só em debug | `tools/mcp/` não existe; o MCP injeta autoload com `eval` (porta 9090) no `project.godot` e só limpa se encerrar normalmente → risco de commit e de ir ao build | Decisão (seção 9 do 06-tecnico) |
| V-008 | G2-16, T-04 | `save_manager.gd:18-30` | Matar o app durante a gravação | Save confiável (gdd 10 §3.5, §5) | Grava por cima do `save.json` (não atômico); persistência na Web (IndexedDB) `[não verificado]` | tmp + renomear; testar na Web |
| V-009 | 02-testes | `jogo/tests/` | Mutação de 1 unidade nos JSON (`<scratchpad>/qa/mutate.py`) | Critérios §8 testáveis | 53 de 54 mutações nas condições dos finais e 27 de 46 no `balance.json` passam sem teste falhar | Testes de tabela para finais e relações |

### 🟡 Média

| ID | Ref. | Onde | Problema | Sugestão |
| :--- | :--- | :--- | :--- | :--- |
| V-010 | G1-07, U-01 | `swipe_card.gd:596-619`; `tokens.gd:73` | Texto da opção em 2-3 linhas no arraste a 18 px, até 6 a 36 px (gdd 05 §3.3: 1 linha) | Decisão do PO |
| V-011 | G1-02 | `game_flow.gd:304-315` | Gatilho alternativo checado só depois do Aprendizado (gdd 03 §3.1: "logo após a carta") | Decisão do PO |
| V-012 | G1-03 | `game_flow.gd:232` | Sequência do alternativo atravessa a virada do Ano 1 → 2 | Decisão do PO |
| V-013 | G1-04 | `meter_rules.gd:110-123` | "Mais perdeu" = queda aplicada, não o efeito; muda o final de catástrofe | Definir no GDD + teste |
| V-014 | G1-05 | `game_flow.gd:605-606,665-666` | Finais do Ano 4 após a cena usam valores pós-cena (GDD 02: "da última carta") | Decisão do PO |
| V-015 | G1-06 | `draw_rules.gd:16`; `game_data.gd:291-302` | Aprendizado sem fonte não tira a carta do baralho (D-091, D-102) | Corrigir antes do conteúdo real |
| V-016 | G2-03 | `cards.json` | Carta obrigatória de ator Furioso: 0 em 2.880 partidas (só 2 atores com cartas) | Completar dados do protótipo (decisão) |
| V-017 | G2-17 | regra conforme | Capital 0 no Ano 1 (D-095): 0 em 2.880 partidas | Reavaliar com o baralho real |
| V-018 | G2-18 | — | Até 7 avisos de evento seguidos num turno (gdd 08 §7: 1-2) | Decisão após o baralho real |
| V-019 | G2-19 | `cards.json` | 3 de 6 técnicas de desinformação; 2 atores nunca citados | Completar ou registrar (README) |
| V-020 | G1-11, G2-12, U-05 | `game_data.gd:80-94` | `quem_fala` em 0 de 40 cartas; temáticas e cena mostram "[quem fala — a definir]"; institucionais mostram o nome do modo | Campo obrigatório no validador |
| V-021 | U-03 | `swipe_card` (título e opção) | Em 36 px quebra no meio da palavra ("Influenciado/r", "Congres/so") e a opção cobre o título | Escala de títulos a 36 px + quebra só em espaços |
| V-022 | U-04 | `swipe_card.gd:38,681-697` | Dica do toque a 36 px sai das duas bordas da tela (`capturas/r10_36px_dica_cortada.png`) | Quebra de linha com largura máxima |
| V-023 | U-06 | `main.gd:41-42`; `year_card.gd:18,23` | Ida ao final não é "fade para preto + pausa" (F-04, doc 14 §14.10.2); aviso de Captura ~300 ms legível | Decisão do PO (P4) |
| V-024 | U-07 | `learning_sheet.tscn:227-231` | Link da fonte com alvo < 48 px (D-150) | Linha inteira clicável |
| V-025 | U-08 | `calibration_screen.gd:12,173-179` | Caixa "[HUD na calibração — a definir]" nas 6 perguntas | Remover (recomendado) |
| V-026 | T-05 | `main.gd:313-327` | Área segura zerada no Web em celular | Incluir `web_android`/`web_ios` |
| V-027 | T-06 | `draw_rules.gd:132-135`; `game_data.gd:208-213` | Ordenação e busca linear a cada sorteio (custo com 340 cartas `[não verificado]`) | Índices no `load_all` |
| V-028 | T-07 | todo o código | Nenhum `tr()`; texto PT fixo (GDD §14.1: outras línguas "futuro") | Decisão de quando preparar |
| V-029 | T-09 | `main.gd:99-101,215-232` | Voltar do Android na tela de título não faz nada | Decisão do PO |
| V-030 | T-10 | `swipe_card.gd:335-339` | Enter confirma sem o intervalo de 0,5 s do toque | Decisão (UX recomenda manter) |
| V-031 | P-03 | `endings.json:563`, L599, L360 | Paráfrase/atribuição entre aspas como citação (D-091) | Conferir originais |
| V-032 | P-05 | `content_warnings.gd:6,9` | Avisos não cobrem golpe/ditadura, frases nazifascistas, fome, pessoas reais; GDD §14.3 × docs/16 §16.13 divergem | Decisão do PO |
| V-033 | 02-testes | `test_e2e.gd:21,116` | Final "igual ao da API" é constante fixa; a semente é trocada no tutorial | Calcular o esperado no teste |

### 🔵 Baixa

| ID | Ref. | Problema |
| :--- | :--- | :--- |
| V-034 | G1-08 | Evento da opção que zerou o Capital some na condenação |
| V-035 | G1-09 | `capture_at_or_above` no `balance.json` nunca é lido |
| V-036 | G1-12, G2-14 | Parâmetros do GDD fixos no código; faixa do medidor em 2 lugares; id repetido mantém a 1ª carta |
| V-037 | G2-05 | "Mesmo ator 2×" irrepresentável no JSON |
| V-038 | G2-15 | Escolha da carta ligada "a validar" |
| V-039 | U-09 | Placar desenha barra de 45% sem dado |
| V-040 | U-11 | Caption a 14 px no passo 16 |
| V-041 | U-12, 07-falta | Docs desatualizados (lista na seção 8) |
| V-042 | U-13 | T-05.3 e T-14.1 sem captura |
| V-043 | T-11 | `await` de timer pode retomar em tela liberada |
| V-044 | T-12, T-13 | 3 exceções à regra "Game é a única API"; `GameDatabase` é Node |
| V-045 | T-14 | Placeholder e galeria acessíveis |
| V-046 | T-15 | Comentários citam `.claude/notas/p005/*` inexistentes |
| V-047 | T-16 a T-19 | Sem reação a app pausado; avisos de tipagem desligados; sem migração de save; desempenho sem medição |
| V-048 | 04-partidas | Captura do `shot_game` mostra rodapé cortado a 36 px, não reproduzido em 6 fluxos — observar no aparelho |
| V-049 | 02-testes | Teste que trava deixa `user://test_*.json` para trás |
| V-050 | P-12 | "Professor interlocutor" sem nome no Sobre |

## 5. Divergências do GDD

| Regra (fonte) | O que o código faz | Impacto | Recomendação |
| :--- | :--- | :--- | :--- |
| 28 finais (D-096; gdd 02 §3.3, §4) | END-015 inalcançável (V-001) | Final e citação perdidos | Decisão do PO |
| Opção em 1 linha (gdd 05 §3.3) | 2-6 linhas (V-010) | Cobre a carta | Decisão do PO (UX) |
| Alternativo "logo após a carta" (gdd 03 §3.1) | Após o Aprendizado (V-011) | Momento da cena | Atualizar o GDD (rec. GD) |
| Alternativo "desde o Ano 2" (gdd 03 §3.1) | Conta opções do Ano 1 (V-012) | Cena no início do Ano 2 | Corrigir o código (rec. GD) |
| "Mais perdeu" (gdd 02 §3.2) | Queda aplicada (V-013) | Final de catástrofe | Atualizar o GDD + teste |
| "Valores da última carta" (gdd 02 §4) | Pós-cena (V-014) | Final do Ano 4 | Atualizar o GDD (rec. GD) |
| APR sem fonte fora do baralho (gdd 05 §5; D-091, D-102) | Continua sorteável (V-015) | Com o conteúdo real | Corrigir o código |
| Revelação dos medidores (GDD §9.2) | Limiares sem fonte; marcador "[a definir]" (V-002) | 51% das partidas | Decisão do PO |
| Fade para preto + pausa (F-04; doc 14 §14.10.2) | Fade pelo cinza, 1 s, sem pausa (V-023) | Ritmo do final | Decisão do PO |
| D-133 (autoload MCP em `tools/mcp/`) | Não existe; MCP injeta (V-007) | Risco de commit | Decisão do PO |
| Dobro da Consciência só para "carta" (gdd 01 §3.3.2) | Vale também em eventos e na cena (C-05) | Pequeno | Atualizar o GDD |
| Evento após condenação (gdd 08 §5) | Evento da carta que zerou o Capital some (V-034) | Raro | Corrigir o código (rec. GD) |
| HUD fora da calibração (14A T-03.1) | Caixa "[HUD — a definir]" (V-025) | Visual | Remover |

## 6. O que falta desenvolver (backlog)

| Pri. | Item | Esforço | Depende de |
| :--- | :--- | :--- | :--- |
| P0 | Decisões do PO da seção 9 | — | PO |
| P0 | Texto de reserva da revelação + limiares (V-002) | P | PO |
| P0 | Baralho do protótipo jogável para o P-006 (balanço, atores, técnicas) ou esperar o doc 17 (V-003, V-016, V-019) | M | PO, ECO |
| P0 | Textos "[a definir]" que aparecem ao jogador (125) | M | PO, PSI |
| P1 | Correções de código: V-012, V-015, V-008, V-021, V-022, V-024, V-025, V-026, V-034, V-035 | M | — |
| P1 | Testes de tabela para finais e `balance.json` (V-009); `test_e2e` com esperado calculado (V-033) | M | — |
| P1 | Licenças e créditos no Sobre (V-004) | P | TA |
| P2 | Conteúdo real: 340 cartas, Aprendizados com fonte, `quem_fala` (07-falta) | G | docs 17/18 |
| P2 | Presets de exportação, teste em aparelho e na Web (V-006, V-008) | M | — |
| P2 | Áudio (GDD §11.4) | M | SFX |
| P3 | Localização (V-028), desempenho com 340 cartas (V-027), modo daltônico | M | — |
| P3 | Ícones, retratos e ciano finais (D-140, D-142, D-162) | M | TA |

## 7. Lacunas de teste

- Condições dos finais (53 de 54 mutações sobrevivem) e `balance.json` (27 de 46).
- Medidor em 0 pela interface (gdd 01 CA-4); retomada na calibração e em evento pela interface; baralho curto (gdd 06 CA-11); evento inválido; "opção em 1 linha"; rodapé e dica em 36 px pelo que aparece na tela.
- `test_e2e`: final esperado constante.
- Nada em aparelho real, Web ou Android.

## 8. Conflitos entre docs

| # | Conflito |
| :--- | :--- |
| 1 | Prompt de validação (roteiro 4) × gdd 03 §3.1/D-095 sobre Capital 0 no Ano 1 — erro do prompt, corrigido nas notas |
| 2 | Citações: GDD 02 §3.5 (marcas de fonte fraca; "Adaptação") × `endings.json` (sem marca; 2 autores diferentes) |
| 3 | Avisos de conteúdo: GDD §14.3 × docs/16 §16.13 |
| 4 | Paleta: GDD §10.1 (secundária azul, alerta vermelho, destaque amarelo) × D-172 (neutras) |
| 5 | GDD §13.1 soma 385 × D-141 (375) |
| 6 | docs/13 com chaves PT (`opcao_a`, `cartas.json`) × D-136 (EN) |
| 7 | GDD 08 §7 "1-2 avisos por turno" × faixa de 15-25% de opções com evento (simulação chega a 7) |
| 8 | GDD 02 §4 "valores da última carta" × GDD 03 §5 (cena antes dos finais) |
| 9 | `jogo/README.md` × dados (cobertura de atores e desinformação; `P8_TARGET_ONLY`) |
| 10 | `gestao/plano-de-acao.md` e `gestao/estado.md` × commits (P-005 etapas 3-9 feitas) |

## 9. Decisões do PO (todas resolvidas em 2026-10-20: D-174 a D-190)

| # | Decisão | Alternativas | Recomendação |
| :--- | :--- | :--- | :--- |
| 1 | Final #14 inalcançável (V-001) | A) desempate "vence o mais específico" · B) trocar a ordem #11 × #14 · C) mudar uma condição do #14 | A |
| 2 | Revelação dos medidores sem padrão (V-002) | A) aprovar > 60 / < 40 e escrever um 6º texto "sem padrão" · B) usar as faixas do GDD §5.2 · C) mostrar só o padrão mais forte | A, com PSI revisando os textos (P-07) |
| 3 | Baralho do protótipo para o P-006 (V-003, V-016, V-019) | A) rebalancear o fictício (efeitos menores, atores, técnicas) · B) esperar o doc 17 real · C) playtest só de interação | A |
| 4 | Texto da opção (V-010) | A) GDD vira "frase curta, até N caracteres" + limite no `/validate-cards` · B) rótulo do arraste na largura toda · C) faixa P7 a partir de 24 px | A + B |
| 5 | Banda partidária no alto contraste (V-005) | A) manter (D-169) · B) clarear só a banda no alto contraste · C) esperar o modo daltônico | B, com PSI/TA |
| 6 | Gatilho alternativo (V-011, V-012) | Momento: A) após o Aprendizado (atualizar GDD) · B) após o passo 2. Contagem: A) zera ao abrir o Ano 2 · B) manter | Momento A; contagem A |
| 7 | Finais do Ano 4 após a cena (V-014) | A) valores pós-cena (atualizar GDD) · B) valores da última carta | A |
| 8 | "Mais perdeu" (V-013) | A) queda aplicada · B) efeito antes do limite | A + teste |
| 9 | D-133 / MCP (V-007) | A) cumprir como está · B) MCP só em cópia isolada + checagem no pre-commit · C) aceitar o risco | B |
| 10 | Pendências da tabela "A validar" do README | Modal A/B (D-173), aviso de Captura (P4), legenda das cores, P3/P5/P7, Esc na pausa, toast 4 s, Enter sem 0,5 s, Voltar do Android | Ver `05-ui-ux.md` §8 e `06-tecnico.md` |
| 11 | Citações de políticos vivos (P-02) | Depende do parecer jurídico RC-08 | Segurar até o parecer |

## 10. Riscos novos

| ID | Risco | Status | Mitigação |
| :--- | :--- | :--- | :--- |
| RT-10 | Balanceamento desconhecido até o baralho real; o fictício é punitivo demais para playtest | 🔴 Alto | Decisão 3; simulação do ECO com o doc 17 |
| RT-11 | MCP injeta autoload com `eval` no `project.godot` se rodar em `jogo/` | 🟡 Ativo | Decisão 9; nunca rodar o MCP no repositório |
| RT-12 | Perda de partida: save não atômico; Web sem verificação | 🟡 Ativo | V-008 |
| RT-13 | Testes não protegem condições dos finais e relações | 🟡 Ativo | V-009 |
| RC-10 | Tela final com marcador "[a definir]" em metade das partidas | 🟠 Alto para o P-006 | Decisão 2 |
| RP-09 | Subagentes param no limite de uso da sessão no meio do trabalho (GD e QA, 2026-10-20) | 🟡 Ativo | Notas incrementais (funcionou); ondas menores |

## 11. Amostragem de verificação (5 citações por subagente)

| Subagente | Citações conferidas | Resultado |
| :--- | :--- | :--- |
| GD 01-05 | G1-01 (`endings.json` END-012/015), G1-03 (`game_flow.gd:232`), G1-06 (`draw_rules.gd:14-16`), G1-08 (`game_flow.gd:670-684`), G1-09 (`capture_at_or_above` só em `balance.json:149`) | 5/5 ✅ |
| GD 06-10 (partes do GD) | 06-07 obrigatórias após eventos (`game_flow.gd:155-165,545-547`), 06-24 (`game_flow.gd:574-577`), 07-13 (`game_flow.gd:227`), 06-52 RNG no save (`run_state.gd` `rng_state`), 07-47 (`game_data.gd:80-94`) | 5/5 ✅ |
| QA (scripts) | Contagens, soma 375, atores × docs/11, calibração × docs/15, mutações (log) — reexecutados pelo fio principal | 5/5 ✅ |
| UX | `tokens.gd:94` (Caption 14), `scoreboard.gd:26` (barra 0,675), `scoreboard.gd:18` (`P8_TARGET_ONLY` false), `learning_sheet.tscn:227-231`, `gdd/GDD.md:549-552` | 5/5 ✅ |
| Revisor técnico | `about_screen.gd` "Kenney (CC0)" (linha **19**, não 18), `assets/icons/README.md`, `draw_rules.gd:132-135`, `game_data.gd:208-213` (função `_actor_owning`, não `owner_of`), 0 `tr()`, título sem Voltar (`app_screen.gd:31-38`) | 5/5 ✅ (2 com linha/nome trocados, sem mudar o achado) |
| PSI | `endings.json:105,299,329,563`, `calibration.json:119-131`, `content_warnings.gd:6,9`, END "Autogestão Popular" = `catastrophe` | 5/5 ✅ |
