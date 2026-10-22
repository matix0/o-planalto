# Onda 10 do P-015 — Prisional e Policial (INST-083 a INST-092) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo:** D-196 (sem pesquisa web, sem PSI)
**Status:** CONCLUÍDO — todas as cartas "pendente de revisão (D-196)"; nada gravado no doc 17.

## Progresso

- [x] Brief D-196, kit, ficha MOD-005 (`docs/12_FICHAS_DOS_MODOS.md:265-305`), INST-081/082 (doc 17 `:1435-1489`), INST-074 (Onda 4), INST-199 (Onda 3), proposta 3 da Onda 5 (maioridade penal)
- [x] 10 cartas escritas
- [x] Check com 0 erros e 0 avisos de estilo
- [x] Aprendizados (md + json, modo pendente)

## Convenções e propostas ao PO

1. **INST-087** "Redução da maioridade penal" vira **internação de adolescentes** (ECA), seguindo a proposta 3 da Onda 5 (a PEC fica no Congresso, INST-010).
2. **INST-086** evita repetir a INST-199 (inteligência financeira × espetáculo): aqui o dilema é o Estado ofertar o serviço que a facção controla × ocupação.
3. **INST-083** com Dip +1 em A (alinhar a política de drogas a recomendações internacionais); alternativa: 0.
4. Punitivismo segue a convenção da Onda 5: Soc −1, Est −1 ou −2.
5. Sem detalhe gráfico, sem nome de facção, sem "favela" como sinônimo de crime: "bairro". Dúvidas para o PSI: 084 (operação letal), 089 (tiroteio e escola), 091 (criminalização de liderança).

---

### INST-083 — Descriminalização da Maconha

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Porte para uso pessoal |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Preto |
| **Problema** | A lei não diz quanta droga é uso pessoal. A polícia decide na hora, e jovens com pouca droga são presos como traficantes. |
| **Opção A** | Definir um critério |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "A regra fica clara. Pastores acusam o governo de liberar a droga." |
| **Eixo A** | [0, +1, +1, +1] |
| **Atores A** | `ACT-012` -1, `ACT-014` +1 |
| **Evento A** | — |
| **Opção B** | Manter a lei |
| **Efeitos B** | `Capital Político` +5, `Dignidade` -10, `Caixa` -10 |
| **Consequência B** | "Nada muda. A decisão segue com quem faz a abordagem." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-012` +1 |
| **Evento B** | "Presídios recebem mais jovens presos com pouca droga." · atraso 2 · `Dignidade` -10, `Segurança` -5 |
| **Aprendizado** | APR-083 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-083):** Tema Drogas (`docs/12_FICHAS_DOS_MODOS.md:283`). Mecanismo: critério objetivo × discricionariedade policial. Sem dizer quem é abordado; o Aprendizado trata a seletividade.

### INST-084 — Operação Policial Letal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Operação com muitas mortes |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Uma operação policial num bairro termina com muitos mortos. O governador comemora; as famílias pedem perícia independente. |
| **Opção A** | Pedir perícia federal |
| **Efeitos A** | `Integridade` +10, `Dignidade` +10, `Capital Político` -15 |
| **Consequência A** | "Peritos federais chegam. O governador diz que você está do lado do crime." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-023` +1, `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Apoiar o governador |
| **Efeitos B** | `Segurança` +5, `Capital Político` +5, `Dignidade` -15, `Legitimidade` -5 |
| **Consequência B** | "A operação vira modelo. As famílias seguem sem respostas." |
| **Eixo B** | [0, 0, -1, -2] |
| **Atores B** | `ACT-008` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-084 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-084):** Chacina (banco `:284`) sem detalhe gráfico. Mecanismo: quem investiga a polícia. Ano 2: Dignidade+ ligada. Dúvida ao PSI.

### INST-085 — Câmeras em Uniformes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Câmeras nas fardas |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Estados pedem verba federal para câmeras nas fardas. Técnicos querem gravação sem pausa; associações de policiais rejeitam. |
| **Opção A** | Exigir gravação contínua |
| **Efeitos A** | `Segurança` +10, `Integridade` +10, `Caixa` -15 |
| **Consequência A** | "As câmeras gravam o turno todo. Policiais reclamam de vigilância." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-007` +1, `ACT-008` -1 |
| **Evento A** | — |
| **Opção B** | Deixar a critério |
| **Efeitos B** | `Capital Político` +10, `Integridade` -10 |
| **Consequência B** | "Cada estado decide. Em muitos, a câmera liga só quando o policial quer." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-008` +1, `ACT-007` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-085 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-085):** Transparência (banco `:285`). Mecanismo: condicionar verba federal a regra. Ano 2: Segurança+ ligada.

### INST-086 — Facção Controla Transporte

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vans da facção |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Uma facção cobra taxa dos motoristas de van e controla as linhas de um bairro. Moradores pedem ônibus que chegue até lá. |
| **Opção A** | Criar linha pública |
| **Efeitos A** | `Dignidade` +10, `Segurança` +5, `Caixa` -15 |
| **Consequência A** | "O ônibus chega ao bairro. A facção perde parte da renda." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-016` +1 |
| **Evento A** | — |
| **Opção B** | Ocupar com tropas |
| **Efeitos B** | `Segurança` +10, `Caixa` -10, `Dignidade` -10 |
| **Consequência B** | "Tropas ocupam o bairro. Os moradores passam a ser revistados todo dia." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-008` +1, `ACT-016` -1 |
| **Evento B** | "A tropa sai e a facção volta a cobrar." · atraso 2 · `Segurança` -15 |
| **Aprendizado** | APR-086 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-086):** Crime organizado (banco `:286`), sem nome de facção; moradores como vítimas, não suspeitos. Ano 2: Dignidade+ e Segurança+ ligadas.

### INST-087 — Redução da Maioridade Penal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Internação de adolescentes |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | A Câmara quer ampliar o tempo de internação de adolescentes infratores. As unidades já estão lotadas. |
| **Opção A** | Investir no meio aberto |
| **Efeitos A** | `Dignidade` +10, `Segurança` -5, `Caixa` -10 |
| **Consequência A** | "Jovens cumprem medida na escola e no trabalho. Críticos falam em impunidade." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Ampliar a internação |
| **Efeitos B** | `Segurança` +10, `Dignidade` -10, `Caixa` -15 |
| **Consequência B** | "Os jovens ficam mais tempo internados. As unidades lotam de vez." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-012` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-087 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-087):** Tema trocado (proposta 1). Mecanismo: medidas do ECA, não a PEC.

### INST-088 — Separação de Presos por Facção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Presos separados por facção |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 3 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | Presídios separam presos por facção para evitar mortes. Mas assim cada ala vira território da facção, que recruta quem chega. |
| **Opção A** | Manter a separação |
| **Efeitos A** | `Segurança` +10, `Integridade` -5, `Dignidade` -5 |
| **Consequência A** | "As brigas diminuem. As facções continuam a recrutar nas alas." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Misturar os presos |
| **Efeitos B** | `Integridade` +10, `Segurança` -10, `Caixa` -10 |
| **Consequência B** | "Os presos são misturados e a vigilância aumenta. A tensão sobe." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-009` +1 |
| **Evento B** | "Uma briga entre facções deixa mortos num presídio." · atraso 1 · `Segurança` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-088 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-088):** Sistema prisional (banco `:287`). Dilema técnico sem resposta fácil; eixo quase zero. Ano 3: Segurança+ e Integridade+ ligadas.

### INST-089 — Polícia Invade Escola

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Tiroteio perto da escola |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Escolas fecham por tiroteios durante operações. Professores pedem regra que evite operação perto da escola em horário de aula. |
| **Opção A** | Criar a regra |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Segurança` -5 |
| **Consequência A** | "Operações perto de escolas ficam para fora do horário de aula." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-013` +1, `ACT-008` -1 |
| **Evento A** | — |
| **Opção B** | Deixar com a polícia |
| **Efeitos B** | `Capital Político` +5, `Dignidade` -10, `Consciência` -5 |
| **Consequência B** | "A polícia mantém a decisão. As aulas continuam suspensas." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-008` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-089 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-089):** Violência (banco `:288`) sem cena. Ano 2: Dignidade+ ligada. Dúvida ao PSI.

### INST-090 — Redução de Danos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Redução de danos |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Prefeituras pedem verba para abrigar usuários de drogas na rua sem exigir abstinência. Comunidades religiosas querem a verba. |
| **Opção A** | Financiar o cuidado |
| **Efeitos A** | `Dignidade` +10, `Segurança` +5, `Capital Político` -10, `Caixa` -10 |
| **Consequência A** | "Mais gente sai da rua e procura tratamento. Pastores reclamam." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-014` +1, `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Comunidades religiosas |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -5, `Integridade` -5 |
| **Consequência B** | "A verba vai para as comunidades. Quem não aceita a regra volta à rua." |
| **Eixo B** | [+1, 0, -1, 0] |
| **Atores B** | `ACT-012` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-090 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-090):** Saúde pública (banco `:289`). Mecanismo: modelo de cuidado. Sem descrever usuários de forma estigmatizante.

### INST-091 — Líder Comunitário Preso

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Líder de bairro preso |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 3 |
| **Cor A** | Azul |
| **Cor B** | Preto |
| **Problema** | Um líder de bairro que denunciava abusos da polícia é preso, acusado sem prova pública de ligação com facção. A ONU cobra o Brasil. |
| **Opção A** | Pedir apuração isenta |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "O caso é revisto por órgão independente. A polícia se diz desrespeitada." |
| **Eixo A** | [0, +1, +1, +1] |
| **Atores A** | `ACT-010` +1, `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Confiar na polícia |
| **Efeitos B** | `Segurança` +5, `Capital Político` +5, `Integridade` -10 |
| **Consequência B** | "A prisão é mantida. Outras lideranças param de denunciar." |
| **Eixo B** | [0, -1, 0, -1] |
| **Atores B** | `ACT-010` -1, `ACT-008` +1 |
| **Evento B** | "Um relatório internacional cita o Brasil." · atraso 1 · `Legitimidade` -10 |
| **Aprendizado** | APR-091 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-091):** Criminalização (banco `:290`). 'Sem prova' é acusação a pessoa, como pede o kit §5. Dip +1 cooperar com a ONU; −1 rejeitar a cobrança. Ano 3: Integridade+ e Legitimidade+ ligadas.

### INST-092 — Fim das Saidinhas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Saída temporária |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | O Congresso aprova o fim da saída temporária de presos para visitar a família. Diretores de presídio pedem o veto. |
| **Opção A** | Vetar o fim |
| **Efeitos A** | `Dignidade` +5, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "A saída continua. A oposição diz que você solta bandidos." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-009` +1 |
| **Evento A** | — |
| **Opção B** | Sancionar o fim |
| **Efeitos B** | `Capital Político` +10, `Segurança` +5, `Dignidade` -10 |
| **Consequência B** | "A saída acaba. Os presos perdem o contato com a família." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-009` -1 |
| **Evento B** | "Sem visitas à família, crescem os motins." · atraso 2 · `Segurança` -10 |
| **Aprendizado** | APR-092 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-092):** Ressocialização (banco `:291`). Sem número de quem não volta; o dado vai para o Aprendizado.

## Relatório do script (2026-10-22)

`check --no-learning --wave-report --style` → 10 cartas, 0 erros, 0 avisos de estilo (saída 0). `box --json aprendizados.json` → saída 0. Eventos 5/20 (25%); Diplomacia ≠ 0 em 3 opções; avisos de técnica do Influenciador não se aplicam ao modo.
