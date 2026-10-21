# Onda 4 do P-015 — modo Geopolítico (INST-073 a INST-080) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-21 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO (2026-10-21) — rascunho para o PSI, o QA e o PO; nada gravado no doc 17. Todas as cartas ficam "provisório (DP-pendente)".
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1 (`:11-40`, DP-014). Notas do GD abaixo do `---` de cada carta; o script lê só a tabela.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-04/cartas.md --no-learning --wave-report`
**Aprendizados (rascunho):** `.claude/notas/execucao/onda-04/aprendizados.md`.

## Progresso

- [x] Kit lido (`.claude/notas/execucao/kit-gd.md`) e leitura curta: `gestao/prompts/criacao-cartas.md:53-86`, doc 17 `:11-41` e §17.05 (`:349-404`), DP-011 a DP-016, Onda 2 (cartas e aprendizados), títulos e problemas das Ondas 1 e 3, doc 12 `:217-264`, doc 18 `:2490-2695`, fichas dos atores usados (doc 11), cartas do P-003 (INST-073..080), doc 10 `:96-125` e `:250-262`, doc 04 `:100-107`, GDD 04 `:14-40`, regras de estilo do script
- [x] Plano da onda (temas, cores, eventos, anos, eixos)
- [x] INST-073 a INST-080 escritas
- [x] Check do script com 0 erros (e `--style` sem avisos)
- [x] Aprendizados (`aprendizados.md`)
- [x] Relatório, propostas ao PO, dúvidas ao PSI, autoconferência (no fim)

## Convenções desta onda

- Diplomacia como no kit (§4) e na Onda 2 (`gdd/sistemas/04_eixo.md:23`, `:29`): − = autonomia nacional, controle interno ou projeto do BRICS ("BRICS conta como Nacionalismo", `:29`); + = abertura, alinhamento a potência ou a instituição internacional (OCDE, Banco Mundial, Mercosul).
- `ACT-021`: +1 quando o jogador cede à potência que pede; −1 quando recusa. Seis cartas têm potência que pede (073, 074, 075, 076, 077, 079): 6 × +1 e 6 × −1.
- Sociedade e Estado (a Onda 2 ficou em 0%): só onde o dilema toca direitos ou poder do Estado. Ação militar contra o crime = Soc −1, Est −1, como "Aumentar o encarceramento" e "Defender a polícia" (`docs/17_ROTEIRO_DAS_CARTAS.md:430`, `:457`) e "Prender ao vivo" (Onda 3, INST-199); direito de comunidade tradicional = Soc +1, como "Assentar as famílias" (THEM-001) e "Tirar os anúncios" (INST-187); proteger quem denuncia e defender a democracia = Est +1, como "Investigar a origem" e "Reconhecer o resultado" (INST-182, INST-195).
- Nenhum número nem dado no texto ao jogador (kit §2): os fatos ficam na pista de dado do Aprendizado (D-091). Nenhuma pessoa real: países, órgãos e lugares só por nome público (EUA, OCDE, Banco Mundial, Mercosul, Maranhão); pessoas por papel ("um ex-agente", "militares").
- `Quem fala`: só atores, como na Onda 2 (o modo não tem instituição definida).

---

### INST-073 — Compra de Terras pela China

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Terras para estrangeiros |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Roxo |
| **Problema** | O Congresso libera a compra de terras por estrangeiros. Fundos de fora negociam fazendas de soja. Falta a sua sanção. |
| **Opção A** | Sancionar a lei |
| **Efeitos A** | `Caixa` +15, `Capital Político` +10, `Soberania` -15 |
| **Consequência A** | "Dinheiro de fora entra no campo. Fazendas de soja mudam de dono." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-021` +1, `ACT-017` -1 |
| **Evento A** | — |
| **Opção B** | Vetar a lei |
| **Efeitos B** | `Soberania` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência B** | "A venda fica barrada. O Congresso ameaça derrubar o seu veto." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-017` +1, `ACT-011` -1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-073 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-073):** o P-003 dava "Permitir" sem ganho real; aqui a decisão é do presidente (sancionar ou vetar), com ganho de Caixa e de apoio no Congresso de um lado e Soberania do outro. Título do doc 12 (`docs/12_FICHAS_DOS_MODOS.md:248`) com "pela" no lugar de "por". `ACT-011` traz a lei que o Congresso aprovou ("Controlar a pauta", `docs/11_FICHAS_DOS_ATORES.md:294`); `ACT-017` teme "ver a terra ser concentrada" (`:411`). Cor A Verde: agronegócio (`docs/10_GUIA_DE_ESTILO_E_TOM.md:258`); Cor B Roxo: reforma agrária (`:260`). Eixo como a INST-062 e a INST-066 (vender × vetar ativo estratégico). Não repete a INST-064 (tarifa e comércio) nem a INST-182 da Onda 1 (boato de venda de terras, `.claude/notas/execucao/onda-01/cartas.md:23`), que trata de desinformação.

### INST-074 — Ajuda Militar dos EUA contra as Facções

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ajuda militar dos EUA |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-021` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Amarelo |
| **Problema** | Os EUA, que tratam duas facções como terroristas, oferecem drones e agentes para combatê-las em solo brasileiro. |
| **Opção A** | Aceitar a ajuda |
| **Efeitos A** | `Segurança` +15, `Capital Político` +5, `Soberania` -15, `Dignidade` -5 |
| **Consequência A** | "Drones vigiam as rotas do crime. Agentes dos EUA atuam no país." |
| **Eixo A** | [0, +1, -1, -1] |
| **Atores A** | `ACT-021` +1, `ACT-010` -1 |
| **Evento A** | "Agentes dos EUA fazem uma operação sem avisar a PF." · atraso 1 · `Soberania` -10, `Legitimidade` -5 |
| **Opção B** | Recusar a ajuda |
| **Efeitos B** | `Soberania` +10, `Capital Político` -10, `Segurança` -5 |
| **Consequência B** | "As facções seguem como caso de polícia. Os EUA cortam a cooperação." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-010` +1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-074 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-074):** tema do doc 12 "Ingerência" (`docs/12_FICHAS_DOS_MODOS.md:249`). O P-003 dava "Aceitar" com Segurança +5 e custo moral; aqui a ajuda funciona (Segurança +15) e o preço vem em Soberania, agora e no evento. O rótulo "terrorista" é o centro do dilema: muda o que uma potência pode fazer em solo alheio (pista no APR-074). Ano mínimo 2: pressupõe o crime como crise do governo; carta ligada a Segurança. `ACT-010` teme "ver o Brasil se tornar um protetorado" (`docs/11_FICHAS_DOS_ATORES.md:276`). Cor A Preto: militarização (`docs/10_GUIA_DE_ESTILO_E_TOM.md:262`); Cor B Amarelo: governabilidade e negociação, a recusa diplomática (`:259`). Eixo B sem Est: recusar a ajuda não é, por si, mais liberdade. Não repete a INST-068 (tropas brasileiras fora) nem a INST-199 da Onda 3 (dinheiro de facção em rifas).

### INST-075 — Adesão à OCDE

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Adesão à OCDE |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-002` |
| **Ano mínimo** | 3 |
| **Cor A** | Azul |
| **Cor B** | Vermelho |
| **Problema** | Os EUA apoiam a entrada do Brasil na OCDE, o 'clube dos países ricos'. Em troca, o Brasil abre mão de vantagens de país em desenvolvimento. |
| **Opção A** | Entrar na OCDE |
| **Efeitos A** | `Caixa` +10, `Integridade` +5, `Soberania` -15 |
| **Consequência A** | "O selo atrai investidores. O país adota as regras de transparência do clube." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-021` +1, `ACT-002` +1, `ACT-010` -1 |
| **Evento A** | — |
| **Opção B** | Manter as vantagens |
| **Efeitos B** | `Soberania` +10, `Caixa` -10 |
| **Consequência B** | "O Brasil fica fora do clube. O mercado diz que o país perdeu uma chance." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-010` +1, `ACT-021` -1, `ACT-002` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-075 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-075):** tema "Alinhamento" (`docs/12_FICHAS_DOS_MODOS.md:250`). O P-003 dava "Aderir" com Integridade −5; aqui a opção alinhada ganha Integridade (regras de transparência e de combate ao suborno, `docs/04_DESIGN_DO_JOGO.md:104`: "confiança nas instituições") e quebra o padrão "Nacionalismo = opção íntegra" (`gdd/sistemas/04_eixo.md:92`). A troca de vantagens pelo apoio dos EUA tem base num fato público (pista no APR-075). "Clube dos países ricos" é apelido de imprensa: ponto do PSI. Ano mínimo 3: a adesão leva anos; carta ligada a Integridade. `ACT-002` quer "Lucrar. Garantir a desregulamentação" (`docs/11_FICHAS_DOS_ATORES.md:121`): o selo atrai o dinheiro dele. Cor A Azul: reformas e estabilidade (`docs/10_GUIA_DE_ESTILO_E_TOM.md:257`); Cor B Vermelho: política de desenvolvimento (inferência do GD, `:256`).

### INST-076 — Acesso a Vacinas na Pandemia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Acesso a vacinas |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Uma pandemia chega. A farmacêutica dona da vacina cobra um preço alto. A lei permite quebrar a patente, mas os EUA ameaçam sanções. |
| **Opção A** | Quebrar a patente |
| **Efeitos A** | `Soberania` +10, `Dignidade` -10, `Caixa` -5 |
| **Consequência A** | "A produção nacional leva meses. Os EUA aplicam sanções ao Brasil." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-014` +1, `ACT-021` -1 |
| **Evento A** | "O laboratório público entrega a vacina a todos." · atraso 1 · `Dignidade` +10 |
| **Opção B** | Pagar o preço cobrado |
| **Efeitos B** | `Dignidade` +10, `Caixa` -15, `Soberania` -5 |
| **Consequência B** | "A vacinação começa. O SUS corta outras despesas para pagar a conta." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-021` +1, `ACT-006` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-076 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-076):** tema "Saúde global" (`docs/12_FICHAS_DOS_MODOS.md:251`). O P-003 dava "Liderar × Seguir os EUA" sem custo na opção boa. Aqui as duas opções vacinam; muda o tempo e o dono. Quebrar a patente custa Dignidade já (a fábrica demora) e devolve no evento positivo do ano seguinte; pagar vacina agora e esvazia o caixa. Assim a opção Vermelha paga em Dignidade, contra o padrão da Onda 2 (`.claude/notas/execucao/onda-02/cartas.md:326`). `ACT-014` quer "garantir o direito à saúde" (`docs/11_FICHAS_DOS_ATORES.md:353`). Cor A Vermelho: direito social (`docs/10_GUIA_DE_ESTILO_E_TOM.md:256`); Cor B Laranja: mercado e patente (`:261`). Não repete a INST-190 da Onda 1 (boato contra a vacina do HPV).

### INST-077 — Base de Foguetes sobre Terras Quilombolas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Base de foguetes |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Roxo |
| **Problema** | Uma potência quer alugar a base de foguetes do Maranhão. Para isso, a base precisa crescer sobre terras quilombolas. |
| **Opção A** | Expandir a base |
| **Efeitos A** | `Caixa` +20, `Soberania` -10, `Dignidade` -10 |
| **Consequência A** | "Foguetes estrangeiros sobem. Famílias quilombolas perdem suas terras." |
| **Eixo A** | [0, +1, -1, 0] |
| **Atores A** | `ACT-021` +1, `ACT-008` +1, `ACT-017` -1 |
| **Evento A** | "Os quilombolas levam o caso a uma corte internacional." · atraso 2 · `Legitimidade` -10, `Integridade` -5 |
| **Opção B** | Proteger os quilombos |
| **Efeitos B** | `Dignidade` +10, `Legitimidade` +5, `Caixa` -10 |
| **Consequência B** | "As famílias ficam. Sem o aluguel, o programa espacial segue sem dinheiro." |
| **Eixo B** | [0, -1, +1, 0] |
| **Atores B** | `ACT-017` +1, `ACT-021` -1, `ACT-008` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-077 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-077):** o doc 12 planeja "Base militar na Amazônia" (`docs/12_FICHAS_DOS_MODOS.md:252`). Uma base estrangeira em troca de radar repetiria a INST-074 (presença militar de fora em troca de segurança). Proposta: a base de foguetes do Maranhão (Força Aérea, Amazônia Legal), caso real com dinheiro, acordo com potência e comunidades quilombolas (pista no APR-077); o nome do lugar fica só no Aprendizado. Soberania é ambígua aqui: o aluguel traz dinheiro ao programa espacial, mas o acordo veta áreas e tecnologia ao Brasil; o GD pôs Soberania −10 só na opção A. Ano mínimo 2: carta ligada a Legitimidade (opção B). `ACT-008` fala pela Força Aérea, que opera a base ("proteger a 'segurança nacional'", `docs/11_FICHAS_DOS_ATORES.md:237`). Não há ator para quilombolas: `ACT-017` (povos do campo, `:410`) é aproximação — proposta ao PO. Cor A Preto: militarização (`docs/10_GUIA_DE_ESTILO_E_TOM.md:262`); Cor B Roxo: movimentos sociais (`:260`). Tema do aviso "Racismo": ponto do PSI.

### INST-078 — Banco do BRICS ou Banco Mundial

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Banco do BRICS |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Para levar esgoto às periferias, o Banco do BRICS oferece crédito. O Banco Mundial empresta mais, mas exige subir a conta de água. |
| **Opção A** | Pegar com o BRICS |
| **Efeitos A** | `Soberania` +5, `Dignidade` +5, `Caixa` -10 |
| **Consequência A** | "A obra chega a menos bairros. Parte do custo sai do seu caixa." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-016` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar o Banco Mundial |
| **Efeitos B** | `Dignidade` +10, `Caixa` +5, `Soberania` -5, `Legitimidade` -5 |
| **Consequência B** | "O esgoto chega a mais bairros. A conta de água sobe para todos." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-006` +1, `ACT-003` +1, `ACT-016` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-078 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-078):** tema "Alternativa" (`docs/12_FICHAS_DOS_MODOS.md:253`). Não repete a moeda comum (INST-067) nem o sistema de pagamento (INST-061): aqui o dilema é de quem pegar o dinheiro de uma obra. A condição do Banco Mundial é a tarifa, não a venda de estatais, para não repetir a INST-065 (FMI). As duas opções levam esgoto; muda o tamanho da obra, quem paga e quem dita as regras. `ACT-016` quer "moradia digna" (`docs/11_FICHAS_DOS_ATORES.md:391`): esgoto na periferia é assunto do público-alvo, sem estereótipo. Cor A Vermelho: serviço público (`docs/10_GUIA_DE_ESTILO_E_TOM.md:256`); Cor B Laranja: tarifa de mercado (`:261`). `ACT-003` (Construtoras) ganha com a obra maior. O conceito do Aprendizado não deve afirmar que o Banco Mundial sempre exige tarifa: é o cenário da carta.

### INST-079 — Asilo ou Extradição de um Ex-agente

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Asilo ou extradição |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Um ex-agente de uma potência revela que ela espiona o governo brasileiro. Ele pede asilo ao Brasil, e a potência exige a entrega dele. |
| **Opção A** | Entregar o ex-agente |
| **Efeitos A** | `Caixa` +10, `Segurança` +5, `Soberania` -10, `Consciência` -5 |
| **Consequência A** | "A potência agradece e prende o ex-agente na chegada." |
| **Eixo A** | [0, +1, 0, -1] |
| **Atores A** | `ACT-021` +1, `ACT-023` -1 |
| **Evento A** | — |
| **Opção B** | Dar asilo a ele |
| **Efeitos B** | `Consciência` +10, `Soberania` +10, `Caixa` -15, `Segurança` -5 |
| **Consequência B** | "Ele publica novos segredos. A potência corta acordos com o Brasil." |
| **Eixo B** | [0, -1, 0, +1] |
| **Atores B** | `ACT-023` +1, `ACT-010` +1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-079 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-079):** o doc 12 planeja "Extradição de cidadão" (`docs/12_FICHAS_DOS_MODOS.md:254`), mas a Constituição proíbe extraditar brasileiro nato `[não verificado]`, pista no APR-079: o dilema do P-003 não existiria. Proposta: um estrangeiro que revelou espionagem contra o Brasil pede asilo; a potência exige a entrega. Título novo, "Asilo ou extradição". Consciência = "acesso à informação" (`docs/04_DESIGN_DO_JOGO.md:101`): o asilo mantém as revelações; a entrega as cala. É a única opção da onda com Consciência positiva (a Onda 2 não teve nenhuma); Ano mínimo 2: carta ligada a Consciência e a Segurança. `ACT-023` quer "Investigar. Denunciar. Informar." (`docs/11_FICHAS_DOS_ATORES.md:526`). Cor A Azul: estabilidade das relações (`docs/10_GUIA_DE_ESTILO_E_TOM.md:257`); Cor B Amarelo: o centro também defende a soberania (`:259`), contra o padrão "Vermelho = soberania". Eixo: entregar quem denunciou = Est −1, como "Abafar o caso" (INST-186); asilo = Est +1, como "Investigar e expor" (mesma carta).

### INST-080 — Golpe Militar no País Vizinho

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Golpe no país vizinho |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Laranja |
| **Problema** | Militares derrubam o presidente eleito de um sócio do Mercosul e prometem eleições sem data. O país é um grande comprador do Brasil. |
| **Opção A** | Propor a suspensão |
| **Efeitos A** | `Integridade` +10, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "O bloco suspende o vizinho até nova eleição. Exportadores perdem vendas." |
| **Eixo A** | [0, +1, 0, +1] |
| **Atores A** | `ACT-010` +1, `ACT-004` -1 |
| **Evento A** | — |
| **Opção B** | Reconhecer o novo governo |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Integridade` -10 |
| **Consequência B** | "O comércio segue. A oposição do vizinho acusa você de apoiar o golpe." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-004` +1, `ACT-001` +1, `ACT-010` -1 |
| **Evento B** | "O novo governo adia a eleição e prende opositores." · atraso 2 · `Legitimidade` -5, `Integridade` -5 |
| **Aprendizado** | APR-080 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-080):** troca do tema "Recebimento de refugiados" (`docs/12_FICHAS_DOS_MODOS.md:255`), já tratado na INST-184 da Onda 1 (`.claude/notas/execucao/onda-01/cartas.md:91`). Novo tema: democracia na política externa (cláusula democrática do Mercosul, pista no APR-080). Integridade = "confiança nas instituições" (`docs/04_DESIGN_DO_JOGO.md:104`). Ano mínimo 2: carta ligada a Integridade. O golpe é no vizinho, não no governo do jogador: não toca a cena do impeachment (IMP-1..5). Eixo A: Dip +1 (instituição regional) e Est +1 (democracia), como "Reconhecer o resultado" (INST-195); Eixo B: Dip 0 (pragmatismo bilateral, sem instituição) e Est −1. `ACT-004` quer "proteção para a indústria nacional" (`docs/11_FICHAS_DOS_ATORES.md:159`) e perde o comprador; `ACT-010` quer autonomia e regras (`:275`). Cor A Amarelo: regras e governabilidade (`docs/10_GUIA_DE_ESTILO_E_TOM.md:259`); Cor B Verde: o agro exportador quer o comércio (`:258`). Tema do aviso "ditadura": sem detalhe; ponto do PSI.

---

## Relatório da onda (script, 2026-10-21)

`PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-04/cartas.md --no-learning --wave-report --style` → 8 cartas conferidas, 0 erros, 0 avisos de estilo.

| Meta da onda (prompt e kit §5) | Resultado |
| :--- | :--- |
| Eventos em 3-4 de 16 opções | 4 (25%): 074 A, 076 A (positivo), 077 A, 080 B |
| Sociedade ≠ 0 em ≥ 3 opções | 3 (19%): 074 A, 077 A, 077 B |
| Estado ≠ 0 em ≥ 3 opções | 5 (31%): 074 A, 079 A, 079 B, 080 A, 080 B |
| Diplomacia ≠ 0 em ≥ 3 opções | 15 de 16 (só 080 B em 0); Economia 7 (44%) |
| ≥ 2 cartas com Ano mínimo 2-4 e efeito positivo em Consciência, Integridade, Segurança ou Legitimidade | 5: 074 (Segurança), 075 (Integridade, Ano 3), 077 (Legitimidade), 079 (Consciência e Segurança), 080 (Integridade) |
| ≥ 1 opção com Consciência positiva | 1: 079 B (asilo) |
| 7 cores com saldo negativo | Vermelho 3, Amarelo 3, Azul 2, Verde 2, Roxo 2, Laranja 2, Preto 2; toda cor negativa em ≥ 1 medidor; toda opção com ≥ 1 custo |
| Atores | 16 de 16 opções; 14 atores; `ACT-021` 6 × +1 e 6 × −1 |

Somas por cor (script): Preto Soberania −25, Dignidade −10 · Azul Soberania −25, Consciência −5 · Verde Soberania −15, Integridade −10 · Laranja Soberania −10, Caixa −10, Legitimidade −5 · Roxo Caixa −15, Capital Político −10 · Vermelho Caixa −25, Dignidade −5 · Amarelo Caixa −25, Capital Político −15, Segurança −10.

Avisos fora das metas (só relatório): técnicas do Influenciador em 0 (não se aplica ao modo). Somado à Onda 2, o Geopolítico fica com Sociedade 3 e Estado 5 de 36 opções novas.

## Propostas do GD que pedem o PO (provisórias)

1. **INST-080 — tema novo** (refugiados já estão na INST-184). (A) Golpe num sócio do Mercosul — **recomendada**: democracia na política externa, eixo Estado natural, nada repetido; contra: tema "ditadura" passa pelo PSI. (B) Voto na ONU contra a violência a pessoas LGBT: Sociedade ±1 natural; contra: puxa para o modo Bancadas e para a guerra cultural. (C) Mandado do Tribunal Penal Internacional contra um chefe de Estado em visita: direito internacional e BRICS; contra: alude a líder vivo (RC-08).
2. **INST-077 — "Base militar na Amazônia" vira "Base de foguetes"** (base do Maranhão, Força Aérea, Amazônia Legal). (A) Base de foguetes sobre terras quilombolas — **recomendada**: caso real, dinheiro × direitos, eixo Sociedade; (B) base estrangeira na Amazônia em troca de radares: repete a troca da INST-074; (C) conteúdo de (A) com o título do doc 12: menos claro para o jogador.
3. **INST-079 — "Extradição de cidadão" vira "Asilo ou extradição"**: brasileiro nato não pode ser extraditado (`[não verificado]`, pista no APR-079). (A) Asilo a ex-agente que revelou espionagem contra o Brasil — **recomendada**: Consciência e Estado naturais; (B) estrangeiro que alega perseguição política (STF autoriza, presidente decide): sem o elo com soberania digital; (C) brasileiro naturalizado acusado de tráfico: dilema fraco.
4. **Ator de quilombolas e indígenas:** não existe; a INST-077 usa `ACT-017` como aproximação (a INST-069 usou `ACT-018`). (A) manter a aproximação — recomendada; (B) carta sem ator nesse lugar; (C) ator novo (muda D-085; bloqueio).
5. **Eixos de fronteira:** 080 B com Dip 0 (pragmatismo bilateral; alternativa +1 como "cooperação com vizinho"); 074 A com Soc −1 e Est −1 (convenção do combate militarizado ao crime); 077 B sem Soberania (o GD cogitou −5: sem aluguel, o programa espacial para).
6. **Ano mínimo:** 2 em 074, 077, 079 e 080; 3 na 075 (a adesão leva anos); 1 nas outras três. O doc 12 marca o modo como "Ano 2-4" (`docs/12_FICHAS_DOS_MODOS.md:226`).
7. **Cartas ATOR futuras do `ACT-021`:** as referências antigas "A China quer comprar terras" e "Os EUA querem base militar" (`docs/11_FICHAS_DOS_ATORES.md:492`) agora são INST-073 e INST-074/077; a exigência e o ataque do ator devem usar outros temas.

## Dúvidas para o PSI

1. INST-077: remoção de famílias quilombolas por uma base (aviso "Racismo"); evento "Os quilombolas levam o caso a uma corte internacional". Sem estereótipo? O caso real só aparece no Aprendizado.
2. INST-080: golpe militar num vizinho (aviso "ditadura"); evento "prende opositores", sem detalhe. Cor B Verde ("o agro exportador quer o comércio") lê como acusação ao agro?
3. INST-074: os EUA querem tratar facções como terroristas — debate real e recente, em período eleitoral (RC-08). O texto não cita ninguém; lê como partidário?
4. INST-079: o ex-agente que revelou espionagem alude a pessoa viva conhecida, sem nome. Passa?
5. INST-075: "o clube dos países ricos" é apelido de imprensa; a OCDE tem membros de renda média. Manter ou trocar por "o clube de economias ricas"?
6. INST-076: "Os EUA aplicam sanções ao Brasil" é cenário; no caso real de 2007 houve pressão, não sanção `[não verificado]`. Alternativa: "Os EUA ameaçam o comércio com o Brasil."
7. Cor: Preto nas opções de alinhamento militar (074 A, 077 A) e Amarelo nas de soberania (074 B, 079 B), contra o padrão "Vermelho = soberania" da Onda 2. Vermelho paga em Dignidade na 076 A.

## Autoconferência (`.claude/rules/verificacao.md`)

12 citações conferidas no arquivo em 2026-10-21, todas batem: `docs/11_FICHAS_DOS_ATORES.md:294`, `:411`; `docs/10_GUIA_DE_ESTILO_E_TOM.md:256`, `:259`, `:262`; `docs/04_DESIGN_DO_JOGO.md:101`, `:104`; `docs/12_FICHAS_DOS_MODOS.md:252`, `:255`; `.claude/notas/execucao/onda-02/cartas.md:326`; `docs/17_ROTEIRO_DAS_CARTAS.md:430`; `.claude/notas/execucao/onda-01/cartas.md:91`.

Higiene: o script rodou com `PYTHONDONTWRITEBYTECODE=1` (nenhum `__pycache__`); `git status` sem mudanças; nenhum arquivo do repositório tocado fora de `.claude/notas/execucao/onda-04/`.
