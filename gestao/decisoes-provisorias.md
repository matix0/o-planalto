# Decisões provisórias — P-014 e P-015

Escolhas feitas pelo agente onde as especificações pedem o PO (`gestao/prompts/execucao-p014-p015.md`, seção 2). Cada linha vale até o PO aprovar ou reverter no fim. As aprovadas viram D-xxx no `/fechar-plano`; nenhuma D-xxx é criada aqui.

Cartas e Aprendizados aprovados por uma DP ficam marcados "provisório (DP-nnn)" no doc 17 e no doc 18.

| DP | Data | Pergunta | Alternativas | Escolhida | Por quê | Arquivos afetados | Como reverter |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| DP-001 | 2026-10-20 | As 40 cartas fictícias ganham `quem_fala` ou a regra vale só para o conteúdo real? (`gestao/prompts/correcoes-p014.md` etapa 2) | A) preencher nas 40 e nas 5 da cena, por script · B) regra só para o conteúdo real (exceção pela marca "[Fictício]") · C) aviso em vez de erro até a migração | A. Valores: instituição do modo (institucionais e temáticas), o ator dono (cartas ATOR), Câmara dos Deputados (fases 1-3) e Senado Federal (fases 4-5) na cena; opções da cena encurtadas para ≤ 25 caracteres | O validador fica igual para todos e o conteúdo real entra sem exceção. Na tela, institucionais e ATOR mostram o mesmo nome de antes; as temáticas deixam de mostrar "[quem fala — a definir]". As fictícias saem na migração (D-135) | `jogo/data/cards.json`, `jogo/data/impeachment.json`, `jogo/scripts/game_data.gd`, `jogo/tests/test_data.gd`, `jogo/tests/test_core_cards_draw.gd` | Reverter os dois JSON ao commit anterior e trocar o erro "missing speaker" por aviso em `game_data.gd` |
