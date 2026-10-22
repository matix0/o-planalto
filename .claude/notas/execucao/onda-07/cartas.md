# Onda 7 do P-015 — Orçamento (INST-029 a INST-038) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo:** D-196 (sem pesquisa na web)
**Status:** CONCLUÍDO (2026-10-22) — rascunho para o PSI, o QA e o PO; nada gravado no doc 17. Todas as cartas ficam "provisório (DP-pendente)".
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1 (`:11-41`). Notas do GD abaixo do `---` de cada carta.

## Progresso

- [x] Brief D-196, kit, Onda 5 e 6 (formato e mapa do Orçamento), doc 12 MOD-002 (`:121-168`)
- [x] Plano da onda
- [x] INST-029 a INST-038 escritas
- [x] Check do script (0 erros, 0 avisos de estilo; `box` sai 0)
- [x] Aprendizados (md e json, pendentes D-196)
- [x] Relatório, propostas, dúvidas ao PSI

## Plano e convenções

- Uma ideia de orçamento por carta, fora das já usadas (021 onde cortar, 022 renegociar, 023-028 na Onda 6): fila e dotação (029), preço congelado/tabela (030), obra-vitrine × muitas pequenas (031), emergência × investimento permanente (032), vinculação ao mínimo (033), juros e autonomia do Banco Central (034), mesma verba, modelos diferentes (035), custo do encarceramento (036), inauguração × conclusão (037), renúncia fiscal (038).
- Eixos: gasto público = Eco −1; regra fiscal e mercado = Eco +1 (Onda 6). Diplomacia só com ator de fora (031, 038). Punir = Soc −1, Est −1 (Onda 5).
- Nenhum número nem dado no texto ao jogador; nenhuma pessoa real.

| ID | Título | Ideia | Cores A / B | Evento | Ano mín. |
| :--- | :--- | :--- | :--- | :--- | :--- |
| INST-029 | Fila do Bolsa Família | Dotação e remanejamento | Vermelho / Azul | A | 1 |
| INST-030 | Tabela do SUS | Subfinanciamento por tabela | Vermelho / Laranja | — | 1 |
| INST-031 | Trem-bala ou ônibus | Prioridade de investimento | Amarelo / Roxo | A | 1 |
| INST-032 | Carro-pipa ou cisterna | Emergência × permanente | Verde / Amarelo | A | 1 |
| INST-033 | Benefícios ligados ao mínimo | Vinculação de despesa | Vermelho / Azul | — | 2 |
| INST-034 | Juros do Banco Central | Juros da dívida e autonomia do BC | Vermelho / Laranja | A | 2 |
| INST-035 | CAPS ou internação | Modelo de cuidado | Roxo / Amarelo | — | 2 |
| INST-036 | Presídios lotados | Custo do encarceramento | Preto / Vermelho | A | 2 |
| INST-037 | Creches inacabadas | Inauguração × conclusão | Azul / Amarelo | — | 2 |
| INST-038 | Isenção das montadoras | Renúncia fiscal | Vermelho / Laranja | — | 1 |

---

### INST-029 — Ampliação do Bolsa Família

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fila do Bolsa Família |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Famílias que cumprem as regras esperam na fila do Bolsa Família. Zerar a fila pede verba extra, tirada de outra área. |
| **Opção A** | Zerar a fila |
| **Efeitos A** | `Dignidade` +20, `Caixa` -15, `Capital Político` -5 |
| **Consequência A** | "As famílias entram no programa. Outros ministérios perdem verba e reclamam." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-016` +1, `ACT-007` -1 |
| **Evento A** | "O comércio dos bairros pobres vende mais" · atraso 2 · `Caixa` +5, `Dignidade` +5 |
| **Opção B** | Manter a fila |
| **Efeitos B** | `Caixa` +10, `Dignidade` -15, `Legitimidade` -5 |
| **Consequência B** | "As contas fecham. Na fila, as famílias seguem sem renda." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-007` +1, `ACT-006` +1, `ACT-016` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-029 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-029):** Mecanismo: um programa social só atende quem cabe na dotação do orçamento; zerar a fila exige crédito extra, tirado de outra área (remanejamento). Evento A: dinheiro de transferência volta como consumo local (efeito multiplicador, pista). Cor A Vermelho (assistência social, `docs/10_GUIA_DE_ESTILO_E_TOM.md:256`); B Azul (estabilidade, `:257`). Não repete a INST-021 (onde cortar) nem a 023 (regra do teto).

### INST-030 — Verba para o SUS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Tabela do SUS |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Hospitais que atendem pelo SUS recebem por uma tabela sem reajuste há anos. Muitos fecham leitos. Reajustar custa caro. |
| **Opção A** | Reajustar a tabela |
| **Efeitos A** | `Dignidade` +15, `Caixa` -15 |
| **Consequência A** | "Os leitos reabrem. A equipe econômica pede corte em outra área." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-014` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Comprar vagas privadas |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -5, `Caixa` -10 |
| **Consequência B** | "As filas andam rápido. Os hospitais do SUS seguem sem verba." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-002` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-030 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-030):** Subfinanciamento por congelamento de preço (tabela), não por corte visível. Não repete a INST-017 (iniciativa popular por mais verba) nem a 021. B Laranja (contratação privada, `docs/10_GUIA_DE_ESTILO_E_TOM.md:261`). "Há anos" é vago de propósito; a defasagem vai para a pista.

### INST-031 — Trem-bala

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Trem-bala ou ônibus |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-003` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Roxo |
| **Problema** | Uma potência estrangeira oferece crédito para um trem-bala entre duas capitais. A mesma verba renovaria os ônibus das periferias. |
| **Opção A** | Fazer o trem-bala |
| **Efeitos A** | `Capital Político` +10, `Soberania` -5, `Caixa` -10 |
| **Consequência A** | "A obra vira vitrine do governo. A dívida com a potência cresce." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-003` +1, `ACT-021` +1 |
| **Evento A** | "A obra atrasa e o custo sobe" · atraso 2 · `Caixa` -10, `Integridade` -5 |
| **Opção B** | Ônibus na periferia |
| **Efeitos B** | `Dignidade` +15, `Capital Político` -10, `Caixa` -5 |
| **Consequência B** | "Corredores de ônibus chegam aos bairros. Ninguém inaugura nada vistoso." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-016` +1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-031 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-031):** Prioridade de investimento: obra-vitrine × muitas obras pequenas. Diplomacia pela convenção do kit §4 (aceitar crédito da potência = +1, `ACT-021` +1; recusar = −1). Evento A: obras grandes estouram prazo e custo (pista). Cor A Amarelo (negociação), B Roxo (movimento por moradia e transporte, `docs/10_GUIA_DE_ESTILO_E_TOM.md:260`).

### INST-032 — Cisternas no Nordeste

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Carro-pipa ou cisterna |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Amarelo |
| **Problema** | A seca volta ao sertão. Deputados pedem carros-pipa, que eles mesmos distribuem. Cisternas resolvem por anos, mas demoram. |
| **Opção A** | Construir cisternas |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "As cisternas ficam prontas devagar. Os deputados perdem o carro-pipa." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-017` +1, `ACT-011` -1 |
| **Evento A** | "A seca seguinte castiga menos" · atraso 2 · `Dignidade` +10 |
| **Opção B** | Mandar carros-pipa |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Integridade` -5 |
| **Consequência B** | "A água chega rápido, com o nome dos deputados no caminhão." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-017` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-032 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-032):** Gasto emergencial e recorrente × investimento permanente; o carro-pipa vira moeda política (clientelismo). Cor A Verde (meio ambiente, convivência com o semiárido, `docs/10_GUIA_DE_ESTILO_E_TOM.md:258`): única Verde da onda, com custo de Capital Político. A INST-039 do banco (Verba para cisternas) repete o tema: proposta ao PO nº 2.

### INST-033 — Corte no Salário Mínimo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Benefícios ligados ao mínimo |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Aposentadorias e benefícios sobem junto com o salário mínimo. A equipe econômica quer soltar um do outro para conter o gasto. |
| **Opção A** | Manter a ligação |
| **Efeitos A** | `Dignidade` +10, `Caixa` -15 |
| **Consequência A** | "Os aposentados mantêm o ganho. O mercado vê o gasto subir todo ano." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-015` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Desvincular |
| **Efeitos B** | `Caixa` +15, `Dignidade` -15, `Legitimidade` -5 |
| **Consequência B** | "O gasto cresce menos. Os benefícios ficam para trás do salário." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-006` +1, `ACT-007` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-033 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-033):** Segue a proposta nº 3 (A) da Onda 6 (`.claude/notas/execucao/onda-06/cartas.md:380`): a INST-020 já tem o salário mínimo pela votação; aqui o mecanismo é a vinculação de despesa obrigatória. Ano 2: carta ligada a Dignidade (A). Cabeçalho do banco mantido ("Corte"), mas o salário não pode cair: proposta ao PO nº 1.

### INST-034 — Pagamento da Dívida

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Juros do Banco Central |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-002` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Os juros altos encarecem a dívida pública e travam empregos. O Banco Central, que é autônomo, não quer baixar. |
| **Opção A** | Cobrar o Banco Central |
| **Efeitos A** | `Capital Político` +10, `Caixa` -10 |
| **Consequência A** | "Sua base aplaude. O mercado lê ameaça à autonomia do banco." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-015` +1, `ACT-002` -1, `ACT-006` -1 |
| **Evento A** | "O dólar sobe com a briga" · atraso 1 · `Caixa` -10, `Soberania` -5 |
| **Opção B** | Respeitar a autonomia |
| **Efeitos B** | `Caixa` +10, `Dignidade` -10, `Capital Político` -5 |
| **Consequência B** | "Os juros seguem altos. O emprego demora a voltar." |
| **Eixo B** | [+1, 0, 0, +1] |
| **Atores B** | `ACT-006` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-034 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-034):** Dívida e credores pelo custo dos juros, que o presidente não controla (autonomia do Banco Central). A Onda 6 sugeria a LDO aqui; troquei porque a meta fiscal repetiria a INST-023 (teto): proposta ao PO nº 3. Eixo B Est +1 (instituição independente; alternativa 0). B Laranja (`docs/10_GUIA_DE_ESTILO_E_TOM.md:261`).

### INST-035 — CAPS e Saúde Mental

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | CAPS ou internação |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Há verba para cuidar de quem sofre com álcool e drogas. Os CAPS tratam em liberdade; as comunidades terapêuticas internam. |
| **Opção A** | Ampliar os CAPS |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10 |
| **Consequência A** | "A rede cresce perto de casa. Pastores dizem que você larga as famílias." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-014` +1, `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Pagar as comunidades |
| **Efeitos B** | `Capital Político` +10, `Integridade` -5, `Dignidade` -5 |
| **Consequência B** | "Igrejas recebem a verba. Fiscais pedem regras para as internações." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-012` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-035 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-035):** Escolha política dentro da mesma verba: rede aberta (luta antimanicomial) × internação em entidades, muitas religiosas. Ano 2: carta ligada a Dignidade e Consciência. Sociedade ±1. Cor A Roxo (movimento antimanicomial), B Amarelo (negociação com a bancada religiosa). Dúvida ao PSI nº 1.

### INST-036 — Construção de Presídios

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Presídios lotados |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Vermelho |
| **Problema** | Os presídios estão lotados. Parte da Câmara quer verba para novas vagas; outra parte, penas fora da prisão para crimes leves. |
| **Opção A** | Construir presídios |
| **Efeitos A** | `Segurança` +10, `Capital Político` +5, `Caixa` -15 |
| **Consequência A** | "As obras começam, e as prisões seguem no mesmo ritmo." |
| **Eixo A** | [0, 0, -1, -1] |
| **Atores A** | `ACT-003` +1, `ACT-011` +1 |
| **Evento A** | "Os novos presídios também lotam" · atraso 2 · `Segurança` -10, `Dignidade` -5 |
| **Opção B** | Penas alternativas |
| **Efeitos B** | `Dignidade` +10, `Caixa` +5, `Capital Político` -10, `Segurança` -5 |
| **Consequência B** | "Menos gente entra na cadeia. A oposição diz que você solta criminosos." |
| **Eixo B** | [0, 0, +1, +1] |
| **Atores B** | `ACT-011` -1, `ACT-014` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-036 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-036):** Custo do encarceramento como escolha de gasto. Eixo pela convenção da Onda 5 (punir mais = Soc −1, Est −1). Ano 2: carta ligada a Segurança (A). Evento A: vaga nova não resolve se a porta de entrada não muda (pista). Cor A Preto (militarização e punição, `docs/10_GUIA_DE_ESTILO_E_TOM.md:262`).

### INST-037 — Creches

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Creches inacabadas |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Há creches com obra parada em várias cidades. Terminar não rende foto. Um programa novo, com a sua marca, rende. |
| **Opção A** | Terminar as obras |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "As creches abrem sem festa. Mães voltam a trabalhar." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-013` +1, `ACT-003` +1 |
| **Evento A** | — |
| **Opção B** | Lançar programa novo |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` +5, `Caixa` -10, `Integridade` -5 |
| **Consequência B** | "A festa de lançamento lota. As obras antigas seguem paradas." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-037 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-037):** Obra parada e incentivo de inaugurar: o orçamento premia o novo, não a conclusão. Eixo zero nas duas (gestão, sem conteúdo ideológico, como a INST-007). Ano 2: carta ligada a Dignidade e Integridade. Cor A Azul (gestão), B Amarelo.

### INST-038 — Isenção para Montadoras

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Isenção das montadoras |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Montadoras estrangeiras pagam menos imposto há anos e pedem renovação. Ameaçam fechar fábricas se o benefício acabar. |
| **Opção A** | Cortar a isenção |
| **Efeitos A** | `Caixa` +15, `Dignidade` -5, `Capital Político` -10 |
| **Consequência A** | "O Tesouro arrecada mais. Uma fábrica anuncia demissões." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-004` -1, `ACT-015` -1 |
| **Evento A** | — |
| **Opção B** | Renovar a isenção |
| **Efeitos B** | `Capital Político` +5, `Dignidade` +5, `Caixa` -15 |
| **Consequência B** | "As fábricas ficam. O imposto que não entra faz falta na saúde." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-015` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-038 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-038):** Tema trocado (o banco repete a cultura da INST-028): renúncia fiscal é gasto que não aparece no orçamento. Proposta ao PO nº 4. Diplomacia: empresa de fora (kit §4: manter benefício = abertura +1). Sindicato e patrão do mesmo lado nas duas opções.


## Relatório do script (`--wave-report --style`)

10 cartas, 0 erros, 0 avisos de estilo. Eventos 5 de 20 (25%). Eixos ≠ 0: Eco 55%, Dip 20%, Soc 20%, Est 15%. Todas as 7 cores com saldo negativo em algum medidor (Verde: Capital Político −10; Preto: Caixa −15). Carta ligada Ano 2-4: Dignidade 4, Segurança 1, Consciência 1, Integridade 1, Legitimidade 1. Orçamento passa a 18 de 20 (faltam 039 e 040).

## Propostas ao PO (provisórias)

1. **INST-033:** salário mínimo vira "vinculação dos benefícios ao mínimo" (proposta nº 3 da Onda 6). (A) Aceitar e trocar o cabeçalho para "Vinculação ao Mínimo" — recomendada. (B) Manter "Corte no salário mínimo" (a Constituição veda reduzir).
2. **INST-039 (Verba para cisternas)** repete a 032. (A) Trocar a 039 por "LDO e meta fiscal" ou "restos a pagar" — recomendada. (B) Manter com ângulo de manutenção.
3. **INST-034:** juros e autonomia do Banco Central no lugar da LDO sugerida pela Onda 6. (A) Aceitar — recomendada (LDO repetiria o teto da 023). (B) Voltar à LDO.
4. **INST-038:** tema trocado de "Corte na cultura (2)" (repete a 028) para renúncia fiscal das montadoras. (A) Aceitar — recomendada. (B) Cultura com outro ângulo (Lei Rouanet como renúncia).
5. Eixos de fronteira: 034 B Est +1 (alternativa 0); 032 B e 037 com eixo zero; 031 Dip pela convenção do crédito da potência.

## Dúvidas para o PSI

1. INST-035: "Pastores dizem que você larga as famílias" e "Igrejas recebem a verba": risco de estereótipo religioso; o tema opõe CAPS a entidades em grande parte religiosas.
2. INST-036: "solta criminosos" (voz da oposição); "As obras começam, e as prisões seguem no mesmo ritmo" é claro? Tema próximo de encarceramento em massa (racismo, aviso de conteúdo) sem citá-lo.
3. INST-032: "com o nome dos deputados no caminhão" generaliza deputados (clientelismo)?
4. INST-034: cobrar o Banco Central lê como ataque a instituição (Capital Político +10)? Evento "O dólar sobe com a briga" é afirmação empírica (pista).
5. INST-038: "Montadoras estrangeiras... ameaçam fechar fábricas": atribuir ameaça a setor sem nome está ok?
6. INST-029: "bairros pobres" no evento evita estereótipo de periferia?

## Autoconferência

Citações conferidas: `docs/12_FICHAS_DOS_MODOS.md:127` (o que ensina), `:152` e `:158` (banco 033 e 039), `docs/10_GUIA_DE_ESTILO_E_TOM.md:256-262` (cores), `.claude/notas/execucao/onda-06/cartas.md:380` (proposta nº 3 da Onda 6, salário mínimo). Higiene: script com `PYTHONDONTWRITEBYTECODE=1`; só `onda-07/` alterada; geradores no scratchpad.
