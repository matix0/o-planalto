# Onda 31 do P-015 — Cartas de ator ATOR-042 a ATOR-051 — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO — modo D-196 (`.claude/notas/execucao/brief-d196.md`): sem web, sem PSI; toda carta `pendente de revisão (D-196)`; Aprendizados em conferência (P-016).
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1; ATOR-001 (§17.13) como modelo; numeração DP-015 (`jogo/tools/cards_doc.py:63-75`, ROLES e NO_OFFER em `:48-49`).

## Progresso

- [x] Leitura (brief, kit, D-104 a D-108, DP-015, GDD 07, doc 11, ATOR-001, títulos do doc 17 e das ondas)
- [x] Plano · [x] Cartas · [x] Aprendizados (md e json) · [x] Checagens

## Convenções desta onda

- Quem fala é o próprio ator; o ator dono aparece nas duas opções (D-106). Oferta usa a Boa Vontade (D-108) só na opção A, com custo adiado por evento quando cabe.
- Modo da carta escolhido entre as arenas do ator (DP-015, modo a); sem Influenciador nem Impeachment.
- Temas evitados: os títulos já escritos no doc 17 e nas ondas 1-22 (lista conferida por `grep '^### '`). Diplomacia conforme o kit §4; `ACT-021` +1 quando o jogador cede.
- Nenhum número, dado ou pessoa real no texto ao jogador; fatos só na pista de dado.

---

### ATOR-042 — Líder Sindical

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Direitos para entregadores |
| **Tipo** | Ator |
| **Modo** | Congresso |
| **Função** | `ACT-015` · Exigência |
| **Quem fala** | `ACT-015` |
| **Ano mínimo** | 1 |
| **Problema** | O Líder Sindical exige que entregadores de aplicativo tenham previdência e seguro contra acidente, pagos pelas plataformas. |
| **Opção A** | Apoiar o projeto |
| **Cor A** | Vermelho |
| **Efeitos A** | `Dignidade` +10, `Capital Político` -10 |
| **Consequência A** | "Os entregadores ganham proteção. As plataformas ameaçam subir a taxa." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-015` +1, `ACT-020` -1 |
| **Evento A** | — |
| **Opção B** | Deixar como está |
| **Cor B** | Laranja |
| **Efeitos B** | `Capital Político` +5, `Dignidade` -10 |
| **Consequência B** | "As plataformas agradecem. Quem cai da moto segue por conta própria." |
| **Eixo B** | [+1, 0, 0, +1] |
| **Atores B** | `ACT-015` -1, `ACT-020` +1 |
| **Evento B** | "Entregadores param as entregas na cidade" · atraso 1 · `Legitimidade` -10, `Caixa` -5 |
| **Aprendizado** | APR-ATOR-042 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-042):** Mecanismo: trabalho por plataforma sem vínculo. Não repete a escala 6x1 (INST-138).

### ATOR-043 — Líder Sindical

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ocupação da fábrica |
| **Tipo** | Ator |
| **Modo** | Judiciário |
| **Função** | `ACT-015` · Ataque |
| **Quem fala** | `ACT-015` |
| **Ano mínimo** | 1 |
| **Problema** | Furioso, o Líder Sindical ocupa uma fábrica que a multinacional quer fechar. Os donos pedem a polícia. |
| **Opção A** | Mandar a polícia |
| **Cor A** | Preto |
| **Efeitos A** | `Segurança` +5, `Legitimidade` -10, `Dignidade` -10 |
| **Consequência A** | "A fábrica é desocupada à força. As máquinas seguem para outro país." |
| **Eixo A** | [+1, +1, 0, -2] |
| **Atores A** | `ACT-015` -1, `ACT-004` +1 |
| **Evento A** | "Outra fábrica fecha na mesma cidade" · atraso 2 · `Dignidade` -10, `Caixa` -5 |
| **Opção B** | Mediar uma saída |
| **Cor B** | Verde |
| **Efeitos B** | `Dignidade` +5, `Capital Político` -10, `Caixa` -10 |
| **Consequência B** | "O governo media. Os trabalhadores ganham tempo para propor uma cooperativa." |
| **Eixo B** | [-1, -1, 0, +1] |
| **Atores B** | `ACT-015` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-043 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-043):** Mecanismo: fábrica recuperada. Diplomacia: ceder à multinacional (+1) × segurar a produção no país (−1).

### ATOR-044 — Líder Sindical

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Trégua salarial |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-015` · Oferta |
| **Quem fala** | `ACT-015` |
| **Ano mínimo** | 2 |
| **Problema** | Aliado, o Líder Sindical propõe uma trégua: as categorias seguram greves e o governo cria uma mesa permanente de negociação. |
| **Opção A** | Criar a mesa |
| **Cor A** | Vermelho |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` +5 |
| **Consequência A** | "As greves esfriam. Toda decisão de salário passa pela mesa." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-015` +1 |
| **Evento A** | — |
| **Opção B** | Negociar caso a caso |
| **Cor B** | Azul |
| **Efeitos B** | `Caixa` +5, `Legitimidade` -10 |
| **Consequência B** | "O governo mantém as mãos livres. Cada categoria briga sozinha." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-044 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-044):** Boa Vontade na A. Carta ligada (Ano 2, Legitimidade+).

### ATOR-045 — Movimentos por Moradia (MTST)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Prédios vazios no centro |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-016` · Exigência |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 1 |
| **Problema** | Os Movimentos por Moradia exigem que prédios públicos vazios no centro virem moradia. As construtoras querem leilão. |
| **Opção A** | Transformar em moradia |
| **Cor A** | Vermelho |
| **Efeitos A** | `Dignidade` +15, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "Famílias moram perto do trabalho. As construtoras perdem o terreno nobre." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-016` +1, `ACT-003` -1 |
| **Evento A** | — |
| **Opção B** | Leiloar os prédios |
| **Cor B** | Amarelo |
| **Efeitos B** | `Caixa` +15, `Dignidade` -10 |
| **Consequência B** | "O leilão enche o caixa. Os prédios viram escritórios de luxo." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-016` -1, `ACT-003` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-045 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-045):** Mecanismo: função social do imóvel público ocioso. Não repete ocupação × despejo (THEM-001, INST-164).

### ATOR-046 — Movimentos por Moradia (MTST)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Movimento rompe com o governo |
| **Tipo** | Ator |
| **Modo** | Bancadas |
| **Função** | `ACT-016` · Ataque |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 1 |
| **Problema** | Furiosos, os Movimentos por Moradia anunciam rompimento. Dizem que o governo prometeu casas e entregou maquete. |
| **Opção A** | Lançar programa de casas |
| **Cor A** | Roxo |
| **Efeitos A** | `Dignidade` +10, `Caixa` -20 |
| **Consequência A** | "As obras começam às pressas. O rompimento vira trégua." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-016` +1 |
| **Evento A** | — |
| **Opção B** | Deixar romper |
| **Cor B** | Azul |
| **Efeitos B** | `Caixa` +5, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência B** | "O governo segura o caixa. Perde a rua que o defendia." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-016` -1 |
| **Evento B** | "Ocupações se multiplicam sem diálogo" · atraso 2 · `Segurança` -10, `Capital Político` -5 |
| **Aprendizado** | APR-ATOR-046 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-046):** Mecanismo: apoio de movimento condicionado à entrega. Não repete o acampamento em Brasília (INST-152).

### ATOR-047 — Movimentos por Moradia (MTST)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Casas em mutirão |
| **Tipo** | Ator |
| **Modo** | Emendas |
| **Função** | `ACT-016` · Oferta |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 2 |
| **Problema** | Aliados, os Movimentos por Moradia querem erguer casas com as próprias famílias. Pedem ao governo só terreno e material. |
| **Opção A** | Dar terreno e material |
| **Cor A** | Verde |
| **Efeitos A** | `Dignidade` +15, `Legitimidade` +5 |
| **Consequência A** | "As famílias levantam as paredes. A casa sai com a cara de quem mora." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-016` +1 |
| **Evento A** | — |
| **Opção B** | Licitar a obra |
| **Cor B** | Laranja |
| **Efeitos B** | `Caixa` -15, `Dignidade` +5 |
| **Consequência B** | "A construtora ganha a licitação. A obra demora, mas sai no padrão." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-016` -1, `ACT-003` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-047 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-047):** Boa Vontade na A. Carta ligada (Ano 2, Dignidade+).

### ATOR-048 — Movimentos sociais do campo (MST)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Compra da safra assentada |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-017` · Exigência |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 1 |
| **Problema** | Os Movimentos do campo exigem que o governo compre a produção dos assentamentos para hospitais, presídios e quartéis. |
| **Opção A** | Comprar a safra |
| **Cor A** | Verde |
| **Efeitos A** | `Dignidade` +10, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "Os assentamentos vendem garantido. O agronegócio reclama de favoritismo." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-017` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Manter a licitação |
| **Cor B** | Azul |
| **Efeitos B** | `Caixa` +5, `Dignidade` -10 |
| **Consequência B** | "Ganha quem dá o menor preço. A colheita do assentamento apodrece." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-017` -1 |
| **Evento B** | "Famílias deixam o assentamento rumo à cidade" · atraso 2 · `Dignidade` -10, `Soberania` -5 |
| **Aprendizado** | APR-ATOR-048 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-048):** Mecanismo: compra institucional da agricultura familiar. Não repete juros do Plano Safra (INST-025) nem merenda (THEM-021).

### ATOR-049 — Movimentos sociais do campo (MST)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Jornada de ocupações |
| **Tipo** | Ator |
| **Modo** | Prisional e Policial |
| **Função** | `ACT-017` · Ataque |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 2 |
| **Problema** | Furiosos, os Movimentos do campo ocupam fazendas improdutivas em vários estados. Ruralistas pedem a Força Nacional. |
| **Opção A** | Enviar a Força Nacional |
| **Cor A** | Preto |
| **Efeitos A** | `Segurança` +10, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência A** | "As fazendas são esvaziadas. Os sem-terra voltam à beira da estrada." |
| **Eixo A** | [0, 0, -1, -1] |
| **Atores A** | `ACT-017` -1, `ACT-001` +1 |
| **Evento A** | — |
| **Opção B** | Vistoriar as fazendas |
| **Cor B** | Vermelho |
| **Efeitos B** | `Dignidade` +5, `Capital Político` -15 |
| **Consequência B** | "O Incra vistoria. Os ruralistas acusam o governo de premiar invasão." |
| **Eixo B** | [-1, 0, +1, +1] |
| **Atores B** | `ACT-017` +1, `ACT-001` -1 |
| **Evento B** | "A bancada ruralista trava uma votação" · atraso 1 · `Capital Político` -10 |
| **Aprendizado** | APR-ATOR-049 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-049):** Mecanismo: ocupação como pressão pela vistoria. Ano 2 (Segurança+ na A). Não repete a lei da INST-015.

### ATOR-050 — Movimentos sociais do campo (MST)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Doação para a enchente |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-017` · Oferta |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 2 |
| **Problema** | Aliados, os Movimentos do campo oferecem doar alimentos dos assentamentos para cidades atingidas por enchente. |
| **Opção A** | Aceitar a doação |
| **Cor A** | Verde |
| **Efeitos A** | `Dignidade` +10, `Legitimidade` +10 |
| **Consequência A** | "Caminhões de comida chegam às cidades alagadas. O movimento ganha simpatia." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-017` +1 |
| **Evento A** | — |
| **Opção B** | Comprar no atacado |
| **Cor B** | Amarelo |
| **Efeitos B** | `Caixa` -15, `Dignidade` +5 |
| **Consequência B** | "O governo compra e distribui sozinho. Sai mais caro e demora mais." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-017` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-050 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-050):** Boa Vontade na A. Carta ligada (Ano 2, Dignidade+).

### ATOR-051 — Movimentos sociais ambientais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fiscais contra o desmate |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-018` · Exigência |
| **Quem fala** | `ACT-018` |
| **Ano mínimo** | 1 |
| **Problema** | Os Movimentos ambientais exigem mais fiscais na floresta. Hoje, quem desmata sabe que ninguém vem. |
| **Opção A** | Contratar fiscais |
| **Cor A** | Verde |
| **Efeitos A** | `Soberania` +10, `Consciência` +5, `Caixa` -15 |
| **Consequência A** | "Os fiscais voltam à floresta. O desmate recua, e a conta sobe." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-018` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Comprar satélite de fora |
| **Cor B** | Azul |
| **Efeitos B** | `Caixa` -5, `Soberania` -10 |
| **Consequência B** | "O satélite vê tudo. Sem fiscal, ninguém chega a tempo." |
| **Eixo B** | [0, +1, 0, 0] |
| **Atores B** | `ACT-018` -1, `ACT-021` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-051 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-051):** Mecanismo: ver × agir na fiscalização. Não repete o fundo da floresta (THEM-012) nem o fogo (THEM-015).


## Relatório do script

`cards_doc.py check --no-learning --wave-report --style`: 0 erros, 0 avisos de estilo; `box --json` sai 0. Avisos de Técnica (D-119) são do baralho, não desta onda.

## Propostas ao PO

- ATOR-040 usa `ACT-021` como dono da patente (não há ator da indústria farmacêutica).
- Dados e fatos só nas pistas (`aprendizados.md`), para o P-016.
