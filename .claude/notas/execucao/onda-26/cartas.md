# Onda 26 do P-015 — temáticas de Cultura (THEM-061 a THEM-070) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo D-196** (`.claude/notas/execucao/brief-d196.md`)
**Status:** CONCLUÍDO (2026-10-22) — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1; tema e bloco de IDs pela DP-013 (`gestao/decisoes-provisorias.md:21`; `jogo/tools/cards_doc.py:39-41`). Modelo: THEM-001 (`docs/17_ROTEIRO_DAS_CARTAS.md:5040`).
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-26/cartas.md --no-learning --wave-report --style`

## Progresso

- [x] Brief D-196, kit, DP-011 a DP-017, §17.12, `cards_doc.py` (THEMES, THEME_BLOCKS, checagens de estilo)
- [x] Títulos de todo o doc 17 e das ondas 1-16 listados para não repetir dilema (`onda-20..22` ainda não existiam ao começar)
- [x] Plano (mecanismo, modo, cores, eventos, anos) · [x] 10 cartas · [x] check 0 erros/0 avisos · [x] aprendizados (md + json) · [x] box sai 0

## Convenções desta onda

- Tema Cultura (bloco THEM-061..070, `culture`). Modos: Orçamento (061, 068), Geopolítico (062, 069), Emendas (063, 070), Prisional e Policial (064), Currículo e Mídia (065), Judiciário (066), Bancadas (067).

- Modo de cada carta = arena do dilema (DP-013); nenhuma no Impeachment nem no Influenciador (exigiria Técnica e Reação).
- Nenhum número, dado nem pessoa real no texto ao jogador; fatos ficam na pista de dado do Aprendizado (D-091, RC-08).

---

### THEM-061 — Quem escolhe o patrocínio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Quem escolhe o patrocínio |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Cultura |
| **Quem fala** | Ministério da Cultura |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Roxo |
| **Problema** | Na lei de incentivo, as empresas escolhem quem patrocinar com imposto devido. Quase tudo vai para as capitais. |
| **Opção A** | Fundo por editais |
| **Efeitos A** | `Consciência` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "O dinheiro vai a artistas de todo o país. Grandes produtoras reclamam." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-019` +1, `ACT-004` -1 |
| **Evento A** | — |
| **Opção B** | Empresas escolhem |
| **Efeitos B** | `Capital Político` +5, `Consciência` -10, `Integridade` -5 |
| **Consequência B** | "As empresas seguem com quem dá vitrine. O interior fica sem." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-004` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-061 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-061):** Renúncia fiscal na cultura; não repete INST-028 (edital na gaveta), INST-117 (teto de shows) nem INST-134 (repasse fixo).

### THEM-062 — Streaming estrangeiro

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Streaming estrangeiro |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Cultura |
| **Quem fala** | `ACT-021` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Plataformas de streaming estrangeiras não pagam a taxa do cinema nacional. Um projeto cria taxa e cota de conteúdo brasileiro. |
| **Opção A** | Cota e taxa |
| **Efeitos A** | `Soberania` +10, `Consciência` +5, `Capital Político` -5 |
| **Consequência A** | "As plataformas investem em filmes daqui. O governo dos EUA reclama." |
| **Eixo A** | [0, -1, 0, +1] |
| **Atores A** | `ACT-021` -1, `ACT-019` +1 |
| **Evento A** | "Os EUA ameaçam retaliar o audiovisual brasileiro." · atraso 1 · `Caixa` -10 |
| **Opção B** | Deixar livre |
| **Efeitos B** | `Caixa` +5, `Soberania` -10, `Consciência` -5 |
| **Consequência B** | "Nada muda. As telas seguem cheias de séries de fora." |
| **Eixo B** | [+1, +1, 0, -1] |
| **Atores B** | `ACT-021` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-062 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-062):** Soberania cultural e regulação do streaming. Diplomacia ±1; `ACT-021` reage como no kit §4. Evento em A.

### THEM-063 — Museu sem manutenção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Museu sem manutenção |
| **Tipo** | Temática |
| **Modo** | Emendas |
| **Tema** | Cultura |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Preto |
| **Problema** | Um museu nacional tem fiação velha e nenhuma brigada. Os deputados preferem emendas para obras com placa. |
| **Opção A** | Emendas para o museu |
| **Efeitos A** | `Consciência` +10, `Segurança` +5, `Capital Político` -10 |
| **Consequência A** | "O museu ganha brigada e reforma. Deputados perdem verba de vitrine." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Leiloar o prédio |
| **Efeitos B** | `Caixa` +10, `Consciência` -10, `Capital Político` +5 |
| **Consequência B** | "O prédio é vendido. O acervo vai para um depósito." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-003` +1 |
| **Evento B** | "A fiação do depósito falha e parte do acervo se perde." · atraso 2 · `Consciência` -10 |
| **Aprendizado** | APR-THEM-063 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-063):** Patrimônio e prevenção. Evento em B: o risco do abandono. Sem nomear museu real.

### THEM-064 — Grafite ou pichação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Grafite ou pichação |
| **Tipo** | Temática |
| **Modo** | Prisional e Policial |
| **Tema** | Cultura |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Prefeituras apagam murais e prendem jovens que pintam muros. Grafiteiros pedem espaços liberados. |
| **Opção A** | Liberar muros |
| **Efeitos A** | `Consciência` +5, `Dignidade` +5, `Segurança` +5, `Capital Político` -10 |
| **Consequência A** | "Muros viram galeria a céu aberto. Parte dos moradores reclama." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Prender pichadores |
| **Efeitos B** | `Segurança` +5, `Consciência` -10, `Dignidade` -5 |
| **Consequência B** | "Jovens são presos por grafite. Os muros voltam a ficar cinza." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-019` -1 |
| **Evento B** | "Murais famosos são apagados na cidade." · atraso 1 · `Consciência` -10 |
| **Aprendizado** | APR-THEM-064 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-064):** Arte de rua e criminalização da juventude; não repete INST-200 (pânico contra o funk), que é técnica de desinformação. Ano 2, carta ligada a Dignidade e Segurança.

### THEM-065 — Arte na grade

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Arte na grade |
| **Tipo** | Temática |
| **Modo** | Currículo e Mídia |
| **Tema** | Cultura |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | A reforma da grade escolar corta artes e música para dar mais aulas de português e matemática. |
| **Opção A** | Música e arte na grade |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5, `Caixa` -10 |
| **Consequência A** | "Escolas contratam professores de arte. Sobram menos horas para provas." |
| **Eixo A** | [-1, 0, +1, +1] |
| **Atores A** | `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Mais horas de prova |
| **Efeitos B** | `Capital Político` +5, `Consciência` -10, `Integridade` -5 |
| **Consequência B** | "As notas sobem um pouco. A arte some da escola." |
| **Eixo B** | [+1, 0, -1, 0] |
| **Atores B** | `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-065 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-065):** Lugar das artes no currículo; não repete INST-041 (filosofia e sociologia). Ano 2, carta ligada a Consciência e Dignidade.

### THEM-066 — IA copia artistas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | IA copia artistas |
| **Tipo** | Temática |
| **Modo** | Judiciário |
| **Tema** | Cultura |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Preto |
| **Problema** | Empresas de IA treinam programas com obras de artistas brasileiros sem pedir nem pagar. Os artistas vão à Justiça. |
| **Opção A** | Pagar aos artistas |
| **Efeitos A** | `Soberania` +10, `Consciência` +5, `Capital Político` -5 |
| **Consequência A** | "As big techs pagam pelas obras usadas. Elas ameaçam sair do país." |
| **Eixo A** | [0, -1, 0, +1] |
| **Atores A** | `ACT-019` +1, `ACT-020` -1 |
| **Evento A** | — |
| **Opção B** | Liberar o treino |
| **Efeitos B** | `Caixa` +5, `Soberania` -10, `Dignidade` -5 |
| **Consequência B** | "As empresas treinam IA com tudo. Artistas perdem trabalho." |
| **Eixo B** | [+1, +1, 0, -1] |
| **Atores B** | `ACT-020` +1, `ACT-019` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-066 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-066):** Direito autoral e IA generativa; não repete INST-019 (destaque na lei da IA, processo legislativo). Diplomacia ±1 (empresas estrangeiras).

### THEM-067 — Exposição sob ataque

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Exposição sob ataque |
| **Tipo** | Temática |
| **Modo** | Bancadas |
| **Tema** | Cultura |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Laranja |
| **Problema** | Uma bancada pede o fechamento de uma exposição num museu público, que chama de imoral. A curadoria diz que é censura. |
| **Opção A** | Manter a exposição |
| **Efeitos A** | `Consciência` +5, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "A mostra fica aberta. A bancada promete retaliar." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Fechar a mostra |
| **Efeitos B** | `Capital Político` +10, `Consciência` -10, `Legitimidade` -5 |
| **Consequência B** | "A exposição fecha. Outros museus cancelam mostras." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-019` -1 |
| **Evento B** | "Artistas cancelam obras por medo de ataque." · atraso 2 · `Consciência` -10 |
| **Aprendizado** | APR-THEM-067 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-067):** Liberdade artística e censura; não repete INST-051 (documentário sobre a ditadura). Evento em B: autocensura. Sem opor fé à arte (nenhum ator religioso).

### THEM-068 — Jogos feitos aqui

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Jogos feitos aqui |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Cultura |
| **Quem fala** | Ministério da Cultura |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Jovens jogam muito, mas quase nenhum jogo é feito no Brasil. Você pode criar um fundo nacional ou atrair estúdios estrangeiros. |
| **Opção A** | Fundo para games |
| **Efeitos A** | `Soberania` +10, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "Estúdios brasileiros lançam jogos. Críticos dizem que é gasto com diversão." |
| **Eixo A** | [-1, -1, 0, +1] |
| **Atores A** | `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Isentar estúdios de fora |
| **Efeitos B** | `Caixa` +5, `Soberania` -10, `Consciência` -5 |
| **Consequência B** | "Grandes estúdios abrem filiais. Os jogos seguem pensados lá fora." |
| **Eixo B** | [+1, +1, 0, -1] |
| **Atores B** | `ACT-021` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-068 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-068):** Indústria criativa e soberania. Diplomacia ±1.

### THEM-069 — Manto na Europa

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Manto na Europa |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Cultura |
| **Quem fala** | Ministério dos Povos Indígenas |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Roxo |
| **Problema** | Um museu europeu guarda um manto sagrado indígena levado no tempo colonial. O povo de origem pede a devolução. |
| **Opção A** | Pedir a devolução |
| **Efeitos A** | `Consciência` +10, `Soberania` +5, `Capital Político` -5 |
| **Consequência A** | "O manto volta ao Brasil. O museu europeu cobra a viagem." |
| **Eixo A** | [0, -1, +1, 0] |
| **Atores A** | `ACT-010` +1 |
| **Evento A** | — |
| **Opção B** | Aceitar um empréstimo |
| **Efeitos B** | `Capital Político` +5, `Consciência` -5, `Soberania` -5 |
| **Consequência B** | "O manto vem por um ano e volta. Os indígenas protestam." |
| **Eixo B** | [0, +1, 0, 0] |
| **Atores B** | `ACT-010` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-069 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-069):** Repatriação e patrimônio. Ano 2, carta ligada a Consciência. Diplomacia −1 em A (reivindicar), +1 em B (acordo com a instituição estrangeira). `ACT-010` prefere o pedido formal; inferência do GD.

### THEM-070 — Vale-cultura jovem

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vale-cultura jovem |
| **Tipo** | Temática |
| **Modo** | Emendas |
| **Tema** | Cultura |
| **Quem fala** | Ministério da Cultura |
| **Ano mínimo** | 2 |
| **Cor A** | Laranja |
| **Cor B** | Verde |
| **Problema** | Quase não há cinema nem teatro nos bairros periféricos. Um projeto dá um vale-cultura a jovens de baixa renda. |
| **Opção A** | Vale-cultura jovem |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5, `Caixa` -15 |
| **Consequência A** | "Jovens da periferia vão a cinema e teatro. O gasto pesa no caixa." |
| **Eixo A** | [-1, 0, +1, +1] |
| **Atores A** | `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Cinema no shopping |
| **Efeitos B** | `Caixa` +5, `Consciência` -10, `Capital Político` +5 |
| **Consequência B** | "As salas ficam onde já estão. O bairro segue sem cinema." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-006` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-070 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-070):** Acesso à cultura; não repete INST-059 (bibliotecas de bairro) nem INST-048 (rádio comunitária). Ano 2, carta ligada a Dignidade e Consciência. Sem estereótipo de periferia: o problema é a falta de salas.

## Relatório da onda (script)

`check ... --no-learning --wave-report --style` → 10 cartas, 0 erros, 0 avisos de estilo (saída 0). `box --json` → saída 0. Metas: 4 eventos (062 A, 063 B, 064 B, 067 B) · Diplomacia 8 · Sociedade 8 · Dignidade+ com Ano 2-4: 3 · Segurança+ com Ano 2-4: 2 · 7 cores. Os avisos de Técnica do Influenciador vêm de checar só a onda (sem cartas do modo).

## Propostas ao PO (provisórias)

1. THEM-069 nomeia o caso só na pista (manto tupinambá); o texto ao jogador fica genérico.
2. THEM-063 sem nomear museu real; o incêndio de 2018 fica na pista.

## Dúvidas para o PSI (quando houver revisão)

- THEM-067 (exposição chamada de imoral): conferir se não sugere grupo religioso; THEM-064 (prisão de jovens grafiteiros).

## Autoconferência

- Bloco Cultura THEM-061..070 `jogo/tools/cards_doc.py:41`; `ACT-021` ±1 `.claude/notas/execucao/kit-gd.md` §4; DP-013 `gestao/decisoes-provisorias.md:21`; caixa pendente `jogo/tools/cards_doc.py:462`; THEM-001 `docs/17_ROTEIRO_DAS_CARTAS.md:5040` — conferidos.
