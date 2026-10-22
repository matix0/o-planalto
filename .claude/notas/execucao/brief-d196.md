# Brief das ondas no modo D-196 (P-015, a partir da Onda 5)

**Decisão do PO (2026-10-22, D-196):** as ondas seguem sem conferir fontes na web (a rede da nuvem barra as páginas oficiais). A conferência fica no P-016. Várias ondas seguidas, e o PO revisa tudo no fim (DP por onda, como antes).

## O que muda em relação ao fluxo das Ondas 1-4

- **Sem pesquisador de fontes.** Nenhum dado novo entra no texto ao jogador. Fonte já conferida numa onda anterior pode ser usada (copie o trecho de `onda-NN/fontes.md`).
- **Aprendizado "em conferência":** quando não houver fonte conferida, o JSON do Aprendizado leva:
  - `"data": "Em conferência (P-016)."`
  - `"source": "Em conferência (P-016)."`
  - `"url": ""`, `"url_label": ""`, `"pending": true`
  - O jogo esconde o bloco de dados e mostra "Fonte em conferência" sem link (`jogo/tools/cards_doc.py`, `jogo/scripts/game_data.gd`).
- **A pista de dado continua** no `aprendizados.md` (o que procurar e onde), para o P-016.
- **Vivência, conceito e frase** seguem os limites (NFC): vivência ≤ 110, conceito ≤ 170, frase ≤ 55. O conceito explica o mecanismo sem número nem fato verificável que dependa de fonte; afirmação de fato duvidosa vai para a pista, não para o texto.
- **Sem PSI nem QA por enquanto (PO, 2026-10-22):** o PO quer o baralho completo funcionando primeiro e valida tudo no fim. Toda carta fica com Status `pendente de revisão (D-196)`.

## Arquivos de cada onda (`.claude/notas/execucao/onda-NN/`)

1. `cartas.md` — formato do doc 17 §17.01.1 (ver Ondas 4 e 5). Status `pendente de revisão (D-196)`.
2. `aprendizados.md` — rascunho legível com a pista de dado.
3. `aprendizados.json` — lista no formato do `cards_doc.py box` (ver `onda-04/aprendizados.json`), com os campos acima quando pendente.
4. Checagem: `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-NN/cartas.md --no-learning --wave-report --style` (0 erros) e `python3 jogo/tools/cards_doc.py box --json .claude/notas/execucao/onda-NN/aprendizados.json` (sai 0).

## Regras que não mudam

- Kit do GD: `.claude/notas/execucao/kit-gd.md`; especificação: `gestao/prompts/criacao-cartas.md`; formato: `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1; tom: `docs/10_GUIA_DE_ESTILO_E_TOM.md`.
- Nenhuma pessoa real viva nomeada nem acusação nova (RC-08, D-190). Nenhum número ou dado no texto ao jogador.
- Banco de ideias: rascunhos antigos do doc 18 §18.14, as fichas do doc 12 e `gestao/rascunhos/roteiro-cartas-342-eloquent.md` (dados `[não verificado]`, só como ideia, D-193).
- Não editar `docs/17` nem `docs/18`: o fio principal grava com `cards_doc.py insert`.
- Notas incrementais desde o início; retorno ≤ 400 palavras.
