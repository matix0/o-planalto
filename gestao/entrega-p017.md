# Entrega do P-017 — Correções do playtest

**Data:** 2026-10-22 · **Branch:** `claude/p017-playtest` (já na `main`, publicado em https://matix0.github.io/o-planalto/jogar/)
**Decisões:** D-198 a D-201 (DP-025 aprovada) · **Testes:** 23/23 (`jogo/tests/run_all.sh`)

| # | Etapa | Status | Evidência |
| :--- | :--- | :--- | :--- |
| 1 | Zerar `[a definir]` | ✅ | `tests/test_no_placeholders.gd`; textos do PO + DP-025 |
| 2 | HUD maior com sigla, cor por medidor, borda vermelha ≤ 20, legenda ao tocar/passar o mouse; nomes no tutorial 2/4 | ✅ | `hud.gd`, `meter_icon.gd`, `tokens.gd` (`METER_INFO`) |
| 3 | Calibração com cabeçalho e "Alinhamento · n/6" | ✅ | `calibration_screen.gd` |
| 4 | Paleta da ideia inicial (D-199) | ✅ | `tokens.gd`, `theme_builder.gd`, impeachment e tela final |
| 5 | Folha de Aprendizado rola no celular até o link | ✅ | causa: "Saiba mais" aberto com `mouse_filter` STOP; conferido no Chromium como celular (`.claude/notas/execucao/ferramentas/web_touch.js`, antes trava, depois chega à fonte); `tests/test_learning_touch.gd` |
| 6 | Radar: Prática ciano, Promessa dourada, 4 barras Promessa × Prática | ✅ | `radar.gd`; capturas 18/24/36 px e alto contraste |
| 7 | Travas de toque (0,5 s no 2º toque; flick só após 20-25% ou texto visível) | 🟡 | Já no código (`tokens.gd:79-81`) e testadas (`test_ui_kit.gd:190-235`). Falta o PO testar no celular |
| 8 | Entrega | ✅ | este arquivo |

## Fora do escopo (plano futuro)
- Alinhamento completo com a "ideia inicial" (economia, desktop com barra lateral, modos de jogo).
- Revisão das cartas D-196 e conferência das fontes (P-016).
