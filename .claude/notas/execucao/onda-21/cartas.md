# Onda 21 do P-015 — Temáticas de Meio Ambiente (THEM-011 a THEM-020) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO — modo D-196 (`.claude/notas/execucao/brief-d196.md`): sem web, sem PSI; toda carta `pendente de revisão (D-196)`; Aprendizados "em conferência (P-016)".
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1; THEM-001 (§17.12) como modelo. Bloco de IDs e chave `theme` conforme DP-013 e `jogo/tools/cards_doc.py:39-41`.

## Progresso

- [x] Brief, kit, DP-011 a DP-017, THEM-001, Onda 5 e Onda 14 (formato), títulos do doc 17 e das ondas 1-14 (para não repetir), THEM do rascunho eloquent (só ideia)
- [x] Plano · [x] Cartas · [x] Aprendizados (md e json) · [x] Checagens

## Convenções desta onda

- Um mecanismo por carta; o `Modo` é a arena do dilema (DP-013), tema em ≥ 3 modos, sem o modo Impeachment.
- Evitados temas já escritos: Marco Temporal, ocupação × despejo (THEM-001), juros do Plano Safra, título no assentamento, estrada até a fazenda, isenção de agrotóxico, anistia ambiental, pena ambiental, multa trocada por plantio, carro-pipa × cisterna, fila do Bolsa Família, cesta básica com culto.
- Diplomacia conforme o kit §4. Nenhum número, dado ou pessoa real no texto ao jogador; fatos na pista de dado (`aprendizados.md`).

---

### THEM-011 — Petróleo na foz do rio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Petróleo na foz do rio |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Meio Ambiente |
| **Quem fala** | Ibama |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Verde |
| **Problema** | A estatal quer furar um poço de petróleo perto da foz de um grande rio. Parceiros do clima pedem que o país desista. |
| **Opção A** | Liberar a perfuração |
| **Efeitos A** | `Caixa` +15, `Soberania` +5, `Legitimidade` -10 |
| **Consequência A** | "A sonda começa a furar. Parceiros do clima cobram coerência." |
| **Eixo A** | [0, -1, 0, -1] |
| **Atores A** | `ACT-018` -1 |
| **Evento A** | "Um vazamento atinge a costa e os pescadores" · atraso 2 · `Dignidade` -10, `Legitimidade` -5 |
| **Opção B** | Barrar o poço |
| **Efeitos B** | `Legitimidade` +5, `Consciência` +5, `Caixa` -15 |
| **Consequência B** | "O poço fica no papel. Estados da região perdem a receita esperada." |
| **Eixo B** | [0, +1, 0, +1] |
| **Atores B** | `ACT-018` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-011 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-011):** Diplomacia −1 na A (autonomia diante dos parceiros do clima), +1 na B (cooperação). Evento sem número.

### THEM-012 — Fundo da floresta

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fundo da floresta |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Meio Ambiente |
| **Quem fala** | Itamaraty |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Preto |
| **Problema** | Países doadores oferecem verba para proteger a floresta. Em troca, pedem metas e auditoria externa. |
| **Opção A** | Aceitar a auditoria |
| **Efeitos A** | `Caixa` +10, `Legitimidade` +5, `Soberania` -10 |
| **Consequência A** | "A verba chega. Militares dizem que estrangeiros mandam na Amazônia." |
| **Eixo A** | [0, +2, 0, 0] |
| **Atores A** | `ACT-018` +1, `ACT-021` +1, `ACT-008` -1 |
| **Evento A** | — |
| **Opção B** | Recusar o controle |
| **Efeitos B** | `Soberania` +10, `Caixa` -10, `Legitimidade` -5 |
| **Consequência B** | "O país mantém o controle total. A fiscalização fica sem dinheiro." |
| **Eixo B** | [0, -2, 0, 0] |
| **Atores B** | `ACT-008` +1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-012 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-012):** Diplomacia ±2. Não repete a INST de vacinas nem a de ajuda militar (Onda 4).

### THEM-013 — Licença por autodeclaração

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Licença por autodeclaração |
| **Tipo** | Temática |
| **Modo** | Congresso |
| **Tema** | Meio Ambiente |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Um projeto cria licença ambiental por autodeclaração para obras médias. Empreiteiras celebram; técnicos falam em risco de desastre. |
| **Opção A** | Vetar a autodeclaração |
| **Efeitos A** | `Integridade` +10, `Segurança` +5, `Capital Político` -15 |
| **Consequência A** | "O veto sai. As empreiteiras prometem derrubá-lo no Congresso." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-003` -1, `ACT-018` +1 |
| **Evento A** | — |
| **Opção B** | Sancionar o projeto |
| **Efeitos B** | `Capital Político` +10, `Caixa` +5, `Segurança` -10 |
| **Consequência B** | "As obras andam mais rápido. Os técnicos perdem o poder de barrar." |
| **Eixo B** | [+2, 0, 0, -1] |
| **Atores B** | `ACT-003` +1, `ACT-018` -1 |
| **Evento B** | "Uma barragem licenciada às pressas se rompe" · atraso 2 · `Dignidade` -15, `Legitimidade` -10 |
| **Aprendizado** | APR-THEM-013 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-013):** Mecanismo: autolicenciamento. Não repete a INST-008 (pena) nem a INST-133 (anistia).

### THEM-014 — Bairro na beira do rio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Bairro na beira do rio |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Meio Ambiente |
| **Quem fala** | Ministério das Cidades |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Uma enchente alaga bairros na beira do rio. Dá para reconstruir as casas no mesmo lugar ou reassentar as famílias longe da água. |
| **Opção A** | Reassentar com moradia |
| **Efeitos A** | `Dignidade` +10, `Segurança` +10, `Caixa` -20 |
| **Consequência A** | "As famílias ganham casa segura. Muitas perdem o trabalho perto de casa." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-016` +1 |
| **Evento A** | — |
| **Opção B** | Reconstruir no local |
| **Efeitos B** | `Capital Político` +10, `Caixa` -5, `Segurança` -10 |
| **Consequência B** | "As casas voltam rápido. O rio segue no mesmo lugar." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-003` +1 |
| **Evento B** | "A enchente volta e atinge os mesmos bairros" · atraso 2 · `Segurança` -10, `Dignidade` -10 |
| **Aprendizado** | APR-THEM-014 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-014):** Ano 2: carta ligada a Dignidade+ e Segurança+. Sem número no texto.

### THEM-015 — Fogo no Cerrado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fogo no Cerrado |
| **Tipo** | Temática |
| **Modo** | Prisional e Policial |
| **Tema** | Meio Ambiente |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Incêndios criminosos avançam no Cerrado. Militares querem o comando; brigadistas locais pedem verba e contratos fixos. |
| **Opção A** | Brigadas permanentes |
| **Efeitos A** | `Segurança` +10, `Dignidade` +5, `Caixa` -10 |
| **Consequência A** | "Os brigadistas ganham contrato. Os militares se queixam de perder espaço." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-009` +1, `ACT-008` -1 |
| **Evento A** | — |
| **Opção B** | Mandar o Exército |
| **Efeitos B** | `Segurança` +5, `Capital Político` +10, `Caixa` -10, `Legitimidade` -5 |
| **Consequência B** | "As tropas chegam. Saem quando a fumaça baixa." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-008` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-015 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-015):** Ano 2: Segurança+ ligada. Afirmação "maior parte do fogo é posta por gente" vai para a pista (INPE).

### THEM-016 — Pacto contra a soja desmatada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pacto contra a soja desmatada |
| **Tipo** | Temática |
| **Modo** | Bancadas |
| **Tema** | Meio Ambiente |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Amarelo |
| **Problema** | Grandes compradores prometem não comprar soja de área desmatada. A bancada do agro quer punir as empresas do pacto. |
| **Opção A** | Defender o pacto |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` -15, `Caixa` -5 |
| **Consequência A** | "O pacto segue. Os exportadores mantêm os clientes de fora." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-018` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Punir as empresas |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` -10, `Soberania` -5 |
| **Consequência B** | "A bancada comemora. Compradores de fora desconfiam da soja do país." |
| **Eixo B** | [+1, -1, 0, -1] |
| **Atores B** | `ACT-001` +1, `ACT-018` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-016 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-016):** Diplomacia +1 na A (mercado externo), −1 na B. Título com 5 palavras.

### THEM-017 — Fim do lixão

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fim do lixão |
| **Tipo** | Temática |
| **Modo** | Emendas |
| **Tema** | Meio Ambiente |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 3 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Prefeitos usam emendas para adiar o fim dos lixões. Catadores temem perder a renda com a usina nova. |
| **Opção A** | Usina com cooperativas |
| **Efeitos A** | `Dignidade` +10, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "O lixão fecha. Os catadores viram cooperados da usina." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-011` -1, `ACT-015` +1 |
| **Evento A** | — |
| **Opção B** | Adiar o fim dos lixões |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Segurança` -5 |
| **Consequência B** | "Os prefeitos agradecem. O chorume segue no lençol de água." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-017 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-017):** Ano 3: Dignidade+ ligada. `ACT-015` como aproximação dos catadores organizados (não há ator próprio).

### THEM-018 — Clima na sala de aula

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Clima na sala de aula |
| **Tipo** | Temática |
| **Modo** | Currículo e Mídia |
| **Tema** | Meio Ambiente |
| **Quem fala** | Ministério da Educação |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Um canal diz que a crise do clima é invenção. É falso. Escolas pedem material sobre o tema; a oposição fala em doutrinação. |
| **Opção A** | Lançar o material |
| **Efeitos A** | `Consciência` +15, `Capital Político` -10 |
| **Consequência A** | "O material chega às escolas. A oposição pede CPI do livro didático." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-013` +1, `ACT-022` -1 |
| **Evento A** | — |
| **Opção B** | Engavetar o material |
| **Efeitos B** | `Capital Político` +5, `Consciência` -10 |
| **Consequência B** | "A polêmica esfria. Os alunos aprendem o tema pelo canal." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-013` -1, `ACT-022` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-018 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-018):** Mito difundido com "É falso" na carta (kit §5). Não repete as INST de livro didático e Escola sem Partido.

### THEM-019 — Hidrelétrica e ribeirinhos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Hidrelétrica e ribeirinhos |
| **Tipo** | Temática |
| **Modo** | Judiciário |
| **Tema** | Meio Ambiente |
| **Quem fala** | Justiça Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Vermelho |
| **Problema** | Ribeirinhos pedem na Justiça para parar uma hidrelétrica. Sem ela, falta energia barata no plano de expansão. |
| **Opção A** | Consultar as comunidades |
| **Efeitos A** | `Dignidade` +10, `Legitimidade` +5, `Caixa` -10 |
| **Consequência A** | "A obra para até a consulta. O setor elétrico fala em apagão." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-018` +1, `ACT-003` -1 |
| **Evento A** | — |
| **Opção B** | Recorrer pela obra |
| **Efeitos B** | `Caixa` +10, `Soberania` +5, `Dignidade` -10 |
| **Consequência B** | "A obra segue. As famílias deixam as margens do rio." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-003` +1, `ACT-018` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-019 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-019):** Mecanismo: consulta prévia. Sem evento.

### THEM-020 — Taxa sobre o carbono

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxa sobre o carbono |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Meio Ambiente |
| **Quem fala** | Ministério da Fazenda |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | Uma taxa sobre carbono encarece o diesel. A receita pagaria energia limpa; caminhoneiros ameaçam greve. |
| **Opção A** | Criar a taxa |
| **Efeitos A** | `Caixa` +10, `Capital Político` -10, `Dignidade` -5 |
| **Consequência A** | "A taxa entra em vigor. O frete sobe junto com o diesel." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-006` +1 |
| **Evento A** | "Caminhoneiros param as estradas" · atraso 1 · `Segurança` -10, `Caixa` -5 |
| **Opção B** | Isentar o diesel |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10 |
| **Consequência B** | "Os caminhoneiros recuam. A conta do clima fica para depois." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-018` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-020 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-020):** Diplomacia +1 na A (padrão internacional). Mecanismo: precificação de carbono.

## Relatório do script

Ver o retorno do GD (check com `--wave-report --style` e `box`).

## Propostas ao PO

- Cartas em modo D-196: dados e leis da pista ficam `[não verificado]` até o P-016.

## Dúvidas ao PSI (para quando voltar)

- Temas do aviso de conteúdo: violência no campo (THEM-002), facção e fome (THEM-028): sem detalhe gráfico; conferir.
