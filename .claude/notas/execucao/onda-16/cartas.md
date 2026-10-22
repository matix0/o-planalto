# Onda 16 do P-015 — modo Impeachment (INST-145 a INST-154) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo D-196** (`.claude/notas/execucao/brief-d196.md`): sem pesquisa na web, Aprendizados "em conferência", sem PSI.
**Status:** CONCLUÍDO (2026-10-22) — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1 (DP-014). Notas do GD abaixo do `---` de cada carta.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-16/cartas.md --no-learning --wave-report --style`

## Progresso

- [x] Brief D-196, kit do GD, DP-011, `gdd/sistemas/03_impeachment.md`, doc 12 MOD-007/MOD-008, doc 17 (títulos e problemas, §17.08-17.09), Ondas 5-13 (títulos e problemas)
- [x] Plano (um mecanismo por carta; cores, eventos, anos, eixos)
- [x] Cartas escritas
- [x] Check do script (0 erros, 0 avisos de estilo) e `box --json` (saída 0)
- [x] Aprendizados (`aprendizados.md`, `aprendizados.json`, pendentes P-016)

## Convenções desta onda

- **Modo Impeachment (DP-011, `gestao/decisoes-provisorias.md:19`):** as INST-141..160 são cartas comuns, sobre pressão e legitimidade **antes** do processo; nunca tratam das fases da cena (pedido aceito, comissão, votação, julgamento, desfecho = IMP-1..5, `docs/17_ROTEIRO_DAS_CARTAS.md:2635`). Ano mínimo 2 em todas, porque pressupõem a ameaça de impeachment, que só existe do Ano 2 (`gdd/sistemas/03_impeachment.md` §3.1). Os títulos da lista antiga do doc 12 (`docs/12_FICHAS_DOS_MODOS.md:428-447`) eram as fases e as respostas da cena; ficam só como ideia (proposta ao PO).
- **Bancadas:** um mecanismo por carta (choque de bancadas, soma de bancadas, lei simbólica, pressão externa, caneta do registro, frente suprapartidária).
- Eixos: Diplomacia − = autonomia nacional, + = instituição ou padrão de fora (kit §4); armas e costumes = Sociedade ±1 (INST-121); Estado + = limitar poder sobre pessoas.
- Nenhum número nem dado no texto ao jogador; nenhuma pessoa real (RC-08, D-190).

---

### INST-145 — Panelaço nas Janelas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Panelaço nas janelas |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | Bairros inteiros batem panelas contra você. Assessores querem um pronunciamento na TV; outros, entrevistas à imprensa. |
| **Opção A** | Falar em rede nacional |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` +5, `Consciência` -5 |
| **Consequência A** | "Você fala em horário nobre. Muita gente desliga a TV e bate panela." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` +1 |
| **Evento A** | "O pronunciamento vira o maior panelaço do ano." · atraso 1 · `Legitimidade` -10 |
| **Opção B** | Responder perguntas |
| **Efeitos B** | `Consciência` +10, `Integridade` +5, `Legitimidade` -5, `Capital Político` -5 |
| **Consequência B** | "Você encara as perguntas duras. A oposição recorta as respostas." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-023` +1, `ACT-011` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-145 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-145):** Mecanismo: opinião pública como pré-condição. Estado +1 em B: aceitar o contraditório da imprensa. Sem custo moral por cor: as duas têm custo.

### INST-146 — Vice Conversa com a Oposição

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vice conversa com a oposição |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Seu vice se reúne com a oposição e promete, se assumir, a pauta de costumes da bancada religiosa. |
| **Opção A** | Romper com o vice |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -15 |
| **Consequência A** | "O vice vira oposição aberta. Parte do partido dele vai junto." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-024` +1, `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Dar a pauta ao vice |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "O vice fica do seu lado, por ora. A pauta dele entra no governo." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-012` +1, `ACT-024` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-146 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-146):** Mecanismo: linha sucessória como incentivo ao impeachment. Quem fala "Congresso Nacional" (instituição do modo, D-164). Sociedade ±1 porque o preço é a pauta de costumes.

### INST-147 — Greve Geral em Defesa

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Greve geral pelo governo |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-015` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Centrais sindicais querem uma greve geral contra a ameaça de impeachment. Empresários dizem que é chantagem com a economia. |
| **Opção A** | Apoiar a greve geral |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5, `Legitimidade` +5, `Caixa` -15 |
| **Consequência A** | "O país para um dia. Empresários acusam o governo de usar os sindicatos." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-015` +1, `ACT-004` -1 |
| **Evento A** | "Empresas cortam o ponto dos grevistas." · atraso 1 · `Dignidade` -5, `Capital Político` -5 |
| **Opção B** | Pedir calma às centrais |
| **Efeitos B** | `Caixa` +5, `Capital Político` +5, `Consciência` -10 |
| **Consequência B** | "A greve é adiada. Sindicalistas dizem que você teme o próprio povo." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-015` -1, `ACT-004` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-147 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-147):** Mecanismo: mobilização organizada como escudo. Evento A: custo para o trabalhador grevista.

### INST-148 — Show pela Democracia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Show pela democracia |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Artistas fazem um show pela democracia e convidam você para subir ao palco. Coaches dizem que é campanha com verba pública. |
| **Opção A** | Subir ao palco |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Integridade` -5, `Capital Político` -5 |
| **Consequência A** | "A plateia canta seu nome. Vídeos de coaches chamam o show de comício." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-019` +1, `ACT-022` -1 |
| **Evento A** | — |
| **Opção B** | Ficar fora do palco |
| **Efeitos B** | `Integridade` +5, `Capital Político` +5, `Consciência` -10 |
| **Consequência B** | "O show acontece sem você. Artistas reclamam de falta de coragem." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-019` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-148 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-148):** Mecanismo: cultura como disputa de legitimidade. Sociedade +1 em A (show com pauta de diversidade). Não cita lei de incentivo no texto para não confirmar o boato (a pista confere). Dúvida ao PSI.

### INST-149 — Anúncios pelo Impeachment

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Anúncios pelo impeachment |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-020` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Anúncios pagos pedem seu impeachment nas redes. A plataforma estrangeira não diz quem paga e chama isso de liberdade. |
| **Opção A** | Exigir quem pagou |
| **Efeitos A** | `Integridade` +10, `Soberania` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "A plataforma mostra os pagadores. A oposição fala em censura." |
| **Eixo A** | [0, -1, 0, -1] |
| **Atores A** | `ACT-020` -1, `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Deixar a rede livre |
| **Efeitos B** | `Capital Político` +5, `Integridade` -5, `Soberania` -5 |
| **Consequência B** | "Os anúncios seguem sem dono. Você evita a briga com a plataforma." |
| **Eixo B** | [0, +1, 0, +1] |
| **Atores B** | `ACT-020` +1 |
| **Evento B** | "Anúncios pagos de fora inundam as redes contra você." · atraso 1 · `Legitimidade` -10, `Consciência` -5 |
| **Aprendizado** | APR-149 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-149):** Mecanismo: dinheiro oculto na pressão digital. Não repete as INST-186 e 189 (robôs) nem a 196 (denúncias em massa): aqui é anúncio pago. Diplomacia: −1 ao enquadrar empresa de fora; Estado −1 (Estado exige dado), como a convenção das ondas do Influenciador.

### INST-150 — Primeiro-Ministro Informal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ministro tutor |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Vermelho |
| **Problema** | Líderes da Câmara prometem esfriar o impeachment se um nome deles comandar a Casa Civil e a pauta. |
| **Opção A** | Aceitar o tutor |
| **Efeitos A** | `Capital Político` +15, `Legitimidade` -10, `Consciência` -5 |
| **Consequência A** | "O impeachment esfria. Quem decide o governo é o ministro da Câmara." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-011` +1, `ACT-015` -1 |
| **Evento A** | — |
| **Opção B** | Governar sem tutela |
| **Efeitos B** | `Legitimidade` +5, `Integridade` +5, `Capital Político` -15 |
| **Consequência B** | "Você mantém a caneta. Os líderes avisam que a paciência acabou." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-011` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-150 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-150):** Mecanismo: governo tutelado como preço da sobrevivência. Não repete a 141 (um ministério qualquer): aqui o Congresso assume a coordenação. Estado −1 em A: o poder sai do eleito sem voto.

### INST-151 — Denúncia no Exterior

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Denúncia lá fora |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Você discursa num fórum internacional. Diplomatas sugerem denunciar a ameaça de golpe; outros pedem que você fale de economia. |
| **Opção A** | Denunciar o golpe |
| **Efeitos A** | `Legitimidade` +5, `Consciência` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "Jornais de fora repercutem. No Congresso, dizem que você expõe o país." |
| **Eixo A** | [0, +1, 0, +1] |
| **Atores A** | `ACT-010` -1, `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Falar de economia |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Consciência` -5, `Legitimidade` -5 |
| **Consequência B** | "Investidores gostam do tom. Apoiadores acham que você se calou." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-010` +1, `ACT-002` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-151 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-151):** Mecanismo: internacionalizar a crise. Diplomacia +1 (apelo a instituição internacional). Não repete a INST-080 (golpe no vizinho). Quem fala `ACT-010`, fora da lista do modo.

### INST-152 — Acampamento no Congresso

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Acampamento em Brasília |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Movimentos querem acampar diante do Congresso até o fim da ameaça de impeachment. A segurança do Planalto teme confronto. |
| **Opção A** | Apoiar o acampamento |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Segurança` -10 |
| **Consequência A** | "Barracas tomam a Esplanada. Deputados dizem que estão sob pressão." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-016` +1, `ACT-017` +1, `ACT-011` -1 |
| **Evento A** | "Um empurra-empurra com a polícia vira manchete." · atraso 1 · `Legitimidade` -10, `Segurança` -5 |
| **Opção B** | Pedir que dispersem |
| **Efeitos B** | `Segurança` +10, `Capital Político` +5, `Consciência` -10 |
| **Consequência B** | "A Esplanada fica vazia. Os movimentos dizem que você os abandonou." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-016` -1, `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-152 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-152):** Mecanismo: pressão popular direta, diferente da greve (147). Segurança+ em B com Ano 2. Evento sem violência gráfica. Estado: apoiar protesto +1; pedir dispersão −1.

### INST-153 — Bondade na Pesquisa

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Bondade antes da pesquisa |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | Sua aprovação cai. O marqueteiro sugere zerar a conta de luz dos mais pobres; técnicos dizem que não há dinheiro. |
| **Opção A** | Zerar a conta de luz |
| **Efeitos A** | `Legitimidade` +10, `Dignidade` +5, `Caixa` -15 |
| **Consequência A** | "A aprovação sobe. Técnicos alertam que a conta não fecha no ano." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-007` -1, `ACT-016` +1 |
| **Evento A** | "O rombo vira argumento da oposição no Congresso." · atraso 2 · `Integridade` -5, `Capital Político` -10 |
| **Opção B** | Manter as contas |
| **Efeitos B** | `Caixa` +10, `Integridade` +5, `Legitimidade` -10 |
| **Consequência B** | "As contas fecham. A pesquisa seguinte traz você ainda mais baixo." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-007` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-153 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-153):** Mecanismo: populismo de emergência. Liga-se à 142 (conta vira argumento), mas aqui é despesa nova, não manobra de caixa. Dignidade+ em A com Ano 2.

### INST-154 — Delação sem Prova

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Delação sem prova |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Preto |
| **Problema** | Um ex-ministro preso cita você numa delação, sem prova. A oposição quer usar o depoimento para pedir seu impeachment. |
| **Opção A** | Abrir suas contas |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "Suas contas ficam públicas. A oposição procura falhas linha por linha." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-023` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Atacar o delator |
| **Efeitos B** | `Capital Político` +5, `Legitimidade` +5, `Integridade` -10, `Consciência` -5 |
| **Consequência B** | "Sua base repete o ataque. Jornalistas dizem que você foge do assunto." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-011` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-154 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-154):** Mecanismo: acusação sem prova como munição política ("sem prova" para acusação a pessoa, regra do PSI). Estado: atacar o delator = −1 (pressão sobre investigação).

## Relatório da onda (script, 2026-10-22)

`check ... --no-learning --wave-report --style` → 10 cartas, 0 erros, 0 avisos de estilo (saída 0). `box --json onda-16/aprendizados.json` → saída 0.

| Meta | Resultado |
| :--- | :--- |
| Eventos 4-5 de 20 | 5 (25%): 145 A, 147 A, 149 B, 152 A, 153 A |
| Diplomacia ≠ 0 em ≥ 3 | 3 (149 A/B, 151 A) |
| Sociedade ≠ 0 em ≥ 3 | 3 (146 A/B, 148 A) |
| Dignidade+ com Ano 2-4 (≥ 2) | 2 (147 A, 153 A) · Segurança+ com Ano 2-4: 1 (152 B) |
| Cores | 6 cores (sem Verde: nenhum tema do modo pede o agro); todas com saldo negativo |

## Propostas ao PO (provisórias)

1. Comuns do Impeachment como "pressão antes do processo" (DP-011): opinião pública (145), linha sucessória (146), greve (147), cultura (148), dinheiro digital oculto (149), governo tutelado (150), apoio externo (151), protesto (152), populismo de emergência (153), delação (154). Ideias da lista antiga aproveitadas sem as fases: "Pedir apoio internacional" (151), "Mobilizar manifestações" (152).
2. Estado ≠ 0 em 50% das opções: o modo trata de poder; o PO pode aceitar ou pedir 0 em 145 B e 152.

## Dúvidas para o PSI (quando houver revisão)

- INST-148 alude ao boato sobre lei de incentivo (sem citá-la); INST-152 evento de empurra-empurra; INST-154 "sem prova" (acusação a pessoa fictícia).

## Autoconferência

- DP-011 `gestao/decisoes-provisorias.md:19`; cena IMP-1 `docs/17_ROTEIRO_DAS_CARTAS.md:2637`; regras da cena `gdd/sistemas/03_impeachment.md` §3.2; atores do modo `docs/12_FICHAS_DOS_MODOS.md:420`; INST-080 golpe no vizinho `docs/17_ROTEIRO_DAS_CARTAS.md:2214` — conferidos.

