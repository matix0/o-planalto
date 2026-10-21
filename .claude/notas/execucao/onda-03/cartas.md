# Onda 3 — Modo Influenciador (INST-192 a INST-200) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-20 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO (2026-10-20) — rascunho para o PSI, o QA e o PO; nada gravado no doc 17. Todas as cartas ficam "provisório (DP-pendente)".
**Formato:** tabela estendida do `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1 (`:13-40`, DP-014), como a INST-181 (`:698-726`) e a Onda 1.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-03/cartas.md --no-learning --wave-report` (resultado no fim deste arquivo).
**Notas do GD:** abaixo do `---` de cada carta; o script lê só a tabela.
**Aprendizados (rascunho):** `.claude/notas/execucao/onda-03/aprendizados.md`.

## Progresso

- [x] Kit lido (`.claude/notas/execucao/kit-gd.md`) e leitura curta: `gestao/prompts/criacao-cartas.md:53-86`, doc 17 `:11-41` e `:698-726`, DP-011 a DP-016, Onda 1 (cartas e aprendizados), Onda 2 (cabeçalho e relatório), doc 12 `:507-554`, `:570-608`, GDD 09 `:1-100`, doc 05 `:404-449`, doc 10 `:96-125`, `:200-262`, fichas dos atores usados (doc 11), cartas do P-003 (INST-192..200), `jogo/tools/cards_doc.py` (regras do `check`)
- [x] Plano da onda (técnicas, reações, cores, eventos, anos)
- [x] INST-192 a INST-200 escritas
- [x] Aprendizados APR-192 a APR-200 (`aprendizados.md`)
- [x] Script `check` com 0 erros (na onda e no doc 17 + Ondas 1-3)
- [x] Relatório, propostas ao PO, dúvidas ao PSI, autoconferência (no fim)

## Convenções desta onda

- Diplomacia como no kit (§4; `gdd/sistemas/04_eixo.md:23`, `:29`). Plataforma de fora, como na INST-188 (`.claude/notas/execucao/onda-01/cartas.md:231`, `:238`): obrigar a plataforma = Dip −1 (soberania digital); deixar com ela = Eco +1, Dip +1.
- Punitivismo e repressão de costumes: Soc −1 e Est negativo, como "Aumentar o encarceramento" e "Defender a polícia" (`docs/17_ROTEIRO_DAS_CARTAS.md:430`, `:457`).
- Quando o problema repete um boato ou estigma, ele já diz que é falso ("É falso", "Não há prova", "sem prova"), como pediu o PSI na Onda 1.
- Nenhum número no texto ao jogador (kit §2); nenhuma marca nem pessoa real nova; países e pessoas por papel ("um país vizinho", "uma ex-influenciadora").
- `Quem fala`: só atores (o modo não tem instituição definida; Onda 1, divergência 3).
- Grafia da técnica: `Cachê da Desgraça` (`jogo/tools/cards_doc.py:46`; o prompt escreveu "Cache").

---

### INST-192 — Boato sobre a Taxação do Pix

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Boato da taxa no Pix |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Técnica** | Pânico Moral |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | A Receita passa a fiscalizar grandes movimentações por Pix. Vídeos dizem que o governo vai taxar o Pix. É falso, mas o medo cresce. |
| **Opção A** | Manter e explicar |
| **Efeitos A** | `Integridade` +10, `Caixa` +5, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência A** | "A norma fica. O desmentido demora, e parte do país passa a evitar o Pix." |
| **Eixo A** | [-1, 0, 0, -1] |
| **Atores A** | `ACT-007` +1 |
| **Evento A** | — |
| **Reação A** | Recusar |
| **Opção B** | Revogar a norma |
| **Efeitos B** | `Legitimidade` +10, `Capital Político` +5, `Integridade` -10, `Consciência` -5 |
| **Consequência B** | "O recuo vira 'prova' do boato. A Receita deixa de enxergar o dinheiro digital." |
| **Eixo B** | [+1, 0, 0, +1] |
| **Atores B** | `ACT-007` -1 |
| **Evento B** | "O crime organizado usa contas digitais para lavar dinheiro." · atraso 2 · `Segurança` -10, `Caixa` -10 |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-192 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-192):** pânico moral = "criar medo sobre um tema" (`docs/05_SISTEMAS_E_MECANICAS.md:415`), aqui sobre o bolso: a norma fiscaliza, o boato diz que taxa. Inspirado num caso real de 2025 (pista no APR-192), sem nome de pessoa. O problema diz "É falso". Evento B com atraso 2: o custo de ceder chega longe da escolha ("efeito retardado", `gdd/sistemas/08_eventos.md:14`); escolhida no Ano 3 ou 4, vai para o epílogo (`:10`). Eixo: manter = Estado fiscaliza o dinheiro (Eco −1, Est −1); revogar = menos controle (Eco +1, Est +1) — a opção íntegra fica com Est −1. Cor A Vermelho: justiça fiscal (inferência do GD; `docs/10_GUIA_DE_ESTILO_E_TOM.md:256`); Cor B Amarelo: recuo pela governabilidade (`:259`). `ACT-007` fala "em números" e teme "o descontrole fiscal" (`docs/11_FICHAS_DOS_ATORES.md:217`, `:219`). "Pix" é o nome do sistema público de pagamentos do Banco Central; se conta como marca, é ponto do PSI `[não verificado]`.

### INST-193 — Ex-influenciadora de Apostas Indicada Ministra

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Indicação para o Esporte |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Técnica** | Cachê da Desgraça |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Um partido aliado indica para o Ministério do Esporte um ex-influenciador que lucrou com a perda dos seguidores nas apostas. |
| **Opção A** | Recusar a indicação |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -15 |
| **Consequência A** | "O partido se sente traído e passa a votar contra seus projetos." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | — |
| **Reação A** | Recusar |
| **Opção B** | Aceitar a indicação |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` +10, `Integridade` -10, `Consciência` -10 |
| **Consequência B** | "O ministro traz os fãs dele ao governo. E traz as casas de apostas." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-022` +1 |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-193 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-193):** cachê da desgraça = "comissão sobre perdas de apostadores" (`docs/05_SISTEMAS_E_MECANICAS.md:418`); aqui o lucro com a perda alheia vira poder político. Ideia do banco ("eleita com apoio de bets", `docs/12_FICHAS_DOS_MODOS.md:543`), trocada de relatoria para ministério: relator com conflito × trocar o relator repetiria a INST-001 (`docs/17_ROTEIRO_DAS_CARTAS.md:78-85`); também não é a indicação ao STF da INST-004 (`:159-166`). Ano mínimo 2: pressupõe a reforma ministerial depois do 1º ano (inferência do GD); o modo é frequente no Ano 2 (`docs/12_FICHAS_DOS_MODOS.md:575`); carta ligada a `Integridade`/`Consciência` (A) e `Capital Político`/`Legitimidade` (B) no Ano 2+. `ACT-011` troca apoio por cargos (`docs/11_FICHAS_DOS_ATORES.md:294`, `:296`); `ACT-022` é financiado por bets (`:513`). Eixo zero nas duas: escolha de integridade sem conteúdo ideológico, como a INST-181 (`docs/17_ROTEIRO_DAS_CARTAS.md:714`, `:721`). Cor A Azul: gestão sem conflito de interesse (inferência do GD); Cor B Amarelo: governabilidade (`docs/10_GUIA_DE_ESTILO_E_TOM.md:259`).

### INST-194 — Comissão sobre a Perda dos Seguidores

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Comissão sobre a perda |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 2 |
| **Técnica** | Cachê da Desgraça |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Casas de apostas pagam influenciadores com parte do que os seguidores perdem. Um projeto quer proibir esse pagamento. |
| **Opção A** | Proibir a comissão |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Caixa` -10, `Legitimidade` -5 |
| **Consequência A** | "A comissão acaba. Muitos influenciadores largam as apostas e viram oposição." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-014` +1, `ACT-022` -1 |
| **Evento A** | "Menos jovens se endividam com apostas." · atraso 2 · `Dignidade` +10 |
| **Reação A** | Recusar |
| **Opção B** | Deixar o setor se regular |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Consciência` -10, `Dignidade` -10 |
| **Consequência B** | "As apostas seguem em alta. Os influenciadores lucram com cada perda." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-022` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-194 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-194):** o mecanismo do cachê da desgraça como regra pública (`docs/05_SISTEMAS_E_MECANICAS.md:418`); a INST-181 é a oferta pessoal de apoio (`docs/17_ROTEIRO_DAS_CARTAS.md:710`). Base real (pista no APR-194; busca do GD, a reconferir): reportagem de 2024 sobre contrato que paga o influenciador conforme o prejuízo do apostador (https://intercept.com.br/2024/11/07/bets-prior-influenciadores/) e projeto aprovado no Senado que tira atletas e influenciadores dos anúncios de apostas (https://euqueroinvestir.com/economia/senado-aprova-proibicao-de-atletas-e-influenciadores-em-anuncios-de-bets). Simplificação: o projeto real mira os anúncios; a carta mira o pagamento por perda (alternativa nas propostas ao PO). Ano mínimo 2: pressupõe o setor de apostas já em alta e o debate no Congresso (inferência do GD); é a única opção do baralho com `Dignidade` positiva no Ano 2+ (o `--wave-report` do doc 17 + Ondas 1-3 dava 0). Evento A positivo e atrasado: "investir hoje vira … depois" (`gdd/sistemas/08_eventos.md:14`); escolhida no Ano 3 ou 4, vai para o epílogo (`:10`). `ACT-014` cuida também de saúde mental (`docs/11_FICHAS_DOS_ATORES.md:357`, ATOR-070) e vê o vício; `ACT-022` é financiado por bets (`:513`) e teme a regulação (`:508`). Eixo: proibir = intervenção no mercado (Eco −1); deixar = Eco +1. Cor A Vermelho (proteção social, `docs/10_GUIA_DE_ESTILO_E_TOM.md:256`); Cor B Laranja (desregulamentação, `:261`).

### INST-195 — Boato de Fraude nas Urnas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Boato contra as urnas |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 2 |
| **Técnica** | Desmoralização |
| **Cor A** | Preto |
| **Cor B** | Vermelho |
| **Problema** | Seu aliado perde uma eleição apertada. Influenciadores da sua base dizem que houve fraude nas urnas. É falso. |
| **Opção A** | Duvidar das urnas |
| **Efeitos A** | `Capital Político` +10, `Legitimidade` +5, `Integridade` -15, `Consciência` -5 |
| **Consequência A** | "Sua base vai às ruas. Mas foram essas urnas que elegeram você." |
| **Eixo A** | [0, 0, 0, -2] |
| **Atores A** | `ACT-022` +1, `ACT-023` -1 |
| **Evento A** | "Parte do país deixa de confiar em qualquer eleição." · atraso 1 · `Legitimidade` -10, `Integridade` -5 |
| **Reação A** | Aceitar |
| **Opção B** | Reconhecer o resultado |
| **Efeitos B** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência B** | "Você parabeniza os eleitos. Aliados dizem que você entregou o jogo." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-023` +1, `ACT-022` -1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-195 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-195):** desmoralização = destruir a reputação do adversário com mentiras (`docs/05_SISTEMAS_E_MECANICAS.md:414`), aqui contra a eleição; a tentação vem da sua base (`gdd/sistemas/09_desinformacao.md:14`). Ideia do banco "fake news sobre STF / Ataque" (`docs/12_FICHAS_DOS_MODOS.md:540`) levada para as urnas: o Judiciário já tem várias cartas de STF planejadas (`:478-487`). O problema diz "sem prova". Consequência A irônica, sem crueldade (`docs/10_GUIA_DE_ESTILO_E_TOM.md:239`); o evento A mostra a desconfiança voltando contra quem a planta. Ano mínimo 2: as eleições municipais caem no meio do mandato `[não verificado]`; o texto diz "uma eleição" para valer em qualquer ano. Eixo A Est −2: atacar a eleição é o ato mais autoritário da onda (o único ±2; o −2 segue "Aumentar o encarceramento", `docs/17_ROTEIRO_DAS_CARTAS.md:430`). `ACT-022`: "A mentira repetida mil vezes vira verdade. E eu repito." (`docs/11_FICHAS_DOS_ATORES.md:512`); `ACT-023` denuncia fake news (`:530`, ATOR-115). Cor A Preto: quem propõe pôr a eleição em dúvida (inferência do GD; `docs/10_GUIA_DE_ESTILO_E_TOM.md:262`); Cor B Vermelho.

### INST-196 — Denúncias em Massa contra Ativista Ambiental

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Denúncia em massa |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-018` |
| **Ano mínimo** | 1 |
| **Técnica** | Fazenda de IA |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Uma ativista mostra garimpo ilegal na Amazônia. Perfis falsos denunciam a conta dela em massa, e a plataforma a suspende. |
| **Opção A** | Investigar os robôs |
| **Efeitos A** | `Integridade` +10, `Soberania` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "Os dados mostram robôs pagos pelo garimpo ilegal. A plataforma fala em censura." |
| **Eixo A** | [0, -1, 0, +1] |
| **Atores A** | `ACT-018` +1, `ACT-020` -1 |
| **Evento A** | — |
| **Reação A** | Investigar |
| **Opção B** | Deixar com a plataforma |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` +5, `Consciência` -10, `Soberania` -5 |
| **Consequência B** | "A conta segue fora do ar. Outras vozes contra o garimpo se calam." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-020` +1, `ACT-018` -1 |
| **Evento B** | "O garimpo ilegal avança onde a ativista denunciava." · atraso 1 · `Soberania` -10 |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-196 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-196):** fazenda de IA = rede de perfis coordenados (`docs/05_SISTEMAS_E_MECANICAS.md:417`), aqui usada para calar: denúncia em massa até a plataforma suspender. Difere da INST-186 (rede estrangeira contra o governo) e da INST-189 (robôs a favor). Ideia do banco "Influenciadora promove reforma agrária / Resistência" (`docs/12_FICHAS_DOS_MODOS.md:541`) levada para a pauta ambiental, de um ator do modo (`:602`). `ACT-018` denuncia garimpo ilegal (`docs/11_FICHAS_DOS_ATORES.md:433`, ATOR-088); `ACT-020` "derruba perfil de jornalista" (`:473`, ATOR-098) e teme regulação (`:470`). Eixo e Dip pela convenção da INST-188 (topo deste arquivo); soberania digital em `docs/11_FICHAS_DOS_ATORES.md:475`. Est +1 em A: defende a voz silenciada. Cor A Verde (meio ambiente, `docs/10_GUIA_DE_ESTILO_E_TOM.md:258`); Cor B Laranja (a empresa privada decide; desregulamentação, `:261`). Simplificação: abrir dados de usuários exige ordem judicial `[não verificado]`.

### INST-197 — Aula que Ensina a Odiar o Eleitor Rival

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aula contra o eleitor rival |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 3 |
| **Técnica** | Didatismo Acusatório |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Um canal da sua base dá 'aulas' que ensinam a ver quem vota no rival como inimigo do país. Os vídeos viralizam. |
| **Opção A** | Compartilhar a aula |
| **Efeitos A** | `Capital Político` +10, `Legitimidade` +5, `Consciência` -15 |
| **Consequência A** | "Sua base se inflama. Nas famílias, quem vota no rival vira inimigo." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-024` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Pedir que o canal pare |
| **Efeitos B** | `Consciência` +10, `Integridade` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência B** | "O canal obedece e acusa você de trair a base. A militância esfria." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-024` +1, `ACT-013` +1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-197 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-197):** didatismo acusatório = "pedagogia invertida que ensina a odiar" (`docs/05_SISTEMAS_E_MECANICAS.md:419`); depois de indígenas (INST-187) e pobres (INST-191), o alvo é o vizinho que vota diferente, e a "aula" sai da sua base (o PSI aceitou a técnica de qualquer lado, sem falsa equivalência). Ideia do banco "Polarização" (`docs/12_FICHAS_DOS_MODOS.md:542`), sem rótulo ideológico nem pedido de impeachment. 'aulas' entre aspas, como 'ensina' na INST-187. Ano mínimo 3: a reeleição se aproxima e a mobilização tenta (proposta do GD, mesma lógica da INST-189); carta ligada a `Consciência` (B) no Ano 3+. `ACT-024` combate a desinformação (`docs/11_FICHAS_DOS_ATORES.md:545`) com voz didática (`:544`); `ACT-013` forma cidadãos críticos (`:334`). Eixo: tratar o rival como "inimigo do país" = Est −1; pedir que pare = Est +1. Cores: Roxo × Azul, escolha do GD para mostrar a técnica fora do campo Preto; alternativa Preto × Amarelo.

### INST-198 — Vídeo Falso de Presidente Vizinho Feito com IA

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vídeo falso do vizinho |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 1 |
| **Técnica** | Deepfake |
| **Cor A** | Verde |
| **Cor B** | Amarelo |
| **Problema** | Em um vídeo, o presidente de um país vizinho anuncia o fim da compra de carne do Brasil. O Itamaraty suspeita de IA. O agro quer revide. |
| **Opção A** | Retaliar o vizinho |
| **Efeitos A** | `Legitimidade` +10, `Soberania` +5, `Integridade` -10, `Consciência` -5 |
| **Consequência A** | "Você taxa os produtos do vizinho. Dias depois, o vídeo se revela falso." |
| **Eixo A** | [0, -1, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-010` -1 |
| **Evento A** | "O vizinho revida e fecha o mercado a produtos do Brasil." · atraso 1 · `Caixa` -15 |
| **Reação A** | Aceitar |
| **Opção B** | Confirmar com o vizinho |
| **Efeitos B** | `Integridade` +10, `Segurança` +5, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência B** | "O vizinho desmente o vídeo. Nas redes, o agro chama você de fraco." |
| **Eixo B** | [0, +1, 0, 0] |
| **Atores B** | `ACT-010` +1, `ACT-001` -1 |
| **Evento B** | — |
| **Reação B** | Investigar |
| **Aprendizado** | APR-198 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-198):** deepfake (`docs/05_SISTEMAS_E_MECANICAS.md:416`) que cria crise entre países; difere da INST-183 (vídeo falso de você) e da INST-188 (golpe). País e líder sem nome. O problema traz dúvida ("suspeita de IA"), não estigma. Evento A: a retaliação puxa retaliação, com o multiplicador do ano em que dispara (`gdd/sistemas/08_eventos.md:10`). Dip: retaliar = Nacionalismo −1; confirmar com o vizinho = cooperação +1 (kit §4; `gdd/sistemas/04_eixo.md:23`). `ACT-010` oferece `Segurança` e cobra `Capital Político` (`docs/11_FICHAS_DOS_ATORES.md:277-278`) — daí os efeitos de B; `ACT-001` como agro exportador que pede revide (inferência do GD; ficha em `:93-108`). Cor A Verde (agronegócio, `docs/10_GUIA_DE_ESTILO_E_TOM.md:258`); Cor B Amarelo (negociação, `:259`).

### INST-199 — Rifas de Influenciadores Lavam Dinheiro de Facção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Rifas da facção |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 3 |
| **Técnica** | Cachê da Desgraça |
| **Cor A** | Azul |
| **Cor B** | Preto |
| **Problema** | Influenciadores vendem rifas de carros nas redes. Quase todos perdem, e uma facção usa as rifas para lavar dinheiro. |
| **Opção A** | Seguir o dinheiro |
| **Efeitos A** | `Segurança` +10, `Integridade` +10, `Capital Político` -10, `Legitimidade` -10 |
| **Consequência A** | "A investigação leva meses. Ao fim, a Justiça bloqueia as contas da facção." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-023` +1 |
| **Evento A** | — |
| **Reação A** | Investigar |
| **Opção B** | Prender ao vivo |
| **Efeitos B** | `Legitimidade` +10, `Segurança` +5, `Integridade` -10, `Dignidade` -5 |
| **Consequência B** | "As prisões viram espetáculo. O dinheiro da facção some antes do bloqueio." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | — |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-199 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-199):** rifa ilegal como cachê da desgraça: o influenciador lucra porque quase todos perdem (`docs/05_SISTEMAS_E_MECANICAS.md:418`), e a facção usa o fluxo para lavar dinheiro (crime organizado financia, `gdd/sistemas/09_desinformacao.md:14`). Ideia do banco "Crime organizado" (`docs/12_FICHAS_DOS_MODOS.md:544`), sem nome de facção. Sem opção Aceitar (Investigar × Recusar, permitido: `gdd/sistemas/09_desinformacao.md:69`): o dilema é estrutura × espetáculo. Ano mínimo 3: fase "Crise", com Prisional e Policial frequente (`docs/12_FICHAS_DOS_MODOS.md:576`); carta ligada a `Segurança` (A e B), `Integridade` (A) e `Legitimidade` (B) no Ano 3+. Eixo B pela convenção de punitivismo, em grau menor (Est −1). `ACT-023` investiga e denuncia (`docs/11_FICHAS_DOS_ATORES.md:526`). Cor A Azul: inteligência financeira (inferência do GD); Cor B Preto: militarização e espetáculo (`docs/10_GUIA_DE_ESTILO_E_TOM.md:262`). Sem estereótipo: a carta não diz de onde vêm os influenciadores.

### INST-200 — Pânico contra o Baile Funk

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pânico contra o funk |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 1 |
| **Técnica** | Pânico Moral |
| **Cor A** | Preto |
| **Cor B** | Roxo |
| **Problema** | Vídeos chamam o baile funk de 'escola do crime'. É falso, mas um projeto quer proibir os bailes. |
| **Opção A** | Apoiar a proibição |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` +5, `Consciência` -10, `Dignidade` -10 |
| **Consequência A** | "Os bailes viram caso de polícia. Os jovens perdem o lazer do bairro." |
| **Eixo A** | [0, 0, -1, -1] |
| **Atores A** | `ACT-022` +1, `ACT-019` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Regularizar os bailes |
| **Efeitos B** | `Dignidade` +10, `Consciência` +5, `Legitimidade` -10, `Caixa` -5 |
| **Consequência B** | "Os bailes ganham alvará. Seus rivais dizem que você apoia o crime." |
| **Eixo B** | [0, 0, +1, +1] |
| **Atores B** | `ACT-019` +1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-200 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-200):** pânico moral (`docs/05_SISTEMAS_E_MECANICAS.md:415`) contra uma cultura jovem e popular, a do público do jogo (`CLAUDE.md`, público-alvo). O problema diz "Não há prova". Substitui a maioridade penal do banco (`docs/12_FICHAS_DOS_MODOS.md:545`), que já está planejada em INST-010, INST-087 e INST-124 (`:101`, `:290`, `:383`); mesmo tema do banco (punitivismo contra a juventude). Eixo pela convenção de punitivismo e costumes: proibir = Soc −1, Est −1; regularizar = Soc +1, Est +1. `ACT-019` cobra liberdade de criação e "cria festival periférico" (`docs/11_FICHAS_DOS_ATORES.md:451-452`); `ACT-012` "faz pânico moral" na própria ficha (`:319`, ATOR-059) e cobra "censura aos costumes" (`:318`). Cor A Preto (pânico moral, `docs/10_GUIA_DE_ESTILO_E_TOM.md:262`); Cor B Roxo (movimentos sociais, `:260`).

---

## Relatório da onda (script, 2026-10-20)

`PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-03/cartas.md --no-learning --wave-report` → **9 cartas conferidas, 0 erros.**
**Doc 17 + Ondas 1-3 (cópia no scratchpad, repositório intacto):** 54 cartas, 0 erros, nenhum ID repetido; modo Influenciador com 20 cartas.

| ID | Título | Técnica | Reações A × B | Cores A × B | Evento | Ano mín. |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| INST-192 | Boato da taxa no Pix | Pânico Moral | Recusar × Aceitar | Vermelho × Amarelo | B (atraso 2) | 1 |
| INST-193 | Indicação para o Esporte | Cachê da Desgraça | Recusar × Aceitar | Azul × Amarelo | — | 2 |
| INST-194 | Comissão sobre a perda | Cachê da Desgraça | Recusar × Aceitar | Vermelho × Laranja | A (positivo, atraso 2) | 2 |
| INST-195 | Boato contra as urnas | Desmoralização | Aceitar × Recusar | Preto × Vermelho | A (atraso 1) | 2 |
| INST-196 | Denúncia em massa | Fazenda de IA | Investigar × Aceitar | Verde × Laranja | — | 1 |
| INST-197 | Aula contra o eleitor rival | Didatismo Acusatório | Aceitar × Recusar | Roxo × Azul | — | 3 |
| INST-198 | Vídeo falso do vizinho | Deepfake | Aceitar × Investigar | Verde × Amarelo | A (atraso 1) | 1 |
| INST-199 | Rifas da facção | Cachê da Desgraça | Investigar × Recusar | Azul × Preto | — | 3 |
| INST-200 | Pânico contra o funk | Pânico Moral | Aceitar × Recusar | Preto × Roxo | — | 1 |

| Meta do pedido | Resultado |
| :--- | :--- |
| ≥ 2 Cachê na onda; ≤ 4 por técnica no modo | Cachê 3 (193, 194, 199). Modo: Cachê 4, Pânico Moral 4, Desmoralização 3, Deepfake 3, Fazenda de IA 3, Didatismo 3 |
| Três reações; Aceitar perde `Integridade` ou `Consciência` | Aceitar em 8 cartas (as 8 perdem), Recusar em 7, Investigar em 3 (196, 198, 199) |
| Dip ≠ 0 em ≥ 3 opções | 4 (196 A/B, 198 A/B) |
| Eventos em 3-5 de 18 | 4 (22%) |
| ≥ 3 cartas com Ano mínimo 2-4 e ganho | 5 (193, 194, 195, 197, 199); ligadas no Ano 2+ a `Integridade` 4, `Legitimidade` 5, `Capital Político` 4, `Consciência` 3, `Segurança` 2, `Dignidade` 1, `Caixa` 1 |
| 7 cores, saldo negativo, custo em toda opção | Vermelho, Azul, Amarelo e Preto 3; Laranja, Verde e Roxo 2; todas com saldo negativo; Aceitar em 5 cores |
| Eixos ≠ 0 | Eco 28%, Dip 22%, Soc 17%, Est 61% |

Avisos fora das metas (só relatório): no baralho inteiro (doc 17 + Ondas 1-3), eventos em 13% (abaixo de 15%) e `Dignidade` com 1 opção positiva no Ano 2+ (era 0; é a INST-194 A). Nesta onda, nenhuma opção com `Soberania` positiva no Ano 2+.

## Propostas do GD que pedem o PO (provisórias)

1. **Banco do MOD-010** (`docs/12_FICHAS_DOS_MODOS.md:537-545`) usado só como ideia: 195 (ataque a instituição → urnas), 196 (resistência → ativista silenciada), 197 (polarização), 199 (crime organizado), 198 → 193 (eleita com bets → indicada ministra). Duas trocas: (a) maioridade → baile funk (INST-200), porque a maioridade já está em INST-010, INST-087 e INST-124 (`:101`, `:290`, `:383`) — A) funk, recomendada; B) maioridade com foco no vídeo viral; C) boato de toque de recolher de facção; (b) relatora das bets → indicação ao Ministério do Esporte (INST-193), porque relator com conflito repete a INST-001 (`docs/17_ROTEIRO_DAS_CARTAS.md:78-85`). A lista do doc 12 precisa ser regravada quando o modo for gravado.
2. **INST-195:** Est −2 em A (único ±2 da onda). Alternativa: −1.
3. **INST-194:** a carta simplifica o projeto real (tirar influenciadores dos anúncios) para "proibir o pagamento por perda". Alternativa fiel: "Um projeto quer tirar influenciadores dos anúncios de apostas." e opção A "Tirar dos anúncios".
4. **Evento extra pronto** (baralho em 13%): INST-196 B "O garimpo ilegal avança onde a ativista denunciava." · atraso 1 · `Soberania` -10. A onda iria a 5 de 18 (28%, acima dos 25% do kit, dentro dos 3-5 do pedido).
5. **Ano mínimo 2-3** em 193, 194, 195, 197 e 199 (pressupostos nas notas). Divergência: o pedido diz que o modo é frequente nos Anos 3-4; o doc 12 diz Ano 2 (`:575`) e "todos os modos" no Ano 4 (`:577`).
6. **Quem fala:** só atores, nove diferentes; `ACT-007`, `ACT-010`, `ACT-011`, `ACT-014` e `ACT-019` falam fora dos modos da §12.3.3, tabela que é guia (`docs/12_FICHAS_DOS_MODOS.md:581`).

## Dúvidas para o PSI

1. INST-200: "escola do crime" entre aspas, com "Não há prova"; `ACT-012` +1 na proibição (a ficha traz "O Pastor faz pânico moral", `docs/11_FICHAS_DOS_ATORES.md:319`). Estigmatiza evangélicos? Alternativa: nenhum ator em A além de `ACT-019` -1.
2. INST-197: a técnica sai da base do governo (Roxo). Sem falsa equivalência? O problema não diz "é falso" porque não afirma fato; as aspas em 'aulas' bastam?
3. INST-195: eleição e golpe; a opção Aceitar tem ganho real (`Capital Político` +10) e cor Preto. A consequência e o evento mostram o custo — basta para não normalizar a narrativa?
4. INST-199: facção e influenciadores, sem origem nem rosto. Risco de estereótipo de periferia?
5. INST-193 e INST-194 lembram casos reais (CPI das Bets, reportagem de 2024), sem nomes.
6. INST-192: "Pix" conta como marca? É o sistema público de pagamentos do Banco Central.
7. APR-198: a pista usa o vídeo falso de 2022 de um líder de país em guerra; o Aprendizado deve nomear o caso ou só descrever?

## Autoconferência (`.claude/rules/verificacao.md`)

18 citações abertas e conferidas em 2026-10-20, todas batem: `docs/11_FICHAS_DOS_ATORES.md:217`, `:219`, `:296`, `:433`, `:475`, `:508`, `:513`, `:530`; `docs/10_GUIA_DE_ESTILO_E_TOM.md:239`; `docs/12_FICHAS_DOS_MODOS.md:575`, `:576`, `:602`; `gdd/sistemas/04_eixo.md:23`; `docs/17_ROTEIRO_DAS_CARTAS.md:430`, `:714`; `.claude/notas/execucao/onda-01/cartas.md:238`; `gdd/sistemas/09_desinformacao.md:69`; `docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:803`. Uma corrigida no caminho (cabeçalho dos Aprendizados: `:776-801` → `:775-803`).

Estilo: script do GD no scratchpad (frases ≤ 20 palavras, gerúndio, advérbios, números; contagem NFC dos Aprendizados) sem achados no fim; ajustes no caminho: "muita gente" → "parte do país", "Prender já, ao vivo" → "Prender ao vivo", "ainda" tirado do APR-199, "garimpeiros" → "garimpo ilegal" (mira o negócio, não o trabalhador).

Busca na web (premissa da INST-194; nada entrou no texto ao jogador): https://intercept.com.br/2024/11/07/bets-prior-influenciadores/ · https://euqueroinvestir.com/economia/senado-aprova-proibicao-de-atletas-e-influenciadores-em-anuncios-de-bets · https://tecnoblog.net/noticias/jogo-do-tigrinho-sera-autorizado-mas-empresas-e-influencers-terao-regras/ (este não diz se a comissão por perda é proibida).

Higiene: script rodado com `PYTHONDONTWRITEBYTECODE=1` (sem `__pycache__`); nenhum arquivo do repositório fora de `.claude/notas/execucao/onda-03/` foi tocado; sem commit.
