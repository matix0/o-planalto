# Onda 2 do P-015 — modo Geopolítico (INST-063 a INST-072) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-20 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO (2026-10-20) — rascunho para o PSI, o QA e o PO; nada gravado no doc 17
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1 (DP-014). Conferência: `python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-02/cartas.md --no-learning --wave-report`

## Progresso

- [x] Lidos: `gestao/prompts/criacao-cartas.md` (inteiro), `gestao/decisoes-provisorias.md` (DP-011 a DP-017), doc 17 §17.01.1 e §17.05, GDD 05 (inteiro), 07:16-58, 08:18-28, 06:24-31, 04 (inteiro), doc 10 :96-270, :485-520, :660-691, doc 12 (MOD-004 e §12.3.3), doc 11 (fichas), doc 03 §03.02, §03.07, §03.12, §03.13, doc 18 §18.05 e §18.14 (APR-063..080), cartas do P-003 (`origin/claude/eloquent-einstein-gez6rk`), `jogo/tools/cards_doc.py`
- [x] Cartas INST-063 a INST-072 (uma por vez, abaixo)
- [x] Check do script com 0 erros (relatório no fim)
- [x] Aprendizados (`aprendizados.md`)
- [x] Autoconferência (12 citações) e dúvidas para o PSI (no fim)

## Convenções desta onda (propostas do GD)

- Diplomacia (`gdd/sistemas/04_eixo.md:22`, :29): − = autonomia nacional, controle interno ou projeto do BRICS ("BRICS conta como Nacionalismo"); + = abertura comercial, alinhamento a uma potência ou a instituição internacional, cooperação com vizinho. Mesma leitura das aprovadas INST-061 e INST-062 (`docs/17_ROTEIRO_DAS_CARTAS.md:366`, :373, :393, :399).
- `ACT-021` (Impérios Geopolíticos, um ator só para China e EUA, `docs/11_FICHAS_DOS_ATORES.md:484`): +1 quando o jogador cede à potência que faz o pedido; −1 quando recusa.
- Nenhum número nem dado no texto ao jogador: os fatos ficam na pista de dado do Aprendizado (D-091).

---

### INST-063 — Pressão dos EUA

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pressão dos EUA |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-021` |
| **Ano mínimo** | 1 |
| **Cor A** | Preto |
| **Cor B** | Amarelo |
| **Problema** | Os EUA pedem que o Brasil vete uma empresa chinesa no 5G. Alegam risco de espionagem. Sem ela, a rede fica mais cara. |
| **Opção A** | Vetar a empresa chinesa |
| **Efeitos A** | `Segurança` +10, `Caixa` -10, `Soberania` -5 |
| **Consequência A** | "A rede atrasa e fica mais cara. Os EUA aplaudem." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-021` +1, `ACT-008` +1 |
| **Evento A** | — |
| **Opção B** | Manter a empresa chinesa |
| **Efeitos B** | `Caixa` +10, `Dignidade` +5, `Segurança` -10 |
| **Consequência B** | "O 5G chega mais barato. Os EUA ameaçam rever a parceria." |
| **Eixo B** | [+1, -1, 0, 0] |
| **Atores B** | `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-063 (doc 18) |
| **Status** | provisório (DP-pendente) |

### INST-064 — Acordo com a China

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Acordo com a China |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Vermelho |
| **Problema** | A China oferece um contrato longo de compra de soja e minério. Em troca, quer tarifa zero para seus carros e máquinas. |
| **Opção A** | Fechar o acordo |
| **Efeitos A** | `Caixa` +20, `Capital Político` +5, `Soberania` -10 |
| **Consequência A** | "O agro vende mais. A indústria perde espaço para os importados." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-021` +1, `ACT-004` -1 |
| **Evento A** | "Fábricas fecham diante dos importados chineses." · atraso 2 · `Dignidade` -10, `Soberania` -5 |
| **Opção B** | Proteger a indústria |
| **Efeitos B** | `Soberania` +10, `Dignidade` +5, `Caixa` -10, `Capital Político` -10 |
| **Consequência B** | "As fábricas mantêm os empregos. O agro reclama no Congresso." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-001` -1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-064 (doc 18) |
| **Status** | provisório (DP-pendente) |

### INST-065 — Empréstimo do FMI

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Empréstimo do FMI |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Roxo |
| **Problema** | A crise seca o caixa do governo. O FMI oferece um empréstimo, mas exige corte de gastos e venda de estatais. |
| **Opção A** | Aceitar o empréstimo |
| **Efeitos A** | `Caixa` +25, `Soberania` -10, `Dignidade` -5 |
| **Consequência A** | "O dinheiro chega. Técnicos do FMI passam a revisar suas contas." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-007` +1, `ACT-006` +1 |
| **Evento A** | "O FMI cobra o corte combinado no orçamento." · atraso 1 · `Dignidade` -10, `Legitimidade` -5 |
| **Opção B** | Recusar o FMI |
| **Efeitos B** | `Soberania` +10, `Caixa` -15, `Dignidade` -5 |
| **Consequência B** | "O dólar sobe. A crise continua sem dinheiro novo." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-007` -1, `ACT-006` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-065 (doc 18) |
| **Status** | provisório (DP-pendente) |

### INST-066 — Venda da Embraer

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Venda da Embraer |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Uma gigante estrangeira quer comprar a Embraer, que faz aviões civis e militares. Você tem poder de veto. |
| **Opção A** | Vetar a venda |
| **Efeitos A** | `Soberania` +10, `Segurança` +5, `Caixa` -10, `Dignidade` -5 |
| **Consequência A** | "A Embraer segue brasileira. Os acionistas perdem o negócio." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-008` +1, `ACT-002` -1 |
| **Evento A** | — |
| **Opção B** | Liberar a venda |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Soberania` -15, `Segurança` -5 |
| **Consequência B** | "A venda sai. A nova dona decide os projetos lá fora." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-002` +1, `ACT-008` -1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-066 (doc 18) |
| **Status** | provisório (DP-pendente) |

### INST-067 — Moeda Comum do BRICS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Moeda comum do BRICS |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Um sócio do BRICS defende uma moeda comum. O Brasil dependeria menos do dólar, mas deixaria de decidir os próprios juros. |
| **Opção A** | Apoiar a moeda comum |
| **Efeitos A** | `Caixa` +10, `Soberania` -10, `Legitimidade` -5 |
| **Consequência A** | "O comércio sai do dólar. Um banco do bloco passa a decidir seus juros." |
| **Eixo A** | [0, -1, 0, 0] |
| **Atores A** | `ACT-021` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Manter o real |
| **Efeitos B** | `Soberania` +5, `Caixa` -10 |
| **Consequência B** | "O real fica. O comércio segue em dólar." |
| **Eixo B** | [0, +1, 0, 0] |
| **Atores B** | `ACT-006` +1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-067 (doc 18) |
| **Status** | provisório (DP-pendente) |

### INST-068 — Envio de Tropas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Envio de tropas |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Amarelo |
| **Problema** | Uma potência aliada pede soldados brasileiros para uma guerra. Em troca, apoia uma vaga fixa do Brasil no Conselho de Segurança da ONU. |
| **Opção A** | Enviar os soldados |
| **Efeitos A** | `Caixa` +15, `Capital Político` +5, `Soberania` -10, `Legitimidade` -5 |
| **Consequência A** | "As tropas embarcam. Parte do país protesta contra a guerra." |
| **Eixo A** | [0, +2, 0, 0] |
| **Atores A** | `ACT-008` +1, `ACT-021` +1 |
| **Evento A** | "Soldados brasileiros morrem no conflito." · atraso 1 · `Legitimidade` -10, `Dignidade` -5 |
| **Opção B** | Recusar o pedido |
| **Efeitos B** | `Soberania` +10, `Legitimidade` +5, `Caixa` -10, `Segurança` -5 |
| **Consequência B** | "O Brasil fica fora da guerra. O aliado corta a ajuda militar." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-010` +1, `ACT-008` -1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-068 (doc 18) |
| **Status** | provisório (DP-pendente) |

### INST-069 — Corte de Fertilizantes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte de fertilizantes |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 2 |
| **Cor A** | Verde |
| **Cor B** | Roxo |
| **Problema** | Uma guerra corta o adubo importado. Uma mineradora quer extrair potássio em terra reivindicada por povos indígenas na Amazônia. |
| **Opção A** | Liberar a mina |
| **Efeitos A** | `Soberania` +15, `Dignidade` -10, `Integridade` -5 |
| **Consequência A** | "O potássio sai do chão, sem consulta. Povos indígenas vão à Justiça." |
| **Eixo A** | [+1, -1, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-018` -1 |
| **Evento A** | — |
| **Opção B** | Produzir adubo orgânico |
| **Efeitos B** | `Soberania` +5, `Caixa` -10, `Capital Político` -10 |
| **Consequência B** | "O agro reclama da demora. Cooperativas do campo começam a produzir." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-017` +1, `ACT-001` -1 |
| **Evento B** | "Cooperativas produzem adubo orgânico em escala." · atraso 2 · `Soberania` +10, `Dignidade` +5 |
| **Aprendizado** | APR-069 (doc 18) |
| **Status** | provisório (DP-pendente) |

### INST-070 — Preço do Petróleo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Preço do petróleo |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-009` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Vermelho |
| **Problema** | O barril de petróleo dispara no mundo. A Petrobras pode repassar a alta ou segurar o preço do diesel. |
| **Opção A** | Repassar o preço |
| **Efeitos A** | `Caixa` +15, `Dignidade` -10 |
| **Consequência A** | "O diesel sobe. O frete e a comida ficam mais caros." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-006` +1, `ACT-002` +1 |
| **Evento A** | "Caminhoneiros entram em greve e param o país." · atraso 1 · `Dignidade` -5, `Segurança` -5, `Legitimidade` -5 |
| **Opção B** | Segurar o diesel |
| **Efeitos B** | `Dignidade` +10, `Caixa` -15 |
| **Consequência B** | "O diesel fica estável. A Petrobras lucra menos e o Mercado reclama." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-009` +1, `ACT-006` -1, `ACT-002` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-070 (doc 18) |
| **Status** | provisório (DP-pendente) |

### INST-071 — Taxação das Big Techs

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxação das big techs |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-020` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Sua equipe propõe um imposto sobre o faturamento das big techs no Brasil. Os EUA ameaçam tarifas em resposta. |
| **Opção A** | Cobrar o imposto |
| **Efeitos A** | `Soberania` +10, `Caixa` +10, `Dignidade` -5, `Capital Político` -10 |
| **Consequência A** | "As big techs pagam. Os EUA anunciam tarifas sobre produtos do Brasil." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-020` -1, `ACT-021` -1 |
| **Evento A** | — |
| **Opção B** | Desistir do imposto |
| **Efeitos B** | `Caixa` +5, `Capital Político` +5, `Soberania` -10, `Legitimidade` -5 |
| **Consequência B** | "As tarifas não vêm. As big techs ficam sem o novo imposto." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-020` +1, `ACT-021` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-071 (doc 18) |
| **Status** | provisório (DP-pendente) |

### INST-072 — Energia de Itaipu

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Energia de Itaipu |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | O Paraguai pede um preço maior pela energia de Itaipu que vende ao Brasil. Pagar mais encarece a conta de luz. |
| **Opção A** | Aceitar o novo preço |
| **Efeitos A** | `Soberania` +5, `Integridade` +5, `Dignidade` -5, `Caixa` -5 |
| **Consequência A** | "O vizinho comemora. A conta de luz sobe no Brasil." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-010` +1, `ACT-004` -1 |
| **Evento A** | — |
| **Opção B** | Manter o preço atual |
| **Efeitos B** | `Dignidade` +5, `Caixa` +5, `Integridade` -5, `Soberania` -5 |
| **Consequência B** | "A conta de luz não sobe. O Paraguai diz que o Brasil abusa do seu tamanho." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-010` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-072 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

## Relatório da onda (script, 2026-10-20)

`python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-02/cartas.md --no-learning --wave-report` → 10 cartas conferidas, 0 erros.

| Meta da onda | Resultado |
| :--- | :--- |
| Diplomacia ≠ 0 em ≥ 12 de 20 opções | 20 de 20 |
| Eventos em 3-5 de 20 opções | 5 (25%): 064 A, 065 A, 068 A, 069 B (positivo), 070 A |
| Atores em ≥ 6 opções | 20 de 20; 13 atores; `ACT-021` com 5 × +1 e 5 × −1 |
| ≥ 3 cartas com Ano mínimo 2-4 e efeito positivo | 4: 065, 067, 068, 069 (ligadas a Caixa, Soberania, Capital Político, Legitimidade) |
| 7 cores, sem "moral por cor" | Vermelho 4, Azul 4, Amarelo 3, Roxo 3, Preto 2, Verde 2, Laranja 2; toda cor com saldo negativo; toda opção com ≥ 1 custo |

Avisos fora das metas (só relatório): Sociedade e Estado em 0% nesta onda (modo de relações externas; nas 40 opções aprovadas estão em 32% e 35%, `.claude/notas/execucao/onda-0-gd.md:403`). Carta ligada: nenhuma opção positiva em Consciência; Dignidade, Segurança e Integridade só no Ano 1.

## Propostas do GD que pedem o PO (provisórias)

1. **INST-072:** trocar "Moeda comum do Mercosul" (`docs/12_FICHAS_DOS_MODOS.md:247`) por "Energia de Itaipu", mesmo tema (Integração). Motivo: a INST-067 já é moeda comum (`:242`); Itaipu mostra o Brasil como a potência maior diante de um vizinho e quebra o padrão "Nacionalismo = opção íntegra" (`gdd/sistemas/04_eixo.md:92`). Alternativas: (A) Itaipu — recomendada; (B) moeda do Mercosul com outro custo (crise do vizinho), repete o mecanismo da 067; (C) acordo Mercosul–União Europeia, repete o agro × indústria da 064.
2. **INST-067:** título do doc 12 mantido; o dilema é o custo da moeda comum (perder os juros próprios), não a saída do dólar em si, que já está na INST-061. Base: `docs/03_PESQUISAS_E_ESTUDOS.md:436`.
3. **Diplomacia (convenção no topo):** casos de fronteira — 064 A (acordo comercial com a China) = +1, abertura comercial e não iniciativa do bloco; 067 B (manter o real) = +1, igual ao "Recusar" da INST-061; 069 com −1 nas duas opções (as duas reduzem a dependência externa). Alternativa: 0 nesses casos (Diplomacia cai para 17 de 20, ainda acima da meta).
4. **INST-068 A** com Diplomacia +2 (aliança militar com uma potência): único ±2 da onda.
5. **Ano mínimo 2** em 065, 067, 068 e 069 (pressupõem crise ou bloco maduro); as outras seis em 1, como as aprovadas 061 e 062. O doc 12 marca o modo como "Ano 2-4" (`docs/12_FICHAS_DOS_MODOS.md:226`).
6. **Quem fala:** só atores, nenhuma instituição nova. `ACT-006`, `ACT-007`, `ACT-008` e `ACT-020` falam ou aparecem fora dos modos da §12.3.3 (`docs/12_FICHAS_DOS_MODOS.md:583-608`), tabela que é guia, não regra (`:581`).

## Dúvidas para o PSI

1. INST-068: evento "Soldados brasileiros morrem no conflito" e frase do APR-068 "Na guerra dos outros, os mortos são nossos" — morte em guerra, sem detalhe; tom adequado a 15-30 anos?
2. INST-069: mineração × povos indígenas ("terra reivindicada por povos indígenas"; "Povos indígenas protestam contra a mina"). O caso real (potássio no Amazonas) não é nomeado. Sem estereótipo? Liga com o aviso "Racismo" (DP-008)?
3. INST-072: "O Paraguai diz que o Brasil abusa do seu tamanho" — fala atribuída a um país (queixa pública e antiga sobre o tratado). Passa no critério "países podem ser citados quando o fato é público"?
4. INST-063: "por risco de espionagem" sobre "uma empresa chinesa" sem nome — é a alegação dos EUA; precisa de "alegam" para não virar acusação?
5. INST-066 e INST-070 nomeiam empresas reais (Embraer, Petrobras), sem acusação; INST-063, 064 e 071 põem EUA e China pedindo, oferecendo ou ameaçando (fatos públicos de pressão comercial).
6. INST-067: a carta mostra uma proposta de moeda comum do BRICS que o doc 03 diz não estar em pauta (`:436`). Risco de reforçar o boato "o real vai acabar"? O Aprendizado desmente; alternativa: "Um sócio do BRICS defende uma moeda comum."
7. Cor: Vermelho ganha Soberania ou Dignidade e paga em Caixa ou Capital Político (D-097); quebras do padrão: 066 A e 071 A perdem Dignidade; Roxo perde Soberania na 067 A; Amarelo (Nacionalismo −) perde Segurança na 063 B.

Nota para o fio principal: a Onda 1 tem "Pânico contra refugiados na fronteira" (INST-184, `.claude/notas/execucao/onda-01/cartas.md:79`); a INST-080 planejada do Geopolítico é "Recebimento de refugiados" (`docs/12_FICHAS_DOS_MODOS.md:255`) — cuidar da repetição numa onda futura.

## Autoconferência (`.claude/rules/verificacao.md`)

12 citações conferidas no arquivo em 2026-10-20, todas batem: `gdd/sistemas/04_eixo.md:29`, `:74`, `:92`; `docs/12_FICHAS_DOS_MODOS.md:226`, `:242`, `:247`, `:255`; `docs/03_PESQUISAS_E_ESTUDOS.md:436`; `gdd/sistemas/07_atores.md:58`; `docs/11_FICHAS_DOS_ATORES.md:484`; `docs/10_GUIA_DE_ESTILO_E_TOM.md:259`; `gdd/sistemas/08_eventos.md:24`.

Higiene: um `import` do script criou `jogo/tools/__pycache__/` (23:05); removido. Nenhum outro arquivo do repositório foi tocado.
