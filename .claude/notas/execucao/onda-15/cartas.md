# Onda 15 do P-015 — Bancadas (INST-135 a INST-140) e Impeachment (INST-141 a INST-144) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo D-196** (`.claude/notas/execucao/brief-d196.md`): sem pesquisa na web, Aprendizados "em conferência", sem PSI.
**Status:** CONCLUÍDO (2026-10-22) — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1 (DP-014). Notas do GD abaixo do `---` de cada carta.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-15/cartas.md --no-learning --wave-report --style`

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

### INST-135 — Legalização de Cassinos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cassino no resort |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Laranja |
| **Problema** | O Senado aprova cassinos em resorts de grupos estrangeiros. O Centrão quer a sanção; pastores e médicos alertam para o vício. |
| **Opção A** | Vetar os cassinos |
| **Efeitos A** | `Integridade` +10, `Dignidade` +5, `Capital Político` -15, `Caixa` -5 |
| **Consequência A** | "Os pastores aplaudem. O Centrão segura seus projetos na Câmara." |
| **Eixo A** | [0, -1, -1, -1] |
| **Atores A** | `ACT-012` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Sancionar a lei |
| **Efeitos B** | `Caixa` +15, `Capital Político` +10, `Integridade` -10, `Dignidade` -5 |
| **Consequência B** | "Os resorts abrem salões de jogo. Igrejas fazem vigílias contra o vício." |
| **Eixo B** | [+1, +1, +1, +1] |
| **Atores B** | `ACT-011` +1, `ACT-012` -1, `ACT-002` +1 |
| **Evento B** | "Um cassino novo vira lavanderia de dinheiro do crime." · atraso 2 · `Integridade` -10, `Segurança` -10 |
| **Aprendizado** | APR-135 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-135):** Tema do banco "Legalização de cassinos — Jogos" (`docs/12_FICHAS_DOS_MODOS.md:385`). Mecanismo: choque entre bancadas (turismo/Centrão × religiosa), não a publicidade das apostas on-line (INST-181, 193, 194 já tratam de bets). Grupos estrangeiros dão a Diplomacia ±1. Proibir = Soc −1 e Est −1 (moral pública imposta por lei); liberar o inverso. Evento B: lavagem, risco que a pista precisa sustentar.

### INST-136 — Armamento da População

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Porte em toda a fazenda |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Roxo |
| **Problema** | As bancadas da bala e do boi querem porte de arma em toda a área da fazenda. Movimentos do campo temem mais mortes em conflitos. |
| **Opção A** | Apoiar o porte rural |
| **Efeitos A** | `Segurança` +10, `Capital Político` +10, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência A** | "Fazendeiros comemoram. Posseiros e sem-terra temem os vizinhos armados." |
| **Eixo A** | [0, 0, -1, 0] |
| **Atores A** | `ACT-001` +1, `ACT-011` +1, `ACT-017` -1 |
| **Evento A** | "Um conflito por terra termina com mortos no campo." · atraso 1 · `Dignidade` -10, `Segurança` -10 |
| **Opção B** | Barrar o porte rural |
| **Efeitos B** | `Dignidade` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência B** | "O porte fica restrito à sede. A bancada do boi trava a sua pauta." |
| **Eixo B** | [0, 0, +1, 0] |
| **Atores B** | `ACT-017` +1, `ACT-001` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-136 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-136):** Banco "Armamento da população — Segurança" (`docs/12_FICHAS_DOS_MODOS.md:386`). Não repete a INST-012 (decreto dos CACs) nem a INST-094/095: aqui o recorte é rural e o mecanismo é a soma de bancadas. Armas = Soc ±1, como a INST-121. Ano 2 e Dignidade+ em B (carta ligada). Evento A sem detalhe gráfico; dúvida ao PSI.

### INST-137 — Dia do Orgulho Heterossexual

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Data do orgulho hétero |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | A bancada religiosa aprova um Dia do Orgulho Hétero. Coletivos LGBT dizem que a data zomba de quem sofre violência. |
| **Opção A** | Vetar a data |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "A data cai. Em cultos, pastores dizem que o governo persegue a fé." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-024` +1, `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Sancionar a data |
| **Efeitos B** | `Capital Político` +15, `Dignidade` -10, `Consciência` -5 |
| **Consequência B** | "A data entra no calendário. Coletivos relatam mais ataques nas redes." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-012` +1, `ACT-024` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-137 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-137):** Banco "Dia do Orgulho Heterossexual — Costumes" (`docs/12_FICHAS_DOS_MODOS.md:387`). Mecanismo: lei simbólica como teste de força. Sem detalhe de violência; dúvida ao PSI sobre o termo "zomba". Ano 2, Dignidade+ em A.

### INST-138 — Fim da Escala 6x1

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escala de seis por um |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-015` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Um abaixo-assinado enorme pede o fim da escala de seis dias por um. O empresariado só aceita uma transição lenta. |
| **Opção A** | Apoiar o fim já |
| **Efeitos A** | `Dignidade` +15, `Consciência` +5, `Caixa` -10, `Capital Político` -10 |
| **Consequência A** | "Trabalhadores lotam as galerias. A bancada empresarial promete obstruir." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-015` +1, `ACT-004` -1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Negociar a transição |
| **Efeitos B** | `Capital Político` +10, `Caixa` +5, `Dignidade` -5, `Consciência` -5 |
| **Consequência B** | "A escala muda aos poucos. Nas redes, dizem que você cedeu ao patrão." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-138 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-138):** Banco "Fim da escala 6x1 — Trabalhadores" (`docs/12_FICHAS_DOS_MODOS.md:388`). Não repete a INST-010 (PEC sem veto): aqui o dilema é ritmo da mudança × custo. Ano 1: o tema não depende de governo formado. Título sem algarismos ("6x1" fica no cabeçalho).

### INST-139 — Liberação de Agrotóxicos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Quem libera o veneno |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | A bancada do boi quer que só a Agricultura libere agrotóxicos, sem saúde nem meio ambiente. Alguns são proibidos na Europa. |
| **Opção A** | Manter os três órgãos |
| **Efeitos A** | `Dignidade` +10, `Soberania` +5, `Capital Político` -15 |
| **Consequência A** | "Saúde e ambiente seguem no processo. O agro diz que a fila trava a safra." |
| **Eixo A** | [-1, +1, 0, 0] |
| **Atores A** | `ACT-014` +1, `ACT-018` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Concentrar na Agricultura |
| **Efeitos B** | `Caixa` +10, `Capital Político` +10, `Dignidade` -10, `Soberania` -5 |
| **Consequência B** | "As liberações saem mais rápido. Médicos alertam para veneno no prato." |
| **Eixo B** | [+1, -1, 0, 0] |
| **Atores B** | `ACT-001` +1, `ACT-014` -1 |
| **Evento B** | "Um rio aparece contaminado perto das lavouras." · atraso 2 · `Dignidade` -10, `Soberania` -5 |
| **Aprendizado** | APR-139 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-139):** Banco "Liberação de agrotóxicos — Saúde" (`docs/12_FICHAS_DOS_MODOS.md:389`). Mecanismo: quem tem a caneta do registro. Diplomacia: seguir padrão europeu = +1 (instituição de fora), autonomia = −1 (convenção do kit §4). Ano 2 e Dignidade+ em A.

### INST-140 — Revogação do Teto de Gastos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Petróleo para a escola |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Uma frente de deputados de vários partidos quer pôr o dinheiro do petróleo na escola. O Mercado quer usar para pagar a dívida. |
| **Opção A** | Petróleo para a escola |
| **Efeitos A** | `Consciência` +15, `Dignidade` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "As escolas ganham verba fixa. O Mercado reage, e os juros sobem." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-013` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Abater a dívida |
| **Efeitos B** | `Caixa` +15, `Consciência` -10, `Dignidade` -5 |
| **Consequência B** | "A dívida cai um pouco. Professores marcam greve contra a escolha." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-006` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-140 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-140):** Troca do banco "Revogação do teto de gastos — Educação" (`docs/12_FICHAS_DOS_MODOS.md:390`): o teto já é a INST-023. Fica a educação, com o mecanismo da frente suprapartidária e da receita vinculada. Proposta ao PO nº 1. Ano 2 e Consciência+ em A.

### INST-141 — Pedidos na Gaveta

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pedidos na gaveta |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | O presidente da Câmara guarda pedidos de impeachment contra você na gaveta. Ele quer um ministério para o partido dele. |
| **Opção A** | Ceder o ministério |
| **Efeitos A** | `Capital Político` +15, `Integridade` -10, `Legitimidade` -5 |
| **Consequência A** | "Os pedidos seguem na gaveta. A imprensa chama o acordo de seguro." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` +1, `ACT-023` -1 |
| **Evento A** | — |
| **Opção B** | Recusar a pressão |
| **Efeitos B** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência B** | "Você não cede. A gaveta vira ameaça em cada votação." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` -1, `ACT-023` +1 |
| **Evento B** | "Aliados do presidente da Câmara falam em impeachment na TV." · atraso 1 · `Capital Político` -10 |
| **Aprendizado** | APR-141 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-141):** Modo Impeachment, carta comum (DP-011): pressão antes do processo, sem fase da cena (o IMP-1 é o pedido aceito). Mecanismo: poder de gaveta. Eixo zero, como a INST-007. Ano 2: a ameaça só existe a partir do Ano 2 (`gdd/sistemas/03_impeachment.md` §3.1).

### INST-142 — Atraso no Repasse

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Atraso no repasse |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Falta dinheiro para pagar um benefício social. Técnicos sugerem atrasar o repasse ao banco público que paga as famílias. |
| **Opção A** | Atrasar o repasse |
| **Efeitos A** | `Dignidade` +10, `Integridade` -10, `Capital Político` -10 |
| **Consequência A** | "As famílias recebem em dia. O Tribunal de Contas abre uma auditoria." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-007` -1, `ACT-015` +1 |
| **Evento A** | "A oposição chama o atraso de crime e coleta assinaturas." · atraso 1 · `Legitimidade` -10, `Capital Político` -5 |
| **Opção B** | Cortar o benefício |
| **Efeitos B** | `Caixa` +10, `Integridade` +5, `Dignidade` -15 |
| **Consequência B** | "As contas fecham. Milhares de famílias perdem o benefício no mês." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-007` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-142 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-142):** Mecanismo: crime de responsabilidade fiscal, antes de qualquer pedido. Consequência B sem número ("milhares" é vago; alternativa: "Muitas famílias"). Ano 2, Dignidade+ em A (carta ligada). Quem fala `ACT-007`, fora da lista do modo, porque é quem sugere a manobra.

### INST-143 — Recado do General

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Recado do general |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Com o governo em baixa, um general da ativa posta que o Exército está atento à ordem. Aliados pedem punição. |
| **Opção A** | Punir o general |
| **Efeitos A** | `Legitimidade` +10, `Integridade` +5, `Segurança` -10, `Capital Político` -5 |
| **Consequência A** | "O general vai para a reserva. Nos quartéis, cresce o mal-estar." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-008` -1, `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Ignorar o recado |
| **Efeitos B** | `Segurança` +5, `Capital Político` +5, `Legitimidade` -10, `Consciência` -5 |
| **Consequência B** | "Nada acontece. Outros oficiais passam a opinar sobre o governo." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-008` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-143 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-143):** Mecanismo: tutela militar sobre um governo fraco. Estado: punir = +1 (limita o poder armado sobre a política); ignorar = −1. Sem evento: a carta já é sobre o efeito do recado. Segurança+ em B com Ano 2.

### INST-144 — Púlpito contra o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Púlpito contra o governo |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Azul |
| **Problema** | Pastores pregam que o governo ameaça a fé e falam em impeachment. Eles param se você ampliar a isenção dos templos. |
| **Opção A** | Ampliar a isenção |
| **Efeitos A** | `Capital Político` +10, `Legitimidade` +5, `Caixa` -10, `Integridade` -5 |
| **Consequência A** | "Os sermões mudam de tom. Outras igrejas pedem o mesmo benefício." |
| **Eixo A** | [0, 0, -1, 0] |
| **Atores A** | `ACT-012` +1, `ACT-019` -1 |
| **Evento A** | — |
| **Opção B** | Manter a regra |
| **Efeitos B** | `Integridade` +5, `Caixa` +5, `Legitimidade` -10, `Capital Político` -10 |
| **Consequência B** | "A isenção fica igual. Os sermões contra você se multiplicam." |
| **Eixo B** | [0, 0, +1, 0] |
| **Atores B** | `ACT-012` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-144 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-144):** Mecanismo: disputa da legitimidade fora do Congresso. Não repete a INST-103 (emenda para templo) nem a 042 (concessão de TV): aqui a troca é isenção por silêncio. Dúvida ao PSI: risco de opor fé e governo; a carta não julga a pregação.

## Relatório da onda (script, 2026-10-22)

`check ... --no-learning --wave-report --style` → 10 cartas, 0 erros, 0 avisos de estilo (saída 0). `box --json onda-15/aprendizados.json` → saída 0.

| Meta | Resultado |
| :--- | :--- |
| Eventos 4-5 de 20 | 5 (25%): 135 B, 136 A, 139 B, 141 B, 142 A |
| Diplomacia ≠ 0 em ≥ 3 | 4 (135 e 139, nas duas) |
| Sociedade ≠ 0 em ≥ 3 | 8 (40%) |
| Dignidade+ com Ano 2-4 (≥ 2) | 6 · Segurança+ com Ano 2-4: 2 (136 A, 143 B) |
| 7 cores com custo | todas as cores com saldo negativo em ≥ 1 medidor |

## Propostas ao PO (provisórias)

1. INST-140: o teto de gastos já é a INST-023; tema trocado para "Petróleo para a escola" (frente suprapartidária e receita vinculada). Alternativa: piso da saúde × bancada empresarial.
2. Modo Impeachment: títulos da lista antiga (doc 12 `:428-447`) descartados, porque eram as fases e respostas da cena (DP-011). Todas as comuns com Ano mínimo 2.
3. INST-142 e 143 com quem fala fora da lista do modo (`ACT-007`, `ACT-008` está na lista).

## Dúvidas para o PSI (quando houver revisão)

- INST-136 evento "mortos no campo" (sem detalhe); INST-137 "zomba"; INST-144 risco de opor fé e governo; INST-142 alusão a um caso real de 2015-2016 (sem nomes).

## Autoconferência

- DP-011 em `gestao/decisoes-provisorias.md:19` — conferido.
- Nota do doc 17 sobre comuns × cena em `docs/17_ROTEIRO_DAS_CARTAS.md:2635` — conferido.
- Gatilhos do Ano 2 em `gdd/sistemas/03_impeachment.md` §3.1 — conferido.
- Lista Bancadas 135-140 em `docs/12_FICHAS_DOS_MODOS.md:385-390` — conferido.
- Teto de gastos = INST-023 (título no doc 17 `:667` "Furar o teto") — conferido.

