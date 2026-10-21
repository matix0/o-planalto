# Diário da execução — P-014 e P-015

**Prompt:** `gestao/prompts/execucao-p014-p015.md` · **Branch:** `claude/p014-p015` (a partir do `main` em `1aed866`)
**Especificações:** `gestao/prompts/correcoes-p014.md` (P-014) · `gestao/prompts/criacao-cartas.md` (P-015)
**Decisões provisórias:** `gestao/decisoes-provisorias.md` (DP-nnn; o PO aprova ou reverte no fim)
**Início:** 2026-10-20

## Fases

| Fase | O que | Status | Evidência |
| :--- | :--- | :--- | :--- |
| 1 | P-014 etapa 2 — `/validate-cards` (opção ≤ 25 caracteres, `quem_fala`) | ✅ | `game_data.gd`, `test_data.gd`, `validate-cards.md`; DP-001; 18/18 testes |
| 2 | P-014 etapa 1 (GDDs e docs) + P-015 Onda 0 | ⏳ | — |
| 3 | P-014 etapas 3-5 (código) + ondas de cartas | ⏳ | — |
| 4 | P-014 etapas 6-7 (testes e verificação); ondas continuam | ⏳ | — |
| 5 | Ondas de cartas até o número-alvo (ECO a cada ~40 cartas) | ⏳ | — |
| 6 | P-015 migração para `jogo/data/` + simulação do ECO com o baralho real | ⏳ | — |
| 7 | Verificação final e entrega ao PO | ⏳ | — |

## Bloqueios para o PO

Nenhum até agora.

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
