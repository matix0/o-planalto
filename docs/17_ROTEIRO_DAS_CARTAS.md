# 17 — Roteiro das Cartas

**Roteiro das cartas do jogo "O Planalto"**

Este documento guarda o texto das cartas, organizadas por modo e por tipo. **Status: 22 de 340 cartas escritas + 5 cartas da cena de impeachment (fora das 340, D-101).** Revisado no P-010 (2026-10-13): cor por opção (D-092), opções A/B com lado sorteado (D-084), Carta de Aprendizado no doc 18 (D-090).

---

## 17.01 — Estrutura do Documento

### 17.01.1. Formato das cartas

```
ID: [Código único]
Título: [Nome curto da carta]
Modo: [Modo institucional]
Tipo: [Institucional, Temática, Ator]
Problema: [Descrição do dilema]
Opção A: [Texto]
Cor A: [Cor partidária de quem propõe a opção A]
Efeitos A: [Medidores afetados]
Consequência A: [Frase curta]
Opção B: [Texto]
Cor B: [Cor partidária de quem propõe a opção B]
Efeitos B: [Medidores afetados]
Consequência B: [Frase curta]
Eixo A / Eixo B: [Eco, Dip, Soc, Est], −2 a +2 (GDD 04)
Aprendizado: [APR-xxx — texto no doc 18]
```

### 17.01.2. Regras de escrita

| Regra | Fonte |
| :--- | :--- |
| A e B são nomes internos; o jogo sorteia o lado de cada opção a cada partida e nunca escreve "esquerda/direita" | D-084 |
| Toda opção tem uma cor partidária (sem cor neutra) | D-092 |
| O ECO valida o saldo de efeitos por cor no balanceamento | D-092 |
| A Carta de Aprendizado fica no doc 18; aqui só o código `APR-xxx` (número da carta) | D-090 |
| Dado real só com fonte verificada | D-091 |

**Cancelada (decisão do PO, 2026-10-15):** ~~criar cartas que invertam o "moral por cor" (ex.: corrupção na base aliada, em que Vermelho/Roxo perdem `Integridade` e Preto/Verde/Amarelo ganham), com revisão do PSI. Nas 22 cartas atuais, a opção A nunca perde `Integridade` (parecer do ECO, 2026-10-13).~~ Toda opção mantém custo real em algum medidor.

### 17.01.3. Composição do baralho

| Tipo | Quantidade | Código |
| :--- | :--- | :--- |
| **Institucionais** | 200 | INST-XXX |
| **Temáticas** | 70 | THEM-XXX |
| **Atores** | 70 | ATOR-XXX |
| **Total** | **340** | — |

---

## 17.02 — Cartas do Modo Congresso (20)

### INST-001 — Privatização da Estatal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Privatização da estatal |
| **Modo** | Congresso |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora. |
| **Opção A** | Nomear relator adversário |
| **Efeitos A** | `Capital Político` -10, `Soberania` +10 |
| **Consequência A** | "O relator é adversário. O projeto avança." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Opção B** | Aceitar as mudanças |
| **Efeitos B** | `Capital Político` +10, `Soberania` -15, `Caixa` +10, `Integridade` -5 |
| **Consequência B** | "A lei passa. O povo paga a conta." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Aprendizado** | APR-001 (doc 18) |

### INST-002 — Retirada de Direitos Trabalhistas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Retirada de direitos |
| **Modo** | Congresso |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | A Câmara aprovou um projeto que retira direitos trabalhistas. O Senado vai analisar. |
| **Opção A** | Mobilizar senadores aliados |
| **Efeitos A** | `Capital Político` -20, `Dignidade` +10, `Integridade` +5 |
| **Consequência A** | "Os direitos são mantidos. O Congresso reclama." |
| **Eixo A** | [-2, 0, 0, 0] |
| **Opção B** | Deixar o Senado decidir |
| **Efeitos B** | `Dignidade` -10, `Capital Político` +5, `Integridade` -5 |
| **Consequência B** | "Os direitos são retirados. O Congresso aplaude." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Aprendizado** | APR-002 (doc 18) |

### INST-003 — CPI contra o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | CPI contra o governo |
| **Modo** | Congresso |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | A oposição propõe uma CPI para investigar o governo. O presidente da Câmara quer engavetar. |
| **Opção A** | Apoiar a CPI |
| **Efeitos A** | `Consciência` +10, `Integridade` +10, `Capital Político` -15 |
| **Consequência A** | "A CPI é instalada. O governo é investigado." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Negociar o engavetamento |
| **Efeitos B** | `Caixa` -20, `Capital Político` +10, `Integridade` -10 |
| **Consequência B** | "A CPI é arquivada. O povo não sabe de nada." |
| **Eixo B** | [0, 0, 0, -1] |
| **Aprendizado** | APR-003 (doc 18) |

### INST-004 — Indicação para o STF

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Indicação para o STF |
| **Modo** | Congresso |
| **Cor A** | Azul |
| **Cor B** | Vermelho |
| **Problema** | O Senado vai analisar sua indicação para o STF. O nome é polêmico. |
| **Opção A** | Indicar um nome técnico |
| **Efeitos A** | `Capital Político` -10, `Consciência` +5, `Integridade` +5 |
| **Consequência A** | "O nome é aprovado. O STF ganha um técnico." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Insistir no nome político |
| **Efeitos B** | `Capital Político` -20, `Legitimidade` -5, `Integridade` -5 |
| **Consequência B** | "O Senado rejeita. O governo sai enfraquecido." |
| **Eixo B** | [0, 0, 0, -1] |
| **Aprendizado** | APR-004 (doc 18) |

### INST-005 — Marco Temporal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Marco Temporal |
| **Modo** | Congresso |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | A bancada ruralista quer aprovar o Marco Temporal. O STF já declarou inconstitucional. |
| **Opção A** | Vetar o projeto |
| **Efeitos A** | `Soberania` +10, `Dignidade` +10, `Capital Político` -15 |
| **Consequência A** | "Os indígenas mantêm suas terras." |
| **Eixo A** | [0, 0, +2, 0] |
| **Opção B** | Apoiar o projeto |
| **Efeitos B** | `Capital Político` +15, `Soberania` -10, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "Os indígenas perdem. O agronegócio comemora." |
| **Eixo B** | [+1, 0, -1, 0] |
| **Aprendizado** | APR-005 (doc 18) |

### INST-006 — Aumento do Próprio Salário

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aumento do próprio salário |
| **Modo** | Congresso |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | O Congresso quer aumentar o próprio salário. A população está revoltada. |
| **Opção A** | Vetar o aumento |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` -20 |
| **Consequência A** | "O povo aplaude. O Congresso reclama." |
| **Eixo A** | [0, 0, 0, 0] |
| **Opção B** | Apoiar o aumento |
| **Efeitos B** | `Capital Político` +15, `Legitimidade` -15, `Integridade` -5 |
| **Consequência B** | "O povo vê que a casta política se protege." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-006 (doc 18) |

*(As demais 14 cartas do Modo Congresso ainda não foram escritas.)*

---

## 17.03 — Cartas do Modo Orçamento (20)

### INST-021 — Corte na Saúde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte na saúde |
| **Modo** | Orçamento |
| **Cor A** | Roxo |
| **Cor B** | Laranja |
| **Problema** | O orçamento está estourado. Você precisa cortar R$ 50 bilhões. Onde? |
| **Opção A** | Cortar da dívida |
| **Efeitos A** | `Capital Político` -20, `Caixa` +30, `Integridade` +5 |
| **Consequência A** | "Os credores entram em pânico. O Congresso bloqueia. Mas o povo aplaude." |
| **Eixo A** | [-2, 0, 0, 0] |
| **Opção B** | Cortar da saúde |
| **Efeitos B** | `Dignidade` -15, `Caixa` +20, `Integridade` -5 |
| **Consequência B** | "A fila do hospital aumenta. A mortalidade infantil sobe." |
| **Eixo B** | [+2, 0, 0, 0] |
| **Aprendizado** | APR-021 (doc 18) |

### INST-022 — Dívida Pública

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Dívida pública |
| **Modo** | Orçamento |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | A dívida pública consome 40% do orçamento. Os credores pressionam por mais. |
| **Opção A** | Renegociar a dívida |
| **Efeitos A** | `Soberania` +10, `Caixa` +20, `Capital Político` -15 |
| **Consequência A** | "Os credores reagem. Mas o governo respira." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Opção B** | Pagar em dia |
| **Efeitos B** | `Caixa` -20, `Capital Político` +10, `Dignidade` -5 |
| **Consequência B** | "Os credores ficam satisfeitos. O povo paga a conta." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Aprendizado** | APR-022 (doc 18) |

---

## 17.04 — Cartas do Modo Currículo e Mídia (20)

### INST-041 — Retirada de Filosofia/Sociologia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Retirada de Filosofia |
| **Modo** | Currículo e Mídia |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | O Congresso propõe retirar Filosofia e Sociologia do currículo obrigatório. A bancada evangélica apoia. |
| **Opção A** | Vetar a proposta |
| **Efeitos A** | `Consciência` +15, `Integridade` +10, `Capital Político` -20 |
| **Consequência A** | "Os professores comemoram. Mas o Congresso ameaça retaliar." |
| **Eixo A** | [0, 0, +1, 0] |
| **Opção B** | Apoiar a proposta |
| **Efeitos B** | `Capital Político` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência B** | "A lei passa. Os alunos aprenderão 'educação financeira' em vez de pensar criticamente." |
| **Eixo B** | [0, 0, -2, 0] |
| **Aprendizado** | APR-041 (doc 18) |

### INST-042 — Concessão de TV para Pastor

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Concessão de TV |
| **Modo** | Currículo e Mídia |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Uma rede de TV controlada por um pastor pede renovação de concessão. Ele promete apoio em troca. |
| **Opção A** | Renovar com pluralidade |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "A emissora aceita, mas faz campanha velada contra você." |
| **Eixo A** | [0, 0, +1, -1] |
| **Opção B** | Renovar sem condições |
| **Efeitos B** | `Capital Político` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência B** | "A TV elogia seu governo. Mas o que ela mostra não é a realidade." |
| **Eixo B** | [0, 0, -1, 0] |
| **Aprendizado** | APR-042 (doc 18) |

---

## 17.05 — Cartas do Modo Geopolítico (20)

### INST-061 — Adesão ao BRICS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Adesão ao BRICS |
| **Modo** | Geopolítico |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | O BRICS propõe um sistema de pagamento em moedas locais. Os EUA ameaçam retaliações. |
| **Opção A** | Aderir |
| **Efeitos A** | `Soberania` +15, `Integridade` +5, `Caixa` -5 |
| **Consequência A** | "O Brasil reduz a dependência do dólar. Mas os EUA ameaçam tarifas." |
| **Eixo A** | [0, -1, 0, 0] |
| **Opção B** | Recusar |
| **Efeitos B** | `Caixa` +10, `Soberania` -15, `Integridade` -5 |
| **Consequência B** | "Os EUA elogiam o Brasil. Mas o país continua vulnerável a sanções." |
| **Eixo B** | [0, +1, 0, 0] |
| **Aprendizado** | APR-061 (doc 18) |

### INST-062 — Venda de Lítio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Venda de lítio |
| **Modo** | Geopolítico |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Uma potência estrangeira oferece bilhões pela reserva de lítio. O BRICS quer desenvolver a cadeia local. |
| **Opção A** | Desenvolver com o BRICS |
| **Efeitos A** | `Soberania` +15, `Caixa` -10, `Integridade` +5 |
| **Consequência A** | "O lítio fica no Brasil. A cadeia produtiva se desenvolve." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Opção B** | Vender |
| **Efeitos B** | `Caixa` +25, `Soberania` -20, `Integridade` -10 |
| **Consequência B** | "O lítio vai embora. O país importa tecnologia." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Aprendizado** | APR-062 (doc 18) |

---

## 17.06 — Cartas do Modo Prisional e Policial (20)

### INST-081 — Superlotação Prisional

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Superlotação prisional |
| **Modo** | Prisional e Policial |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | O sistema prisional está superlotado. Facções controlam os presídios. |
| **Opção A** | Investir em prevenção |
| **Efeitos A** | `Dignidade` +10, `Segurança` -5, `Caixa` -15, `Integridade` +5 |
| **Consequência A** | "A população sente que 'nada foi feito'. Mas, aos poucos, menos jovens entram no sistema." |
| **Eixo A** | [0, 0, +1, +1] |
| **Opção B** | Aumentar o encarceramento |
| **Efeitos B** | `Segurança` +10, `Dignidade` -15, `Caixa` -20, `Integridade` -5 |
| **Consequência B** | "Mais presos. Mais facções. O crime organizado se fortalece." |
| **Eixo B** | [0, 0, -1, -2] |
| **Aprendizado** | APR-081 (doc 18) |

### INST-082 — Polícia Mata 17 por Dia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Polícia mata 17 por dia |
| **Modo** | Prisional e Policial |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | A polícia matou 6.243 pessoas em 2024, cerca de 17 por dia. 82% eram negras. |
| **Opção A** | Investigar e punir |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "A investigação começa. As famílias das vítimas finalmente são ouvidas." |
| **Eixo A** | [0, 0, +1, +1] |
| **Opção B** | Defender a polícia |
| **Efeitos B** | `Segurança` +5, `Dignidade` -15, `Integridade` -5 |
| **Consequência B** | "A impunidade policial continua." |
| **Eixo B** | [0, 0, -1, -2] |
| **Aprendizado** | APR-082 (doc 18) |

---

## 17.07 — Cartas do Modo Emendas (20)

### INST-101 — Emenda para Show

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para show |
| **Modo** | Emendas |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Uma emenda parlamentar destina R$ 50 milhões para um show. O hospital local está sem remédios. |
| **Opção A** | Redirecionar para o hospital |
| **Efeitos A** | `Dignidade` +15, `Capital Político` -10, `Integridade` +5 |
| **Consequência A** | "O hospital recebe os recursos. O show é cancelado." |
| **Eixo A** | [0, 0, 0, 0] |
| **Opção B** | Manter o show |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência B** | "O show acontece. O hospital fecha." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-101 (doc 18) |

---

## 17.08 — Cartas do Modo Bancadas (20)

### INST-121 — Bancada BBB

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Bancada BBB |
| **Modo** | Bancadas |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | A bancada BBB quer aprovar uma lei que flexibiliza o licenciamento ambiental e aumenta o armamento civil. Em troca, apoia seu pacote fiscal. |
| **Opção A** | Recusar |
| **Efeitos A** | `Capital Político` -15, `Soberania` +5, `Legitimidade` +5, `Integridade` +10 |
| **Consequência A** | "A bancada BBB se une contra você. Mas o meio ambiente é preservado." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Opção B** | Aceitar |
| **Efeitos B** | `Capital Político` +20, `Soberania` -10, `Dignidade` -10, `Integridade` -10 |
| **Consequência B** | "A lei passa. Mais desmatamento, mais armas. Mas o pacote fiscal é aprovado." |
| **Eixo B** | [+1, 0, -1, 0] |
| **Aprendizado** | APR-121 (doc 18) |

---

## 17.09 — Cartas do Modo Impeachment (20)

### INST-141 — O Pedido

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Pedido |
| **Modo** | Impeachment |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | A oposição protocolou um pedido de impeachment. O presidente da Câmara, seu adversário, aceita o pedido em 48 horas. |
| **Opção A** | Apelar ao povo |
| **Teste A** | `Consciência` > 45 (apoio +1) |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Segurança` -5 |
| **Consequência A** | "As ruas se enchem. Mas o Congresso se sente atacado." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Confiar na base |
| **Teste B** | `Caixa` > 45 (apoio +1) |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10 |
| **Consequência B** | "A base está rachada. Alguns aliados já negociam com a oposição." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-141 (doc 18) |

*Regras da cena: `gdd/sistemas/03_impeachment.md` (efeitos ×1, sem multiplicador do ano).*

### INST-142 — A Comissão

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Comissão |
| **Modo** | Impeachment |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | O presidente da Câmara aceitou o pedido. Uma comissão especial foi formada. O relator é seu adversário. |
| **Opção A** | Denunciar o golpe |
| **Teste A** | `Integridade` > 45 (apoio +1) |
| **Efeitos A** | `Integridade` +5, `Consciência` +5, `Segurança` -5 |
| **Consequência A** | "A denúncia ganha força nas ruas. Mas o Congresso ignora." |
| **Eixo A** | [0, 0, 0, 0] |
| **Opção B** | Negociar nos bastidores |
| **Teste B** | `Capital Político` > 25 (apoio +1) |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Integridade` -5 |
| **Consequência B** | "A comissão suaviza o parecer. Mas o povo percebe a compra de votos." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-142 (doc 18) |

### INST-143 — A Votação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Votação |
| **Modo** | Impeachment |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | A Câmara vai votar a autorização do processo. São precisos 342 de 513 votos. A contagem está apertada. |
| **Opção A** | Mobilizar as ruas |
| **Teste A** | `Consciência` > 55 (apoio +1) |
| **Efeitos A** | `Legitimidade` +10, `Soberania` -5, `Segurança` -5 |
| **Consequência A** | "As praças lotam. Os deputados sentem a pressão." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Negociar votos |
| **Teste B** | `Capital Político` > 35 (apoio +1) |
| **Efeitos B** | `Capital Político` +5, `Soberania` -10, `Segurança` -5 |
| **Consequência B** | "Alguns votos mudam de lado. O preço vem depois." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-143 (doc 18) |

### INST-144 — O Julgamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Julgamento |
| **Modo** | Impeachment |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | O Senado julga o processo. São precisos 54 de 81 votos para condenar. |
| **Opção A** | Fazer a defesa no Senado |
| **Teste A** | `Dignidade` > 50 (apoio +1) |
| **Efeitos A** | `Consciência` +10, `Caixa` -5 |
| **Consequência A** | "A defesa é ouvida no país inteiro." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Oferecer cargos a senadores |
| **Teste B** | `Capital Político` > 40 (apoio +1) |
| **Efeitos B** | `Capital Político` +5, `Legitimidade` +5, `Dignidade` -10 |
| **Consequência B** | "Os cargos são aceitos. As promessas ao povo esperam." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-144 (doc 18) |

### INST-145 — O Desfecho

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Desfecho |
| **Modo** | Impeachment |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | É o último dia. O resultado depende do apoio que você juntou e da sua última palavra. |
| **Opção A** | Falar à nação |
| **Teste A** | `Legitimidade` > 45 (absolvição, se apoio suficiente) |
| **Efeitos A** | `Legitimidade` +10, `Caixa` -5 |
| **Consequência A** | "O país para para ouvir." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Selar um pacto com o Congresso |
| **Teste B** | `Integridade` > 51 (absolvição, se apoio suficiente) |
| **Efeitos B** | `Integridade` +5, `Soberania` -5 |
| **Consequência B** | "O pacto é fechado. Quem manda agora?" |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-145 (doc 18) |

---

## 17.10 — Cartas do Modo Judiciário (20)

*Regras da cena: `gdd/sistemas/03_impeachment.md` (efeitos ×1, sem multiplicador do ano).*

### INST-161 — Ministro do STF com 28 Mensagens

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ministro do STF |
| **Modo** | Judiciário |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | A imprensa revela que um ministro do STF tem 28 mensagens de um banqueiro investigado. A oposição pede impeachment. |
| **Opção A** | Apoiar a investigação |
| **Efeitos A** | `Consciência` +15, `Legitimidade` +10, `Capital Político` -30, `Integridade` +15 |
| **Consequência A** | "O ministro é investigado. O STF entra em crise. Mas o povo vê que a lei vale para todos." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Defender o ministro |
| **Efeitos B** | `Capital Político` -20, `Consciência` -15, `Integridade` -15 |
| **Consequência B** | "O caso é arquivado. Mas o povo vê que a justiça é diferente para os poderosos." |
| **Eixo B** | [0, 0, 0, -1] |
| **Aprendizado** | APR-161 (doc 18) |

---

## 17.11 — Cartas do Modo Influenciador (20)

### INST-181 — Influenciador Financiado por Bets

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Influenciador financiado |
| **Modo** | Influenciador |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Um influenciador com 10 milhões de seguidores oferece apoio. Ele pede R$ 2 milhões por mês. O dinheiro viria de uma casa de apostas. |
| **Opção A** | Recusar |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Legitimidade` -10 |
| **Consequência A** | "O influenciador faz campanha contra você. Mas sua consciência está limpa." |
| **Eixo A** | [0, 0, 0, 0] |
| **Opção B** | Aceitar |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência B** | "O influenciador elogia seu governo. Mas o dinheiro vem da perda de apostadores." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-181 (doc 18) |

---

## 17.12 — Cartas Temáticas (70)

### THEM-001 — Reforma Agrária

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Reforma agrária |
| **Modo** | Temática (Reforma Agrária) |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | O MST ocupa uma fazenda improdutiva. O agronegócio pressiona por despejo. |
| **Opção A** | Assentar as famílias |
| **Efeitos A** | `Dignidade` +10, `Soberania` +5, `Capital Político` -15 |
| **Consequência A** | "A terra é repartida. O agro protesta." |
| **Eixo A** | [-2, 0, +1, 0] |
| **Opção B** | Ordenar o despejo |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "A polícia despeja as famílias. O agro comemora." |
| **Eixo B** | [+2, 0, 0, -1] |
| **Aprendizado** | APR-THEM-001 (doc 18) |

---

## 17.13 — Cartas de Atores (70)

### ATOR-001 — Latifundiários

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Latifundiário cobra o favor |
| **Modo** | Ator (Latifundiários) |
| **Cor A** | Vermelho |
| **Cor B** | Verde |
| **Problema** | O Latifundiário oferece 50 mil votos em troca de controle total sobre a nomeação de juízes e delegados em sua região. |
| **Opção A** | Recusar |
| **Efeitos A** | `Capital Político` -15, `Dignidade` +10, `Integridade` +5 |
| **Consequência A** | "O Latifundiário fica furioso. Mas a dignidade é preservada." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Aceitar |
| **Efeitos B** | `Capital Político` +20, `Dignidade` -15, `Integridade` -10 |
| **Consequência B** | "O Latifundiário garante votos. Mas a impunidade aumenta." |
| **Eixo B** | [0, 0, 0, -2] |
| **Aprendizado** | APR-ATOR-001 (doc 18) |

---

## 17.14 — Resumo do Roteiro

| Tipo | Escritas | Total |
| :--- | :--- | :--- |
| **Institucionais** | 20 | 200 |
| **Temáticas** | 1 | 70 |
| **Atores** | 1 | 70 |
| **Total** | **22** | **340** |

---

## 17.15 — Referências

- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- ICON GAMES. *Senhor Presidente*. 2016.
- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.

---

**Última atualização:** 2026-10-13 (P-010)
**Versão:** 1.1 (em desenvolvimento)

