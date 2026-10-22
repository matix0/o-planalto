# Onda 9 do P-015 — Currículo e Mídia (INST-051 a INST-060) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo:** D-196 (sem pesquisa web, sem PSI)
**Status:** CONCLUÍDO — todas as cartas "pendente de revisão (D-196)"; nada gravado no doc 17.

## Progresso

- [x] Brief D-196, kit, ficha MOD-003 (`docs/12_FICHAS_DOS_MODOS.md:169-215`), INST-041/042 (doc 17 `:833-885`), Onda 8 (INST-043..050) e INST-011 (Escola sem Partido, Onda 5)
- [x] 10 cartas escritas
- [x] Check com 0 erros e 0 avisos de estilo
- [x] Aprendizados (md + json, modo pendente)

## Convenções e propostas ao PO

1. **INST-055** "Darcy Ribeiro e Paulo Freire no currículo" vira **escola em tempo integral** (o método freireano já é a INST-047; nome de pessoa fora do texto). Alternativa: manter o tema com outro ângulo.
2. **INST-060** "Debate político em sala" vira **canal de denúncia de professores**: o veto ao Escola sem Partido já é a INST-011 (Onda 5). Alternativa: trocar por grêmio estudantil.
3. **INST-053** "Proibição de História Afro-Brasileira" vira **lei que não sai do papel** (formar professores × dar prazo): ensina implementação, sem pôr na boca de ninguém uma proibição inventada.
4. **INST-052** sem nome de emissora (D-083 só cobre atores): "a maior emissora".
5. Diplomacia só onde há empresa estrangeira (054, 059 B).
6. Dúvidas para o PSI (quando houver): 057 (racismo em humor), 051 (ditadura), 060 (perseguição a professor).

---

### INST-051 — Censura a Documentário

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Documentário sobre a ditadura |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Um documentário sobre a ditadura, feito com verba pública, estreia na TV pública. Militares pedem que seja retirado do ar. |
| **Opção A** | Manter o filme no ar |
| **Efeitos A** | `Consciência` +15, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "O filme segue no ar. Militares reclamam em nota pública." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-008` -1, `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Retirar o filme |
| **Efeitos B** | `Capital Político` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência B** | "O filme sai do ar. Os militares agradecem em silêncio." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-008` +1, `ACT-019` -1 |
| **Evento B** | "O filme vaza nas redes e vira assunto nacional." · atraso 1 · `Legitimidade` -10 |
| **Aprendizado** | APR-051 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-051):** Tema Memória do banco (`docs/12_FICHAS_DOS_MODOS.md:204`). Mecanismo: censura estatal a obra já paga. Sem detalhe de tortura. Ano 2: carta ligada a Consciência e Legitimidade. Evento B: efeito Streisand.

### INST-052 — Globo Critica o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emissora critica o governo |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Laranja |
| **Problema** | A maior emissora do país faz uma série de reportagens contra seu governo. Aliados pedem cortar dela a publicidade oficial. |
| **Opção A** | Manter a regra técnica |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "A verba segue a audiência. Aliados dizem que você financia o inimigo." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-023` +1, `ACT-024` -1 |
| **Evento A** | — |
| **Opção B** | Cortar a verba |
| **Efeitos B** | `Capital Político` +5, `Caixa` +10, `Integridade` -15 |
| **Consequência B** | "A emissora perde a verba e acusa o governo de punir a imprensa." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-024` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-052 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-052):** Mecanismo: publicidade oficial como prêmio ou castigo. Sem nome de emissora. Não repete a INST-044 (fake news e concessão): aqui a crítica é legítima.

### INST-053 — Proibição de História Afro-Brasileira

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | História negra na escola |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Uma lei obriga as escolas a ensinar a história africana e afro-brasileira. Muitas redes não cumprem, e prefeitos pedem mais prazo. |
| **Opção A** | Formar professores |
| **Efeitos A** | `Consciência` +15, `Dignidade` +5, `Caixa` -15 |
| **Consequência A** | "Professores fazem o curso. O tema entra nas aulas de várias redes." |
| **Eixo A** | [-1, 0, +1, +1] |
| **Atores A** | `ACT-013` +1 |
| **Evento A** | "Alunos dizem que agora se veem nos livros." · atraso 2 · `Dignidade` +5, `Consciência` +5 |
| **Opção B** | Dar mais prazo |
| **Efeitos B** | `Capital Político` +10, `Consciência` -10, `Dignidade` -5 |
| **Consequência B** | "Os prefeitos agradecem. A lei continua só no papel." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-011` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-053 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-053):** Mudança de ângulo (proposta 3). Ensina que lei sem verba e formação não pega. Sem estereótipo; racismo tratado como estrutura. Ano 2: Dignidade+ ligada.

### INST-054 — Derrubada de Perfil de Jornalista

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Perfil de jornalista derrubado |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Azul |
| **Problema** | Uma rede social estrangeira derruba o perfil de um jornalista que investigava um aliado seu. A plataforma não explica o motivo. |
| **Opção A** | Exigir explicação |
| **Efeitos A** | `Soberania` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "A rede é chamada a explicar. Seu aliado fica exposto." |
| **Eixo A** | [0, -1, 0, 0] |
| **Atores A** | `ACT-020` -1, `ACT-023` +1 |
| **Evento A** | "A rede reduz o alcance das páginas do governo." · atraso 1 · `Legitimidade` -10 |
| **Opção B** | Não interferir |
| **Efeitos B** | `Capital Político` +5, `Integridade` -10, `Consciência` -5 |
| **Consequência B** | "O perfil segue fora do ar. A investigação some das redes." |
| **Eixo B** | [0, +1, 0, 0] |
| **Atores B** | `ACT-020` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-054 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-054):** Censura privada (tema do banco, `docs/12_FICHAS_DOS_MODOS.md:207`). Custo: defender o jornalista expõe o aliado. Dip −1 controle nacional sobre a plataforma; +1 deixar a empresa estrangeira decidir (kit §4).

### INST-055 — Darcy Ribeiro e Paulo Freire no Currículo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escola em tempo integral |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Prefeituras pedem verba para escola em tempo integral, com esporte e arte. A equipe econômica prefere um bônus por nota em prova. |
| **Opção A** | Financiar o integral |
| **Efeitos A** | `Dignidade` +10, `Segurança` +10, `Caixa` -20 |
| **Consequência A** | "As escolas ficam abertas o dia todo. A conta pesa no orçamento." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-013` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Bônus por nota |
| **Efeitos B** | `Capital Político` +5, `Caixa` -5, `Consciência` -10 |
| **Consequência B** | "As escolas treinam para a prova. O resto do currículo encolhe." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-007` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-055 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-055):** Tema trocado (proposta 1); educação integral está na fundamentação do modo (`docs/12_FICHAS_DOS_MODOS.md:181`). Ano 2: Dignidade+ e Segurança+ ligadas.

### INST-056 — Educação para a Cidadania

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aula sobre o poder |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | O MEC propõe aulas sobre como funcionam o voto, o Congresso e o orçamento. Deputados temem ser cobrados pelos alunos. |
| **Opção A** | Incluir as aulas |
| **Efeitos A** | `Consciência` +15, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência A** | "Os alunos aprendem a seguir o voto dos deputados. O Centrão reclama." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-011` -1, `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Deixar opcional |
| **Efeitos B** | `Capital Político` +10, `Consciência` -10 |
| **Consequência B** | "Poucas escolas oferecem as aulas. Os deputados respiram aliviados." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-056 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-056):** Currículo (banco `:203`). Distinto da INST-050 (quem dá a aula): aqui o conflito é com quem será fiscalizado.

### INST-057 — Emissora Acusada de Racismo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Piada racista na TV |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Um programa de humor de grande audiência faz uma piada racista. Movimentos pedem punição; a emissora fala em liberdade. |
| **Opção A** | Abrir processo |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10 |
| **Consequência A** | "O ministério abre processo. A emissora diz que é perseguição." |
| **Eixo A** | [0, 0, +1, -1] |
| **Atores A** | `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Deixar com a emissora |
| **Efeitos B** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "A emissora pede desculpas genéricas. O quadro continua no ar." |
| **Eixo B** | [0, 0, -1, +1] |
| **Atores B** | `ACT-019` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-057 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-057):** Racismo sem reproduzir a piada (doc 10). Mecanismo: regulação estatal × autorregulação. Dúvida ao PSI.

### INST-058 — Proibição de Linguagem Neutra

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Multa por linguagem neutra |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | A Câmara aprova multar escolas que usem linguagem neutra. Professores dizem que o uso é raro e temem virar alvo. |
| **Opção A** | Vetar a multa |
| **Efeitos A** | `Consciência` +5, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "O veto sai. Deputados dizem que você defende modismo." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-013` +1, `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Sancionar a multa |
| **Efeitos B** | `Capital Político` +15, `Consciência` -10, `Dignidade` -5 |
| **Consequência B** | "A lei vale. Escolas passam a revisar cada palavra das aulas." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-012` +1, `ACT-013` -1 |
| **Evento B** | "Professores são denunciados por vídeos de aula." · atraso 1 · `Consciência` -10, `Integridade` -5 |
| **Aprendizado** | APR-058 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-058):** Censura (banco `:205`). Pânico moral como na INST-045, mas o mecanismo é multa à escola, não recolher livro.

### INST-059 — Programa de Leitura nas Periferias

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Bibliotecas de bairro |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Coletivos de bairro mantêm bibliotecas comunitárias sem apoio. Uma plataforma estrangeira oferece um app de leitura com anúncios. |
| **Opção A** | Apoiar as bibliotecas |
| **Efeitos A** | `Consciência` +10, `Dignidade` +10, `Caixa` -10 |
| **Consequência A** | "As bibliotecas ganham livros e horário estendido. Mais leitores nos bairros." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-016` +1, `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Fechar com o app |
| **Efeitos B** | `Caixa` +5, `Soberania` -10, `Consciência` -5 |
| **Consequência B** | "O app chega a todos os celulares. Os dados dos leitores vão junto." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-020` +1, `ACT-016` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-059 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-059):** Educação (banco `:206`). Os coletivos são protagonistas, sem estereótipo. Ano 2: Dignidade+ ligada. Dip +1 no acordo com empresa estrangeira.

### INST-060 — Debate Político em Sala

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Denúncia contra professores |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 3 |
| **Cor A** | Verde |
| **Cor B** | Preto |
| **Problema** | Um deputado cria um canal para alunos filmarem e denunciarem professores. Ele pede o apoio do MEC para divulgar. |
| **Opção A** | Recusar o canal |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "O MEC recusa. O deputado diz que o governo protege doutrinadores." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-022` -1, `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Apoiar o canal |
| **Efeitos B** | `Capital Político` +10, `Consciência` -15, `Legitimidade` -5 |
| **Consequência B** | "O canal recebe milhares de vídeos. Muitos são cortes fora de contexto." |
| **Eixo B** | [0, 0, -1, -2] |
| **Atores B** | `ACT-022` +1, `ACT-013` -1 |
| **Evento B** | "Professores evitam temas difíceis por medo." · atraso 2 · `Consciência` -10 |
| **Aprendizado** | APR-060 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-060):** Tema trocado (proposta 2). Ano 3: Consciência+ ligada. Sem nome real.

## Relatório do script (2026-10-22)

`check --no-learning --wave-report --style` → 10 cartas, 0 erros, 0 avisos de estilo (saída 0). `box --json aprendizados.json` → saída 0. Eventos 5/20 (25%); Diplomacia ≠ 0 em 3 opções; avisos de técnica do Influenciador não se aplicam ao modo.
