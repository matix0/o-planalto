# Onda 20 do P-015 — Temáticas de Reforma Agrária (THEM-002 a THEM-010) — rascunho do GD

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

### THEM-002 — Pistoleiros no acampamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pistoleiros no acampamento |
| **Tipo** | Temática |
| **Modo** | Prisional e Policial |
| **Tema** | Reforma Agrária |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Pistoleiros ameaçam um acampamento sem-terra. A polícia local é próxima dos fazendeiros da região. |
| **Opção A** | Enviar a Força Nacional |
| **Efeitos A** | `Segurança` +10, `Dignidade` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "A Força Nacional chega. Os fazendeiros acusam o governo de invadir o estado." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-017` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Deixar com o estado |
| **Efeitos B** | `Capital Político` +10, `Segurança` -10, `Legitimidade` -5 |
| **Consequência B** | "O governador agradece. As ameaças no acampamento continuam." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-001` +1 |
| **Evento B** | "Um líder do acampamento é morto numa emboscada" · atraso 1 · `Dignidade` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-THEM-002 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-002):** Violência no campo (THEM-002 do rascunho eloquent, só ideia). Mecanismo: federalismo na segurança, sem repetir a INST de operação policial. Evento sem detalhe gráfico (aviso de conteúdo). Ano 2: carta ligada a Segurança+.

### THEM-003 — Indenização da fazenda

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Indenização da fazenda |
| **Tipo** | Temática |
| **Modo** | Judiciário |
| **Tema** | Reforma Agrária |
| **Quem fala** | Justiça Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Um laudo diz que uma fazenda não cumpre a função social. O dono recorre e pede indenização acima do valor de mercado. |
| **Opção A** | Pagar com títulos |
| **Efeitos A** | `Dignidade` +10, `Soberania` +5, `Capital Político` -10 |
| **Consequência A** | "A terra vai para a reforma. O dono recebe títulos a longo prazo." |
| **Eixo A** | [-2, 0, 0, +1] |
| **Atores A** | `ACT-017` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Pagar o valor pedido |
| **Efeitos B** | `Capital Político` +10, `Caixa` -20, `Integridade` -5 |
| **Consequência B** | "O dono sai satisfeito. Sobra menos verba para outras famílias." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-001` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-003 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-003):** Desapropriação (THEM-003 do eloquent, só ideia). Não repete a THEM-001 (ocupação × despejo): aqui a terra já foi julgada e a disputa é o preço.

### THEM-004 — Confisco por trabalho escravo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Confisco por trabalho escravo |
| **Tipo** | Temática |
| **Modo** | Congresso |
| **Tema** | Reforma Agrária |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Verde |
| **Problema** | Fiscais acham trabalho escravo numa fazenda. A Constituição manda confiscar a terra, mas falta a lei que regula o confisco. |
| **Opção A** | Regulamentar o confisco |
| **Efeitos A** | `Dignidade` +15, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "A lei passa por pouco. A bancada do agro promete revanche." |
| **Eixo A** | [-1, 0, +1, +1] |
| **Atores A** | `ACT-001` -1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Só multar o dono |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "O dono paga a multa e segue com a terra." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-001` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-004 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-004):** Trabalho escravo (THEM-004 do eloquent). Fica em Reforma Agrária pela terra; o tema Trabalho (THEM-041..050) deve evitar o confisco. Mecanismo: norma que depende de regulamentação. Ano 2: Dignidade+ ligada.

### THEM-005 — Assentamento sem luz

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Assentamento sem luz |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Reforma Agrária |
| **Quem fala** | Ministério do Planejamento |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Roxo |
| **Problema** | Famílias assentadas há anos seguem sem luz, água e assistência técnica. A verba só cobre novos assentamentos. |
| **Opção A** | Estruturar os antigos |
| **Efeitos A** | `Dignidade` +10, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "Os assentados ganham luz e poço. Os acampados protestam na estrada." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-017` -1 |
| **Evento A** | — |
| **Opção B** | Abrir novos assentamentos |
| **Efeitos B** | `Dignidade` +5, `Soberania` +5, `Caixa` -10, `Legitimidade` -5 |
| **Consequência B** | "Novas famílias recebem terra. As antigas seguem sem estrutura." |
| **Eixo B** | [-2, 0, 0, 0] |
| **Atores B** | `ACT-017` +1 |
| **Evento B** | "Lotes sem apoio são vendidos a fazendeiros" · atraso 2 · `Dignidade` -10, `Integridade` -5 |
| **Aprendizado** | APR-THEM-005 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-005):** Mecanismo: escolha orçamentária entre expandir e consolidar. Custo nas duas: Capital Político com o movimento ou Legitimidade com os antigos. Ano 2: Dignidade+ ligada.

### THEM-006 — Grilagem no cartório

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Grilagem no cartório |
| **Tipo** | Temática |
| **Modo** | Judiciário |
| **Tema** | Reforma Agrária |
| **Quem fala** | Conselho Nacional de Justiça |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Verde |
| **Problema** | Um cartório registra títulos falsos de terra pública. Os grileiros pedem que o governo regularize as áreas já ocupadas. |
| **Opção A** | Cancelar os registros |
| **Efeitos A** | `Integridade` +10, `Soberania` +5, `Capital Político` -15 |
| **Consequência A** | "Os títulos falsos caem. A bancada do agro trava a pauta do governo." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Regularizar as áreas |
| **Efeitos B** | `Capital Político` +10, `Caixa` +5, `Integridade` -15 |
| **Consequência B** | "Os grileiros ganham o papel. A terra pública vira privada." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-001` +1 |
| **Evento B** | "Novas invasões de terra pública aparecem" · atraso 2 · `Soberania` -10, `Integridade` -5 |
| **Aprendizado** | APR-THEM-006 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-006):** Mecanismo: regularização como incentivo à invasão. Não repete a INST-073 (estrangeiros) nem a INST-133 (anistia ambiental).

### THEM-007 — Escola do campo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escola do campo |
| **Tipo** | Temática |
| **Modo** | Currículo e Mídia |
| **Tema** | Reforma Agrária |
| **Quem fala** | Ministério da Educação |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Um assentamento pede escola com currículo do campo. A prefeitura quer fechar a escola e levar os alunos de ônibus à cidade. |
| **Opção A** | Manter a escola do campo |
| **Efeitos A** | `Dignidade` +10, `Consciência` +10, `Caixa` -10 |
| **Consequência A** | "A escola fica. As crianças estudam perto de casa." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-013` +1, `ACT-017` +1 |
| **Evento A** | — |
| **Opção B** | Transportar à cidade |
| **Efeitos B** | `Caixa` +10, `Dignidade` -5, `Consciência` -5 |
| **Consequência B** | "A prefeitura economiza. As crianças passam horas na estrada." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-007 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-007):** Mecanismo: nucleação escolar. Liga a reforma agrária à educação, sem repetir as cartas de currículo do doc 17.

### THEM-008 — Royalty sobre sementes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Royalty sobre sementes |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Reforma Agrária |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Uma multinacional cobra royalties de sementes guardadas por pequenos agricultores. Um acordo comercial exige o pagamento. |
| **Opção A** | Proteger as sementes |
| **Efeitos A** | `Soberania` +10, `Dignidade` +5, `Caixa` -5, `Capital Político` -5 |
| **Consequência A** | "Os agricultores guardam as sementes. O parceiro comercial ameaça retaliar." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-021` -1, `ACT-006` -1, `ACT-017` +1 |
| **Evento A** | — |
| **Opção B** | Cumprir o acordo |
| **Efeitos B** | `Caixa` +10, `Soberania` -10, `Dignidade` -5 |
| **Consequência B** | "O acordo segue. O pequeno agricultor paga para plantar a própria colheita." |
| **Eixo B** | [+1, +2, 0, 0] |
| **Atores B** | `ACT-021` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-008 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-008):** Diplomacia: A −1 (autonomia), B +2 (cumpre acordo com potência), convenção do kit §4. `ACT-021` −1 quando recusa.

### THEM-009 — CPI contra as cooperativas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | CPI contra as cooperativas |
| **Tipo** | Temática |
| **Modo** | Bancadas |
| **Tema** | Reforma Agrária |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | A bancada ruralista abre uma CPI contra o movimento sem-terra. Quer cortar os repasses às cooperativas dos assentados. |
| **Opção A** | Defender as cooperativas |
| **Efeitos A** | `Dignidade` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência A** | "Os repasses seguem. A CPI acusa o governo de proteger invasores." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-017` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Suspender os repasses |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Consciência` -5 |
| **Consequência B** | "A bancada comemora. Cooperativas fecham e a produção cai." |
| **Eixo B** | [+1, 0, -1, -1] |
| **Atores B** | `ACT-001` +1, `ACT-017` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-009 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-009):** Mecanismo: CPI como instrumento de bancada. Não repete a INST-003 (instalar CPI) nem a INST de ocupação como terrorismo. Ano 2: Dignidade+ ligada.

### THEM-010 — Terra comprada a prazo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Terra comprada a prazo |
| **Tipo** | Temática |
| **Modo** | Emendas |
| **Tema** | Reforma Agrária |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 3 |
| **Cor A** | Laranja |
| **Cor B** | Roxo |
| **Problema** | O Banco Mundial oferece crédito para o agricultor comprar terra a prazo. Deputados querem trocar a desapropriação por esse modelo. |
| **Opção A** | Aceitar o crédito |
| **Efeitos A** | `Capital Político` +10, `Dignidade` +5, `Caixa` -10 |
| **Consequência A** | "O crédito sai. O agricultor assume uma dívida longa com o banco." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-011` +1, `ACT-006` +1 |
| **Evento A** | "Agricultores endividados devolvem a terra ao banco" · atraso 2 · `Dignidade` -10, `Legitimidade` -5 |
| **Opção B** | Manter a desapropriação |
| **Efeitos B** | `Dignidade` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência B** | "O latifúndio improdutivo segue na mira. Os deputados travam suas emendas." |
| **Eixo B** | [-1, 0, 0, +1] |
| **Atores B** | `ACT-011` -1, `ACT-017` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-010 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-010):** Mecanismo: reforma agrária de mercado × desapropriação. Diplomacia +1 na A (instituição internacional). Ano 3: carta ligada a Dignidade+ (B).

## Relatório do script

Ver o retorno do GD (check com `--wave-report --style` e `box`).

## Propostas ao PO

- Cartas em modo D-196: dados e leis da pista ficam `[não verificado]` até o P-016.

## Dúvidas ao PSI (para quando voltar)

- Temas do aviso de conteúdo: violência no campo (THEM-002), facção e fome (THEM-028): sem detalhe gráfico; conferir.
