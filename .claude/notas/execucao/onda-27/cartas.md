# Onda 27 do P-015 — ATOR-002 a ATOR-011 — cartas de ator (GD, modo D-196)

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO — todas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-27/cartas.md --no-learning --wave-report --style`

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

### ATOR-002 — Tratores contra a lista suja

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Tratores contra a lista suja |
| **Tipo** | Ator |
| **Modo** | Bancadas |
| **Função** | `ACT-001` · Ataque |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Verde |
| **Problema** | Fazendeiros fecham rodovias com tratores. Exigem que o governo pare de publicar quem usa trabalho escravo. |
| **Opção A** | Manter a lista suja |
| **Efeitos A** | `Dignidade` +15, `Integridade` +5, `Caixa` -10, `Capital Político` -10 |
| **Consequência A** | "As rodovias seguem fechadas por dias. A lista continua pública." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-001` -1, `ACT-015` +1 |
| **Evento A** | "Falta comida nos mercados do interior" · atraso 1 · `Segurança` -5, `Caixa` -5 |
| **Opção B** | Suspender a lista |
| **Efeitos B** | `Capital Político` +15, `Caixa` +5, `Dignidade` -15, `Integridade` -10 |
| **Consequência B** | "As estradas abrem. Quem explora trabalhador some do cadastro público." |
| **Eixo B** | [+1, 0, -1, -1] |
| **Atores B** | `ACT-001` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-002 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-002):** Ataque: o ator força a saída por bloqueio. Tema novo (trabalho escravo não aparece no doc 17 nem nas Ondas 1-22).

### ATOR-003 — Comitiva com os fazendeiros

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Comitiva com os fazendeiros |
| **Tipo** | Ator |
| **Modo** | Geopolítico |
| **Função** | `ACT-001` · Oferta |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Azul |
| **Problema** | Os fazendeiros abriram um mercado novo para a carne no exterior. Querem viajar na comitiva oficial do governo. |
| **Opção A** | Levar na comitiva |
| **Efeitos A** | `Caixa` +15, `Capital Político` +10 |
| **Consequência A** | "Os contratos saem na viagem. A foto oficial tem mais chapéu que gravata." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-017` -1 |
| **Evento A** | — |
| **Opção B** | Viajar sem eles |
| **Efeitos B** | `Soberania` +5, `Caixa` -5, `Capital Político` -10 |
| **Consequência B** | "A comitiva fica menor. Os fazendeiros negociam por conta própria." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-001` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-003 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-003):** Oferta com Boa Vontade na A (custo nos atores: ACT-017 -1). Diplomacia + na A, − na B (convenção do kit).

### ATOR-004 — Previdência por capitalização

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Previdência por capitalização |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-002` · Exigência |
| **Quem fala** | `ACT-002` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Vermelho |
| **Problema** | Os investidores pedem que a aposentadoria vire poupança individual, aplicada pelos bancos. Prometem que o mercado sobe. |
| **Opção A** | Criar a capitalização |
| **Efeitos A** | `Caixa` +15, `Capital Político` +5, `Dignidade` -20 |
| **Consequência A** | "Os bancos ganham clientes. Quem ganha pouco poupa pouco e se aposenta com menos." |
| **Eixo A** | [+2, 0, 0, 0] |
| **Atores A** | `ACT-002` +1, `ACT-015` -1 |
| **Evento A** | — |
| **Opção B** | Manter o modelo público |
| **Efeitos B** | `Dignidade` +10, `Caixa` -10, `Capital Político` -5 |
| **Consequência B** | "O mercado reclama. A aposentadoria segue paga por quem trabalha hoje." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-002` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-004 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-004):** Exigência de Caixa contra Dignidade, como na ficha (doc 11:123-124).

### ATOR-005 — Ameaça de fuga de capitais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ameaça de fuga de capitais |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-002` · Ataque |
| **Quem fala** | `ACT-002` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Os investidores ameaçam tirar dinheiro do país se você taxar os super-ricos. Os jornais falam em pânico. |
| **Opção A** | Taxar os super-ricos |
| **Efeitos A** | `Caixa` +10, `Dignidade` +10, `Capital Político` -15 |
| **Consequência A** | "O imposto passa. Colunistas preveem o fim do mundo na mesma semana." |
| **Eixo A** | [-2, 0, 0, 0] |
| **Atores A** | `ACT-002` -1, `ACT-015` +1 |
| **Evento A** | "Parte dos fundos muda de país" · atraso 2 · `Caixa` -10 |
| **Opção B** | Recuar da taxação |
| **Efeitos B** | `Capital Político` +10, `Caixa` +5, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "O mercado acalma. Quem vive de salário paga mais, em proporção." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-002` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-005 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-005):** Não repete "Teto do imposto sobre herança": aqui o foco é a chantagem da saída de capital.

### ATOR-006 — Fundo privado para casas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fundo privado para casas |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-002` · Oferta |
| **Quem fala** | `ACT-002` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Laranja |
| **Problema** | Os investidores oferecem dinheiro para erguer casas populares. Em troca, o governo garante o lucro deles por anos. |
| **Opção A** | Fechar a parceria |
| **Efeitos A** | `Dignidade` +15, `Caixa` +10 |
| **Consequência A** | "As obras começam rápido. O contrato prende o orçamento por muito tempo." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-002` +1, `ACT-016` +1 |
| **Evento A** | "A conta do lucro garantido chega" · atraso 2 · `Caixa` -10 |
| **Opção B** | Fazer com verba pública |
| **Efeitos B** | `Dignidade` +5, `Soberania` +5, `Caixa` -15 |
| **Consequência B** | "O governo faz menos casas, mas não deve lucro a ninguém." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-002` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-006 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-006):** Oferta com Boa Vontade na A; custo no evento. Carta ligada: Dignidade+ com Ano mínimo 2.

### ATOR-007 — Casas longe de tudo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Casas longe de tudo |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-003` · Exigência |
| **Quem fala** | `ACT-003` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Vermelho |
| **Problema** | As construtoras querem erguer o novo conjunto popular num terreno barato, longe de emprego, escola e ônibus. |
| **Opção A** | Aceitar o terreno |
| **Efeitos A** | `Caixa` +10, `Capital Político` +5, `Dignidade` -15 |
| **Consequência A** | "As casas saem rápido. As famílias passam horas no ônibus todo dia." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-003` +1, `ACT-016` -1 |
| **Evento A** | — |
| **Opção B** | Exigir área central |
| **Efeitos B** | `Dignidade` +10, `Caixa` -15, `Capital Político` -5 |
| **Consequência B** | "A obra atrasa. Prédios vazios do centro viram moradia." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-003` -1, `ACT-016` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-007 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-007):** Exigência de Caixa contra Dignidade (doc 11:142-143).

### ATOR-008 — Cartel nas licitações

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cartel nas licitações |
| **Tipo** | Ator |
| **Modo** | Emendas |
| **Função** | `ACT-003` · Ataque |
| **Quem fala** | `ACT-003` |
| **Ano mínimo** | 1 |
| **Cor A** | Preto |
| **Cor B** | Azul |
| **Problema** | Uma auditoria acha cartel nas obras federais. As construtoras ameaçam parar todos os canteiros se forem punidas. |
| **Opção A** | Punir o cartel |
| **Efeitos A** | `Integridade` +15, `Legitimidade` +5, `Caixa` -10, `Capital Político` -10 |
| **Consequência A** | "As empresas ficam fora das licitações. Obras param à espera de novas firmas." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-003` -1 |
| **Evento A** | — |
| **Opção B** | Fazer acordo de leniência |
| **Efeitos B** | `Caixa` +10, `Integridade` -10, `Legitimidade` -5 |
| **Consequência B** | "As obras seguem. As empresas pagam multa e voltam a disputar contratos." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-003` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-008 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-008):** Ataque por chantagem de obra parada; não repete "Creches inacabadas" (atraso) nem "Emenda para ONG de fachada".

### ATOR-009 — Reconstrução depois da enchente

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Reconstrução depois da enchente |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-003` · Oferta |
| **Quem fala** | `ACT-003` |
| **Ano mínimo** | 3 |
| **Cor A** | Verde |
| **Cor B** | Preto |
| **Problema** | Depois de uma enchente, as construtoras oferecem reerguer pontes e casas já. Querem dispensa de licitação. |
| **Opção A** | Aceitar a oferta |
| **Efeitos A** | `Segurança` +15, `Dignidade` +10 |
| **Consequência A** | "As pontes voltam em semanas. Ninguém confere bem o preço." |
| **Eixo A** | [+1, 0, 0, -1] |
| **Atores A** | `ACT-003` +1, `ACT-023` -1 |
| **Evento A** | "Auditoria acha preço inflado" · atraso 2 · `Integridade` -10 |
| **Opção B** | Manter a licitação |
| **Efeitos B** | `Integridade` +10, `Dignidade` -10, `Capital Político` -5 |
| **Consequência B** | "Tudo fica registrado. As famílias esperam mais pela casa nova." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-003` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-009 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-009):** Oferta com Boa Vontade na A; custo no evento. Carta ligada: Segurança+ e Dignidade+ com Ano mínimo 3.

### ATOR-010 — Imposto nas compras de fora

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Imposto nas compras de fora |
| **Tipo** | Ator |
| **Modo** | Geopolítico |
| **Função** | `ACT-004` · Exigência |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Roxo |
| **Problema** | A indústria pede imposto sobre compras baratas em sites estrangeiros. Diz que a loja do bairro não aguenta. |
| **Opção A** | Taxar as compras |
| **Efeitos A** | `Soberania` +10, `Caixa` +5, `Dignidade` -10, `Capital Político` -5 |
| **Consequência A** | "As fábricas comemoram. Jovens reclamam do preço das roupas." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-004` +1, `ACT-021` -1 |
| **Evento A** | — |
| **Opção B** | Manter sem imposto |
| **Efeitos B** | `Dignidade` +5, `Legitimidade` +5, `Soberania` -10 |
| **Consequência B** | "As compras seguem baratas. Lojas de bairro fecham as portas." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-004` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-010 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-010):** Diplomacia − na A (proteção), + na B (abertura).

### ATOR-011 — Fábrica fecha e culpa você

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fábrica fecha e culpa você |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-004` · Ataque |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Uma grande fábrica anuncia demissões em massa. Os donos culpam a nova regra contra a poluição e pedem que ela caia. |
| **Opção A** | Manter a regra |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Caixa` -10, `Capital Político` -10 |
| **Consequência A** | "O ar da cidade melhora. Os demitidos culpam o governo." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-004` -1, `ACT-018` +1 |
| **Evento A** | "A cidade da fábrica protesta" · atraso 1 · `Legitimidade` -10 |
| **Opção B** | Adiar a regra |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Consciência` -10, `Dignidade` -5 |
| **Consequência B** | "A fábrica fica. A fumaça também." |
| **Eixo B** | [+1, 0, -1, 0] |
| **Atores B** | `ACT-004` +1, `ACT-018` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-011 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-011):** Ataque: chantagem do emprego. Sociedade +1/−1 (regra ambiental).

## Relatório do script

Ver saída do `check` no retorno do GD (0 erros, 0 avisos de estilo).

## Propostas ao PO e pendências

- Sociedade ≠ 0 só em 4 opções (atores econômicos); Diplomacia em 4.
- ATOR-003 (oferta) no Geopolítico; alternativa: Bancadas.

## Dúvidas ao PSI

- Sem PSI no modo D-196; revisão no fim pelo PO.
