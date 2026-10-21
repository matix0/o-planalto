# Onda 6 do P-015 — Congresso (INST-017 a INST-020) e Orçamento (INST-023 a INST-028) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-21 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO (2026-10-21) — rascunho para o PSI, o QA e o PO; nada gravado no doc 17. Todas as cartas ficam "provisório (DP-pendente)".
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1 (`:11-41`, DP-014). Notas do GD abaixo do `---` de cada carta; o script lê só a tabela.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-06/cartas.md --no-learning --wave-report --style`
**Aprendizados (rascunho):** `.claude/notas/execucao/onda-06/aprendizados.md`.

## Progresso

- [x] Kit lido e leitura curta: `gestao/prompts/criacao-cartas.md:53-86`, doc 17 `:11-64` e `:65-290` (INST-001..006, 021, 022), DP-011 a DP-016, Onda 5 inteira (formato, mecanismos, notas), títulos e problemas das Ondas 1-4 e do doc 17, doc 12 MOD-001 e MOD-002 (`:73-168`) e listas dos outros modos (grep), rascunhos APR-017..020 e 023..028 (doc 18 `:1831-2106`), fichas dos atores usados (doc 11, campos Motivação a Cobra), cartas do P-003 (IDs da onda), doc 10 `:250-262`, GDD 04 `:20-30`, calibração (doc 15 `:77-80`), regras de estilo do script
- [x] Plano da onda (abaixo)
- [x] INST-017 a INST-020 (Congresso) escritas
- [x] INST-023 a INST-028 (Orçamento) escritas
- [x] Check do script com 0 erros (e `--style` sem avisos)
- [x] Aprendizados (`aprendizados.md`)
- [x] Relatório, propostas ao PO, dúvidas ao PSI, autoconferência (no fim)

## Plano e convenções desta onda

- **Congresso — um mecanismo por carta**, fora dos já usados (INST-001..006 e a lista da Onda 5, `.claude/notas/execucao/onda-05/cartas.md:20`): iniciativa popular (017), aprovação de tratado pelo Congresso (018), destaque (019), votação simbólica × nominal (020). A Onda 5 sugeria votação simbólica, pedido de vista e comissão mista (`.claude/notas/execucao/onda-05/cartas.md:364`); o pedido de vista é fraco como dilema, e a comissão mista (de orçamento) fica para o Orçamento.
- **Orçamento — uma ideia por carta** sobre como o dinheiro público é decidido: regra do teto (023), emendas impositivas no bloqueio de verbas (024), subsídio de juros como gasto (025), imposto progressivo × regressivo (026), vinculação de receita à educação (027), execução da lei do orçamento e censura (028). A LDO (meta fiscal) fica para a próxima onda do modo (sugestão: INST-034 "Pagamento da dívida", `docs/12_FICHAS_DOS_MODOS.md:153`).
- **Tema trocado:** só a INST-019 (o banco repete a INST-041 e a INST-049). As outras mantêm o tema do banco com um ângulo novo; cabeçalhos mantêm o nome do banco, salvo a 019.
- **Quem fala:** um ator diferente por carta, quase todos pouco usados como voz (`ACT-014`, `ACT-010`, `ACT-015`, `ACT-016`, `ACT-011`, `ACT-017`, `ACT-002`, `ACT-013`, `ACT-012`) e a Câmara dos Deputados na 019.
- **Eixos** (`gdd/sistemas/04_eixo.md:20-25`): gasto público e regra para empresa = Eco −1; regra fiscal e mercado = Eco +1. Diplomacia só onde há instituição ou empresa de fora (018 tratado da ONU; 019 big techs), como o kit (§4). Censura = Soc −1, Est −1 (Onda 5, `:23`). Participação e transparência = Est +1, como a pergunta 6 da calibração (`docs/15_FLUXO_DO_JOGO.md:80`).
- **RC-08:** nenhuma pessoa real; partidos, líderes, ministros e empresas só por papel. A anistia entra pela memória da ditadura (tratado), não pelo debate atual de anistia; o salário mínimo entra pelo mecanismo do voto, sem governo nem partido nomeado.
- **Bets:** nenhuma carta supõe apostas legais (MP 1.394/2026, nota do fio principal em 2026-10-21; há recurso no STF).
- Nenhum número nem dado no texto ao jogador (kit §2): fatos e leis ficam na pista de dado do Aprendizado (D-091).

| ID | Título | Mecanismo ou ideia | Cores A / B | Evento | Ano mín. |
| :--- | :--- | :--- | :--- | :--- | :--- |
| INST-017 | Assinaturas pelo SUS | Iniciativa popular | Vermelho / Azul | — | 1 |
| INST-018 | Crime que não prescreve | Tratado só vale com o Congresso | Roxo / Preto | B | 2 |
| INST-019 | Destaque na lei da IA | Destaque (votar trecho à parte) | Vermelho / Laranja | A | 1 |
| INST-020 | Limite ao salário mínimo | Votação simbólica × nominal | Vermelho / Amarelo | — | 2 |
| INST-023 | Furar o teto | Regra do teto | Roxo / Azul | A | 2 |
| INST-024 | Bloqueio das emendas | Emendas impositivas no bloqueio | Azul / Amarelo | — | 2 |
| INST-025 | Juros do Plano Safra | Subsídio de juros é gasto | Roxo / Verde | — | 1 |
| INST-026 | Quem paga a conta | Progressivo × regressivo | Vermelho / Laranja | — | 1 |
| INST-027 | Piso da educação | Vinculação de receita | Vermelho / Azul | B | 2 |
| INST-028 | Edital na gaveta | Execução do orçamento e censura | Roxo / Preto | B | 2 |

---

### INST-017 — Gastar 10% do PIB em Saúde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Assinaturas pelo SUS |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Um projeto de iniciativa popular, com assinaturas de todo o país, fixa mais verba para o SUS. A equipe econômica é contra. |
| **Opção A** | Apoiar o projeto popular |
| **Efeitos A** | `Dignidade` +10, `Legitimidade` +10, `Caixa` -15, `Capital Político` -5 |
| **Consequência A** | "O Congresso aprova. O SUS ganha verba fixa, e sobra menos para o resto." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-014` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Enviar um texto próprio |
| **Efeitos B** | `Capital Político` +10, `Dignidade` +5, `Legitimidade` -10, `Caixa` -5 |
| **Consequência B** | "Seu texto, com aumento menor e gradual, passa. Quem assinou se sente ignorado." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-007` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-017 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-017):** tema do banco "Gastar 10% do PIB em saúde — Subfinanciamento" (`docs/12_FICHAS_DOS_MODOS.md:108`), com o mecanismo da iniciativa popular: eleitores propõem lei juntando assinaturas. Base real: a campanha Saúde+10, de 2013 (pista no APR-017). O P-003 dava "Apoiar × Bloquear" com o número no texto; aqui sem número (kit §2), e B é o caminho comum dos governos: mandar um texto próprio, menor. Não repete a INST-021 (onde cortar, `docs/17_ROTEIRO_DAS_CARTAS.md:246`); nota para a INST-030 planejada ("Verba para o SUS", `docs/12_FICHAS_DOS_MODOS.md:149`): evitar o piso do SUS. Diferença da INST-027 (piso da educação): lá a equipe econômica quer tirar um piso; aqui cidadãos querem subir outro, e o centro é quem propõe a lei. `ACT-014` cobra investimento no SUS (`docs/11_FICHAS_DOS_ATORES.md:356`); `ACT-006` teme perder a confiança (`:198`); `ACT-007` teme o descontrole fiscal (`:219`). Eixo: A Eco −1 (mais gasto público) e Est +1 (participação, como a pergunta 6 da calibração, `docs/15_FLUXO_DO_JOGO.md:80`); B Eco +1 (proposta ao PO nº 5: Est −1 em B). Capital Político −5 em A: verba fixa para o SUS reduz o espaço das emendas. Cor A Vermelho (saúde e assistência, `docs/10_GUIA_DE_ESTILO_E_TOM.md:256`); Cor B Azul (estabilidade econômica, `:257`). Ano mínimo 1.

### INST-018 — Anistia aos Crimes da Ditadura

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Crime que não prescreve |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Famílias de vítimas da ditadura pedem que o Brasil entre num tratado da ONU. Nele, crime contra a humanidade não prescreve. |
| **Opção A** | Enviar ao Congresso |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "O tratado vai a voto no Congresso. Militares da reserva veem ameaça à anistia." |
| **Eixo A** | [0, +1, +1, +1] |
| **Atores A** | `ACT-010` +1, `ACT-023` +1, `ACT-008` -1 |
| **Evento A** | — |
| **Opção B** | Deixar o tratado de lado |
| **Efeitos B** | `Capital Político` +10, `Segurança` +5, `Consciência` -10, `Legitimidade` -5 |
| **Consequência B** | "O tratado fica na gaveta. Famílias de desaparecidos seguem sem resposta." |
| **Eixo B** | [0, -1, -1, -1] |
| **Atores B** | `ACT-008` +1, `ACT-023` -1 |
| **Evento B** | "A Corte Interamericana volta a cobrar o Brasil" · atraso 2 · `Legitimidade` -10 |
| **Aprendizado** | APR-018 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-018):** tema do banco "Anistia aos crimes da ditadura — Memória" (`docs/12_FICHAS_DOS_MODOS.md:109`), com o mecanismo do referendo do Congresso aos tratados: o presidente assina, mas o tratado só vale no país depois que o Congresso aprova (pista no APR-018). O P-003 dizia "O Congresso quer aprovar uma lei que anistia os crimes da ditadura": anacrônico (a Lei de Anistia é de 1979) e, hoje, "anistia" puxa o debate sobre o 8 de janeiro, tema de campanha (RC-08). Aqui o centro é a memória: o tratado da ONU sobre a imprescritibilidade, que o Brasil não ratificou segundo o MPF (URL na pista do APR-018; conferir). Nenhuma pessoa nem caso real; tema do aviso de conteúdo (ditadura e tortura) sem detalhe — dúvida ao PSI. `ACT-010` traz o tratado e ganha com A (cooperação com instituição internacional; inferência do GD, a ficha fala de soberania, `docs/11_FICHAS_DOS_ATORES.md:275-276`); `ACT-008` teme a "subversão" e perder o poder (`:238`) e oferece Segurança (`:239`), por isso Segurança +5 em B (paz nos quartéis); `ACT-023` teme "ver a verdade ser enterrada" (`:527`). Eixo: A Dip +1 (instituição internacional, kit §4), Soc +1 (direitos humanos e memória, como o Marco Temporal A, `docs/17_ROTEIRO_DAS_CARTAS.md:190`), Est +1 (punir abuso do Estado); B o inverso (proposta ao PO nº 5). Evento B: a Corte Interamericana supervisiona sentenças contra o Brasil sobre a ditadura (pista). Cor A Roxo (movimentos sociais, `docs/10_GUIA_DE_ESTILO_E_TOM.md:260`); Cor B Preto (militarização, `:262`). Ano mínimo 2: carta ligada a Consciência e Integridade (A) e a Segurança (B).

### INST-019 — Destaque na Lei da IA

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Destaque na lei da IA |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | A Câmara aprova a lei da IA. Um destaque quer votar à parte e tirar o trecho que paga artistas cujas obras treinam a IA. |
| **Opção A** | Manter o pagamento |
| **Efeitos A** | `Soberania` +10, `Dignidade` +5, `Capital Político` -10 |
| **Consequência A** | "O destaque cai, e o trecho fica. Big techs dizem que a lei afasta investimento." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-019` +1, `ACT-020` -1 |
| **Evento A** | "Big techs adiam centros de dados no país" · atraso 1 · `Caixa` -10 |
| **Opção B** | Aceitar o destaque |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Soberania` -10, `Dignidade` -5 |
| **Consequência B** | "O trecho cai. A IA pode usar obras de artistas sem pagar por elas." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-020` +1, `ACT-019` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-019 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-019):** troca do tema "Educação financeira em vez de Filosofia — Currículo" (`docs/12_FICHAS_DOS_MODOS.md:110`), que repete a INST-041 (`docs/17_ROTEIRO_DAS_CARTAS.md:304`) e a INST-049 planejada (`docs/12_FICHAS_DOS_MODOS.md:196`). Tema novo (proposta ao PO nº 1): a lei da IA e o pagamento a artistas, com o mecanismo do destaque — o plenário aprova o texto-base e vota um trecho à parte, que pode cair. Base real: o projeto de lei da IA aprovado no Senado em 2024, com capítulo de direitos autorais (pista no APR-019). Nenhuma carta do baralho nem do banco trata de regular a IA: as do Influenciador tratam de deepfake e robôs (INST-183, 186, 188, 189). Tema próximo do público de 15 a 30 anos (criadores, músicos, ilustradores). `ACT-019` teme perder o financiamento (`docs/11_FICHAS_DOS_ATORES.md:449`); `ACT-020` teme a regulação (`:470`). Eixo como a INST-009 (`.claude/notas/execucao/onda-05/cartas.md:105`, `:111`): regra para empresa estrangeira = [−1, −1, 0, 0]; abrir = [+1, +1, 0, 0]. Evento A: big techs ameaçam investimento quando um país as regula (pista). Cor A Vermelho (renda de quem cria, inferência do GD); Cor B Laranja (desregulamentação, `docs/10_GUIA_DE_ESTILO_E_TOM.md:261`). Quem fala: a Câmara dos Deputados, instituição do modo (`docs/17_ROTEIRO_DAS_CARTAS.md:128`). Ano mínimo 1.

### INST-020 — Redução do Salário Mínimo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Limite ao salário mínimo |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | `ACT-015` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Líderes querem aprovar um limite ao aumento do salário mínimo em votação simbólica, sem registrar o voto de cada deputado. |
| **Opção A** | Pedir votação nominal |
| **Efeitos A** | `Integridade` +10, `Dignidade` +10, `Capital Político` -10, `Caixa` -10 |
| **Consequência A** | "Cada voto fica registrado. Com medo do eleitor, deputados derrubam o limite." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-015` +1, `ACT-011` -1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar o voto simbólico |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "O limite passa em segundos. Ninguém sabe quem votou a favor." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-011` +1, `ACT-006` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-020 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-020):** tema do banco "Redução do salário mínimo — Direitos trabalhistas" (`docs/12_FICHAS_DOS_MODOS.md:111`). O salário mínimo não pode cair: a Constituição manda preservar o poder de compra (pista no APR-020). A carta trata do que é possível, limitar o aumento, com o mecanismo da votação simbólica × nominal: na simbólica, ninguém registra o voto; um líder pode pedir a nominal. O P-003 dava "o Congresso quer reduzir o salário mínimo", o que a Constituição veda. RC-08: tema de campanha; sem governo, partido nem pessoa — "líderes" por papel. Repetição: salário mínimo também no Orçamento (INST-033, `docs/12_FICHAS_DOS_MODOS.md:152`) e nas Bancadas (INST-126, `:385`) — proposta ao PO nº 3. `ACT-015` quer aumento real do mínimo (`docs/11_FICHAS_DOS_ATORES.md:372`, `:375`); `ACT-011` controla a pauta (`:294`); `ACT-006` cobra austeridade (`:200`). Caixa −10 em A: o mínimo reajusta aposentadorias e benefícios (pista). Eixo: A Eco −1 e Est +1 (voto transparente); B Eco +1 e Est −1 (proposta ao PO nº 5: Est 0 em B). Cor A Vermelho (direitos trabalhistas, `docs/10_GUIA_DE_ESTILO_E_TOM.md:256`); Cor B Amarelo (governabilidade, `:259`). Ano mínimo 2: carta ligada a Dignidade e Integridade (A). Sem evento: a consequência já mostra o resultado.

### INST-023 — Teto de Gastos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Furar o teto |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | A arrecadação sobe, mas o teto de gastos impede gastar mais. Sem verba, as obras de casas populares param. |
| **Opção A** | Furar o teto |
| **Efeitos A** | `Dignidade` +15, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "O Congresso aprova a exceção, e as obras voltam. O mercado desconfia." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-016` +1, `ACT-003` +1, `ACT-006` -1 |
| **Evento A** | "Os juros sobem com a desconfiança do mercado" · atraso 1 · `Caixa` -10 |
| **Opção B** | Cumprir o teto |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "A regra se mantém, e o mercado aprova. As obras seguem paradas." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-006` +1, `ACT-007` +1, `ACT-016` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-023 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-023):** tema do banco "Teto de gastos — EC 95" (`docs/12_FICHAS_DOS_MODOS.md:142`). Ideia: a regra fiscal limita o gasto total mesmo com a arrecadação em alta — o orçamento público não é o de casa (`:127`); gastar acima exige mudar a regra no Congresso ("furar o teto"). O P-003 era "PEC para revogar × manter"; aqui o dilema é a exceção para uma necessidade concreta. Não repete a INST-021 (onde cortar, `docs/17_ROTEIRO_DAS_CARTAS.md:246`); nota para a INST-140 planejada ("Revogação do teto de gastos", `docs/12_FICHAS_DOS_MODOS.md:399`): trocar de ângulo. Casas populares: `ACT-016` cobra investimento em habitação (`docs/11_FICHAS_DOS_ATORES.md:394`); `ACT-003`, dono de empreiteira (`:137`), oferece empregos (`:142`) e ganha com as obras — aliado improvável do MTST em A; `ACT-006` e `ACT-007` temem o descontrole fiscal (`:198`, `:219`). Evento A: juros sobem quando o mercado desconfia da regra (pista). Eixo Eco ±1. Cor A Roxo (movimentos sociais, `docs/10_GUIA_DE_ESTILO_E_TOM.md:260`); Cor B Azul (estabilidade econômica, `:257`). Ano mínimo 2: as obras param depois de começar; carta ligada a Dignidade (A).

### INST-024 — Emenda para Show

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Bloqueio das emendas |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | A receita cai, e você precisa bloquear verbas. Pode cortar também as emendas, que pagam shows e obras nas bases dos deputados. |
| **Opção A** | Cortar as emendas também |
| **Efeitos A** | `Dignidade` +5, `Integridade` +5, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência A** | "O corte se divide por igual. Deputados ameaçam travar seus projetos." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-007` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Poupar as emendas |
| **Efeitos B** | `Capital Político` +15, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "Os shows seguem. O corte cai inteiro sobre saúde, escolas e bolsas." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-024 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-024):** tema do banco "Emenda para show — Emendas" (`docs/12_FICHAS_DOS_MODOS.md:143`). A INST-101, já escrita no modo Emendas, é o mesmo dilema do banco (show × hospital, `docs/17_ROTEIRO_DAS_CARTAS.md:748`); por isso a ideia aqui é outra: emendas impositivas no bloqueio de verbas — o governo tem de pagá-las e só pode cortá-las até a mesma proporção dos outros gastos (pista no APR-024). Os shows ficam só como exemplo do que as emendas pagam. `ACT-011` quer emendas (`docs/11_FICHAS_DOS_ATORES.md:294`); `ACT-007` quer as contas equilibradas (`:218`); `ACT-014` perde verba da saúde (`:354`). Eixo zero nas duas: governabilidade × integridade, sem conteúdo ideológico (como a INST-007, `.claude/notas/execucao/onda-05/cartas.md:43`, `:49`). Cor A Azul (gestão, inferência do GD, como a INST-007 A); Cor B Amarelo (governabilidade, `docs/10_GUIA_DE_ESTILO_E_TOM.md:259`). Ano mínimo 2: o primeiro orçamento é herdado; carta ligada a Dignidade, Integridade e Legitimidade (A). Sem evento.

### INST-025 — Subsídio para Agronegócio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Juros do Plano Safra |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | O Tesouro paga parte dos juros do crédito rural. A verba não dá para todos: grandes exportadores ou pequenos agricultores? |
| **Opção A** | Priorizar os pequenos |
| **Efeitos A** | `Dignidade` +10, `Soberania` +5, `Capital Político` -10 |
| **Consequência A** | "O crédito barato chega à agricultura familiar. Grandes produtores reclamam." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-017` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Priorizar os exportadores |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Dignidade` -10 |
| **Consequência B** | "As exportações crescem. Pequenos agricultores ficam sem crédito barato." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-001` +1, `ACT-017` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-025 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-025):** tema do banco "Subsídio para agronegócio — Prioridades" (`docs/12_FICHAS_DOS_MODOS.md:144`). Ideia: subsídio também é gasto — o Tesouro paga parte dos juros do crédito rural (equalização) e escolhe quem recebe (pista no APR-025). O P-003 punha valores no texto; aqui sem número (kit §2). Notas para as planejadas: a INST-109 ("Emenda para agro", `docs/12_FICHAS_DOS_MODOS.md:340`) fica com a emenda; a INST-130 ("Isenção para agro", `:389`), com a renúncia fiscal, não com o crédito. Evitei a frase do rascunho "a agricultura familiar alimenta o povo" (`docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:2012-2013`): a fatia da comida que vem dela é dado disputado (pista). `ACT-017` cobra crédito agrícola (`docs/11_FICHAS_DOS_ATORES.md:413`); `ACT-001` quer manter o controle (`:102`). Soberania +5 em A: comida produzida no país para o país (inferência do GD). Eixo Eco ±1; Diplomacia 0 (exportar não é alinhamento a potência). Cor A Roxo (reforma agrária, `docs/10_GUIA_DE_ESTILO_E_TOM.md:260`); Cor B Verde (agronegócio, `:258`). Ano mínimo 1: o Plano Safra é anual.

### INST-026 — Taxar Grandes Fortunas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Quem paga a conta |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-002` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Você precisa de receita para um programa social: taxar grandes fortunas ou o consumo? Investidores ameaçam tirar o dinheiro do país. |
| **Opção A** | Taxar grandes fortunas |
| **Efeitos A** | `Caixa` +10, `Dignidade` +5, `Capital Político` -15 |
| **Consequência A** | "Quem tem mais paga mais. Parte das fortunas sai do país, e a receita vem menor." |
| **Eixo A** | [-2, 0, 0, 0] |
| **Atores A** | `ACT-015` +1, `ACT-002` -1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Taxar o consumo |
| **Efeitos B** | `Caixa` +15, `Capital Político` +5, `Dignidade` -10, `Legitimidade` -10 |
| **Consequência B** | "Tudo fica mais caro no mercado. Quem ganha pouco sente mais no bolso." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-002` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-026 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-026):** tema do banco "Taxar grandes fortunas — Justiça fiscal" (`docs/12_FICHAS_DOS_MODOS.md:145`). Ideia: quem paga a conta — imposto progressivo (fortunas) × regressivo (consumo). Não é o sim/não da pergunta 5 da calibração (`docs/15_FLUXO_DO_JOGO.md:79`): as duas opções arrecadam, e o dilema é de quem sai o dinheiro. A arrecadação menor em A (+10 × +15) e a fuga parcial na consequência mostram o limite real do imposto sobre fortunas (pista; dúvida ao PSI nº 6). Nota para a INST-040 ("Taxar grandes heranças", `docs/12_FICHAS_DOS_MODOS.md:159`): ficar com o imposto estadual sobre herança e o teto fixado pelo Senado, não com "quem tem mais paga mais". `ACT-002` teme "ver o governo taxar suas fortunas" (`docs/11_FICHAS_DOS_ATORES.md:122`); `ACT-015` defende o trabalhador (`:372`); `ACT-006` teme a intervenção (`:198`). Eixo A Eco −2, como a calibração (`docs/15_FLUXO_DO_JOGO.md:79`); B Eco +1. Cor A Vermelho (`docs/10_GUIA_DE_ESTILO_E_TOM.md:256`); Cor B Laranja (direita liberal, `:261`). Ano mínimo 1. Sem evento: a fuga entra na consequência, para não somar seis eventos na onda.

### INST-027 — Corte na Educação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Piso da educação |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | A equipe econômica quer tirar da Constituição o piso de gasto com educação. Diz que assim o orçamento fica livre. |
| **Opção A** | Manter o piso |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "A educação segue com verba garantida. Sobra menos para outras áreas." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-013` +1, `ACT-007` -1 |
| **Evento A** | — |
| **Opção B** | Acabar com o piso |
| **Efeitos B** | `Caixa` +15, `Capital Político` +5, `Consciência` -10, `Dignidade` -10 |
| **Consequência B** | "O Congresso aprova a mudança. A educação passa a disputar verba com tudo." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-007` +1, `ACT-005` +1, `ACT-013` -1 |
| **Evento B** | "Estados e cidades cortam verba das escolas" · atraso 2 · `Consciência` -10 |
| **Aprendizado** | APR-027 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-027):** tema do banco "Corte na educação — Sucateamento" (`docs/12_FICHAS_DOS_MODOS.md:146`). Ideia: vinculação — a Constituição obriga a gastar uma parte da receita com educação (pista no APR-027). O P-003 era "recompor × manter o corte", com número no texto; aqui a proposta de desvincular, que já apareceu em governos diferentes (pista, sem nomes). Diferente da INST-017 (cidadãos pedem mais verba fixa para o SUS; o centro é a iniciativa popular) e da pergunta 3 da calibração (`docs/15_FLUXO_DO_JOGO.md:77`): aqui o tema é a regra que protege a verba, não o tamanho do gasto. `ACT-013` resiste ao sucateamento (`docs/11_FICHAS_DOS_ATORES.md:334`); `ACT-007` quer "equilibrar as contas" (`:218`); `ACT-005` cobra cortes na educação pública (`:181`). Capital Político −5 em A: o Congresso quer o espaço livre para emendas. Evento B: o piso vale também para estados e cidades, que passam a poder cortar (pista). Eixo Eco ±1. Cor A Vermelho (educação pública, inferência do GD); Cor B Azul (reformas, `docs/10_GUIA_DE_ESTILO_E_TOM.md:257`). Ano mínimo 2: carta ligada a Consciência e Dignidade (A).

### INST-028 — Corte na Cultura

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Edital na gaveta |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Um edital de cultura premia filmes sobre diversidade sexual. Pastores aliados pedem que você segure a verba, já prevista no orçamento. |
| **Opção A** | Liberar a verba |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "Os filmes saem do papel. Pastores dizem que o governo ataca a família." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-019` +1, `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Segurar a verba |
| **Efeitos B** | `Capital Político` +15, `Consciência` -10, `Integridade` -5 |
| **Consequência B** | "A verba fica parada, sem corte oficial. Artistas denunciam censura." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-012` +1, `ACT-019` -1 |
| **Evento B** | "A Justiça manda liberar a verba do edital" · atraso 1 · `Legitimidade` -5, `Integridade` -5 |
| **Aprendizado** | APR-028 (doc 18) |
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-028):** tema do banco "Corte na cultura — Censura" (`docs/12_FICHAS_DOS_MODOS.md:147`). Ideia: execução do orçamento — a verba prevista na lei só chega quando o governo libera; segurar a verba de quem incomoda é censura disfarçada, e a Justiça pode mandar pagar. Base real: um edital de séries para TV pública suspenso em 2019 e retomado por ordem judicial (pista no APR-028; sem nomes). O rascunho do APR-028 nomeia artistas vivos, com valores (`docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:2097-2098`), e não deve ser aproveitado (RC-08). Notas para as planejadas: a INST-038 (`docs/12_FICHAS_DOS_MODOS.md:157`), a INST-117 (`:348`) e a INST-134 (`:393`) devem evitar "segurar o edital". `ACT-012` cobra "censura aos costumes" (`docs/11_FICHAS_DOS_ATORES.md:318`); `ACT-019` teme "ver a cultura ser silenciada" (`:449`). "Ataca a família" é a voz dos pastores, não do jogo (dúvida ao PSI nº 2). Legitimidade −5 em A: parte do público rejeita o tema (pista). Eixo: censura = Soc −1, Est −1 (convenção da Onda 5, `.claude/notas/execucao/onda-05/cartas.md:23`); liberar = Soc +1, Est +1. Cor A Roxo (movimentos sociais, `docs/10_GUIA_DE_ESTILO_E_TOM.md:260`); Cor B Preto (censura, pânico moral, `:262`). Ano mínimo 2: o edital sai de um orçamento aprovado no seu governo; carta ligada a Consciência e Integridade (A).

---

## Relatório da onda (script, 2026-10-21)

`PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-06/cartas.md --no-learning --wave-report --style` → 10 cartas conferidas, 0 erros, 0 avisos de estilo (saída 0). Os 30 blocos de `aprendizados.md` passaram pela mesma função de estilo do script (`style_warnings`) e pelos limites de caracteres: 0 avisos.

| Meta (prompt e kit §5) | Resultado |
| :--- | :--- |
| Eventos em 4-5 de 20 opções | 5 (25%): 018 B, 019 A, 023 A, 027 B, 028 B |
| ≥ 2 opções Dignidade+ com Ano mínimo 2-4 | 4: 020 A, 023 A, 024 A, 027 A |
| ≥ 1 opção Segurança+ com Ano mínimo 2-4 | 1: 018 B |
| Sociedade ≠ 0 em ≥ 3 opções | 4 (20%): 018 e 028, nas duas opções |
| Diplomacia ≠ 0 em ≥ 3 opções | 4 (20%): 018 e 019, nas duas opções; Economia 14 (70%), Estado 7 (35%) |
| ≥ 3 cartas com Ano mínimo 2-4 e efeito positivo | 6: 018, 020, 023, 024, 027, 028 (Consciência, Integridade, Segurança, Dignidade, Legitimidade, Caixa, Capital Político) |
| 7 cores com saldo negativo; toda opção com ≥ 1 custo | Vermelho 5, Azul 4, Roxo 4, Preto 2, Amarelo 2, Laranja 2, Verde 1; todas negativas em ≥ 1 medidor |
| Atores | 20 de 20 opções; 18 atores; `ACT-011` em 3 opções, `ACT-019` em 4 |

Somas por cor (script): Preto Consciência −20, Integridade −5, Legitimidade −5 · Azul Consciência −10, Dignidade −10, Legitimidade −10 · Verde Dignidade −10 · Laranja Dignidade −15, Legitimidade −10, Soberania −10 · Roxo Capital Político −40, Caixa −10, Legitimidade −5 · Vermelho Capital Político −45, Caixa −25 · Amarelo Dignidade −20, Integridade −10.

Baralho inteiro (doc 17 + Ondas 3-6, numa cópia no scratchpad): 82 cartas; eventos 16% → 18%; Sociedade 23% → 23%; Diplomacia 40% → 37%; carta ligada no Ano 2-4: Dignidade 5 → 9, Consciência 6 → 9, Integridade 11 → 15, Segurança 7 → 8, Legitimidade 12 → 13. Modo Congresso completo (20 de 20); Orçamento com 8 de 20. Avisos fora das metas: técnicas do Influenciador em 0 (não se aplica aos modos).

## Propostas do GD que pedem o PO (provisórias)

1. **INST-019 — tema novo "Destaque na lei da IA"** (o banco repete a INST-041 e a INST-049). (A) Lei da IA e pagamento a artistas, com o destaque — **recomendada**: nenhum card trata de regular a IA, tema do público jovem criador, Diplomacia natural; contra: lei ainda em tramitação (pista). (B) Escala 6x1: já está nas Bancadas (INST-138, `docs/12_FICHAS_DOS_MODOS.md:397`). (C) Cannabis medicinal, com o poder conclusivo das comissões: drogas já estão no Prisional (INST-083, `:286`).
2. **INST-018 — ângulo da memória.** (A) Tratado da ONU sobre crimes que não prescrevem, com o referendo do Congresso — **recomendada**: memória sem o debate atual de anistia (RC-08), dá Diplomacia; contra: mais abstrato. (B) Projeto que tira a tortura da Lei de Anistia: direto, mas o mecanismo seria a votação, como na 020. (C) Nova anistia votada no Congresso: lembra o 8 de janeiro, tema de campanha — não recomendada.
3. **Salário mínimo em três modos** (020; INST-033, `docs/12_FICHAS_DOS_MODOS.md:152`; INST-126, `:385`). (A) A 020 fica com a votação simbólica; a 033 passa a "desvincular benefícios do mínimo" (vinculação no orçamento); a 126 troca de tema — **recomendada**. (B) 033 e 126 trocam de tema. (C) Manter os três.
4. **Mapa do Orçamento e repetições** (convenção no topo): 024 × INST-101 (mesmo dilema do banco; a 024 ensina emendas impositivas); 023 × INST-140 (teto); 025 × INST-109 e 130 (agro); 026 × INST-040 (heranças) e pergunta 5 da calibração; 028 × INST-038, 117 e 134 (cultura); 017 × INST-030 (SUS); LDO para a INST-034. (A) Aprovar o mapa e levar as notas às próximas ondas — **recomendada**. (B) Revisar o banco do Orçamento inteiro antes da próxima onda.
5. **Eixos de fronteira:** 018 com três eixos (Dip, Soc e Est ±1; alternativa: só Dip e Est); 017 B Est 0 (alternativa −1); 020 B Est −1 (alternativa 0); 024 com eixo zero; 025 com Diplomacia 0 (alternativa ±1: exportar = abertura); 026 A Eco −2, como a calibração.
6. **Ano mínimo 2** em 018, 020, 023, 024, 027 e 028 (governo formado, orçamento próprio ou tramitação); 1 nas outras quatro.
7. **Cabeçalhos:** mantêm o banco, salvo a 019. O da 017 diz "10% do PIB", mas a campanha real pedia uma fatia da receita (pista do APR-017): trocar por "Assinaturas pelo SUS"?

## Dúvidas para o PSI

1. INST-018: ditadura e tortura (aviso de conteúdo), sem detalhe; "Militares da reserva veem ameaça à anistia"; Segurança +5 em B (paz nos quartéis) lê como "impunidade traz segurança"?
2. INST-028: "diversidade sexual" e "ataca a família" (voz dos pastores, não do jogo); Preto em B; risco de estereótipo religioso (só o ator `ACT-012`).
3. INST-020: tema de campanha (RC-08); "Com medo do eleitor, deputados derrubam o limite" generaliza os deputados?
4. INST-019: "Big techs adiam centros de dados" atribui ameaça a empresas sem nome; `ACT-020` é empresa real (D-083).
5. INST-025: troquei "quem planta comida" por "agricultura familiar" para não afirmar dado disputado; "Grandes produtores reclamam" está neutro?
6. INST-026: "Parte das fortunas sai do país" é afirmação empírica (sai se a fonte não sustentar).
7. INST-024: "O corte cai inteiro sobre saúde, escolas e bolsas" exagera? O bloqueio pega os gastos livres (pista).
8. Cores: Preto em 018 B e 028 B (militares e pastores); Amarelo perde Dignidade e Integridade em 020 B e 024 B (padrão aceito, D-097); Verde só em 025 B.

Nota para o fio principal: (a) atualizar o "Estado do baralho" do kit com os números acima. (b) Bets: nenhuma carta desta onda as supõe legais; a INST-181 (`docs/17_ROTEIRO_DAS_CARTAS.md:980`) e a INST-194 da Onda 3 (`.claude/notas/execucao/onda-03/cartas.md`, "Comissão sobre a Perda dos Seguidores") supõem casas de apostas em operação — rever à luz da MP 1.394/2026 (dado do fio principal, não conferido pelo GD). (c) As linhas do doc 18 citadas no prompt (`:1831-1940`, `:1943-2106`) estão certas.

## Autoconferência (`.claude/rules/verificacao.md`)

Citações conferidas no arquivo em 2026-10-21 (amostra pedida: 5; conferidas 17, todas batem): `docs/12_FICHAS_DOS_MODOS.md:108`, `:110`, `:143`, `:153`, `:399`; `docs/11_FICHAS_DOS_ATORES.md:239`, `:413`, `:449`; `docs/17_ROTEIRO_DAS_CARTAS.md:128`, `:190`, `:748`; `docs/15_FLUXO_DO_JOGO.md:80`; `docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:1991`, `:2097`; `.claude/notas/execucao/onda-05/cartas.md:43`, `:364`; `docs/10_GUIA_DE_ESTILO_E_TOM.md:261`. Fato externo conferido na web: a PFDC/MPF lista a convenção de 1968 como "não ratificada pelo Brasil" (URL na pista do APR-018).

Higiene: o script rodou com `PYTHONDONTWRITEBYTECODE=1` (nenhum `__pycache__`); `git status` sem mudanças; nenhum arquivo do repositório tocado fora de `.claude/notas/execucao/onda-06/`; cópias do baralho e scripts de contagem só no scratchpad.
