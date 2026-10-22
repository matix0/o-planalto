# Onda 29 do P-015 — ATOR-022 a ATOR-031 — cartas de ator (GD, modo D-196)

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO — todas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-29/cartas.md --no-learning --wave-report --style`

## Progresso

- [x] Brief D-196, kit, D-104..108 (`gestao/decisoes.md:116-120`), DP-015 (`gestao/decisoes-provisorias.md:23`), GDD 07 §3.4, doc 11, ATOR-001 (doc 17 §17.13), `cards_doc.py` (ROLES/NO_OFFER :48-49, owner :300-309, :408)
- [x] Cartas escritas
- [x] Check 0 erros, 0 avisos de estilo
- [x] Aprendizados (md e json)

## Convenções desta onda

- Numeração DP-015: sequencial por ator, exigência → ataque → oferta; `ACT-010` sem oferta.
- Toda opção cita o dono da carta (D-106, `cards_doc.py:408`). Oferta: uma opção sem efeito negativo (Boa Vontade, D-108), com custo no evento ou nos atores.
- Modo de cada carta entre os "Modos em que Aparece" (`docs/12_FICHAS_DOS_MODOS.md:583-608`). Influenciador evitado (exigiria Técnica e Reação).
- Atores como tipos sociais; nenhuma pessoa real (RC-08). Nenhum número no texto ao jogador.
- Temas conferidos contra os títulos do doc 17 e das Ondas 1-22.

---

### ATOR-022 — Soldado julgado no quartel

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Soldado julgado no quartel |
| **Tipo** | Ator |
| **Modo** | Prisional e Policial |
| **Função** | `ACT-008` · Exigência |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 1 |
| **Cor A** | Preto |
| **Cor B** | Roxo |
| **Problema** | Os generais pedem que crimes de soldados contra civis, em operações nas cidades, sejam julgados pela Justiça Militar. |
| **Opção A** | Aceitar o pedido |
| **Efeitos A** | `Segurança` +10, `Capital Político` +5, `Integridade` -10, `Legitimidade` -10 |
| **Consequência A** | "Os quartéis aplaudem. Famílias de vítimas perdem o júri comum." |
| **Eixo A** | [0, 0, 0, -2] |
| **Atores A** | `ACT-008` +1, `ACT-023` -1 |
| **Evento A** | — |
| **Opção B** | Manter na Justiça comum |
| **Efeitos B** | `Integridade` +10, `Legitimidade` +5, `Segurança` -10 |
| **Consequência B** | "Os generais se calam em público. Nos bastidores, a conversa esfria." |
| **Eixo B** | [0, 0, +1, +1] |
| **Atores B** | `ACT-008` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-022 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-022):** Exigência de Legitimidade (doc 11:240). Não repete "Operação com muitas mortes" (letalidade policial).

### ATOR-023 — Quartel cruza os braços

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Quartel cruza os braços |
| **Tipo** | Ator |
| **Modo** | Prisional e Policial |
| **Função** | `ACT-008` · Ataque |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Cor A** | Laranja |
| **Cor B** | Azul |
| **Problema** | Você cortou verba dos quartéis. Os comandos suspendem o apoio às operações contra o tráfico de armas na fronteira. |
| **Opção A** | Repor a verba |
| **Efeitos A** | `Segurança` +10, `Soberania` +5, `Caixa` -15 |
| **Consequência A** | "As operações voltam. Os quartéis aprendem que a pressão funciona." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-008` +1 |
| **Evento A** | — |
| **Opção B** | Usar a Polícia Federal |
| **Efeitos B** | `Integridade` +10, `Segurança` -10, `Caixa` -5 |
| **Consequência B** | "A PF assume a fronteira. Falta gente para tanto chão." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-008` -1 |
| **Evento B** | "Armas entram sem patrulha" · atraso 1 · `Soberania` -5, `Segurança` -5 |
| **Aprendizado** | APR-ATOR-023 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-023):** Ataque por omissão, diferente de "Recado do general"/"Recado do quartel" (impeachment). Carta ligada: Segurança+ com Ano mínimo 2.

### ATOR-024 — Hospital de campanha na aldeia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Hospital de campanha na aldeia |
| **Tipo** | Ator |
| **Modo** | Prisional e Policial |
| **Função** | `ACT-008` · Oferta |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 3 |
| **Cor A** | Verde |
| **Cor B** | Vermelho |
| **Problema** | Os militares oferecem montar hospitais de campanha numa terra indígena em crise de saúde. Pedem o comando da ação. |
| **Opção A** | Aceitar o comando |
| **Efeitos A** | `Dignidade` +10, `Segurança` +10 |
| **Consequência A** | "O socorro chega rápido. Lideranças indígenas pedem voz nas decisões." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-008` +1, `ACT-018` -1 |
| **Evento A** | — |
| **Opção B** | Pôr a Saúde no comando |
| **Efeitos B** | `Dignidade` +10, `Legitimidade` +5, `Caixa` -10 |
| **Consequência B** | "Médicos civis lideram. Os quartéis apoiam com menos vontade." |
| **Eixo B** | [0, 0, +1, +1] |
| **Atores B** | `ACT-008` -1, `ACT-014` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-024 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-024):** Oferta com Boa Vontade na A (custo nos atores). Sem detalhe gráfico (aviso de conteúdo). Carta ligada: Dignidade+ e Segurança+ com Ano mínimo 3.

### ATOR-025 — Reajuste dos servidores

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Reajuste dos servidores |
| **Tipo** | Ator |
| **Modo** | Emendas |
| **Função** | `ACT-009` · Exigência |
| **Quem fala** | `ACT-009` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Os servidores federais pedem reajuste para repor anos sem aumento. Ameaçam greve nas agências e nos institutos. |
| **Opção A** | Dar o reajuste |
| **Efeitos A** | `Soberania` +5, `Capital Político` +5, `Caixa` -15 |
| **Consequência A** | "A greve não sai. O caixa aperta para as outras áreas." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-009` +1 |
| **Evento A** | — |
| **Opção B** | Congelar os salários |
| **Efeitos B** | `Caixa` +10, `Soberania` -10, `Legitimidade` -5 |
| **Consequência B** | "O caixa respira. Os melhores técnicos pedem para sair." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-009` -1 |
| **Evento B** | "Greve fecha agências do INSS" · atraso 1 · `Dignidade` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-ATOR-025 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-025):** Exigência de Caixa (doc 11:259).

### ATOR-026 — Operação padrão nos portos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Operação padrão nos portos |
| **Tipo** | Ator |
| **Modo** | Geopolítico |
| **Função** | `ACT-009` · Ataque |
| **Quem fala** | `ACT-009` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Preto |
| **Problema** | Auditores fazem operação padrão nos portos. Cargas de exportação param e compradores de fora ameaçam cancelar pedidos. |
| **Opção A** | Negociar com os auditores |
| **Efeitos A** | `Soberania` +10, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "Os portos voltam a girar. Outras categorias pedem o mesmo." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-009` +1 |
| **Evento A** | — |
| **Opção B** | Cortar o ponto |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Soberania` -10, `Legitimidade` -5 |
| **Consequência B** | "Os auditores voltam irritados. A fiscalização de cargas afrouxa." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-009` -1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-026 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-026):** Ataque sem greve formal. Diplomacia 0: a pressão vem de dentro.

### ATOR-027 — Auditores contra a sonegação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Auditores contra a sonegação |
| **Tipo** | Ator |
| **Modo** | Geopolítico |
| **Função** | `ACT-009` · Oferta |
| **Quem fala** | `ACT-009` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Laranja |
| **Problema** | Auditores da Receita oferecem um plano para cobrar impostos que multinacionais escondem lá fora. Pedem equipe e sistemas. |
| **Opção A** | Dar a equipe |
| **Efeitos A** | `Caixa` +15, `Soberania` +10 |
| **Consequência A** | "As cobranças começam. Escritórios de advocacia lotam a Justiça de recursos." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-009` +1, `ACT-021` -1 |
| **Evento A** | "Multinacionais ameaçam sair do país" · atraso 2 · `Capital Político` -10 |
| **Opção B** | Deixar para depois |
| **Efeitos B** | `Capital Político` +5, `Caixa` -5, `Integridade` -5 |
| **Consequência B** | "O plano vai para a gaveta. As empresas seguem com imposto menor." |
| **Eixo B** | [0, +1, 0, 0] |
| **Atores B** | `ACT-009` -1, `ACT-021` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-027 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-027):** Oferta com Boa Vontade na A; custo no evento. Diplomacia − na A (controle interno), + na B.

### ATOR-028 — Tratado parado no Congresso

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Tratado parado no Congresso |
| **Tipo** | Ator |
| **Modo** | Congresso |
| **Função** | `ACT-010` · Exigência |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Laranja |
| **Problema** | Os diplomatas pedem que você gaste apoio no Congresso para aprovar um tratado contra o tráfico de armas. A bancada da bala resiste. |
| **Opção A** | Brigar pelo tratado |
| **Efeitos A** | `Segurança` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência A** | "O tratado passa por pouco. A bancada da bala anota o seu nome." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-010` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Deixar na gaveta |
| **Efeitos B** | `Capital Político` +10, `Segurança` -10, `Legitimidade` -5 |
| **Consequência B** | "O tratado espera. O Brasil chega sem ele à próxima cúpula." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-010` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-028 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-028):** Exigência de Capital Político (doc 11:278). Diplomacia + na A (cooperação internacional).

### ATOR-029 — Venda de blindados a ditador

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Venda de blindados a ditador |
| **Tipo** | Ator |
| **Modo** | Bancadas |
| **Função** | `ACT-010` · Ataque |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Preto |
| **Problema** | Diplomatas vazam ao Senado que você autorizou vender blindados a um governo que reprime protestos. |
| **Opção A** | Cancelar a venda |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Caixa` -10 |
| **Consequência A** | "A indústria de defesa perde o contrato. Os diplomatas recuperam a voz." |
| **Eixo A** | [0, +1, +1, +1] |
| **Atores A** | `ACT-010` +1, `ACT-004` -1 |
| **Evento A** | — |
| **Opção B** | Manter a venda |
| **Efeitos B** | `Caixa` +10, `Soberania` +5, `Legitimidade` -10, `Integridade` -5 |
| **Consequência B** | "O contrato segue. O Itamaraty abre apuração do vazamento." |
| **Eixo B** | [0, -1, 0, -1] |
| **Atores B** | `ACT-010` -1, `ACT-004` +1 |
| **Evento B** | "Blindados aparecem nas ruas de lá" · atraso 2 · `Legitimidade` -10 |
| **Aprendizado** | APR-ATOR-029 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-029):** Ataque por vazamento; nenhum país nomeado. Diplomacia + na A, − na B.

### ATOR-030 — Ministério de porteira fechada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ministério de porteira fechada |
| **Tipo** | Ator |
| **Modo** | Congresso |
| **Função** | `ACT-011` · Exigência |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Roxo |
| **Problema** | O líder da Câmara quer um ministério inteiro para o partido, com todos os cargos. Em troca, entrega a base. |
| **Opção A** | Entregar o ministério |
| **Efeitos A** | `Capital Político` +20, `Integridade` -10, `Legitimidade` -10 |
| **Consequência A** | "As votações andam. Técnicos dão lugar a indicados do partido." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-011` +1, `ACT-023` -1 |
| **Evento A** | — |
| **Opção B** | Oferecer só a chefia |
| **Efeitos B** | `Integridade` +10, `Capital Político` -15 |
| **Consequência B** | "O partido aceita a cadeira e cobra o resto em cada votação." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-030 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-030):** Exigência de Legitimidade (doc 11:297); não repete "Vaga do STF negociada" nem "Vaga no Tribunal de Contas".

### ATOR-031 — Pauta-bomba na Câmara

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pauta-bomba na Câmara |
| **Tipo** | Ator |
| **Modo** | Bancadas |
| **Função** | `ACT-011` · Ataque |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Laranja |
| **Problema** | Irritado, o líder da Câmara põe em votação gastos que estouram o orçamento. Você decide se veta. |
| **Opção A** | Vetar os gastos |
| **Efeitos A** | `Caixa` +10, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "O veto segura as contas. O líder promete o troco." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | "A Câmara derruba o veto" · atraso 2 · `Caixa` -10 |
| **Opção B** | Ceder e negociar |
| **Efeitos B** | `Capital Político` +10, `Caixa` -15, `Integridade` -5 |
| **Consequência B** | "A crise acaba. A conta fica para o próximo ano." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-031 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-031):** Ataque; não repete "Bloqueio das emendas" (aqui é gasto novo, não emenda).

## Relatório do script

Ver saída do `check` no retorno do GD (0 erros, 0 avisos de estilo).

## Propostas ao PO e pendências

- Sociedade ≠ 0 em 3 opções (ATOR-022 B, 024 B, 029 A).
- ATOR-024 cita terra indígena com ACT-018 como aproximação (não há ator indígena).

## Dúvidas ao PSI

- Sem PSI no modo D-196; revisão no fim pelo PO.
