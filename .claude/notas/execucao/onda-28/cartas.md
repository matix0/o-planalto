# Onda 28 do P-015 — ATOR-012 a ATOR-021 — cartas de ator (GD, modo D-196)

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO — todas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-28/cartas.md --no-learning --wave-report --style`

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

### ATOR-012 — Plataformas no estaleiro nacional

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Plataformas no estaleiro nacional |
| **Tipo** | Ator |
| **Modo** | Geopolítico |
| **Função** | `ACT-004` · Oferta |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | A indústria naval oferece construir no país as plataformas de petróleo. Gera emprego, mas custa mais que comprar fora. |
| **Opção A** | Encomendar no país |
| **Efeitos A** | `Soberania` +15, `Dignidade` +10 |
| **Consequência A** | "Os estaleiros voltam a contratar. As primeiras entregas atrasam." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-004` +1, `ACT-015` +1 |
| **Evento A** | "A estatal paga mais pelas plataformas" · atraso 2 · `Caixa` -10 |
| **Opção B** | Comprar no exterior |
| **Efeitos B** | `Caixa` +10, `Soberania` -10, `Dignidade` -5 |
| **Consequência B** | "A plataforma chega no prazo. Os estaleiros seguem vazios." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-004` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-012 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-012):** Oferta com Boa Vontade na A; custo no evento. Carta ligada: Dignidade+ com Ano mínimo 2.

### ATOR-013 — Enfermagem a distância

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Enfermagem a distância |
| **Tipo** | Ator |
| **Modo** | Currículo e Mídia |
| **Função** | `ACT-005` · Exigência |
| **Quem fala** | `ACT-005` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Verde |
| **Problema** | As faculdades privadas pedem licença para formar enfermeiros só a distância. Dizem que levam o curso ao interior. |
| **Opção A** | Liberar o curso |
| **Efeitos A** | `Caixa` +10, `Capital Político` +5, `Dignidade` -10, `Consciência` -5 |
| **Consequência A** | "Abrem vagas baratas. Hospitais desconfiam de quem nunca pisou num laboratório." |
| **Eixo A** | [+1, 0, 0, +1] |
| **Atores A** | `ACT-005` +1, `ACT-014` -1 |
| **Evento A** | — |
| **Opção B** | Exigir aula prática |
| **Efeitos B** | `Dignidade` +5, `Consciência` +5, `Capital Político` -10 |
| **Consequência B** | "O curso fica mais caro e mais raro. Quem se forma chega pronto ao plantão." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-005` -1, `ACT-014` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-013 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-013):** Exigência de Consciência (doc 11:181). Estado + na A (menos regra), − na B.

### ATOR-014 — Faculdades vão ao Supremo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Faculdades vão ao Supremo |
| **Tipo** | Ator |
| **Modo** | Judiciário |
| **Função** | `ACT-005` · Ataque |
| **Quem fala** | `ACT-005` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Você limitou o lucro das faculdades com dinheiro do FIES. Elas vão ao Supremo e ameaçam fechar campi. |
| **Opção A** | Defender a regra |
| **Efeitos A** | `Caixa` +10, `Integridade` +10, `Capital Político` -10 |
| **Consequência A** | "A Advocacia da União defende a regra. Os donos falam em perseguição." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-005` -1, `ACT-013` +1 |
| **Evento A** | "Um campus fecha no meio do semestre" · atraso 1 · `Dignidade` -5, `Consciência` -5 |
| **Opção B** | Negociar a regra |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Integridade` -5 |
| **Consequência B** | "As faculdades retiram a ação. O dinheiro público segue sem controle." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-005` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-014 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-014):** Ataque por ação judicial e ameaça de fechar campi.

### ATOR-015 — Bolsas para quem trabalha

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Bolsas para quem trabalha |
| **Tipo** | Ator |
| **Modo** | Currículo e Mídia |
| **Função** | `ACT-005` · Oferta |
| **Quem fala** | `ACT-005` |
| **Ano mínimo** | 2 |
| **Cor A** | Laranja |
| **Cor B** | Vermelho |
| **Problema** | As faculdades oferecem bolsas para jovens que trabalham de dia. Pedem em troca mais tempo de isenção de impostos. |
| **Opção A** | Aceitar as bolsas |
| **Efeitos A** | `Consciência` +10, `Dignidade` +10 |
| **Consequência A** | "Turmas noturnas lotam. A isenção dura mais que o previsto." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-005` +1, `ACT-013` -1 |
| **Evento A** | — |
| **Opção B** | Ampliar a federal |
| **Efeitos B** | `Consciência` +10, `Caixa` -15, `Capital Político` -5 |
| **Consequência B** | "Abrem turmas noturnas na universidade pública. A obra demora." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-005` -1, `ACT-013` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-015 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-015):** Oferta com Boa Vontade na A (custo nos atores). Carta ligada: Dignidade+ com Ano mínimo 2.

### ATOR-016 — Fim da estabilidade no serviço

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fim da estabilidade no serviço |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-006` · Exigência |
| **Quem fala** | `ACT-006` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Roxo |
| **Problema** | O mercado cobra o fim da estabilidade dos novos servidores. Diz que só assim confia nas contas do país. |
| **Opção A** | Propor o fim |
| **Efeitos A** | `Caixa` +10, `Capital Político` +5, `Integridade` -10, `Dignidade` -5 |
| **Consequência A** | "A bolsa sobe. Servidores temem perseguição de cada novo chefe." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-006` +1, `ACT-009` -1 |
| **Evento A** | — |
| **Opção B** | Manter a estabilidade |
| **Efeitos B** | `Integridade` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência B** | "Os servidores respiram. Os analistas cortam a previsão para o país." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-006` -1, `ACT-009` +1 |
| **Evento B** | "Agências rebaixam a nota do país" · atraso 2 · `Caixa` -10 |
| **Aprendizado** | APR-ATOR-016 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-016):** Exigência; custo Integridade na A (risco de indicação política).

### ATOR-017 — Dólar dispara num dia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Dólar dispara num dia |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-006` · Ataque |
| **Quem fala** | `ACT-006` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Preto |
| **Problema** | Especuladores apostam contra o real e o dólar dispara. Os preços nos mercados sobem na mesma semana. |
| **Opção A** | Gastar as reservas |
| **Efeitos A** | `Dignidade` +5, `Segurança` +5, `Soberania` -15 |
| **Consequência A** | "O dólar acalma. O país fica com menos colchão para a próxima crise." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-006` +1 |
| **Evento A** | — |
| **Opção B** | Controlar a saída |
| **Efeitos B** | `Soberania` +10, `Dignidade` +5, `Caixa` -10, `Capital Político` -10 |
| **Consequência B** | "A especulação para. Investidores dizem que o país virou armadilha." |
| **Eixo B** | [-2, -1, 0, -1] |
| **Atores B** | `ACT-006` -1, `ACT-002` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-017 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-017):** Ataque especulativo. Diplomacia + na A, − na B.

### ATOR-018 — Mutirão contra as dívidas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Mutirão contra as dívidas |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-006` · Oferta |
| **Quem fala** | `ACT-006` |
| **Ano mínimo** | 2 |
| **Cor A** | Verde |
| **Cor B** | Vermelho |
| **Problema** | Os bancos oferecem perdoar parte das dívidas das famílias. Pedem que o governo garanta o resto com dinheiro público. |
| **Opção A** | Garantir o acordo |
| **Efeitos A** | `Dignidade` +15, `Legitimidade` +5 |
| **Consequência A** | "Milhões limpam o nome. Os bancos recebem o que davam por perdido." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-006` +1, `ACT-015` +1 |
| **Evento A** | — |
| **Opção B** | Limitar os juros |
| **Efeitos B** | `Dignidade` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência B** | "Os juros caem por lei. Os bancos cortam crédito para os mais pobres." |
| **Eixo B** | [-2, 0, 0, -1] |
| **Atores B** | `ACT-006` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-018 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-018):** Oferta com Boa Vontade na A. "Milhões" na consequência A é vago, sem número; trocar se o PO preferir. Carta ligada: Dignidade+ com Ano mínimo 2.

### ATOR-019 — Verba só por resultado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Verba só por resultado |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-007` · Exigência |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Laranja |
| **Problema** | Os técnicos querem dar verba só às escolas que sobem a nota na prova. As que vão mal perdem dinheiro. |
| **Opção A** | Adotar a regra |
| **Efeitos A** | `Caixa` +10, `Integridade` +5, `Dignidade` -10, `Consciência` -5 |
| **Consequência A** | "Algumas escolas melhoram. As mais pobres perdem verba e afundam." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-007` +1, `ACT-013` -1 |
| **Evento A** | — |
| **Opção B** | Dar mais a quem precisa |
| **Efeitos B** | `Dignidade` +10, `Consciência` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência B** | "As escolas pobres recebem mais. Os técnicos dizem que ninguém cobra resultado." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-007` -1, `ACT-013` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-019 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-019):** Exigência; não repete "Piso da educação" nem "Fundeb para aposentados".

### ATOR-020 — Estudo contra seu programa

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Estudo contra seu programa |
| **Tipo** | Ator |
| **Modo** | Emendas |
| **Função** | `ACT-007` · Ataque |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Cor A** | Preto |
| **Cor B** | Vermelho |
| **Problema** | Técnicos do próprio governo publicam um estudo que chama de desperdício o seu programa de cozinhas solidárias. |
| **Opção A** | Rever o programa |
| **Efeitos A** | `Integridade` +10, `Caixa` +10, `Dignidade` -10 |
| **Consequência A** | "O programa encolhe. Quem comia ali procura outra porta." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-007` +1, `ACT-016` -1 |
| **Evento A** | — |
| **Opção B** | Defender o programa |
| **Efeitos B** | `Dignidade` +10, `Legitimidade` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência B** | "As cozinhas seguem. Você chama o estudo de frio e incompleto." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-007` -1 |
| **Evento B** | "A oposição usa o estudo na tribuna" · atraso 1 · `Capital Político` -10 |
| **Aprendizado** | APR-ATOR-020 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-020):** Ataque por estudo vazado; o Mercado não aparece. Atenção: ACT-016 como próximo das cozinhas solidárias, aproximação.

### ATOR-021 — Serviços públicos num aplicativo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Serviços públicos num aplicativo |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-007` · Oferta |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 3 |
| **Cor A** | Roxo |
| **Cor B** | Laranja |
| **Problema** | Os técnicos oferecem pôr os serviços públicos num só aplicativo. A fila acaba, mas quem não tem internet fica de fora. |
| **Opção A** | Lançar o aplicativo |
| **Efeitos A** | `Caixa` +10, `Integridade` +10 |
| **Consequência A** | "A fila some das agências. Os golpes por mensagem aumentam." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-007` +1, `ACT-014` -1 |
| **Evento A** | "Idosos sem celular perdem benefícios" · atraso 2 · `Dignidade` -10 |
| **Opção B** | Manter o balcão também |
| **Efeitos B** | `Dignidade` +10, `Segurança` +5, `Caixa` -15 |
| **Consequência B** | "O aplicativo sai, mas o atendimento de porta segue aberto." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-007` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-021 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-021):** Oferta com Boa Vontade na A; custo no evento. Carta ligada: Integridade+ (A) e Segurança+ (B) com Ano mínimo 3.

## Relatório do script

Ver saída do `check` no retorno do GD (0 erros, 0 avisos de estilo).

## Propostas ao PO e pendências

- Sociedade 0 em toda a onda: atores econômicos e técnicos; compensar nas ondas temáticas.
- ATOR-020: ACT-016 como próximo das cozinhas (aproximação).

## Dúvidas ao PSI

- Sem PSI no modo D-196; revisão no fim pelo PO.
