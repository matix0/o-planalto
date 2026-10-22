# Onda 25 do P-015 — temáticas de Racismo (THEM-051 a THEM-060) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo D-196** (`.claude/notas/execucao/brief-d196.md`)
**Status:** CONCLUÍDO (2026-10-22) — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Formato:** `docs/17_ROTEIRO_DAS_CARTAS.md` §17.01.1; tema e bloco de IDs pela DP-013 (`gestao/decisoes-provisorias.md:21`; `jogo/tools/cards_doc.py:39-41`). Modelo: THEM-001 (`docs/17_ROTEIRO_DAS_CARTAS.md:5040`).
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-25/cartas.md --no-learning --wave-report --style`

## Progresso

- [x] Brief D-196, kit, DP-011 a DP-017, §17.12, `cards_doc.py` (THEMES, THEME_BLOCKS, checagens de estilo)
- [x] Títulos de todo o doc 17 e das ondas 1-16 listados para não repetir dilema (`onda-20..22` ainda não existiam ao começar)
- [x] Plano (mecanismo, modo, cores, eventos, anos) · [x] 10 cartas · [x] check 0 erros/0 avisos · [x] aprendizados (md + json) · [x] box sai 0

## Convenções desta onda

- Tema Racismo (bloco THEM-051..060, `racism`; aviso de conteúdo: sem detalhe gráfico nem estereótipo). Modos: Judiciário (051, 060), Bancadas (052), Orçamento (053), Prisional e Policial (054, 057), Geopolítico (055), Congresso (056, 059), Emendas (058).

- Modo de cada carta = arena do dilema (DP-013); nenhuma no Impeachment nem no Influenciador (exigiria Técnica e Reação).
- Nenhum número, dado nem pessoa real no texto ao jogador; fatos ficam na pista de dado do Aprendizado (D-091, RC-08).

---

### THEM-051 — Revista pela aparência

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Revista pela aparência |
| **Tipo** | Temática |
| **Modo** | Judiciário |
| **Tema** | Racismo |
| **Quem fala** | Supremo Tribunal Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | O STF julga se a polícia pode revistar alguém só pela aparência. Jovens negros são os mais parados. |
| **Opção A** | Proibir a abordagem |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "A busca exige motivo concreto. Policiais dizem que perdem uma ferramenta." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-023` +1, `ACT-008` -1 |
| **Evento A** | — |
| **Opção B** | Manter o critério |
| **Efeitos B** | `Segurança` +5, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "Nada muda. Jovens negros seguem parados na rua." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-008` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-051 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-051):** Perfilamento racial e 'fundada suspeita'; não repete INST-100 (preso por foto no álbum), que trata do reconhecimento. Aviso de conteúdo (racismo, violência policial): sem cena de violência.

### THEM-052 — Racismo na arquibancada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Racismo na arquibancada |
| **Tipo** | Temática |
| **Modo** | Bancadas |
| **Tema** | Racismo |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Jogadores negros sofrem insultos racistas nos estádios. Um projeto tira pontos dos clubes, e a bancada da bola resiste. |
| **Opção A** | Tirar pontos do clube |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "Clubes perdem pontos por racismo da torcida. A bancada da bola reclama." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Só multar o clube |
| **Efeitos B** | `Capital Político` +5, `Consciência` -5, `Integridade` -5 |
| **Consequência B** | "Os clubes pagam a multa. Os insultos seguem nos jogos." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-052 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-052):** Punição esportiva como política antirracista. Eixo B zero: multa mantém a regra atual.

### THEM-053 — Crédito negado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Crédito negado |
| **Tipo** | Temática |
| **Modo** | Orçamento |
| **Tema** | Racismo |
| **Quem fala** | Ministério da Fazenda |
| **Ano mínimo** | 2 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Empreendedores negros têm mais crédito negado nos bancos. Você pode criar uma linha só para eles ou uma linha geral. |
| **Opção A** | Crédito para negros |
| **Efeitos A** | `Dignidade` +10, `Caixa` -15, `Capital Político` -5 |
| **Consequência A** | "Pequenos negócios de pessoas negras crescem. Bancos reclamam da regra." |
| **Eixo A** | [-1, 0, +1, +1] |
| **Atores A** | `ACT-002` -1 |
| **Evento A** | — |
| **Opção B** | Crédito igual para todos |
| **Efeitos B** | `Caixa` -5, `Dignidade` -5, `Capital Político` +5 |
| **Consequência B** | "A linha abre para todos. Os bancos seguem com os mesmos clientes." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-002` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-053 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-053):** Ação afirmativa no crédito; não repete INST-128 (cotas). Ano 2, carta ligada a Dignidade. B tem eixo zero: política neutra mantém a desigualdade de acesso.

### THEM-054 — Terreiro atacado

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Terreiro atacado |
| **Tipo** | Temática |
| **Modo** | Prisional e Policial |
| **Tema** | Racismo |
| **Quem fala** | Ministério dos Direitos Humanos |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Terreiros de religiões de matriz africana são atacados num bairro. A polícia registra os casos como briga de vizinhos. |
| **Opção A** | Delegacia especializada |
| **Efeitos A** | `Segurança` +10, `Consciência` +5, `Capital Político` -10 |
| **Consequência A** | "Os ataques viram inquérito. Os terreiros voltam a abrir." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Briga de vizinhos |
| **Efeitos B** | `Capital Político` +5, `Segurança` -10, `Dignidade` -5 |
| **Consequência B** | "Os casos ficam como desavença. Ninguém responde por eles." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | — |
| **Evento B** | "Outro terreiro é atacado no mesmo bairro." · atraso 1 · `Segurança` -10 |
| **Aprendizado** | APR-THEM-054 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-054):** Racismo religioso. Sem atores de propósito: não opor uma fé a outra (como a INST-200 na DP-023). Ano 2, carta ligada a Segurança. Sem descrição do ataque.

### THEM-055 — Visto para haitianos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Visto para haitianos |
| **Tipo** | Temática |
| **Modo** | Geopolítico |
| **Tema** | Racismo |
| **Quem fala** | Ministério das Relações Exteriores |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Roxo |
| **Problema** | Imigrantes haitianos e africanos pedem visto humanitário. Nas redes, campanhas pedem para barrar estrangeiros negros. |
| **Opção A** | Dar visto humanitário |
| **Efeitos A** | `Dignidade` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "Famílias chegam com documentos. Grupos nas redes reclamam." |
| **Eixo A** | [0, +1, +1, 0] |
| **Atores A** | `ACT-022` -1 |
| **Evento A** | — |
| **Opção B** | Fechar o visto |
| **Efeitos B** | `Capital Político` +5, `Dignidade` -10, `Soberania` +5 |
| **Consequência B** | "O visto fecha. Famílias tentam entrar pela mata." |
| **Eixo B** | [0, -1, -1, -1] |
| **Atores B** | `ACT-022` +1 |
| **Evento B** | "A ONU critica o Brasil por discriminar imigrantes negros." · atraso 1 · `Legitimidade` -10 |
| **Aprendizado** | APR-THEM-055 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-055):** Racismo e migração; não repete INST-184 (pânico na fronteira, técnica do Influenciador): aqui o governo decide a política de visto. Diplomacia ±1.

### THEM-056 — Reparação da escravidão

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Reparação da escravidão |
| **Tipo** | Temática |
| **Modo** | Congresso |
| **Tema** | Racismo |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 3 |
| **Cor A** | Preto |
| **Cor B** | Verde |
| **Problema** | Um projeto propõe reparar os descendentes de pessoas escravizadas. A alternativa é só um pedido oficial de desculpas. |
| **Opção A** | Fundo de reparação |
| **Efeitos A** | `Dignidade` +10, `Consciência` +10, `Caixa` -20 |
| **Consequência A** | "O fundo financia moradia e estudo. O mercado critica o gasto." |
| **Eixo A** | [-2, 0, +1, 0] |
| **Atores A** | `ACT-006` -1 |
| **Evento A** | "Escolas e museus passam a contar a história da reparação." · atraso 2 · `Consciência` +10 |
| **Opção B** | Só pedir desculpas |
| **Efeitos B** | `Consciência` +5, `Dignidade` -10, `Capital Político` +5 |
| **Consequência B** | "O Estado pede desculpas. Nenhuma política muda." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-006` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-056 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-056):** Memória e reparação histórica. Ano 3: tema de fim de mandato; carta ligada a Dignidade e Consciência. Evento positivo em A.

### THEM-057 — Câmera que erra

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Câmera que erra |
| **Tipo** | Temática |
| **Modo** | Prisional e Policial |
| **Tema** | Racismo |
| **Quem fala** | `ACT-020` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Vermelho |
| **Problema** | Câmeras de uma empresa estrangeira identificam suspeitos nas estações. O sistema erra mais com pessoas negras. |
| **Opção A** | Suspender o sistema |
| **Efeitos A** | `Dignidade` +10, `Segurança` -5, `Capital Político` -5 |
| **Consequência A** | "As câmeras param de identificar rostos. A polícia reclama." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-020` -1 |
| **Evento A** | — |
| **Opção B** | Ampliar as câmeras |
| **Efeitos B** | `Segurança` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "Mais estações ganham câmeras estrangeiras. Os erros também crescem." |
| **Eixo B** | [+1, +1, -1, -1] |
| **Atores B** | `ACT-020` +1, `ACT-021` +1 |
| **Evento B** | "Um rapaz inocente é preso por erro da câmera." · atraso 1 · `Legitimidade` -10 |
| **Aprendizado** | APR-THEM-057 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-057):** Viés algorítmico; diferente da INST-100 (álbum de fotos) por ser compra de tecnologia. Diplomacia +1 em B (tecnologia estrangeira).

### THEM-058 — Aterro no bairro

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aterro no bairro |
| **Tipo** | Temática |
| **Modo** | Emendas |
| **Tema** | Racismo |
| **Quem fala** | `ACT-003` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Uma emenda paga um aterro de lixo ao lado de um bairro de maioria negra. Levar para longe custa mais. |
| **Opção A** | Levar o aterro longe |
| **Efeitos A** | `Dignidade` +10, `Caixa` -15, `Capital Político` -5 |
| **Consequência A** | "O aterro vai para longe das casas. A obra custa mais." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-003` -1 |
| **Evento A** | — |
| **Opção B** | Aterro no bairro pobre |
| **Efeitos B** | `Caixa` +10, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "O aterro fica perto das casas. O cheiro chega às escolas." |
| **Eixo B** | [+1, 0, -1, 0] |
| **Atores B** | `ACT-003` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-058 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-058):** Racismo ambiental. `ACT-003` como quem fala (construtora da obra).

### THEM-059 — Racismo no parto

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Racismo no parto |
| **Tipo** | Temática |
| **Modo** | Congresso |
| **Tema** | Racismo |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 2 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Mulheres negras recebem menos anestesia e morrem mais no parto. Um projeto cria um protocolo nacional com metas. |
| **Opção A** | Protocolo com metas |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10 |
| **Consequência A** | "Hospitais seguem o protocolo. Menos mães negras morrem no parto." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-014` +1 |
| **Evento A** | — |
| **Opção B** | Deixar a cada hospital |
| **Efeitos B** | `Capital Político` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "Cada hospital decide. As diferenças seguem iguais." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-059 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-059):** Racismo institucional na saúde; ponte com o tema Saúde. Ano 2, carta ligada a Dignidade. Sem descrição clínica.

### THEM-060 — Poucos juízes negros

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Poucos juízes negros |
| **Tipo** | Temática |
| **Modo** | Judiciário |
| **Tema** | Racismo |
| **Quem fala** | Conselho Nacional de Justiça |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Poucos juízes são negros num país de maioria negra. Você pode apoiar cotas nos concursos da magistratura. |
| **Opção A** | Cota no concurso |
| **Efeitos A** | `Legitimidade` +10, `Consciência` +5, `Capital Político` -10 |
| **Consequência A** | "Os concursos reservam vagas. Associações de juízes reclamam." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-007` -1 |
| **Evento A** | — |
| **Opção B** | Concurso só por nota |
| **Efeitos B** | `Capital Político` +5, `Legitimidade` -5, `Consciência` -5 |
| **Consequência B** | "Nada muda. Os tribunais seguem quase todos brancos." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-007` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-060 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (THEM-060):** Representação no Judiciário. `ACT-007` (tecnocratas) defende o mérito técnico; inferência do GD.

## Relatório da onda (script)

`check ... --no-learning --wave-report --style` → 10 cartas, 0 erros, 0 avisos de estilo (saída 0). `box --json` → saída 0. Metas: 4 eventos (054 B, 055 B, 056 A, 057 B) · Diplomacia 3 · Sociedade 16 · Dignidade+ com Ano 2-4: 3 · Segurança+ com Ano 2-4: 1 · 7 cores. Os avisos de Técnica do Influenciador vêm de checar só a onda (sem cartas do modo).

## Propostas ao PO (provisórias)

1. THEM-054 sem atores (não opor fé, como a DP-023).
2. THEM-052 e 053 B com eixo zero (regra atual mantida); o ECO confere.

## Dúvidas para o PSI (quando houver revisão)

- Onda inteira sob aviso de conteúdo (racismo). THEM-051 (revista policial), THEM-054 (terreiro atacado), THEM-057 (prisão por erro) e THEM-059 (parto): sem cena gráfica; conferir estereótipo.

## Autoconferência

- Bloco Racismo THEM-051..060 `jogo/tools/cards_doc.py:41`; aviso de conteúdo `.claude/notas/execucao/kit-gd.md` §4; DP-023 (não opor fé) `gestao/decisoes-provisorias.md:31`; JSON pendente `.claude/notas/execucao/brief-d196.md`; THEM-001 `docs/17_ROTEIRO_DAS_CARTAS.md:5040` — conferidos.
