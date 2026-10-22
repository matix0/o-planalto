# Estudo de fontes (Google Fonts) — 2026-10-22

**Pedido do PO:** rodada de estudo de fontes no Google Fonts e qual combina mais com o projeto. **Só estudo: nada foi alterado no jogo.** Decide o PO (governança).

## Como foi feito
- Baixei 25 famílias pela API do Google Fonts (`fonts.googleapis.com/css2`; a página `fonts.google.com` não abre na nuvem) e medi cada uma com `fontTools` (cobertura de caracteres, altura do x, tamanho).
- Renderizei textos reais do jogo sobre as cores do jogo (`#263238`, `#37474F`, ciano `#80DEEA`) em dois quadros: `board_titulos.png` (20 famílias de título) e `board_corpo.png` (12 de corpo).
- Limite: é renderização em imagem, **não** dentro do Godot (o texto do Godot pode variar um pouco). Lexend e Rubik aparecem no quadro de corpo em peso 600/500 (o "normal" não foi baixado), então a comparação delas ali é injusta.

## Critérios do projeto
| # | Critério | Fonte |
| :--- | :--- | :--- |
| 1 | Licença livre (OFL), com crédito | D-140 |
| 2 | Todos os acentos do PT-BR (á ã â ê ç õ …) | — |
| 3 | Setas `← → ↔` (as opções da carta usam, D-202; o radar usa ↔) | `swipe_card.gd`, `radar.gd` |
| 4 | Leitura em celular, 16 a 36 px, texto longo | D-165 |
| 5 | Peso do download no navegador | `/jogar/` |
| 6 | Tom: educativo e político, sem doutrinar, 15 a 30 anos | CLAUDE.md |

## Achados
1. **As fontes são quase todo o download do jogo na web:** o pacote tem 2,3 MB e as fontes ocupam 2,1 MB. O Inter variável (normal + itálico) sozinho tem 1,8 MB.
2. **Todas as 25 têm os acentos do PT-BR.**
3. **Poppins, a fonte de título de hoje, não tem `← → ↔`.** Hoje funciona porque as setas usam o Inter. Qualquer fonte nova de corpo precisa ter as setas (ou as setas viram ícone). Têm as setas: Inter, DM Sans, Plus Jakarta Sans, Archivo, Bitter, Merriweather. Faltam todas em Poppins, Sora, Lexend, Atkinson, Nunito Sans, Public Sans, Rubik, Condensed/Oswald/Bebas, Newsreader, Fraunces.
4. **Altura do x** (maior = mais legível pequeno): Poppins 0,56; Inter 0,55; Plus Jakarta 0,55; Archivo 0,53; DM Sans 0,50; Atkinson 0,50; Newsreader 0,43 (a pior, ruim em 16 px).
5. **Todas têm itálico** no Google Fonts (a citação do final usa itálico).

## Tabela das famílias
| Família | Perfil | Setas | Peso (par normal+negrito) |
| :--- | :--- | :--- | ---: |
| Poppins (hoje, título) | Geométrica, amigável | não | 294 KB |
| Inter (hoje, corpo) | Neutra, muito legível | sim | 635 KB (estática; a variável do jogo tem 1,8 MB) |
| Plus Jakarta Sans | Geométrica moderna, forte nos títulos | sim | 123 KB |
| DM Sans | Geométrica limpa, boa em corpo | sim | 94 KB |
| Archivo | Grotesca de jornal, com gravidade | sim | 217 KB |
| Public Sans | Neutra "institucional" | não | 109 KB |
| Atkinson Hyperlegible Next | Feita para baixa visão | não | 90 KB |
| Figtree | Neutra amigável | só ↔ falta | 70 KB |
| Fraunces / Newsreader | Serifa de jornal | não | 139 / 217 KB |
| Anton / Bebas Neue / Oswald | Condensadas de impacto | não | 54 a 168 KB |

Descartadas por quadro: Sora e Outfit (largas, gastam linha), Baloo 2 e Merriweather (pesadas), condensadas (cansam em texto de 3 linhas e some em 36 px).

## Alternativas (2 a 4, com recomendação)
| | Título + Corpo | Prós | Contras |
| :--- | :--- | :--- | :--- |
| **A. Manter** | Poppins + Inter | Já testado, já aprovado | 1,8 MB só no Inter; segue sem setas no título |
| **B. Moderna e leve** | Plus Jakarta Sans 700/800 + DM Sans | Mesmo clima de hoje; ~220 KB no total (−1,9 MB no download); as duas têm setas e itálico | Pequena mudança de "cara"; DM Sans tem x menor que o Inter |
| **C. Voz de jornal** | Archivo 800 + Archivo (uma família só) | Gravidade de notícia, combina com política; 217 KB; setas ok | Mais sério; menos "jogo" |
| **D. Editorial** | Fraunces 800 (título) + DM Sans (corpo) | Tom de jornal impresso, diferente de todo app | Contraste de estilos; Fraunces não tem setas (corpo cobre) |

**Recomendação: B (Plus Jakarta Sans + DM Sans).** É a menor mudança visual, mantém a leitura de celular, resolve o peso do download e as setas. C é a segunda escolha se o PO quiser um tom mais sério. A decisão de acessibilidade (D-165, texto até 36 px) vale para qualquer uma e precisa de teste.

## Se o PO escolher
1. Baixar os TTFs do Google Fonts (OFL), pôr em `jogo/assets/fonts/` com o `OFL-<fonte>.txt` e atualizar `theme_builder.gd` (`fonts()`), os créditos (`about_screen.gd`) e `docs/14` §14.11.4.
2. Rodar a varredura de telas (`.claude/notas/execucao/ferramentas/varredura-resolucoes.sh`) em 18 e 36 px e a suíte.
3. Registrar a decisão (D-206) e rever `docs/23` (licenças).
