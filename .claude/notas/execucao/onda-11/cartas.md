# Onda 11 do P-015 — Prisional e Policial (INST-093 a INST-100) e Emendas (INST-102, INST-103) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo:** D-196 (sem web, Aprendizados em conferência, sem PSI)
**Status:** CONCLUÍDO — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-11/cartas.md --no-learning --wave-report --style`

## Progresso

- [x] Brief D-196, kit do GD, Onda 5 (formato), doc 12 (MOD-005 `:270-311`, MOD-006 `:315-350`), problemas do doc 17 e das Ondas 1-8 (sem repetir tema)
- [x] Cartas escritas
- [x] Check do script (0 erros, 0 avisos de estilo)
- [x] Aprendizados (`aprendizados.md`, `aprendizados.json` pendente)

## Convenções desta onda

- Um mecanismo institucional por carta (ver notas). Nenhum número, dado ou pessoa real no texto ao jogador; fatos e leis só na pista de dado (`[não verificado]`, D-196).
- Eixo Sociedade/Estado como a INST-081 (`docs/17_ROTEIRO_DAS_CARTAS.md:1705-1730`): punir mais/menos controle = −; armas = Soc ±1 (Onda 5).
- Quem fala: instituição do modo (Ministério da Justiça, como `docs/17_ROTEIRO_DAS_CARTAS.md:1712`) ou o ator que traz a pressão.
- A Onda 10 (INST-083..092) não existia na pasta quando esta onda foi escrita; a INST-093 trocou "chacina" por fiscalização da ONU para não colidir com a INST-084 planejada.

---

### INST-093 — Relator da ONU pede visita

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Relator da ONU pede visita |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Um relator da ONU pede para visitar bairros onde operações policiais mataram moradores. Governadores dizem que é intromissão. |
| **Opção A** | Abrir as portas |
| **Efeitos A** | `Consciência` +10, `Dignidade` +10, `Capital Político` -10, `Soberania` -5 |
| **Consequência A** | "O relator visita os bairros e ouve as famílias. Governadores se irritam." |
| **Eixo A** | [0, +1, +1, +1] |
| **Atores A** | `ACT-010` +1, `ACT-008` -1 |
| **Evento A** | "O relatório da ONU sai e cobra o Brasil." · atraso 2 · `Legitimidade` -10, `Consciência` +5 |
| **Opção B** | Adiar a visita |
| **Efeitos B** | `Capital Político` +10, `Soberania` +5, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "A visita fica para depois. Lá fora, o Brasil passa a ser visto com suspeita." |
| **Eixo B** | [0, -1, -1, -1] |
| **Atores B** | `ACT-008` +1, `ACT-010` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-093 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-093):** Troca de "Chacina policial" (`docs/12_FICHAS_DOS_MODOS.md:296`): a operação letal já está na INST-084 (Onda 10). Mecanismo novo: fiscalização internacional de direitos humanos (relatores especiais da ONU). Sem detalhe gráfico. Diplomacia + ao aceitar a instituição internacional (kit §4).

### INST-094 — Imposto extra sobre armas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Imposto extra sobre armas |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Ministério da Fazenda |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Laranja |
| **Problema** | A reforma tributária pode pôr um imposto extra sobre armas e munição, muitas importadas. Clubes de tiro e fabricantes reagem. |
| **Opção A** | Taxar armas e munição |
| **Efeitos A** | `Caixa` +10, `Segurança` +5, `Capital Político` -10 |
| **Consequência A** | "O imposto sobe. Clubes de tiro protestam, e a receita cresce." |
| **Eixo A** | [-1, -1, +1, 0] |
| **Atores A** | `ACT-004` -1, `ACT-021` -1 |
| **Evento A** | — |
| **Opção B** | Isentar o setor |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Segurança` -5 |
| **Consequência B** | "Armas seguem baratas. A bancada da bala apoia seus projetos." |
| **Eixo B** | [+1, +1, -1, 0] |
| **Atores B** | `ACT-004` +1, `ACT-021` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-094 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-094):** Tema "Taxação de armas" (`docs/12_FICHAS_DOS_MODOS.md:297`). Mecanismo: imposto como política de controle (imposto seletivo), não proibição; não repete o decreto de armas da INST-012 (Onda 5). Armas = Soc ±1 (convenção da Onda 5). Diplomacia pelas importadas. Quem fala: Ministério da Fazenda (instituição; conferir D-164 com o PO).

### INST-095 — Armas da polícia no crime

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Armas da polícia no crime |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Armas e munição apreendidas somem dos depósitos da polícia e voltam ao crime. Marcar e rastrear cada lote custa caro. |
| **Opção A** | Marcar e rastrear lotes |
| **Efeitos A** | `Integridade` +10, `Segurança` +10, `Caixa` -15 |
| **Consequência A** | "Cada lote ganha marca. Policiais reclamam do controle, e os desvios caem." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-008` -1, `ACT-023` +1 |
| **Evento A** | "O rastreio leva a uma rede dentro da polícia." · atraso 2 · `Integridade` +10, `Legitimidade` -5 |
| **Opção B** | Deixar à corregedoria |
| **Efeitos B** | `Caixa` +5, `Capital Político` +5, `Segurança` -10, `Integridade` -10 |
| **Consequência B** | "A corregedoria investiga em silêncio. As armas não param de sumir." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-008` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-095 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-095):** Tema "Policial vende armas" (`docs/12_FICHAS_DOS_MODOS.md:298`), sem acusar a corporação: o desvio é de depósito. Mecanismo: controle e rastreabilidade. Ano 2: carta ligada a Segurança+.

### INST-096 — Testemunha contra a milícia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Testemunha contra a milícia |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Uma moradora pode depor contra uma milícia. O programa de proteção a testemunhas está sem verba e com fila. |
| **Opção A** | Reforçar o programa |
| **Efeitos A** | `Segurança` +10, `Integridade` +5, `Caixa` -15 |
| **Consequência A** | "A moradora muda de cidade com proteção. O processo contra a milícia anda." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Pagar por denúncia |
| **Efeitos B** | `Segurança` +5, `Caixa` -5, `Integridade` -5, `Dignidade` -10 |
| **Consequência B** | "Chegam denúncias, muitas falsas. A moradora segue sem proteção." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-096 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-096):** Tema "Proteção a testemunhas" (`docs/12_FICHAS_DOS_MODOS.md:299`). Mecanismo: programa público (Provita) × recompensa por denúncia. Moradora sem estereótipo: é ela quem enfrenta o crime.

### INST-097 — PF investiga governador aliado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | PF investiga governador aliado |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | A Polícia Federal investiga um governador aliado. Ele pede que você troque o diretor da PF e promete os votos do estado. |
| **Opção A** | Manter o diretor |
| **Efeitos A** | `Integridade` +15, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência A** | "A investigação segue. A bancada do estado passa a votar contra você." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-023` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Trocar o diretor |
| **Efeitos B** | `Capital Político` +15, `Integridade` -15, `Legitimidade` -10 |
| **Consequência B** | "O novo diretor muda a equipe do caso. A bancada do estado fecha com você." |
| **Eixo B** | [0, 0, 0, -2] |
| **Atores B** | `ACT-011` +1, `ACT-023` -1 |
| **Evento B** | "Uma reportagem liga a troca ao governador." · atraso 2 · `Legitimidade` -10, `Integridade` -5 |
| **Aprendizado** | APR-097 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-097):** Tema "PF investiga governador" (`docs/12_FICHAS_DOS_MODOS.md:300`). Mecanismo: autonomia da polícia judiciária × nomeação pelo Executivo. Não repete a INST-007 (ministro sob CPI). Governador fictício, sem estado nomeado (RC-08).

### INST-098 — Presas grávidas sem julgamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Presas grávidas sem julgamento |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Presas grávidas ou com filhos pequenos esperam julgamento atrás das grades. A Defensoria quer rever os casos e pedir prisão em casa. |
| **Opção A** | Apoiar o mutirão |
| **Efeitos A** | `Dignidade` +15, `Consciência` +5, `Segurança` -5, `Caixa` -5 |
| **Consequência A** | "Muitas mães vão para casa à espera do juiz. Críticos falam em brecha." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-014` +1, `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Manter as prisões |
| **Efeitos B** | `Segurança` +5, `Capital Político` +5, `Dignidade` -15 |
| **Consequência B** | "As presas seguem nas celas. Bebês nascem e crescem dentro da prisão." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-098 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-098):** Tema "Sistema prisional feminino" (`docs/12_FICHAS_DOS_MODOS.md:301`). Troca o recorte "dignidade menstrual" (sem dilema claro) por mães e gestantes presas sem julgamento; a dignidade menstrual fica na pista. Ano 2: carta ligada a Dignidade+. Dúvida ao PSI: "Bebês nascem... dentro da prisão" — tom.

### INST-099 — Polícia de carreira única

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Polícia de carreira única |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Uma PEC une as polícias militar e civil numa só, de carreira civil. Oficiais dizem que a tropa vai perder o comando. |
| **Opção A** | Apoiar a PEC |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Capital Político` -15, `Segurança` -5 |
| **Consequência A** | "A PEC entra em debate. Quartéis se agitam contra a mudança." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-008` -1, `ACT-009` +1 |
| **Evento A** | "Policiais fazem operação lenta contra a PEC." · atraso 1 · `Segurança` -10, `Capital Político` -5 |
| **Opção B** | Manter o modelo |
| **Efeitos B** | `Capital Político` +10, `Segurança` +5, `Consciência` -5, `Dignidade` -5 |
| **Consequência B** | "Nada muda na estrutura. A tropa elogia, e as críticas seguem." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-008` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-099 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-099):** Tema "Desmilitarização da polícia" (`docs/12_FICHAS_DOS_MODOS.md:302`). Mecanismo: estrutura das polícias na Constituição (só PEC muda). Sem rótulo ideológico; a citação do modo "herdeira da ditadura" (`:310`) não entra no texto. Evento sem greve (proibida a militares): "operação lenta".

### INST-100 — Preso por foto no álbum

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Preso por foto no álbum |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 3 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Jovens negros são presos só porque a vítima os apontou num álbum de fotos. Uma regra pode exigir outras provas. |
| **Opção A** | Exigir outras provas |
| **Efeitos A** | `Dignidade` +15, `Integridade` +5, `Segurança` -5, `Capital Político` -5 |
| **Consequência A** | "A regra vale. Delegados reclamam, e menos inocentes vão presos." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-023` +1, `ACT-024` +1 |
| **Evento A** | — |
| **Opção B** | Manter o álbum |
| **Efeitos B** | `Segurança` +5, `Capital Político` +5, `Dignidade` -15, `Consciência` -5 |
| **Consequência B** | "Os álbuns seguem nas delegacias. Os erros também." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | — |
| **Evento B** | "Um inocente preso por foto vira notícia." · atraso 2 · `Legitimidade` -10, `Consciência` +5 |
| **Aprendizado** | APR-100 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-100):** Tema "População carcerária negra" (`docs/12_FICHAS_DOS_MODOS.md:303`). Mecanismo concreto do racismo no sistema: reconhecimento fotográfico. Não repete a INST-091 (líder preso, Onda 10). Ano 3: carta ligada a Dignidade+. Dúvida ao PSI: citar "jovens negros" no problema (sem dado).

### INST-102 — Estádio no lugar do esgoto

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Estádio no lugar do esgoto |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Um deputado manda sua emenda para um estádio gigante numa cidade pequena. O bairro ao lado não tem esgoto. |
| **Opção A** | Barrar por falha técnica |
| **Efeitos A** | `Dignidade` +5, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "O projeto volta por erro técnico. O deputado promete revanche na votação." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` -1, `ACT-003` -1 |
| **Evento A** | — |
| **Opção B** | Pagar a emenda |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Dignidade` -5 |
| **Consequência B** | "O estádio sai. O bairro segue sem esgoto, e a obra rende foto." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-003` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-102 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-102):** Tema "Emenda para obra faraônica" (`docs/12_FICHAS_DOS_MODOS.md:333`). Mecanismo: emenda individual impositiva (o governo é obrigado a pagar, salvo impedimento técnico). Não repete a INST-101 (show × hospital, redirecionar): aqui o governo não pode redirecionar.

### INST-103 — Emenda para templo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para templo |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Uma emenda paga a reforma de um grande templo, chamado de centro cultural no papel. A Constituição separa Estado e religião. |
| **Opção A** | Vetar o repasse |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -10 |
| **Consequência A** | "O repasse cai. Pastores acusam o governo de perseguir a fé." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Liberar o repasse |
| **Efeitos B** | `Capital Político` +10, `Integridade` -10, `Caixa` -5 |
| **Consequência B** | "O templo é reformado com verba pública. A bancada religiosa fecha com você." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-012` +1, `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-103 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-103):** Tema "Emenda para templo" (`docs/12_FICHAS_DOS_MODOS.md:334`). Mecanismo: Estado laico (Constituição proíbe subvencionar culto). Não repete a INST-116 planejada (ONG religiosa): aqui é a obra do templo. Sem religião nomeada.

## Relatório do script

```

10 cartas conferidas, 0 erros.

Avisos do baralho (todas as cartas do doc 17):
  Eventos: 5 de 20 opções (25%; meta 15-25%, D-125)
  Eixo Economia ≠ 0: 4 (20%)
  Eixo Diplomacia ≠ 0: 4 (20%)
  Eixo Sociedade ≠ 0: 11 (55%)
  Eixo Estado ≠ 0: 14 (70%)
  Cor black: awareness -10, dignity -45, legitimacy -5, political_capital +30, security +15, sovereignty +5
  Cor blue: dignity +5, integrity +30, legitimacy +5, political_capital -35, security +15, treasury -5
  Cor orange: dignity -10, integrity -5, political_capital +10, security +0, treasury -15
  Cor purple: awareness +15, dignity +25, political_capital -10, security -5, sovereignty -5, treasury -5
  Cor red: awareness +15, dignity +15, integrity +25, political_capital -30, security +0, treasury -15
  Cor yellow: dignity -5, integrity -35, legitimacy -10, political_capital +40, security -10, treasury -10
  Técnica demoralization: 0  ⚠ menos de 2 cartas (D-119)
  Técnica moral_panic: 0  ⚠ menos de 2 cartas (D-119)
  Técnica deepfake: 0  ⚠ menos de 2 cartas (D-119)
  Técnica ai_farm: 0  ⚠ menos de 2 cartas (D-119)
  Técnica doom_cache: 0  ⚠ menos de 2 cartas (D-119)
  Técnica accusatory_didacticism: 0  ⚠ menos de 2 cartas (D-119)
  Carta ligada — dignity: 4 opções com efeito positivo (3 com ano mínimo 2-4)
  Carta ligada — awareness: 4 opções com efeito positivo (2 com ano mínimo 2-4)
  Carta ligada — sovereignty: 1 opções com efeito positivo (1 com ano mínimo 2-4)
  Carta ligada — security: 7 opções com efeito positivo (3 com ano mínimo 2-4)
  Carta ligada — integrity: 7 opções com efeito positivo (3 com ano mínimo 2-4)
  Carta ligada — treasury: 2 opções com efeito positivo (1 com ano mínimo 2-4)
  Carta ligada — political_capital: 9 opções com efeito positivo (5 com ano mínimo 2-4)
  Carta ligada — legitimacy: 1 opções com efeito positivo (1 com ano mínimo 2-4)
  Cartas por modo/tipo: amendments 2, prison_police 8
```

## Propostas ao PO

1. INST-093: troca "Chacina policial" por visita de relator da ONU (evita colidir com a INST-084).
2. INST-098: troca "dignidade menstrual" por mães e gestantes presas sem julgamento (dignidade menstrual fica na pista).
3. INST-094 Quem fala = Ministério da Fazenda (instituição fora do modo; alternativa: Ministério da Justiça).
4. Sem a cor Verde nesta onda (temas sem agro).

## Dúvidas ao PSI (quando houver)

- INST-100: "Jovens negros" no problema, sem dado; INST-098: frase sobre bebês na prisão; INST-093: mortes em operações, sem detalhe.

## Autoconferência

- Temas conferidos em `docs/12_FICHAS_DOS_MODOS.md:296-303` e `:333-344`; formato da INST-081 em `docs/17_ROTEIRO_DAS_CARTAS.md:1705-1730`; Quem fala Ministério da Justiça em `:1712`; pendência JSON como `onda-08/aprendizados.json:13`; checagens com 0 erros e 0 avisos de estilo, `box` sai 0.
