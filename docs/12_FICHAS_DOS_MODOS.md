# 12 — Fichas dos Modos

**Documento de Perfil Detalhado dos 10 Modos Institucionais do Jogo "O Planalto"**

Este documento consolida o perfil detalhado de cada um dos 10 modos institucionais do jogo, incluindo o que ensinam, o medidor principal, os gatilhos de aparição, as cartas associadas, os eventos encadeados, a conexão com atores, as referências cruzadas e a fundamentação teórica. É o documento-base para os roteiristas escreverem as cartas de cada modo.

---

## 12.1. Fundamentação Teórica sobre Modos Institucionais

### 12.1.1. Por Que Modos Institucionais São Essenciais

Modos institucionais são essenciais em jogos educativos por três razões:

1. **Organização** — agrupam cartas por tema, facilitando a aprendizagem.
2. **Cobertura** — garantem que todas as instituições sejam ensinadas.
3. **Progressão** — permitem que o jogador aprenda de forma estruturada.

> "A educação não é sobre acumular informações. É sobre organizar o conhecimento." — Jerome Bruner, *The Process of Education*

### 12.1.2. Metodologia de Construção dos Modos

Cada modo foi construído com base em:

| Fonte | Contribuição |
| :--- | :--- |
| **Ciência política** | Cada modo representa uma instituição real |
| **História do Brasil** | Cada modo reflete uma disputa histórica |
| **Pedagogia** | Cada modo é uma unidade de aprendizagem autônoma |
| **Comentários do Professor Alisson** | Cada modo recebeu ajustes e correções |

### 12.1.3. Estrutura das Fichas

Cada ficha contém:

| Campo | Descrição |
| :--- | :--- |
| **ID** | Código único do modo (MOD-XXX) |
| **Nome** | Nome do modo |
| **O que ensina** | Conceitos institucionais |
| **Medidor Principal** | Qual medidor é mais afetado |
| **Medidores Secundários** | Outros medidores afetados |
| **Gatilhos de Aparição** | Quando o modo aparece |
| **Cartas Associadas** | As 20 cartas do modo |
| **Eventos Encadeados** | Os 2 eventos do modo |
| **Conexão com Atores** | Quais atores aparecem neste modo |
| **Referências Cruzadas** | Outros modos relacionados |
| **Fundamentação** | Base histórica e teórica |

### 12.1.4. Os 10 Modos

| # | Modo | Medidor Principal | Código |
| :--- | :--- | :--- | :--- |
| 1 | Congresso | Capital Político | MOD-001 |
| 2 | Orçamento | Dignidade | MOD-002 |
| 3 | Currículo e Mídia | Consciência | MOD-003 |
| 4 | Geopolítico | Soberania | MOD-004 |
| 5 | Prisional e Policial | Segurança | MOD-005 |
| 6 | Emendas | Caixa | MOD-006 |
| 7 | Bancadas | Capital Político | MOD-007 |
| 8 | Impeachment | Legitimidade | MOD-008 |
| 9 | Judiciário | Consciência / Integridade | MOD-009 |
| 10 | Influenciador / Desinformação | Integridade / Consciência | MOD-010 |

### 12.1.5. Referências

- BRUNER, Jerome. *The Process of Education*. Cambridge: Harvard University Press, 1960.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.

---

## 12.2. Modos Institucionais

### 12.2.1. MOD-001 — Congresso

| Campo | Descrição |
| :--- | :--- |
| **ID** | MOD-001 |
| **Nome** | Congresso |
| **O que ensina** | Bicameralismo, comissões, relatores, poder de agenda, barganha, presidencialismo de coalizão, CPI, quórum, maioria simples, maioria qualificada, veto, sanção |
| **Medidor Principal** | `Capital Político` |
| **Medidores Secundários** | `Dignidade`, `Soberania`, `Integridade`, `Caixa` |
| **Gatilhos de Aparição** | Ano 1-4. Aparece com mais frequência quando `Capital Político` < 40. |
| **Cartas Associadas** | INST-001 a INST-020 (20 cartas) |
| **Eventos Encadeados** | Ano 2: "CPI contra o governo" (`Capital Político` -15, `Integridade` -10) · Ano 3: "Impeachment" (`Capital Político` -20, `Legitimidade` -15) |
| **Conexão com Atores** | Coronel, Tecnocrata, Pastor, Banqueiro/Ruralista, Burocrata |
| **Referências Cruzadas** | MOD-006 (Emendas), MOD-007 (Bancadas), MOD-008 (Impeachment) |
| **Fundamentação** | O bicameralismo brasileiro é um dos mais fragmentados do mundo. A Câmara representa o povo; o Senado representa os estados. O relator tem poder de alterar o texto de um projeto. Em 2016, o relator do impeachment de Dilma admitiu que as pedaladas fiscais não configuravam crime. |

**Cartas do Modo:**

| # | Título | Tema |
| :--- | :--- | :--- |
| INST-001 | Privatização da estatal | Poder de agenda |
| INST-002 | Retirada de direitos trabalhistas | Bicameralismo |
| INST-003 | CPI contra o governo | Fiscalização |
| INST-004 | Indicação para o STF | Freios e contrapesos |
| INST-005 | Marco Temporal | Disputa entre Congresso e STF |
| INST-006 | Aumento do próprio salário | Autopreservação |
| INST-007 | Escândalo de corrupção | CPI |
| INST-008 | Aumento de pena para crimes ambientais | Bancada ruralista |
| INST-009 | Taxa sobre grandes fortunas | Lobby |
| INST-010 | Redução da maioridade penal | Punitivismo |
| INST-011 | Escola sem Partido | Censura |
| INST-012 | Flexibilização do porte de armas | Bancada da bala |
| INST-013 | Privatização dos Correios | Soberania |
| INST-014 | CPI das Bets | Impunidade |
| INST-015 | Criminalização de movimentos sociais | Repressão |
| INST-016 | Licença-paternidade | Direitos sociais |
| INST-017 | Gastar 10% do PIB em saúde | Subfinanciamento |
| INST-018 | Anistia aos crimes da ditadura | Memória |
| INST-019 | Educação financeira em vez de Filosofia | Currículo |
| INST-020 | Redução do salário mínimo | Direitos trabalhistas |

**Citações de Referência:**

- *"O relator tem poder. Quem controla a pauta, controla o país."*
- *"O impeachment não é justiça. É o Congresso te dando um recado."*
- *"O bicameralismo exige que a Câmara e o Senado aprovem o mesmo texto."*

---

### 12.2.2. MOD-002 — Orçamento

| Campo | Descrição |
| :--- | :--- |
| **ID** | MOD-002 |
| **Nome** | Orçamento |
| **O que ensina** | Teto de gastos, dívida pública, emendas parlamentares, subfinanciamento, escolhas políticas, orçamento público ≠ orçamento doméstico |
| **Medidor Principal** | `Dignidade` |
| **Medidores Secundários** | `Caixa`, `Capital Político`, `Integridade`, `Legitimidade` |
| **Gatilhos de Aparição** | Ano 1-4. Aparece com mais frequência quando `Caixa` < 30 ou `Dignidade` < 30. |
| **Cartas Associadas** | INST-021 a INST-040 (20 cartas) |
| **Eventos Encadeados** | Ano 2: "Crise fiscal" (`Caixa` -15, `Dignidade` -10) · Ano 3: "Falência" (`Caixa` -20, `Capital Político` -15) |
| **Conexão com Atores** | Tecnocrata, Médico do SUS, Professor, Banqueiro/Ruralista, Empresário da Saúde, Reitor Privatista |
| **Referências Cruzadas** | MOD-006 (Emendas), MOD-009 (Judiciário) |
| **Fundamentação** | O orçamento público não é como o de casa. O governo pode gastar mais do que arrecada para investir e gerar arrecadação futura. O teto de gastos retirou R$ 37 bilhões do SUS entre 2018 e 2022. A expectativa de vida caiu de 76,2 para 72,8 anos. |

**Cartas do Modo:**

| # | Título | Tema |
| :--- | :--- | :--- |
| INST-021 | Corte na saúde | Teto de gastos |
| INST-022 | Dívida pública | Renegociação |
| INST-023 | Teto de gastos | EC 95 |
| INST-024 | Emenda para show | Emendas |
| INST-025 | Subsídio para agronegócio | Prioridades |
| INST-026 | Taxar grandes fortunas | Justiça fiscal |
| INST-027 | Corte na educação | Sucateamento |
| INST-028 | Corte na cultura | Censura |
| INST-029 | Ampliação do Bolsa Família | Combate à fome |
| INST-030 | Verba para o SUS | Subfinanciamento |
| INST-031 | Trem-bala | Prioridades |
| INST-032 | Cisternas no Nordeste | Seca |
| INST-033 | Corte no salário mínimo | Direitos |
| INST-034 | Pagamento da dívida | Credores |
| INST-035 | CAPS e saúde mental | Luta antimanicomial |
| INST-036 | Construção de presídios | Encarceramento |
| INST-037 | Creches | Educação infantil |
| INST-038 | Corte na cultura (2) | Resistência |
| INST-039 | Verba para cisternas | Seca |
| INST-040 | Taxar grandes heranças | Desigualdade |

**Citações de Referência:**

- *"Cortar saúde não é 'ajuste fiscal'. É uma escolha que mata."*
- *"O orçamento público não é como o de casa."*
- *"A dívida pública consome 40% do orçamento."*

---

### 12.2.3. MOD-003 — Currículo e Mídia

| Campo | Descrição |
| :--- | :--- |
| **ID** | MOD-003 |
| **Nome** | Currículo e Mídia |
| **O que ensina** | BNCC, concessões de TV, censura, pensamento crítico, educação integral, mídia como campo de batalha, redes sociais |
| **Medidor Principal** | `Consciência` |
| **Medidores Secundários** | `Integridade`, `Dignidade`, `Capital Político` |
| **Gatilhos de Aparição** | Ano 1-4. Aparece com mais frequência quando `Consciência` < 30 ou `Integridade` < 30. |
| **Cartas Associadas** | INST-041 a INST-060 (20 cartas) |
| **Eventos Encadeados** | Ano 2: "Geração sem pensamento crítico" (`Consciência` -15, `Integridade` -10) · Ano 3: "Desintegração" (`Integridade` -20, `Consciência` -15) |
| **Conexão com Atores** | Professor, Artista Engajado, Pastor, Coach Digital, Reitor Privatista, Jornalista Independente |
| **Referências Cruzadas** | MOD-010 (Influenciador) |
| **Fundamentação** | A Lei 13.415/2017 rebaixou Filosofia e Sociologia de "disciplinas obrigatórias" para "estudos e práticas". O "Escola sem Partido" criminaliza o debate crítico. A educação integral (CIEPs) ataca as causas do crime. |

**Cartas do Modo:**

| # | Título | Tema |
| :--- | :--- | :--- |
| INST-041 | Retirada de Filosofia/Sociologia | Currículo |
| INST-042 | Concessão de TV para pastor | Mídia |
| INST-043 | Educação sexual | Pânico moral |
| INST-044 | Fake news em emissora | Desinformação |
| INST-045 | Proibição de "ideologia de gênero" | Censura |
| INST-046 | Privatização da TV pública | Mídia |
| INST-047 | Método Paulo Freire | Pedagogia |
| INST-048 | TV comunitária | Mídia alternativa |
| INST-049 | Educação financeira em vez de Sociologia | Currículo |
| INST-050 | Influenciadora dando aula de cidadania | Educação |
| INST-051 | Censura a documentário | Memória |
| INST-052 | Globo critica o governo | Mídia |
| INST-053 | Proibição de História Afro-Brasileira | Racismo |
| INST-054 | Derrubada de perfil de jornalista | Censura privada |
| INST-055 | Darcy Ribeiro e Paulo Freire no currículo | Pedagogia |
| INST-056 | Educação para a Cidadania | Currículo |
| INST-057 | Emissora acusada de racismo | Mídia |
| INST-058 | Proibição de linguagem neutra | Censura |
| INST-059 | Programa de leitura nas periferias | Educação |
| INST-060 | Debate político em sala | Liberdade de cátedra |

**Citações de Referência:**

- *"A educação é a única arma que o povo tem."*
- *"Sem pensamento crítico, o povo é presa fácil do pânico moral."*
- *"Quem controla a narrativa, controla o voto."*

---

### 12.2.4. MOD-004 — Geopolítico

| Campo | Descrição |
| :--- | :--- |
| **ID** | MOD-004 |
| **Nome** | Geopolítico |
| **O que ensina** | BRICS, desdolarização, dependência externa, soberania, imperialismo, domínio chinês, venda de recursos estratégicos |
| **Medidor Principal** | `Soberania` |
| **Medidores Secundários** | `Caixa`, `Dignidade`, `Integridade` |
| **Gatilhos de Aparição** | Ano 2-4. Aparece com mais frequência quando `Soberania` < 30. |
| **Cartas Associadas** | INST-061 a INST-080 (20 cartas) |
| **Eventos Encadeados** | Ano 2: "Dependência externa" (`Soberania` -15, `Caixa` +10) · Ano 3: "Colônia" (`Soberania` -20, `Dignidade` -15) |
| **Conexão com Atores** | Banqueiro/Ruralista, Tecnocrata, Ambientalista, Indígena |
| **Referências Cruzadas** | MOD-002 (Orçamento) |
| **Fundamentação** | O BRICS busca reduzir a dependência do dólar com sistemas como BRICS Pay, BRICS Bridge e BRICS Clear. O Brasil importa 85% dos fertilizantes. A China também exerce domínio sobre o Brasil. A soberania não está à venda — está em disputa. |

**Cartas do Modo:**

| # | Título | Tema |
| :--- | :--- | :--- |
| INST-061 | Adesão ao BRICS | Desdolarização |
| INST-062 | Venda de lítio | Soberania tecnológica |
| INST-063 | Pressão dos EUA | Alinhamento |
| INST-064 | Acordo com a China | Comércio |
| INST-065 | Empréstimo do FMI | Dependência |
| INST-066 | Venda da Embraer | Tecnologia |
| INST-067 | Moeda comum do BRICS | Desdolarização |
| INST-068 | Envio de tropas | Subordinação |
| INST-069 | Corte de fertilizantes | Dependência |
| INST-070 | Preço do petróleo | Energia |
| INST-071 | Taxação das big techs | Soberania digital |
| INST-072 | Moeda comum do Mercosul | Integração |
| INST-073 | Compra de terras por China | Soberania alimentar |
| INST-074 | Ajuda militar dos EUA | Ingerência |
| INST-075 | Adesão à OCDE | Alinhamento |
| INST-076 | Acesso a vacinas | Saúde global |
| INST-077 | Base militar na Amazônia | Soberania |
| INST-078 | Banco do BRICS | Alternativa |
| INST-079 | Extradição de cidadão | Soberania |
| INST-080 | Recebimento de refugiados | Direitos humanos |

**Citações de Referência:**

- *"A soberania não está à venda. Ela está em disputa."*
- *"O Brasil não será colônia de ninguém novamente."*
- *"A dependência externa não é apenas econômica. É política e cultural."*

---

### 12.2.5. MOD-005 — Prisional e Policial

| Campo | Descrição |
| :--- | :--- |
| **ID** | MOD-005 |
| **Nome** | Prisional e Policial |
| **O que ensina** | Encarceramento em massa, política de drogas, violência policial, Estado penal vs. Estado social, sistema prisional, facções |
| **Medidor Principal** | `Segurança` |
| **Medidores Secundários** | `Dignidade`, `Consciência`, `Integridade` |
| **Gatilhos de Aparição** | Ano 1-4. Aparece com mais frequência quando `Segurança` < 30 ou `Dignidade` < 30. |
| **Cartas Associadas** | INST-081 a INST-100 (20 cartas) |
| **Eventos Encadeados** | Ano 2: "Rebelião em presídios" (`Segurança` -15, `Dignidade` -10) · Ano 3: "Estado de Caos" (`Segurança` -20, `Dignidade` -15) |
| **Conexão com Atores** | Miliciano, Médico do SUS, Professor, Quilombola |
| **Referências Cruzadas** | MOD-009 (Judiciário) |
| **Fundamentação** | A polícia matou 11 pessoas por dia em 2024. 86% eram negras. O Brasil é o 3º país que mais encarcera no mundo. 69% da população carcerária é negra. O encarceramento em massa não reduz a violência. |

**Cartas do Modo:**

| # | Título | Tema |
| :--- | :--- | :--- |
| INST-081 | Superlotação prisional | Encarceramento |
| INST-082 | Polícia mata 11 por dia | Violência policial |
| INST-083 | Descriminalização da maconha | Drogas |
| INST-084 | Operação policial letal | Chacina |
| INST-085 | Câmeras em uniformes | Transparência |
| INST-086 | Facção controla transporte | Crime organizado |
| INST-087 | Redução da maioridade penal | Punitivismo |
| INST-088 | Separação de presos por facção | Sistema prisional |
| INST-089 | Polícia invade escola | Violência |
| INST-090 | Redução de danos | Saúde pública |
| INST-091 | Líder comunitário preso | Criminalização |
| INST-092 | Fim das saidinhas | Ressocialização |
| INST-093 | Chacina policial | Genocídio |
| INST-094 | Taxação de armas | Controle |
| INST-095 | Policial vende armas | Corrupção |
| INST-096 | Proteção a testemunhas | Segurança |
| INST-097 | PF investiga governador | Impunidade |
| INST-098 | Sistema prisional feminino | Dignidade menstrual |
| INST-099 | Desmilitarização da polícia | Democracia |
| INST-100 | População carcerária negra | Racismo |

**Citações de Referência:**

- *"O Estado que mata não protege. Ele extermina."*
- *"A guerra às drogas é uma guerra contra os pobres."*
- *"A polícia militar é herdeira da ditadura."*

---

### 12.2.6. MOD-006 — Emendas

| Campo | Descrição |
| :--- | :--- |
| **ID** | MOD-006 |
| **Nome** | Emendas |
| **O que ensina** | Presidencialismo de coalizão, emendas parlamentares, moeda de troca, fisiologismo, Centrão, governabilidade |
| **Medidor Principal** | `Caixa` |
| **Medidores Secundários** | `Capital Político`, `Dignidade`, `Integridade` |
| **Gatilhos de Aparição** | Ano 1-4. Aparece com mais frequência quando `Caixa` > 60 ou `Capital Político` < 40. |
| **Cartas Associadas** | INST-101 a INST-120 (20 cartas) |
| **Eventos Encadeados** | Ano 2: "Escândalo de desvio" (`Caixa` -15, `Integridade` -10) · Ano 3: "Impeachment" (`Capital Político` -20, `Legitimidade` -15) |
| **Conexão com Atores** | Coronel, Burocrata, Banqueiro/Ruralista, Pastor |
| **Referências Cruzadas** | MOD-001 (Congresso), MOD-007 (Bancadas) |
| **Fundamentação** | As emendas parlamentares representam 0,9% do orçamento. Entre janeiro de 2024 e março de 2026, cem artistas acumularam mais de R$ 5 bilhões em cachês. O agronegócio recebeu 56 vezes mais recursos que a agricultura familiar. |

**Cartas do Modo:**

| # | Título | Tema |
| :--- | :--- | :--- |
| INST-101 | Emenda para show | Emendas |
| INST-102 | Emenda para obra faraônica | Prioridades |
| INST-103 | Emenda para templo | Estado laico |
| INST-104 | Emenda em troca de voto | Fisiologismo |
| INST-105 | Emenda para armas | Segurança |
| INST-106 | Emenda para reforma agrária | Justiça social |
| INST-107 | Emenda para bets | Lavagem |
| INST-108 | Emenda para escola | Educação |
| INST-109 | Emenda para agro | Agronegócio |
| INST-110 | Emenda para rodovia | Conflito de interesses |
| INST-111 | Emenda para educação | PNE |
| INST-112 | Emenda para clínica privada | Privatização |
| INST-113 | Emenda para ônibus elétricos | Mobilidade |
| INST-114 | Emenda para festa junina | Cultura |
| INST-115 | Emenda para presídios | Encarceramento |
| INST-116 | Emenda para ONG religiosa | Estado laico |
| INST-117 | Emenda para cultura | Lei Rouanet |
| INST-118 | Emenda para mineradora | Soberania |
| INST-119 | Emenda para fiscalização ambiental | Meio ambiente |
| INST-120 | Emenda para hospital | Saúde |

**Citações de Referência:**

- *"As emendas parlamentares são moeda de troca."*
- *"O voto é comprado. A política virou mercado."*
- *"O presidencialismo de coalizão é isso: o Executivo precisa do Legislativo para governar."*

---

### 12.2.7. MOD-007 — Bancadas

| Campo | Descrição |
| :--- | :--- |
| **ID** | MOD-007 |
| **Nome** | Bancadas |
| **O que ensina** | Bancada BBB (Boi, Bíblia, Bala), bancadas de direitos, bancadas temáticas, lobby, financiamento de campanha |
| **Medidor Principal** | `Capital Político` |
| **Medidores Secundários** | `Dignidade`, `Consciência`, `Soberania`, `Integridade` |
| **Gatilhos de Aparição** | Ano 2-4. Aparece com mais frequência quando `Capital Político` < 40. |
| **Cartas Associadas** | INST-121 a INST-140 (20 cartas) |
| **Eventos Encadeados** | Ano 2: "Agenda conservadora avança" (`Consciência` -10, `Soberania` -5) · Ano 3: "Hegemonia Autoritária" (`Capital Político` +20, `Consciência` -20) |
| **Conexão com Atores** | Coronel, Pastor, Banqueiro/Ruralista, Miliciano, Professor, Sindicalista |
| **Referências Cruzadas** | MOD-001 (Congresso), MOD-006 (Emendas) |
| **Fundamentação** | A FPA tem 345 membros. A FPE tem 210 deputados. A FPSP tem 260+ integrantes. Quando atuam juntas, formam a bancada BBB. A FPA recebeu R$ 426 milhões em doações de campanha em 2014. |

**Cartas do Modo:**

| # | Título | Tema |
| :--- | :--- | :--- |
| INST-121 | Bancada BBB | Tríade |
| INST-122 | Indicação para o STF | Conservadorismo |
| INST-123 | Marco Temporal | Indígenas |
| INST-124 | Redução da maioridade penal | Punitivismo |
| INST-125 | Bancada das bets | Lavagem |
| INST-126 | Salário mínimo | Trabalhadores |
| INST-127 | Igualdade salarial | Mulheres |
| INST-128 | Cotas raciais | Racismo |
| INST-129 | Fundeb | Educação |
| INST-130 | Isenção para agro | Agronegócio |
| INST-131 | Mais armas para polícia | Segurança |
| INST-132 | Proibição de ensino de gênero | Censura |
| INST-133 | Anistia a crimes ambientais | Meio ambiente |
| INST-134 | Verbas para cultura | Cultura |
| INST-135 | Legalização de cassinos | Jogos |
| INST-136 | Armamento da população | Segurança |
| INST-137 | Dia do Orgulho Heterossexual | Costumes |
| INST-138 | Fim da escala 6x1 | Trabalhadores |
| INST-139 | Liberação de agrotóxicos | Saúde |
| INST-140 | Revogação do teto de gastos | Educação |

**Citações de Referência:**

- *"As bancadas BBB controlam o Congresso."*
- *"A bancada evangélica tem 210 deputados. Ela controla o Congresso."*
- *"A bancada ruralista tem 345 membros. É a maior bancada temática."*

---

### 12.2.8. MOD-008 — Impeachment

| Campo | Descrição |
| :--- | :--- |
| **ID** | MOD-008 |
| **Nome** | Impeachment |
| **O que ensina** | Processo de impeachment, quórum de 2/3, julgamento político, golpe institucional, crime de responsabilidade |
| **Medidor Principal** | `Legitimidade` |
| **Medidores Secundários** | `Capital Político`, `Consciência`, `Integridade` |
| **Gatilhos de Aparição** | Ano 2-4. Acionado quando `Legitimidade` < 20 E `Capital Político` < 20. |
| **Cartas Associadas** | INST-141 a INST-160 (20 cartas) |
| **Eventos Encadeados** | Ano 3: "Processo instaurado" (`Capital Político` -15, `Legitimidade` -10) · Ano 4: "Condenação ou absolvição" (`Legitimidade` -30 ou +20) |
| **Conexão com Atores** | Todos os atores |
| **Referências Cruzadas** | MOD-001 (Congresso), MOD-009 (Judiciário) |
| **Fundamentação** | O impeachment de Dilma Rousseff em 2016 foi um golpe parlamentar, jurídico e midiático. O relator Antonio Anastasia admitiu que as pedaladas fiscais não configuravam crime. A contradição central foi que Dilma perdeu o mandato, mas manteve seus direitos políticos. |

**Cartas do Modo:**

| # | Título | Tema |
| :--- | :--- | :--- |
| INST-141 | O Pedido | Início do processo |
| INST-142 | A Comissão | Relator adversário |
| INST-143 | A Votação na Câmara | Quórum de 2/3 |
| INST-144 | O Julgamento no Senado | Quórum de 2/3 |
| INST-145 | O Desfecho | Absolvição ou condenação |
| INST-146 | Negociar com presidente da Câmara | Engavetamento |
| INST-147 | Mobilizar a base | Barganha |
| INST-148 | Apelar ao povo | Manifestação |
| INST-149 | Confiar na base | Racha |
| INST-150 | Renunciar | Fim do mandato |
| INST-151 | Denunciar o golpe | Resistência |
| INST-152 | Negociar com o Senado | Barganha |
| INST-153 | Mobilizar manifestações | Pressão popular |
| INST-154 | Aceitar o resultado | Conformismo |
| INST-155 | Lutar até o fim | Resistência |
| INST-156 | Pedir apoio internacional | Solidariedade |
| INST-157 | Acionar o STF | Judicialização |
| INST-158 | Convocar plebiscito | Democracia direta |
| INST-159 | Renunciar antes da condenação | Dignidade |
| INST-160 | Aceitar a condenação | Resignação |

**Citações de Referência:**

- *"O impeachment não é justiça. É o Congresso te dando um recado."*
- *"Uma condenação política exige obrigatoriamente a ocorrência de um crime de responsabilidade."*
- *"Hoje temo a morte da democracia, pela qual muitos de nós lutamos."*

---

### 12.2.9. MOD-009 — Judiciário

| Campo | Descrição |
| :--- | :--- |
| **ID** | MOD-009 |
| **Nome** | Judiciário |
| **O que ensina** | Venda de sentenças, blindagem institucional, suspeição, foro privilegiado, aposentadoria compulsória, impunidade |
| **Medidor Principal** | `Consciência` / `Integridade` |
| **Medidores Secundários** | `Capital Político`, `Legitimidade`, `Dignidade` |
| **Gatilhos de Aparição** | Ano 2-4. Aparece com mais frequência quando `Integridade` < 30. |
| **Cartas Associadas** | INST-161 a INST-180 (20 cartas) |
| **Eventos Encadeados** | Ano 2: "Escândalo no STF" (`Integridade` -15, `Consciência` -10) · Ano 3: "Crise institucional" (`Integridade` -20, `Capital Político` -15) |
| **Conexão com Atores** | Jornalista Independente, Burocrata, Banqueiro/Ruralista |
| **Referências Cruzadas** | MOD-001 (Congresso), MOD-010 (Influenciador) |
| **Fundamentação** | A venda de sentenças é um mercado nacional. O Banco Master revelou 52 mensagens entre Vorcaro e Alexandre de Moraes. A CPI pediu impeachment de Toffoli, Moraes e Gilmar. A aposentadoria compulsória é uma forma de blindagem institucional. |

**Cartas do Modo:**

| # | Título | Tema |
| :--- | :--- | :--- |
| INST-161 | Ministro do STF com 52 mensagens | Blindagem |
| INST-162 | Desembargador vendendo sentenças | Corrupção |
| INST-163 | STF declara lei inconstitucional | Freios e contrapesos |
| INST-164 | Juiz bloqueia política social | Seletividade |
| INST-165 | PF prende governador aliado | Impunidade |
| INST-166 | Prisão em segunda instância | Impunidade |
| INST-167 | Habeas corpus para banqueiro | Seletividade |
| INST-168 | PF investiga ministro do STF | Crise |
| INST-169 | CNJ afasta juiz | Controle externo |
| INST-170 | Aumento do número de ministros do STF | Empacotamento |
| INST-171 | Juiz bloqueia demarcação indígena | Seletividade |
| INST-172 | Julgamento do Marco Temporal | Disputa |
| INST-173 | Juíza ameaçada por milícias | Violência |
| INST-174 | Homofobia é crime | Direitos |
| INST-175 | Tribunal de Contas aprova contas | Impunidade |
| INST-176 | Prisão de banqueiro | Seletividade |
| INST-177 | Juiz recebe propina | Corrupção |
| INST-178 | Porte de drogas não é crime | Drogas |
| INST-179 | PF prende lobista do STJ | Venda de sentenças |
| INST-180 | Ouvidoria externa do Judiciário | Transparência |

**Citações de Referência:**

- *"A justiça é seletiva. Para os pobres, a prisão. Para os ricos, a blindagem."*
- *"O Judiciário não é cego. Ele enxerga quem pode pagar."*
- *"A impunidade dos poderosos é a regra. A justiça é seletiva."*

---

### 12.2.10. MOD-010 — Influenciador / Desinformação

| Campo | Descrição |
| :--- | :--- |
| **ID** | MOD-010 |
| **Nome** | Influenciador / Desinformação |
| **O que ensina** | Fake news, deepfakes, bets, influenciadores, pânico moral, desmoralização, didatismo acusatório, fazendas de IA, cachê da desgraça |
| **Medidor Principal** | `Integridade` / `Consciência` |
| **Medidores Secundários** | `Legitimidade`, `Capital Político`, `Dignidade` |
| **Gatilhos de Aparição** | Ano 1-4. Aparece com mais frequência quando `Integridade` < 30 ou `Consciência` < 30. |
| **Cartas Associadas** | INST-181 a INST-200 (20 cartas) |
| **Eventos Encadeados** | Ano 2: "Deepfake viral" (`Integridade` -15, `Consciência` -10) · Ano 3: "Desintegração" (`Integridade` -20, `Consciência` -15) |
| **Conexão com Atores** | Coach Digital, Jornalista Independente, Influenciador Progressista, Pastor |
| **Referências Cruzadas** | MOD-003 (Currículo e Mídia) |
| **Fundamentação** | A divulgação de conteúdos falsos com IA mais que triplicou entre 2024 e 2025. 554 vídeos deepfake foram publicados nas eleições de 2026. As bets financiam influenciadores com comissão sobre as perdas. O "cachê da desgraça alheia" é uma das formas mais perversas de exploração digital. |

**Cartas do Modo:**

| # | Título | Tema |
| :--- | :--- | :--- |
| INST-181 | Influenciador financiado por bets | Lavagem |
| INST-182 | Influenciadora apoiada por bets | Campanha |
| INST-183 | Youtuber bolsonarista espalha fake news | Desinformação |
| INST-184 | Influenciadora promove bet | Jogos |
| INST-185 | Streamer critica o governo | Liberdade |
| INST-186 | Influenciadora eleita deputada | Política |
| INST-187 | Influenciador financiado pelo agro | Agronegócio |
| INST-188 | Rede de influenciadores financiada por igreja | Religião |
| INST-189 | Influenciador pede cargos | Cooptação |
| INST-190 | Influenciadora contra vacinação | Saúde |
| INST-191 | Influenciador pago para elogiar governo | Propaganda |
| INST-192 | Influenciadora presa por lavagem | Crime |
| INST-193 | Influenciador apoia em troca de isenção | Corrupção |
| INST-194 | Rede de influenciadores financiada por bets | Lavagem |
| INST-195 | Influenciador espalha fake news sobre STF | Ataque |
| INST-196 | Influenciadora promove reforma agrária | Resistência |
| INST-197 | Influenciador bolsonarista pede impeachment | Polarização |
| INST-198 | Influenciadora eleita com apoio de bets | Política |
| INST-199 | Influenciador financiado pelo PCC | Crime organizado |
| INST-200 | Influenciadora apoia redução da maioridade | Punitivismo |

**Citações de Referência:**

- *"As bets financiam influenciadores com comissão sobre as perdas."*
- *"A mentira repetida mil vezes torna-se verdade."*
- *"A desinformação é uma arma. Ignorar é perder a narrativa."*

---

## 12.3. Síntese dos Modos

### 12.3.1. Modos por Medidor Principal

| Medidor | Modos |
| :--- | :--- |
| **Dignidade** | Orçamento, Prisional e Policial |
| **Consciência** | Currículo e Mídia, Judiciário |
| **Soberania** | Geopolítico |
| **Segurança** | Prisional e Policial |
| **Integridade** | Judiciário, Influenciador |
| **Caixa** | Emendas |
| **Capital Político** | Congresso, Bancadas |
| **Legitimidade** | Impeachment |

### 12.3.2. Modos por Fase do Jogo

| Fase | Modos que Aparecem com Mais Frequência |
| :--- | :--- |
| **Lua de Mel (Ano 1)** | Congresso, Orçamento, Currículo e Mídia |
| **Realidade Bate (Ano 2)** | Geopolítico, Emendas, Bancadas, Influenciador |
| **Crise (Ano 3)** | Prisional e Policial, Judiciário, Impeachment |
| **Desfecho (Ano 4)** | Todos os modos |

### 12.3.3. Modos por Conexão com Atores

| Ator | Modos em que Aparece |
| :--- | :--- |
| **Coronel** | Congresso, Emendas, Bancadas |
| **Tecnocrata** | Orçamento, Geopolítico |
| **Populista** | Impeachment |
| **Miliciano** | Prisional e Policial |
| **Pastor** | Currículo e Mídia, Bancadas |
| **Banqueiro/Ruralista** | Orçamento, Geopolítico, Emendas, Judiciário |
| **Professor** | Currículo e Mídia, Orçamento |
| **Médico do SUS** | Orçamento, Prisional e Policial |
| **Coach Digital** | Influenciador |
| **Jornalista Independente** | Currículo e Mídia, Judiciário, Influenciador |
| **Artista Engajado** | Currículo e Mídia |
| **Burocrata** | Congresso, Emendas, Judiciário |
| **Empresário da Saúde** | Orçamento |
| **Reitor Privatista** | Currículo e Mídia, Orçamento |
| **Sindicalista** | Orçamento, Bancadas |
| **Estudante** | Currículo e Mídia |
| **Ambientalista** | Geopolítico, Prisional e Policial |
| **Indígena** | Geopolítico, Judiciário |
| **Quilombola** | Prisional e Policial, Judiciário |
| **Influenciador Progressista** | Influenciador |

### 12.3.4. Modos por Tipo de Carta

| Tipo | Modos | Quantidade |
| :--- | :--- | :--- |
| **Institucional** | Todos os 10 modos | 200 cartas |
| **Temática** | 7 temas transversais | 70 cartas |
| **Ator** | 24 atores | 72 cartas |
| **Total** | — | **342 cartas** |

---

## 12.4. Fluxo dos Modos no Jogo

### 12.4.1. Diagrama de Fluxo

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUXO DOS MODOS                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ANO 1 — LUA DE MEL                                         │
│  ├── MOD-001 Congresso                                      │
│  ├── MOD-002 Orçamento                                      │
│  ├── MOD-003 Currículo e Mídia                              │
│  └── MOD-010 Influenciador                                  │
│                                                             │
│  ANO 2 — REALIDADE BATE                                     │
│  ├── MOD-004 Geopolítico                                    │
│  ├── MOD-006 Emendas                                        │
│  ├── MOD-007 Bancadas                                       │
│  └── MOD-010 Influenciador                                  │
│                                                             │
│  ANO 3 — CRISE                                              │
│  ├── MOD-005 Prisional e Policial                           │
│  ├── MOD-008 Impeachment                                    │
│  └── MOD-009 Judiciário                                     │
│                                                             │
│  ANO 4 — DESFECHO                                           │
│  └── Todos os modos                                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 12.4.2. Regras de Aparição

| Regra | Descrição |
| :--- | :--- |
| **1. Prioridade Narrativa** | Se uma decisão anterior gerou uma consequência, a carta da consequência aparece obrigatoriamente no turno correto. |
| **2. Prioridade de Ator** | Se um ator está insatisfeito (satisfação < 30), ele aparece obrigatoriamente no próximo turno. |
| **3. Prioridade de Medidor** | Se um medidor está < 30, cartas relacionadas a ele aparecem obrigatoriamente no próximo turno. |
| **4. Prioridade de Modo** | Se um modo não apareceu nos últimos 2 turnos, ele tem prioridade. |
| **5. Variedade** | Se um modo já apareceu no turno, ele não aparece de novo no mesmo turno. |
| **6. Aleatoriedade Controlada** | As cartas restantes são sorteadas aleatoriamente, mas com peso igual. |

---

## 12.5. Referências

- BRUNER, Jerome. *The Process of Education*. Cambridge: Harvard University Press, 1960.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.
- RIBEIRO, Darcy. *O Povo Brasileiro*. São Paulo: Companhia das Letras, 1995.
- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- SANTOS, Milton. *O Espaço do Cidadão*. São Paulo: Nobel, 1987.
- FERNANDES, Florestan. *A Revolução Burguesa no Brasil*. Rio de Janeiro: Zahar, 1975.
- HOLANDA, Sérgio Buarque de. *Raízes do Brasil*. São Paulo: Companhia das Letras, 1936.
- PRADO JR., Caio. *Formação do Brasil Contemporâneo*. São Paulo: Brasiliense, 1942.
- Alisson, Professor. *Comentários sobre o Livro do Projeto*. 2026.
- Revista Acervo (Arquivo Nacional). *Os sentidos do golpe*. Rio de Janeiro: Arquivo Nacional, 2025.
- CPT. *Conflitos no Campo Brasil 2025*. Goiânia: CPT, 2026.
- INESC. *Relatório Luz 2025*. Brasília, 2025.
- Agência Brasil. *Mesmo proibidos, deepfakes tomam conta das redes*. Brasília, 2026.
- Senado. *CPI das Bets rejeita relatório*. Brasília, 2025.
- STF. *STF determina prisão de Daniel Vorcaro*. Brasília, 2026.
