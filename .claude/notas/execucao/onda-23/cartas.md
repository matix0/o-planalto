# Onda 23 do P-015 — temáticas de Saúde (THEM-031 a THEM-040) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo D-196** (`.claude/notas/execucao/brief-d196.md`)
**Status:** CONCLUÍDO (2026-10-22) — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1; tema e bloco de IDs pela DP-013 (`gestao/decisoes-provisorias.md:21`; `jogo/tools/cards_doc.py:39-41`). Modelo: THEM-001 (`docs/17_ROTEIRO_DAS_CARTAS.md:5040`).
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-23/cartas.md --no-learning --wave-report --style`

## Progresso

- [x] Brief D-196, kit, DP-011 a DP-017, §17.12, `cards_doc.py` (THEMES, THEME_BLOCKS, checagens de estilo)
- [x] Títulos de todo o doc 17 e das ondas 1-16 listados para não repetir dilema (`onda-20..22` ainda não existiam ao começar)
- [x] Plano (mecanismo, modo, cores, eventos, anos) · [x] 10 cartas · [x] check 0 erros/0 avisos · [x] aprendizados (md + json) · [x] box sai 0

## Convenções desta onda

- Tema Saúde (bloco THEM-031..040, `health`). Modos: Geopolítico (031, 033), Judiciário (032, 039), Orçamento (034), Currículo e Mídia (035), Congresso (036, 040), Emendas (037), Prisional e Policial (038).

- Modo de cada carta = arena do dilema (DP-013); nenhuma no Impeachment nem no Influenciador (exigiria Técnica e Reação).
- Nenhum número, dado nem pessoa real no texto ao jogador; fatos ficam na pista de dado do Aprendizado (D-091, RC-08).

---

### THEM-031 — Remédio com patente

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Remédio com patente |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Saúde |
| **Quem fala** | Ministério da Saúde |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Um remédio novo para uma doença comum custa caro demais para o SUS. O laboratório estrangeiro não aceita baixar o preço. |
| **Opção A** | Licenciar a patente |
| **Efeitos A** | `Soberania` +15, `Dignidade` +10, `Capital Político` -10 |
| **Consequência A** | "O remédio sai pela metade do preço. O governo dos EUA reclama." |
| **Eixo A** | [0, -1, 0, +1] |
| **Atores A** | `ACT-021` -1, `ACT-006` -1 |
| **Evento A** | "Os EUA põem o Brasil numa lista de vigilância comercial." · atraso 1 · `Caixa` -10 |
| **Opção B** | Pagar o preço da patente |
| **Efeitos B** | `Caixa` -20, `Dignidade` -5, `Capital Político` +5 |
| **Consequência B** | "O laboratório estrangeiro mantém o preço. A fila do remédio cresce." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-021` +1, `ACT-006` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-031 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-031):** Licença compulsória (quebra de patente) como mecanismo; não repete INST-076 (acesso a vacinas na pandemia, fila de compra). Diplomacia −1 em A (autonomia) e +1 em B (aceitar a regra do parceiro), kit §4. `ACT-021` −1 ao recusar a potência.

### THEM-032 — Plano nega o tratamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Plano nega o tratamento |
| **Tipo** | Temática |
| **Modo** | Judiciário |
| **Tema** | Saúde |
| **Quem fala** | Supremo Tribunal Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Planos de saúde negam terapias que não estão numa lista oficial. O STF julga se a lista é fechada ou só um mínimo. |
| **Opção A** | Obrigar a cobertura |
| **Efeitos A** | `Dignidade` +10, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "O plano cobre o tratamento. As operadoras falam em reajuste." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Manter a lista fechada |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "A lista vale como está. Famílias voltam para a fila do SUS." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-006` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-032 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-032):** Rol da ANS (taxativo × exemplificativo) e o papel do STF; o governo opina no julgamento. Sem evento: o dilema é a regra.

### THEM-033 — Médicos de outro país

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Médicos de outro país |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Saúde |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Milhares de cidades do interior não têm médico. Um acordo traria médicos de outro país, sem a prova de revalidação. |
| **Opção A** | Trazer médicos de fora |
| **Efeitos A** | `Dignidade` +15, `Capital Político` -10, `Integridade` -5 |
| **Consequência A** | "Cidades sem médico ganham atendimento. Conselhos médicos protestam." |
| **Eixo A** | [0, +1, 0, +1] |
| **Atores A** | `ACT-014` -1 |
| **Evento A** | — |
| **Opção B** | Abrir cursos privados |
| **Efeitos B** | `Caixa` -5, `Capital Político` +10, `Dignidade` -5 |
| **Consequência B** | "Novas faculdades abrem. Os formados preferem as capitais." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-005` +1, `ACT-014` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-033 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-033):** Cooperação internacional (Diplomacia +1) × expansão do ensino privado. `ACT-014` como quem fala (profissionais da saúde, doc 11). Integridade −5 em A pela dispensa da revalidação.

### THEM-034 — Fila de cirurgias

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fila de cirurgias |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Saúde |
| **Quem fala** | Ministério da Saúde |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Vermelho |
| **Problema** | A fila de cirurgias eletivas dobrou. Você pode comprar vagas em hospitais privados ou ampliar a rede pública. |
| **Opção A** | Pagar hospital privado |
| **Efeitos A** | `Dignidade` +10, `Caixa` -15, `Soberania` -5 |
| **Consequência A** | "A fila anda rápido. O dinheiro público vai para hospitais privados." |
| **Eixo A** | [+1, 0, 0, -1] |
| **Atores A** | `ACT-006` +1 |
| **Evento A** | — |
| **Opção B** | Abrir leitos públicos |
| **Efeitos B** | `Caixa` -20, `Dignidade` +5, `Capital Político` -5 |
| **Consequência B** | "As obras começam. A fila espera os novos leitos." |
| **Eixo B** | [-1, 0, 0, +1] |
| **Atores B** | `ACT-009` +1 |
| **Evento B** | "Os novos leitos públicos abrem e a fila anda." · atraso 2 · `Dignidade` +15 |
| **Aprendizado** | APR-THEM-034 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-034):** Complementaridade do SUS com o privado × rede própria. Ano 2: pressupõe um ano de fila; carta ligada a Dignidade (meta do kit). Evento positivo em B com atraso 2.

### THEM-035 — Psicólogo na escola

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Psicólogo na escola |
| **Tipo** | Temática |
| **Modo** | Currículo e Mídia |
| **Tema** | Saúde |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | Crescem as crises de ansiedade entre estudantes. Uma empresa oferece um aplicativo de terapia no lugar de psicólogos. |
| **Opção A** | Psicólogo em cada escola |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Caixa` -15 |
| **Consequência A** | "As escolas ganham psicólogos. Os estados pedem verba." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Aplicativo de terapia |
| **Efeitos B** | `Caixa` -5, `Dignidade` -5, `Integridade` -5 |
| **Consequência B** | "Os alunos ganham um aplicativo. Os dados vão para a empresa." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-020` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-035 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-035):** Saúde mental de jovens; não repete INST-035 (CAPS ou internação). Ano 2: carta ligada a Dignidade. `ACT-020` como a big tech que hospeda a solução; dado de saúde é sensível (Integridade −5).

### THEM-036 — Cigarro eletrônico

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cigarro eletrônico |
| **Tipo** | Temática |
| **Modo** | Congresso |
| **Tema** | Saúde |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Um projeto libera a venda de cigarro eletrônico com imposto. Médicos dizem que o produto vicia adolescentes. |
| **Opção A** | Manter a proibição |
| **Efeitos A** | `Dignidade` +5, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "A venda segue proibida. O vape segue à venda nas redes." |
| **Eixo A** | [0, 0, -1, +1] |
| **Atores A** | `ACT-014` +1 |
| **Evento A** | — |
| **Opção B** | Liberar e taxar |
| **Efeitos B** | `Caixa` +15, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "O vape vira produto legal. A propaganda chega aos adolescentes." |
| **Eixo B** | [+1, 0, +1, -1] |
| **Atores B** | `ACT-022` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-036 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-036):** Regular ou proibir um produto nocivo. Sociedade −1 em A (Estado restringe escolha) e +1 em B. `ACT-022` +1 em B: o coach digital vende o estilo de vida.

### THEM-037 — Agentes ou ambulâncias

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Agentes ou ambulâncias |
| **Tipo** | Temática |
| **Modo** | Emendas |
| **Tema** | Saúde |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | A dengue volta a crescer. Deputados querem gastar a verba em ambulâncias com seu nome, não em agentes de saúde. |
| **Opção A** | Contratar agentes |
| **Efeitos A** | `Dignidade` +10, `Caixa` -10, `Capital Político` -10 |
| **Consequência A** | "Agentes visitam as casas. Os deputados perdem a vitrine." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | "Os agentes acham focos do mosquito antes da epidemia." · atraso 1 · `Segurança` +10 |
| **Opção B** | Ambulância do deputado |
| **Efeitos B** | `Capital Político` +15, `Integridade` -10, `Dignidade` -5 |
| **Consequência B** | "As ambulâncias chegam com adesivo. Ninguém visita as casas." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-037 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-037):** Atenção básica e prevenção × obra visível; não repete INST-120 (hospital sem médicos) nem INST-112 (exame na clínica do deputado). Evento positivo em A mostra que a prevenção aparece depois.

### THEM-038 — Tuberculose no presídio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Tuberculose no presídio |
| **Tipo** | Temática |
| **Modo** | Prisional e Policial |
| **Tema** | Saúde |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Vermelho |
| **Problema** | A tuberculose se espalha num presídio lotado. Tratar os presos custa caro e rende críticas. |
| **Opção A** | Mutirão de saúde |
| **Efeitos A** | `Dignidade` +10, `Segurança` +5, `Capital Político` -10 |
| **Consequência A** | "Equipes tratam os presos. Políticos dizem que preso tem regalia." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-014` +1 |
| **Evento A** | — |
| **Opção B** | Isolar sem tratar |
| **Efeitos B** | `Caixa` +5, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "Os doentes ficam numa ala isolada. A doença segue sem remédio." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | — |
| **Evento B** | "A doença sai do presídio com os visitantes." · atraso 2 · `Dignidade` -10 |
| **Aprendizado** | APR-THEM-038 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-038):** Saúde prisional como saúde pública; não repete INST-081 (superlotação) nem INST-098 (presas grávidas). Evento em B: a doença não respeita o muro. Sem detalhe de sofrimento.

### THEM-039 — Remédio pela Justiça

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Remédio pela Justiça |
| **Tipo** | Temática |
| **Modo** | Judiciário |
| **Tema** | Saúde |
| **Quem fala** | Advocacia-Geral da União |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | Um juiz manda o SUS pagar um remédio caríssimo para uma criança. O valor sai de outros programas. |
| **Opção A** | Pagar o remédio |
| **Efeitos A** | `Dignidade` +10, `Legitimidade` +5, `Caixa` -20 |
| **Consequência A** | "A criança recebe o remédio. Outro programa perde verba." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Recorrer da decisão |
| **Efeitos B** | `Caixa` +10, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "O governo recorre. A família vai às redes contra você." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-039 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-039):** Judicialização da saúde: o dilema é a escolha entre um caso e a política para todos. Atores mínimos de propósito.

### THEM-040 — Nova pandemia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Nova pandemia |
| **Tipo** | Temática |
| **Modo** | Congresso |
| **Tema** | Saúde |
| **Quem fala** | Ministério da Saúde |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Verde |
| **Problema** | Um vírus novo se espalha rápido. A OMS recomenda restringir a circulação, e o comércio teme quebrar. |
| **Opção A** | Fechar o comércio |
| **Efeitos A** | `Segurança` +10, `Caixa` -15, `Capital Político` -10 |
| **Consequência A** | "As ruas esvaziam. Comerciantes protestam." |
| **Eixo A** | [-1, +1, -1, +1] |
| **Atores A** | `ACT-004` -1, `ACT-014` +1 |
| **Evento A** | — |
| **Opção B** | Manter tudo aberto |
| **Efeitos B** | `Caixa` +10, `Segurança` -15, `Legitimidade` -5 |
| **Consequência B** | "O comércio segue. Os hospitais começam a encher." |
| **Eixo B** | [+1, -1, +1, -1] |
| **Atores B** | `ACT-004` +1 |
| **Evento B** | "Os hospitais lotam na segunda onda." · atraso 1 · `Segurança` -15 |
| **Aprendizado** | APR-THEM-040 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-040):** Isolamento × economia; não repete INST-076 nem INST-190 (vacinas). Diplomacia +1 em A (seguir a OMS), −1 em B. Ano 2, carta ligada a Segurança. Sem número de mortes.

## Relatório da onda (script)

`check ... --no-learning --wave-report --style` → 10 cartas, 0 erros, 0 avisos de estilo (saída 0). `box --json` → saída 0. Metas: 5 eventos (031 A, 034 B, 037 A, 038 B, 040 B) · Diplomacia ≠ 0 em 5 opções · Sociedade 7 · Dignidade+ com Ano 2-4: 3 · Segurança+ com Ano 2-4: 1 · 7 cores, todas com saldo negativo em algum medidor. Os avisos de Técnica do Influenciador vêm de checar só a onda (sem cartas do modo).

## Propostas ao PO (provisórias)

1. Blocos de tema seguem `THEME_BLOCKS` do script (`jogo/tools/cards_doc.py:41`): THEM-031..040 = Saúde. O pedido citava Fome no 021..030; confirmado pelo script.
2. THEM-039 e THEM-032 no Judiciário com o governo como parte; o PO pode preferir o Orçamento na 039.

## Dúvidas para o PSI (quando houver revisão)

- THEM-038 (doença no presídio) e THEM-040 (pandemia): conferir se o tom evita sofrimento explícito.

## Autoconferência

- DP-013 temas e blocos `gestao/decisoes-provisorias.md:21`; THEMES/THEME_BLOCKS `jogo/tools/cards_doc.py:39-41`; THEM-001 `docs/17_ROTEIRO_DAS_CARTAS.md:5040`; brief D-196 pendente `.claude/notas/execucao/brief-d196.md`; limites e convenção de Diplomacia `.claude/notas/execucao/kit-gd.md` §2 e §4 — conferidos.
