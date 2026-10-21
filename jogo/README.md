# O Planalto — protótipo jogável (P-005)

Protótipo em **Godot 4.7.2** (D-130) com **dados fictícios** (D-135, D-139). Cobre as etapas 3 a 9 do P-005 (`gestao/plano-de-acao.md`): os 10 sistemas do GDD 2.0 (`gdd/`) e as telas dos wireframes da rodada final. Fica na branch `claude/p005-prototipo`, fora do `main`.

Textos marcados `[Fictício]` ou `[a definir]` são provisórios. Nenhum número de dado real foi inventado (D-091).

## Como rodar

1. Abrir o Godot 4.7.2 → **Importar** → `jogo/project.godot`.
2. **F5** roda o jogo (`scenes/main.tscn`).

- Janela de celular em retrato, 390×844 (D-170). No PC, a coluna fica em até 430 px (D-171).
- Linha de comando: `godot --path jogo`.
- Galeria dos componentes: abrir `scenes/dev/gallery.tscn` e apertar **F6**.
  - PgUp/PgDn: troca a página.
  - H: alto contraste.
  - M: reduzir movimento.
  - R: reinicia.

## Controles

| Ação | Toque / mouse | Teclado |
| :--- | :--- | :--- |
| Ver uma opção | arrastar a carta, ou tocar numa metade | seta |
| Decidir | soltar além do limite, ou tocar de novo na mesma metade (≥ 0,5 s) | Enter |
| Desistir | soltar antes do limite, ou tocar fora da carta | Esc |
| Continuar (consequência, aviso, cena) | tocar em qualquer ponto | Enter |
| Pausa | botão no rodapé | Esc (sem opção à mostra) |

## O que já funciona

- **Fluxo completo:**
  - título;
  - tutorial (só na 1ª vez);
  - calibração (6 perguntas);
  - 4 anos de 7 cartas (obrigatórias + sorteio), com eventos encadeados, cartão de ano, consequência e Carta de Aprendizado;
  - cena de impeachment (5 fases, placar);
  - tela final com radar ideológico, citação, epílogo e medidores com número.
- **Dados (D-139):**
  - reais: 8 medidores, 24 atores, 28 finais e calibração (docs/15 §15.04);
  - 10 modos;
  - fictícios: 40 cartas e 45 Aprendizados. Cobertura real das cartas: 30 institucionais (3 por modo), 5 temáticas, 5 de ator (só `ACT-001` e `ACT-010` têm cartas próprias); 22 dos 24 atores citados; evento em 15 de 80 opções (19%); 3 das 6 técnicas de desinformação (`gestao/validacao-2026-10-20.md`, V-016 e V-019).
- **Salvamento:** salva sozinho a cada passo. "Continuar" retoma a partida; consequência, Aprendizado e eventos voltam em modo leitura, sem repetir efeitos (gdd 10).
- **Pausa e configurações**, que valem na hora:
  - tamanho do texto 16-24 (36 só para teste, D-169);
  - reduzir movimento;
  - alto contraste;
  - limite do arraste.
- **Acessibilidade:**
  - navegação por teclado;
  - nomes para o leitor de tela;
  - foco visível só com teclado;
  - nenhuma palavra de lado na tela (D-084);
  - nenhum número de medidor antes do final.

## Testes

Rodar numa cópia, como manda `.claude/rules/isolamento.md`:

```bash
cp -r jogo /tmp/pt && GODOT=/caminho/do/godot jogo/tests/run_all.sh /tmp/pt
```

- `run_all.sh` faz o `--import` e roda os 20 `tests/test_*.gd` headless (D-134), em cerca de 1 min.
- `test_e2e.gd` joga uma partida inteira pela interface, com cliques e teclas:
  - título → tutorial → calibração → 4 anos → impeachment → final;
  - fecha e reabre o app no meio;
  - chega ao mesmo final que a mesma política jogada antes só pela API (`GameFlow`), no mesmo teste.
- `test_table_endings.gd` e `test_table_balance.gd` (P-014): as condições dos 28 finais e os números do `balance.json` copiados dos docs de design, com teste de fronteira de cada um (um passo antes e um depois do limite). Mudar 1 unidade em qualquer número desses dois arquivos faz um teste falhar.
- `shot_*.gd` geram capturas. Precisam de tela; no Linux sem tela, use `xvfb-run` (modo de usar no cabeçalho de cada arquivo).

## Estrutura

| Pasta | Conteúdo |
| :--- | :--- |
| `data/` | JSON: cartas, atores, modos, medidores, finais, calibração, cena, Aprendizados, balanceamento |
| `scripts/core/` | regras puras por sistema do GDD + `GameFlow` (máquina de estados da partida) |
| `scripts/autoload/` | `Game` (única API das telas), `SaveManager`, `Settings`; `GameData` em `scripts/game_data.gd` |
| `scripts/ui/` | `Tokens`, `ThemeBuilder`, `main.gd` (navegação, pausa, modal, avisos), `components/`, `screens/` |
| `scenes/` | `screens/`, `components/`, `dev/gallery.tscn` |
| `assets/` | Inter e Poppins (OFL, D-140); ícones provisórios |
| `tests/` | testes headless e capturas |

## Decisões da validação (D-174 a D-190)

A validação ponta a ponta de 2026-10-20 (`gestao/validacao-2026-10-20.md`) fechou vários pontos que ficavam "a validar". Status no código: ✅ aplicado · P-014 = em correção no plano P-014 (`gestao/plano-de-acao.md`).

| Decisão | O que muda | Onde | Status |
| :--- | :--- | :--- | :--- |
| D-174 | Fim do mandato: vence o final mais específico (torna o #14 alcançável) | `ending_rules.gd` | ✅ P-014 |
| D-175 | Revelação dos medidores: alto > 60, baixo < 40 e 6º texto "sem padrão" | `axis_rules.gd`, `balance.json` | ✅ P-014 (textos: DP-009) |
| D-177 | Opção até 25 caracteres; no arraste, rótulo na parte visível da carta | `game_data.gd`, `swipe_card.gd` | ✅ P-014 |
| D-178 | Alto contraste: banda partidária como está | — | ✅ |
| D-179 | Gatilho alternativo após o Aprendizado; a sequência zera no Ano 2 | `game_flow.gd` | ✅ P-014 |
| D-180 | "Mais perdeu" = maior queda aplicada | `meter_rules.gd` | ✅ (já era assim; teste na etapa 6) |
| D-181 | Finais do Ano 4 com os valores depois da cena | `game_flow.gd` | ✅ (já era assim; teste na etapa 6) |
| D-182 | Condenação por Capital em 0: o evento da opção vai ao epílogo | `game_flow.gd` | ✅ P-014 |
| D-183 | Calibração sem a caixa do HUD | `calibration_screen.gd` | ✅ P-014 |
| D-184 | Ida ao final com fade para preto e pausa; aviso de Captura espera toque | `main.gd`, `year_card.gd` | ✅ P-014 |
| D-185 | Voltar do Android no título sai; Enter sem os 0,5 s | `main.gd`, `swipe_card.gd` | ✅ P-014 |
| D-186 | 36 px: títulos menores e quebra só em espaços | `tokens.gd`, `swipe_card.gd` | ✅ P-014 (números: DP-010) |
| D-187 | Modal destrutivo: variante A | `confirm_modal.gd` `VARIANT` | ✅ |
| D-188 | Sobre com a licença do Godot e a lista real de assets; 1º preset só Web | `about_screen.gd`, `export_presets.cfg` | ✅ P-014 (DP-019) |
| D-189 | MCP só numa cópia; pre-commit barra o autoload do MCP | `.githooks/pre-commit` (ativar: `git config core.hooksPath .githooks`) e hook do Claude Code | ✅ P-014 (DP-018) |
| D-190 | Avisos de conteúdo unificados; citações de políticos vivos esperam o parecer jurídico (RC-08) | `content_warnings.gd` | ✅ P-014 (lista: DP-008) |

## Ainda a validar com o PO

Ficam como constantes nomeadas, fáceis de trocar:

| Ponto | Padrão no protótipo | Onde |
| :--- | :--- | :--- |
| Pontos de efeito (D16) | 100 ms após soltar (doc 14) | `hud.gd` `DOTS_FOLLOW_PROMPT` |
| Estado "armado" (P3), faixa da opção a 36 px (P7), carta de origem do evento (P5) | desligados | `swipe_card.gd`, `event_notice.gd` |
| Legenda das cores partidárias | não há (PSI + playtest) | — |
| Flick (D-153) | confirma com 22% de arraste ou com o texto à mostra há ≥ 150 ms | `tokens.gd` `FLICK_*` |
| Dica do toque (D-163) | 4 s parado, uma vez por carta | `swipe_card.gd` `TAP_HINT_DELAY` |
| Rodapé a 36 px | até 3 linhas, para não cortar o "n/7" | `card_footer.gd` |
| Ids das cartas da cena | `IMP-1`..`IMP-5`, Aprendizados `APR-IMP-1..5`; as INST-141..160 são cartas comuns do modo (DP-011, provisória) | `data/impeachment.json` |
| Cena: cada fase | mostra consequência e Aprendizado | `game_flow.gd` |
| Câmara antes da votação (D18) | "— / 513" (o 342 da prancha entrega o resultado; P8 pronta) | `scoreboard.gd` `P8_TARGET_ONLY` |
| Pontos em eventos e no fechamento do ano | sem pontos | `game_screen.gd` `EVENT_DOTS`, `CLOSING_DOTS` |
| Tela final | autor com obra e data; leitor lê os números; Esc não faz nada | `quote_block.gd`, `final_screen.gd` |
| Avisos (toast) | 4 s | `toast.gd` `HOLD_SECONDS` |
| Esc com a pausa aberta | = Continuar | `main.gd` |

## O que falta

- **Conteúdo real:**
  - as 340 cartas (doc 17; aqui há 40 fictícias) e seus Aprendizados (doc 18);
  - textos `[a definir]`;
  - ícones e retratos finais (TA). As cores das faixas estão em revisão (D-162).
- **Exportação Web:** preset em `export_presets.cfg` (D-188), testado no Chromium com os modelos oficiais do 4.7.2; saída em `build/web/` (fora do git). Uma escolha sobrevive a fechar a aba 300 ms depois.
- **Fora do escopo deste protótipo:** áudio, exportação para celular e teste em aparelho (área segura, vibração, leitor de tela).
