# Onda 17 do P-015 — INST-155 a INST-165 — rascunho do GD (modo D-196)

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-17/cartas.md --no-learning --wave-report --style`

## Progresso

- [x] Brief D-196, kit, doc 12 (MOD-008 :409-449, MOD-009 :459-497), DP-011, GDD 03, doc 17 (títulos já escritos e INST-161 :3313), títulos das Ondas 1-12
- [x] Cartas escritas
- [x] Check com 0 erros e 0 avisos de estilo
- [x] Aprendizados (md e json)

## Convenções desta onda

- Impeachment (DP-011): pressão e legitimidade antes do processo, nunca as fases da cena IMP-1..5. Onda 15/16 (INST-141..154) não existiam ao escrever; conferir repetição no fechamento.
- Judiciário: um mecanismo por carta, com alavanca real do Executivo (lei, PEC, indicação, Defensoria, PF). Nenhuma pessoa nem caso identificável (RC-08, D-190).
- Temas do doc 12 que repetiam cartas escritas (INST-005, 083, 097, 123, 161) foram trocados; ver notas e propostas.
- Nenhum número no texto ao jogador; fatos na pista do Aprendizado.

---

### INST-155 — Lutar até o Fim

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vice conversa com rivais |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Seu vice janta com líderes da oposição. Nos corredores, já falam do governo dele. Você pode romper em público ou trazê-lo para perto. |
| **Opção A** | Romper com o vice |
| **Efeitos A** | `Legitimidade` +10, `Consciência` +5, `Capital Político` -15 |
| **Consequência A** | "O vice vira oposição. Os rivais ganham um nome para o dia seguinte." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Dar um ministério a ele |
| **Efeitos B** | `Capital Político` +10, `Integridade` -5, `Legitimidade` -5 |
| **Consequência B** | "O vice ganha poder e sorri na foto. A conversa com a oposição continua." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-155 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-155):** Pressão antes do processo (DP-011): a linha sucessória como motor do impeachment. Não repete a INST-149 planejada (racha da base).

### INST-156 — Pedir Apoio Internacional

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Nota de governos estrangeiros |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Governos vizinhos querem soltar uma nota em defesa do seu mandato. A oposição diz que é interferência de fora na política do país. |
| **Opção A** | Aceitar a nota |
| **Efeitos A** | `Legitimidade` +10, `Soberania` -10, `Capital Político` -5 |
| **Consequência A** | "A nota sai. Lá fora, você ganha aliados; aqui, a oposição fala em traição." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-010` +1 |
| **Evento A** | — |
| **Opção B** | Recusar a nota |
| **Efeitos B** | `Soberania` +10, `Legitimidade` -5, `Consciência` -5 |
| **Consequência B** | "Você trata a crise em casa. Ninguém de fora fala pelo seu governo." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-010` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-156 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-156):** Tema do banco "Pedir apoio internacional" (doc 12 :445). Diplomacia ±1.

### INST-157 — Acionar o STF

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pedidos na gaveta |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | O presidente da Câmara guarda pedidos de impeachment na gaveta. Ele não arquiva nem abre: usa os pedidos como ameaça a cada votação. |
| **Opção A** | Pedir prazo ao STF |
| **Efeitos A** | `Legitimidade` +5, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "O STF analisa o caso. O presidente da Câmara se sente afrontado." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | "A Câmara trava suas pautas em resposta" · atraso 1 · `Capital Político` -10 |
| **Opção B** | Ceder nas votações |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Integridade` -5 |
| **Consequência B** | "A gaveta segue fechada. A cada votação, o preço sobe um pouco." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-157 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-157):** Tema "Acionar o STF" (doc 12 :446) antes do processo, como a gaveta (não a fase 1 da cena).

### INST-158 — Convocar Plebiscito

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Consulta sobre o mandato |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Um aliado propõe que o povo vote se você fica no cargo. A lei não prevê esse voto, e mudar a regra leva tempo. |
| **Opção A** | Propor a consulta |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "O debate toma o país. O Congresso diz que você foge da crise." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-024` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Governar sem consulta |
| **Efeitos B** | `Capital Político` +5, `Consciência` -5 |
| **Consequência B** | "A ideia some. A crise segue nas mãos do Congresso." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-024` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-158 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-158):** Tema "Convocar plebiscito" (doc 12 :447). Estado +1 para participação direta.

### INST-159 — Renunciar antes da Condenação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Manobra nas contas |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | O caixa não fecha. Um técnico sugere atrasar repasses aos bancos públicos para pagar benefícios. Juristas veem crime de responsabilidade. |
| **Opção A** | Atrasar os repasses |
| **Efeitos A** | `Dignidade` +10, `Caixa` +5, `Integridade` -15 |
| **Consequência A** | "Os benefícios saem em dia. A oposição guarda o caso para usar depois." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-007` +1 |
| **Evento A** | "A oposição usa as contas num pedido de impeachment" · atraso 2 · `Capital Político` -15, `Legitimidade` -5 |
| **Opção B** | Cortar benefícios |
| **Efeitos B** | `Integridade` +10, `Dignidade` -15, `Legitimidade` -5 |
| **Consequência B** | "As contas fecham dentro da lei. Famílias recebem menos este mês." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-006` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-159 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-159):** Troca do tema "Renunciar" (doc 12 :448), que é desfecho da cena: aqui é a semente do processo. Proposta ao PO.

### INST-160 — Aceitar a Condenação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Recado do quartel |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Azul |
| **Problema** | Um general diz, em segredo, que a tropa garante seu mandato se o Congresso tentar te tirar. Em troca, quer voz nas decisões. |
| **Opção A** | Aceitar a garantia |
| **Efeitos A** | `Segurança` +10, `Capital Político` +10, `Legitimidade` -15, `Integridade` -10 |
| **Consequência A** | "Os quartéis ficam do seu lado. A democracia fica refém da farda." |
| **Eixo A** | [0, 0, 0, -2] |
| **Atores A** | `ACT-008` +1 |
| **Evento A** | "Militares cobram cargos no governo" · atraso 1 · `Integridade` -10, `Capital Político` -5 |
| **Opção B** | Recusar a garantia |
| **Efeitos B** | `Legitimidade` +15, `Segurança` -10, `Capital Político` -5 |
| **Consequência B** | "Você exige silêncio da tropa. O general sai irritado." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-008` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-160 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-160):** Troca do tema "Aceitar a condenação" (doc 12 :449), também desfecho da cena. Tema sensível (ditadura): sem detalhe; dúvida ao PSI quando houver revisão.

### INST-162 — Desembargador Vendendo Sentenças

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Sentenças à venda |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | A PF prova que juízes de um tribunal vendiam sentenças. A punição máxima deles é a aposentadoria, com salário. Você pode propor mudar isso. |
| **Opção A** | Propor o fim da regalia |
| **Efeitos A** | `Integridade` +15, `Consciência` +10, `Capital Político` -15 |
| **Consequência A** | "Associações de juízes reagem. O povo aplaude a proposta." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-023` +1 |
| **Evento A** | "Tribunais atrasam processos do governo" · atraso 2 · `Capital Político` -10 |
| **Opção B** | Deixar com o CNJ |
| **Efeitos B** | `Capital Político` +10, `Integridade` -10, `Consciência` -5 |
| **Consequência B** | "O CNJ aposenta os juízes. Eles seguem com o salário em casa." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-162 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-162):** Tema do banco (doc 12 :479), sem caso real.

### INST-163 — STF Declara Lei Inconstitucional

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Lei derrubada no Supremo |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | Supremo Tribunal Federal |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Verde |
| **Problema** | O STF derruba sua lei que proíbe espalhar agrotóxico de avião. Ambientalistas pedem uma emenda à Constituição para driblar a decisão. |
| **Opção A** | Cumprir e reescrever |
| **Efeitos A** | `Legitimidade` +10, `Integridade` +5, `Dignidade` -10 |
| **Consequência A** | "A lei cai. Seu time escreve outra, e as vilas perto das lavouras esperam." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-001` +1, `ACT-018` -1 |
| **Evento A** | — |
| **Opção B** | Driblar com emenda |
| **Efeitos B** | `Dignidade` +10, `Capital Político` -10, `Legitimidade` -10 |
| **Consequência B** | "A emenda avança. O STF e o Congresso entram em choque." |
| **Eixo B** | [-1, 0, 0, -1] |
| **Atores B** | `ACT-018` +1, `ACT-001` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-163 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-163):** Tema "Freios e contrapesos" (doc 12 :480). Não repete a INST-005 (Congresso contra decisão do STF sobre terra indígena): aqui a lei é sua.

### INST-164 — Juiz Bloqueia Política Social

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Liminar trava a moradia |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Roxo |
| **Problema** | Um juiz suspende sozinho seu programa de moradia, numa decisão provisória. As obras param até o tribunal julgar o recurso. |
| **Opção A** | Recorrer em silêncio |
| **Efeitos A** | `Integridade` +5, `Legitimidade` +5, `Dignidade` -10 |
| **Consequência A** | "A AGU recorre. As famílias esperam meses pelas chaves." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-016` -1 |
| **Evento A** | — |
| **Opção B** | Atacar o juiz em público |
| **Efeitos B** | `Consciência` +5, `Legitimidade` -10, `Integridade` -5 |
| **Consequência B** | "Sua base vibra. Juristas dizem que você ameaça a Justiça." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-016` +1, `ACT-023` -1 |
| **Evento B** | "Juízes se unem contra o governo" · atraso 1 · `Capital Político` -10 |
| **Aprendizado** | APR-164 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-164):** Tema "Seletividade" (doc 12 :481), com o mecanismo da liminar.

### INST-165 — PF Prende Governador Aliado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fim do foro especial |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | Deputados só podem ser julgados no STF, onde os casos andam devagar. Uma PEC leva esses processos para a primeira instância. |
| **Opção A** | Apoiar a PEC |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -15 |
| **Consequência A** | "Políticos passam a ser julgados como todo mundo. Aliados se assustam." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-011` -1, `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Manter o foro |
| **Efeitos B** | `Capital Político` +10, `Integridade` -10, `Legitimidade` -5 |
| **Consequência B** | "Os processos seguem no STF. A base agradece o silêncio." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-165 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-165):** Troca do tema "PF prende governador aliado" (doc 12 :482), que repete a INST-097 (Prisional). Proposta ao PO.


## Relatório do script

```

10 cartas conferidas, 0 erros.

Avisos do baralho (todas as cartas do doc 17):
  Eventos: 5 de 20 opções (25%; meta 15-25%, D-125)
  Eixo Economia ≠ 0: 3 (15%)
  Eixo Diplomacia ≠ 0: 2 (10%)  ⚠ abaixo de 15% (D-126)
  Eixo Sociedade ≠ 0: 3 (15%)
  Eixo Estado ≠ 0: 8 (40%)
  Cor black: awareness -5, integrity -10, legitimacy -20, political_capital +10, security +10, sovereignty +10
  Cor blue: awareness -5, dignity -20, integrity +15, legitimacy +35, political_capital -15, security -10
  Cor green: dignity +10, legitimacy -10, political_capital -10
  Cor orange: awareness +5, dignity -15, integrity +20, legitimacy -5, political_capital -15
  Cor purple: awareness +15, integrity -5, legitimacy +5, political_capital -10, sovereignty -10, treasury -10
  Cor red: awareness +15, dignity +10, integrity +0, legitimacy +10, political_capital -30, treasury +5
  Cor yellow: awareness -5, integrity -30, legitimacy -10, political_capital +40, treasury -10
  Carta ligada — dignity: 2 opções com efeito positivo (1 com ano mínimo 2-4)
  Carta ligada — awareness: 5 opções com efeito positivo (4 com ano mínimo 2-4)
  Carta ligada — sovereignty: 1 opções com efeito positivo (1 com ano mínimo 2-4)
  Carta ligada — security: 1 opções com efeito positivo (1 com ano mínimo 2-4)
  Carta ligada — integrity: 6 opções com efeito positivo (4 com ano mínimo 2-4)
  Carta ligada — treasury: 1 opções com efeito positivo (0 com ano mínimo 2-4)
  Carta ligada — political_capital: 6 opções com efeito positivo (5 com ano mínimo 2-4)
  Carta ligada — legitimacy: 7 opções com efeito positivo (7 com ano mínimo 2-4)
  Cartas por modo/tipo: impeachment 6, judiciary 4
```

## Propostas ao PO

- Trocas de tema registradas nas notas (repetição com cartas escritas ou desfecho da cena). Diplomacia abaixo da meta: o Judiciário quase não tem ator de fora.
- Sem PSI (D-196); temas sensíveis marcados nas notas.
