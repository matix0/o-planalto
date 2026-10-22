# P-017 — Correções do playtest (prompt de execução)

**Fonte:** comando do PO de 2026-10-22 (diagnóstico do playtest) + PDFs do design system (`TELAS`, `Componentes`, `Fluxos`, `Em aberto`) e da "ideia inicial". O comando do PO é a prioridade; o alinhamento completo com a ideia inicial fica para um plano futuro.
**Branch:** `claude/p017-playtest` (a partir da `main`). Escolhas no meio ficam provisórias em `gestao/decisoes-provisorias.md`; o PO valida no fim.
**Regras:** GodotPrompter antes de cada sistema; testes em cópia isolada (`.claude/rules/isolamento.md`); `tests/run_all.sh` verde a cada etapa; captura de tela (390×844 e 1280×720) de cada tela tocada em `gestao/capturas-p017/`.

## Verificação prévia (fio principal, 2026-10-22)

| Afirmação do diagnóstico | No código | Ação |
| :--- | :--- | :--- |
| Textos `[a definir]` vazaram para o jogo | ✅ ~20 em `jogo/scenes/` (ex.: `swipe_card.tscn:159`, `consequence_line.tscn:70`, `confirm_modal.tscn:51-78`, `tutorial.tscn:71-238`, `impeachment_panel.tscn:23`, `final.tscn:85`, `settings.tscn:88`) e em scripts (`scoreboard.gd:20`, `speaker_view.gd:8`, `confirm_modal.gd:15-16`) | Etapa 1 |
| Trava 0,5 s do 2º toque e trava do flick não existem | ❌ Existem: `tokens.gd:79-81`, usadas em `swipe_card.gd:391,409` | Etapa 6 só **testa** no celular; muda valor se o PO pedir |
| Folha de Aprendizado sem `ScrollContainer` | ❌ Há `ScrollContainer` em `learning_sheet.tscn`; o defeito é outro (altura/âncora/área segura no Web mobile) | Etapa 5 reproduz antes de corrigir |
| Seletor de texto só com 16/20/24 | ❌ `tokens.gd:84` já tem `[16, 18, 20, 24, 36]` | Conferir rótulos e padrão 18 na tela; sem mudança se ok |
| Calibração com topo vazio | ✅ D-183 tirou a caixa e deixou o espaço (`calibration_screen.gd:6`) | Etapa 3 |
| HUD sem nome dos medidores | ✅ `meter_icon.gd` sem legenda consultável na partida [conferir na etapa 2] | Etapa 2 |

## Etapas (ordem de execução)

| # | Etapa | Itens do comando | Arquivos prováveis | Aceite |
| :--- | :--- | :--- | :--- | :--- |
| 1 | **Zerar `[a definir]`** com os textos do comando §2.4 (tutorial Avançar/Começar; dica do toque; "Toque na tela para continuar"; rodapé "Processo de Impeachment · Fase X/5" / "· Resultado"; modais C-14 com "Voltar" e os 3 textos; aviso de falha ao gravar; `quem_fala` desconhecido → ocultar). Placeholders sem texto no comando (exemplo do tutorial, descrição curta do final, título do menu de pausa, controles de áudio, releitura) → proposta do fio principal como DP | 1 | `scenes/**/*.tscn`, `confirm_modal.gd`, `scoreboard.gd`, `speaker_view.gd` | Novo teste: nenhum texto visível com `[` … `]` nem "a definir" em nenhuma tela (varredura da árvore de nós) |
| 2 | **HUD dos 8 medidores maior + legenda** (toque/hover abre faixa sob o HUD com nome e função, textos do §2.2); divisória 5 Sociais / 3 Poder; nomes dos 8 no tutorial 2/4 | 4 | `meter_icon.gd`, HUD em `game_screen`, `tutorial.tscn` | Cabe em 390 px; alvo de toque ≥ 44 px; leitor de tela lê nome+valor; teste de toque abre/fecha a faixa |
| 3 | **Calibração (T-03):** cabeçalho "ALINHAMENTO INICIAL" + subtítulo; borda branca/ciano 3 px no arraste; rodapé "Alinhamento · n/6" + pausa | 3 | `calibration_screen.gd`, `calibration.tscn` | Captura sem área vazia; D-183 mantida (efeito oculto) |
| 4 | **Cor e identidade (resgate parcial da ideia inicial):** ciano em `quem_fala` e título da carta; cabeçalho e fundo dramático no impeachment (T-09); banner colorido por categoria na tela final (T-10) | 7 | `tokens.gd`, `theme_builder.gd`, `impeachment_screen`, `final_screen` | Contraste ≥ 4,5:1 texto / 3:1 gráfico; nenhuma cor de acento igual à cor partidária da borda da opção (C-05) |
| 5 | **Folha de Aprendizado no celular:** reproduzir o bug do Alisson no build Web (Chromium 390×844, Playwright); rolagem até o link da fonte com "Continuar" fixo; área segura | 6 | `learning_sheet.tscn/.gd` | Teste Playwright: link da fonte visível após rolar, com texto 24 px |
| 6 | **Radar final para leigos:** 2 cores (governou = ciano preenchido; disse = tracejado dourado com pontos); legenda; 4 barras Promessa × Prática abaixo; rótulos sem corte em 358 px | 7 | `radar.gd`, `final_screen` | Captura; teste de rótulos dentro da área; daltonismo: distinção também por traço |
| 7 | **Travas de toque/flick:** teste manual no celular + teste automatizado de toque duplo < 0,5 s não confirmar | 5 | `swipe_card.gd` | Relato do PO no aparelho |
| 8 | **Fechamento:** `run_all.sh`, build Web, capturas, `gestao/entrega-p017.md`, D-xxx das escolhas aprovadas, `/fechar-plano` | — | `gestao/` | PO aprova pelo PR |

Etapas 1-3 são as mais citadas pelos jogadores: entregar e publicar primeiro (deploy intermediário em `/jogar/`).
