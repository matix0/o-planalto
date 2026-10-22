# Onda 22 do P-015 — Temáticas de Fome (THEM-021 a THEM-030) — rascunho do GD

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

### THEM-021 — Merenda congelada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Merenda congelada |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Fome |
| **Quem fala** | Ministério da Educação |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | A verba da merenda não sobe há anos. Prefeituras trocam comida fresca por ultraprocessados baratos. |
| **Opção A** | Reajustar a merenda |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Caixa` -15 |
| **Consequência A** | "A comida fresca volta ao prato. O ajuste fiscal aperta." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Manter o valor |
| **Efeitos B** | `Caixa` +5, `Dignidade` -10 |
| **Consequência B** | "As contas fecham. O biscoito vira almoço." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-013` -1 |
| **Evento B** | "Crianças faltam à aula nos dias sem merenda" · atraso 2 · `Dignidade` -10, `Consciência` -5 |
| **Aprendizado** | APR-THEM-021 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-021):** Mecanismo: verba congelada corroída pela inflação.

### THEM-022 — Arroz caro no mercado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Arroz caro no mercado |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Fome |
| **Quem fala** | Ministério da Agricultura |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Laranja |
| **Problema** | O arroz dispara no mercado interno. Com o dólar alto, exportadores querem vender toda a safra lá fora. |
| **Opção A** | Taxar a exportação |
| **Efeitos A** | `Dignidade` +10, `Caixa` +5, `Capital Político` -10 |
| **Consequência A** | "O arroz fica no país. Os exportadores acusam o governo de quebrar contratos." |
| **Eixo A** | [-1, -1, 0, +1] |
| **Atores A** | `ACT-001` -1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Manter a venda livre |
| **Efeitos B** | `Capital Político` +5, `Caixa` +5, `Dignidade` -10 |
| **Consequência B** | "Os exportadores lucram. O preço no mercado da esquina sobe." |
| **Eixo B** | [+1, +1, 0, -1] |
| **Atores B** | `ACT-006` +1 |
| **Evento B** | "O arroz some da mesa das periferias" · atraso 1 · `Dignidade` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-THEM-022 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-022):** Diplomacia −1 na A (controle interno), +1 na B (abertura).

### THEM-023 — Estoque de feijão

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Estoque de feijão |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Fome |
| **Quem fala** | Conab |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | O governo não tem estoque para segurar o preço do feijão. Montar estoque custa caro, e o mercado chama de intervenção. |
| **Opção A** | Recompor os estoques |
| **Efeitos A** | `Dignidade` +10, `Soberania` +5, `Caixa` -15 |
| **Consequência A** | "Os armazéns enchem. O mercado fala em gasto sem fim." |
| **Eixo A** | [-2, 0, 0, +1] |
| **Atores A** | `ACT-006` -1, `ACT-017` +1 |
| **Evento A** | — |
| **Opção B** | Deixar o mercado agir |
| **Efeitos B** | `Caixa` +10, `Dignidade` -10 |
| **Consequência B** | "O caixa respira. O preço do feijão sobe e desce sem freio." |
| **Eixo B** | [+2, 0, 0, -1] |
| **Atores B** | `ACT-006` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-023 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-023):** Ano 2: carta ligada a Dignidade+. Quem fala: Conab (órgão público, sem pessoa).

### THEM-024 — Cozinha com nome de deputado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cozinha com nome de deputado |
| **Tipo** | Temática |
| **Modo** | Emendas |
| **Tema** | Fome |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Cozinhas comunitárias pedem verba fixa. Um deputado só libera a emenda se a cozinha levar o nome dele na fachada. |
| **Opção A** | Recusar a placa |
| **Efeitos A** | `Integridade` +10, `Dignidade` -5, `Capital Político` -5 |
| **Consequência A** | "A cozinha fica sem a verba deste ano. A placa também." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar a placa |
| **Efeitos B** | `Dignidade` +10, `Integridade` -10 |
| **Consequência B** | "A comida chega. O deputado inaugura a cozinha como dono." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-011` +1, `ACT-016` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-024 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-024):** Mecanismo: personalismo na emenda. Não repete a INST de cesta básica com culto (Emendas).

### THEM-025 — Comida no lixo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Comida no lixo |
| **Tipo** | Temática |
| **Modo** | Congresso |
| **Tema** | Fome |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Azul |
| **Problema** | Supermercados jogam fora comida boa por medo de processo. Um projeto libera a doação e protege quem doa. |
| **Opção A** | Sancionar a doação |
| **Efeitos A** | `Dignidade` +10, `Caixa` -5 |
| **Consequência A** | "As sobras vão para bancos de alimentos. Os mercados ganham desconto no imposto." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-004` +1 |
| **Evento A** | — |
| **Opção B** | Vetar por risco sanitário |
| **Efeitos B** | `Segurança` +5, `Integridade` +5, `Dignidade` -10 |
| **Consequência B** | "A regra antiga fica. A comida boa segue para o lixo." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-014` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-025 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-025):** Sem evento. Custo B em Dignidade; custo A no caixa (incentivo fiscal).

### THEM-026 — Direito à comida na Justiça

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Direito à comida na Justiça |
| **Tipo** | Temática |
| **Modo** | Judiciário |
| **Tema** | Fome |
| **Quem fala** | Defensoria Pública |
| **Ano mínimo** | 3 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | A Defensoria pede na Justiça que o Estado garanta comida às famílias de uma ocupação. O juiz manda cumprir. |
| **Opção A** | Cumprir a decisão |
| **Efeitos A** | `Dignidade` +10, `Legitimidade` +5, `Caixa` -10 |
| **Consequência A** | "As famílias recebem comida. A área econômica fala em conta que não cabe." |
| **Eixo A** | [-1, 0, +1, +1] |
| **Atores A** | `ACT-016` +1 |
| **Evento A** | — |
| **Opção B** | Recorrer da decisão |
| **Efeitos B** | `Caixa` +5, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "O recurso ganha tempo. As famílias esperam com fome." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-016` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-026 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-026):** Ano 3: carta ligada a Dignidade+ e Legitimidade+.

### THEM-027 — Salgadinho no desenho

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Salgadinho no desenho |
| **Tipo** | Temática |
| **Modo** | Currículo e Mídia |
| **Tema** | Fome |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Fabricantes de salgadinho anunciam para crianças em desenhos e jogos. Nutricionistas pedem proibir esse tipo de anúncio. |
| **Opção A** | Proibir para crianças |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5, `Capital Político` -10 |
| **Consequência A** | "Os anúncios saem dos desenhos. A indústria fala em censura." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-004` -1, `ACT-014` +1 |
| **Evento A** | — |
| **Opção B** | Deixar o setor se regular |
| **Efeitos B** | `Caixa` +5, `Capital Político` +5, `Consciência` -10 |
| **Consequência B** | "A indústria promete cuidado. Os anúncios continuam nos jogos." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-004` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-027 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-027):** Opção B com 25 caracteres. Liga fome e má nutrição.

### THEM-028 — Cesta da facção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cesta da facção |
| **Tipo** | Temática |
| **Modo** | Prisional e Policial |
| **Tema** | Fome |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | No bairro sem renda, uma facção distribui cestas e cobra lealdade. A polícia quer operação; assistentes pedem programa social. |
| **Opção A** | Programa social no bairro |
| **Efeitos A** | `Dignidade` +10, `Segurança` +5, `Caixa` -10 |
| **Consequência A** | "O Estado chega com renda e cozinha. A facção perde clientes." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-016` +1 |
| **Evento A** | — |
| **Opção B** | Operação contra a facção |
| **Efeitos B** | `Segurança` +5, `Capital Político` +10, `Dignidade` -10 |
| **Consequência B** | "A operação prende alguns. As cestas param de chegar." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-008` +1 |
| **Evento B** | "A facção volta com mais cestas que antes" · atraso 2 · `Segurança` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-THEM-028 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-028):** Ano 2: Segurança+ ligada. Sem estereótipo: o bairro é sem renda, não violento por natureza.

### THEM-029 — Arroz para outro país

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Arroz para outro país |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Fome |
| **Quem fala** | Itamaraty |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Um programa da ONU pede arroz brasileiro para um país em guerra. Aqui, a fome também voltou. |
| **Opção A** | Doar o arroz |
| **Efeitos A** | `Soberania` +5, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "O arroz chega ao país em guerra. Aqui, a oposição pergunta pelo povo." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-010` +1 |
| **Evento A** | — |
| **Opção B** | Abastecer primeiro aqui |
| **Efeitos B** | `Dignidade` +5, `Capital Político` +5, `Legitimidade` -10 |
| **Consequência B** | "O arroz fica no país. Diplomatas falam em imagem arranhada." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-010` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-029 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-029):** Diplomacia +1 / −1. Custo nas duas.

### THEM-030 — Pente-fino no benefício

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pente-fino no benefício |
| **Tipo** | Temática |
| **Modo** | Bancadas |
| **Tema** | Fome |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | A bancada fiscal exige cortar benefícios com erro no cadastro. Famílias perdem a renda antes de poder se defender. |
| **Opção A** | Pagar até a revisão |
| **Efeitos A** | `Dignidade` +10, `Caixa` -10, `Integridade` -5 |
| **Consequência A** | "As famílias seguem com a renda. Fraudes também, até a revisão." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Cortar na hora |
| **Efeitos B** | `Caixa` +10, `Integridade` +5, `Dignidade` -15 |
| **Consequência B** | "O gasto cai. Famílias sem erro também perdem o benefício." |
| **Eixo B** | [+1, 0, 0, +1] |
| **Atores B** | `ACT-006` +1 |
| **Evento B** | "Famílias cortadas por engano vão à Justiça" · atraso 2 · `Legitimidade` -10, `Caixa` -5 |
| **Aprendizado** | APR-THEM-030 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-030):** Mecanismo: direito de defesa. Não repete a INST da fila do Bolsa Família (Orçamento).

## Relatório do script

Ver o retorno do GD (check com `--wave-report --style` e `box`).

## Propostas ao PO

- Cartas em modo D-196: dados e leis da pista ficam `[não verificado]` até o P-016.

## Dúvidas ao PSI (para quando voltar)

- Temas do aviso de conteúdo: violência no campo (THEM-002), facção e fome (THEM-028): sem detalhe gráfico; conferir.
