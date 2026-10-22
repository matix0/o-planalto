# Onda 24 do P-015 — temáticas de Trabalho (THEM-041 a THEM-050) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo D-196** (`.claude/notas/execucao/brief-d196.md`)
**Status:** CONCLUÍDO (2026-10-22) — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1; tema e bloco de IDs pela DP-013 (`gestao/decisoes-provisorias.md:21`; `jogo/tools/cards_doc.py:39-41`). Modelo: THEM-001 (`docs/17_ROTEIRO_DAS_CARTAS.md:5040`).
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-24/cartas.md --no-learning --wave-report --style`

## Progresso

- [x] Brief D-196, kit, DP-011 a DP-017, §17.12, `cards_doc.py` (THEMES, THEME_BLOCKS, checagens de estilo)
- [x] Títulos de todo o doc 17 e das ondas 1-16 listados para não repetir dilema (`onda-20..22` ainda não existiam ao começar)
- [x] Plano (mecanismo, modo, cores, eventos, anos) · [x] 10 cartas · [x] check 0 erros/0 avisos · [x] aprendizados (md + json) · [x] box sai 0

## Convenções desta onda

- Tema Trabalho (bloco THEM-041..050, `labor`). Modos: Congresso (041, 045), Bancadas (042), Orçamento (043, 046), Geopolítico (044), Judiciário (047), Prisional e Policial (048, 050), Currículo e Mídia (049).

- Modo de cada carta = arena do dilema (DP-013); nenhuma no Impeachment nem no Influenciador (exigiria Técnica e Reação).
- Nenhum número, dado nem pessoa real no texto ao jogador; fatos ficam na pista de dado do Aprendizado (D-091, RC-08).

---

### THEM-041 — Entregador sem patrão

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Entregador sem patrão |
| **Tipo** | Temática |
| **Modo** | Congresso |
| **Tema** | Trabalho |
| **Quem fala** | `ACT-015` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Entregadores de aplicativo trabalham sem seguro nem descanso. As empresas dizem que eles são parceiros, não empregados. |
| **Opção A** | Garantir direitos |
| **Efeitos A** | `Dignidade` +15, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "Entregadores ganham piso e seguro. As empresas sobem a taxa." |
| **Eixo A** | [-2, 0, 0, +1] |
| **Atores A** | `ACT-015` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Deixar como autônomos |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "Nada muda. Os entregadores fazem greve no fim de semana." |
| **Eixo B** | [+2, 0, 0, -1] |
| **Atores B** | `ACT-006` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-041 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-041):** Uberização e vínculo de trabalho; não repete INST-002 (direitos da CLT) nem INST-138 (escala 6×1). Eixo Economia ±2.

### THEM-042 — Lista suja

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Lista suja |
| **Tipo** | Temática |
| **Modo** | Bancadas |
| **Tema** | Trabalho |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Empresas flagradas com trabalho escravo entram numa lista pública. A bancada ruralista quer suspender a lista. |
| **Opção A** | Manter a lista suja |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "A lista segue pública. A bancada ruralista trava suas pautas." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Suspender a lista |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência B** | "A lista sai do ar. Os fazendeiros comemoram." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-001` +1 |
| **Evento B** | "Fiscais acham trabalho escravo numa fazenda que vende ao exterior." · atraso 2 · `Legitimidade` -10 |
| **Aprendizado** | APR-THEM-042 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-042):** Trabalho análogo à escravidão e transparência; tema com aviso de conteúdo leve, sem detalhe. Evento em B: o problema volta pela imprensa. `ACT-001` como quem fala.

### THEM-043 — Greve dos servidores

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Greve dos servidores |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Trabalho |
| **Quem fala** | `ACT-009` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Servidores federais estão em greve há um mês. O INSS e as universidades param, e o caixa está apertado. |
| **Opção A** | Dar o reajuste |
| **Efeitos A** | `Caixa` -20, `Dignidade` +5, `Capital Político` +5 |
| **Consequência A** | "Os servidores voltam ao trabalho. O Tesouro corta outras despesas." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-009` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Cortar o ponto |
| **Efeitos B** | `Caixa` +10, `Dignidade` -5, `Legitimidade` -5 |
| **Consequência B** | "Os grevistas perdem o salário. O atendimento para por semanas." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-009` -1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-043 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-043):** Direito de greve no serviço público × ajuste fiscal. Estado ±1 (fortalecer ou enfraquecer o serviço público).

### THEM-044 — Cacau com trabalho infantil

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cacau com trabalho infantil |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Trabalho |
| **Quem fala** | Ministério das Relações Exteriores |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Preto |
| **Problema** | Compradores europeus ameaçam barrar o cacau brasileiro por causa de trabalho infantil nas fazendas. |
| **Opção A** | Fiscalizar as fazendas |
| **Efeitos A** | `Dignidade` +10, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "Fiscais vão ao campo. A Europa mantém as compras." |
| **Eixo A** | [0, +1, 0, +1] |
| **Atores A** | `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Acusar protecionismo |
| **Efeitos B** | `Soberania` +5, `Dignidade` -10, `Caixa` -5 |
| **Consequência B** | "O governo nega o problema. Os compradores ficam desconfiados." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-001` +1 |
| **Evento B** | "O comprador europeu suspende as compras de cacau." · atraso 1 · `Caixa` -15 |
| **Aprendizado** | APR-THEM-044 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-044):** Cadeias globais e trabalho infantil. Diplomacia +1 em A (atender a exigência), −1 em B (soberania comercial). Evento em B confirma o risco.

### THEM-045 — Contribuição sindical

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Contribuição sindical |
| **Tipo** | Temática |
| **Modo** | Congresso |
| **Tema** | Trabalho |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Vermelho |
| **Problema** | Os sindicatos perderam a maior parte da renda e negociam pouco. Um projeto traz de volta uma contribuição dos trabalhadores. |
| **Opção A** | Volta da contribuição |
| **Efeitos A** | `Consciência` +5, `Dignidade` +5, `Legitimidade` -10 |
| **Consequência A** | "Os sindicatos ganham fôlego. Trabalhadores reclamam do desconto." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-015` +1, `ACT-004` -1 |
| **Evento A** | — |
| **Opção B** | Manter o fim |
| **Efeitos B** | `Capital Político` +5, `Dignidade` -5, `Consciência` -5 |
| **Consequência B** | "Os sindicatos encolhem. Os patrões negociam com quem sobrou." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-004` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-045 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-045):** Financiamento sindical e poder de negociação. Cores trocadas do esperado (A Laranja, B Vermelho) para não prender 'moral por cor' (D-097): os dois lados têm custo.

### THEM-046 — Robôs na fábrica

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Robôs na fábrica |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Trabalho |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Roxo |
| **Problema** | Uma montadora pede subsídio para trocar operários por robôs. Você pode exigir os empregos em troca. |
| **Opção A** | Exigir os empregos |
| **Efeitos A** | `Dignidade` +10, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "A fábrica mantém os empregos com subsídio. Os donos ficam irritados." |
| **Eixo A** | [-1, -1, 0, +1] |
| **Atores A** | `ACT-004` -1, `ACT-015` +1 |
| **Evento A** | "A empresa leva parte da fábrica para o país vizinho." · atraso 2 · `Caixa` -10 |
| **Opção B** | Pagar requalificação |
| **Efeitos B** | `Caixa` -10, `Capital Político` +10, `Dignidade` -5 |
| **Consequência B** | "Os robôs chegam. Os demitidos ganham cursos e poucas vagas." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-004` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-046 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-046):** Automação e contrapartida social. Diplomacia −1 em A (protecionismo industrial); evento em A: a fuga de capital. Não repete INST-038 (isenção das montadoras): aqui o tema é emprego × tecnologia.

### THEM-047 — Fim da Justiça do Trabalho

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fim da Justiça do Trabalho |
| **Tipo** | Temática |
| **Modo** | Judiciário |
| **Tema** | Trabalho |
| **Quem fala** | Supremo Tribunal Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Preto |
| **Cor B** | Verde |
| **Problema** | Uma PEC quer acabar com a Justiça do Trabalho e passar os processos para a Justiça comum. |
| **Opção A** | Defender a Justiça |
| **Efeitos A** | `Dignidade` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "A Justiça do Trabalho fica. O mercado fala em custo Brasil." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-006` -1, `ACT-015` +1 |
| **Evento A** | — |
| **Opção B** | Juntar à Justiça comum |
| **Efeitos B** | `Caixa` +10, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "Os processos trabalhistas vão para a Justiça comum. A fila cresce." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-006` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-047 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-047):** Estrutura do Judiciário e acesso a direitos. Estado ±1.

### THEM-048 — Trabalho de presos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Trabalho de presos |
| **Tipo** | Temática |
| **Modo** | Prisional e Policial |
| **Tema** | Trabalho |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Empresas querem usar presos como mão de obra. Você pode exigir salário e redução de pena, ou ceder os presos baratos. |
| **Opção A** | Salário e menos pena |
| **Efeitos A** | `Dignidade` +10, `Segurança` +5, `Caixa` -10 |
| **Consequência A** | "Os presos trabalham com salário e reduzem a pena. A volta ao crime cai." |
| **Eixo A** | [-1, 0, +1, +1] |
| **Atores A** | `ACT-015` +1 |
| **Evento A** | — |
| **Opção B** | Mão de obra barata |
| **Efeitos B** | `Caixa` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "As empresas lucram com presos que ganham quase nada." |
| **Eixo B** | [+1, 0, -1, 0] |
| **Atores B** | `ACT-004` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-048 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-048):** Trabalho prisional e reinserção; não repete as cartas do modo (saidinha, superlotação). Ano 2, carta ligada a Dignidade e Segurança.

### THEM-049 — Escola técnica

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escola técnica |
| **Tipo** | Temática |
| **Modo** | Currículo e Mídia |
| **Tema** | Trabalho |
| **Quem fala** | Ministério da Educação |
| **Ano mínimo** | 2 |
| **Cor A** | Verde |
| **Cor B** | Azul |
| **Problema** | Jovens saem da escola sem profissão. Você pode abrir escolas técnicas públicas ou pagar cursos dentro das empresas. |
| **Opção A** | Escolas técnicas públicas |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Caixa` -15 |
| **Consequência A** | "Novos institutos abrem. Os primeiros técnicos se formam." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Cursos das empresas |
| **Efeitos B** | `Caixa` -5, `Consciência` -10, `Capital Político` +5 |
| **Consequência B** | "As empresas treinam para a vaga delas. A formação geral fica de fora." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-004` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-049 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-049):** Primeiro emprego e formação técnica; não repete INST-055 (tempo integral) nem INST-049 (aula de finanças do banco). Ano 2, carta ligada a Dignidade.

### THEM-050 — Caminhoneiros na estrada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Caminhoneiros na estrada |
| **Tipo** | Temática |
| **Modo** | Prisional e Policial |
| **Tema** | Trabalho |
| **Quem fala** | `ACT-015` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Caminhoneiros bloqueiam estradas contra o preço do diesel. Postos e mercados começam a esvaziar. |
| **Opção A** | Negociar o frete |
| **Efeitos A** | `Caixa` -15, `Segurança` +10, `Capital Político` -5 |
| **Consequência A** | "Os caminhões voltam a rodar. O frete sobe para todos." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-015` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Mandar desbloquear |
| **Efeitos B** | `Segurança` +5, `Legitimidade` -10, `Dignidade` -5 |
| **Consequência B** | "A polícia libera as estradas. Os caminhoneiros prometem voltar." |
| **Eixo B** | [+1, 0, -1, -1] |
| **Atores B** | `ACT-015` -1, `ACT-008` +1 |
| **Evento B** | "Faltam alimentos nos mercados por uma semana." · atraso 1 · `Dignidade` -10 |
| **Aprendizado** | APR-THEM-050 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-050):** Greve de categoria autônoma e uso da força; não repete INST-147 (greve geral do Impeachment). Ano 2, carta ligada a Segurança. Evento em B: o bloqueio já tinha esvaziado os estoques.

## Relatório da onda (script)

`check ... --no-learning --wave-report --style` → 10 cartas, 0 erros, 0 avisos de estilo (saída 0). `box --json` → saída 0. Metas: 4 eventos (042 B, 044 B, 046 A, 050 B) · Diplomacia 3 · Sociedade 3 · Dignidade+ com Ano 2-4: 2 · Segurança+ com Ano 2-4: 3 · 7 cores. Os avisos de Técnica do Influenciador vêm de checar só a onda (sem cartas do modo).

## Propostas ao PO (provisórias)

1. THEM-045 com cores trocadas (A Laranja, B Vermelho) para quebrar 'moral por cor'; alternativa: A Vermelho, B Laranja.
2. THEM-050 no modo Prisional e Policial (uso da polícia rodoviária); alternativa: Congresso.

## Dúvidas para o PSI (quando houver revisão)

- THEM-042 (trabalho escravo) e THEM-044 (trabalho infantil): aviso de conteúdo, sem detalhe.

## Autoconferência

- Bloco Trabalho THEM-041..050 `jogo/tools/cards_doc.py:41` (5º bloco); quem fala livre ou `ACT-xxx` `jogo/tools/cards_doc.py:319-327`; estilo (20 palavras, gerúndio, advérbio, futuro) `jogo/tools/cards_doc.py:537-555`; DP-013 `gestao/decisoes-provisorias.md:21`; THEM-001 `docs/17_ROTEIRO_DAS_CARTAS.md:5040` — conferidos.
