# Onda 12 do P-015 — Emendas (INST-104 a INST-113) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo:** D-196 (sem web, Aprendizados em conferência, sem PSI)
**Status:** CONCLUÍDO — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-12/cartas.md --no-learning --wave-report --style`

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

### INST-104 — Emendas pela reforma

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emendas pela reforma |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | Sua reforma tributária precisa de votos. Líderes pedem que você libere as emendas dos deputados na véspera da votação. |
| **Opção A** | Liberar na véspera |
| **Efeitos A** | `Capital Político` +15, `Caixa` -10, `Integridade` -10 |
| **Consequência A** | "A reforma passa. Líderes já falam no preço da próxima votação." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` +1 |
| **Evento A** | "O Centrão pede mais emendas para a próxima pauta." · atraso 2 · `Caixa` -10, `Integridade` -5 |
| **Opção B** | Negociar só o texto |
| **Efeitos B** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência B** | "A votação adia. Você ganha votos um a um, no debate do texto." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` -1, `ACT-023` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-104 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-104):** Tema "Emenda em troca de voto" (`docs/12_FICHAS_DOS_MODOS.md:335`). Mecanismo: o momento da liberação como moeda de troca. Não repete o bloqueio de emendas da Orçamento (corte na crise).

### INST-105 — Fuzis para a guarda municipal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fuzis para a guarda municipal |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Uma emenda compra fuzis para a guarda municipal de uma cidade. O prefeito queria a verba para iluminar ruas e praças. |
| **Opção A** | Trocar por iluminação |
| **Efeitos A** | `Segurança` +5, `Dignidade` +10, `Capital Político` -10 |
| **Consequência A** | "Ruas e praças ganham luz. O deputado diz que você desarmou a cidade." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-008` -1 |
| **Evento A** | — |
| **Opção B** | Comprar os fuzis |
| **Efeitos B** | `Segurança` +5, `Capital Político` +5, `Dignidade` -10, `Caixa` -5 |
| **Consequência B** | "A guarda ganha fuzis. As praças seguem escuras à noite." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-008` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-105 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-105):** Tema "Emenda para armas" (`docs/12_FICHAS_DOS_MODOS.md:336`). Mecanismo: o papel da guarda municipal e a prevenção pelo espaço urbano. Ano 2: carta ligada a Dignidade+ e Segurança+. Armas = Soc ±1.

### INST-106 — Título de terra no assentamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Título de terra no assentamento |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 2 |
| **Cor A** | Laranja |
| **Cor B** | Vermelho |
| **Problema** | Uma emenda paga títulos para assentados. O título individual deixa vender o lote; a concessão de uso mantém a terra com a família. |
| **Opção A** | Dar título individual |
| **Efeitos A** | `Dignidade` +10, `Capital Político` +5, `Soberania` -10 |
| **Consequência A** | "Famílias ganham a escritura. Fazendeiros vizinhos já fazem ofertas." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-017` -1 |
| **Evento A** | "Grandes fazendas compram lotes dos assentados." · atraso 2 · `Soberania` -10, `Dignidade` -5 |
| **Opção B** | Dar concessão de uso |
| **Efeitos B** | `Soberania` +5, `Dignidade` +5, `Capital Político` -10 |
| **Consequência B** | "A terra fica com as famílias, sem venda. Ruralistas falam em tutela." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-017` +1, `ACT-001` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-106 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-106):** Tema "Emenda para reforma agrária" (`docs/12_FICHAS_DOS_MODOS.md:337`). Mecanismo: forma do título (domínio × concessão de direito real de uso). Não repete o crédito rural (exportador × pequeno) da Orçamento. Ano 2: carta ligada a Dignidade+. Dúvida ao PO: o tema é mais Bancadas que Emendas.

### INST-107 — Emenda para ONG de fachada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para ONG de fachada |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Uma emenda paga uma ONG sem sede que patrocina times locais. Ela recebe dinheiro de casas de apostas com sede fora do país. |
| **Opção A** | Suspender e investigar |
| **Efeitos A** | `Integridade` +15, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "O repasse para. Times locais ficam sem patrocínio, e o deputado reclama." |
| **Eixo A** | [0, -1, 0, +1] |
| **Atores A** | `ACT-023` +1, `ACT-011` -1 |
| **Evento A** | "A PF acha lavagem de dinheiro na ONG." · atraso 1 · `Integridade` +10, `Legitimidade` +5 |
| **Opção B** | Pagar a emenda |
| **Efeitos B** | `Capital Político` +10, `Integridade` -10, `Legitimidade` -5 |
| **Consequência B** | "O dinheiro chega à ONG. Ninguém sabe ao certo para onde ele vai." |
| **Eixo B** | [0, +1, 0, -1] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-107 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-107):** Tema "Emenda para bets" (`docs/12_FICHAS_DOS_MODOS.md:338`). Mecanismo: rastreabilidade das emendas a ONGs. Não repete as cartas de apostas do Influenciador (pagamento a influenciadores, ministro). Diplomacia: controle sobre dinheiro de fora (−) × fluxo livre (+).

### INST-108 — Emenda Pix para escola

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda Pix para escola |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Uma emenda Pix cai direto no caixa de uma prefeitura, sem projeto nem prestação de contas. O deputado diz que é para escolas. |
| **Opção A** | Exigir plano de uso |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -10 |
| **Consequência A** | "A prefeitura apresenta o plano. O deputado reclama da burocracia." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-011` -1, `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Liberar sem plano |
| **Efeitos B** | `Capital Político` +10, `Dignidade` +5, `Integridade` -10 |
| **Consequência B** | "O dinheiro cai. Parte vai para escolas; o resto, ninguém sabe." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-108 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-108):** Tema "Emenda para escola" (`docs/12_FICHAS_DOS_MODOS.md:339`). Mecanismo: transferência especial ("emenda Pix"). Diferente da INST-107 (ONG): aqui o dinheiro vai à prefeitura.

### INST-109 — Trator parado no pátio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Trator parado no pátio |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 3 |
| **Cor A** | Vermelho |
| **Cor B** | Verde |
| **Problema** | Emendas compraram tratores para pequenos agricultores, mas o prefeito só os empresta a aliados. O resto fica parado. |
| **Opção A** | Dar a chave ao conselho |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "Um conselho de agricultores faz a escala. O prefeito perde um trunfo." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-017` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Deixar com o prefeito |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -5, `Integridade` -5 |
| **Consequência B** | "Os tratores seguem com o prefeito. Quem não é aliado espera." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-011` +1, `ACT-017` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-109 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-109):** Tema "Emenda para agro" (`docs/12_FICHAS_DOS_MODOS.md:340`). Mecanismo: gestão do bem comprado com emenda (controle social, conselhos). Ano 3: carta ligada a Dignidade+.

### INST-110 — Estrada até a fazenda

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Estrada até a fazenda |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | Senado Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Um senador manda emenda para asfaltar uma estrada que passa nas terras dele. Ela também liga dois povoados isolados. |
| **Opção A** | Barrar por conflito |
| **Efeitos A** | `Integridade` +10, `Dignidade` -5, `Capital Político` -10 |
| **Consequência A** | "A obra para. Os povoados seguem isolados, e o senador vira oposição." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-023` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Asfaltar a estrada |
| **Efeitos B** | `Dignidade` +10, `Capital Político` +5, `Integridade` -10, `Caixa` -5 |
| **Consequência B** | "Os povoados ganham estrada. A fazenda do senador também." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-003` +1, `ACT-001` +1 |
| **Evento B** | "Uma reportagem mostra a fazenda valorizada." · atraso 2 · `Integridade` -10 |
| **Aprendizado** | APR-110 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-110):** Tema "Emenda para rodovia" (`docs/12_FICHAS_DOS_MODOS.md:341`). Mecanismo: conflito de interesses. Custo real dos dois lados: barrar deixa os povoados sem estrada.

### INST-111 — Emendas para o tempo integral

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emendas para o tempo integral |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Deputados de um estado podem juntar emendas para cumprir a meta de escola em tempo integral. Cada um prefere a própria obra. |
| **Opção A** | Juntar no tempo integral |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10 |
| **Consequência A** | "As escolas ganham turno integral. Deputados perdem placas com o nome." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-013` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Deixar cada um decidir |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -5, `Consciência` -5 |
| **Consequência B** | "Cada deputado faz sua obra. A meta de educação fica para depois." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-111 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-111):** Tema "Emenda para educação" (`docs/12_FICHAS_DOS_MODOS.md:342`). Mecanismo: emenda de bancada e plano × pulverização. Não repete as creches paradas da Orçamento (obra nova × concluir). Ano 2: carta ligada a Consciência+ e Dignidade+.

### INST-112 — Exame na clínica do deputado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Exame na clínica do deputado |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Uma emenda paga exames numa clínica privada ligada a um deputado. O posto da cidade tem o aparelho, mas falta técnico. |
| **Opção A** | Pôr técnico no posto |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "O aparelho do posto volta a funcionar. A clínica perde o contrato." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-014` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Pagar a clínica |
| **Efeitos B** | `Dignidade` +5, `Capital Político` +10, `Integridade` -10, `Caixa` -5 |
| **Consequência B** | "A fila de exames anda. O aparelho do posto segue parado." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | "A clínica sobe o preço no ano seguinte." · atraso 2 · `Caixa` -10 |
| **Aprendizado** | APR-112 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-112):** Tema "Emenda para clínica privada" (`docs/12_FICHAS_DOS_MODOS.md:343`). Mecanismo: SUS complementar (privado entra quando o público não dá conta) e conflito de interesses. Não repete a tabela do SUS (Orçamento).

### INST-113 — Ônibus elétrico de fora

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ônibus elétrico de fora |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-021` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Vermelho |
| **Problema** | Emendas de bancada compram ônibus elétricos para capitais. Os chineses são mais baratos; os feitos no país geram empregos aqui. |
| **Opção A** | Comprar os importados |
| **Efeitos A** | `Caixa` +10, `Dignidade` +5, `Soberania` -10 |
| **Consequência A** | "Mais ônibus rodam com a mesma verba. Fábricas do país reclamam." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-021` +1, `ACT-004` -1 |
| **Evento A** | — |
| **Opção B** | Exigir peças nacionais |
| **Efeitos B** | `Soberania` +10, `Caixa` -10, `Dignidade` -5 |
| **Consequência B** | "Menos ônibus chegam, mas fábricas daqui contratam." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-015` +1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-113 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (INST-113):** Tema "Emenda para ônibus elétricos" (`docs/12_FICHAS_DOS_MODOS.md:344`). Mecanismo: conteúdo local nas compras públicas. Eixo como a INST-064 (proteger = [−1, −1, 0, 0]). Não repete o trem-bala × ônibus (Orçamento). `ACT-021` +1 ao ceder à potência.

## Relatório do script

```

10 cartas conferidas, 0 erros.

Avisos do baralho (todas as cartas do doc 17):
  Eventos: 5 de 20 opções (25%; meta 15-25%, D-125)
  Eixo Economia ≠ 0: 6 (30%)
  Eixo Diplomacia ≠ 0: 4 (20%)
  Eixo Sociedade ≠ 0: 2 (10%)  ⚠ abaixo de 15% (D-126)
  Eixo Estado ≠ 0: 8 (40%)
  Cor black: dignity -10, political_capital +5, security +5, treasury -5
  Cor blue: awareness +5, dignity -5, integrity +45, legitimacy +5, political_capital -45, treasury -5
  Cor green: dignity -5, integrity -5, political_capital +10
  Cor orange: dignity +20, integrity -10, political_capital +15, sovereignty -20, treasury +5
  Cor purple: dignity +10, political_capital -10, security +5
  Cor red: awareness +5, dignity +30, integrity +10, political_capital -35, sovereignty +15, treasury -20
  Cor yellow: awareness -5, dignity +10, integrity -40, legitimacy -5, political_capital +50, treasury -15
  Técnica demoralization: 0  ⚠ menos de 2 cartas (D-119)
  Técnica moral_panic: 0  ⚠ menos de 2 cartas (D-119)
  Técnica deepfake: 0  ⚠ menos de 2 cartas (D-119)
  Técnica ai_farm: 0  ⚠ menos de 2 cartas (D-119)
  Técnica doom_cache: 0  ⚠ menos de 2 cartas (D-119)
  Técnica accusatory_didacticism: 0  ⚠ menos de 2 cartas (D-119)
  Carta ligada — dignity: 10 opções com efeito positivo (5 com ano mínimo 2-4)
  Carta ligada — awareness: 2 opções com efeito positivo (1 com ano mínimo 2-4)
  Carta ligada — sovereignty: 2 opções com efeito positivo (1 com ano mínimo 2-4)
  Carta ligada — security: 2 opções com efeito positivo (2 com ano mínimo 2-4)
  Carta ligada — integrity: 6 opções com efeito positivo (1 com ano mínimo 2-4)
  Carta ligada — treasury: 1 opções com efeito positivo (0 com ano mínimo 2-4)
  Carta ligada — political_capital: 9 opções com efeito positivo (4 com ano mínimo 2-4)
  Carta ligada — legitimacy: 1 opções com efeito positivo (0 com ano mínimo 2-4)
  Cartas por modo/tipo: amendments 10
```

## Propostas ao PO

1. INST-106 é mais Bancadas que Emendas; manter aqui ou trocar.
2. Sociedade ≠ 0 em só 10% nesta onda (emendas têm pouco eixo moral); compensar em outra onda.

## Autoconferência

- Temas conferidos em `docs/12_FICHAS_DOS_MODOS.md:296-303` e `:333-344`; formato da INST-081 em `docs/17_ROTEIRO_DAS_CARTAS.md:1705-1730`; Quem fala Ministério da Justiça em `:1712`; pendência JSON como `onda-08/aprendizados.json:13`; checagens com 0 erros e 0 avisos de estilo, `box` sai 0.
