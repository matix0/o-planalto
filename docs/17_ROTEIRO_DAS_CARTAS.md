# 17 — Roteiro das Cartas

**Documento de Roteiro das 340 Cartas do Jogo "O Planalto"**

Este documento define o texto final das 340 cartas do jogo, organizadas por modo e por tipo. Cada carta segue o formato padrão: título, problema, opções (esquerda/direita), efeitos nos medidores, consequências e Carta de Aprendizado.

---

## 17.01 — Estrutura do Documento

### 17.01.1. Formato das Cartas

ID: [Código único]
Título: [Nome curto da carta]
Modo: [Modo institucional]
Tipo: [Institucional, Temática, Ator]
Cor: [Cor partidária]
Problema: [Descrição do dilema]
Opção Esquerda: [Texto]
Efeitos Esquerda: [Medidores afetados]
Consequência Esquerda: [Frase curta]
Opção Direita: [Texto]
Efeitos Direita: [Medidores afetados]
Consequência Direita: [Frase curta]
Carta de Aprendizado:
Vivencia: [Resumo da decisão]
Conceito: [Explicação do mecanismo]
Dados: [Números e fatos]
Fonte: [Origem dos dados]
Frase: [Reflexão final]
text


### 17.01.2. Composição do Baralho

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
| **Cor** | Laranja |
| **Problema** | O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora. |
| **Opção Esquerda** | Nomear relator adversário |
| **Efeitos Esquerda** | `Capital Político` -10, `Soberania` +10 |
| **Consequência Esquerda** | "A lei passa. O povo paga a conta." |
| **Opção Direita** | Aceitar as mudanças |
| **Efeitos Direita** | `Capital Político` +10, `Soberania` -15, `Caixa` +10, `Integridade` -5 |
| **Consequência Direita** | "O relator é adversário. O projeto avança." |
| **Aprendizado** | Vivencia: "Você decidiu se aceitava ou não as mudanças do relator." · Conceito: "O relator tem poder de alterar o texto. Isso se chama 'poder de agenda'." · Dados: "A Eletrobras investiu apenas 1/5 do prometido após a privatização. 5 mil concursados foram demitidos." · Fonte: "Agência Senado, 2026." · Frase: "O relator tem poder. Quem controla a pauta, controla o país." |

### INST-002 — Retirada de Direitos Trabalhistas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Retirada de direitos |
| **Modo** | Congresso |
| **Cor** | Vermelho |
| **Problema** | A Câmara aprovou um projeto que retira direitos trabalhistas. O Senado vai analisar. |
| **Opção Esquerda** | Mobilizar senadores aliados |
| **Efeitos Esquerda** | `Capital Político` -20, `Dignidade` +10, `Integridade` +5 |
| **Consequência Esquerda** | "Os direitos são mantidos. O Congresso reclama." |
| **Opção Direita** | Deixar o Senado decidir |
| **Efeitos Direita** | `Dignidade` -10, `Capital Político` +5, `Integridade` -5 |
| **Consequência Direita** | "Os direitos são retirados. O Congresso aplaude." |
| **Aprendizado** | Vivencia: "Você decidiu se mobilizava senadores ou deixava o Senado decidir." · Conceito: "O bicameralismo exige que Câmara e Senado aprovem o mesmo texto. Se o Senado rejeitar, o projeto é arquivado." · Dados: "A Reforma Trabalhista de 2017 flexibilizou a jornada e permitiu a terceirização irrestrita. O resultado foi o aumento da informalidade." · Fonte: "DIEESE, 2024." · Frase: "Direito retirado não volta. A luta é para não perder o que já se conquistou." |

### INST-003 — CPI contra o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | CPI contra o governo |
| **Modo** | Congresso |
| **Cor** | Amarelo |
| **Problema** | A oposição propõe uma CPI para investigar o governo. O presidente da Câmara quer engavetar. |
| **Opção Esquerda** | Apoiar a CPI |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -15 |
| **Consequência Esquerda** | "A CPI é instalada. O governo é investigado." |
| **Opção Direita** | Negociar o engavetamento |
| **Efeitos Direita** | `Caixa` -20, `Capital Político` +10, `Integridade` -10 |
| **Consequência Direita** | "A CPI é arquivada. O povo não sabe de nada." |
| **Aprendizado** | Vivencia: "Você decidiu se apoiava ou engavetava uma CPI." · Conceito: "A CPI é um instrumento de fiscalização do Legislativo. Ela tem poderes de investigação, mas não julga." · Dados: "A CPI das Bets (2025) foi instalada para investigar apostas online e lavagem de dinheiro. O relatório final foi rejeitado por 4 votos a 3." · Fonte: "Agência Senado, 2025." · Frase: "A CPI investiga, mas quem decide se pune é o Congresso. E o Congresso não pune a si mesmo." |

### INST-004 — Indicação para o STF

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Indicação para o STF |
| **Modo** | Congresso |
| **Cor** | Azul |
| **Problema** | O Senado vai analisar sua indicação para o STF. O nome é polêmico. |
| **Opção Esquerda** | Indicar um nome técnico |
| **Efeitos Esquerda** | `Capital Político` -10, `Consciência` +5, `Integridade` +5 |
| **Consequência Esquerda** | "O nome é aprovado. O STF ganha um técnico." |
| **Opção Direita** | Insistir no nome político |
| **Efeitos Direita** | `Capital Político` -20, `Legitimidade` -5, `Integridade` -5 |
| **Consequência Direita** | "O Senado rejeita. O governo sai enfraquecido." |
| **Aprendizado** | Vivencia: "Você decidiu se indicava um nome técnico ou um nome político." · Conceito: "O Senado pode rejeitar indicados do presidente. Isso é um freio e contrapeso." · Dados: "Em 2025, o Senado rejeitou a indicação de Jorge Messias para o STF — algo que não acontecia desde 1894." · Fonte: "Agência Senado, 2025." · Frase: "O Senado é um freio e contrapeso. O presidente não manda sozinho." |

### INST-005 — Marco Temporal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Marco Temporal |
| **Modo** | Congresso |
| **Cor** | Verde |
| **Problema** | A bancada ruralista quer aprovar o Marco Temporal. O STF já declarou inconstitucional. |
| **Opção Esquerda** | Vetar o projeto |
| **Efeitos Esquerda** | `Soberania` +10, `Dignidade` +10, `Capital Político` -15 |
| **Consequência Esquerda** | "Os indígenas mantêm suas terras." |
| **Opção Direita** | Apoiar o projeto |
| **Efeitos Direita** | `Capital Político` +15, `Soberania` -10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "Os indígenas perdem. O agronegócio comemora." |
| **Aprendizado** | Vivencia: "Você decidiu se vetava ou apoiava o Marco Temporal." · Conceito: "O Marco Temporal é uma tese jurídica que pretende limitar a demarcação de terras indígenas às áreas ocupadas em 1988." · Dados: "O STF declarou o Marco Temporal inconstitucional em 2023. Com Flávio Bolsonaro, o Congresso tenta aprovar a tese." · Fonte: "STF, 2023." · Frase: "A terra é dos indígenas. O Marco Temporal é a morte do futuro." |

### INST-006 — Aumento do Próprio Salário

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aumento do próprio salário |
| **Modo** | Congresso |
| **Cor** | Amarelo |
| **Problema** | O Congresso quer aumentar o próprio salário. A população está revoltada. |
| **Opção Esquerda** | Vetar o aumento |
| **Efeitos Esquerda** | `Legitimidade` +10, `Capital Político` -20 |
| **Consequência Esquerda** | "O povo aplaude. O Congresso reclama." |
| **Opção Direita** | Apoiar o aumento |
| **Efeitos Direita** | `Capital Político` +15, `Legitimidade` -15, `Integridade` -5 |
| **Consequência Direita** | "O povo vê que a casta política se protege." |
| **Aprendizado** | Vivencia: "Você decidiu se vetava ou apoiava o aumento do próprio salário." · Conceito: "O Congresso define o próprio salário. Não há controle externo." · Dados: "O salário dos deputados federais é de R$ 46.366,19. O salário mínimo é de R$ 1.412." · Fonte: "Câmara dos Deputados, 2026." · Frase: "Enquanto o povo passa fome, o Congresso aumenta o próprio salário." |

*(... continuando com as demais 14 cartas do Modo Congresso, e depois com todos os outros modos, cartas temáticas e de atores. O documento completo tem 340 cartas. Aqui estão as primeiras 6 para demonstrar o formato.)*

---

## 17.03 — Cartas do Modo Orçamento (20)

### INST-021 — Corte na Saúde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte na saúde |
| **Modo** | Orçamento |
| **Cor** | Vermelho |
| **Problema** | O orçamento está estourado. Você precisa cortar R$ 50 bilhões. Onde? |
| **Opção Esquerda** | Cortar da dívida |
| **Efeitos Esquerda** | `Capital Político` -20, `Caixa` +30, `Integridade` +5 |
| **Consequência Esquerda** | "Os credores entram em pânico. O Congresso bloqueia. Mas o povo aplaude." |
| **Opção Direita** | Cortar da saúde |
| **Efeitos Direita** | `Dignidade` -15, `Caixa` +20, `Integridade` -5 |
| **Consequência Direita** | "A fila do hospital aumenta. A mortalidade infantil sobe." |
| **Aprendizado** | Vivencia: "Você decidiu onde cortar R$ 50 bilhões do orçamento." · Conceito: "O orçamento público não é como o de casa. O governo pode gastar mais do que arrecada para investir e gerar arrecadação futura." · Dados: "O teto de gastos retirou R$ 37 bilhões do SUS entre 2018 e 2022. A expectativa de vida caiu de 76,2 para 72,8 anos." · Fonte: "INESC, 2024." · Frase: "Cortar saúde não é 'ajuste fiscal'. É uma escolha que mata." |

### INST-022 — Dívida Pública

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Dívida pública |
| **Modo** | Orçamento |
| **Cor** | Amarelo |
| **Problema** | A dívida pública consome 40% do orçamento. Os credores pressionam por mais. |
| **Opção Esquerda** | Renegociar a dívida |
| **Efeitos Esquerda** | `Soberania` +10, `Caixa` +20, `Capital Político` -15 |
| **Consequência Esquerda** | "Os credores reagem. Mas o governo respira." |
| **Opção Direita** | Pagar em dia |
| **Efeitos Direita** | `Caixa` -20, `Capital Político` +10, `Dignidade` -5 |
| **Consequência Direita** | "Os credores ficam satisfeitos. O povo paga a conta." |
| **Aprendizado** | Vivencia: "Você decidiu se renegociava a dívida ou pagava em dia." · Conceito: "A dívida pública consome 40% do orçamento. Renegociá-la é uma decisão política." · Dados: "O Brasil paga R$ 1,2 trilhão por ano em juros da dívida pública. Isso é mais do que o orçamento da saúde e educação juntos." · Fonte: "Tesouro Nacional, 2024." · Frase: "A dívida pública é impagável. Renegociá-la é uma decisão política." |

---

## 17.04 — Cartas do Modo Currículo e Mídia (20)

### INST-041 — Retirada de Filosofia/Sociologia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Retirada de Filosofia |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O Congresso propõe retirar Filosofia e Sociologia do currículo obrigatório. A bancada evangélica apoia. |
| **Opção Esquerda** | Vetar a proposta |
| **Efeitos Esquerda** | `Consciência` +15, `Integridade` +10, `Capital Político` -20 |
| **Consequência Esquerda** | "Os professores comemoram. Mas o Congresso ameaça retaliar." |
| **Opção Direita** | Apoiar a proposta |
| **Efeitos Direita** | `Capital Político` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A lei passa. Os alunos aprenderão 'educação financeira' em vez de pensar criticamente." |
| **Aprendizado** | Vivencia: "Você decidiu se vetava ou apoiava a retirada de Filosofia e Sociologia do currículo." · Conceito: "A Lei 13.415/2017 rebaixou Filosofia e Sociologia de 'disciplinas obrigatórias' para 'estudos e práticas'." · Dados: "A retirada dessas disciplinas é a desativação do pensamento crítico. Sem Sociologia, o aluno não entende como a sociedade funciona. Sem Filosofia, não aprende a questionar argumentos." · Fonte: "Ministério da Educação, 2017." · Frase: "Sem pensamento crítico, o povo é presa fácil do pânico moral e da desinformação." |

### INST-042 — Concessão de TV para Pastor

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Concessão de TV |
| **Modo** | Currículo e Mídia |
| **Cor** | Preto |
| **Problema** | Uma rede de TV controlada por um pastor pede renovação de concessão. Ele promete apoio em troca. |
| **Opção Esquerda** | Renovar com pluralidade |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A emissora aceita, mas faz campanha velada contra você." |
| **Opção Direita** | Renovar sem condições |
| **Efeitos Direita** | `Capital Político` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A TV elogia seu governo. Mas o que ela mostra não é a realidade." |
| **Aprendizado** | Vivencia: "Você decidiu se renovava ou não a concessão de TV para um pastor." · Conceito: "A concessão de TV é um serviço público. O espectro eletromagnético é um bem da União, cedido a empresas privadas." · Dados: "9 dos 50 veículos de maior audiência no Brasil são de propriedade de lideranças religiosas. A TV Record, de Edir Macedo, é o principal veículo desse império." · Fonte: "ANJ, 2024." · Frase: "Quem controla a TV controla a narrativa. Quem controla a narrativa controla o voto." |

---

## 17.05 — Cartas do Modo Geopolítico (20)

### INST-061 — Adesão ao BRICS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Adesão ao BRICS |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | O BRICS propõe um sistema de pagamento em moedas locais. Os EUA ameaçam retaliações. |
| **Opção Esquerda** | Aderir |
| **Efeitos Esquerda** | `Soberania` +15, `Integridade` +5, `Caixa` -5 |
| **Consequência Esquerda** | "O Brasil reduz a dependência do dólar. Mas os EUA ameaçam tarifas." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Caixa` +10, `Soberania` -15, `Integridade` -5 |
| **Consequência Direita** | "Os EUA elogiam o Brasil. Mas o país continua vulnerável a sanções." |
| **Aprendizado** | Vivencia: "Você decidiu se aderia ou não ao sistema de pagamento em moedas locais do BRICS." · Conceito: "O BRICS busca reduzir a dependência do dólar com sistemas como BRICS Pay, BRICS Bridge e BRICS Clear." · Dados: "O BRICS representa quase metade da população mundial. A desdolarização permite que exportadores brasileiros sejam pagos diretamente por importadores chineses, sem passar pelo sistema bancário americano." · Fonte: "IPEA, 2025." · Frase: "A soberania não está à venda. Ela está em disputa." |

### INST-062 — Venda de Lítio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Venda de lítio |
| **Modo** | Geopolítico |
| **Cor** | Verde |
| **Problema** | Uma potência estrangeira oferece bilhões pela reserva de lítio. O BRICS quer desenvolver a cadeia local. |
| **Opção Esquerda** | Desenvolver com o BRICS |
| **Efeitos Esquerda** | `Soberania` +15, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O lítio fica no Brasil. A cadeia produtiva se desenvolve." |
| **Opção Direita** | Vender |
| **Efeitos Direita** | `Caixa` +25, `Soberania` -20, `Integridade` -10 |
| **Consequência Direita** | "O lítio vai embora. O país importa tecnologia." |
| **Aprendizado** | Vivencia: "Você decidiu se vendia ou desenvolvia a reserva de lítio." · Conceito: "O lítio é um mineral estratégico para baterias e tecnologia. Vendê-lo bruto é entregar o futuro." · Dados: "O Brasil tem uma das maiores reservas de lítio do mundo. A venda de recursos brutos perpetua a reprimarização da economia." · Fonte: "ANM, 2024." · Frase: "O lítio é nosso. Se vendermos, o futuro será deles." |

---

## 17.06 — Cartas do Modo Prisional e Policial (20)

### INST-081 — Superlotação Prisional

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Superlotação prisional |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O sistema prisional está superlotado. Facções controlam os presídios. |
| **Opção Esquerda** | Investir em prevenção |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A população sente que 'nada foi feito'. Mas as mortes por overdose caem." |
| **Opção Direita** | Aumentar o encarceramento |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -15, `Caixa` -20, `Integridade` -5 |
| **Consequência Direita** | "Mais presos. Mais facções. O crime organizado se fortalece." |
| **Aprendizado** | Vivencia: "Você decidiu se investia em prevenção ou aumentava o encarceramento." · Conceito: "O encarceramento em massa não reduz a violência. Apenas fortalece as facções." · Dados: "O Brasil é o 3º país que mais encarcera no mundo. 69% da população carcerária é negra." · Fonte: "Infopen, 2024." · Frase: "O encarceramento em massa não reduz a violência. Apenas a desloca." |

### INST-082 — Polícia Mata 11 por Dia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Polícia mata 11 por dia |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | A polícia matou 11 pessoas por dia em 2024. 86% eram negras. |
| **Opção Esquerda** | Investigar e punir |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A impunidade policial continua." |
| **Opção Direita** | Defender a polícia |
| **Efeitos Direita** | `Segurança` +5, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "A impunidade policial continua." |
| **Aprendizado** | Vivencia: "Você decidiu se investigava ou defendia a polícia." · Conceito: "O genocídio da população negra é uma política de Estado." · Dados: "Em 2024, a polícia matou 11 pessoas por dia no Brasil. 86% eram negras. A Operação Contenção no Rio de Janeiro matou 121 pessoas." · Fonte: "Anuário Brasileiro de Segurança Pública, 2024." · Frase: "O Estado que mata não protege. Ele extermina." |

---

## 17.07 — Cartas do Modo Emendas (20)

### INST-101 — Emenda para Show

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para show |
| **Modo** | Emendas |
| **Cor** | Amarelo |
| **Problema** | Uma emenda parlamentar destina R$ 50 milhões para um show. O hospital local está sem remédios. |
| **Opção Esquerda** | Redirecionar para o hospital |
| **Efeitos Esquerda** | `Dignidade` +15, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O hospital recebe os recursos. O show é cancelado." |
| **Opção Direita** | Manter o show |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "O show acontece. O hospital fecha." |
| **Aprendizado** | Vivencia: "Você decidiu se redirecionava uma emenda de show para o hospital." · Conceito: "As emendas parlamentares são verbas que deputados e senadores destinam a projetos em suas bases eleitorais." · Dados: "Entre janeiro de 2024 e março de 2026, cem artistas acumularam mais de R$ 5 bilhões em cachês pagos por prefeituras e governos estaduais." · Fonte: "De Olho nos Ruralistas, 2026." · Frase: "O show acontece. O hospital não. A emenda é uma escolha política." |

---

## 17.08 — Cartas do Modo Bancadas (20)

### INST-121 — Bancada BBB

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Bancada BBB |
| **Modo** | Bancadas |
| **Cor** | Preto |
| **Problema** | A bancada BBB quer aprovar uma lei que flexibiliza o licenciamento ambiental e aumenta o armamento civil. Em troca, apoia seu pacote fiscal. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Capital Político` -15, `Soberania` +5, `Legitimidade` +5, `Integridade` +10 |
| **Consequência Esquerda** | "A bancada BBB se une contra você. Mas o meio ambiente é preservado." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Capital Político` +20, `Soberania` -10, `Dignidade` -10, `Integridade` -10 |
| **Consequência Direita** | "A lei passa. Mais desmatamento, mais armas. Mas o pacote fiscal é aprovado." |
| **Aprendizado** | Vivencia: "Você decidiu se aceitava ou recusava o acordo da bancada BBB." · Conceito: "As bancadas BBB (Boi, Bíblia, Bala) controlam o Congresso. Elas são informais, mas poderosas." · Dados: "A bancada ruralista tem 345 membros. A evangélica, 210. A da bala, 260. Quando atuam juntas, formam a bancada BBB." · Fonte: "Congresso em Foco, 2026." · Frase: "As bancadas BBB controlam o Congresso. Elas são informais, mas poderosas." |

---

## 17.09 — Cartas do Modo Impeachment (20)

### INST-141 — O Pedido

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Pedido |
| **Modo** | Impeachment |
| **Cor** | Preto |
| **Problema** | A oposição protocolou um pedido de impeachment. O presidente da Câmara, seu adversário, aceita o pedido em 48 horas. |
| **Opção Esquerda** | Apelar ao povo |
| **Efeitos Esquerda** | `Legitimidade` -10, `Consciência` +10, `Capital Político` -15 |
| **Consequência Esquerda** | "As ruas se enchem. Mas o Congresso se sente atacado." |
| **Opção Direita** | Confiar na base |
| **Efeitos Direita** | `Capital Político` -10, `Legitimidade` -5, `Consciência` +5 |
| **Consequência Direita** | "A base está rachada. Alguns aliados já negociam com a oposição." |
| **Aprendizado** | Vivencia: "Você decidiu se apelava ao povo ou confiava na base." · Conceito: "O impeachment começa com um pedido protocolado por qualquer cidadão. O presidente da Câmara decide se aceita ou engaveta." · Dados: "Em 2016, Eduardo Cunha aceitou o pedido contra Dilma logo após o PT anunciar voto contra ele no Conselho de Ética. Não foi justiça. Foi retaliação." · Fonte: "Revista Acervo, 2025." · Frase: "O impeachment começa com um pedido. Mas termina com um golpe." |

### INST-142 — A Comissão

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Comissão |
| **Modo** | Impeachment |
| **Cor** | Preto |
| **Problema** | O presidente da Câmara aceitou o pedido. Uma comissão especial foi formada. O relator é seu adversário. |
| **Opção Esquerda** | Denunciar o golpe |
| **Efeitos Esquerda** | `Capital Político` -15, `Consciência` +15, `Integridade` +10, `Legitimidade` +5 |
| **Consequência Esquerda** | "A denúncia ganha força nas ruas. Mas o Congresso ignora." |
| **Opção Direita** | Negociar nos bastidores |
| **Efeitos Direita** | `Caixa` -40, `Capital Político` -10, `Legitimidade` +5, `Integridade` -10 |
| **Consequência Direita** | "A comissão suaviza o parecer. Mas o povo percebe a compra de votos." |
| **Aprendizado** | Vivencia: "Você decidiu se denunciava o golpe ou negociava nos bastidores." · Conceito: "A comissão especial emite um parecer em até 5 sessões. Se aprovado por maioria simples, o processo vai a plenário." · Dados: "Em 2016, o relator foi Antonio Anastasia, que admitiu que as pedaladas não configuravam crime. Mesmo assim, o processo seguiu." · Fonte: "Revista Acervo, 2025." · Frase: "A comissão é uma farsa. Mas a farsa tem poder." |

---

## 17.10 — Cartas do Modo Judiciário (20)

### INST-161 — Ministro do STF com 52 Mensagens

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ministro do STF |
| **Modo** | Judiciário |
| **Cor** | Preto |
| **Problema** | A imprensa revela que um ministro do STF tem 52 mensagens de um banqueiro investigado. A oposição pede impeachment. |
| **Opção Esquerda** | Apoiar a investigação |
| **Efeitos Esquerda** | `Consciência` +15, `Legitimidade` +10, `Capital Político` -30, `Integridade` +15 |
| **Consequência Esquerda** | "O ministro é investigado. O STF entra em crise. Mas o povo vê que a lei vale para todos." |
| **Opção Direita** | Defender o ministro |
| **Efeitos Direita** | `Capital Político` -20, `Consciência` -15, `Integridade` -15 |
| **Consequência Direita** | "O caso é arquivado. Mas o povo vê que a justiça é diferente para os poderosos." |
| **Aprendizado** | Vivencia: "Você decidiu se apoiava ou defendia um ministro do STF investigado." · Conceito: "A blindagem institucional protege magistrados corruptos com aposentadoria integral." · Dados: "O Banco Master revelou 52 mensagens entre Vorcaro e Alexandre de Moraes. A CPI pediu impeachment de Toffoli, Moraes e Gilmar." · Fonte: "Polícia Federal, 2026." · Frase: "A justiça é seletiva. Para os pobres, a prisão. Para os ricos, a blindagem." |

---

## 17.11 — Cartas do Modo Influenciador (20)

### INST-181 — Influenciador Financiado por Bets

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Influenciador financiado |
| **Modo** | Influenciador |
| **Cor** | Preto |
| **Problema** | Um influenciador com 10 milhões de seguidores oferece apoio. Ele pede R$ 2 milhões por mês. O dinheiro viria de uma casa de apostas. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Legitimidade` -10 |
| **Consequência Esquerda** | "O influenciador faz campanha contra você. Mas sua consciência está limpa." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Capital Político` +10, `Legitimidade` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "O influenciador elogia seu governo. Mas o dinheiro vem da perda de apostadores." |
| **Aprendizado** | Vivencia: "Você decidiu se aceitava ou recusava o apoio de um influenciador financiado por bets." · Conceito: "As bets financiam influenciadores com comissão sobre as perdas dos seguidores. O 'cachê da desgraça alheia' é uma das formas mais perversas de exploração digital." · Dados: "A Blaze destinou R$ 330 milhões à propaganda. Ofertas a influenciadores chegaram a R$ 10 milhões por contrato." · Fonte: "Piauí, 2024." · Frase: "O influenciador lucra com a sua perda. E você aplaude." |

---

## 17.12 — Cartas Temáticas (70)

### THEM-001 — Reforma Agrária

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Reforma agrária |
| **Modo** | Temática (Reforma Agrária) |
| **Cor** | Roxo |
| **Problema** | O MST ocupa uma fazenda improdutiva. O agronegócio pressiona por despejo. |
| **Opção Esquerda** | Assentar as famílias |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Capital Político` -15 |
| **Consequência Esquerda** | "A terra é repartida. O agro protesta." |
| **Opção Direita** | Ordenar o despejo |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A polícia despeja as famílias. O agro comemora." |
| **Aprendizado** | Vivencia: "Você decidiu se assentava ou despejava as famílias do MST." · Conceito: "A função social da terra é um princípio constitucional. A reforma agrária nunca ocorreu de forma estrutural." · Dados: "O MST tem mais de 1,5 milhão de membros. A FPA tem 345. O agronegócio recebeu R$ 516 bilhões no Plano Safra 2025/2026. A agricultura familiar recebeu R$ 89 bilhões." · Fonte: "CPT, 2025." · Frase: "A terra é para quem trabalha nela. Não para quem especula." |

---

## 17.13 — Cartas de Atores (70)

### ATOR-001 — Latifundiários

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Latifundiário cobra o favor |
| **Modo** | Ator (Latifundiários) |
| **Cor** | Preto |
| **Problema** | O Latifundiário oferece 50 mil votos em troca de controle total sobre a nomeação de juízes e delegados em sua região. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Capital Político` -15, `Dignidade` +10, `Integridade` +5 |
| **Consequência Esquerda** | "O Latifundiário fica furioso. Mas a dignidade é preservada." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Capital Político` +20, `Dignidade` -15, `Integridade` -10 |
| **Consequência Direita** | "O Latifundiário garante votos. Mas a impunidade aumenta." |
| **Aprendizado** | Vivencia: "Você decidiu se cedia ou não ao Latifundiário." · Conceito: "O coronelismo é o clientelismo. O voto de cabresto ainda existe." · Dados: "A Lei de Terras de 1850 consolidou a concentração fundiária. O coronelismo se adaptou: do senhor de engenho ao dono da Faria Lima." · Fonte: "Darcy Ribeiro, 1995." · Frase: "O coronel não pede. Ele cobra. E a moeda é a lealdade." |

---

## 17.14 — Resumo do Roteiro

| Tipo | Quantidade | Status |
| :--- | :--- | :--- |
| **Institucionais** | 200 | Em desenvolvimento |
| **Temáticas** | 70 | Em desenvolvimento |
| **Atores** | 70 | Em desenvolvimento |
| **Total** | **340** | — |

**Observação:** Este documento está em desenvolvimento. As cartas listadas acima são exemplos do formato. O roteiro completo será preenchido gradualmente, seguindo a estrutura definida.

---

## 17.15 — Referências

- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- ICON GAMES. *Senhor Presidente*. 2016.
- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.

---

**Última atualização:** Outubro de 2026
**Versão:** 1.0 (em desenvolvimento)

