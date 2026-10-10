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

> **Divergência pendente:** o roteiro de atores inserido tem **72 cartas** (24 atores × 3, conforme `docs/11_FICHAS_DOS_ATORES.md:53`), o que leva o baralho a **342**. A meta de 340 está mantida até decisão do PO.

### 17.01.3. Aprendizado nas Cartas

- Cartas com o campo completo (Vivencia, Conceito, Dados, Fonte, Frase) mantêm o texto já escrito.
- Nas demais, o campo traz a versão curta: `Dados` e `Frase` (só `Frase` quando os dois textos são iguais).
- A Carta de Aprendizado completa fica no doc 18, com o mesmo número: `INST-001` ↔ `APR-001`.

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

### INST-007 — Escândalo de Corrupção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escândalo de corrupção |
| **Modo** | Congresso |
| **Cor** | Amarelo |
| **Problema** | Um escândalo de corrupção atinge um ministro do governo. |
| **Opção Esquerda** | Exonerar o ministro |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "O governo se limpa." |
| **Opção Direita** | Proteger o ministro |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A impunidade se instala." |
| **Aprendizado** | Dados: "O Banco Master revelou fraudes bilionárias com envolvimento político." · Frase: "A corrupção não tem ideologia." |

### INST-008 — Crimes Ambientais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Crimes ambientais |
| **Modo** | Congresso |
| **Cor** | Verde |
| **Problema** | O Senado quer aumentar a pena para crimes ambientais. A bancada ruralista é contra. |
| **Opção Esquerda** | Apoiar a lei |
| **Efeitos Esquerda** | `Soberania` +10, `Dignidade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A floresta respira." |
| **Opção Direita** | Bloquear a lei |
| **Efeitos Direita** | `Capital Político` +10, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "O desmatamento continua." |
| **Aprendizado** | Dados: "O Brasil desmatou 62,2% mais na Amazônia em 2022." · Frase: "O agro destrói e chama de progresso." |

### INST-009 — Taxa Sobre Grandes Fortunas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxa sobre grandes fortunas |
| **Modo** | Congresso |
| **Cor** | Amarelo |
| **Problema** | A Câmara quer criar uma taxa sobre grandes fortunas. O Senado resiste. |
| **Opção Esquerda** | Mobilizar a base |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` +20, `Capital Político` -20 |
| **Consequência Esquerda** | "O rico paga mais." |
| **Opção Direita** | Recuar |
| **Efeitos Direita** | `Caixa` -10, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O pobre paga mais." |
| **Aprendizado** | Dados: "O 1% mais rico concentra 27% da renda. Os 40% mais pobres dividem 12%." · Frase: "O rico continua rico." |

### INST-010 — Redução da Maioridade Penal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Redução da maioridade penal |
| **Modo** | Congresso |
| **Cor** | Vermelho |
| **Problema** | O Congresso quer reduzir a maioridade penal. Especialistas dizem que não resolve. |
| **Opção Esquerda** | Vetar a redução |
| **Efeitos Esquerda** | `Consciência` +5, `Dignidade` +5, `Capital Político` -15 |
| **Consequência Esquerda** | "A violência não cai, mas os jovens não são presos." |
| **Opção Direita** | Apoiar a redução |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -10, `Capital Político` +10 |
| **Consequência Direita** | "Mais adolescentes presos." |
| **Aprendizado** | Dados: "O Brasil é o 3º país que mais encarcera. 69% da população carcerária é negra." · Frase: "Encarcerar não resolve." |

### INST-011 — Escola sem Partido

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escola sem Partido |
| **Modo** | Congresso |
| **Cor** | Roxo |
| **Problema** | A bancada evangélica quer aprovar o 'Escola sem Partido'. Professores protestam. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +15, `Integridade` +10, `Capital Político` -20 |
| **Consequência Esquerda** | "A liberdade de cátedra é preservada." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A censura se instala." |
| **Aprendizado** | Dados: "A Lei 13.415/2017 retirou a obrigatoriedade de Filosofia e Sociologia." · Frase: "Sem pensamento crítico, o povo é presa fácil." |

### INST-012 — Flexibilização do Porte de Armas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Flexibilização do porte de armas |
| **Modo** | Congresso |
| **Cor** | Vermelho |
| **Problema** | O Senado quer flexibilizar o porte de armas. A bancada da bala apoia. |
| **Opção Esquerda** | Mobilizar contra |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "As armas continuam controladas." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -15, `Capital Político` +10 |
| **Consequência Direita** | "Mais armas nas ruas." |
| **Aprendizado** | Dados: "O Estatuto do Desarmamento reduziu mortes por arma de fogo." · Frase: "Mais armas, mais mortes." |

### INST-013 — Privatização dos Correios

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Privatização dos Correios |
| **Modo** | Congresso |
| **Cor** | Laranja |
| **Problema** | O Congresso ameaça derrubar seu veto à privatização dos Correios. |
| **Opção Esquerda** | Negociar com senadores |
| **Efeitos Esquerda** | `Capital Político` -20, `Soberania` +10, `Integridade` +5 |
| **Consequência Esquerda** | "Os Correios continuam públicos." |
| **Opção Direita** | Deixar derrubar |
| **Efeitos Direita** | `Soberania` -15, `Capital Político` +10, `Caixa` +10 |
| **Consequência Direita** | "Os Correios são vendidos." |
| **Aprendizado** | Dados: "Os Correios atendem 5.570 municípios." · Frase: "O serviço público não é mercadoria." |

### INST-014 — CPI das Bets

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | CPI das Bets |
| **Modo** | Congresso |
| **Cor** | Amarelo |
| **Problema** | A oposição quer criar uma CPI para investigar as bets. A bancada das bets reage. |
| **Opção Esquerda** | Apoiar a CPI |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -10 |
| **Consequência Esquerda** | "A investigação avança." |
| **Opção Direita** | Engavetar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -15 |
| **Consequência Direita** | "Ninguém é punido." |
| **Aprendizado** | Dados: "O relatório da CPI foi rejeitado por 4 votos a 3." · Frase: "A impunidade é a regra." |

### INST-015 — Criminalização de Movimentos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Criminalização de movimentos |
| **Modo** | Congresso |
| **Cor** | Roxo |
| **Problema** | O Congresso quer criminalizar os movimentos sociais. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -20 |
| **Consequência Esquerda** | "A resistência continua." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +15, `Dignidade` -15, `Integridade` -10 |
| **Consequência Direita** | "A luta é criminalizada." |
| **Aprendizado** | Dados: "O MST tem 1,5 milhão de membros." · Frase: "Criminalizar a luta é medo da organização." |

### INST-016 — Licença-paternidade

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Licença-paternidade |
| **Modo** | Congresso |
| **Cor** | Vermelho |
| **Problema** | O Senado quer ampliar a licença-paternidade para 20 dias. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -5, `Integridade` +5 |
| **Consequência Esquerda** | "O cuidado é valorizado." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -5 |
| **Consequência Direita** | "Os pais continuam ausentes." |
| **Aprendizado** | Dados: "O Brasil tem uma das menores licenças-paternidade do mundo (5 dias)." · Frase: "O cuidado é responsabilidade de todos." |

### INST-017 — 10% do PIB em Saúde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | 10% do PIB em saúde |
| **Modo** | Congresso |
| **Cor** | Vermelho |
| **Problema** | A Câmara quer obrigar o governo a gastar 10% do PIB em saúde. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +15, `Caixa` -20, `Capital Político` +10 |
| **Consequência Esquerda** | "O SUS respira." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O SUS continua sucateado." |
| **Aprendizado** | Dados: "O teto de gastos retirou R$ 37 bilhões do SUS." · Frase: "O subfinanciamento é uma escolha política." |

### INST-018 — Anistia aos Crimes da Ditadura

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Anistia aos crimes da ditadura |
| **Modo** | Congresso |
| **Cor** | Roxo |
| **Problema** | O Congresso quer aprovar uma lei que anistia os crimes da ditadura. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +15, `Integridade` +10, `Dignidade` +5, `Capital Político` -20 |
| **Consequência Esquerda** | "A memória é preservada." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A tortura é esquecida." |
| **Aprendizado** | Dados: "A Comissão da Verdade documentou 434 mortes." · Frase: "A memória é a garantia de que não volta." |

### INST-019 — Educação Financeira em Vez de Filosofia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Educação financeira em vez de Filosofia |
| **Modo** | Congresso |
| **Cor** | Roxo |
| **Problema** | O Senado quer obrigar o ensino de 'educação financeira' em vez de Filosofia. |
| **Opção Esquerda** | Mobilizar professores |
| **Efeitos Esquerda** | `Consciência` +15, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A Filosofia é mantida." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -15, `Integridade` -5 |
| **Consequência Direita** | "O pensamento crítico desaparece." |
| **Aprendizado** | Dados: "Substituir Filosofia por educação financeira é formar consumidores." · Frase: "A escola deve formar cidadãos." |

### INST-020 — Redução do Salário Mínimo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Redução do salário mínimo |
| **Modo** | Congresso |
| **Cor** | Vermelho |
| **Problema** | O Congresso quer reduzir o salário mínimo. A população protesta. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Dignidade` +10, `Legitimidade` +10, `Capital Político` -20 |
| **Consequência Esquerda** | "O trabalhador respira." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +15, `Dignidade` -15, `Legitimidade` -10 |
| **Consequência Direita** | "O trabalhador ganha menos." |
| **Aprendizado** | Dados: "O salário mínimo brasileiro é um dos menores do mundo em poder de compra." · Frase: "O trabalhador ganha menos. O patrão lucra mais." |

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

### INST-023 — Teto de Gastos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Teto de gastos |
| **Modo** | Orçamento |
| **Cor** | Amarelo |
| **Problema** | O teto de gastos impede investimentos em saúde. O Congresso quer mantê-lo. |
| **Opção Esquerda** | Propor uma PEC para revogar |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -20, `Integridade` +5 |
| **Consequência Esquerda** | "O teto cai." |
| **Opção Direita** | Manter o teto |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O teto se mantém." |
| **Aprendizado** | Dados: "O teto congela investimentos por 20 anos." · Frase: "O teto é uma escolha política." |

### INST-024 — Emenda para Show

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para show |
| **Modo** | Orçamento |
| **Cor** | Amarelo |
| **Problema** | Uma emenda destina R$ 50 milhões para um show. O hospital está sem remédios. |
| **Opção Esquerda** | Redirecionar para o hospital |
| **Efeitos Esquerda** | `Dignidade` +15, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O hospital recebe." |
| **Opção Direita** | Manter o show |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "O show acontece." |
| **Aprendizado** | Dados: "Cem artistas acumularam R$ 5 bi em cachês pagos por prefeituras." · Frase: "O show acontece. O hospital não." |

### INST-025 — Subsídio para Agronegócio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Subsídio para agronegócio |
| **Modo** | Orçamento |
| **Cor** | Verde |
| **Problema** | O agronegócio pede mais R$ 50 bilhões. A agricultura familiar pede R$ 5 bilhões. |
| **Opção Esquerda** | Priorizar agricultura familiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Caixa` -5, `Integridade` +5 |
| **Consequência Esquerda** | "A comida chega à mesa." |
| **Opção Direita** | Priorizar o agronegócio |
| **Efeitos Direita** | `Caixa` +10, `Soberania` -10, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "O agro exporta." |
| **Aprendizado** | Dados: "Agro: R$ 516 bi. Agricultura familiar: R$ 89 bi." · Frase: "O agro exporta. O povo passa fome." |

### INST-026 — Taxar Grandes Fortunas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxar grandes fortunas |
| **Modo** | Orçamento |
| **Cor** | Amarelo |
| **Problema** | O governo precisa aumentar impostos. Os ricos ameaçam fugir. |
| **Opção Esquerda** | Taxar grandes fortunas |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` +20, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O rico paga." |
| **Opção Direita** | Taxar o consumo |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O pobre paga." |
| **Aprendizado** | Dados: "O Brasil é um dos países que menos taxa heranças." · Frase: "O pobre paga mais." |

### INST-027 — Corte na Educação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte na educação |
| **Modo** | Orçamento |
| **Cor** | Roxo |
| **Problema** | A educação perdeu 30% do orçamento. As universidades estão sucateadas. |
| **Opção Esquerda** | Recompor o orçamento |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A educação respira." |
| **Opção Direita** | Manter o corte |
| **Efeitos Direita** | `Caixa` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A educação definha." |
| **Aprendizado** | Dados: "A PEC 09/2023 reduziu de 30% para 25% o investimento em educação." · Frase: "A educação é a única arma." |

### INST-028 — Corte na Cultura

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte na cultura |
| **Modo** | Orçamento |
| **Cor** | Roxo |
| **Problema** | O Ministério da Cultura quer R$ 10 bilhões. A bancada evangélica quer cortar. |
| **Opção Esquerda** | Apoiar a cultura |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A arte resiste." |
| **Opção Direita** | Cortar |
| **Efeitos Direita** | `Caixa` +10, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A cultura definha." |
| **Aprendizado** | Dados: "Gusttavo Lima recebeu R$ 52 mi via Lei Rouanet." · Frase: "A cultura é uma ferramenta de resistência." |

### INST-029 — Ampliação do Bolsa Família

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ampliação do Bolsa Família |
| **Modo** | Orçamento |
| **Cor** | Vermelho |
| **Problema** | O programa precisa ser ampliado. O Congresso resiste. |
| **Opção Esquerda** | Ampliar |
| **Efeitos Esquerda** | `Dignidade` +15, `Legitimidade` +10, `Caixa` -20, `Integridade` +5 |
| **Consequência Esquerda** | "A fome recua." |
| **Opção Direita** | Manter o valor |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A fome volta." |
| **Aprendizado** | Dados: "Em 2022, 33 milhões passaram fome." · Frase: "A fome é uma escolha política." |

### INST-030 — Verba para o SUS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Verba para o SUS |
| **Modo** | Orçamento |
| **Cor** | Vermelho |
| **Problema** | O SUS precisa de R$ 50 bilhões para reduzir filas. O teto impede. |
| **Opção Esquerda** | Furar o teto |
| **Efeitos Esquerda** | `Dignidade` +15, `Capital Político` -20, `Integridade` +5 |
| **Consequência Esquerda** | "As filas diminuem." |
| **Opção Direita** | Respeitar o teto |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "As filas crescem." |
| **Aprendizado** | Dados: "Expectativa de vida caiu de 76,2 para 72,8." · Frase: "O SUS precisa de financiamento." |

### INST-031 — Trem-bala

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Trem-bala |
| **Modo** | Orçamento |
| **Cor** | Amarelo |
| **Problema** | O governo quer construir um trem-bala. O custo é de R$ 100 bilhões. |
| **Opção Esquerda** | Investir em transporte nas periferias |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` -20, `Integridade` +5 |
| **Consequência Esquerda** | "O ônibus melhora." |
| **Opção Direita** | Construir o trem-bala |
| **Efeitos Direita** | `Caixa` -30, `Soberania` +5, `Integridade` -5 |
| **Consequência Direita** | "O trem nunca fica pronto." |
| **Aprendizado** | Dados: "O trem-bala nunca saiu do papel." · Frase: "O ônibus continua lotado." |

### INST-032 — Cisternas no Nordeste

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cisternas no Nordeste |
| **Modo** | Orçamento |
| **Cor** | Vermelho |
| **Problema** | Uma seca histórica atinge o Nordeste. O governo precisa agir. |
| **Opção Esquerda** | Criar programa de cisternas |
| **Efeitos Esquerda** | `Dignidade` +15, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A água chega." |
| **Opção Direita** | Enviar carros-pipa |
| **Efeitos Direita** | `Dignidade` +5, `Caixa` -10, `Integridade` -5 |
| **Consequência Direita** | "O paliativo continua." |
| **Aprendizado** | Dados: "Cisternas são solução estruturante." · Frase: "A seca é uma questão política." |

### INST-033 — Corte no Salário Mínimo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte no salário mínimo |
| **Modo** | Orçamento |
| **Cor** | Vermelho |
| **Problema** | O Congresso quer cortar o salário mínimo. O povo protesta. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Dignidade` +10, `Legitimidade` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O trabalhador respira." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "O trabalhador ganha menos." |
| **Aprendizado** | Dados: "Salário mínimo é conquista histórica." · Frase: "O trabalhador ganha menos." |

### INST-034 — Pagamento da Dívida

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pagamento da dívida |
| **Modo** | Orçamento |
| **Cor** | Amarelo |
| **Problema** | O governo precisa pagar a dívida pública. O dinheiro acaba. |
| **Opção Esquerda** | Renegociar |
| **Efeitos Esquerda** | `Soberania` +10, `Caixa` +20, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O governo respira." |
| **Opção Direita** | Pagar |
| **Efeitos Direita** | `Caixa` -20, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "Os banqueiros comemoram." |
| **Aprendizado** | Dados: "R$ 1,2 tri em juros por ano." · Frase: "Os banqueiros comemoram. O povo chora." |

### INST-035 — CAPS e Saúde Mental

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | CAPS e saúde mental |
| **Modo** | Orçamento |
| **Cor** | Vermelho |
| **Problema** | A saúde mental no SUS está sucateada. Os CAPS fecham. |
| **Opção Esquerda** | Investir nos CAPS |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A luta antimanicomial avança." |
| **Opção Direita** | Abrir comunidades terapêuticas |
| **Efeitos Direita** | `Caixa` -5, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "O retrocesso se instala." |
| **Aprendizado** | Dados: "A Lei 10.216/2001 redirecionou o modelo de cuidado." · Frase: "A saúde mental é uma questão política." |

### INST-036 — Construção de Presídios

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Construção de presídios |
| **Modo** | Orçamento |
| **Cor** | Vermelho |
| **Problema** | O governo quer construir mais presídios. O custo é de R$ 20 bilhões. |
| **Opção Esquerda** | Investir em prevenção |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A raiz é atacada." |
| **Opção Direita** | Construir presídios |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -10, `Caixa` -20, `Integridade` -5 |
| **Consequência Direita** | "Mais facções." |
| **Aprendizado** | Dados: "O Brasil é o 3º país que mais encarcera." · Frase: "Mais presídios, mais facções." |

### INST-037 — Creches

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Creches |
| **Modo** | Orçamento |
| **Cor** | Vermelho |
| **Problema** | A educação infantil está sem vagas. As mães não podem trabalhar. |
| **Opção Esquerda** | Construir creches |
| **Efeitos Esquerda** | `Dignidade` +15, `Caixa` -20, `Integridade` +5 |
| **Consequência Esquerda** | "As mães trabalham." |
| **Opção Direita** | Dar voucher para creches privadas |
| **Efeitos Direita** | `Caixa` -10, `Dignidade` +5, `Integridade` -5 |
| **Consequência Direita** | "As mães pobres continuam sem creche." |
| **Aprendizado** | Dados: "A educação infantil é a base da formação cidadã." · Frase: "As mães pobres continuam sem creche." |

### INST-038 — Corte na Cultura (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte na cultura (2) |
| **Modo** | Orçamento |
| **Cor** | Roxo |
| **Problema** | O governo precisa cortar gastos. A cultura é a primeira da lista. |
| **Opção Esquerda** | Proteger a cultura |
| **Efeitos Esquerda** | `Consciência` +10, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A arte resiste." |
| **Opção Direita** | Cortar |
| **Efeitos Direita** | `Caixa` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A arte é silenciada." |
| **Aprendizado** | Dados: "A arte é uma arma do povo." · Frase: "A arte é uma arma. E não vamos entregar." |

### INST-039 — Verba para Cisternas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Verba para cisternas |
| **Modo** | Orçamento |
| **Cor** | Vermelho |
| **Problema** | O programa de cisternas precisa de mais verba. O Congresso resiste. |
| **Opção Esquerda** | Mobilizar a bancada do Nordeste |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A água chega." |
| **Opção Direita** | Deixar como está |
| **Efeitos Direita** | `Dignidade` -5, `Caixa` +5, `Integridade` -5 |
| **Consequência Direita** | "A seca continua." |
| **Aprendizado** | Dados: "O semiárido precisa de políticas estruturantes." · Frase: "A seca continua." |

### INST-040 — Taxar Grandes Heranças

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxar grandes heranças |
| **Modo** | Orçamento |
| **Cor** | Amarelo |
| **Problema** | O governo quer taxar as grandes heranças. Os ricos reagem. |
| **Opção Esquerda** | Taxar |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` +20, `Capital Político` -20, `Integridade` +5 |
| **Consequência Esquerda** | "A desigualdade recua." |
| **Opção Direita** | Não taxar |
| **Efeitos Direita** | `Caixa` -10, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "A desigualdade se perpetua." |
| **Aprendizado** | Dados: "O Brasil é um dos países que menos taxa heranças." · Frase: "A desigualdade se perpetua." |

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

### INST-043 — Educação Sexual

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Educação sexual |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O MEC quer incluir educação sexual no currículo. A bancada evangélica reage. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A prevenção avança." |
| **Opção Direita** | Retirar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A gravidez na adolescência aumenta." |
| **Aprendizado** | Dados: "O Brasil tem uma das maiores taxas de gravidez na adolescência." · Frase: "A educação sexual previne." |

### INST-044 — Fake News em Emissora

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fake news em emissora |
| **Modo** | Currículo e Mídia |
| **Cor** | Preto |
| **Problema** | Uma emissora é acusada de fake news. O governo pode revogar a concessão. |
| **Opção Esquerda** | Revogar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -20 |
| **Consequência Esquerda** | "A mentira recua." |
| **Opção Direita** | Manter |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A mentira continua." |
| **Aprendizado** | Dados: "554 vídeos deepfake nas eleições de 2026." · Frase: "A mentira repetida vira verdade." |

### INST-045 — Proibição de "Ideologia de Gênero"

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Proibição de "ideologia de gênero" |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O Congresso quer proibir o ensino de 'ideologia de gênero'. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -15, `Integridade` +10 |
| **Consequência Esquerda** | "A diversidade é respeitada." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A diversidade é silenciada." |
| **Aprendizado** | Dados: "'Ideologia de gênero' é uma invenção." · Frase: "A diversidade é um direito." |

### INST-046 — Privatização da TV Pública

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Privatização da TV pública |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | A TV pública está sucateada. O governo quer privatizá-la. |
| **Opção Esquerda** | Investir |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Caixa` -10 |
| **Consequência Esquerda** | "A TV pública respira." |
| **Opção Direita** | Privatizar |
| **Efeitos Direita** | `Caixa` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A TV pública desaparece." |
| **Aprendizado** | Dados: "A TV pública é um espaço de diversidade." · Frase: "A comunicação é um direito." |

### INST-047 — Método Paulo Freire

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Método Paulo Freire |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | Uma escola quer adotar o método Paulo Freire. A bancada evangélica reage. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +15, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A pedagogia libertadora avança." |
| **Opção Direita** | Proibir |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -15, `Integridade` -5 |
| **Consequência Direita** | "A pedagogia é silenciada." |
| **Aprendizado** | Dados: "Freire é o patrono da educação brasileira." · Frase: "Educação muda pessoas. Pessoas mudam o mundo." |

### INST-048 — TV Comunitária

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | TV comunitária |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O governo quer criar um canal de TV comunitária. A Globo reage. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Consciência` +10, `Soberania` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A voz da comunidade é ouvida." |
| **Opção Direita** | Desistir |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A comunidade fica sem voz." |
| **Aprendizado** | Dados: "A TV comunitária é um espaço de resistência." · Frase: "A voz da comunidade não é ouvida." |

### INST-049 — Educação Financeira em Vez de Sociologia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Educação financeira em vez de Sociologia |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O Congresso quer obrigar o ensino de 'educação financeira' em vez de Sociologia. |
| **Opção Esquerda** | Mobilizar professores |
| **Efeitos Esquerda** | `Consciência` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A Sociologia resiste." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "O pensamento crítico desaparece." |
| **Aprendizado** | Dados: "Sociologia ensina a questionar." · Frase: "A escola deve formar cidadãos." |

### INST-050 — Influenciadora Dando Aula de Cidadania

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Influenciadora dando aula de cidadania |
| **Modo** | Currículo e Mídia |
| **Cor** | Preto |
| **Problema** | Uma influenciadora digital é contratada para dar aula de 'cidadania'. |
| **Opção Esquerda** | Contratar professores |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Caixa` -5 |
| **Consequência Esquerda** | "A cidadania é ensinada." |
| **Opção Direita** | Manter a influenciadora |
| **Efeitos Direita** | `Consciência` -10, `Capital Político` +5, `Integridade` -10 |
| **Consequência Direita** | "A educação vira entretenimento." |
| **Aprendizado** | Dados: "Cidadania não se aprende com influenciador." · Frase: "A cidadania é uma prática." |

### INST-051 — Censura a Documentário

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Censura a documentário |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O governo quer censurar um documentário sobre a ditadura. |
| **Opção Esquerda** | Liberar |
| **Efeitos Esquerda** | `Consciência` +15, `Integridade` +10, `Capital Político` -10 |
| **Consequência Esquerda** | "A memória é preservada." |
| **Opção Direita** | Censurar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -15, `Integridade` -15 |
| **Consequência Direita** | "A memória é apagada." |
| **Aprendizado** | Dados: "A Comissão da Verdade documentou 434 mortes." · Frase: "A memória é a garantia de que não volta." |

### INST-052 — Globo Critica o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Globo critica o governo |
| **Modo** | Currículo e Mídia |
| **Cor** | Amarelo |
| **Problema** | A Globo veicula uma reportagem crítica ao governo. O presidente quer revidar. |
| **Opção Esquerda** | Dialogar |
| **Efeitos Esquerda** | `Consciência` +5, `Integridade` +5, `Capital Político` -5 |
| **Consequência Esquerda** | "O diálogo continua." |
| **Opção Direita** | Revidar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A guerra da mídia começa." |
| **Aprendizado** | Dados: "A Globo nasceu do golpe de 64." · Frase: "Quem controla a narrativa controla o voto." |

### INST-053 — Proibição de História Afro-Brasileira

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Proibição de História Afro-Brasileira |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O Congresso quer proibir o ensino de História Afro-Brasileira. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A história é preservada." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "O racismo estrutural é invisibilizado." |
| **Aprendizado** | Dados: "O ensino da cultura afro-brasileira é lei desde 2003." · Frase: "O racismo estrutural é invisibilizado." |

### INST-054 — Derrubada de Perfil de Jornalista

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Derrubada de perfil de jornalista |
| **Modo** | Currículo e Mídia |
| **Cor** | Preto |
| **Problema** | Uma rede social derruba o perfil de um jornalista independente. |
| **Opção Esquerda** | Intervir |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -10 |
| **Consequência Esquerda** | "A censura privada recua." |
| **Opção Direita** | Não intervir |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A censura privada continua." |
| **Aprendizado** | Dados: "A FENAJ denunciou censura privada da Meta." · Frase: "A censura é a arma dos que não têm argumentos." |

### INST-055 — Darcy Ribeiro e Paulo Freire no Currículo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Darcy Ribeiro e Paulo Freire no currículo |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O MEC quer incluir Darcy Ribeiro e Paulo Freire no currículo. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +15, `Integridade` +5, `Capital Político` -15 |
| **Consequência Esquerda** | "A pedagogia libertadora avança." |
| **Opção Direita** | Retirar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -15, `Integridade` -5 |
| **Consequência Direita** | "A pedagogia é esquecida." |
| **Aprendizado** | Dados: "Freire é patrono da educação." · Frase: "A educação é a única arma." |

### INST-056 — Educação para a Cidadania

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Educação para a Cidadania |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O governo quer criar uma disciplina de 'Educação para a Cidadania'. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Integridade` +5 |
| **Consequência Esquerda** | "A cidadania avança." |
| **Opção Direita** | Substituir por 'Educação Moral' |
| **Efeitos Direita** | `Consciência` -10, `Capital Político` +5, `Integridade` -10 |
| **Consequência Direita** | "A cidadania vira moralismo." |
| **Aprendizado** | Dados: "Cidadania é sobre direitos." · Frase: "A cidadania não é um status." |

### INST-057 — Emissora Acusada de Racismo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emissora acusada de racismo |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | Uma emissora é acusada de racismo. O governo pode punir. |
| **Opção Esquerda** | Punir |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A justiça é feita." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "O racismo continua." |
| **Aprendizado** | Dados: "O racismo na TV é estrutural." · Frase: "O racismo na TV continua." |

### INST-058 — Proibição de Linguagem Neutra

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Proibição de linguagem neutra |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O Congresso quer proibir o uso de linguagem neutra nas escolas. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A diversidade linguística resiste." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A diversidade é silenciada." |
| **Aprendizado** | Dados: "A língua é viva." · Frase: "A diversidade linguística é silenciada." |

### INST-059 — Programa de Leitura nas Periferias

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Programa de leitura nas periferias |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | O governo quer criar um programa de leitura nas periferias. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A leitura chega." |
| **Opção Direita** | Não criar |
| **Efeitos Direita** | `Caixa` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A periferia continua sem livros." |
| **Aprendizado** | Frase: "A leitura é uma ferramenta de libertação." |

### INST-060 — Debate Político em Sala

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Debate político em sala |
| **Modo** | Currículo e Mídia |
| **Cor** | Roxo |
| **Problema** | Uma escola quer debater política em sala. A direção proíbe. |
| **Opção Esquerda** | Apoiar o debate |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -5 |
| **Consequência Esquerda** | "A política é debatida." |
| **Opção Direita** | Apoiar a proibição |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A política vira tabu." |
| **Aprendizado** | Dados: "A liberdade de cátedra é constitucional." · Frase: "A política vira tabu." |

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

### INST-063 — Pressão dos EUA

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pressão dos EUA |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | Os EUA pressionam o Brasil a condenar a China. O governo resiste. |
| **Opção Esquerda** | Manter neutralidade |
| **Efeitos Esquerda** | `Soberania` +10, `Integridade` +5 |
| **Consequência Esquerda** | "A neutralidade é mantida." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A subordinação avança." |
| **Aprendizado** | Dados: "A neutralidade é uma escolha soberana." · Frase: "A subserviência não é diplomacia." |

### INST-064 — Acordo com a China

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Acordo com a China |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | A China oferece um acordo comercial sem exigências políticas. |
| **Opção Esquerda** | Aceitar |
| **Efeitos Esquerda** | `Caixa` +15, `Soberania` +5, `Integridade` +5 |
| **Consequência Esquerda** | "O acordo é fechado." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Soberania` -10, `Caixa` -10, `Integridade` -5 |
| **Consequência Direita** | "O Brasil perde oportunidade." |
| **Aprendizado** | Dados: "A China absorve 40% das exportações brasileiras." · Frase: "A soberania é decidir com quem negociar." |

### INST-065 — Empréstimo do FMI

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Empréstimo do FMI |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | O FMI oferece um empréstimo com condições de ajuste fiscal. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Soberania` +10, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O Brasil mantém autonomia." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` +20, `Soberania` -15, `Integridade` -10 |
| **Consequência Direita** | "O FMI impõe cortes." |
| **Aprendizado** | Dados: "O FMI impõe cortes na saúde e educação." · Frase: "O FMI impõe cortes." |

### INST-066 — Venda da Embraer

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Venda da Embraer |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | Uma empresa americana quer comprar a Embraer. O governo pode vetar. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Soberania` +15, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A tecnologia fica." |
| **Opção Direita** | Permitir |
| **Efeitos Direita** | `Caixa` +20, `Soberania` -15, `Integridade` -10 |
| **Consequência Direita** | "A tecnologia vai embora." |
| **Aprendizado** | Dados: "A Embraer é estratégica." · Frase: "A tecnologia brasileira vai para os EUA." |

### INST-067 — Moeda Comum do BRICS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Moeda comum do BRICS |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | O BRICS quer criar uma moeda comum. Os EUA ameaçam sanções. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Soberania` +15, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A moeda avança." |
| **Opção Direita** | Recuar |
| **Efeitos Direita** | `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "O dólar continua." |
| **Aprendizado** | Dados: "A moeda comum é uma ameaça ao dólar." · Frase: "A desdolarização avança." |

### INST-068 — Envio de Tropas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Envio de tropas |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | Os EUA pedem que o Brasil envie tropas para um conflito. O governo resiste. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Soberania` +10, `Integridade` +5 |
| **Consequência Esquerda** | "O Brasil não se envolve." |
| **Opção Direita** | Enviar |
| **Efeitos Direita** | `Soberania` -15, `Integridade` -10 |
| **Consequência Direita** | "O Brasil entra em guerra alheia." |
| **Aprendizado** | Dados: "O Brasil não deve se envolver em guerras alheias." · Frase: "O Brasil entra em guerra alheia." |

### INST-069 — Corte de Fertilizantes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte de fertilizantes |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | A Rússia ameaça cortar o fornecimento de fertilizantes. |
| **Opção Esquerda** | Diversificar fornecedores |
| **Efeitos Esquerda** | `Soberania` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A dependência recua." |
| **Opção Direita** | Ceder à pressão |
| **Efeitos Direita** | `Caixa` +10, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A dependência se aprofunda." |
| **Aprendizado** | Dados: "O Brasil importa 85% dos fertilizantes." · Frase: "A dependência é uma armadilha." |

### INST-070 — Preço do Petróleo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Preço do petróleo |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | A OPEP quer aumentar o preço do petróleo. O Brasil pode alinhar-se ou não. |
| **Opção Esquerda** | Manter preço interno |
| **Efeitos Esquerda** | `Dignidade` +5, `Caixa` -5, `Integridade` +5 |
| **Consequência Esquerda** | "O povo respira." |
| **Opção Direita** | Alinhar-se |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A gasolina sobe." |
| **Aprendizado** | Dados: "O preço do petróleo afeta a inflação." · Frase: "A gasolina sobe." |

### INST-071 — Taxação das Big Techs

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxação das big techs |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | O governo quer taxar as big techs. Os EUA ameaçam retaliar. |
| **Opção Esquerda** | Taxar |
| **Efeitos Esquerda** | `Soberania` +10, `Caixa` +15, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A soberania digital avança." |
| **Opção Direita** | Não taxar |
| **Efeitos Direita** | `Soberania` -5, `Caixa` -10, `Integridade` -5 |
| **Consequência Direita** | "As big techs lucram." |
| **Aprendizado** | Dados: "As big techs lucram no Brasil e pagam pouco imposto." · Frase: "As big techs lucram. O Brasil não." |

### INST-072 — Moeda Comum do Mercosul

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Moeda comum do Mercosul |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | A Argentina propõe uma moeda comum do Mercosul. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Soberania` +5, `Caixa` -5, `Integridade` +5 |
| **Consequência Esquerda** | "A integração avança." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Soberania` -5, `Integridade` -5 |
| **Consequência Direita** | "A integração recua." |
| **Aprendizado** | Dados: "A integração regional é resistência." · Frase: "A integração regional avança." |

### INST-073 — Compra de Terras por China

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Compra de terras por China |
| **Modo** | Geopolítico |
| **Cor** | Verde |
| **Problema** | A China quer comprar terras brasileiras para produção de soja. |
| **Opção Esquerda** | Limitar a compra |
| **Efeitos Esquerda** | `Soberania` +10, `Capital Político` -5, `Integridade` +5 |
| **Consequência Esquerda** | "A soberania alimentar é preservada." |
| **Opção Direita** | Permitir |
| **Efeitos Direita** | `Caixa` +15, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A terra é vendida." |
| **Aprendizado** | Frase: "A soberania alimentar é ameaçada." |

### INST-074 — Ajuda Militar dos EUA

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ajuda militar dos EUA |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | Os EUA oferecem ajuda militar para combater o crime organizado. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Soberania` +10, `Integridade` +5 |
| **Consequência Esquerda** | "A soberania é preservada." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Segurança` +5, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A ingerência avança." |
| **Aprendizado** | Dados: "A ajuda militar é ingerência." · Frase: "A soberania é entregue por migalhas." |

### INST-075 — Adesão à OCDE

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Adesão à OCDE |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | O Brasil pode aderir à OCDE. Os EUA pressionam. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Soberania` +10, `Integridade` +5 |
| **Consequência Esquerda** | "O Brasil mantém autonomia." |
| **Opção Direita** | Aderir |
| **Efeitos Direita** | `Aliança Externa` +10, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "O Brasil se alinha." |
| **Aprendizado** | Dados: "A OCDE é o clube dos países ricos." · Frase: "O Brasil se alinha ao Ocidente." |

### INST-076 — Acesso a Vacinas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Acesso a vacinas |
| **Modo** | Geopolítico |
| **Cor** | Vermelho |
| **Problema** | A OMS quer acesso universal a vacinas. O Brasil pode liderar. |
| **Opção Esquerda** | Liderar |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Integridade` +5 |
| **Consequência Esquerda** | "A saúde é prioridade." |
| **Opção Direita** | Seguir os EUA |
| **Efeitos Direita** | `Soberania` -5, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "A saúde vira mercadoria." |
| **Aprendizado** | Dados: "A OMS busca universalizar o acesso." · Frase: "A saúde vira mercadoria." |

### INST-077 — Base Militar na Amazônia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Base militar na Amazônia |
| **Modo** | Geopolítico |
| **Cor** | Verde |
| **Problema** | Uma potência estrangeira quer instalar uma base militar na Amazônia. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Soberania` +15, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A Amazônia é protegida." |
| **Opção Direita** | Permitir |
| **Efeitos Direita** | `Soberania` -20, `Integridade` -10 |
| **Consequência Direita** | "A Amazônia é entregue." |
| **Aprendizado** | Dados: "A Amazônia é o maior patrimônio do Brasil." · Frase: "A Amazônia é entregue." |

### INST-078 — Banco do BRICS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Banco do BRICS |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | O BRICS quer criar um banco de desenvolvimento. O Brasil pode sediar. |
| **Opção Esquerda** | Sediar |
| **Efeitos Esquerda** | `Soberania` +10, `Caixa` -5, `Integridade` +5 |
| **Consequência Esquerda** | "O banco é criado." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Soberania` -5, `Integridade` -5 |
| **Consequência Direita** | "O banco vai para outro país." |
| **Aprendizado** | Dados: "O Banco do BRICS é alternativa ao FMI." · Frase: "O banco é criado. O Brasil lidera." |

### INST-079 — Extradição de Cidadão

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Extradição de cidadão |
| **Modo** | Geopolítico |
| **Cor** | Azul |
| **Problema** | Os EUA querem extraditar um cidadão brasileiro. O governo pode resistir. |
| **Opção Esquerda** | Resistir |
| **Efeitos Esquerda** | `Soberania` +10, `Integridade` +5 |
| **Consequência Esquerda** | "A justiça brasileira prevalece." |
| **Opção Direita** | Extraditar |
| **Efeitos Direita** | `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A justiça é submetida." |
| **Aprendizado** | Dados: "A extradição é uma questão de soberania." · Frase: "A justiça brasileira é submetida." |

### INST-080 — Recebimento de Refugiados

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Recebimento de refugiados |
| **Modo** | Geopolítico |
| **Cor** | Vermelho |
| **Problema** | A ONU pede que o Brasil receba refugiados. A oposição reage. |
| **Opção Esquerda** | Receber |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Integridade` +5 |
| **Consequência Esquerda** | "O Brasil acolhe." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Soberania` -5, `Integridade` -5 |
| **Consequência Direita** | "O Brasil fecha as portas." |
| **Aprendizado** | Dados: "O Brasil sempre recebeu refugiados." · Frase: "O Brasil fecha as portas." |

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

### INST-083 — Descriminalização da Maconha

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Descriminalização da maconha |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O governo quer descriminalizar o porte de maconha. A bancada da bala reage. |
| **Opção Esquerda** | Descriminalizar |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A guerra às drogas recua." |
| **Opção Direita** | Manter |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "Mais jovens presos." |
| **Aprendizado** | Frase: "A guerra às drogas é uma guerra contra os pobres." |

### INST-084 — Operação Policial Letal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Operação policial letal |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | Uma operação policial em uma favela matou 10 pessoas. |
| **Opção Esquerda** | Investigar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A verdade aparece." |
| **Opção Direita** | Elogiar a operação |
| **Efeitos Direita** | `Segurança` +5, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "A chacina é esquecida." |
| **Aprendizado** | Dados: "A imprensa minimiza as chacinas." · Frase: "A chacina é esquecida." |

### INST-085 — Câmeras em Uniformes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Câmeras em uniformes |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O governo quer instalar câmeras nos uniformes policiais. A corporação resiste. |
| **Opção Esquerda** | Instalar |
| **Efeitos Esquerda** | `Dignidade` +5, `Segurança` +5, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A violência cai." |
| **Opção Direita** | Recuar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "A violência continua." |
| **Aprendizado** | Dados: "As câmeras reduzem a violência policial." · Frase: "A violência policial continua sem prova." |

### INST-086 — Facção Controla Transporte

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Facção controla transporte |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | Uma facção criminosa controla o transporte público de uma cidade. |
| **Opção Esquerda** | Investir em transporte público |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O Estado volta." |
| **Opção Direita** | Intervir militarmente |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A cidade vira zona de guerra." |
| **Aprendizado** | Dados: "O crime organizado ocupa o vácuo do Estado." · Frase: "A cidade vira zona de guerra." |

### INST-087 — Redução da Maioridade Penal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Redução da maioridade penal |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O governo quer reduzir a maioridade penal. Especialistas discordam. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +5, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "Os jovens não são presos." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "Mais adolescentes presos." |
| **Aprendizado** | Dados: "A redução não reduz a violência." · Frase: "Mais adolescentes presos." |

### INST-088 — Separação de Presos por Facção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Separação de presos por facção |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O sistema prisional é um celeiro de facções. |
| **Opção Esquerda** | Investir em ressocialização |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A ressocialização avança." |
| **Opção Direita** | Isolar líderes |
| **Efeitos Direita** | `Segurança` +5, `Soberania` -5, `Integridade` -5 |
| **Consequência Direita** | "As facções se reorganizam." |
| **Aprendizado** | Frase: "As facções se reorganizam." |

### INST-089 — Polícia Invade Escola

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Polícia invade escola |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | A polícia invadiu uma escola na periferia. Não havia traficantes. |
| **Opção Esquerda** | Investigar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A verdade aparece." |
| **Opção Direita** | Justificar |
| **Efeitos Direita** | `Segurança` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A comunidade fica com mais medo." |
| **Aprendizado** | Dados: "A polícia trata a periferia como zona de guerra." · Frase: "A comunidade fica com mais medo." |

### INST-090 — Redução de Danos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Redução de danos |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O governo quer criar um programa de redução de danos. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "As vidas são salvas." |
| **Opção Direita** | Proibir |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "As mortes aumentam." |
| **Aprendizado** | Dados: "A redução de danos salva vidas." · Frase: "As mortes por overdose aumentam." |

### INST-091 — Líder Comunitário Preso

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Líder comunitário preso |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | A polícia prendeu um líder comunitário sem provas. |
| **Opção Esquerda** | Soltar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A liderança resiste." |
| **Opção Direita** | Manter preso |
| **Efeitos Direita** | `Segurança` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A liderança é criminalizada." |
| **Aprendizado** | Dados: "A criminalização da liderança é estratégia de controle." · Frase: "A liderança é criminalizada." |

### INST-092 — Fim das Saidinhas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fim das saidinhas |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O governo quer acabar com as 'saidinhas' dos presos. |
| **Opção Esquerda** | Manter |
| **Efeitos Esquerda** | `Dignidade` +5, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O vínculo familiar é mantido." |
| **Opção Direita** | Acabar |
| **Efeitos Direita** | `Segurança` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A ressocialização recua." |
| **Aprendizado** | Dados: "As saidinhas mantêm o vínculo familiar." · Frase: "O preso perde o contato com a família." |

### INST-093 — Chacina Policial

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Chacina policial |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | Uma chacina policial no Rio matou 121 pessoas. |
| **Opção Esquerda** | Investigar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Integridade` +5, `Capital Político` -15 |
| **Consequência Esquerda** | "A verdade aparece." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "A maior chacina é esquecida." |
| **Aprendizado** | Dados: "A Operação Contenção matou 121 pessoas." · Frase: "A maior chacina é esquecida." |

### INST-094 — Taxação de Armas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxação de armas |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O governo quer taxar as armas para reduzir a violência. |
| **Opção Esquerda** | Taxar |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "Menos armas." |
| **Opção Direita** | Não taxar |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "Mais armas." |
| **Aprendizado** | Dados: "Mais armas significam mais mortes." · Frase: "Mais armas nas ruas." |

### INST-095 — Policial Vende Armas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Policial vende armas |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | Um policial é flagrado vendendo armas para facções. |
| **Opção Esquerda** | Punir |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A corrupção é combatida." |
| **Opção Direita** | Proteger |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -10 |
| **Consequência Direita** | "A corrupção é blindada." |
| **Aprendizado** | Frase: "A corrupção policial é blindada." |

### INST-096 — Proteção a Testemunhas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Proteção a testemunhas |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O governo quer criar um programa de proteção a testemunhas. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Segurança` +5, `Dignidade` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "As testemunhas são protegidas." |
| **Opção Direita** | Não criar |
| **Efeitos Direita** | `Caixa` +5, `Segurança` -5, `Integridade` -5 |
| **Consequência Direita** | "As testemunhas são mortas." |
| **Aprendizado** | Frase: "As testemunhas são mortas." |

### INST-097 — PF Investiga Governador

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | PF investiga governador |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | A PF quer investigar um governador aliado. O governo pressiona. |
| **Opção Esquerda** | Deixar investigar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -15 |
| **Consequência Esquerda** | "A justiça é feita." |
| **Opção Direita** | Interferir |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -15, `Integridade` -15 |
| **Consequência Direita** | "A impunidade continua." |
| **Aprendizado** | Dados: "A PF é autônoma." · Frase: "A corrupção é blindada." |

### INST-098 — Sistema Prisional Feminino

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Sistema prisional feminino |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O sistema prisional feminino está abandonado. |
| **Opção Esquerda** | Investir |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` -5, `Integridade` +5 |
| **Consequência Esquerda** | "A dignidade é preservada." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A dignidade é negada." |
| **Aprendizado** | Dados: "A dignidade menstrual é um direito." · Frase: "A dignidade menstrual é negada." |

### INST-099 — Desmilitarização da Polícia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Desmilitarização da polícia |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | O governo quer desmilitarizar a polícia. A corporação resiste. |
| **Opção Esquerda** | Desmilitarizar |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Capital Político` -20, `Integridade` +5 |
| **Consequência Esquerda** | "A polícia se democratiza." |
| **Opção Direita** | Manter |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A polícia continua exército." |
| **Aprendizado** | Dados: "A polícia militar é herdeira da ditadura." · Frase: "A polícia continua sendo exército." |

### INST-100 — População Carcerária Negra

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | População carcerária negra |
| **Modo** | Prisional e Policial |
| **Cor** | Preto |
| **Problema** | Uma pesquisa mostra que 69% da população carcerária é negra. |
| **Opção Esquerda** | Criar cotas |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O racismo é enfrentado." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O racismo estrutural continua." |
| **Aprendizado** | Dados: "69% da população carcerária é negra." · Frase: "O racismo estrutural continua." |

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

### INST-102 — Emenda para Obra Faraônica

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para obra faraônica |
| **Modo** | Emendas |
| **Cor** | Amarelo |
| **Problema** | Um senador pede verbas para uma obra em sua cidade. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Capital Político` -5, `Dignidade` +5, `Integridade` +5 |
| **Consequência Esquerda** | "A obra não sai." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -30, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "A obra faraônica sai." |
| **Aprendizado** | Dados: "O cidadão pode fiscalizar pelo Orçamento Aberto." · Frase: "A obra faraônica sai." |

### INST-103 — Emenda para Templo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para templo |
| **Modo** | Emendas |
| **Cor** | Preto |
| **Problema** | A bancada evangélica pede verbas para templos. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O Estado é laico." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -20, `Capital Político` +15, `Integridade` -5 |
| **Consequência Direita** | "O Estado financia a fé." |
| **Aprendizado** | Dados: "O Estado é laico." · Frase: "O Estado financia a fé." |

### INST-104 — Emenda em Troca de Voto

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda em troca de voto |
| **Modo** | Emendas |
| **Cor** | Amarelo |
| **Problema** | Um deputado ameaça votar contra o governo se não receber emendas. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Capital Político` -10, `Consciência` +5, `Integridade` +5 |
| **Consequência Esquerda** | "O voto não é comprado." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -30, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O voto é comprado." |
| **Aprendizado** | Dados: "O presidencialismo de coalizão é isso." · Frase: "O voto é comprado." |

### INST-105 — Emenda para Armas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para armas |
| **Modo** | Emendas |
| **Cor** | Vermelho |
| **Problema** | A bancada da bala pede verbas para comprar armas para a polícia. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "Menos armas." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -20, `Segurança` +5, `Integridade` -5 |
| **Consequência Direita** | "Mais violência." |
| **Aprendizado** | Frase: "Mais armas. Mais violência." |

### INST-106 — Emenda para Reforma Agrária

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para reforma agrária |
| **Modo** | Emendas |
| **Cor** | Roxo |
| **Problema** | Um senador pede emendas para sua base em troca de apoiar a reforma agrária. |
| **Opção Esquerda** | Ceder |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` -20, `Capital Político` +10, `Integridade` +5 |
| **Consequência Esquerda** | "A reforma avança." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Capital Político` -10, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "A reforma para." |
| **Aprendizado** | Frase: "A reforma agrária avança." |

### INST-107 — Emenda para Bets

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para bets |
| **Modo** | Emendas |
| **Cor** | Preto |
| **Problema** | A bancada das bets pede que o governo não taxe as apostas. |
| **Opção Esquerda** | Taxar |
| **Efeitos Esquerda** | `Caixa` +15, `Consciência` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "As bets pagam." |
| **Opção Direita** | Não taxar |
| **Efeitos Direita** | `Capital Político` +10, `Caixa` -10, `Integridade` -5 |
| **Consequência Direita** | "As bets lucram." |
| **Aprendizado** | Frase: "As bets lucram. O povo perde." |

### INST-108 — Emenda para Escola

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para escola |
| **Modo** | Emendas |
| **Cor** | Amarelo |
| **Problema** | Um deputado pede emendas para uma escola em sua cidade. |
| **Opção Esquerda** | Ceder |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A escola é construída." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Capital Político` -5, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "A escola não sai." |
| **Aprendizado** | Frase: "A escola é construída." |

### INST-109 — Emenda para Agro

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para agro |
| **Modo** | Emendas |
| **Cor** | Verde |
| **Problema** | A bancada do agronegócio pede isenção de impostos para exportação. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Soberania` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O agro paga imposto." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -15, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O agro exporta mais." |
| **Aprendizado** | Frase: "O agro exporta mais. O povo paga." |

### INST-110 — Emenda para Rodovia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para rodovia |
| **Modo** | Emendas |
| **Cor** | Amarelo |
| **Problema** | Um senador pede emendas para uma rodovia que beneficia sua empresa. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O conflito é evitado." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -30, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O conflito é ignorado." |
| **Aprendizado** | Frase: "O conflito de interesses é ignorado." |

### INST-111 — Emenda para Educação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para educação |
| **Modo** | Emendas |
| **Cor** | Roxo |
| **Problema** | A bancada da educação pede mais verbas para o PNE. |
| **Opção Esquerda** | Ceder |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Caixa` -20, `Integridade` +5 |
| **Consequência Esquerda** | "A educação avança." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Capital Político` -5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A educação para." |
| **Aprendizado** | Frase: "O Plano Nacional de Educação avança." |

### INST-112 — Emenda para Clínica Privada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para clínica privada |
| **Modo** | Emendas |
| **Cor** | Vermelho |
| **Problema** | Um deputado pede emendas para uma clínica privada de sua família. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O dinheiro público fica no SUS." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -20, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O dinheiro financia o lucro." |
| **Aprendizado** | Frase: "O dinheiro público financia o lucro privado." |

### INST-113 — Emenda para Ônibus Elétricos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para ônibus elétricos |
| **Modo** | Emendas |
| **Cor** | Amarelo |
| **Problema** | A bancada do transporte pede verbas para ônibus elétricos. |
| **Opção Esquerda** | Ceder |
| **Efeitos Esquerda** | `Dignidade` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O transporte melhora." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Capital Político` -5, `Integridade` -5 |
| **Consequência Direita** | "O transporte piora." |
| **Aprendizado** | Frase: "O transporte público melhora." |

### INST-114 — Emenda para Festa Junina

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para festa junina |
| **Modo** | Emendas |
| **Cor** | Amarelo |
| **Problema** | Um senador pede emendas para uma festa junina em sua cidade. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +5, `Capital Político` -5, `Integridade` +5 |
| **Consequência Esquerda** | "O dinheiro é poupado." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -10, `Capital Político` +5, `Integridade` -5 |
| **Consequência Direita** | "A festa acontece." |
| **Aprendizado** | Frase: "A festa acontece. O hospital não." |

### INST-115 — Emenda para Presídios

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para presídios |
| **Modo** | Emendas |
| **Cor** | Preto |
| **Problema** | A bancada da segurança pede verbas para construir presídios. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "Menos presídios." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -25, `Segurança` +5, `Integridade` -5 |
| **Consequência Direita** | "Mais facções." |
| **Aprendizado** | Frase: "Mais presídios. Mais facções." |

### INST-116 — Emenda para ONG Religiosa

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para ONG religiosa |
| **Modo** | Emendas |
| **Cor** | Preto |
| **Problema** | Um deputado pede emendas para uma ONG ligada à sua igreja. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O Estado é laico." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -15, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O Estado financia a fé." |
| **Aprendizado** | Frase: "O Estado financia a fé." |

### INST-117 — Emenda para Cultura

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para cultura |
| **Modo** | Emendas |
| **Cor** | Roxo |
| **Problema** | A bancada da cultura pede verbas para a Lei Rouanet. |
| **Opção Esquerda** | Ceder |
| **Efeitos Esquerda** | `Consciência` +10, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A cultura resiste." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Capital Político` -5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A cultura definha." |
| **Aprendizado** | Frase: "A cultura resiste." |

### INST-118 — Emenda para Mineradora

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para mineradora |
| **Modo** | Emendas |
| **Cor** | Verde |
| **Problema** | Um senador pede emendas para uma mineradora em sua base. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Soberania` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A mineradora não lucra." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -20, `Capital Político` +10, `Soberania` -5, `Integridade` -5 |
| **Consequência Direita** | "A mineradora lucra." |
| **Aprendizado** | Frase: "A mineradora lucra. O povo sofre." |

### INST-119 — Emenda para Fiscalização Ambiental

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para fiscalização ambiental |
| **Modo** | Emendas |
| **Cor** | Verde |
| **Problema** | A bancada do meio ambiente pede verbas para fiscalização. |
| **Opção Esquerda** | Ceder |
| **Efeitos Esquerda** | `Soberania` +10, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O desmatamento recua." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Capital Político` -5, `Soberania` -5, `Integridade` -5 |
| **Consequência Direita** | "O desmatamento avança." |
| **Aprendizado** | Frase: "O desmatamento continua." |

### INST-120 — Emenda para Hospital

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para hospital |
| **Modo** | Emendas |
| **Cor** | Vermelho |
| **Problema** | Um deputado pede emendas para um hospital em sua cidade. |
| **Opção Esquerda** | Ceder |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O hospital é construído." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Capital Político` -5, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "O hospital não sai." |
| **Aprendizado** | Frase: "O hospital é construído." |

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

### INST-122 — Indicação para o STF (Bancadas)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Indicação para o STF (Bancadas) |
| **Modo** | Bancadas |
| **Cor** | Preto |
| **Problema** | A bancada evangélica quer indicar um ministro conservador para o STF. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O STF é laico." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Capital Político` +15, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "O STF se torna conservador." |
| **Aprendizado** | Dados: "O STF não é laico." · Frase: "O STF se torna conservador." |

### INST-123 — Marco Temporal (Bancadas)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Marco Temporal (Bancadas) |
| **Modo** | Bancadas |
| **Cor** | Verde |
| **Problema** | A bancada ruralista quer aprovar o Marco Temporal. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Soberania` +10, `Dignidade` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "Os indígenas resistem." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +15, `Soberania` -10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "Os indígenas perdem." |
| **Aprendizado** | Dados: "O STF declarou inconstitucional em 2023." · Frase: "Os indígenas perdem." |

### INST-124 — Redução da Maioridade Penal (Bancadas)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Redução da maioridade penal (Bancadas) |
| **Modo** | Bancadas |
| **Cor** | Vermelho |
| **Problema** | A bancada da bala quer reduzir a maioridade penal. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +5, `Dignidade` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "Os jovens não são presos." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -15, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "Mais adolescentes presos." |
| **Aprendizado** | Frase: "Mais adolescentes presos." |

### INST-125 — Bancada das Bets

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Bancada das bets |
| **Modo** | Bancadas |
| **Cor** | Preto |
| **Problema** | A bancada das bets quer legalizar cassinos online. |
| **Opção Esquerda** | Proibir |
| **Efeitos Esquerda** | `Consciência` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A jogatina recua." |
| **Opção Direita** | Legalizar |
| **Efeitos Direita** | `Caixa` +10, `Capital Político` +10, `Integridade` -10 |
| **Consequência Direita** | "A jogatina avança." |
| **Aprendizado** | Frase: "A jogatina destrói famílias." |

### INST-126 — Salário Mínimo (Bancadas)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Salário mínimo (Bancadas) |
| **Modo** | Bancadas |
| **Cor** | Vermelho |
| **Problema** | A bancada sindical pede aumento real do salário mínimo. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Legitimidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O trabalhador ganha mais." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O trabalhador ganha menos." |
| **Aprendizado** | Frase: "O trabalhador ganha mais." |

### INST-127 — Igualdade Salarial

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Igualdade salarial |
| **Modo** | Bancadas |
| **Cor** | Vermelho |
| **Problema** | A bancada feminina pede igualdade salarial. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -5, `Integridade` +5 |
| **Consequência Esquerda** | "As mulheres ganham igual." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "As mulheres ganham menos." |
| **Aprendizado** | Frase: "As mulheres continuam ganhando menos." |

### INST-128 — Cotas Raciais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cotas raciais |
| **Modo** | Bancadas |
| **Cor** | Roxo |
| **Problema** | A bancada negra pede cotas raciais no serviço público. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O racismo é enfrentado." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O racismo estrutural continua." |
| **Aprendizado** | Frase: "O racismo estrutural continua." |

### INST-129 — Fundeb

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fundeb |
| **Modo** | Bancadas |
| **Cor** | Roxo |
| **Problema** | A bancada da educação pede mais verbas para o Fundeb. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A educação melhora." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A educação piora." |
| **Aprendizado** | Frase: "A educação melhora." |

### INST-130 — Isenção para Agro

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Isenção para agro |
| **Modo** | Bancadas |
| **Cor** | Verde |
| **Problema** | A bancada do agronegócio pede isenção de impostos para exportação. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Soberania` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O agro paga imposto." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -15, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O agro exporta mais." |
| **Aprendizado** | Frase: "O agro exporta mais. O povo paga." |

### INST-131 — Mais Armas para Polícia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Mais armas para polícia |
| **Modo** | Bancadas |
| **Cor** | Preto |
| **Problema** | A bancada da segurança pede mais armas para a polícia. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "Menos armas." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -20, `Segurança` +5, `Integridade` -5 |
| **Consequência Direita** | "Mais violência." |
| **Aprendizado** | Frase: "Mais armas. Mais violência." |

### INST-132 — Proibição de Ensino de Gênero

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Proibição de ensino de gênero |
| **Modo** | Bancadas |
| **Cor** | Preto |
| **Problema** | A bancada evangélica quer proibir o ensino de gênero nas escolas. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -15, `Integridade` +10 |
| **Consequência Esquerda** | "A diversidade é respeitada." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A diversidade é silenciada." |
| **Aprendizado** | Frase: "A diversidade é silenciada." |

### INST-133 — Anistia a Crimes Ambientais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Anistia a crimes ambientais |
| **Modo** | Bancadas |
| **Cor** | Verde |
| **Problema** | A bancada ruralista quer anistiar crimes ambientais. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Soberania` +10, `Capital Político` -15, `Integridade` +10 |
| **Consequência Esquerda** | "A floresta resiste." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +10, `Soberania` -10, `Integridade` -10 |
| **Consequência Direita** | "O desmatamento é legalizado." |
| **Aprendizado** | Frase: "O desmatamento é legalizado." |

### INST-134 — Verbas para Cultura (Bancadas)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Verbas para cultura (Bancadas) |
| **Modo** | Bancadas |
| **Cor** | Roxo |
| **Problema** | A bancada da cultura pede mais verbas para a Lei Rouanet. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A cultura resiste." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A cultura definha." |
| **Aprendizado** | Frase: "A cultura resiste." |

### INST-135 — Legalização de Cassinos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Legalização de cassinos |
| **Modo** | Bancadas |
| **Cor** | Preto |
| **Problema** | A bancada das bets quer legalizar cassinos online. |
| **Opção Esquerda** | Proibir |
| **Efeitos Esquerda** | `Consciência` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A jogatina recua." |
| **Opção Direita** | Legalizar |
| **Efeitos Direita** | `Caixa` +10, `Capital Político` +10, `Integridade` -10 |
| **Consequência Direita** | "A jogatina avança." |
| **Aprendizado** | Frase: "A jogatina destrói famílias." |

### INST-136 — Armamento da População

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Armamento da população |
| **Modo** | Bancadas |
| **Cor** | Preto |
| **Problema** | A bancada da bala quer armar a população. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -15, `Integridade` +10 |
| **Consequência Esquerda** | "Menos armas." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Segurança` +5, `Dignidade` -15, `Integridade` -10 |
| **Consequência Direita** | "Mais mortes." |
| **Aprendizado** | Frase: "Mais armas. Mais mortes." |

### INST-137 — Dia do Orgulho Heterossexual

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Dia do Orgulho Heterossexual |
| **Modo** | Bancadas |
| **Cor** | Preto |
| **Problema** | A bancada evangélica quer criar o 'Dia do Orgulho Heterossexual'. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A pauta recua." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A pauta avança." |
| **Aprendizado** | Frase: "A pauta conservadora avança." |

### INST-138 — Fim da Escala 6x1

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fim da escala 6x1 |
| **Modo** | Bancadas |
| **Cor** | Vermelho |
| **Problema** | A bancada sindical pede o fim da escala 6x1. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O trabalhador descansa." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O trabalhador continua escravizado." |
| **Aprendizado** | Frase: "O trabalhador continua escravizado." |

### INST-139 — Liberação de Agrotóxicos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Liberação de agrotóxicos |
| **Modo** | Bancadas |
| **Cor** | Verde |
| **Problema** | A bancada ruralista quer liberar mais agrotóxicos. |
| **Opção Esquerda** | Proibir |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Capital Político` -15, `Integridade` +10 |
| **Consequência Esquerda** | "O veneno recua." |
| **Opção Direita** | Liberar |
| **Efeitos Direita** | `Caixa` +10, `Capital Político` +10, `Dignidade` -10, `Integridade` -10 |
| **Consequência Direita** | "O veneno chega à mesa." |
| **Aprendizado** | Frase: "O veneno chega à mesa." |

### INST-140 — Revogação do Teto de Gastos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Revogação do teto de gastos |
| **Modo** | Bancadas |
| **Cor** | Amarelo |
| **Problema** | A bancada da educação pede a revogação do teto de gastos. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A educação respira." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A educação definha." |
| **Aprendizado** | Frase: "A educação respira." |

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

**Tema: Reforma Agrária**

### THEM-001 — Ocupação do MST

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ocupação do MST |
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

### THEM-002 — Violência no Campo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Violência no campo |
| **Modo** | Temática (Reforma Agrária) |
| **Cor** | Roxo |
| **Problema** | A violência no campo matou 13 pessoas em 2024. |
| **Opção Esquerda** | Investigar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A justiça é feita." |
| **Opção Direita** | Criminalizar o MST |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A impunidade continua." |
| **Aprendizado** | Dados: "80% dos conflitos são causados por fazendeiros." · Frase: "A impunidade no campo continua." |

### THEM-003 — Desapropriação de Latifúndios

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Desapropriação de latifúndios |
| **Modo** | Temática (Reforma Agrária) |
| **Cor** | Roxo |
| **Problema** | O governo quer desapropriar latifúndios improdutivos. |
| **Opção Esquerda** | Desapropriar |
| **Efeitos Esquerda** | `Dignidade` +15, `Soberania` +5, `Capital Político` -20, `Integridade` +5 |
| **Consequência Esquerda** | "A reforma agrária avança." |
| **Opção Direita** | Recuar |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A terra continua concentrada." |
| **Aprendizado** | Dados: "Grandes fazendas dominam 80% das terras." · Frase: "A reforma agrária avança." |

### THEM-004 — Trabalho Escravo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Trabalho escravo |
| **Modo** | Temática (Reforma Agrária) |
| **Cor** | Roxo |
| **Problema** | Trabalhadores são resgatados em condições análogas à escravidão. |
| **Opção Esquerda** | Punir os fazendeiros |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O crime é punido." |
| **Opção Direita** | Minimizar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O trabalho escravo continua." |
| **Aprendizado** | Dados: "Resgates de trabalho escravo são frequentes no agro." · Frase: "O trabalho escravo continua." |

### THEM-005 — Crédito para Agricultura Familiar

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Crédito para agricultura familiar |
| **Modo** | Temática (Reforma Agrária) |
| **Cor** | Roxo |
| **Problema** | A agricultura familiar pede mais crédito. O agronegócio domina o Plano Safra. |
| **Opção Esquerda** | Redistribuir |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A comida chega à mesa." |
| **Opção Direita** | Manter |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A comida fica mais cara." |
| **Aprendizado** | Dados: "Agricultura familiar produz 70% dos alimentos." · Frase: "A comida fica mais cara." |

### THEM-006 — Agrotóxicos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Agrotóxicos |
| **Modo** | Temática (Reforma Agrária) |
| **Cor** | Verde |
| **Problema** | O agro pede mais agrotóxicos. A Anvisa resiste. |
| **Opção Esquerda** | Apoiar a Anvisa |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O veneno recua." |
| **Opção Direita** | Liberar |
| **Efeitos Direita** | `Caixa` +10, `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O veneno chega à mesa." |
| **Aprendizado** | Dados: "O Brasil é o país que mais usa agrotóxicos." · Frase: "O veneno chega à mesa." |

### THEM-007 — Titulação Quilombola

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Titulação quilombola |
| **Modo** | Temática (Reforma Agrária) |
| **Cor** | Roxo |
| **Problema** | Uma comunidade quilombola luta pela titulação de suas terras. |
| **Opção Esquerda** | Titular |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A comunidade resiste." |
| **Opção Direita** | Negar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A comunidade luta." |
| **Aprendizado** | Dados: "A Lei de Terras de 1850 excluiu negros libertos." · Frase: "A comunidade resiste." |

### THEM-008 — Anistia a Crimes Ambientais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Anistia a crimes ambientais |
| **Modo** | Temática (Reforma Agrária) |
| **Cor** | Verde |
| **Problema** | O agronegócio quer anistiar crimes ambientais. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Soberania` +10, `Capital Político` -15, `Integridade` +10 |
| **Consequência Esquerda** | "A floresta resiste." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +10, `Soberania` -10, `Integridade` -10 |
| **Consequência Direita** | "O desmatamento é legalizado." |
| **Aprendizado** | Dados: "O Brasil desmatou 62,2% mais em 2022." · Frase: "O desmatamento é legalizado." |

### THEM-009 — Recursos para Reforma Agrária

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Recursos para reforma agrária |
| **Modo** | Temática (Reforma Agrária) |
| **Cor** | Roxo |
| **Problema** | A reforma agrária precisa de mais recursos. O Congresso resiste. |
| **Opção Esquerda** | Mobilizar |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A reforma avança." |
| **Opção Direita** | Recuar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A terra continua concentrada." |
| **Aprendizado** | Frase: "A terra continua concentrada." |

### THEM-010 — Seca no Nordeste

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Seca no Nordeste |
| **Modo** | Temática (Reforma Agrária) |
| **Cor** | Vermelho |
| **Problema** | Uma seca atinge o Nordeste. O agronegócio não é afetado. |
| **Opção Esquerda** | Criar cisternas |
| **Efeitos Esquerda** | `Dignidade` +15, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A água chega." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A seca continua." |
| **Aprendizado** | Dados: "A seca é uma questão política." · Frase: "A seca continua." |

**Tema: Direitos Indígenas**

### THEM-011 — Marco Temporal (STF)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Marco Temporal (STF) |
| **Modo** | Temática (Direitos Indígenas) |
| **Cor** | Roxo |
| **Problema** | O STF declara inconstitucional o Marco Temporal. A bancada ruralista reage. |
| **Opção Esquerda** | Apoiar o STF |
| **Efeitos Esquerda** | `Soberania` +10, `Dignidade` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A terra é dos indígenas." |
| **Opção Direita** | Pressionar o STF |
| **Efeitos Direita** | `Capital Político` +10, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A terra é disputada." |
| **Aprendizado** | Dados: "O STF declarou inconstitucional em 2023." · Frase: "A terra é dos indígenas." |

### THEM-012 — Mineradora em Terra Indígena

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Mineradora em terra indígena |
| **Modo** | Temática (Direitos Indígenas) |
| **Cor** | Roxo |
| **Problema** | Uma mineradora quer explorar uma reserva indígena. |
| **Opção Esquerda** | Negar |
| **Efeitos Esquerda** | `Soberania` +10, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A reserva é protegida." |
| **Opção Direita** | Autorizar |
| **Efeitos Direita** | `Caixa` +20, `Soberania` -15, `Dignidade` -10, `Integridade` -10 |
| **Consequência Direita** | "A reserva é destruída." |
| **Aprendizado** | Frase: "A reserva é destruída." |

### THEM-013 — Garimpo Ilegal Yanomami

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Garimpo ilegal Yanomami |
| **Modo** | Temática (Direitos Indígenas) |
| **Cor** | Roxo |
| **Problema** | O garimpo ilegal avança sobre terras Yanomami. |
| **Opção Esquerda** | Intervir |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A tragédia recua." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "A tragédia continua." |
| **Aprendizado** | Frase: "A tragédia humanitária continua." |

### THEM-014 — Ameaça de Despejo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ameaça de despejo |
| **Modo** | Temática (Direitos Indígenas) |
| **Cor** | Roxo |
| **Problema** | Uma comunidade indígena é ameaçada de despejo. |
| **Opção Esquerda** | Proteger |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A comunidade resiste." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "Os indígenas são expulsos." |
| **Aprendizado** | Frase: "Os indígenas são expulsos." |

### THEM-015 — Mineração em Terra Indígena

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Mineração em terra indígena |
| **Modo** | Temática (Direitos Indígenas) |
| **Cor** | Roxo |
| **Problema** | O Congresso quer aprovar uma lei que permite a mineração em terras indígenas. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Soberania` +10, `Dignidade` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A mineração recua." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +10, `Soberania` -10, `Integridade` -10 |
| **Consequência Direita** | "A mineração avança." |
| **Aprendizado** | Frase: "A mineração avança." |

### THEM-016 — Assassinato de Liderança

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Assassinato de liderança |
| **Modo** | Temática (Direitos Indígenas) |
| **Cor** | Roxo |
| **Problema** | Uma liderança indígena é assassinada. A imprensa minimiza. |
| **Opção Esquerda** | Investigar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A justiça é feita." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A violência aumenta." |
| **Aprendizado** | Frase: "A violência no campo aumenta." |

### THEM-017 — Demarcação de Terras

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Demarcação de terras |
| **Modo** | Temática (Direitos Indígenas) |
| **Cor** | Roxo |
| **Problema** | O governo quer demarcar novas terras indígenas. O agro reage. |
| **Opção Esquerda** | Demarcar |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A demarcação avança." |
| **Opção Direita** | Recuar |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A demarcação para." |
| **Aprendizado** | Frase: "A demarcação avança." |

### THEM-018 — Hidrelétrica em Terra Indígena

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Hidrelétrica em terra indígena |
| **Modo** | Temática (Direitos Indígenas) |
| **Cor** | Roxo |
| **Problema** | Uma hidrelétrica vai inundar terras indígenas. |
| **Opção Esquerda** | Cancelar |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A floresta resiste." |
| **Opção Direita** | Construir |
| **Efeitos Direita** | `Caixa` +15, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A floresta é alagada." |
| **Aprendizado** | Frase: "A floresta é alagada." |

### THEM-019 — Saúde Indígena

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Saúde indígena |
| **Modo** | Temática (Direitos Indígenas) |
| **Cor** | Roxo |
| **Problema** | O governo quer criar um programa de saúde indígena. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A saúde melhora." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "A saúde piora." |
| **Aprendizado** | Frase: "A saúde indígena melhora." |

### THEM-020 — Universidade Indígena

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Universidade indígena |
| **Modo** | Temática (Direitos Indígenas) |
| **Cor** | Roxo |
| **Problema** | Uma universidade indígena é criada. A bancada evangélica reage. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A educação avança." |
| **Opção Direita** | Criticar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A educação recua." |
| **Aprendizado** | Frase: "A educação indígena avança." |

**Tema: Saúde**

### THEM-021 — SUS sem Médicos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | SUS sem médicos |
| **Modo** | Temática (Saúde) |
| **Cor** | Vermelho |
| **Problema** | O SUS está sem médicos e sem leitos. A população morre na fila. |
| **Opção Esquerda** | Investir |
| **Efeitos Esquerda** | `Dignidade` +15, `Caixa` -20, `Integridade` +5 |
| **Consequência Esquerda** | "A saúde melhora." |
| **Opção Direita** | Privatizar |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "A saúde vira mercadoria." |
| **Aprendizado** | Frase: "A saúde vira mercadoria." |

### THEM-022 — Epidemia na Periferia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Epidemia na periferia |
| **Modo** | Temática (Saúde) |
| **Cor** | Vermelho |
| **Problema** | Uma epidemia atinge a periferia. O governo precisa agir. |
| **Opção Esquerda** | Vacinar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A epidemia recua." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A epidemia avança." |
| **Aprendizado** | Frase: "A epidemia avança." |

### THEM-023 — Mais Médicos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Mais Médicos |
| **Modo** | Temática (Saúde) |
| **Cor** | Vermelho |
| **Problema** | O programa Mais Médicos é desmontado. A população rural fica sem atendimento. |
| **Opção Esquerda** | Recriar |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A saúde chega." |
| **Opção Direita** | Manter o corte |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A saúde colapsa." |
| **Aprendizado** | Frase: "A saúde rural colapsa." |

### THEM-024 — CAPS Fecham

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | CAPS fecham |
| **Modo** | Temática (Saúde) |
| **Cor** | Vermelho |
| **Problema** | A saúde mental no SUS está sucateada. Os CAPS fecham. |
| **Opção Esquerda** | Investir |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A luta antimanicomial avança." |
| **Opção Direita** | Abrir comunidades terapêuticas |
| **Efeitos Direita** | `Caixa` -5, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "O retrocesso avança." |
| **Aprendizado** | Frase: "O retrocesso avança." |

### THEM-025 — Preço dos Remédios

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Preço dos remédios |
| **Modo** | Temática (Saúde) |
| **Cor** | Vermelho |
| **Problema** | A indústria farmacêutica pressiona por aumento de preços. |
| **Opção Esquerda** | Intervir |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "Os remédios ficam mais baratos." |
| **Opção Direita** | Liberar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "Os remédios ficam mais caros." |
| **Aprendizado** | Frase: "Os remédios ficam mais caros." |

### THEM-026 — Taxar Fortunas para a Saúde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxar fortunas para a saúde |
| **Modo** | Temática (Saúde) |
| **Cor** | Vermelho |
| **Problema** | O governo quer taxar as grandes fortunas para financiar a saúde. |
| **Opção Esquerda** | Taxar |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` +20, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A saúde melhora." |
| **Opção Direita** | Não taxar |
| **Efeitos Direita** | `Caixa` -10, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "A saúde piora." |
| **Aprendizado** | Frase: "A saúde melhora." |

### THEM-027 — Hospital Entregue a os

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Hospital entregue a OS |
| **Modo** | Temática (Saúde) |
| **Cor** | Vermelho |
| **Problema** | Um hospital público é entregue a uma OS. Os servidores protestam. |
| **Opção Esquerda** | Manter público |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A saúde resiste." |
| **Opção Direita** | Privatizar |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A saúde vira negócio." |
| **Aprendizado** | Frase: "A saúde vira negócio." |

### THEM-028 — Covid-19

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Covid-19 |
| **Modo** | Temática (Saúde) |
| **Cor** | Vermelho |
| **Problema** | A pandemia de Covid-19 volta. O governo precisa comprar vacinas. |
| **Opção Esquerda** | Comprar |
| **Efeitos Esquerda** | `Dignidade` +15, `Caixa` -20, `Integridade` +5 |
| **Consequência Esquerda** | "A pandemia recua." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "A pandemia avança." |
| **Aprendizado** | Frase: "A pandemia avança." |

### THEM-029 — Aborto

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aborto |
| **Modo** | Temática (Saúde) |
| **Cor** | Vermelho |
| **Problema** | O governo quer legalizar o aborto. A bancada evangélica reage. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "As mulheres são protegidas." |
| **Opção Direita** | Proibir |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "As mulheres morrem." |
| **Aprendizado** | Dados: "As mulheres morrem em clínicas clandestinas." · Frase: "As mulheres morrem." |

### THEM-030 — Pesquisa em Saúde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pesquisa em saúde |
| **Modo** | Temática (Saúde) |
| **Cor** | Vermelho |
| **Problema** | Uma nova doença é descoberta. O governo precisa investir em pesquisa. |
| **Opção Esquerda** | Investir |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A doença recua." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A doença avança." |
| **Aprendizado** | Frase: "A doença avança." |

**Tema: Educação**

### THEM-031 — Universidades Sucateadas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Universidades sucateadas |
| **Modo** | Temática (Educação) |
| **Cor** | Roxo |
| **Problema** | As universidades públicas estão sucateadas. O governo pode investir. |
| **Opção Esquerda** | Investir |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A educação respira." |
| **Opção Direita** | Privatizar |
| **Efeitos Direita** | `Caixa` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A educação vira mercadoria." |
| **Aprendizado** | Frase: "A educação vira mercadoria." |

### THEM-032 — Escola em Tempo Integral

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escola em tempo integral |
| **Modo** | Temática (Educação) |
| **Cor** | Roxo |
| **Problema** | O governo quer criar escolas de tempo integral. O Congresso resiste. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +10, `Caixa` -20, `Integridade` +5 |
| **Consequência Esquerda** | "A educação integral avança." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Caixa` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A educação fica em turnos." |
| **Aprendizado** | Frase: "A educação integral avança." |

### THEM-033 — Evasão Escolar

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Evasão escolar |
| **Modo** | Temática (Educação) |
| **Cor** | Roxo |
| **Problema** | A evasão escolar atinge 8,5 milhões de jovens. O governo precisa agir. |
| **Opção Esquerda** | Criar programas |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "Os jovens voltam à escola." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "Os jovens abandonam a escola." |
| **Aprendizado** | Frase: "Os jovens abandonam a escola." |

### THEM-034 — Educação Sexual (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Educação sexual (2) |
| **Modo** | Temática (Educação) |
| **Cor** | Roxo |
| **Problema** | O governo quer incluir educação sexual no currículo. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A prevenção avança." |
| **Opção Direita** | Retirar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A gravidez na adolescência aumenta." |
| **Aprendizado** | Frase: "A gravidez na adolescência aumenta." |

### THEM-035 — Método Paulo Freire (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Método Paulo Freire (2) |
| **Modo** | Temática (Educação) |
| **Cor** | Roxo |
| **Problema** | O MEC quer adotar o método Paulo Freire. A direita reage. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +15, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A pedagogia libertadora avança." |
| **Opção Direita** | Proibir |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -15, `Integridade` -5 |
| **Consequência Direita** | "A pedagogia é silenciada." |
| **Aprendizado** | Frase: "A pedagogia é silenciada." |

### THEM-036 — Escola Incendiada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escola incendiada |
| **Modo** | Temática (Educação) |
| **Cor** | Roxo |
| **Problema** | Uma escola é incendiada por milícias. O governo pode reconstruir. |
| **Opção Esquerda** | Reconstruir |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A escola volta." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A comunidade fica sem escola." |
| **Aprendizado** | Frase: "A comunidade fica sem escola." |

### THEM-037 — Cotas Raciais e Sociais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cotas raciais e sociais |
| **Modo** | Temática (Educação) |
| **Cor** | Roxo |
| **Problema** | O governo quer criar cotas para negros e indígenas nas universidades. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A universidade se torna diversa." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A universidade continua elitista." |
| **Aprendizado** | Frase: "A universidade se torna diversa." |

### THEM-038 — Analfabetismo no Nordeste

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Analfabetismo no Nordeste |
| **Modo** | Temática (Educação) |
| **Cor** | Roxo |
| **Problema** | O analfabetismo cresce no Nordeste. O governo precisa agir. |
| **Opção Esquerda** | Criar programas |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O analfabetismo recua." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O analfabetismo aumenta." |
| **Aprendizado** | Frase: "O analfabetismo aumenta." |

### THEM-039 — Creches (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Creches (2) |
| **Modo** | Temática (Educação) |
| **Cor** | Vermelho |
| **Problema** | O governo quer construir creches. As mães precisam trabalhar. |
| **Opção Esquerda** | Construir |
| **Efeitos Esquerda** | `Dignidade` +15, `Caixa` -20, `Integridade` +5 |
| **Consequência Esquerda** | "As mães trabalham." |
| **Opção Direita** | Dar voucher |
| **Efeitos Direita** | `Caixa` -10, `Dignidade` +5, `Integridade` -5 |
| **Consequência Direita** | "As mães pobres continuam sem creche." |
| **Aprendizado** | Frase: "As mães pobres continuam sem creche." |

### THEM-040 — Educação Indígena

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Educação indígena |
| **Modo** | Temática (Educação) |
| **Cor** | Roxo |
| **Problema** | A educação indígena é ameaçada. O governo pode proteger. |
| **Opção Esquerda** | Proteger |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A cultura indígena resiste." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A cultura indígena é ameaçada." |
| **Aprendizado** | Frase: "A cultura indígena resiste." |

**Tema: Segurança**

### THEM-041 — Violência Policial

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Violência policial |
| **Modo** | Temática (Segurança) |
| **Cor** | Preto |
| **Problema** | A violência policial matou 11 pessoas por dia em 2024. |
| **Opção Esquerda** | Investigar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A justiça é feita." |
| **Opção Direita** | Defender a polícia |
| **Efeitos Direita** | `Segurança` +5, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "A impunidade continua." |
| **Aprendizado** | Dados: "86% das vítimas são negras." · Frase: "A impunidade policial continua." |

### THEM-042 — Facção Controla Cidade

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Facção controla cidade |
| **Modo** | Temática (Segurança) |
| **Cor** | Preto |
| **Problema** | Uma facção criminosa controla uma cidade. O governo pode intervir. |
| **Opção Esquerda** | Investir em prevenção |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A raiz é atacada." |
| **Opção Direita** | Intervenção militar |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A cidade vira zona de guerra." |
| **Aprendizado** | Frase: "A cidade vira zona de guerra." |

### THEM-043 — Desmilitarização (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Desmilitarização (2) |
| **Modo** | Temática (Segurança) |
| **Cor** | Preto |
| **Problema** | O governo quer desmilitarizar a polícia. A corporação resiste. |
| **Opção Esquerda** | Desmilitarizar |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Capital Político` -20, `Integridade` +5 |
| **Consequência Esquerda** | "A polícia se democratiza." |
| **Opção Direita** | Manter |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A polícia continua exército." |
| **Aprendizado** | Frase: "A polícia continua exército." |

### THEM-044 — Chacina Policial (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Chacina policial (2) |
| **Modo** | Temática (Segurança) |
| **Cor** | Preto |
| **Problema** | Uma operação policial mata 121 pessoas no Rio. A imprensa minimiza. |
| **Opção Esquerda** | Investigar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A verdade aparece." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "A chacina é esquecida." |
| **Aprendizado** | Frase: "A maior chacina é esquecida." |

### THEM-045 — Redução da Maioridade (3)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Redução da maioridade (3) |
| **Modo** | Temática (Segurança) |
| **Cor** | Preto |
| **Problema** | O governo quer reduzir a maioridade penal. Especialistas discordam. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +5, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "Os jovens não são presos." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Segurança` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "Mais adolescentes presos." |
| **Aprendizado** | Frase: "Mais adolescentes presos." |

### THEM-046 — Sistema Prisional (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Sistema prisional (2) |
| **Modo** | Temática (Segurança) |
| **Cor** | Preto |
| **Problema** | O sistema prisional é um celeiro de facções. |
| **Opção Esquerda** | Ressocialização |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A ressocialização avança." |
| **Opção Direita** | Isolar líderes |
| **Efeitos Direita** | `Segurança` +5, `Soberania` -5, `Integridade` -5 |
| **Consequência Direita** | "As facções se reorganizam." |
| **Aprendizado** | Frase: "As facções se reorganizam." |

### THEM-047 — Redução de Danos (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Redução de danos (2) |
| **Modo** | Temática (Segurança) |
| **Cor** | Preto |
| **Problema** | O governo quer criar um programa de redução de danos. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "As mortes caem." |
| **Opção Direita** | Proibir |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "As mortes aumentam." |
| **Aprendizado** | Frase: "As mortes por overdose aumentam." |

### THEM-048 — População Carcerária Negra (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | População carcerária negra (2) |
| **Modo** | Temática (Segurança) |
| **Cor** | Preto |
| **Problema** | Uma pesquisa mostra que 69% da população carcerária é negra. |
| **Opção Esquerda** | Criar cotas |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O racismo é enfrentado." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O racismo estrutural continua." |
| **Aprendizado** | Frase: "O racismo estrutural continua." |

### THEM-049 — Taxação de Armas (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxação de armas (2) |
| **Modo** | Temática (Segurança) |
| **Cor** | Preto |
| **Problema** | O governo quer taxar as armas para reduzir a violência. |
| **Opção Esquerda** | Taxar |
| **Efeitos Esquerda** | `Dignidade` +10, `Segurança` -5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "Menos armas." |
| **Opção Direita** | Não taxar |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "Mais armas." |
| **Aprendizado** | Frase: "Mais armas nas ruas." |

### THEM-050 — Policial Vende Armas (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Policial vende armas (2) |
| **Modo** | Temática (Segurança) |
| **Cor** | Preto |
| **Problema** | Um policial é flagrado vendendo armas para facções. |
| **Opção Esquerda** | Punir |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A corrupção é combatida." |
| **Opção Direita** | Proteger |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -10 |
| **Consequência Direita** | "A corrupção é blindada." |
| **Aprendizado** | Frase: "A corrupção policial é blindada." |

**Tema: Cultura**

### THEM-051 — Corte na Cultura (3)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte na cultura (3) |
| **Modo** | Temática (Cultura) |
| **Cor** | Roxo |
| **Problema** | O governo quer cortar verbas da cultura. A classe artística protesta. |
| **Opção Esquerda** | Manter |
| **Efeitos Esquerda** | `Consciência` +10, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A cultura resiste." |
| **Opção Direita** | Cortar |
| **Efeitos Direita** | `Caixa` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A cultura definha." |
| **Aprendizado** | Frase: "A cultura resiste." |

### THEM-052 — Escola de Samba Crítica

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escola de samba crítica |
| **Modo** | Temática (Cultura) |
| **Cor** | Roxo |
| **Problema** | Uma escola de samba quer desfilar com um enredo crítico ao governo. |
| **Opção Esquerda** | Defender |
| **Efeitos Esquerda** | `Consciência` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O desfile é um grito de resistência." |
| **Opção Direita** | Censurar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "O desfile é silenciado." |
| **Aprendizado** | Frase: "O desfile é silenciado." |

### THEM-053 — Filme Sobre a Ditadura

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Filme sobre a ditadura |
| **Modo** | Temática (Cultura) |
| **Cor** | Roxo |
| **Problema** | Um filme sobre a ditadura é censurado. O governo pode intervir. |
| **Opção Esquerda** | Liberar |
| **Efeitos Esquerda** | `Consciência` +15, `Integridade` +10, `Capital Político` -10 |
| **Consequência Esquerda** | "A memória é preservada." |
| **Opção Direita** | Manter a censura |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A memória é apagada." |
| **Aprendizado** | Frase: "A memória é apagada." |

### THEM-054 — Cinema Nacional

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cinema nacional |
| **Modo** | Temática (Cultura) |
| **Cor** | Roxo |
| **Problema** | O governo quer financiar o cinema nacional. A bancada evangélica reage. |
| **Opção Esquerda** | Financiar |
| **Efeitos Esquerda** | `Consciência` +10, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O cinema resiste." |
| **Opção Direita** | Cortar |
| **Efeitos Direita** | `Caixa` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "O cinema definha." |
| **Aprendizado** | Frase: "O cinema brasileiro definha." |

### THEM-055 — Exposição Indígena

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Exposição indígena |
| **Modo** | Temática (Cultura) |
| **Cor** | Roxo |
| **Problema** | Uma exposição de arte indígena é criticada pelo agronegócio. |
| **Opção Esquerda** | Defender |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A arte indígena resiste." |
| **Opção Direita** | Retirar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A arte indígena resiste." |
| **Aprendizado** | Frase: "A arte indígena resiste." |

### THEM-056 — Rapper Preso

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Rapper preso |
| **Modo** | Temática (Cultura) |
| **Cor** | Roxo |
| **Problema** | Um rapper é preso por criticar o governo. A cultura reage. |
| **Opção Esquerda** | Libertar |
| **Efeitos Esquerda** | `Consciência` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A liberdade de expressão resiste." |
| **Opção Direita** | Manter preso |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A censura avança." |
| **Aprendizado** | Frase: "A censura avança." |

### THEM-057 — Programa de Leitura (2)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Programa de leitura (2) |
| **Modo** | Temática (Cultura) |
| **Cor** | Roxo |
| **Problema** | O governo quer criar um programa de leitura nas periferias. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A leitura chega." |
| **Opção Direita** | Não criar |
| **Efeitos Direita** | `Caixa` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A periferia continua sem livros." |
| **Aprendizado** | Frase: "A periferia tem acesso à leitura." |

### THEM-058 — Peça Censurada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Peça censurada |
| **Modo** | Temática (Cultura) |
| **Cor** | Roxo |
| **Problema** | Uma peça de teatro é censurada por 'apologia ao comunismo'. |
| **Opção Esquerda** | Liberar |
| **Efeitos Esquerda** | `Consciência` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A arte resiste." |
| **Opção Direita** | Manter a censura |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A arte é silenciada." |
| **Aprendizado** | Frase: "A arte é silenciada." |

### THEM-059 — Taxar Fortunas para Cultura

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxar fortunas para cultura |
| **Modo** | Temática (Cultura) |
| **Cor** | Roxo |
| **Problema** | O governo quer taxar as grandes fortunas para financiar a cultura. |
| **Opção Esquerda** | Taxar |
| **Efeitos Esquerda** | `Consciência` +5, `Caixa` +15, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A cultura é financiada." |
| **Opção Direita** | Não taxar |
| **Efeitos Direita** | `Caixa` -10, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "A cultura definha." |
| **Aprendizado** | Frase: "A cultura é financiada." |

### THEM-060 — Grafiteiro Preso

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Grafiteiro preso |
| **Modo** | Temática (Cultura) |
| **Cor** | Roxo |
| **Problema** | Um grafiteiro é preso por fazer arte em um viaduto. |
| **Opção Esquerda** | Libertar |
| **Efeitos Esquerda** | `Consciência` +5, `Dignidade` +5, `Capital Político` -5, `Integridade` +5 |
| **Consequência Esquerda** | "A arte urbana resiste." |
| **Opção Direita** | Manter preso |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A arte urbana resiste." |
| **Aprendizado** | Frase: "A arte urbana resiste." |

**Tema: Futebol**

### THEM-061 — Copa como Propaganda

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Copa como propaganda |
| **Modo** | Temática (Futebol) |
| **Cor** | Amarelo |
| **Problema** | A seleção vai disputar a Copa. O governo quer usar o evento para propaganda. |
| **Opção Esquerda** | Financiar o esporte de base |
| **Efeitos Esquerda** | `Paixão Nacional` +10, `Dignidade` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O povo se orgulha." |
| **Opção Direita** | Usar como propaganda |
| **Efeitos Direita** | `Legitimidade` +10, `Paixão Nacional` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "O povo se une em torno da bandeira." |
| **Aprendizado** | Frase: "O povo se une em torno da bandeira." |

### THEM-062 — Jogadores Políticos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Jogadores políticos |
| **Modo** | Temática (Futebol) |
| **Cor** | Amarelo |
| **Problema** | Jogadores querem se posicionar politicamente. A CBF ameaça punir. |
| **Opção Esquerda** | Apoiar o direito de expressão |
| **Efeitos Esquerda** | `Consciência` +10, `Paixão Nacional` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "Os jogadores se tornam vozes." |
| **Opção Direita** | Apoiar a CBF |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "O futebol volta a ser pão e circo." |
| **Aprendizado** | Frase: "O futebol volta a ser pão e circo." |

### THEM-063 — Futebol de Várzea

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Futebol de várzea |
| **Modo** | Temática (Futebol) |
| **Cor** | Amarelo |
| **Problema** | Uma liga de futebol de várzea pede apoio para se organizar. |
| **Opção Esquerda** | Financiar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Paixão Nacional` +10, `Caixa` -5, `Integridade` +5 |
| **Consequência Esquerda** | "A periferia se organiza." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Paixão Nacional` -5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "O futebol do povo desaparece." |
| **Aprendizado** | Frase: "O futebol do povo desaparece." |

### THEM-064 — Estádio de Luxo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Estádio de luxo |
| **Modo** | Temática (Futebol) |
| **Cor** | Amarelo |
| **Problema** | O governo quer construir um estádio de luxo. A população precisa de escolas. |
| **Opção Esquerda** | Investir em escolas |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A educação é prioridade." |
| **Opção Direita** | Construir o estádio |
| **Efeitos Direita** | `Paixão Nacional` +5, `Caixa` -20, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O estádio é construído." |
| **Aprendizado** | Frase: "O estádio é construído. A escola não." |

### THEM-065 — Racismo no Futebol

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Racismo no futebol |
| **Modo** | Temática (Futebol) |
| **Cor** | Amarelo |
| **Problema** | Um jogador denuncia racismo nos estádios. O governo pode agir. |
| **Opção Esquerda** | Criar campanha |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -5, `Integridade` +5 |
| **Consequência Esquerda** | "O racismo é enfrentado." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "O racismo continua." |
| **Aprendizado** | Frase: "O racismo continua." |

### THEM-066 — Democracia Corinthiana

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Democracia Corinthiana |
| **Modo** | Temática (Futebol) |
| **Cor** | Amarelo |
| **Problema** | A Democracia Corinthiana é lembrada. O governo quer homenagear. |
| **Opção Esquerda** | Homenagear |
| **Efeitos Esquerda** | `Consciência` +10, `Paixão Nacional` +5, `Capital Político` -5, `Integridade` +5 |
| **Consequência Esquerda** | "A memória da resistência é preservada." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A memória da resistência é preservada." |
| **Aprendizado** | Frase: "A memória da resistência é preservada." |

### THEM-067 — Futebol para Paz nas Favelas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Futebol para paz nas favelas |
| **Modo** | Temática (Futebol) |
| **Cor** | Amarelo |
| **Problema** | O governo quer usar o futebol para promover a paz nas favelas. |
| **Opção Esquerda** | Criar projetos |
| **Efeitos Esquerda** | `Dignidade` +10, `Paixão Nacional` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O esporte transforma vidas." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "O esporte transforma vidas." |
| **Aprendizado** | Frase: "O esporte transforma vidas." |

### THEM-068 — Criminalização de Torcidas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Criminalização de torcidas |
| **Modo** | Temática (Futebol) |
| **Cor** | Preto |
| **Problema** | Uma torcida organizada é criminalizada. O governo pode intervir. |
| **Opção Esquerda** | Dialogar |
| **Efeitos Esquerda** | `Consciência` +5, `Paixão Nacional` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O diálogo avança." |
| **Opção Direita** | Reprimir |
| **Efeitos Direita** | `Segurança` +5, `Paixão Nacional` -10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A repressão aumenta." |
| **Aprendizado** | Frase: "A repressão aumenta." |

### THEM-069 — Taxar Fortunas para Esporte

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxar fortunas para esporte |
| **Modo** | Temática (Futebol) |
| **Cor** | Amarelo |
| **Problema** | O governo quer taxar as grandes fortunas para financiar o esporte. |
| **Opção Esquerda** | Taxar |
| **Efeitos Esquerda** | `Paixão Nacional` +10, `Caixa` +15, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O esporte é financiado." |
| **Opção Direita** | Não taxar |
| **Efeitos Direita** | `Caixa` -10, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O esporte definha." |
| **Aprendizado** | Frase: "O esporte é financiado." |

### THEM-070 — Ídolo Apoia o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ídolo apoia o governo |
| **Modo** | Temática (Futebol) |
| **Cor** | Amarelo |
| **Problema** | Um ídolo do futebol apoia o governo. A oposição reage. |
| **Opção Esquerda** | Aceitar o apoio |
| **Efeitos Esquerda** | `Legitimidade` +5, `Paixão Nacional` +5, `Integridade` -5 |
| **Consequência Esquerda** | "O ídolo mobiliza as massas." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Legitimidade` -5, `Paixão Nacional` -5, `Integridade` +5 |
| **Consequência Direita** | "O ídolo mobiliza as massas." |
| **Aprendizado** | Frase: "O ídolo mobiliza as massas." |

---

## 17.13 — Cartas de Atores (72)

**Ator: Latifundiários**

### ATOR-001 — O Latifundiário Cobra o Favor

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

### ATOR-002 — O Latifundiário Ameaça Invadir Terra

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Latifundiário ameaça invadir terra |
| **Modo** | Ator (Latifundiários) |
| **Cor** | Preto |
| **Problema** | O Latifundiário ameaça invadir terras indígenas se o governo não ceder. |
| **Opção Esquerda** | Intervir |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A terra é protegida." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -15, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A violência no campo aumenta." |
| **Aprendizado** | Frase: "A violência no campo aumenta." |

### ATOR-003 — O Latifundiário Pede Anistia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Latifundiário pede anistia |
| **Modo** | Ator (Latifundiários) |
| **Cor** | Preto |
| **Problema** | O Latifundiário quer anistia para crimes ambientais em suas terras. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Soberania` +10, `Dignidade` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O desmatamento recua." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +15, `Soberania` -10, `Integridade` -10 |
| **Consequência Direita** | "O desmatamento é legalizado." |
| **Aprendizado** | Frase: "O desmatamento é legalizado." |

**Ator: Investidores da Faria Lima**

### ATOR-004 — O Investidor Oferece Investimentos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Investidor oferece investimentos |
| **Modo** | Ator (Investidores da Faria Lima) |
| **Cor** | Laranja |
| **Problema** | O Investidor oferece investimentos em troca de cortes sociais. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A dignidade é preservada." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` +20, `Dignidade` -15, `Integridade` -10 |
| **Consequência Direita** | "A desigualdade aumenta." |
| **Aprendizado** | Frase: "A desigualdade aumenta." |

### ATOR-005 — O Investidor Ameaça Tirar o Dinheiro

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Investidor ameaça tirar o dinheiro |
| **Modo** | Ator (Investidores da Faria Lima) |
| **Cor** | Laranja |
| **Problema** | O Investidor ameaça tirar o dinheiro do país se o governo taxar as grandes fortunas. |
| **Opção Esquerda** | Taxar |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` +20, `Capital Político` -20, `Integridade` +5 |
| **Consequência Esquerda** | "O rico paga." |
| **Opção Direita** | Não taxar |
| **Efeitos Direita** | `Caixa` -10, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O rico continua rico." |
| **Aprendizado** | Frase: "O rico continua rico." |

### ATOR-006 — O Investidor Financia a Campanha

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Investidor financia a campanha |
| **Modo** | Ator (Investidores da Faria Lima) |
| **Cor** | Laranja |
| **Problema** | O Investidor quer financiar a campanha do governo em troca de favores. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -10 |
| **Consequência Esquerda** | "A política é limpa." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` +20, `Capital Político` +10, `Integridade` -15 |
| **Consequência Direita** | "A corrupção se instala." |
| **Aprendizado** | Frase: "A corrupção se instala." |

**Ator: Construtoras**

### ATOR-007 — A Construtora Quer Despejar Famílias

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Construtora quer despejar famílias |
| **Modo** | Ator (Construtoras) |
| **Cor** | Laranja |
| **Problema** | A Construtora quer despejar famílias para construir um empreendimento de luxo. |
| **Opção Esquerda** | Proteger as famílias |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A comunidade resiste." |
| **Opção Direita** | Autorizar o despejo |
| **Efeitos Direita** | `Caixa` +15, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "A comunidade é expulsa." |
| **Aprendizado** | Frase: "A comunidade é expulsa." |

### ATOR-008 — A Construtora Financia a Campanha

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Construtora financia a campanha |
| **Modo** | Ator (Construtoras) |
| **Cor** | Laranja |
| **Problema** | A Construtora financia a campanha em troca de desregulamentação urbana. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A cidade é preservada." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` +20, `Capital Político` +10, `Integridade` -10 |
| **Consequência Direita** | "A especulação avança." |
| **Aprendizado** | Frase: "A especulação avança." |

### ATOR-009 — A Construtora Quer Construir em Área Verde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Construtora quer construir em área verde |
| **Modo** | Ator (Construtoras) |
| **Cor** | Verde |
| **Problema** | A Construtora quer construir em uma área verde protegida. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Soberania` +10, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A área verde é preservada." |
| **Opção Direita** | Permitir |
| **Efeitos Direita** | `Caixa` +15, `Soberania` -10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A área verde é destruída." |
| **Aprendizado** | Frase: "A área verde é destruída." |

**Ator: Empresariado Industrial**

### ATOR-010 — O Industrial Pede Proteção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Industrial pede proteção |
| **Modo** | Ator (Empresariado Industrial) |
| **Cor** | Azul |
| **Problema** | O Industrial pede proteção contra a concorrência estrangeira. |
| **Opção Esquerda** | Proteger |
| **Efeitos Esquerda** | `Soberania` +10, `Caixa` -10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A indústria resiste." |
| **Opção Direita** | Não proteger |
| **Efeitos Direita** | `Caixa` +10, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A indústria fecha." |
| **Aprendizado** | Frase: "A indústria fecha." |

### ATOR-011 — O Industrial Ameaça Demitir

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Industrial ameaça demitir |
| **Modo** | Ator (Empresariado Industrial) |
| **Cor** | Azul |
| **Problema** | O Industrial ameaça demitir se o governo não ceder às suas demandas. |
| **Opção Esquerda** | Resistir |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A dignidade é preservada." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "Os trabalhadores são demitidos." |
| **Aprendizado** | Frase: "Os trabalhadores são demitidos." |

### ATOR-012 — O Industrial Pede Desregulamentação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Industrial pede desregulamentação |
| **Modo** | Ator (Empresariado Industrial) |
| **Cor** | Azul |
| **Problema** | O Industrial pede desregulamentação ambiental para aumentar a produção. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Soberania` +10, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O meio ambiente é preservado." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` +15, `Soberania` -10, `Integridade` -10 |
| **Consequência Direita** | "O meio ambiente é destruído." |
| **Aprendizado** | Frase: "O meio ambiente é destruído." |

**Ator: Setor de Universidades Privadas**

### ATOR-013 — O Setor Quer Expandir o EAD

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Setor quer expandir o EAD |
| **Modo** | Ator (Setor de Universidades Privadas) |
| **Cor** | Laranja |
| **Problema** | O Setor quer expandir o EAD de baixa qualidade. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A educação resiste." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A educação se massifica." |
| **Aprendizado** | Frase: "A educação se massifica." |

### ATOR-014 — O Setor Pressiona por Cortes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Setor pressiona por cortes |
| **Modo** | Ator (Setor de Universidades Privadas) |
| **Cor** | Laranja |
| **Problema** | O Setor pressiona por cortes na universidade pública. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A universidade resiste." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` +10, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A universidade definha." |
| **Aprendizado** | Frase: "A universidade definha." |

### ATOR-015 — O Setor Financia Campanha

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Setor financia campanha |
| **Modo** | Ator (Setor de Universidades Privadas) |
| **Cor** | Laranja |
| **Problema** | O Setor financia a campanha em troca de favores. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A política é limpa." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` +20, `Capital Político` +10, `Integridade` -15 |
| **Consequência Direita** | "A corrupção se instala." |
| **Aprendizado** | Frase: "A corrupção se instala." |

**Ator: Mercado**

### ATOR-016 — O Mercado Reage

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Mercado reage |
| **Modo** | Ator (Mercado) |
| **Cor** | Laranja |
| **Problema** | O Mercado reage mal à política econômica do governo. |
| **Opção Esquerda** | Ignorar |
| **Efeitos Esquerda** | `Dignidade` +5, `Caixa` -5, `Integridade` +5 |
| **Consequência Esquerda** | "A soberania é preservada." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O mercado manda." |
| **Aprendizado** | Frase: "O mercado manda." |

### ATOR-017 — O Mercado Ameaça Fuga de Capital

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Mercado ameaça fuga de capital |
| **Modo** | Ator (Mercado) |
| **Cor** | Laranja |
| **Problema** | O Mercado ameaça fuga de capital se o governo não cortar gastos. |
| **Opção Esquerda** | Resistir |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A dignidade é preservada." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` +15, `Dignidade` -15, `Integridade` -10 |
| **Consequência Direita** | "Os gastos sociais são cortados." |
| **Aprendizado** | Frase: "Os gastos sociais são cortados." |

### ATOR-018 — O Mercado Comemora

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Mercado comemora |
| **Modo** | Ator (Mercado) |
| **Cor** | Laranja |
| **Problema** | O Mercado comemora a política de austeridade do governo. |
| **Opção Esquerda** | Manter |
| **Efeitos Esquerda** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Esquerda** | "A austeridade continua." |
| **Opção Direita** | Mudar |
| **Efeitos Direita** | `Dignidade` +10, `Caixa` -10, `Integridade` +5 |
| **Consequência Direita** | "A austeridade recua." |
| **Aprendizado** | Frase: "A austeridade recua." |

**Ator: Tecnocratas**

### ATOR-019 — O Tecnocrata Propõe Choque de Gestão

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Tecnocrata propõe choque de gestão |
| **Modo** | Ator (Tecnocratas) |
| **Cor** | Amarelo |
| **Problema** | O Tecnocrata propõe cortar 30% do orçamento da saúde e educação. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A dignidade é preservada." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` +20, `Dignidade` -15, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "Os cortes sociais avançam." |
| **Aprendizado** | Frase: "Os cortes sociais avançam." |

### ATOR-020 — O Tecnocrata Pede Mais Cortes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Tecnocrata pede mais cortes |
| **Modo** | Ator (Tecnocratas) |
| **Cor** | Amarelo |
| **Problema** | O Tecnocrata pede mais cortes para equilibrar as contas. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A dignidade é preservada." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` +15, `Dignidade` -15, `Integridade` -10 |
| **Consequência Direita** | "A crise fiscal se aprofunda." |
| **Aprendizado** | Frase: "A crise fiscal se aprofunda." |

### ATOR-021 — O Tecnocrata Defende o Teto

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Tecnocrata defende o teto |
| **Modo** | Ator (Tecnocratas) |
| **Cor** | Amarelo |
| **Problema** | O Tecnocrata defende o teto de gastos como 'responsabilidade fiscal'. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O teto cai." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O teto se mantém." |
| **Aprendizado** | Frase: "O teto se mantém." |

**Ator: Militares**

### ATOR-022 — O Militar Pede Aumento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Militar pede aumento |
| **Modo** | Ator (Militares) |
| **Cor** | Preto |
| **Problema** | O Militar pede aumento de gastos militares. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A dignidade é preservada." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` -20, `Segurança` +5, `Integridade` -5 |
| **Consequência Direita** | "Os gastos militares aumentam." |
| **Aprendizado** | Frase: "Os gastos militares aumentam." |

### ATOR-023 — O Militar Ameaça Intervir

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Militar ameaça intervir |
| **Modo** | Ator (Militares) |
| **Cor** | Preto |
| **Problema** | Um general ameaça intervir se o governo não ceder. |
| **Opção Esquerda** | Repudiar |
| **Efeitos Esquerda** | `Consciência` +10, `Soberania` +5, `Integridade` +5 |
| **Consequência Esquerda** | "A democracia resiste." |
| **Opção Direita** | Negociar |
| **Efeitos Direita** | `Capital Político` +5, `Soberania` -10, `Integridade` -10 |
| **Consequência Direita** | "A quartelada se aproxima." |
| **Aprendizado** | Frase: "A quartelada se aproxima." |

### ATOR-024 — O Militar Pede Anistia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Militar pede anistia |
| **Modo** | Ator (Militares) |
| **Cor** | Preto |
| **Problema** | O Militar pede anistia para crimes da ditadura. |
| **Opção Esquerda** | Vetar |
| **Efeitos Esquerda** | `Consciência` +15, `Integridade` +10, `Capital Político` -20 |
| **Consequência Esquerda** | "A memória é preservada." |
| **Opção Direita** | Apoiar |
| **Efeitos Direita** | `Capital Político` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A impunidade se instala." |
| **Aprendizado** | Frase: "A impunidade se instala." |

**Ator: Servidores Públicos Estatais**

### ATOR-025 — O Servidor Ameaça Travar o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Servidor ameaça travar o governo |
| **Modo** | Ator (Servidores Públicos Estatais) |
| **Cor** | Azul |
| **Problema** | O Servidor ameaça travar o governo se não receber aumento. |
| **Opção Esquerda** | Negociar |
| **Efeitos Esquerda** | `Caixa` -15, `Capital Político` +5, `Integridade` +5 |
| **Consequência Esquerda** | "O governo funciona." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` -10, `Caixa` +5, `Integridade` -5 |
| **Consequência Direita** | "O governo trava." |
| **Aprendizado** | Frase: "O governo trava." |

### ATOR-026 — O Servidor Resiste a Reforma

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Servidor resiste a reforma |
| **Modo** | Ator (Servidores Públicos Estatais) |
| **Cor** | Azul |
| **Problema** | O Servidor resiste a uma reforma que privatiza um serviço público. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O serviço público resiste." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "O serviço público se privatiza." |
| **Aprendizado** | Frase: "O serviço público se privatiza." |

### ATOR-027 — O Servidor Quer Transparência

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Servidor quer transparência |
| **Modo** | Ator (Servidores Públicos Estatais) |
| **Cor** | Azul |
| **Problema** | O Servidor quer criar um programa de transparência. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Consciência` +5, `Integridade` +10, `Caixa` -5 |
| **Consequência Esquerda** | "A transparência avança." |
| **Opção Direita** | Não criar |
| **Efeitos Direita** | `Caixa` +5, `Integridade` -5 |
| **Consequência Direita** | "A transparência recua." |
| **Aprendizado** | Frase: "A transparência recua." |

**Ator: Diplomatas do Itamaraty**

### ATOR-028 — O Diplomata Pede Apoio ao BRICS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Diplomata pede apoio ao BRICS |
| **Modo** | Ator (Diplomatas do Itamaraty) |
| **Cor** | Azul |
| **Problema** | O Diplomata pede apoio ao BRICS em uma votação internacional. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Soberania` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A soberania avança." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Capital Político` +5, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A soberania recua." |
| **Aprendizado** | Frase: "A soberania recua." |

### ATOR-029 — O Diplomata Alerta Sobre Pressão dos EUA

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Diplomata alerta sobre pressão dos EUA |
| **Modo** | Ator (Diplomatas do Itamaraty) |
| **Cor** | Azul |
| **Problema** | O Diplomata alerta sobre pressão dos EUA para alinhamento político. |
| **Opção Esquerda** | Resistir |
| **Efeitos Esquerda** | `Soberania` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A soberania resiste." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Capital Político` +5, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A subordinação avança." |
| **Aprendizado** | Frase: "A subordinação avança." |

### ATOR-030 — O Diplomata Defende a Soberania

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Diplomata defende a soberania |
| **Modo** | Ator (Diplomatas do Itamaraty) |
| **Cor** | Azul |
| **Problema** | O Diplomata defende a soberania brasileira em uma negociação internacional. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Soberania` +10, `Integridade` +5 |
| **Consequência Esquerda** | "A soberania é preservada." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Soberania` -5, `Integridade` -5 |
| **Consequência Direita** | "A soberania é ignorada." |
| **Aprendizado** | Frase: "A soberania é ignorada." |

**Ator: Líder da Câmara (Centrão)**

### ATOR-031 — O Líder da Câmara Pede Emendas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Líder da Câmara pede emendas |
| **Modo** | Ator (Líder da Câmara (Centrão)) |
| **Cor** | Amarelo |
| **Problema** | O Líder da Câmara pede emendas para sua base em troca de apoio. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Capital Político` -10, `Consciência` +5, `Integridade` +5 |
| **Consequência Esquerda** | "A política é limpa." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -30, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O voto é comprado." |
| **Aprendizado** | Frase: "O voto é comprado." |

### ATOR-032 — O Líder da Câmara Quer Cargos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Líder da Câmara quer cargos |
| **Modo** | Ator (Líder da Câmara (Centrão)) |
| **Cor** | Amarelo |
| **Problema** | O Líder da Câmara quer cargos no governo em troca de apoio. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Capital Político` -10, `Consciência` +5, `Integridade` +5 |
| **Consequência Esquerda** | "A política é limpa." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -20, `Capital Político` +10, `Integridade` -5 |
| **Consequência Direita** | "O fisiologismo avança." |
| **Aprendizado** | Frase: "O fisiologismo avança." |

### ATOR-033 — O Líder da Câmara Chantageia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Líder da Câmara chantageia |
| **Modo** | Ator (Líder da Câmara (Centrão)) |
| **Cor** | Amarelo |
| **Problema** | O Líder da Câmara chantageia o governo com o impeachment. |
| **Opção Esquerda** | Resistir |
| **Efeitos Esquerda** | `Capital Político` -15, `Consciência` +5, `Integridade` +5 |
| **Consequência Esquerda** | "A dignidade é preservada." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -30, `Capital Político` +10, `Integridade` -10 |
| **Consequência Direita** | "O governo se curva." |
| **Aprendizado** | Frase: "O governo se curva." |

**Ator: Pastores**

### ATOR-034 — O Pastor Pede Verbas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Pastor pede verbas |
| **Modo** | Ator (Pastores) |
| **Cor** | Preto |
| **Problema** | O Pastor pede verbas para templos. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "O Estado é laico." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Caixa` -20, `Capital Político` +15, `Integridade` -10 |
| **Consequência Direita** | "O Estado financia a fé." |
| **Aprendizado** | Frase: "O Estado financia a fé." |

### ATOR-035 — O Pastor Faz Pânico Moral

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Pastor faz pânico moral |
| **Modo** | Ator (Pastores) |
| **Cor** | Preto |
| **Problema** | O Pastor faz pânico moral sobre 'ideologia de gênero'. |
| **Opção Esquerda** | Denunciar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A verdade é exposta." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "O pânico moral avança." |
| **Aprendizado** | Frase: "O pânico moral avança." |

### ATOR-036 — O Pastor Quer Censurar a TV

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Pastor quer censurar a TV |
| **Modo** | Ator (Pastores) |
| **Cor** | Preto |
| **Problema** | O Pastor quer censurar a TV pública. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -10 |
| **Consequência Esquerda** | "A TV é plural." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A TV é censurada." |
| **Aprendizado** | Frase: "A TV é censurada." |

**Ator: Sindicato dos Professores**

### ATOR-037 — O Professor Pede Aumento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Professor pede aumento |
| **Modo** | Ator (Sindicato dos Professores) |
| **Cor** | Roxo |
| **Problema** | O Professor pede aumento salarial e ameaça greve. |
| **Opção Esquerda** | Atender |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A educação valorizada." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A greve avança." |
| **Aprendizado** | Frase: "A greve avança." |

### ATOR-038 — O Professor Denuncia Sucateamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Professor denuncia sucateamento |
| **Modo** | Ator (Sindicato dos Professores) |
| **Cor** | Roxo |
| **Problema** | O Professor denuncia o sucateamento da educação. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Caixa` -10 |
| **Consequência Esquerda** | "A educação resiste." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A educação definha." |
| **Aprendizado** | Frase: "A educação definha." |

### ATOR-039 — O Professor Quer Liberdade de Cátedra

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Professor quer liberdade de cátedra |
| **Modo** | Ator (Sindicato dos Professores) |
| **Cor** | Roxo |
| **Problema** | O Professor quer liberdade de cátedra para discutir política. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A liberdade resiste." |
| **Opção Direita** | Proibir |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A censura avança." |
| **Aprendizado** | Frase: "A censura avança." |

**Ator: Profissionais da Saúde**

### ATOR-040 — O Profissional Denuncia Falta de Leitos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Profissional denuncia falta de leitos |
| **Modo** | Ator (Profissionais da Saúde) |
| **Cor** | Vermelho |
| **Problema** | O Profissional da Saúde denuncia a falta de leitos e insumos. |
| **Opção Esquerda** | Investir |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A saúde melhora." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A saúde piora." |
| **Aprendizado** | Frase: "A saúde piora." |

### ATOR-041 — O Profissional Quer Revogar Privatização

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Profissional quer revogar privatização |
| **Modo** | Ator (Profissionais da Saúde) |
| **Cor** | Vermelho |
| **Problema** | O Profissional quer revogar a privatização dos hospitais. |
| **Opção Esquerda** | Revogar |
| **Efeitos Esquerda** | `Dignidade` +10, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O SUS resiste." |
| **Opção Direita** | Manter |
| **Efeitos Direita** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A privatização continua." |
| **Aprendizado** | Frase: "A privatização continua." |

### ATOR-042 — O Profissional Pede Mais Contratações

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Profissional pede mais contratações |
| **Modo** | Ator (Profissionais da Saúde) |
| **Cor** | Vermelho |
| **Problema** | O Profissional da Saúde pede mais contratações. |
| **Opção Esquerda** | Contratar |
| **Efeitos Esquerda** | `Dignidade` +10, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A saúde melhora." |
| **Opção Direita** | Não contratar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A saúde piora." |
| **Aprendizado** | Frase: "A saúde piora." |

**Ator: Líder Sindical**

### ATOR-043 — O Líder Sindical Pede Aumento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Líder Sindical pede aumento |
| **Modo** | Ator (Líder Sindical) |
| **Cor** | Vermelho |
| **Problema** | O Líder Sindical pede aumento real do salário mínimo. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Legitimidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O trabalhador ganha mais." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O trabalhador ganha menos." |
| **Aprendizado** | Frase: "O trabalhador ganha menos." |

### ATOR-044 — O Líder Sindical Convoca Greve

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Líder Sindical convoca greve |
| **Modo** | Ator (Líder Sindical) |
| **Cor** | Vermelho |
| **Problema** | O Líder Sindical convoca greve geral contra o governo. |
| **Opção Esquerda** | Negociar |
| **Efeitos Esquerda** | `Caixa` -15, `Legitimidade` +10, `Integridade` +5 |
| **Consequência Esquerda** | "A greve recua." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Legitimidade` -15, `Caixa` +5, `Integridade` -5 |
| **Consequência Direita** | "A greve avança." |
| **Aprendizado** | Frase: "A greve avança." |

### ATOR-045 — O Líder Sindical Pede Fim da Escala 6x1

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Líder Sindical pede fim da escala 6x1 |
| **Modo** | Ator (Líder Sindical) |
| **Cor** | Vermelho |
| **Problema** | O Líder Sindical pede o fim da escala 6x1. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O trabalhador descansa." |
| **Opção Direita** | Bloquear |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O trabalhador continua escravizado." |
| **Aprendizado** | Frase: "O trabalhador continua escravizado." |

**Ator: MTST**

### ATOR-046 — O MTST Ocupa um Terreno Vazio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O MTST ocupa um terreno vazio |
| **Modo** | Ator (MTST) |
| **Cor** | Roxo |
| **Problema** | O MTST ocupa um terreno vazio em uma área nobre. |
| **Opção Esquerda** | Dialogar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O diálogo avança." |
| **Opção Direita** | Despejar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A violência avança." |
| **Aprendizado** | Frase: "A violência avança." |

### ATOR-047 — O MTST Denuncia Despejo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O MTST denuncia despejo |
| **Modo** | Ator (MTST) |
| **Cor** | Roxo |
| **Problema** | O MTST denuncia um despejo violento. |
| **Opção Esquerda** | Investigar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A justiça é feita." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A violência continua." |
| **Aprendizado** | Frase: "A violência continua." |

### ATOR-048 — O MTST Pede Regularização

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O MTST pede regularização |
| **Modo** | Ator (MTST) |
| **Cor** | Roxo |
| **Problema** | O MTST pede a regularização fundiária de uma ocupação. |
| **Opção Esquerda** | Regularizar |
| **Efeitos Esquerda** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A moradia é garantida." |
| **Opção Direita** | Negar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A moradia é negada." |
| **Aprendizado** | Frase: "A moradia é negada." |

**Ator: MST**

### ATOR-049 — O MST Ocupa uma Fazenda

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O MST ocupa uma fazenda |
| **Modo** | Ator (MST) |
| **Cor** | Roxo |
| **Problema** | O MST ocupa uma fazenda improdutiva. |
| **Opção Esquerda** | Assentar |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Capital Político` -15, `Integridade` +5 |
| **Consequência Esquerda** | "A terra é repartida." |
| **Opção Direita** | Despejar |
| **Efeitos Direita** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A violência avança." |
| **Aprendizado** | Frase: "A violência avança." |

### ATOR-050 — O MST Pede Assentamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O MST pede assentamento |
| **Modo** | Ator (MST) |
| **Cor** | Roxo |
| **Problema** | O MST pede a criação de um assentamento. |
| **Opção Esquerda** | Criar |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A reforma agrária avança." |
| **Opção Direita** | Negar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "A reforma agrária para." |
| **Aprendizado** | Frase: "A reforma agrária para." |

### ATOR-051 — O MST Quer Produzir Alimentos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O MST quer produzir alimentos |
| **Modo** | Ator (MST) |
| **Cor** | Roxo |
| **Problema** | O MST quer produzir alimentos para a cidade. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Caixa` -5, `Integridade` +5 |
| **Consequência Esquerda** | "A comida chega à mesa." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -5, `Integridade` -5 |
| **Consequência Direita** | "A comida não chega." |
| **Aprendizado** | Frase: "A comida não chega." |

**Ator: Movimentos Ambientais**

### ATOR-052 — O Ambientalista Denuncia Desmatamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Ambientalista denuncia desmatamento |
| **Modo** | Ator (Movimentos Ambientais) |
| **Cor** | Verde |
| **Problema** | O Ambientalista denuncia o desmatamento acelerado na Amazônia. |
| **Opção Esquerda** | Investigar |
| **Efeitos Esquerda** | `Soberania` +10, `Dignidade` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O desmatamento recua." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "O desmatamento avança." |
| **Aprendizado** | Frase: "O desmatamento avança." |

### ATOR-053 — O Ambientalista Denuncia Garimpo Ilegal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Ambientalista denuncia garimpo ilegal |
| **Modo** | Ator (Movimentos Ambientais) |
| **Cor** | Verde |
| **Problema** | O Ambientalista denuncia garimpo ilegal em terra indígena. |
| **Opção Esquerda** | Intervir |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Caixa` -15, `Integridade` +5 |
| **Consequência Esquerda** | "O garimpo recua." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Caixa` +5, `Dignidade` -15, `Integridade` -5 |
| **Consequência Direita** | "O garimpo avança." |
| **Aprendizado** | Frase: "O garimpo avança." |

### ATOR-054 — O Ambientalista Denuncia Agrotóxico

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Ambientalista denuncia agrotóxico |
| **Modo** | Ator (Movimentos Ambientais) |
| **Cor** | Verde |
| **Problema** | O Ambientalista denuncia o uso excessivo de agrotóxicos. |
| **Opção Esquerda** | Investigar |
| **Efeitos Esquerda** | `Dignidade` +10, `Soberania` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "O veneno recua." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência Direita** | "O veneno avança." |
| **Aprendizado** | Frase: "O veneno avança." |

**Ator: Artista Engajado**

### ATOR-055 — O Artista Quer Financiamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Artista quer financiamento |
| **Modo** | Ator (Artista Engajado) |
| **Cor** | Roxo |
| **Problema** | O Artista quer financiamento para uma peça crítica ao governo. |
| **Opção Esquerda** | Financiar |
| **Efeitos Esquerda** | `Consciência` +10, `Paixão Nacional` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A arte resiste." |
| **Opção Direita** | Censurar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A arte é silenciada." |
| **Aprendizado** | Frase: "A arte é silenciada." |

### ATOR-056 — O Artista Denuncia Destruição Ambiental

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Artista denuncia destruição ambiental |
| **Modo** | Ator (Artista Engajado) |
| **Cor** | Verde |
| **Problema** | O Artista denuncia a destruição ambiental em uma exposição. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Soberania` +5, `Capital Político` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A arte denuncia." |
| **Opção Direita** | Censurar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -5 |
| **Consequência Direita** | "A arte é censurada." |
| **Aprendizado** | Frase: "A arte é censurada." |

### ATOR-057 — O Artista Cria Festival Periférico

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Artista cria festival periférico |
| **Modo** | Ator (Artista Engajado) |
| **Cor** | Roxo |
| **Problema** | O Artista quer criar um festival de cultura periférica. |
| **Opção Esquerda** | Financiar |
| **Efeitos Esquerda** | `Consciência` +10, `Dignidade` +5, `Paixão Nacional` +5, `Caixa` -10, `Integridade` +5 |
| **Consequência Esquerda** | "A cultura periférica resiste." |
| **Opção Direita** | Não financiar |
| **Efeitos Direita** | `Caixa` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A cultura periférica resiste." |
| **Aprendizado** | Frase: "A cultura periférica é resistência." |

**Ator: Meta (Big Tech)**

### ATOR-058 — A Meta Oferece Alcance

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Meta oferece alcance |
| **Modo** | Ator (Meta (Big Tech)) |
| **Cor** | Preto |
| **Problema** | A Meta oferece alcance em troca de desregulamentação. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A soberania digital resiste." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Capital Político` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A soberania digital é entregue." |
| **Aprendizado** | Frase: "A soberania digital é entregue." |

### ATOR-059 — A Meta Derruba Perfil de Jornalista

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Meta derruba perfil de jornalista |
| **Modo** | Ator (Meta (Big Tech)) |
| **Cor** | Preto |
| **Problema** | A Meta derruba o perfil de um jornalista independente. |
| **Opção Esquerda** | Intervir |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -10 |
| **Consequência Esquerda** | "A censura recua." |
| **Opção Direita** | Não intervir |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A censura avança." |
| **Aprendizado** | Frase: "A censura avança." |

### ATOR-060 — A Meta Financia Campanha

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Meta financia campanha |
| **Modo** | Ator (Meta (Big Tech)) |
| **Cor** | Preto |
| **Problema** | A Meta financia a campanha em troca de favores. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A política é limpa." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Caixa` +20, `Capital Político` +10, `Integridade` -15 |
| **Consequência Direita** | "A corrupção se instala." |
| **Aprendizado** | Frase: "A corrupção se instala." |

**Ator: Impérios Geopolíticos**

### ATOR-061 — A China Oferece Acordo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A China oferece acordo |
| **Modo** | Ator (Impérios Geopolíticos) |
| **Cor** | Azul |
| **Problema** | A China oferece um acordo comercial sem exigências políticas. |
| **Opção Esquerda** | Aceitar |
| **Efeitos Esquerda** | `Caixa` +15, `Soberania` +5, `Integridade` +5 |
| **Consequência Esquerda** | "O acordo é fechado." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Soberania` -10, `Caixa` -10, `Integridade` -5 |
| **Consequência Direita** | "O Brasil perde." |
| **Aprendizado** | Frase: "O Brasil perde." |

### ATOR-062 — Os EUA Ameaçam Sanções

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Os EUA ameaçam sanções |
| **Modo** | Ator (Impérios Geopolíticos) |
| **Cor** | Azul |
| **Problema** | Os EUA ameaçam sanções se o Brasil não se alinhar. |
| **Opção Esquerda** | Resistir |
| **Efeitos Esquerda** | `Soberania` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A soberania resiste." |
| **Opção Direita** | Ceder |
| **Efeitos Direita** | `Capital Político` +5, `Soberania` -10, `Integridade` -10 |
| **Consequência Direita** | "A subordinação avança." |
| **Aprendizado** | Frase: "A subordinação avança." |

### ATOR-063 — A China Quer Comprar Terras

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A China quer comprar terras |
| **Modo** | Ator (Impérios Geopolíticos) |
| **Cor** | Verde |
| **Problema** | A China quer comprar terras brasileiras para produção de soja. |
| **Opção Esquerda** | Limitar |
| **Efeitos Esquerda** | `Soberania` +10, `Capital Político` -5, `Integridade` +5 |
| **Consequência Esquerda** | "A soberania alimentar resiste." |
| **Opção Direita** | Permitir |
| **Efeitos Direita** | `Caixa` +15, `Soberania` -10, `Integridade` -5 |
| **Consequência Direita** | "A terra é vendida." |
| **Aprendizado** | Frase: "A terra é vendida." |

**Ator: Coach Digital**

### ATOR-064 — O Coach Oferece Apoio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Coach oferece apoio |
| **Modo** | Ator (Coach Digital) |
| **Cor** | Preto |
| **Problema** | O Coach oferece apoio em troca de isenção fiscal para seus cursos. |
| **Opção Esquerda** | Recusar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência Esquerda** | "A política é limpa." |
| **Opção Direita** | Aceitar |
| **Efeitos Direita** | `Legitimidade` +10, `Capital Político` +10, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A meritocracia avança." |
| **Aprendizado** | Frase: "A meritocracia avança." |

### ATOR-065 — O Coach Faz Campanha contra o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Coach faz campanha contra o governo |
| **Modo** | Ator (Coach Digital) |
| **Cor** | Preto |
| **Problema** | O Coach faz campanha contra o governo. |
| **Opção Esquerda** | Dialogar |
| **Efeitos Esquerda** | `Consciência` +5, `Integridade` +5, `Capital Político` -5 |
| **Consequência Esquerda** | "O diálogo avança." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A desinformação avança." |
| **Aprendizado** | Frase: "A desinformação avança." |

### ATOR-066 — O Coach É Financiado por Bets

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Coach é financiado por bets |
| **Modo** | Ator (Coach Digital) |
| **Cor** | Preto |
| **Problema** | O Coach é financiado por bets e promove jogos de azar. |
| **Opção Esquerda** | Proibir |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -15 |
| **Consequência Esquerda** | "A jogatina recua." |
| **Opção Direita** | Permitir |
| **Efeitos Direita** | `Caixa` +10, `Capital Político` +5, `Consciência` -15, `Integridade` -10 |
| **Consequência Direita** | "A jogatina avança." |
| **Aprendizado** | Frase: "A jogatina avança." |

**Ator: Jornalista Independente**

### ATOR-067 — O Jornalista Denuncia Escândalo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Jornalista denuncia escândalo |
| **Modo** | Ator (Jornalista Independente) |
| **Cor** | Roxo |
| **Problema** | O Jornalista denuncia um escândalo de corrupção do governo. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +15, `Capital Político` -15 |
| **Consequência Esquerda** | "A verdade aparece." |
| **Opção Direita** | Censurar |
| **Efeitos Direita** | `Capital Político` +10, `Consciência` -15, `Integridade` -15 |
| **Consequência Direita** | "A imprensa é calada." |
| **Aprendizado** | Frase: "A imprensa é calada." |

### ATOR-068 — O Jornalista É Processado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Jornalista é processado |
| **Modo** | Ator (Jornalista Independente) |
| **Cor** | Roxo |
| **Problema** | O Jornalista é processado por um político. Ele pede apoio. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -10 |
| **Consequência Esquerda** | "A liberdade de imprensa resiste." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A censura judicial avança." |
| **Aprendizado** | Frase: "A censura judicial avança." |

### ATOR-069 — O Jornalista É Ameaçado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Jornalista é ameaçado |
| **Modo** | Ator (Jornalista Independente) |
| **Cor** | Roxo |
| **Problema** | O Jornalista é ameaçado de morte. Ele pede proteção. |
| **Opção Esquerda** | Proteger |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Segurança` +5, `Caixa` -10 |
| **Consequência Esquerda** | "A imprensa é protegida." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A imprensa é ameaçada." |
| **Aprendizado** | Frase: "A imprensa é ameaçada." |

**Ator: Influenciador Progressista**

### ATOR-070 — O Influenciador Oferece Apoio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Influenciador oferece apoio |
| **Modo** | Ator (Influenciador Progressista) |
| **Cor** | Roxo |
| **Problema** | O Influenciador Progressista oferece apoio em troca de financiamento. |
| **Opção Esquerda** | Financiar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Caixa` -10 |
| **Consequência Esquerda** | "A contra-narrativa avança." |
| **Opção Direita** | Recusar |
| **Efeitos Direita** | `Caixa` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência Direita** | "A contra-narrativa recua." |
| **Aprendizado** | Frase: "A contra-narrativa recua." |

### ATOR-071 — O Influenciador Denuncia Fake News

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Influenciador denuncia fake news |
| **Modo** | Ator (Influenciador Progressista) |
| **Cor** | Roxo |
| **Problema** | O Influenciador denuncia uma fake news do governo. |
| **Opção Esquerda** | Apoiar |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +15, `Capital Político` -10 |
| **Consequência Esquerda** | "A verdade aparece." |
| **Opção Direita** | Ignorar |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -15 |
| **Consequência Direita** | "A mentira vence." |
| **Aprendizado** | Frase: "A mentira vence." |

### ATOR-072 — O Influenciador É Censurado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Influenciador é censurado |
| **Modo** | Ator (Influenciador Progressista) |
| **Cor** | Roxo |
| **Problema** | O Influenciador é censurado por uma plataforma. |
| **Opção Esquerda** | Intervir |
| **Efeitos Esquerda** | `Consciência` +10, `Integridade` +10, `Capital Político` -10 |
| **Consequência Esquerda** | "A censura recua." |
| **Opção Direita** | Não intervir |
| **Efeitos Direita** | `Capital Político` +5, `Consciência` -10, `Integridade` -10 |
| **Consequência Direita** | "A censura avança." |
| **Aprendizado** | Frase: "A censura avança." |

---

## 17.14 — Resumo do Roteiro

| Tipo | Previstas | Roteirizadas | Status |
| :--- | :--- | :--- | :--- |
| **Institucionais** | 200 | 144 | INST-001 a INST-140 completas; Impeachment, Judiciário e Influenciador só com exemplos (INST-141, 142, 161, 181) |
| **Temáticas** | 70 | 70 | Completas (7 temas × 10) |
| **Atores** | 70 | 72 | Completas (24 atores × 3); ver divergência em 17.01.2 |
| **Total** | **340** | **286** | Em desenvolvimento |

**Observação:** faltam 56 cartas institucionais (INST-143 a 160, 162 a 180, 182 a 200).

---

## 17.15 — Referências

- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- ICON GAMES. *Senhor Presidente*. 2016.
- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.

---

**Última atualização:** Outubro de 2026
**Versão:** 1.1 (em desenvolvimento)

