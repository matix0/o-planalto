# Onda 32 do P-015 — Cartas de ator ATOR-052 a ATOR-061 — rascunho do GD

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

### ATOR-052 — Movimentos sociais ambientais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Campanha de boicote lá fora |
| **Tipo** | Ator |
| **Modo** | Geopolítico |
| **Função** | `ACT-018` · Ataque |
| **Quem fala** | `ACT-018` |
| **Ano mínimo** | 1 |
| **Problema** | Furiosos, os Movimentos ambientais pedem a compradores estrangeiros que boicotem a carne de áreas desmatadas do Brasil. |
| **Opção A** | Rastrear o gado |
| **Cor A** | Verde |
| **Efeitos A** | `Soberania` +5, `Consciência` +5, `Capital Político` -15 |
| **Consequência A** | "Cada boi ganha origem conhecida. Os pecuaristas reclamam do custo." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-018` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Acusar os ativistas |
| **Cor B** | Preto |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Legitimidade` -5 |
| **Consequência B** | "O governo fala em traição da pátria. As compras lá fora caem." |
| **Eixo B** | [0, -1, -1, -1] |
| **Atores B** | `ACT-018` -1, `ACT-001` +1 |
| **Evento B** | "Países europeus suspendem compras de carne" · atraso 2 · `Caixa` -15, `Soberania` -5 |
| **Aprendizado** | APR-ATOR-052 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-052):** Mecanismo: rastreio do gado contra a lavagem do boi. Diferente do pacto da soja (THEM-016).

### ATOR-053 — Movimentos sociais ambientais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Árvores nos bairros quentes |
| **Tipo** | Ator |
| **Modo** | Currículo e Mídia |
| **Função** | `ACT-018` · Oferta |
| **Quem fala** | `ACT-018` |
| **Ano mínimo** | 2 |
| **Problema** | Aliados, os Movimentos ambientais oferecem formar jovens das periferias para plantar árvores em bairros sem sombra. |
| **Opção A** | Apoiar o plantio |
| **Cor A** | Verde |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5 |
| **Consequência A** | "Bairros quentes ganham sombra. Jovens ganham ofício." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-018` +1 |
| **Evento A** | — |
| **Opção B** | Deixar com a prefeitura |
| **Cor B** | Laranja |
| **Efeitos B** | `Caixa` +5, `Consciência` -10 |
| **Consequência B** | "A prefeitura planta quando pode. O asfalto segue quente como brasa." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-018` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-053 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-053):** Boa Vontade na A. Carta ligada (Ano 2, Dignidade+).

### ATOR-054 — Artista Engajado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Streaming paga pouco |
| **Tipo** | Ator |
| **Modo** | Congresso |
| **Função** | `ACT-019` · Exigência |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 1 |
| **Problema** | O Artista Engajado exige uma lei para as plataformas de música pagarem mais a quem compõe. Elas ameaçam sair do país. |
| **Opção A** | Apoiar a lei |
| **Cor A** | Vermelho |
| **Efeitos A** | `Legitimidade` +10, `Dignidade` +5, `Capital Político` -10 |
| **Consequência A** | "Compositores comemoram. As plataformas cortam os planos baratos." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-019` +1, `ACT-020` -1 |
| **Evento A** | — |
| **Opção B** | Esperar acordo privado |
| **Cor B** | Azul |
| **Efeitos B** | `Capital Político` +5, `Legitimidade` -10 |
| **Consequência B** | "As plataformas negociam com as grandes gravadoras. Quem é pequeno segue fora." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-019` -1, `ACT-020` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-054 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-054):** Mecanismo: remuneração do streaming. Não repete edital (INST-028) nem repasse fixo (INST-134).

### ATOR-055 — Artista Engajado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Música contra o governo |
| **Tipo** | Ator |
| **Modo** | Currículo e Mídia |
| **Função** | `ACT-019` · Ataque |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 1 |
| **Problema** | Furioso, o Artista Engajado lança uma música que chama o governo de traidor. Ela vira hino nas escolas. |
| **Opção A** | Chamar para conversar |
| **Cor A** | Roxo |
| **Efeitos A** | `Capital Político` -10, `Legitimidade` +5 |
| **Consequência A** | "O artista aceita o convite. Mas canta a música na porta do palácio." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Cortar o patrocínio |
| **Cor B** | Preto |
| **Efeitos B** | `Caixa` +5, `Legitimidade` -10, `Consciência` -5 |
| **Consequência B** | "A estatal tira o apoio ao festival. A música toca ainda mais." |
| **Eixo B** | [0, 0, -1, -2] |
| **Atores B** | `ACT-019` -1 |
| **Evento B** | "Artistas fazem ato contra a censura" · atraso 1 · `Legitimidade` -10, `Segurança` -5 |
| **Aprendizado** | APR-ATOR-055 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-055):** Mecanismo: retaliação por verba (censura indireta). Não repete a censura ao documentário (INST-051).

### ATOR-056 — Artista Engajado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Festival nas periferias |
| **Tipo** | Ator |
| **Modo** | Emendas |
| **Função** | `ACT-019` · Oferta |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 2 |
| **Problema** | Aliado, o Artista Engajado oferece um festival gratuito nas periferias, com artistas locais. Pede só o palco e a segurança. |
| **Opção A** | Montar o palco |
| **Cor A** | Azul |
| **Efeitos A** | `Legitimidade` +10, `Dignidade` +5 |
| **Consequência A** | "A periferia lota a praça. Talentos locais sobem ao palco pela primeira vez." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Recusar o festival |
| **Cor B** | Amarelo |
| **Efeitos B** | `Caixa` +5, `Legitimidade` -10 |
| **Consequência B** | "O dinheiro fica no caixa. A praça segue vazia no fim de semana." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-019` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-056 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-056):** Boa Vontade na A. Carta ligada (Ano 2, Dignidade+). Não repete cachê (INST-114) nem teto de shows (INST-117).

### ATOR-057 — Meta (Big Tech)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Imunidade das plataformas |
| **Tipo** | Ator |
| **Modo** | Judiciário |
| **Função** | `ACT-020` · Exigência |
| **Quem fala** | `ACT-020` |
| **Ano mínimo** | 1 |
| **Problema** | A Meta exige que o governo defenda no Supremo que as plataformas só respondam por posts ilegais após ordem judicial. |
| **Opção A** | Defender a imunidade |
| **Cor A** | Azul |
| **Efeitos A** | `Capital Político` +5, `Legitimidade` +5, `Consciência` -15 |
| **Consequência A** | "A Meta segue sem dever de agir. Golpes e ódio esperam o juiz." |
| **Eixo A** | [+1, +1, 0, +1] |
| **Atores A** | `ACT-020` +1 |
| **Evento A** | — |
| **Opção B** | Cobrar dever de cuidado |
| **Cor B** | Vermelho |
| **Efeitos B** | `Consciência` +10, `Legitimidade` -5, `Capital Político` -10 |
| **Consequência B** | "As plataformas passam a remover mais. Elas falam em censura." |
| **Eixo B** | [-1, -1, 0, -1] |
| **Atores B** | `ACT-020` -1, `ACT-023` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-057 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-057):** Mecanismo: responsabilidade civil das plataformas. Não repete taxação (INST-071) nem lei da IA (INST-019).

### ATOR-058 — Meta (Big Tech)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Notícias somem do feed |
| **Tipo** | Ator |
| **Modo** | Currículo e Mídia |
| **Função** | `ACT-020` · Ataque |
| **Quem fala** | `ACT-020` |
| **Ano mínimo** | 1 |
| **Problema** | Furiosa com o governo, a Meta bloqueia links de notícias para usuários brasileiros. Boatos ocupam o espaço. |
| **Opção A** | Ceder à Meta |
| **Cor A** | Laranja |
| **Efeitos A** | `Capital Político` +5, `Consciência` -10, `Soberania` -10 |
| **Consequência A** | "As notícias voltam ao feed. A Meta aprende que ameaçar funciona." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-020` +1 |
| **Evento A** | "Outras plataformas copiam a chantagem" · atraso 2 · `Soberania` -10, `Consciência` -5 |
| **Opção B** | Apoiar o jornalismo local |
| **Cor B** | Verde |
| **Efeitos B** | `Consciência` +10, `Caixa` -15 |
| **Consequência B** | "Jornais pequenos ganham fôlego. O feed segue sem notícia por meses." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-020` -1, `ACT-023` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-058 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-058):** Mecanismo: bloqueio de notícias como retaliação. Diferente do perfil derrubado (INST-054).

### ATOR-059 — Meta (Big Tech)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Parceria contra golpes |
| **Tipo** | Ator |
| **Modo** | Prisional e Policial |
| **Função** | `ACT-020` · Oferta |
| **Quem fala** | `ACT-020` |
| **Ano mínimo** | 2 |
| **Problema** | Aliada, a Meta oferece à polícia uma ferramenta para rastrear golpes no seu aplicativo de mensagens. Pede acesso a dados do governo. |
| **Opção A** | Aceitar a ferramenta |
| **Cor A** | Amarelo |
| **Efeitos A** | `Segurança` +15, `Legitimidade` +5 |
| **Consequência A** | "Golpistas caem em série. A Meta passa a ver dados do Estado." |
| **Eixo A** | [0, +1, 0, -1] |
| **Atores A** | `ACT-020` +1 |
| **Evento A** | "Dados de cidadãos aparecem em servidor estrangeiro" · atraso 2 · `Soberania` -15, `Integridade` -5 |
| **Opção B** | Criar ferramenta própria |
| **Cor B** | Roxo |
| **Efeitos B** | `Caixa` -15, `Soberania` +5 |
| **Consequência B** | "A polícia desenvolve a sua. Fica pronta depois de muitos golpes." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-020` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-059 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-059):** Boa Vontade na A com custo adiado no evento. Carta ligada (Ano 2, Segurança+).

### ATOR-060 — Impérios Geopolíticos (China e EUA)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Voto na ONU |
| **Tipo** | Ator |
| **Modo** | Geopolítico |
| **Função** | `ACT-021` · Exigência |
| **Quem fala** | `ACT-021` |
| **Ano mínimo** | 1 |
| **Problema** | Uma potência pede que o Brasil vote com ela na ONU para condenar um país rival. Em troca, promete investimentos. |
| **Opção A** | Votar com a potência |
| **Cor A** | Azul |
| **Efeitos A** | `Caixa` +15, `Soberania` -15 |
| **Consequência A** | "Os investimentos chegam. O rival corta compras de produtos brasileiros." |
| **Eixo A** | [0, +2, 0, 0] |
| **Atores A** | `ACT-021` +1, `ACT-010` -1 |
| **Evento A** | — |
| **Opção B** | Abster-se |
| **Cor B** | Vermelho |
| **Efeitos B** | `Soberania` +10, `Caixa` -10 |
| **Consequência B** | "O Itamaraty mantém a tradição de não alinhar. A potência esfria o acordo." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-021` -1, `ACT-010` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-060 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-060):** Mecanismo: voto como moeda diplomática. Evita terras, base e vacinas (INST-073, 074, 076, 077).

### ATOR-061 — Impérios Geopolíticos (China e EUA)

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Embargo à carne brasileira |
| **Tipo** | Ator |
| **Modo** | Geopolítico |
| **Função** | `ACT-021` · Ataque |
| **Quem fala** | `ACT-021` |
| **Ano mínimo** | 1 |
| **Problema** | Furiosa, uma potência suspende a compra de carne brasileira por suposto risco sanitário. O motivo real é o voto do Brasil. |
| **Opção A** | Ceder em outra pauta |
| **Cor A** | Laranja |
| **Efeitos A** | `Caixa` +10, `Soberania` -15 |
| **Consequência A** | "O embargo cai em semanas. A potência aprende o caminho da pressão." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-021` +1 |
| **Evento A** | — |
| **Opção B** | Buscar novos mercados |
| **Cor B** | Verde |
| **Efeitos B** | `Soberania` +10, `Caixa` -15 |
| **Consequência B** | "O Itamaraty abre outros portos. Até lá, frigoríficos demitem." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-021` -1, `ACT-010` +1 |
| **Evento B** | "Frigoríficos fecham no interior" · atraso 1 · `Dignidade` -10, `Caixa` -5 |
| **Aprendizado** | APR-ATOR-061 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-061):** Mecanismo: barreira sanitária como pressão política; dependência de um comprador.


## Relatório do script

`cards_doc.py check --no-learning --wave-report --style`: 0 erros, 0 avisos de estilo; `box --json` sai 0. Avisos de Técnica (D-119) são do baralho, não desta onda.

## Propostas ao PO

- ATOR-040 usa `ACT-021` como dono da patente (não há ator da indústria farmacêutica).
- Dados e fatos só nas pistas (`aprendizados.md`), para o P-016.
