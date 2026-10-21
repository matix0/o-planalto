# Onda 1 — Modo Influenciador (INST-182 a INST-191) — rascunho do GD

**Status:** rascunho do GD para o fio principal (P-015, Onda 1, 2026-10-20). Nada aqui foi aprovado pelo PO; todas as cartas ficam "provisório (DP-pendente)". Não grava no doc 17.
**Formato:** tabela estendida do `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1 (`:13-40`), lida pelo nome da linha, como a INST-181 (`docs/17_ROTEIRO_DAS_CARTAS.md:698-726`).
**Conferência:** `python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-01/cartas.md --no-learning --wave-report` (resultado no fim deste arquivo).
**Notas do GD:** abaixo do `---` de cada carta; o script lê só a tabela.
**Aprendizados (rascunho):** `.claude/notas/execucao/onda-01/aprendizados.md`.

---

### INST-182 — Boato contra a Ministra do Meio Ambiente

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Boato contra a ministra |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-018` |
| **Ano mínimo** | 1 |
| **Técnica** | Desmoralização |
| **Cor A** | Preto |
| **Cor B** | Verde |
| **Problema** | Perfis dizem que sua ministra do Meio Ambiente vendeu terras da Amazônia a estrangeiros. Não há prova. O boato viraliza. |
| **Opção A** | Demitir a ministra |
| **Efeitos A** | `Capital Político` +10, `Legitimidade` +5, `Integridade` -15 |
| **Consequência A** | "A ministra cai. Para muita gente, a demissão prova o boato." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-001` +1, `ACT-018` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Investigar a origem |
| **Efeitos B** | `Capital Político` -10, `Legitimidade` -5, `Integridade` +10 |
| **Consequência B** | "A PF rastreia os perfis. O boato segue no ar." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-018` +1 |
| **Evento B** | — |
| **Reação B** | Investigar |
| **Aprendizado** | APR-182 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-182):** dilema = ceder ao boato (a demissão "confirma" a mentira) × investigar (custo político enquanto o boato corre). Técnica: "destruir a reputação do adversário com mentiras" (`docs/05_SISTEMAS_E_MECANICAS.md:414`). Cor A Preto: indignação nacionalista com a "venda da Amazônia"; Cor B Verde: meio ambiente (`docs/10_GUIA_DE_ESTILO_E_TOM.md:258`). Atores: ACT-018 defende a floresta (`docs/11_FICHAS_DOS_ATORES.md:429`); ACT-001 ganhar com a queda é inferência do GD `[não verificado]`. Eixo Est: punir sem apuração (−1) × apurar (+1), como INST-161 (`docs/17_ROTEIRO_DAS_CARTAS.md:682`, `:688`). Reações seguem o guia (`gdd/sistemas/09_desinformacao.md:36-40`).

### INST-183 — Vídeo Falso do Presidente Feito com IA

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vídeo falso de você |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Técnica** | Deepfake |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Um vídeo feito com IA mostra você. Nele, você anuncia o fim do auxílio. É falso, mas milhões de pessoas acreditam. |
| **Opção A** | Revidar com vídeo falso |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` +5, `Integridade` -15, `Consciência` -5 |
| **Consequência A** | "Seu time solta um vídeo falso do rival. As redes viram uma guerra de mentiras." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-023` -1 |
| **Evento A** | "Todo vídeo vira suspeito. Até os verdadeiros." · atraso 1 · `Integridade` -10, `Consciência` -5 |
| **Reação A** | Aceitar |
| **Opção B** | Pedir perícia à PF |
| **Efeitos B** | `Integridade` +10, `Consciência` +5, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência B** | "A perícia prova a fraude. O desmentido chega a menos gente que a mentira." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-023` +1 |
| **Evento B** | — |
| **Reação B** | Investigar |
| **Aprendizado** | APR-183 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-183):** a técnica é usada contra você e oferecida como revide (tentação do atalho, `gdd/sistemas/09_desinformacao.md:14`); nenhum passo a passo. Ano mínimo 2: pressupõe um governo com um ano de história; o modo aparece mais na fase "Realidade Bate" (`docs/12_FICHAS_DOS_MODOS.md:575`); as duas opções têm ganho, então a carta é ligada no Ano 2+ (D-115, `gdd/sistemas/06_sorteio.md:28-30`). Evento A: o "dividendo do mentiroso" — quando tudo pode ser falso, o verdadeiro também perde crédito (conceito acadêmico, `[não verificado]`); atraso 1 para ligar causa e efeito antes da próxima escolha (`gdd/sistemas/08_eventos.md:14`). Cor A Roxo: o revide vem da ala mais aguerrida da base; nesta onda, toda cor tem ao menos uma opção Aceitar (sem "moral por cor", D-097/D-098). ACT-023 investiga e denuncia (`docs/11_FICHAS_DOS_ATORES.md:526`).

### INST-184 — Pânico contra Refugiados na Fronteira

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pânico na fronteira |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 1 |
| **Técnica** | Pânico Moral |
| **Cor A** | Preto |
| **Cor B** | Roxo |
| **Problema** | Vídeos culpam refugiados de um país vizinho por todo crime e toda doença. É falso, mas a cidade da fronteira entra em pânico. |
| **Opção A** | Fechar a fronteira |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` +5, `Dignidade` -15, `Integridade` -10 |
| **Consequência A** | "A fronteira fecha. Famílias ficam presas do outro lado." |
| **Eixo A** | [0, -2, -1, -1] |
| **Atores A** | `ACT-010` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Acolher e checar os fatos |
| **Efeitos B** | `Dignidade` +10, `Consciência` +5, `Legitimidade` -10, `Caixa` -10 |
| **Consequência B** | "Os refugiados ficam. Parte da cidade ajuda, parte tem medo." |
| **Eixo B** | [0, +2, +1, 0] |
| **Atores B** | `ACT-010` +1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-184 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-184):** pânico moral clássico: um grupo vira ameaça ("criar medo sobre um tema", `docs/05_SISTEMAS_E_MECANICAS.md:415`). O problema marca "Não há prova" para não reforçar o estigma (pré-desmentido); nenhum país nomeado. Diplomacia nas duas opções (≥ 15% das opções; o GDD registra 4 de 44, 9%, `gdd/sistemas/04_eixo.md:74`): fechar = Nacionalismo −2; acolher = Globalismo +2 (cooperação humanitária). Cor A Preto: pânico moral e militarização (`docs/10_GUIA_DE_ESTILO_E_TOM.md:262`); Cor B Roxo: movimentos sociais (`:260`). ACT-010 defende a imagem externa e a autonomia (`docs/11_FICHAS_DOS_ATORES.md:275`); fechar a fronteira contra refugiados contraria tratados `[não verificado]`. Tema sensível (xenofobia): passa pelo PSI.

### INST-185 — Streamer Critica o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Streamer critica o governo |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 1 |
| **Técnica** | Desmoralização |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Um streamer com 3 milhões de seguidores detona seu governo. Aliados querem espalhar, sem prova, que ele é pago por um rival. |
| **Opção A** | Espalhar o boato |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` +5, `Integridade` -10, `Consciência` -10 |
| **Consequência A** | "O boato pega. O streamer perde patrocínio e para de falar de política." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-024` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Debater ao vivo |
| **Efeitos B** | `Consciência` +10, `Integridade` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência B** | "Você entra na live dele. A audiência bate recorde, e as críticas também." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-024` +1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-185 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-185):** título do banco de ideias do doc 12 (`docs/12_FICHAS_DOS_MODOS.md:530`), dilema novo: a desmoralização é tentação do seu lado contra um crítico. Cor A Vermelho: a técnica não tem dono; a base também cai nela (sem "moral por cor"). A consequência A mostra o efeito de silenciar o crítico, sem julgar. ACT-024 combate a desinformação (`docs/11_FICHAS_DOS_ATORES.md:545`): contrariado pelo boato, atendido pelo debate. Eixo Est: calar o crítico (−1) × debate aberto (+1). "Streamer" e "live" são estrangeirismos do vocabulário do público de 15-30 anos (o doc 12 usa "streamer"); alternativa "Crítico nas redes" se o PO preferir.

### INST-186 — Rede de Perfis Falsos Operada do Exterior

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Robôs de outro país |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Técnica** | Fazenda de IA |
| **Cor A** | Preto |
| **Cor B** | Amarelo |
| **Problema** | Pesquisadores acham 8 mil perfis falsos que atacam seu governo. Uma potência estrangeira opera a rede. |
| **Opção A** | Investigar e expor |
| **Efeitos A** | `Soberania` +10, `Segurança` +5, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "O mundo vê a interferência. A potência nega e ameaça retaliar." |
| **Eixo A** | [0, -1, 0, +1] |
| **Atores A** | `ACT-021` -1, `ACT-008` +1 |
| **Evento A** | "A potência estrangeira suspende compras do Brasil." · atraso 1 · `Caixa` -15 |
| **Reação A** | Investigar |
| **Opção B** | Abafar o caso |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Soberania` -15, `Integridade` -10 |
| **Consequência B** | "O comércio segue. Os perfis falsos também." |
| **Eixo B** | [+1, +1, 0, -1] |
| **Atores B** | `ACT-021` +1, `ACT-008` -1 |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-186 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-186):** fazenda de IA = "rede de perfis coordenados" (`docs/05_SISTEMAS_E_MECANICAS.md:417`), aqui como interferência estrangeira (meta de Diplomacia). Potência sem nome: nenhuma acusação a país real. Ano mínimo 2: Geopolítico e Influenciador na fase "Realidade Bate" (`docs/12_FICHAS_DOS_MODOS.md:575`); carta ligada a `Soberania` e `Segurança` (A) e a `Caixa` (B) no Ano 2+ (a onda não tinha outra opção de Ano 2+ com ganho em `Segurança`). Evento A: retaliação comercial, efeito com o multiplicador do ano em que dispara (`gdd/sistemas/08_eventos.md:10`). Eixo: expor = Nacionalismo −1 e transparência +1; abafar = comércio primeiro (Eco +1, Dip +1) e segredo (Est −1). Cor A Preto: defesa e soberania pela via militar (`docs/10_GUIA_DE_ESTILO_E_TOM.md:262`); Cor B Amarelo: negociação (`:259`). ACT-008 fala em nome da "segurança nacional" (`docs/11_FICHAS_DOS_ATORES.md:237`); ACT-021 quer "expandir influência" (`docs/11_FICHAS_DOS_ATORES.md:488`). Simplificação: na vida real, quem detecta essas redes costuma ser PF, ABIN ou as plataformas `[não verificado]`; ACT-008 não está entre os atores do modo no guia (`docs/12_FICHAS_DOS_MODOS.md:592`), que não obriga (`:581`).

### INST-187 — Canal com Cara de Aula contra os Indígenas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aula contra os indígenas |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 1 |
| **Técnica** | Didatismo Acusatório |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | Um canal com cara de aula 'ensina' que indígenas destroem a floresta. É falso, e os anúncios do seu governo pagam parte dos vídeos. |
| **Opção A** | Tirar os anúncios |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "O canal perde a verba. Aliados dele no Congresso falam em censura." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-001` -1, `ACT-013` +1 |
| **Evento A** | — |
| **Reação A** | Recusar |
| **Opção B** | Manter os anúncios |
| **Efeitos B** | `Capital Político` +10, `Consciência` -15, `Dignidade` -5 |
| **Consequência B** | "O canal cresce com dinheiro público. Nas escolas, alunos repetem a aula." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-001` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-187 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-187):** didatismo acusatório = "pedagogia invertida que ensina a odiar" (`docs/05_SISTEMAS_E_MECANICAS.md:419`): ódio com formato de aula. A alavanca do Presidente é a publicidade oficial (onde o governo põe o dinheiro), não a censura: tirar o anúncio não tira o canal do ar, por isso Est 0. Ideia do banco do doc 12 ("Influenciador financiado pelo agro", `docs/12_FICHAS_DOS_MODOS.md:532`); o problema não diz quem financia o canal, só a reação da bancada aparece. ACT-001 como bancada ruralista, como na INST-005 (`docs/17_ROTEIRO_DAS_CARTAS.md:182-186`); ACT-013 forma cidadãos críticos (`docs/11_FICHAS_DOS_ATORES.md:334`). Cor A Roxo (movimentos sociais, `docs/10_GUIA_DE_ESTILO_E_TOM.md:260`); Cor B Verde (agronegócio, `:258`). Tema sensível (racismo contra indígenas, aviso "Racismo" da DP-008): passa pelo PSI.

### INST-188 — Golpe com Rosto Famoso Feito com IA

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Golpe com rosto famoso |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Técnica** | Deepfake |
| **Cor A** | Azul |
| **Cor B** | Laranja |
| **Problema** | Anúncios usam um vídeo falso de um médico famoso para vender uma 'cura' do diabetes. A plataforma lucra e não tira do ar. |
| **Opção A** | Multar a plataforma |
| **Efeitos A** | `Dignidade` +10, `Soberania` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "A plataforma paga a multa e acusa o Brasil de censurar a internet." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-020` -1, `ACT-014` +1 |
| **Evento A** | — |
| **Reação A** | Recusar |
| **Opção B** | Esperar a autorregulação |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Integridade` -10 |
| **Consequência B** | "A plataforma promete agir. Os anúncios falsos seguem no ar." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-020` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-188 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-188):** 2º Deepfake da onda, agora como golpe contra o público (a INST-183 mira o governo). Plataforma de fora (sugestão do prompt para Diplomacia): multar = regra do Brasil sobre empresa estrangeira (Dip −1; "soberania digital", `docs/11_FICHAS_DOS_ATORES.md:475`) e intervenção no mercado (Eco −1); esperar = autorregulação (Eco +1) e regra global da plataforma (Dip +1). A consequência A mostra a reação típica da plataforma, sem julgar. Cor A Azul (regras estáveis de mercado, `docs/10_GUIA_DE_ESTILO_E_TOM.md:257`); Cor B Laranja (desregulamentação, `:261`). ACT-020 teme regulação (`docs/11_FICHAS_DOS_ATORES.md:470`); ACT-014 quer "salvar vidas" (`:353`). Na vida real, multa a plataforma passa por órgão de defesa do consumidor ou pela Justiça, não pelo Presidente direto `[não verificado]`. Ponto para o PSI: o texto diz "a plataforma", mas o ator ACT-020 tem marca no nome (doc 11, D-083).

### INST-189 — Perfis Falsos para Elogiar o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Elogio de robô |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 3 |
| **Técnica** | Fazenda de IA |
| **Cor A** | Amarelo |
| **Cor B** | Laranja |
| **Problema** | Uma agência oferece 5 mil perfis falsos para elogiar seu governo nas redes. Ela garante: ninguém percebe que são robôs. |
| **Opção A** | Contratar a agência |
| **Efeitos A** | `Legitimidade` +15, `Capital Político` +5, `Caixa` -10, `Integridade` -15 |
| **Consequência A** | "Os elogios inundam as redes. O debate fica mais barulhento e mais falso." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-011` +1 |
| **Evento A** | "Uma reportagem revela os perfis pagos pelo governo." · atraso 1 · `Legitimidade` -10, `Integridade` -10 |
| **Reação A** | Aceitar |
| **Opção B** | Recusar a oferta |
| **Efeitos B** | `Integridade` +10, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência B** | "Você fica só com perfis reais. Os ataques dominam as redes." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-011` -1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-189 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-189):** 2ª Fazenda de IA, agora como tentação a favor do governo ("apoio pago", `gdd/sistemas/09_desinformacao.md:14`). Ideia do banco do doc 12 ("Influenciador pago para elogiar governo", `docs/12_FICHAS_DOS_MODOS.md:536`), sem copiar a carta do P-003. Ano mínimo 3 (fase "Crise", `gdd/GDD.md:424`): proposta do GD, a tentação pesa mais com o governo acuado; o doc 12 não põe o modo entre os frequentes do Ano 3 (`docs/12_FICHAS_DOS_MODOS.md:576`), por isso é escolha a confirmar; carta ligada a `Legitimidade` (A) e `Integridade` (B) no Ano 3+. Evento A com atraso 1: escolhida no Ano 3, a denúncia chega no Ano 4 (×1,5); escolhida no Ano 4, vai para o epílogo (`gdd/sistemas/08_eventos.md:10`). ACT-011 traz a oferta (voz "pragmática, sedutora", `docs/11_FICHAS_DOS_ATORES.md:293`); ele levar a agência é inferência do GD `[não verificado]`. Cor A Amarelo (governabilidade, `docs/10_GUIA_DE_ESTILO_E_TOM.md:259`); Cor B Laranja: recusa por não gastar dinheiro público com propaganda (inferência do GD). Eixo Est: manipular o debate (−1) × respeitar o debate (+1).

### INST-190 — Pânico contra a Vacina do HPV

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Medo da vacina |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Técnica** | Pânico Moral |
| **Cor A** | Laranja |
| **Cor B** | Vermelho |
| **Problema** | Vídeos dizem que a vacina contra o HPV paralisa meninas. É boato, mas pais desmarcam a vacinação nas escolas. |
| **Opção A** | Investigar quem lucra |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -10, `Dignidade` -10 |
| **Consequência A** | "A PF acha canais que vendem 'vacina natural'. O medo continua nas escolas." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Reação A** | Investigar |
| **Opção B** | Campanha com médicos |
| **Efeitos B** | `Dignidade` +10, `Consciência` +5, `Caixa` -15, `Legitimidade` -5 |
| **Consequência B** | "Médicos vão às escolas e às redes. A campanha custa caro e demora." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-014` +1 |
| **Evento B** | "A procura pela vacina volta a subir nas escolas." · atraso 2 · `Dignidade` +10 |
| **Reação B** | Recusar |
| **Aprendizado** | APR-190 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-190):** 2º Pânico Moral: medo sobre um tema de saúde (`docs/05_SISTEMAS_E_MECANICAS.md:415`), ideia do banco do doc 12 ("Influenciadora contra vacinação", `docs/12_FICHAS_DOS_MODOS.md:535`). O problema diz "É boato" para não reforçar o mito (pré-desmentido). Carta sem opção Aceitar (investigar × recusar), permitida (`gdd/sistemas/09_desinformacao.md:69`): o dilema é punir quem lucra com o medo × convencer quem tem medo. Evento B positivo e atrasado: "investir hoje vira … depois" (`gdd/sistemas/08_eventos.md:14`); com atraso 2, escolhida no Ano 3 ou 4 vai para o epílogo (`:10`). Eixo B: campanha pública de saúde = Coletivismo −1 (como "Cortar da saúde" = Mercado +2, `docs/17_ROTEIRO_DAS_CARTAS.md:256`). Cor A Laranja: punir fraude contra o consumidor (inferência do GD); Cor B Vermelho: assistência social (`docs/10_GUIA_DE_ESTILO_E_TOM.md:256`). Tema de saúde de menores: o PSI confere o tom.

### INST-191 — Curso Grátis que Culpa o Pobre

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Curso que culpa o pobre |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 1 |
| **Técnica** | Didatismo Acusatório |
| **Cor A** | Azul |
| **Cor B** | Vermelho |
| **Problema** | Um coach oferece de graça seu curso a jovens do programa de emprego. A aula 'ensina' que pobre é pobre porque quer. É falso. |
| **Opção A** | Aceitar o curso |
| **Efeitos A** | `Legitimidade` +10, `Caixa` +5, `Consciência` -15, `Dignidade` -5 |
| **Consequência A** | "Os jovens aprendem a culpar quem é pobre. Até a si mesmos." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-022` +1, `ACT-013` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Investigar quem financia |
| **Efeitos B** | `Integridade` +10, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência B** | "Uma casa de apostas banca o curso. O coach chama você de inimigo." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-022` -1 |
| **Evento B** | — |
| **Reação B** | Investigar |
| **Aprendizado** | APR-191 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-191):** 2º Didatismo Acusatório: a "aula" ensina a culpar o pobre pela pobreza, para um público que é o próprio alvo (15-30 anos, `CLAUDE.md`). Sem estereótipo de periferia: a carta expõe o preconceito, não o repete como fato. ACT-022 vende cursos e mobiliza a juventude (`docs/11_FICHAS_DOS_ATORES.md:507`), oferece `Legitimidade` e cobra `Consciência` (`:509-510`) — daí os efeitos de A; financiado por bets (`:513`) — daí a consequência B (não é a técnica Cachê da Desgraça: não há comissão sobre perdas). ACT-013 contra o curso (`:334`). Eixo A: pobreza como culpa individual = Mercado +1; B: transparência do financiamento = Est +1. Cor A Azul (reformas e "educação financeira", inferência do GD); Cor B Vermelho (assistência social, `docs/10_GUIA_DE_ESTILO_E_TOM.md:256`).

## Conferência da onda (GD, 2026-10-20)

**Script:** `python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-01/cartas.md --no-learning --wave-report` → **10 cartas conferidas, 0 erros.** Avisos da onda: eventos 4 de 20 (20%); eixo ≠ 0: Eco 25%, Dip 30%, Soc 20%, Est 60%; as 7 cores com saldo negativo em ≥ 1 medidor; 2 cartas por técnica, exceto Cachê da Desgraça (0 na onda; fica para a onda 2, a INST-181 já tem 1); carta ligada no Ano 2+: `Integridade` 3, `Capital Político` 3, `Legitimidade` 2, `Consciência`, `Soberania`, `Segurança` e `Caixa` 1 cada, `Dignidade` 0.
**Doc 17 + onda (cópia no scratchpad, repositório intacto):** 35 cartas, 0 erros, nenhum ID repetido; Diplomacia do baralho passa a 17% (10 de 60 opções).

| ID | Título | Técnica | Reações A × B | Cores A × B | Evento | Ano mín. | Dip ≠ 0 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| INST-182 | Boato contra a ministra | Desmoralização | Aceitar × Investigar | Preto × Verde | — | 1 | — |
| INST-183 | Vídeo falso de você | Deepfake | Aceitar × Investigar | Roxo × Azul | A (atraso 1) | 2 | — |
| INST-184 | Pânico na fronteira | Pânico Moral | Aceitar × Recusar | Preto × Roxo | — | 1 | A, B |
| INST-185 | Streamer critica o governo | Desmoralização | Aceitar × Recusar | Vermelho × Amarelo | — | 1 | — |
| INST-186 | Robôs de outro país | Fazenda de IA | Investigar × Aceitar | Preto × Amarelo | A (atraso 1) | 2 | A, B |
| INST-187 | Aula contra os indígenas | Didatismo Acusatório | Recusar × Aceitar | Roxo × Verde | — | 1 | — |
| INST-188 | Golpe com rosto famoso | Deepfake | Recusar × Aceitar | Azul × Laranja | — | 1 | A, B |
| INST-189 | Elogio de robô | Fazenda de IA | Aceitar × Recusar | Amarelo × Laranja | A (atraso 1) | 3 | — |
| INST-190 | Medo da vacina | Pânico Moral | Investigar × Recusar | Laranja × Vermelho | B (atraso 2) | 1 | — |
| INST-191 | Curso que culpa o pobre | Didatismo Acusatório | Aceitar × Investigar | Azul × Vermelho | — | 1 | — |

**Metas do pedido:** técnicas 2 × 5 ✓ · Investigar em 5 cartas (≥ 4) ✓ · eventos 4 de 20 (3-5) ✓ · Dip ≠ 0 em 6 opções (≥ 3) ✓ · Ano mínimo 2-4 em 3 cartas, todas com ganho (≥ 2) ✓ · 7 cores (Preto 3, Roxo 3, Azul 3, Vermelho 3, Amarelo 3, Laranja 3, Verde 2) ✓ · toda cor tem 1-2 opções Aceitar, e toda opção tem ≥ 1 perda ✓ · opção `aceitar` perde `Integridade` ou `Consciência` nas 9 ✓.
**Autoverificação (`.claude/rules/verificacao.md`):** todas as citações `arquivo:linha` das notas foram abertas e conferidas; duas corrigidas no caminho (`gdd/sistemas/06_sorteio.md:28-30`, `gdd/sistemas/04_eixo.md:74`).

**Pontos para o PSI:**
1. INST-184 (xenofobia) e INST-187 (racismo contra indígenas): o problema repete o estigma para expô-lo; 184 traz "Não há prova", 187 põe 'ensina' entre aspas. Basta?
2. INST-190: mito de saúde sobre menores; o problema diz "É boato". Repetir o mito no texto pede o desmentido no Aprendizado.
3. INST-185 e INST-183: a técnica sai da base do governo (Vermelho, Roxo). É inoculação sem "moral por cor" ou soa como equivalência?
4. INST-188: texto diz "a plataforma", mas `ACT-020` tem marca no nome (D-083).
5. INST-191: a consequência A ("Até a si mesmos") pode pesar para quem é pobre; alternativa "Muitos passam a culpar o vizinho."

**Divergências para o fio principal:**
- Os títulos de INST-182..191 não seguem a lista do doc 12 (`docs/12_FICHAS_DOS_MODOS.md:526-545`), que é banco de ideias e traz rótulo ideológico (INST-183, INST-197) e técnicas de cachê (INST-182, INST-184). Seguem a lista: 185 (título), 187, 190 e 189 (ideia da 191). A lista precisa ser reescrita na gravação do modo.
- O prompt cita `gdd/sistemas/04_eixo.md:72` para a cobertura de eixo; a linha hoje é a `:74`.
- O modo Influenciador não tem "instituição do modo" definida para `Quem fala`; esta onda usa só atores.

