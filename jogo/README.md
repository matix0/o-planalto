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
  - fictícios: 40 cartas (cobrem os 10 modos, eventos, atores e desinformação) e 45 Aprendizados.
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

- `run_all.sh` faz o `--import` e roda os 18 `tests/test_*.gd` headless (D-134), em cerca de 1 min.
- `test_e2e.gd` joga uma partida inteira pela interface, com cliques e teclas:
  - título → tutorial → calibração → 4 anos → impeachment → final;
  - fecha e reabre o app no meio;
  - chega ao mesmo final que a mesma política jogada só pela API.
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

## A validar com o PO

Ficam como constantes nomeadas, fáceis de trocar:

| Ponto | Padrão no protótipo | Onde |
| :--- | :--- | :--- |
| Modal destrutivo (D-173) | variante A, cancelar em destaque | `confirm_modal.gd` `VARIANT` |
| Aviso de Captura (P4) | 700 ms, sem esperar toque | `year_card.gd` `YEAR_TIME`, `CAPTURE_WAITS_TAP` |
| Pontos de efeito (D16) | 100 ms após soltar (doc 14) | `hud.gd` `DOTS_FOLLOW_PROMPT` |
| Estado "armado" (P3), faixa da opção a 36 px (P7), carta de origem do evento (P5) | desligados | `swipe_card.gd`, `event_notice.gd` |
| Legenda das cores partidárias | não há | — |
| Flick (D-153) | confirma com 22% de arraste ou com o texto à mostra há ≥ 150 ms | `tokens.gd` `FLICK_*` |
| Enter | confirma sem o intervalo de 0,5 s do toque | `swipe_card.gd` |
| Dica do toque (D-163) | 4 s parado, uma vez por carta | `swipe_card.gd` `TAP_HINT_DELAY` |
| Rodapé a 36 px | até 3 linhas, para não cortar o "n/7" | `card_footer.gd` |
| Ids das cartas da cena | `IMP-1`..`IMP-5` (o baralho já usa `INST-141`..`143`) | `data/impeachment.json` |
| Cena: cada fase | mostra consequência e Aprendizado | `game_flow.gd` |
| Gatilho alternativo | conferido após o Aprendizado da 3ª carta, a partir do Ano 2 | `impeachment_rules.gd` |
| Câmara antes da votação (D18) | "— / 513" (o 342 da prancha entrega o resultado; P8 pronta) | `scoreboard.gd` `P8_TARGET_ONLY` |
| Revelação dos medidores (GDD §9.2) | alto > 60, baixo < 40 | `axis_rules.gd` `REVEAL_*` |
| Pontos em eventos e no fechamento do ano | sem pontos | `game_screen.gd` `EVENT_DOTS`, `CLOSING_DOTS` |
| Tela final | autor com obra e data; leitor lê os números; Esc não faz nada | `quote_block.gd`, `final_screen.gd` |
| Avisos (toast) | 4 s | `toast.gd` `HOLD_SECONDS` |
| Esc com a pausa aberta | = Continuar | `main.gd` |

## O que falta

- **Conteúdo real:**
  - as 340 cartas (doc 17; aqui há 40 fictícias) e seus Aprendizados (doc 18);
  - textos `[a definir]`;
  - ícones e retratos finais (TA). As cores das faixas estão em revisão (D-162).
- **Fora do escopo deste protótipo:** áudio, exportação para celular/web e teste em aparelho (área segura, vibração, leitor de tela).
