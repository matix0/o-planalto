# Onda 5 do P-015 — modo Congresso (INST-007 a INST-016) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-21 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO (2026-10-21) — rascunho para o PSI, o QA e o PO; nada gravado no doc 17. Todas as cartas ficam "provisório (DP-pendente)".
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1 (`:11-41`, DP-014). Notas do GD abaixo do `---` de cada carta; o script lê só a tabela.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-05/cartas.md --no-learning --wave-report --style`
**Aprendizados (rascunho):** `.claude/notas/execucao/onda-05/aprendizados.md`.

## Progresso

- [x] Kit lido (`.claude/notas/execucao/kit-gd.md`) e leitura curta: `gestao/prompts/criacao-cartas.md:53-86`, doc 17 `:11-41` e INST-001..006 (`:65-232`), DP-011 a DP-016, Onda 2 (formato) e Onda 4 (cabeçalho, notas, relatório), títulos e problemas das Ondas 1-4, doc 12 MOD-001 (`:73-120`) e listas dos outros modos (grep), rascunhos APR-007..016 do doc 18 (hoje em `:1562-1830`; o prompt citava `:883-1151`, antes do commit `fe01c6d`), fichas dos atores usados (doc 11), cartas do P-003 (INST-007..016), doc 10 `:96-125` e `:250-262`, doc 04 `:96-107`, GDD 04 (inteiro), GDD 08 `:14-40`, regras de estilo do script
- [x] Plano da onda (temas, mecanismos, cores, eventos, anos, eixos)
- [x] INST-007 a INST-016 escritas
- [x] Check do script com 0 erros (e `--style` sem avisos)
- [x] Aprendizados (`aprendizados.md`)
- [x] Relatório, propostas ao PO, dúvidas ao PSI, autoconferência (no fim)

## Convenções desta onda

- **Um mecanismo do Congresso por carta**, tirado do "O que ensina" do modo (`docs/12_FICHAS_DOS_MODOS.md:79`): coalizão e convocação (007), urgência e comissões (008), jabuti e veto parcial (009), PEC sem veto (010), sanção tácita (011), decreto legislativo (012), derrubada de veto (013), limites da CPI (014), obstrução e quórum (015), medida provisória × projeto de lei (016). As INST-001..006 já cobrem relator, bicameralismo, instalação de CPI, sabatina, Congresso × STF e autopreservação (`docs/17_ROTEIRO_DAS_CARTAS.md:65-232`). O tema do banco de ideias (`docs/12_FICHAS_DOS_MODOS.md:98-107`) fica, salvo na 009 e na 014 (propostas ao PO).
- **Quem fala:** as instituições já usadas no modo — Congresso Nacional, Senado Federal, Câmara dos Deputados (`docs/17_ROTEIRO_DAS_CARTAS.md:74`, `:101`, `:128`) — ou o ator que traz a pressão.
- **Diplomacia** só onde o texto tem ator de fora (009 sites estrangeiros, 013 comprador estrangeiro), como o kit (§4).
- **Sociedade e Estado:** punir mais e censurar = Soc −1, Est −1 (como "Aumentar o encarceramento", `docs/17_ROTEIRO_DAS_CARTAS.md:700`, aqui em −1); armas = Soc ±1, como a INST-121 (`:783`, `:789`); rótulo de terrorismo contra movimento = Est −2 (como `:700`).
- Nenhum número nem dado no texto ao jogador (kit §2): fatos e leis ficam na pista de dado do Aprendizado (D-091). Nenhuma pessoa real: ministro, deputado, banco e empresa só por papel (RC-08, D-190).

---

### INST-007 — Escândalo de Corrupção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ministro aliado sob suspeita |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Uma CPI convoca seu ministro, de um partido aliado, suspeito de desvio em obras. O partido ameaça deixar a base se ele cair. |
| **Opção A** | Demitir o ministro |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência A** | "O partido aliado deixa a base. A CPI segue sem o ministro no cargo." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` -1, `ACT-023` +1, `ACT-003` -1 |
| **Evento A** | — |
| **Opção B** | Esperar a Justiça |
| **Efeitos B** | `Capital Político` +10, `Integridade` -5, `Legitimidade` -5 |
| **Consequência B** | "O aliado fica na base. A oposição diz que você acoberta o ministro." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-003` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-007 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-007):** tema do banco "Escândalo de corrupção — CPI" (`docs/12_FICHAS_DOS_MODOS.md:98`). O P-003 dava "Exonerar" e "Proteger" sem motivo do outro lado; aqui demitir custa a base (presidencialismo de coalizão, `:79`) e manter tem um princípio, a presunção de inocência, com custo de imagem. Não repete a INST-003 (instalar ou engavetar a CPI, `docs/17_ROTEIRO_DAS_CARTAS.md:121`) nem a INST-193 da Onda 3 (aceitar uma indicada, `.claude/notas/execucao/onda-03/cartas.md:64`): o ministro já está no cargo e a suspeita não é prova. `ACT-011` troca apoio por cargos (`docs/11_FICHAS_DOS_ATORES.md:294`, `:296`); `ACT-023` quer investigar e denunciar (`:526`); `ACT-003` é dono de empreiteira (arquétipo, `:137`) e o desvio é em obras. Ano mínimo 2: pressupõe o governo formado e uma CPI em curso; carta ligada a Integridade e Legitimidade. Eixo zero nas duas, como a INST-193: integridade sem conteúdo ideológico. Cor A Azul (gestão, inferência do GD, como a INST-193 A); Cor B Amarelo (governabilidade, `docs/10_GUIA_DE_ESTILO_E_TOM.md:259`). Sem evento de propósito: um evento decidiria se o ministro é culpado.

### INST-008 — Aumento de Pena para Crimes Ambientais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Urgência contra crime ambiental |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | `ACT-018` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | Seu projeto que endurece a pena por crime ambiental está parado numa comissão da bancada ruralista. Você pode pedir urgência. |
| **Opção A** | Pedir urgência |
| **Efeitos A** | `Soberania` +10, `Segurança` +10, `Capital Político` -15 |
| **Consequência A** | "A pauta trava até a votação. A lei passa, e o agro promete revanche." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-018` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Deixar na comissão |
| **Efeitos B** | `Capital Político` +15, `Soberania` -10, `Segurança` -5 |
| **Consequência B** | "O projeto dorme na comissão. A bancada ruralista apoia seus outros projetos." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-001` +1, `ACT-011` +1, `ACT-018` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-008 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-008):** tema do banco "Aumento de pena para crimes ambientais — Bancada ruralista" (`docs/12_FICHAS_DOS_MODOS.md:99`). O P-003 era "apoiar ou bloquear"; aqui o projeto é seu e o dilema é o poder de agenda: a urgência obriga a votar e tranca a pauta; a comissão pode segurar o projeto sem votar. Segurança porque o crime ambiental anda com o crime organizado (pista no APR-008); Soberania como no Marco Temporal (`docs/17_ROTEIRO_DAS_CARTAS.md:175`). Ano mínimo 2: o projeto já tramitou e parou; carta ligada a Segurança e Soberania. `ACT-018` quer combater o desmatamento (`docs/11_FICHAS_DOS_ATORES.md:429`); `ACT-001` teme "ver o Estado chegar à sua região" (`:103`); `ACT-011` controla a pauta (`:294`). Eixo: regra mais dura para o agro = Eco −1, deixar = Eco +1, como a INST-121 (`docs/17_ROTEIRO_DAS_CARTAS.md:783`, `:789`); sem Estado (a pena não é o centro do dilema). Cor A Roxo (movimentos, `docs/10_GUIA_DE_ESTILO_E_TOM.md:260`); Cor B Verde (agronegócio, `:258`). Não repete a INST-121 (licenciamento em troca do pacote fiscal) nem a INST-133 planejada (anistia, `docs/12_FICHAS_DOS_MODOS.md:392`).

### INST-009 — Jabuti no Projeto

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Jabuti no projeto |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Azul |
| **Problema** | Seu projeto de carro menos poluente volta da Câmara com um jabuti: um trecho fora do tema. Ele taxa compras pequenas em sites de fora. |
| **Opção A** | Vetar o jabuti |
| **Efeitos A** | `Legitimidade` +10, `Dignidade` +5, `Capital Político` -10, `Soberania` -5 |
| **Consequência A** | "Os sites de fora seguem sem a taxa. A Câmara ameaça derrubar o veto." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-004` -1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Sancionar o texto todo |
| **Efeitos B** | `Caixa` +10, `Soberania` +5, `Legitimidade` -10, `Dignidade` -5 |
| **Consequência B** | "A taxa vale. Lojas do país comemoram, e quem compra online paga mais." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-009 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-009):** troca do tema "Taxa sobre grandes fortunas — Lobby" (`docs/12_FICHAS_DOS_MODOS.md:100`): fortunas e heranças estão no Orçamento (INST-026, `:145`; INST-040, `:159`), como o prompt avisa. Fica o lobby, com o jabuti e o veto parcial (`:79`: veto, sanção). Base real: a "taxa das blusinhas" entrou como trecho estranho numa lei de incentivo a carros (pista no APR-009; sem nome de pessoa). Custo nos dois lados: compra barata dos jovens × indústria e lojas do país e receita. `ACT-004` teme a concorrência estrangeira (`docs/11_FICHAS_DOS_ATORES.md:160`); `ACT-011` controla a pauta (`:294`). Eixo como a INST-064 (`docs/17_ROTEIRO_DAS_CARTAS.md:432`): proteger a indústria = [−1, −1, 0, 0]; abrir = [+1, +1, 0, 0]. Cor A Laranja (desregulamentação, `docs/10_GUIA_DE_ESTILO_E_TOM.md:261`); Cor B Azul (estabilidade econômica e receita, `:257`). "Online" é palavra corrente para o público de 15 a 30 anos; alternativa: "pela internet". Proposta ao PO nº 1.

### INST-010 — Redução da Maioridade Penal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | PEC da maioridade penal |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | A Câmara vota uma emenda à Constituição que reduz a maioridade penal. Você não pode vetar: só a sua base pode barrar. |
| **Opção A** | Orientar a base contra |
| **Efeitos A** | `Dignidade` +10, `Capital Político` -10, `Legitimidade` -10 |
| **Consequência A** | "A PEC cai na Câmara. Nas ruas, muita gente cobra mais rigor." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-013` +1, `ACT-024` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Liberar a base |
| **Efeitos B** | `Segurança` +10, `Legitimidade` +5, `Dignidade` -10 |
| **Consequência B** | "A PEC é promulgada. Adolescentes já podem ir para presídios de adultos." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-011` +1, `ACT-013` -1 |
| **Evento B** | "Facções recrutam os adolescentes nos presídios" · atraso 2 · `Segurança` -10, `Dignidade` -5 |
| **Aprendizado** | APR-010 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-010):** tema do banco "Redução da maioridade penal — Punitivismo" (`docs/12_FICHAS_DOS_MODOS.md:101`), com o ângulo que só o Congresso tem: PEC exige maioria qualificada e não passa por sanção nem veto (`:79`). O P-003 dava "Vetar a redução", o que o presidente não pode fazer numa PEC. **Repetição registrada:** o tema também está no Prisional (INST-087, `:290`) e nas Bancadas (INST-124, `:383`) — proposta ao PO nº 3. Ganho de Segurança em B (percepção, como a INST-081 B) e conta atrasada no evento (o presídio fortalece facções: pista no APR-010, dúvida ao PSI). Legitimidade −10 em A: a redução tem apoio popular (pista no APR-010); o texto não traz o número. Ano mínimo 2: carta ligada a Dignidade (A) e Segurança (B). `ACT-013` vê na educação a resposta às causas do crime (`docs/11_FICHAS_DOS_ATORES.md:340`); `ACT-024` fala com a juventude (`:545`); `ACT-011` controla a pauta (`:294`). Eixo: punir mais = Soc −1, Est −1, como a INST-081 B (`docs/17_ROTEIRO_DAS_CARTAS.md:700`), em −1 (a regra muda a idade, não cria prisão). Cor A Roxo, como as opções de prevenção das INST-081 e 082; Cor B Preto (pânico moral, `docs/10_GUIA_DE_ESTILO_E_TOM.md:262`).

### INST-011 — Escola sem Partido

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escola sem Partido |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | O Congresso aprova o Escola sem Partido: o professor não pode dar opinião política em aula. Se você não vetar no prazo, a lei vale. |
| **Opção A** | Vetar a lei |
| **Efeitos A** | `Consciência` +10, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "Professores comemoram. Os autores da lei prometem derrubar o veto." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-013` +1, `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Deixar o prazo correr |
| **Efeitos B** | `Capital Político` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência B** | "O prazo acaba, e a lei vale sem a sua assinatura. Professores protestam." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-012` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-011 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-011):** tema do banco "Escola sem Partido — Censura" (`docs/12_FICHAS_DOS_MODOS.md:102`), com o mecanismo da sanção tácita: se o presidente não decide no prazo, a lei vale (`:79`: veto, sanção). O P-003 punha uma bancada como autora; aqui "o Congresso aprova", sem nomear grupo. Não repete a INST-041 (Filosofia e Sociologia, `docs/17_ROTEIRO_DAS_CARTAS.md:293`) nem as planejadas INST-045, INST-058 e INST-132 (gênero e linguagem neutra, `docs/12_FICHAS_DOS_MODOS.md:192`, `:205`, `:391`). `ACT-013` teme perder a liberdade de cátedra (`docs/11_FICHAS_DOS_ATORES.md:335`) e cita o Escola sem Partido (`:339`); `ACT-012` cobra "controle ideológico" (`:318`). Legitimidade −5 em A: parte do público apoia a ideia (pista no APR-011). Eixo: censura = Soc −1, Est −1; vetar = Soc +1, Est +1. Cor A Vermelho (defesa de quem trabalha na escola, inferência do GD); Cor B Amarelo: deixar o prazo correr é cálculo de governabilidade (`docs/10_GUIA_DE_ESTILO_E_TOM.md:259`), não proposta da censura. Ano mínimo 2: a lei tramita antes de chegar à sanção; carta ligada a Consciência, a menos coberta no Ano 2-4 (5 opções no baralho com as Ondas 1-5, relatório no fim).

### INST-012 — Flexibilização do Porte de Armas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Decreto das armas |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Senado Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Seu decreto limita a compra de armas por atiradores e caçadores. A Câmara aprova um projeto que derruba o decreto. Falta o Senado. |
| **Opção A** | Defender o decreto |
| **Efeitos A** | `Segurança` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência A** | "O Senado mantém o decreto. A bancada da bala trava seus projetos." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-014` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Afrouxar o decreto |
| **Efeitos B** | `Capital Político` +10, `Segurança` -5, `Integridade` -5 |
| **Consequência B** | "O Congresso engaveta o projeto. Atiradores voltam a comprar mais armas." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-001` +1, `ACT-011` +1, `ACT-014` -1 |
| **Evento B** | "O crime compra armas desviadas de clubes de tiro" · atraso 2 · `Segurança` -10, `Integridade` -5 |
| **Aprendizado** | APR-012 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-012):** tema do banco "Flexibilização do porte de armas — Bancada da bala" (`docs/12_FICHAS_DOS_MODOS.md:103`), com o mecanismo do decreto legislativo: o Congresso pode sustar um decreto do presidente. O P-003 era "mobilizar contra ou apoiar"; aqui o decreto é seu e a escolha é defender ou recuar. Armas já estão na INST-121 (armamento civil, `docs/17_ROTEIRO_DAS_CARTAS.md:768`) e planejadas nas Bancadas (INST-131, INST-136, `docs/12_FICHAS_DOS_MODOS.md:390`, `:395`), nas Emendas (INST-105, `:336`) e no Prisional (INST-094, `:297`): aqui o foco é o poder do Congresso sobre o decreto, não a troca de apoio. Evento B: desvio de armas de clubes de tiro para o crime, em voz ativa e sem acusar todo atirador (pista no APR-012; dúvida ao PSI). `ACT-014` quer salvar vidas (`docs/11_FICHAS_DOS_ATORES.md:353`); `ACT-001` anda com capangas (`:100`) e teme o Estado na sua região (`:103`); `ACT-011` ganha a troca (`:294`). Eixo Soc ±1 como a INST-121 (`docs/17_ROTEIRO_DAS_CARTAS.md:783`, `:789`); Estado em 0 (proposta nº 6). Cor A Vermelho (inferência do GD: a restrição vem do governo); Cor B Preto (militarização, `docs/10_GUIA_DE_ESTILO_E_TOM.md:262`). Ano mínimo 1: o decreto sai no começo do governo.

### INST-013 — Privatização dos Correios

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Venda dos Correios |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Laranja |
| **Problema** | Você vetou a venda dos Correios. Uma gigante estrangeira de entregas quer comprar, e o Congresso se reúne para derrubar o veto. |
| **Opção A** | Liberar emendas pelo veto |
| **Efeitos A** | `Soberania` +10, `Dignidade` +5, `Caixa` -15, `Integridade` -5 |
| **Consequência A** | "O veto se mantém. Os Correios seguem públicos, e as emendas saem do caixa." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-009` +1, `ACT-011` +1, `ACT-002` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar a derrubada |
| **Efeitos B** | `Caixa` +15, `Capital Político` +5, `Soberania` -15 |
| **Consequência B** | "O veto cai. A gigante estrangeira compra os Correios." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-002` +1, `ACT-009` -1 |
| **Evento B** | "A nova dona fecha agências em cidades pequenas" · atraso 1 · `Dignidade` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-013 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-013):** tema do banco "Privatização dos Correios — Soberania" (`docs/12_FICHAS_DOS_MODOS.md:104`); o rascunho do APR-013 já usava a derrubada do veto (`docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:1734`). O P-003 dava "Negociar com senadores" sem dizer o preço; aqui o preço é dito: emendas do caixa e um custo de Integridade (barganha, `docs/12_FICHAS_DOS_MODOS.md:79`). Comprador estrangeiro dá a Diplomacia; eixo como a Embraer (INST-066, `docs/17_ROTEIRO_DAS_CARTAS.md:486`). Evento B: agências fechadas onde não dão lucro (pista: obrigação de serviço universal; dúvida ao PSI). `ACT-009` teme ver o serviço público privatizado (`docs/11_FICHAS_DOS_ATORES.md:257`); `ACT-011` quer emendas (`:294`), por isso +1 em A; `ACT-002` cobra privatizações (`:124`). Cor A Amarelo (negociação, `docs/10_GUIA_DE_ESTILO_E_TOM.md:259`); Cor B Laranja (privatização, `:261`). Ano mínimo 2: pressupõe o veto anterior e a tramitação. Não repete a INST-001 (relator e empresa doadora, `docs/17_ROTEIRO_DAS_CARTAS.md:67`).

### INST-014 — CPI do Golpe nos Aposentados

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Acordo com o banco |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Senado Federal |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | A CPI conclui que um banco lesou aposentados com empréstimos falsos. O banco oferece devolver parte do dinheiro se não for processado. |
| **Opção A** | Processar o banco |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Dignidade` -5, `Caixa` -5 |
| **Consequência A** | "O processo começa. Os aposentados esperam anos pelo dinheiro." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-023` +1, `ACT-002` -1 |
| **Evento A** | "A Justiça condena o banco a devolver tudo" · atraso 2 · `Dignidade` +10 |
| **Opção B** | Aceitar o acordo |
| **Efeitos B** | `Dignidade` +10, `Capital Político` +5, `Integridade` -10 |
| **Consequência B** | "Os aposentados recebem parte do dinheiro. Ninguém do banco é punido." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-002` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-014 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-014):** troca do tema "CPI das Bets — Impunidade" (`docs/12_FICHAS_DOS_MODOS.md:105`): apostas já estão nas INST-181 (`docs/17_ROTEIRO_DAS_CARTAS.md:968`), INST-193 e INST-194 (`.claude/notas/execucao/onda-03/cartas.md:64`, `:98`), e a CPI real do rascunho do APR-014 nomeia pessoa viva (`docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:1768`), contra RC-08. Ficam a CPI e a impunidade: a CPI conclui, mas não pune; o governo escolhe processar (justiça lenta) ou fazer acordo (dinheiro rápido, sem punição). Não repete a INST-003 (instalar a CPI) nem a INST-007 (convocar ministro). Evento A positivo e atrasado ("investir hoje vira … depois", `gdd/sistemas/08_eventos.md:14`): a justiça chega, mas tarde; escolhida no Ano 3 ou 4, vai para o epílogo, e o jogador fica só com o custo. Ano mínimo 2: carta ligada a Dignidade (B) e Integridade (A). `ACT-023` quer denunciar (`docs/11_FICHAS_DOS_ATORES.md:526`); `ACT-002` teme perder dinheiro (`:122`). Eixo: enfrentar o banco = Eco −1, acordo = Eco +1 (inferência do GD; alternativa 0, proposta nº 6). Cor A Vermelho (assistência social, `docs/10_GUIA_DE_ESTILO_E_TOM.md:256`); Cor B Azul (estabilidade econômica, `:257`). Proposta ao PO nº 2.

### INST-015 — Criminalização de Movimentos Sociais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ocupação como terrorismo |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | A Câmara vota um projeto que trata ocupação de terra e de prédio como terrorismo. Sua base pode obstruir e deixar a sessão sem quórum. |
| **Opção A** | Obstruir a votação |
| **Efeitos A** | `Dignidade` +10, `Capital Político` -10, `Segurança` -5 |
| **Consequência A** | "Sem quórum, o projeto sai da pauta. Ruralistas dizem que você protege invasores." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-016` +1, `ACT-017` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Liberar a votação |
| **Efeitos B** | `Capital Político` +10, `Segurança` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "O projeto passa. Ocupar terra ou prédio vazio vira terrorismo." |
| **Eixo B** | [+1, 0, 0, -2] |
| **Atores B** | `ACT-001` +1, `ACT-016` -1, `ACT-017` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-015 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-015):** tema do banco "Criminalização de movimentos sociais — Repressão" (`docs/12_FICHAS_DOS_MODOS.md:106`), com o mecanismo da obstrução e do quórum (`:79`). O P-003 dava "Vetar"; aqui a briga é no plenário, antes do veto. Simplificação: "o projeto passa" resume Câmara, Senado e sanção. Não repete a THEM-001 (despejo de uma ocupação, `docs/17_ROTEIRO_DAS_CARTAS.md:1314`); ecoa o rótulo de terrorismo da INST-074 da Onda 4 (facções, `.claude/notas/execucao/onda-04/cartas.md:70`), aqui contra movimento social (pista no APR-015: a lei antiterror tem ressalva para movimentos). `ACT-016` e `ACT-017` temem o despejo e perder a luta (`docs/11_FICHAS_DOS_ATORES.md:392`, `:411`); `ACT-001` teme o Estado na sua região (`:103`) e quer controle das terras (`:102`). "Invasores" é a voz dos ruralistas, não do jogo (dúvida ao PSI). Eixo: B = Est −2, como "Aumentar o encarceramento" (`docs/17_ROTEIRO_DAS_CARTAS.md:700`), e Eco +1 (defesa da propriedade); A = Est +1, Eco −1. Cor A Roxo (movimentos sociais, `docs/10_GUIA_DE_ESTILO_E_TOM.md:260`); Cor B Verde (agronegócio, `:258`). Ano mínimo 1.

### INST-016 — Licença-Paternidade

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Licença-paternidade |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | `ACT-015` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Pais ganham poucos dias de licença quando o filho nasce. Você quer ampliar: por medida provisória ou por projeto de lei? |
| **Opção A** | Usar medida provisória |
| **Efeitos A** | `Dignidade` +10, `Caixa` -5, `Capital Político` -10 |
| **Consequência A** | "A licença maior vale hoje. O Congresso reclama da medida provisória." |
| **Eixo A** | [0, 0, +1, -1] |
| **Atores A** | `ACT-015` +1, `ACT-004` -1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Enviar projeto de lei |
| **Efeitos B** | `Capital Político` +5, `Legitimidade` -5 |
| **Consequência B** | "O projeto entra na fila do Congresso. Os pais seguem com poucos dias." |
| **Eixo B** | [0, 0, +1, 0] |
| **Atores B** | `ACT-011` +1, `ACT-015` -1 |
| **Evento B** | "O Congresso aprova a licença, com menos dias" · atraso 1 · `Dignidade` +5, `Caixa` -5 |
| **Aprendizado** | APR-016 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-016):** tema do banco "Licença-paternidade — Direitos sociais" (`docs/12_FICHAS_DOS_MODOS.md:107`), com o mecanismo da medida provisória × projeto de lei. O P-003 era "apoiar ou bloquear"; aqui o objetivo é o mesmo nas duas opções e o dilema é o caminho: rápido e frágil × lento e negociado. Evento B positivo e menor: a aprovação chega depois e mais curta, porque o texto é negociado (`gdd/sistemas/08_eventos.md:14`). Conta das duas: A dá mais Dignidade e mais cedo, ao preço de Capital Político; B guarda o Capital Político e entrega menos, mais tarde. Sem evento em A: a medida provisória pode perder a validade, mas a carta não decide isso (pista no APR-016). `ACT-015` defende os direitos trabalhistas (`docs/11_FICHAS_DOS_ATORES.md:372`); `ACT-004` paga a licença e cobra desregulamentação (`:162`); `ACT-011` teme "ver o governo passar por cima" (`:295`). Eixo: Soc +1 nas duas (o cuidado dividido entre pai e mãe muda costumes); A com Est −1 (governar por medida provisória concentra poder; proposta nº 6). Cor A Vermelho (direitos trabalhistas, `docs/10_GUIA_DE_ESTILO_E_TOM.md:256`); Cor B Amarelo (negociação, `:259`). Ano mínimo 1.

---

## Relatório da onda (script, 2026-10-21)

`PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-05/cartas.md --no-learning --wave-report --style` → 10 cartas conferidas, 0 erros, 0 avisos de estilo (saída 0).

| Meta (prompt e kit §5) | Resultado |
| :--- | :--- |
| Eventos em 4-5 de 20 opções | 5 (25%): 010 B, 012 B, 013 B, 014 A (positivo), 016 B (positivo) |
| ≥ 2 opções Dignidade+ com Ano mínimo 2-4 | 3: 010 A, 013 A, 014 B |
| ≥ 1 opção Segurança+ com Ano mínimo 2-4 | 2: 008 A, 010 B |
| Sociedade ≠ 0 em ≥ 3 opções | 8 (40%): 010, 011, 012 e 016, nas duas opções |
| Diplomacia ≠ 0 em ≥ 3 opções | 4 (20%): 009 e 013, nas duas opções; Economia 10 (50%), Estado 7 (35%) |
| ≥ 3 cartas com Ano mínimo 2-4 e efeito positivo | 6: 007, 008, 010, 011, 013, 014 (Integridade, Legitimidade, Segurança, Soberania, Dignidade, Consciência, Capital Político) |
| 7 cores com saldo negativo; toda opção com ≥ 1 custo | Vermelho 4, Amarelo 4, Roxo 3, Azul 3, Laranja 2, Verde 2, Preto 2; todas negativas em ≥ 1 medidor |
| Atores | 20 de 20 opções; 15 atores; `ACT-011` em 11 opções (7 × +1, 4 × −1), o ator do modo |

Somas por cor (script): Preto Dignidade −10, Integridade −5 · Azul Capital Político −10, Legitimidade −5 · Verde Soberania −10, Dignidade −10, Integridade −5 · Laranja Soberania −20, Capital Político −5 · Roxo Capital Político −35, Legitimidade −10 · Vermelho Capital Político −35, Caixa −10 · Amarelo Integridade −15, Caixa −15, Consciência −10, Legitimidade −10.

Baralho inteiro (doc 17 + Ondas 3-5, rodado numa cópia no scratchpad): eventos 15% → 16%; Sociedade 20% → 23%; carta ligada no Ano 2-4: Dignidade 2 → 5, Segurança 5 → 7, Consciência 5 → 6. Avisos fora das metas: técnicas do Influenciador em 0 (não se aplica ao modo); Consciência positiva só na 011 A.

## Propostas do GD que pedem o PO (provisórias)

1. **INST-009 — tema novo "Jabuti no projeto"** (fortunas e heranças estão no Orçamento, `docs/12_FICHAS_DOS_MODOS.md:145`, `:159`). (A) Jabuti que taxa compras pequenas em sites estrangeiros, com veto parcial — **recomendada**: caso real que o público de 15 a 30 anos vive, custo nos dois lados, Diplomacia natural; contra: assunto de 2024 ainda quente (sem nomes). (B) Regulação do lobby (agenda pública de reuniões com lobistas): ensina transparência; contra: abstrato, custo fraco. (C) Fortunas barradas no Senado: repete o Orçamento.
2. **INST-014 — tema novo "Acordo com o banco"** (no lugar da "CPI das Bets"). (A) CPI conclui que um banco lesou aposentados; processar × acordo — **recomendada**: ensina que a CPI não pune, dilema justiça lenta × reparação rápida; (B) CPI das Bets com relatório rejeitado: quarta carta de apostas, e o caso real nomeia pessoa viva (`docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:1768`, RC-08); (C) Câmara vota se mantém a prisão de um deputado (imunidade): forte, mas alude a casos reais recentes.
3. **Maioridade penal em três modos** (`docs/12_FICHAS_DOS_MODOS.md:101`, `:290`, `:383`). (A) Fica no Congresso, com o ângulo da PEC sem veto; Prisional (INST-087) e Bancadas (INST-124) trocam de tema — **recomendada** (o mecanismo só existe aqui); (B) fica só no Prisional, e a INST-010 vira outra PEC; (C) manter os três (repetição alta para o jogador).
4. **Mapa "um mecanismo por carta"** (convenção no topo): aprovar como regra do modo. Para as INST-017..020 sobram, por exemplo, votação simbólica, pedido de vista e comissão mista (a emenda de relator fica com o modo Emendas).
5. **Eixos de fronteira:** 016 A com Est −1 (medida provisória concentra poder; alternativa 0); 012 com Soc ±1 e Est 0, como a INST-121 (alternativa: Est −1 em A, leitura libertária do 9axes); 014 com Eco ±1 (alternativa 0); 007 com eixo zero.
6. **Ano mínimo 2** em 007, 008, 010, 011, 013 e 014 (pressupõem tramitação, CPI ou veto anterior); 1 nas outras quatro. O modo é "Ano 1-4" (`docs/12_FICHAS_DOS_MODOS.md:82`).
7. **Títulos trocados** em relação ao banco: 007 "Ministro aliado sob suspeita", 008 "Urgência contra crime ambiental", 010 "PEC da maioridade penal", 012 "Decreto das armas", 013 "Venda dos Correios", 015 "Ocupação como terrorismo" (cabeçalhos mantêm o nome do banco).

## Dúvidas para o PSI

1. INST-010: "Adolescentes já podem ir para presídios de adultos" e o evento "Facções recrutam os adolescentes nos presídios" — afirmação empírica (sai se a fonte não sustentar) e tom para 15 a 30 anos.
2. INST-015: "terrorismo" e "invasores" (voz dos ruralistas na consequência); movimentos reais entram só pelos atores `ACT-016`/`ACT-017`. Lê como tomada de partido?
3. INST-012: evento "O crime compra armas desviadas de clubes de tiro" — generaliza atiradores? Armas são tema de campanha (RC-08).
4. INST-011: "Escola sem Partido" é nome de projeto e de movimento real; "o professor não pode dar opinião política em aula" resume com justiça? Cor B Amarelo (calar por cálculo), não Preto.
5. INST-007: ministro fictício "suspeito de desvio em obras"; a carta não decide a culpa. Passa no RC-08?
6. INST-014: "um banco lesou aposentados com empréstimos falsos" lembra o caso do INSS de 2025, que envolveu entidades, sem nome. Risco de ler como acusação?
7. INST-009: "taxa das blusinhas" é caso real de 2024; "online" (palavra corrente; alternativa "pela internet").
8. Cor: Preto em 010 B e 012 B (punir mais, armar); Verde em 015 B (criminalizar ocupação) lê como acusação ao agro? Amarelo perde Integridade em 007 B, 011 B e 013 A (fisiologismo, padrão já aceito, D-097).

Nota para o fio principal: (a) próximas ondas — maioridade penal (proposta 3); armas também nas INST-094, 105, 131, 136 (`docs/12_FICHAS_DOS_MODOS.md:297`, `:336`, `:390`, `:395`); a INST-019 do Congresso ("Educação financeira em vez de Filosofia", `:110`) repete a INST-041 (`docs/17_ROTEIRO_DAS_CARTAS.md:293`); a INST-018 ("Anistia aos crimes da ditadura") cai no aviso "ditadura" (PSI). (b) O prompt citava os rascunhos do doc 18 em `:883-1151`; depois do commit `fe01c6d` eles estão em `:1562-1830`.

## Autoconferência (`.claude/rules/verificacao.md`)

Todas as citações das notas conferidas no arquivo em 2026-10-21 (amostra pedida: 5). Batem, entre outras: `docs/12_FICHAS_DOS_MODOS.md:79`, `:98`-`:107`, `:115`, `:145`, `:159`, `:290`, `:383`, `:392`; `docs/11_FICHAS_DOS_ATORES.md:103`, `:137`, `:160`, `:294`, `:335`, `:339`, `:340`, `:526`; `docs/17_ROTEIRO_DAS_CARTAS.md:74`, `:700`, `:783`, `:789`, `:1314`; `docs/10_GUIA_DE_ESTILO_E_TOM.md:256`-`:262`; `docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:1734`, `:1768`; `gdd/sistemas/08_eventos.md:14`. Dois erros achados e corrigidos na conferência: "O que ensina" estava citado como `:80` (é `:79`) e o arquétipo do `ACT-003` como `:136` (é `:137`).

Higiene: o script rodou com `PYTHONDONTWRITEBYTECODE=1` (nenhum `__pycache__`); `git status` sem mudanças; nenhum arquivo do repositório tocado fora de `.claude/notas/execucao/onda-05/`; cópias do baralho e scripts de contagem só no scratchpad.
