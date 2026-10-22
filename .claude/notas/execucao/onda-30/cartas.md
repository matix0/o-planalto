# Onda 30 do P-015 — Cartas de ator ATOR-032 a ATOR-041 — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO — modo D-196 (`.claude/notas/execucao/brief-d196.md`): sem web, sem PSI; toda carta `pendente de revisão (D-196)`; Aprendizados em conferência (P-016).
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1; ATOR-001 (§17.13) como modelo; numeração DP-015 (`jogo/tools/cards_doc.py:63-75`, ROLES e NO_OFFER em `:48-49`).

## Progresso

- [x] Leitura (brief, kit, D-104 a D-108, DP-015, GDD 07, doc 11, ATOR-001, títulos do doc 17 e das ondas)
- [x] Plano · [x] Cartas · [x] Aprendizados (md e json) · [x] Checagens

## Convenções desta onda

- Quem fala é o próprio ator; o ator dono aparece nas duas opções (D-106). Oferta usa a Boa Vontade (D-108) só na opção A, com custo adiado por evento quando cabe.
- Modo da carta escolhido entre as arenas do ator (DP-015, modo a); sem Influenciador nem Impeachment.
- Temas evitados: os títulos já escritos no doc 17 e nas ondas 1-22 (lista conferida por `grep '^### '`). Diplomacia conforme o kit §4; `ACT-021` +1 quando o jogador cede.
- Nenhum número, dado ou pessoa real no texto ao jogador; fatos só na pista de dado.

---

### ATOR-032 — Líder da Câmara (Centrão)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Centrão estende a mão |
| **Tipo** | Ator |
| **Modo** | Congresso |
| **Função** | `ACT-011` · Oferta |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Problema** | O Líder da Câmara oferece a base inteira para aprovar sua prioridade. Diz que não quer nada em troca. Por enquanto. |
| **Opção A** | Aceitar a base |
| **Cor A** | Amarelo |
| **Efeitos A** | `Capital Político` +20, `Legitimidade` +5 |
| **Consequência A** | "A prioridade passa com folga. O Líder da Câmara sorri e anota." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-011` +1 |
| **Evento A** | "O Líder da Câmara cobra o favor com cargos" · atraso 2 · `Integridade` -10, `Legitimidade` -5 |
| **Opção B** | Negociar voto a voto |
| **Cor B** | Roxo |
| **Efeitos B** | `Integridade` +10, `Capital Político` -15 |
| **Consequência B** | "Você fica sem dívida. A prioridade chega mais magra." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-011` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-032 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-032):** Boa Vontade na A; o preço vem no evento (favor sem preço declarado).

### ATOR-033 — Pastores

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Imunidade para a gráfica |
| **Tipo** | Ator |
| **Modo** | Bancadas |
| **Função** | `ACT-012` · Exigência |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 1 |
| **Problema** | Os Pastores querem que a isenção dos templos valha também para a rádio, a gráfica e a editora da igreja. |
| **Opção A** | Estender a isenção |
| **Cor A** | Azul |
| **Efeitos A** | `Caixa` -15, `Legitimidade` +10, `Integridade` -5 |
| **Consequência A** | "Os púlpitos agradecem. A Receita perde uma fonte inteira." |
| **Eixo A** | [+1, 0, -1, 0] |
| **Atores A** | `ACT-012` +1 |
| **Evento A** | — |
| **Opção B** | Isentar só o culto |
| **Cor B** | Vermelho |
| **Efeitos B** | `Caixa` +5, `Integridade` +5, `Legitimidade` -10 |
| **Consequência B** | "O culto segue livre de imposto. A empresa da igreja paga como as outras." |
| **Eixo B** | [-1, 0, +1, 0] |
| **Atores B** | `ACT-012` -1 |
| **Evento B** | "Cultos acusam o governo de perseguir a fé" · atraso 1 · `Legitimidade` -10, `Capital Político` -5 |
| **Aprendizado** | APR-ATOR-033 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-033):** Mecanismo: limite da imunidade tributária (culto × negócios ligados). Não repete INST-042, 103 nem 116.

### ATOR-034 — Pastores

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fiéis fora da escola |
| **Tipo** | Ator |
| **Modo** | Currículo e Mídia |
| **Função** | `ACT-012` · Ataque |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 1 |
| **Problema** | Furiosos com o governo, os Pastores pedem aos fiéis que tirem os filhos da escola pública e ensinem em casa. |
| **Opção A** | Liberar o ensino em casa |
| **Cor A** | Laranja |
| **Efeitos A** | `Legitimidade` +10, `Consciência` -15, `Dignidade` -5 |
| **Consequência A** | "Os Pastores comemoram. Muitas crianças somem da vista da escola." |
| **Eixo A** | [0, 0, -1, +1] |
| **Atores A** | `ACT-012` +1, `ACT-013` -1 |
| **Evento A** | — |
| **Opção B** | Manter a escola |
| **Cor B** | Verde |
| **Efeitos B** | `Consciência` +10, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência B** | "A matrícula segue obrigatória. Os templos dizem que o governo odeia a família." |
| **Eixo B** | [0, 0, +1, -1] |
| **Atores B** | `ACT-012` -1, `ACT-013` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-034 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-034):** Mecanismo: ensino domiciliar como retaliação. Estado −1 na B (obrigação), +1 na A (liberdade da família).

### ATOR-035 — Pastores

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pastores oferecem os púlpitos |
| **Tipo** | Ator |
| **Modo** | Bancadas |
| **Função** | `ACT-012` · Oferta |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 2 |
| **Problema** | Aliados, os Pastores oferecem os púlpitos para divulgar a vacinação e o cadastro social nos bairros. |
| **Opção A** | Aceitar os púlpitos |
| **Cor A** | Amarelo |
| **Efeitos A** | `Dignidade` +10, `Legitimidade` +10 |
| **Consequência A** | "A mensagem chega onde o governo não chegava. O templo vira posto." |
| **Eixo A** | [0, 0, -1, 0] |
| **Atores A** | `ACT-012` +1 |
| **Evento A** | — |
| **Opção B** | Usar a rede pública |
| **Cor B** | Azul |
| **Efeitos B** | `Caixa` -10, `Dignidade` +5, `Legitimidade` -5 |
| **Consequência B** | "A campanha sai pelos postos e escolas. Mais cara e mais lenta." |
| **Eixo B** | [0, 0, +1, 0] |
| **Atores B** | `ACT-012` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-035 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-035):** Boa Vontade na A. Carta ligada (Ano 2, Dignidade+).

### ATOR-036 — Sindicato dos Professores

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Professor temporário para sempre |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-013` · Exigência |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 1 |
| **Problema** | O Sindicato dos Professores exige concurso. Muitas escolas vivem de contratos temporários que vencem todo ano. |
| **Opção A** | Abrir concurso |
| **Cor A** | Vermelho |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5, `Caixa` -15 |
| **Consequência A** | "Os professores fincam raiz. A folha de pagamento cresce por décadas." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Renovar os contratos |
| **Cor B** | Laranja |
| **Efeitos B** | `Caixa` +10, `Consciência` -10 |
| **Consequência B** | "O caixa respira. Todo ano a turma troca de professor." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-013` -1 |
| **Evento B** | "Turmas começam o ano sem professor" · atraso 1 · `Consciência` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-ATOR-036 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-036):** Mecanismo: vínculo precário × custo permanente. Não repete o piso (INST-027).

### ATOR-037 — Sindicato dos Professores

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Greve das escolas na Justiça |
| **Tipo** | Ator |
| **Modo** | Judiciário |
| **Função** | `ACT-013` · Ataque |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 1 |
| **Problema** | Furioso, o Sindicato dos Professores para as escolas federais. O governo pode pedir à Justiça que corte o ponto. |
| **Opção A** | Pedir o corte do ponto |
| **Cor A** | Azul |
| **Efeitos A** | `Caixa` +10, `Consciência` -10, `Legitimidade` -5 |
| **Consequência A** | "A Justiça manda voltar às aulas. Os professores voltam, ressentidos." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-013` -1 |
| **Evento A** | — |
| **Opção B** | Abrir a negociação |
| **Cor B** | Vermelho |
| **Efeitos B** | `Consciência` +5, `Caixa` -15, `Capital Político` -5 |
| **Consequência B** | "A mesa reabre. A greve acaba, e a conta fica para o orçamento." |
| **Eixo B** | [-1, 0, 0, +1] |
| **Atores B** | `ACT-013` +1, `ACT-015` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-037 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-037):** Mecanismo: greve no serviço público e corte de ponto pela Justiça.

### ATOR-038 — Sindicato dos Professores

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Professores criam cursinho popular |
| **Tipo** | Ator |
| **Modo** | Currículo e Mídia |
| **Função** | `ACT-013` · Oferta |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Problema** | Aliado, o Sindicato dos Professores oferece aulas gratuitas de preparação para o vestibular nas periferias, em escolas fechadas à noite. |
| **Opção A** | Abrir as escolas à noite |
| **Cor A** | Verde |
| **Efeitos A** | `Consciência` +15, `Dignidade` +5 |
| **Consequência A** | "As salas acendem à noite. Quem trabalha volta a mirar a faculdade." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Comprar curso online |
| **Cor B** | Amarelo |
| **Efeitos B** | `Caixa` -10, `Consciência` +5 |
| **Consequência B** | "Uma plataforma de fora entra nas escolas. Sem professor perto." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-013` -1, `ACT-020` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-038 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-038):** Boa Vontade na A. Carta ligada (Ano 2, Dignidade+). Diplomacia +1 na B (plataforma estrangeira).

### ATOR-039 — Profissionais da Saúde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Piso da enfermagem |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-014` · Exigência |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Problema** | Os Profissionais da Saúde exigem o piso da enfermagem. Hospitais filantrópicos dizem que vão fechar leitos para pagar. |
| **Opção A** | Pagar o piso |
| **Cor A** | Vermelho |
| **Efeitos A** | `Dignidade` +10, `Caixa` -20 |
| **Consequência A** | "A enfermagem comemora. A União banca a diferença das santas casas." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-014` +1 |
| **Evento A** | — |
| **Opção B** | Adiar o piso |
| **Cor B** | Azul |
| **Efeitos B** | `Caixa` +10, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "Os leitos ficam abertos. A enfermagem segue com dois empregos." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-014` -1 |
| **Evento B** | "Enfermeiras cruzam os braços nos hospitais" · atraso 1 · `Dignidade` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-ATOR-039 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-039):** Mecanismo: piso salarial sem fonte de custeio.

### ATOR-040 — Profissionais da Saúde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Remédio caro por patente |
| **Tipo** | Ator |
| **Modo** | Geopolítico |
| **Função** | `ACT-014` · Ataque |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Problema** | Furiosos, os Profissionais da Saúde acusam o governo de deixar pacientes sem um remédio caro, protegido por patente estrangeira. |
| **Opção A** | Quebrar a patente |
| **Cor A** | Vermelho |
| **Efeitos A** | `Dignidade` +15, `Soberania` +5, `Capital Político` -10 |
| **Consequência A** | "O genérico chega ao SUS. O laboratório estrangeiro ameaça ir embora." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-014` +1, `ACT-021` -1 |
| **Evento A** | — |
| **Opção B** | Negociar o preço |
| **Cor B** | Azul |
| **Efeitos B** | `Caixa` -15, `Dignidade` +5, `Legitimidade` -5 |
| **Consequência B** | "O laboratório dá desconto. A compra cobre só parte dos pacientes." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-014` -1, `ACT-021` +1 |
| **Evento B** | "Pacientes vão à Justiça pelo remédio" · atraso 2 · `Caixa` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-ATOR-040 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-040):** Mecanismo: licença compulsória. `ACT-021` como dono da patente (aproximação: não há ator da indústria farmacêutica).

### ATOR-041 — Profissionais da Saúde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Postos contra a violência |
| **Tipo** | Ator |
| **Modo** | Prisional e Policial |
| **Função** | `ACT-014` · Oferta |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 2 |
| **Problema** | Aliados, os Profissionais da Saúde propõem que os postos acolham vítimas de violência e avisem a rede de proteção. |
| **Opção A** | Acolher nos postos |
| **Cor A** | Roxo |
| **Efeitos A** | `Segurança` +10, `Dignidade` +10 |
| **Consequência A** | "Vítimas encontram porta aberta perto de casa. A notificação cresce." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-014` +1 |
| **Evento A** | — |
| **Opção B** | Deixar com a polícia |
| **Cor B** | Preto |
| **Efeitos B** | `Segurança` +5, `Dignidade` -10 |
| **Consequência B** | "O caso vai direto à delegacia. Muita vítima desiste antes de entrar." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-041 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-041):** Boa Vontade na A. Carta ligada (Ano 2, Segurança+ e Dignidade+).


## Relatório do script

`cards_doc.py check --no-learning --wave-report --style`: 0 erros, 0 avisos de estilo; `box --json` sai 0. Avisos de Técnica (D-119) são do baralho, não desta onda.

## Propostas ao PO

- ATOR-040 usa `ACT-021` como dono da patente (não há ator da indústria farmacêutica).
- Dados e fatos só nas pistas (`aprendizados.md`), para o P-016.
