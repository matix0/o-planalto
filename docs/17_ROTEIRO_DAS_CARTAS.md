# 17 — Roteiro das Cartas

**Roteiro das cartas do jogo "O Planalto"**

Este documento guarda o texto das cartas, organizadas por modo e por tipo. **Status: 202 de 340 cartas escritas + 5 cartas da cena de impeachment (`IMP-1..5`, fora das 340, D-101).** Contagem refeita na Onda 0 do P-015 (DP-012); cartas novas escritas em ondas (`gestao/prompts/criacao-cartas.md`). Revisado no P-010 (2026-10-13): cor por opção (D-092), opções A/B com lado sorteado (D-084), Carta de Aprendizado no doc 18 (D-090).

---

## 17.01 — Estrutura do Documento

### 17.01.1. Formato das cartas

Tabela por carta, lida pelo nome de cada linha (a ordem não importa). Um script gera `jogo/data/cards.json`, `jogo/data/impeachment.json` e o campo `cards` de `jogo/data/actors.json` a partir deste doc (formato e conversões: DP-014, provisória).

| Linha | Quando | Formato | Chave no jogo |
| :--- | :--- | :--- | :--- |
| Cabeçalho | sempre | `### INST-001 — Título longo` (ID: `INST-nnn`, `THEM-nnn`, `ATOR-nnn` ou `IMP-n`) | `id` |
| **Título** | sempre | até 5 palavras | `title` |
| **Tipo** | sempre | Institucional · Temática · Ator · Impeachment | `type` |
| **Modo** | sempre | um dos 10 modos (THEM e ATOR também: a arena do dilema) | `mode` |
| **Tema** | só THEM | um dos 7 temas (§17.12) | `theme` |
| **Função** | só ATOR | `` `ACT-xxx` · Exigência `` (ou Ataque, Oferta) | `actors.json` → `cards` |
| **Fase** | só cena | 1-5 | `phase` |
| **Quem fala** | sempre | `` `ACT-xxx` `` ou a instituição (D-164) | `speaker` |
| **Ano mínimo** | sempre | 1-4 (padrão 1) | `prerequisites.min_year` |
| **Técnica** | só Influenciador | Desmoralização · Pânico Moral · Deepfake · Fazenda de IA · Cachê da Desgraça · Didatismo Acusatório | `technique` |
| **Cor X** | sempre | Vermelho · Azul · Verde · Amarelo · Roxo · Laranja · Preto | `color` |
| **Problema** | sempre | até 140 caracteres, 2 linhas | `problem` |
| **Opção X** | sempre | até 25 caracteres (D-177) | `text` |
| **Teste X** | só cena | `` `Medidor` > N `` | `test` |
| **Efeitos X** | sempre | `` `Medidor` ±N `` separados por vírgula | `effects` |
| **Consequência X** | sempre | entre aspas, até 80 caracteres | `consequence` |
| **Eixo X** | sempre | `[Eco, Dip, Soc, Est]`, inteiros −2 a +2 (GDD 04) | `axis` |
| **Atores X** | fora da cena | `` `ACT-001` +1, `ACT-017` -1 `` ou — | `actors` |
| **Evento X** | fora da cena | "texto" · atraso 1-2 · `` `Medidor` ±N `` (1-3 medidores) ou — | `events` |
| **Reação X** | só Influenciador | Aceitar · Recusar · Investigar | `reaction` |
| **Aprendizado** | sempre | `APR-nnn` (INST), `APR-THEM-nnn`, `APR-ATOR-nnn`, `APR-IMP-n` — texto no doc 18 | `learning_id` |
| **Status** | sempre | aprovado · provisório (DP-nnn) | — |

X = A ou B. Medidor sempre entre crases e com sinal (`+10`, `-10`). Campo vazio usa "—". Os caracteres contam como no jogo: acento conta 1.

### 17.01.2. Regras de escrita

| Regra | Fonte |
| :--- | :--- |
| A e B são nomes internos; o jogo sorteia o lado de cada opção a cada partida e nunca escreve "esquerda/direita" | D-084 |
| Toda opção tem uma cor partidária (sem cor neutra) | D-092 |
| O ECO valida o saldo de efeitos por cor no balanceamento | D-092 |
| A Carta de Aprendizado fica no doc 18; aqui só o código `APR-xxx` (número da carta) | D-090 |
| Dado real só com fonte verificada | D-091 |

**Cancelada (decisão do PO, 2026-10-15):** ~~criar cartas que invertam o "moral por cor" (ex.: corrupção na base aliada, em que Vermelho/Roxo perdem `Integridade` e Preto/Verde/Amarelo ganham), com revisão do PSI. Nas 22 cartas atuais, a opção A nunca perde `Integridade` (parecer do ECO, 2026-10-13).~~ Toda opção mantém custo real em algum medidor.

### 17.01.3. Composição do baralho

| Tipo | Quantidade | Código |
| :--- | :--- | :--- |
| **Institucionais** | 200 | INST-XXX |
| **Temáticas** | 70 | THEM-XXX |
| **Atores** | 70 | ATOR-XXX |
| **Total** | **340** | — |

---

## 17.02 — Cartas do Modo Congresso (20)

### INST-001 — Privatização da Estatal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Privatização da estatal |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora. |
| **Opção A** | Nomear relator adversário |
| **Efeitos A** | `Capital Político` -10, `Soberania` +10 |
| **Consequência A** | "O relator é adversário. O projeto avança." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Aceitar as mudanças |
| **Efeitos B** | `Capital Político` +10, `Soberania` -15, `Caixa` +10, `Integridade` -5 |
| **Consequência B** | "A lei passa. O povo paga a conta." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-001 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-002 — Retirada de Direitos Trabalhistas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Retirada de direitos |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Senado Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | A Câmara aprovou um projeto que retira direitos trabalhistas. O Senado vai analisar. |
| **Opção A** | Mobilizar senadores |
| **Efeitos A** | `Capital Político` -20, `Dignidade` +10, `Integridade` +5 |
| **Consequência A** | "Os direitos são mantidos. O Congresso reclama." |
| **Eixo A** | [-2, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Deixar o Senado decidir |
| **Efeitos B** | `Dignidade` -10, `Capital Político` +5, `Integridade` -5 |
| **Consequência B** | "Os direitos são retirados. O Congresso aplaude." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-002 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-003 — CPI contra o Governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | CPI contra o governo |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | A oposição propõe uma CPI para investigar o governo. O presidente da Câmara quer engavetar. |
| **Opção A** | Apoiar a CPI |
| **Efeitos A** | `Consciência` +10, `Integridade` +10, `Capital Político` -15 |
| **Consequência A** | "A CPI é instalada. O governo é investigado." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Negociar o engavetamento |
| **Efeitos B** | `Caixa` -20, `Capital Político` +10, `Integridade` -10 |
| **Consequência B** | "A CPI é arquivada. O povo não sabe de nada." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-003 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-004 — Indicação para o STF

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Indicação para o STF |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Senado Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Vermelho |
| **Problema** | O Senado vai analisar sua indicação para o STF. O nome é polêmico. |
| **Opção A** | Indicar um nome técnico |
| **Efeitos A** | `Capital Político` -10, `Consciência` +5, `Integridade` +5 |
| **Consequência A** | "O nome é aprovado. O STF ganha um técnico." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Insistir no nome político |
| **Efeitos B** | `Capital Político` -20, `Legitimidade` -5, `Integridade` -5 |
| **Consequência B** | "O Senado rejeita. O governo sai enfraquecido." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-004 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-005 — Marco Temporal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Marco Temporal |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | A bancada ruralista quer aprovar o Marco Temporal. O STF já declarou inconstitucional. |
| **Opção A** | Vetar o projeto |
| **Efeitos A** | `Soberania` +10, `Dignidade` +10, `Capital Político` -15 |
| **Consequência A** | "Os indígenas mantêm suas terras." |
| **Eixo A** | [0, 0, +2, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Apoiar o projeto |
| **Efeitos B** | `Capital Político` +15, `Soberania` -10, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "Os indígenas perdem. O agronegócio comemora." |
| **Eixo B** | [+1, 0, -1, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-005 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-006 — Aumento do Próprio Salário

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aumento do próprio salário |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | O Congresso quer aumentar o próprio salário. A população está revoltada. |
| **Opção A** | Vetar o aumento |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` -20 |
| **Consequência A** | "O povo aplaude. O Congresso reclama." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Apoiar o aumento |
| **Efeitos B** | `Capital Político` +15, `Legitimidade` -15, `Integridade` -5 |
| **Consequência B** | "O povo vê que a casta política se protege." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-006 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

*(As demais 14 cartas do Modo Congresso ainda não foram escritas.)*

### INST-007 — Ministro aliado sob suspeita

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ministro aliado sob suspeita |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Uma CPI convoca seu ministro, de um partido aliado, suspeito de desvio em obras. O partido ameaça deixar a base se ele cair. |
| **Opção A** | Demitir o ministro |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência A** | "O partido aliado deixa a base. A CPI segue sem o ministro no cargo." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` -1, `ACT-023` +1, `ACT-003` -1 |
| **Evento A** | — |
| **Opção B** | Esperar a Justiça |
| **Efeitos B** | `Capital Político` +10, `Integridade` -5, `Legitimidade` -5 |
| **Consequência B** | "O aliado fica na base. A oposição diz que você acoberta o ministro." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-003` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-007 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-008 — Urgência contra crime ambiental

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Urgência contra crime ambiental |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | `ACT-018` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | Seu projeto que endurece a pena por crime ambiental está parado numa comissão da bancada ruralista. Você pode pedir urgência. |
| **Opção A** | Pedir urgência |
| **Efeitos A** | `Soberania` +10, `Segurança` +10, `Capital Político` -15 |
| **Consequência A** | "A pauta trava até a votação. A lei passa, e o agro promete revanche." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-018` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Deixar na comissão |
| **Efeitos B** | `Capital Político` +15, `Soberania` -10, `Segurança` -5 |
| **Consequência B** | "O projeto dorme na comissão. A bancada ruralista apoia seus outros projetos." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-001` +1, `ACT-011` +1, `ACT-018` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-008 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-009 — Jabuti no projeto

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Jabuti no projeto |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Azul |
| **Problema** | Seu projeto de carro menos poluente volta da Câmara com um jabuti: um trecho fora do tema. Ele taxa compras pequenas em sites de fora. |
| **Opção A** | Vetar o jabuti |
| **Efeitos A** | `Legitimidade` +10, `Dignidade` +5, `Capital Político` -10, `Soberania` -5 |
| **Consequência A** | "Os sites de fora seguem sem a taxa. A Câmara ameaça derrubar o veto." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-004` -1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Sancionar o texto todo |
| **Efeitos B** | `Caixa` +10, `Soberania` +5, `Legitimidade` -10, `Dignidade` -5 |
| **Consequência B** | "A taxa vale. Lojas do país comemoram, e quem compra online paga mais." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-009 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-010 — PEC da maioridade penal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | PEC da maioridade penal |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | A Câmara vota uma emenda à Constituição que reduz a maioridade penal. Você não pode vetar: só a sua base pode barrar. |
| **Opção A** | Orientar a base contra |
| **Efeitos A** | `Dignidade` +10, `Capital Político` -10, `Legitimidade` -10 |
| **Consequência A** | "A PEC cai na Câmara. Nas ruas, muita gente cobra mais rigor." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-013` +1, `ACT-024` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Liberar a base |
| **Efeitos B** | `Segurança` +10, `Legitimidade` +5, `Dignidade` -10 |
| **Consequência B** | "A PEC é promulgada. Adolescentes já podem ir para presídios de adultos." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-011` +1, `ACT-013` -1 |
| **Evento B** | "Facções recrutam os adolescentes nos presídios" · atraso 2 · `Segurança` -10, `Dignidade` -5 |
| **Aprendizado** | APR-010 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-011 — Escola sem Partido

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Escola sem Partido |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | O Congresso aprova o Escola sem Partido: o professor não pode dar opinião política em aula. Se você não vetar no prazo, a lei vale. |
| **Opção A** | Vetar a lei |
| **Efeitos A** | `Consciência` +10, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "Professores comemoram. Os autores da lei prometem derrubar o veto." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-013` +1, `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Deixar o prazo correr |
| **Efeitos B** | `Capital Político` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência B** | "O prazo acaba, e a lei vale sem a sua assinatura. Professores protestam." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-012` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-011 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-012 — Decreto das armas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Decreto das armas |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Senado Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Seu decreto limita a compra de armas por atiradores e caçadores. A Câmara aprova um projeto que derruba o decreto. Falta o Senado. |
| **Opção A** | Defender o decreto |
| **Efeitos A** | `Segurança` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência A** | "O Senado mantém o decreto. A bancada da bala trava seus projetos." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-014` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Afrouxar o decreto |
| **Efeitos B** | `Capital Político` +10, `Segurança` -5, `Integridade` -5 |
| **Consequência B** | "O Congresso engaveta o projeto. Atiradores voltam a comprar mais armas." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-001` +1, `ACT-011` +1, `ACT-014` -1 |
| **Evento B** | "O crime compra armas desviadas de clubes de tiro" · atraso 2 · `Segurança` -10, `Integridade` -5 |
| **Aprendizado** | APR-012 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-013 — Venda dos Correios

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Venda dos Correios |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Laranja |
| **Problema** | Você vetou a venda dos Correios. Uma gigante estrangeira de entregas quer comprar, e o Congresso se reúne para derrubar o veto. |
| **Opção A** | Liberar emendas pelo veto |
| **Efeitos A** | `Soberania` +10, `Dignidade` +5, `Caixa` -15, `Integridade` -5 |
| **Consequência A** | "O veto se mantém. Os Correios seguem públicos, e as emendas saem do caixa." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-009` +1, `ACT-011` +1, `ACT-002` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar a derrubada |
| **Efeitos B** | `Caixa` +15, `Capital Político` +5, `Soberania` -15 |
| **Consequência B** | "O veto cai. A gigante estrangeira compra os Correios." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-002` +1, `ACT-009` -1 |
| **Evento B** | "A nova dona fecha agências em cidades pequenas" · atraso 1 · `Dignidade` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-013 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-014 — Acordo com o banco

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Acordo com o banco |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Senado Federal |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | A CPI conclui que um banco lesou aposentados com empréstimos falsos. O banco oferece devolver parte do dinheiro se não for processado. |
| **Opção A** | Processar o banco |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Dignidade` -5, `Caixa` -5 |
| **Consequência A** | "O processo começa. Os aposentados esperam anos pelo dinheiro." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-023` +1, `ACT-002` -1 |
| **Evento A** | "A Justiça condena o banco a devolver tudo" · atraso 2 · `Dignidade` +10 |
| **Opção B** | Aceitar o acordo |
| **Efeitos B** | `Dignidade` +10, `Capital Político` +5, `Integridade` -10 |
| **Consequência B** | "Os aposentados recebem parte do dinheiro. Ninguém do banco é punido." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-002` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-014 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-015 — Ocupação como terrorismo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ocupação como terrorismo |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | A Câmara vota um projeto que trata ocupação de terra e de prédio como terrorismo. Sua base pode obstruir e deixar a sessão sem quórum. |
| **Opção A** | Obstruir a votação |
| **Efeitos A** | `Dignidade` +10, `Capital Político` -10, `Segurança` -5 |
| **Consequência A** | "Sem quórum, o projeto sai da pauta. Ruralistas dizem que você protege invasores." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-016` +1, `ACT-017` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Liberar a votação |
| **Efeitos B** | `Capital Político` +10, `Segurança` +5, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "O projeto passa. Ocupar terra ou prédio vazio vira terrorismo." |
| **Eixo B** | [+1, 0, 0, -2] |
| **Atores B** | `ACT-001` +1, `ACT-016` -1, `ACT-017` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-015 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-016 — Licença-paternidade

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Licença-paternidade |
| **Tipo** | Institucional |
| **Modo** | Congresso |
| **Quem fala** | `ACT-015` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Pais ganham poucos dias de licença quando o filho nasce. Você quer ampliar: por medida provisória ou por projeto de lei? |
| **Opção A** | Usar medida provisória |
| **Efeitos A** | `Dignidade` +10, `Caixa` -5, `Capital Político` -10 |
| **Consequência A** | "A licença maior vale hoje. O Congresso reclama da medida provisória." |
| **Eixo A** | [0, 0, +1, -1] |
| **Atores A** | `ACT-015` +1, `ACT-004` -1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Enviar projeto de lei |
| **Efeitos B** | `Capital Político` +5, `Legitimidade` -5 |
| **Consequência B** | "O projeto entra na fila do Congresso. Os pais seguem com poucos dias." |
| **Eixo B** | [0, 0, +1, 0] |
| **Atores B** | `ACT-011` +1, `ACT-015` -1 |
| **Evento B** | "O Congresso aprova a licença, com menos dias" · atraso 1 · `Dignidade` +5, `Caixa` -5 |
| **Aprendizado** | APR-016 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-017 — Assinaturas pelo SUS

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
| **Status** | pendente de revisão (D-196) |

### INST-018 — Crime que não prescreve

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
| **Status** | pendente de revisão (D-196) |

### INST-019 — Destaque na lei da IA

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
| **Status** | pendente de revisão (D-196) |

### INST-020 — Limite ao salário mínimo

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
| **Status** | pendente de revisão (D-196) |

---

## 17.03 — Cartas do Modo Orçamento (20)

### INST-021 — Corte na Saúde

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte na saúde |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Laranja |
| **Problema** | O orçamento está estourado. Você precisa cortar R$ 50 bilhões. Onde? |
| **Opção A** | Cortar da dívida |
| **Efeitos A** | `Capital Político` -20, `Caixa` +30, `Integridade` +5 |
| **Consequência A** | "Os credores entram em pânico. O Congresso bloqueia. Mas o povo aplaude." |
| **Eixo A** | [-2, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Cortar da saúde |
| **Efeitos B** | `Dignidade` -15, `Caixa` +20, `Integridade` -5 |
| **Consequência B** | "A fila do hospital aumenta. A mortalidade infantil sobe." |
| **Eixo B** | [+2, 0, 0, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-021 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-022 — Dívida Pública

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Dívida pública |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-006` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | A dívida pública consome 40% do orçamento. Os credores pressionam por mais. |
| **Opção A** | Renegociar a dívida |
| **Efeitos A** | `Soberania` +10, `Caixa` +20, `Capital Político` -15 |
| **Consequência A** | "Os credores reagem. Mas o governo respira." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Pagar em dia |
| **Efeitos B** | `Caixa` -20, `Capital Político` +10, `Dignidade` -5 |
| **Consequência B** | "Os credores ficam satisfeitos. O povo paga a conta." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-022 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-023 — Furar o teto

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
| **Status** | pendente de revisão (D-196) |

### INST-024 — Bloqueio das emendas

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
| **Status** | pendente de revisão (D-196) |

### INST-025 — Juros do Plano Safra

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
| **Status** | pendente de revisão (D-196) |

### INST-026 — Quem paga a conta

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
| **Status** | pendente de revisão (D-196) |

### INST-027 — Piso da educação

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
| **Status** | pendente de revisão (D-196) |

### INST-028 — Edital na gaveta

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
| **Status** | pendente de revisão (D-196) |

### INST-029 — Fila do Bolsa Família

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fila do Bolsa Família |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Famílias que cumprem as regras esperam na fila do Bolsa Família. Zerar a fila pede verba extra, tirada de outra área. |
| **Opção A** | Zerar a fila |
| **Efeitos A** | `Dignidade` +20, `Caixa` -15, `Capital Político` -5 |
| **Consequência A** | "As famílias entram no programa. Outros ministérios perdem verba e reclamam." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-016` +1, `ACT-007` -1 |
| **Evento A** | "O comércio dos bairros pobres vende mais" · atraso 2 · `Caixa` +5, `Dignidade` +5 |
| **Opção B** | Manter a fila |
| **Efeitos B** | `Caixa` +10, `Dignidade` -15, `Legitimidade` -5 |
| **Consequência B** | "As contas fecham. Na fila, as famílias seguem sem renda." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-007` +1, `ACT-006` +1, `ACT-016` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-029 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-030 — Tabela do SUS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Tabela do SUS |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Hospitais que atendem pelo SUS recebem por uma tabela sem reajuste há anos. Muitos fecham leitos. Reajustar custa caro. |
| **Opção A** | Reajustar a tabela |
| **Efeitos A** | `Dignidade` +15, `Caixa` -15 |
| **Consequência A** | "Os leitos reabrem. A equipe econômica pede corte em outra área." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-014` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Comprar vagas privadas |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -5, `Caixa` -10 |
| **Consequência B** | "As filas andam rápido. Os hospitais do SUS seguem sem verba." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-002` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-030 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-031 — Trem-bala ou ônibus

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Trem-bala ou ônibus |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-003` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Roxo |
| **Problema** | Uma potência estrangeira oferece crédito para um trem-bala entre duas capitais. A mesma verba renovaria os ônibus das periferias. |
| **Opção A** | Fazer o trem-bala |
| **Efeitos A** | `Capital Político` +10, `Soberania` -5, `Caixa` -10 |
| **Consequência A** | "A obra vira vitrine do governo. A dívida com a potência cresce." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-003` +1, `ACT-021` +1 |
| **Evento A** | "A obra atrasa e o custo sobe" · atraso 2 · `Caixa` -10, `Integridade` -5 |
| **Opção B** | Ônibus na periferia |
| **Efeitos B** | `Dignidade` +15, `Capital Político` -10, `Caixa` -5 |
| **Consequência B** | "Corredores de ônibus chegam aos bairros. Ninguém inaugura nada vistoso." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-016` +1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-031 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-032 — Carro-pipa ou cisterna

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Carro-pipa ou cisterna |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Amarelo |
| **Problema** | A seca volta ao sertão. Deputados pedem carros-pipa, que eles mesmos distribuem. Cisternas resolvem por anos, mas demoram. |
| **Opção A** | Construir cisternas |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "As cisternas ficam prontas devagar. Os deputados perdem o carro-pipa." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-017` +1, `ACT-011` -1 |
| **Evento A** | "A seca seguinte castiga menos" · atraso 2 · `Dignidade` +10 |
| **Opção B** | Mandar carros-pipa |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Integridade` -5 |
| **Consequência B** | "A água chega rápido, com o nome dos deputados no caminhão." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-017` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-032 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-033 — Benefícios ligados ao mínimo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Benefícios ligados ao mínimo |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Aposentadorias e benefícios sobem junto com o salário mínimo. A equipe econômica quer soltar um do outro para conter o gasto. |
| **Opção A** | Manter a ligação |
| **Efeitos A** | `Dignidade` +10, `Caixa` -15 |
| **Consequência A** | "Os aposentados mantêm o ganho. O mercado vê o gasto subir todo ano." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-015` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Desvincular |
| **Efeitos B** | `Caixa` +15, `Dignidade` -15, `Legitimidade` -5 |
| **Consequência B** | "O gasto cresce menos. Os benefícios ficam para trás do salário." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-006` +1, `ACT-007` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-033 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-034 — Juros do Banco Central

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Juros do Banco Central |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-002` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Os juros altos encarecem a dívida pública e travam empregos. O Banco Central, que é autônomo, não quer baixar. |
| **Opção A** | Cobrar o Banco Central |
| **Efeitos A** | `Capital Político` +10, `Caixa` -10 |
| **Consequência A** | "Sua base aplaude. O mercado lê ameaça à autonomia do banco." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-015` +1, `ACT-002` -1, `ACT-006` -1 |
| **Evento A** | "O dólar sobe com a briga" · atraso 1 · `Caixa` -10, `Soberania` -5 |
| **Opção B** | Respeitar a autonomia |
| **Efeitos B** | `Caixa` +10, `Dignidade` -10, `Capital Político` -5 |
| **Consequência B** | "Os juros seguem altos. O emprego demora a voltar." |
| **Eixo B** | [+1, 0, 0, +1] |
| **Atores B** | `ACT-006` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-034 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-035 — CAPS ou internação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | CAPS ou internação |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Há verba para cuidar de quem sofre com álcool e drogas. Os CAPS tratam em liberdade; as comunidades terapêuticas internam. |
| **Opção A** | Ampliar os CAPS |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10 |
| **Consequência A** | "A rede cresce perto de casa. Pastores dizem que você larga as famílias." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-014` +1, `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Pagar as comunidades |
| **Efeitos B** | `Capital Político` +10, `Integridade` -5, `Dignidade` -5 |
| **Consequência B** | "Igrejas recebem a verba. Fiscais pedem regras para as internações." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-012` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-035 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-036 — Presídios lotados

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Presídios lotados |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Vermelho |
| **Problema** | Os presídios estão lotados. Parte da Câmara quer verba para novas vagas; outra parte, penas fora da prisão para crimes leves. |
| **Opção A** | Construir presídios |
| **Efeitos A** | `Segurança` +10, `Capital Político` +5, `Caixa` -15 |
| **Consequência A** | "As obras começam, e as prisões seguem no mesmo ritmo." |
| **Eixo A** | [0, 0, -1, -1] |
| **Atores A** | `ACT-003` +1, `ACT-011` +1 |
| **Evento A** | "Os novos presídios também lotam" · atraso 2 · `Segurança` -10, `Dignidade` -5 |
| **Opção B** | Penas alternativas |
| **Efeitos B** | `Dignidade` +10, `Caixa` +5, `Capital Político` -10, `Segurança` -5 |
| **Consequência B** | "Menos gente entra na cadeia. A oposição diz que você solta criminosos." |
| **Eixo B** | [0, 0, +1, +1] |
| **Atores B** | `ACT-011` -1, `ACT-014` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-036 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-037 — Creches inacabadas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Creches inacabadas |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Há creches com obra parada em várias cidades. Terminar não rende foto. Um programa novo, com a sua marca, rende. |
| **Opção A** | Terminar as obras |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "As creches abrem sem festa. Mães voltam a trabalhar." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-013` +1, `ACT-003` +1 |
| **Evento A** | — |
| **Opção B** | Lançar programa novo |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` +5, `Caixa` -10, `Integridade` -5 |
| **Consequência B** | "A festa de lançamento lota. As obras antigas seguem paradas." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-037 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-038 — Isenção das montadoras

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Isenção das montadoras |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Montadoras estrangeiras pagam menos imposto há anos e pedem renovação. Ameaçam fechar fábricas se o benefício acabar. |
| **Opção A** | Cortar a isenção |
| **Efeitos A** | `Caixa` +15, `Dignidade` -5, `Capital Político` -10 |
| **Consequência A** | "O Tesouro arrecada mais. Uma fábrica anuncia demissões." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-004` -1, `ACT-015` -1 |
| **Evento A** | — |
| **Opção B** | Renovar a isenção |
| **Efeitos B** | `Capital Político` +5, `Dignidade` +5, `Caixa` -15 |
| **Consequência B** | "As fábricas ficam. O imposto que não entra faz falta na saúde." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-015` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-038 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-039 — Isenção que ninguém vê

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Isenção que ninguém vê |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Montadoras pedem renovar uma isenção de imposto. Ela não aparece como gasto no orçamento, mas tira verba de escolas e postos. |
| **Opção A** | Cortar a isenção |
| **Efeitos A** | `Caixa` +15, `Dignidade` +5, `Capital Político` -10 |
| **Consequência A** | "A verba volta ao orçamento. As montadoras ameaçam cortar vagas." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-004` -1, `ACT-007` +1 |
| **Evento A** | "Uma montadora fecha uma fábrica e culpa o governo." · atraso 1 · `Legitimidade` -10 |
| **Opção B** | Renovar a isenção |
| **Efeitos B** | `Capital Político` +10, `Caixa` -15, `Integridade` -5 |
| **Consequência B** | "As fábricas ficam. A conta some do orçamento, mas não do Tesouro." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-015` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-039 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-040 — Teto do imposto sobre herança

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Teto do imposto sobre herança |
| **Tipo** | Institucional |
| **Modo** | Orçamento |
| **Quem fala** | Senado Federal |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | O imposto sobre herança é dos estados, mas o Senado fixa o teto. Governadores pedem um teto maior para heranças grandes. |
| **Opção A** | Apoiar o teto maior |
| **Efeitos A** | `Dignidade` +10, `Caixa` +10, `Capital Político` -15 |
| **Consequência A** | "Os estados ganham receita. Famílias ricas correm para doar em vida." |
| **Eixo A** | [-2, 0, 0, 0] |
| **Atores A** | `ACT-002` -1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Manter o teto |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Caixa` -5 |
| **Consequência B** | "Nada muda. Grandes fortunas passam de geração em geração quase intactas." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-002` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-040 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

## 17.04 — Cartas do Modo Currículo e Mídia (20)

### INST-041 — Retirada de Filosofia/Sociologia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Retirada de Filosofia |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | O Congresso propõe retirar Filosofia e Sociologia do currículo obrigatório. A bancada evangélica apoia. |
| **Opção A** | Vetar a proposta |
| **Efeitos A** | `Consciência` +15, `Integridade` +10, `Capital Político` -20 |
| **Consequência A** | "Os professores comemoram. Mas o Congresso ameaça retaliar." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Apoiar a proposta |
| **Efeitos B** | `Capital Político` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência B** | "A lei passa. Os alunos aprendem 'educação financeira' em vez de pensar." |
| **Eixo B** | [0, 0, -2, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-041 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-042 — Concessão de TV para Pastor

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Concessão de TV |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Uma rede de TV controlada por um pastor pede renovação de concessão. Ele promete apoio em troca. |
| **Opção A** | Renovar com pluralidade |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "A emissora aceita, mas faz campanha velada contra você." |
| **Eixo A** | [0, 0, +1, -1] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Renovar sem condições |
| **Efeitos B** | `Capital Político` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência B** | "A TV elogia seu governo. Mas o que ela mostra não é a realidade." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-042 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-043 — Aula contra o abuso

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aula contra o abuso |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Escolas querem ensinar crianças a reconhecer abuso e a pedir ajuda. Pastores dizem que é educação sexual e pedem para barrar. |
| **Opção A** | Manter as aulas |
| **Efeitos A** | `Consciência` +10, `Segurança` +10, `Capital Político` -10 |
| **Consequência A** | "As crianças aprendem a quem contar. Pastores acusam o governo nos cultos." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-012` -1, `ACT-013` +1, `ACT-014` +1 |
| **Evento A** | — |
| **Opção B** | Barrar as aulas |
| **Efeitos B** | `Capital Político` +15, `Consciência` -10, `Segurança` -10 |
| **Consequência B** | "Os pastores comemoram. O tema sai da escola e volta ao silêncio." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-012` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-043 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-044 — Mentira no telejornal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Mentira no telejornal |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Vermelho |
| **Problema** | Um telejornal diz que a vacina do governo causa doença grave. É falso. Aliados pedem cassar a concessão; a lei prevê direito de resposta. |
| **Opção A** | Pedir direito de resposta |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "A correção vai ao ar. Muita gente já tinha visto a mentira." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Pedir a cassação |
| **Efeitos B** | `Consciência` +5, `Legitimidade` -15, `Integridade` -5 |
| **Consequência B** | "A emissora vira vítima no ar. O processo de cassação leva anos." |
| **Eixo B** | [0, 0, 0, -2] |
| **Atores B** | `ACT-023` -1, `ACT-024` +1 |
| **Evento B** | "Outras emissoras falam em censura e se unem contra você." · atraso 1 · `Legitimidade` -10, `Capital Político` -5 |
| **Aprendizado** | APR-044 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-045 — Livro didático recolhido

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Livro didático recolhido |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Deputados pedem recolher um livro didático que mostra famílias de vários tipos. Técnicos o escolheram por avaliação pública. |
| **Opção A** | Manter o livro |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5, `Capital Político` -15 |
| **Consequência A** | "O livro fica. A bancada religiosa trava dois projetos seus." |
| **Eixo A** | [0, 0, +2, 0] |
| **Atores A** | `ACT-012` -1, `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Recolher o livro |
| **Efeitos B** | `Capital Político` +10, `Consciência` -10, `Caixa` -5 |
| **Consequência B** | "Os livros voltam ao depósito. Alunos de famílias diferentes somem da página." |
| **Eixo B** | [0, 0, -2, -1] |
| **Atores B** | `ACT-012` +1, `ACT-011` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-045 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-046 — TV pública à venda

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | TV pública à venda |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Azul |
| **Problema** | A equipe econômica quer vender a TV pública a um grupo estrangeiro. Ela leva notícia a cidades sem emissora local. |
| **Opção A** | Manter com conselho |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Caixa` -10 |
| **Consequência A** | "A TV fica, com conselho de fora do governo. O prejuízo segue no caixa." |
| **Eixo A** | [-1, -1, 0, +1] |
| **Atores A** | `ACT-007` -1, `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Vender a emissora |
| **Efeitos B** | `Caixa` +15, `Consciência` -10, `Soberania` -5 |
| **Consequência B** | "O caixa respira. O novo dono corta o jornal local." |
| **Eixo B** | [+2, +1, 0, 0] |
| **Atores B** | `ACT-007` +1, `ACT-006` +1 |
| **Evento B** | "Cidades do interior ficam sem telejornal local." · atraso 2 · `Consciência` -10 |
| **Aprendizado** | APR-046 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-047 — Alfabetizar adultos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Alfabetizar adultos |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 3 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Muitos adultos não sabem ler. Professores propõem círculos que partem da vida do aluno. Uma empresa oferece apostilas prontas. |
| **Opção A** | Apoiar os círculos |
| **Efeitos A** | `Dignidade` +10, `Consciência` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "Adultos leem a conta de luz. Críticos dizem que o método doutrina." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-013` +1, `ACT-005` -1 |
| **Evento A** | — |
| **Opção B** | Comprar as apostilas |
| **Efeitos B** | `Caixa` -10, `Consciência` +5, `Integridade` -5 |
| **Consequência B** | "As apostilas chegam rápido. Muitos alunos desistem no meio." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-005` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-047 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-048 — Rádio da quebrada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Rádio da quebrada |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Rádios comunitárias da periferia esperam licença há anos. Sem ela, a fiscalização fecha a rádio e leva o transmissor. |
| **Opção A** | Agilizar as licenças |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "As rádios saem da sombra. Deputados donos de emissoras reclamam." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-016` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Manter a fila |
| **Efeitos B** | `Capital Político` +10, `Consciência` -10, `Legitimidade` -5 |
| **Consequência B** | "A fila segue. Mais um transmissor apreendido no bairro." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-011` +1, `ACT-016` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-048 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-049 — Aula de finanças do banco

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aula de finanças do banco |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-006` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Azul |
| **Problema** | Um banco estrangeiro oferece às escolas material grátis de educação financeira. O material traz a marca do banco e indica seus produtos. |
| **Opção A** | Recusar o material |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Caixa` -10 |
| **Consequência A** | "A rede faz o próprio material, mais devagar e mais caro." |
| **Eixo A** | [-1, -1, 0, +1] |
| **Atores A** | `ACT-002` -1, `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Aceitar o material |
| **Efeitos B** | `Caixa` +10, `Consciência` -10, `Integridade` -5 |
| **Consequência B** | "As aulas começam já. O logo do banco vira parte do caderno." |
| **Eixo B** | [+2, +1, 0, -1] |
| **Atores B** | `ACT-002` +1, `ACT-022` +1 |
| **Evento B** | "Alunos endividados com o cartão do banco viram notícia." · atraso 2 · `Dignidade` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-049 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-050 — Coach na aula de cidadania

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Coach na aula de cidadania |
| **Tipo** | Institucional |
| **Modo** | Currículo e Mídia |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Vermelho |
| **Problema** | O MEC pode pagar um coach famoso por um curso de cidadania em vídeo nas escolas. Professores querem fazer o próprio curso. |
| **Opção A** | Contratar o coach |
| **Efeitos A** | `Capital Político` +10, `Caixa` -10, `Consciência` -5 |
| **Consequência A** | "O vídeo viraliza. Os professores se sentem trocados." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-022` +1, `ACT-013` -1 |
| **Evento A** | "O coach usa o curso para vender mentoria aos alunos." · atraso 1 · `Integridade` -10, `Consciência` -5 |
| **Opção B** | Curso dos professores |
| **Efeitos B** | `Consciência` +10, `Caixa` -5, `Legitimidade` -5 |
| **Consequência B** | "O curso é bom, mas poucos assistem fora da sala." |
| **Eixo B** | [-1, 0, 0, +1] |
| **Atores B** | `ACT-013` +1, `ACT-022` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-050 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-051 — Documentário sobre a ditadura

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

### INST-052 — Emissora critica o governo

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

### INST-053 — História negra na escola

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

### INST-054 — Perfil de jornalista derrubado

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

### INST-055 — Escola em tempo integral

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

### INST-056 — Aula sobre o poder

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

### INST-057 — Piada racista na TV

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

### INST-058 — Multa por linguagem neutra

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

### INST-059 — Bibliotecas de bairro

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

### INST-060 — Denúncia contra professores

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

## 17.05 — Cartas do Modo Geopolítico (20)

### INST-061 — Adesão ao BRICS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Adesão ao BRICS |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | O BRICS propõe um sistema de pagamento em moedas locais. Os EUA ameaçam retaliações. |
| **Opção A** | Aderir |
| **Efeitos A** | `Soberania` +15, `Integridade` +5, `Caixa` -5 |
| **Consequência A** | "O Brasil reduz a dependência do dólar. Mas os EUA ameaçam tarifas." |
| **Eixo A** | [0, -1, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Recusar |
| **Efeitos B** | `Caixa` +10, `Soberania` -15, `Integridade` -5 |
| **Consequência B** | "Os EUA elogiam o Brasil. Mas o país continua vulnerável a sanções." |
| **Eixo B** | [0, +1, 0, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-061 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-062 — Venda de Lítio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Venda de lítio |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-021` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Uma potência estrangeira oferece bilhões pela reserva de lítio. O BRICS quer desenvolver a cadeia local. |
| **Opção A** | Desenvolver com o BRICS |
| **Efeitos A** | `Soberania` +15, `Caixa` -10, `Integridade` +5 |
| **Consequência A** | "O lítio fica no Brasil. A cadeia produtiva se desenvolve." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Vender |
| **Efeitos B** | `Caixa` +25, `Soberania` -20, `Integridade` -10 |
| **Consequência B** | "O lítio vai embora. O país importa tecnologia." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-062 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-063 — Pressão dos EUA

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pressão dos EUA |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-021` |
| **Ano mínimo** | 1 |
| **Cor A** | Preto |
| **Cor B** | Amarelo |
| **Problema** | Os EUA pedem que o Brasil vete uma empresa chinesa no 5G. Alegam risco de espionagem. Sem ela, a rede fica mais cara. |
| **Opção A** | Vetar a empresa chinesa |
| **Efeitos A** | `Segurança` +10, `Caixa` -10, `Soberania` -5 |
| **Consequência A** | "A rede atrasa e fica mais cara. Os EUA aplaudem." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-021` +1, `ACT-008` +1 |
| **Evento A** | — |
| **Opção B** | Manter a empresa chinesa |
| **Efeitos B** | `Caixa` +10, `Dignidade` +5, `Segurança` -10 |
| **Consequência B** | "O 5G chega mais barato. Os EUA ameaçam rever a parceria." |
| **Eixo B** | [+1, -1, 0, 0] |
| **Atores B** | `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-063 (doc 18) |
| **Status** | provisório (DP-022) |

### INST-064 — Acordo com a China

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Acordo com a China |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Vermelho |
| **Problema** | A China oferece um contrato longo de compra de soja e minério. Em troca, quer tarifa zero para seus carros e máquinas. |
| **Opção A** | Fechar o acordo |
| **Efeitos A** | `Caixa` +20, `Capital Político` +5, `Soberania` -10 |
| **Consequência A** | "O agro vende mais. A indústria perde espaço para os importados." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-021` +1, `ACT-004` -1 |
| **Evento A** | "Fábricas fecham diante dos importados chineses." · atraso 2 · `Dignidade` -10, `Soberania` -5 |
| **Opção B** | Proteger a indústria |
| **Efeitos B** | `Soberania` +10, `Dignidade` +5, `Caixa` -10, `Capital Político` -10 |
| **Consequência B** | "As fábricas mantêm os empregos. O agro reclama no Congresso." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-001` -1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-064 (doc 18) |
| **Status** | provisório (DP-022) |

### INST-065 — Empréstimo do FMI

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Empréstimo do FMI |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Roxo |
| **Problema** | A crise seca o caixa do governo. O FMI oferece um empréstimo, mas exige corte de gastos e venda de estatais. |
| **Opção A** | Aceitar o empréstimo |
| **Efeitos A** | `Caixa` +25, `Soberania` -10, `Dignidade` -5 |
| **Consequência A** | "O dinheiro chega. Técnicos do FMI passam a revisar suas contas." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-007` +1, `ACT-006` +1 |
| **Evento A** | "O FMI cobra o corte combinado no orçamento." · atraso 1 · `Dignidade` -10, `Legitimidade` -5 |
| **Opção B** | Recusar o FMI |
| **Efeitos B** | `Soberania` +10, `Caixa` -15, `Dignidade` -5 |
| **Consequência B** | "O dólar sobe. A crise continua sem dinheiro novo." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-007` -1, `ACT-006` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-065 (doc 18) |
| **Status** | provisório (DP-022) |

### INST-066 — Venda da Embraer

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Venda da Embraer |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Uma gigante estrangeira quer comprar a Embraer, que faz aviões civis e militares. Você tem poder de veto. |
| **Opção A** | Vetar a venda |
| **Efeitos A** | `Soberania` +10, `Segurança` +5, `Caixa` -10, `Dignidade` -5 |
| **Consequência A** | "A Embraer segue brasileira. Os acionistas perdem o negócio." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-008` +1, `ACT-002` -1 |
| **Evento A** | — |
| **Opção B** | Liberar a venda |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Soberania` -15, `Segurança` -5 |
| **Consequência B** | "A venda sai. A nova dona decide os projetos lá fora." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-002` +1, `ACT-008` -1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-066 (doc 18) |
| **Status** | provisório (DP-022) |

### INST-067 — Moeda comum do BRICS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Moeda comum do BRICS |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Um sócio do BRICS defende uma moeda comum. O Brasil dependeria menos do dólar, mas deixaria de decidir os próprios juros. |
| **Opção A** | Apoiar a moeda comum |
| **Efeitos A** | `Caixa` +10, `Soberania` -10, `Legitimidade` -5 |
| **Consequência A** | "O comércio sai do dólar. Um banco do bloco passa a decidir seus juros." |
| **Eixo A** | [0, -1, 0, 0] |
| **Atores A** | `ACT-021` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Manter o real |
| **Efeitos B** | `Soberania` +5, `Caixa` -10 |
| **Consequência B** | "O real fica. O comércio segue em dólar." |
| **Eixo B** | [0, +1, 0, 0] |
| **Atores B** | `ACT-006` +1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-067 (doc 18) |
| **Status** | provisório (DP-022) |

### INST-068 — Envio de tropas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Envio de tropas |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Amarelo |
| **Problema** | Uma potência aliada pede soldados brasileiros para uma guerra. Em troca, apoia uma vaga fixa do Brasil no Conselho de Segurança da ONU. |
| **Opção A** | Enviar os soldados |
| **Efeitos A** | `Caixa` +15, `Capital Político` +5, `Soberania` -10, `Legitimidade` -5 |
| **Consequência A** | "As tropas embarcam. Parte do país protesta contra a guerra." |
| **Eixo A** | [0, +2, 0, 0] |
| **Atores A** | `ACT-008` +1, `ACT-021` +1 |
| **Evento A** | "Soldados brasileiros morrem no conflito." · atraso 1 · `Legitimidade` -10, `Dignidade` -5 |
| **Opção B** | Recusar o pedido |
| **Efeitos B** | `Soberania` +10, `Legitimidade` +5, `Caixa` -10, `Segurança` -5 |
| **Consequência B** | "O Brasil fica fora da guerra. O aliado corta a ajuda militar." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-010` +1, `ACT-008` -1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-068 (doc 18) |
| **Status** | provisório (DP-022) |

### INST-069 — Corte de fertilizantes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Corte de fertilizantes |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 2 |
| **Cor A** | Verde |
| **Cor B** | Roxo |
| **Problema** | Uma guerra corta o adubo importado. Uma mineradora quer extrair potássio em terra reivindicada por povos indígenas na Amazônia. |
| **Opção A** | Liberar a mina |
| **Efeitos A** | `Soberania` +15, `Dignidade` -10, `Integridade` -5 |
| **Consequência A** | "O potássio sai do chão, sem consulta. Povos indígenas vão à Justiça." |
| **Eixo A** | [+1, -1, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-018` -1 |
| **Evento A** | — |
| **Opção B** | Produzir adubo orgânico |
| **Efeitos B** | `Soberania` +5, `Caixa` -10, `Capital Político` -10 |
| **Consequência B** | "O agro reclama da demora. Cooperativas do campo começam a produzir." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-017` +1, `ACT-001` -1 |
| **Evento B** | "Cooperativas produzem adubo orgânico em escala." · atraso 2 · `Soberania` +10, `Dignidade` +5 |
| **Aprendizado** | APR-069 (doc 18) |
| **Status** | provisório (DP-022) |

### INST-070 — Preço do petróleo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Preço do petróleo |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-009` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Vermelho |
| **Problema** | O barril de petróleo dispara no mundo. A Petrobras pode repassar a alta ou segurar o preço do diesel. |
| **Opção A** | Repassar o preço |
| **Efeitos A** | `Caixa` +15, `Dignidade` -10 |
| **Consequência A** | "O diesel sobe. O frete e a comida ficam mais caros." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-006` +1, `ACT-002` +1 |
| **Evento A** | "Caminhoneiros entram em greve e param o país." · atraso 1 · `Dignidade` -5, `Segurança` -5, `Legitimidade` -5 |
| **Opção B** | Segurar o diesel |
| **Efeitos B** | `Dignidade` +10, `Caixa` -15 |
| **Consequência B** | "O diesel fica estável. A Petrobras lucra menos e o Mercado reclama." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-009` +1, `ACT-006` -1, `ACT-002` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-070 (doc 18) |
| **Status** | provisório (DP-022) |

### INST-071 — Taxação das big techs

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Taxação das big techs |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-020` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Sua equipe propõe um imposto sobre o faturamento das big techs no Brasil. Os EUA ameaçam tarifas em resposta. |
| **Opção A** | Cobrar o imposto |
| **Efeitos A** | `Soberania` +10, `Caixa` +10, `Dignidade` -5, `Capital Político` -10 |
| **Consequência A** | "As big techs pagam. Os EUA anunciam tarifas sobre produtos do Brasil." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-020` -1, `ACT-021` -1 |
| **Evento A** | — |
| **Opção B** | Desistir do imposto |
| **Efeitos B** | `Caixa` +5, `Capital Político` +5, `Soberania` -10, `Legitimidade` -5 |
| **Consequência B** | "As tarifas não vêm. As big techs ficam sem o novo imposto." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-020` +1, `ACT-021` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-071 (doc 18) |
| **Status** | provisório (DP-022) |

### INST-072 — Energia de Itaipu

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Energia de Itaipu |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 1 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | O Paraguai pede um preço maior pela energia de Itaipu que vende ao Brasil. Pagar mais encarece a conta de luz. |
| **Opção A** | Aceitar o novo preço |
| **Efeitos A** | `Soberania` +5, `Integridade` +5, `Dignidade` -5, `Caixa` -5 |
| **Consequência A** | "O vizinho comemora. A conta de luz sobe no Brasil." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-010` +1, `ACT-004` -1 |
| **Evento A** | — |
| **Opção B** | Manter o preço atual |
| **Efeitos B** | `Dignidade` +5, `Caixa` +5, `Integridade` -5, `Soberania` -5 |
| **Consequência B** | "A conta de luz não sobe. O Paraguai diz que o Brasil abusa do seu tamanho." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-010` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-072 (doc 18) |
| **Status** | provisório (DP-022) |

### INST-073 — Terras para estrangeiros

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Terras para estrangeiros |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Roxo |
| **Problema** | O Congresso libera a compra de terras por estrangeiros. Fundos de fora negociam fazendas de soja. Falta a sua sanção. |
| **Opção A** | Sancionar a lei |
| **Efeitos A** | `Caixa` +15, `Capital Político` +10, `Soberania` -15 |
| **Consequência A** | "Dinheiro de fora entra no campo. Fazendas de soja mudam de dono." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-021` +1, `ACT-017` -1 |
| **Evento A** | — |
| **Opção B** | Vetar a lei |
| **Efeitos B** | `Soberania` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência B** | "A venda fica barrada. O Congresso ameaça derrubar o seu veto." |
| **Eixo B** | [-1, -1, 0, 0] |
| **Atores B** | `ACT-017` +1, `ACT-011` -1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-073 (doc 18) |
| **Status** | provisório (DP-024) |

### INST-074 — Ajuda militar dos EUA

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ajuda militar dos EUA |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-021` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Amarelo |
| **Problema** | Os EUA, que tratam duas facções como terroristas, oferecem drones e agentes para combatê-las em solo brasileiro. |
| **Opção A** | Aceitar a ajuda |
| **Efeitos A** | `Segurança` +15, `Capital Político` +5, `Soberania` -15, `Dignidade` -5 |
| **Consequência A** | "Drones vigiam as rotas do crime. Agentes dos EUA atuam no país." |
| **Eixo A** | [0, +1, -1, -1] |
| **Atores A** | `ACT-021` +1, `ACT-010` -1 |
| **Evento A** | "Agentes dos EUA fazem uma operação sem avisar a PF." · atraso 1 · `Soberania` -10, `Legitimidade` -5 |
| **Opção B** | Recusar a ajuda |
| **Efeitos B** | `Soberania` +10, `Capital Político` -10, `Segurança` -5 |
| **Consequência B** | "As facções seguem como caso de polícia. Os EUA cortam a cooperação." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-010` +1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-074 (doc 18) |
| **Status** | provisório (DP-024) |

### INST-075 — Adesão à OCDE

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Adesão à OCDE |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-002` |
| **Ano mínimo** | 3 |
| **Cor A** | Azul |
| **Cor B** | Vermelho |
| **Problema** | Os EUA apoiam a entrada do Brasil na OCDE, o 'clube dos países ricos'. Em troca, o Brasil abre mão de vantagens de país em desenvolvimento. |
| **Opção A** | Entrar na OCDE |
| **Efeitos A** | `Caixa` +10, `Integridade` +5, `Soberania` -15 |
| **Consequência A** | "O selo atrai investidores. O país adota as regras de transparência do clube." |
| **Eixo A** | [+1, +1, 0, 0] |
| **Atores A** | `ACT-021` +1, `ACT-002` +1, `ACT-010` -1 |
| **Evento A** | — |
| **Opção B** | Manter as vantagens |
| **Efeitos B** | `Soberania` +10, `Caixa` -10 |
| **Consequência B** | "O Brasil fica fora do clube. O mercado diz que o país perdeu uma chance." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-010` +1, `ACT-021` -1, `ACT-002` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-075 (doc 18) |
| **Status** | provisório (DP-024) |

### INST-076 — Acesso a vacinas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Acesso a vacinas |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Uma pandemia chega. A farmacêutica dona da vacina cobra um preço alto. A lei permite quebrar a patente, mas os EUA ameaçam sanções. |
| **Opção A** | Quebrar a patente |
| **Efeitos A** | `Soberania` +10, `Dignidade` -10, `Caixa` -5 |
| **Consequência A** | "A produção nacional leva meses. Os EUA aplicam sanções ao Brasil." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-014` +1, `ACT-021` -1 |
| **Evento A** | "O laboratório público entrega a vacina a todos." · atraso 1 · `Dignidade` +10 |
| **Opção B** | Pagar o preço cobrado |
| **Efeitos B** | `Dignidade` +10, `Caixa` -15, `Soberania` -5 |
| **Consequência B** | "A vacinação começa. O SUS corta outras despesas para pagar a conta." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-021` +1, `ACT-006` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-076 (doc 18) |
| **Status** | provisório (DP-024) |

### INST-077 — Base de foguetes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Base de foguetes |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Roxo |
| **Problema** | Uma potência quer alugar a base de foguetes do Maranhão. Para isso, a base precisa crescer sobre terras quilombolas. |
| **Opção A** | Expandir a base |
| **Efeitos A** | `Caixa` +20, `Soberania` -10, `Dignidade` -10 |
| **Consequência A** | "Foguetes estrangeiros sobem. Famílias quilombolas perdem suas terras." |
| **Eixo A** | [0, +1, -1, 0] |
| **Atores A** | `ACT-021` +1, `ACT-008` +1, `ACT-017` -1 |
| **Evento A** | "Os quilombolas levam o caso a uma corte internacional." · atraso 2 · `Legitimidade` -10, `Integridade` -5 |
| **Opção B** | Proteger os quilombos |
| **Efeitos B** | `Dignidade` +10, `Legitimidade` +5, `Caixa` -10 |
| **Consequência B** | "As famílias ficam. Sem o aluguel, o programa espacial segue sem dinheiro." |
| **Eixo B** | [0, -1, +1, 0] |
| **Atores B** | `ACT-017` +1, `ACT-021` -1, `ACT-008` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-077 (doc 18) |
| **Status** | provisório (DP-024) |

### INST-078 — Banco do BRICS

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Banco do BRICS |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Para levar esgoto às periferias, o Banco do BRICS oferece crédito. O Banco Mundial empresta mais, mas exige subir a conta de água. |
| **Opção A** | Pegar com o BRICS |
| **Efeitos A** | `Soberania` +5, `Dignidade` +5, `Caixa` -10 |
| **Consequência A** | "A obra chega a menos bairros. Parte do custo sai do seu caixa." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-016` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar o Banco Mundial |
| **Efeitos B** | `Dignidade` +10, `Caixa` +5, `Soberania` -5, `Legitimidade` -5 |
| **Consequência B** | "O esgoto chega a mais bairros. A conta de água sobe para todos." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-006` +1, `ACT-003` +1, `ACT-016` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-078 (doc 18) |
| **Status** | provisório (DP-024) |

### INST-079 — Asilo ou extradição

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Asilo ou extradição |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Um ex-agente de uma potência revela que ela espiona o governo brasileiro. Ele pede asilo ao Brasil, e a potência exige a entrega dele. |
| **Opção A** | Entregar o ex-agente |
| **Efeitos A** | `Caixa` +10, `Segurança` +5, `Soberania` -10, `Consciência` -5 |
| **Consequência A** | "A potência agradece e prende o ex-agente na chegada." |
| **Eixo A** | [0, +1, 0, -1] |
| **Atores A** | `ACT-021` +1, `ACT-023` -1 |
| **Evento A** | — |
| **Opção B** | Dar asilo a ele |
| **Efeitos B** | `Consciência` +10, `Soberania` +10, `Caixa` -15, `Segurança` -5 |
| **Consequência B** | "Ele publica novos segredos. A potência corta acordos com o Brasil." |
| **Eixo B** | [0, -1, 0, +1] |
| **Atores B** | `ACT-023` +1, `ACT-010` +1, `ACT-021` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-079 (doc 18) |
| **Status** | provisório (DP-024) |

### INST-080 — Golpe no país vizinho

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Golpe no país vizinho |
| **Tipo** | Institucional |
| **Modo** | Geopolítico |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Laranja |
| **Problema** | Militares derrubam o presidente eleito de um sócio do Mercosul e prometem eleições sem data. O país é um grande comprador do Brasil. |
| **Opção A** | Propor a suspensão |
| **Efeitos A** | `Integridade` +10, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "O bloco suspende o vizinho até nova eleição. Exportadores perdem vendas." |
| **Eixo A** | [0, +1, 0, +1] |
| **Atores A** | `ACT-010` +1, `ACT-004` -1 |
| **Evento A** | — |
| **Opção B** | Reconhecer o novo governo |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Integridade` -10 |
| **Consequência B** | "O comércio segue. A oposição do vizinho acusa você de apoiar o golpe." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-004` +1, `ACT-001` +1, `ACT-010` -1 |
| **Evento B** | "O novo governo adia a eleição e prende opositores." · atraso 2 · `Legitimidade` -5, `Integridade` -5 |
| **Aprendizado** | APR-080 (doc 18) |
| **Status** | provisório (DP-024) |

---

## 17.06 — Cartas do Modo Prisional e Policial (20)

### INST-081 — Superlotação Prisional

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Superlotação prisional |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | O sistema prisional está superlotado. Facções controlam os presídios. |
| **Opção A** | Investir em prevenção |
| **Efeitos A** | `Dignidade` +10, `Segurança` -5, `Caixa` -15, `Integridade` +5 |
| **Consequência A** | "A população diz que 'nada foi feito'. Mas menos jovens entram no sistema." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Aumentar o encarceramento |
| **Efeitos B** | `Segurança` +10, `Dignidade` -15, `Caixa` -20, `Integridade` -5 |
| **Consequência B** | "Mais presos. Mais facções. O crime organizado se fortalece." |
| **Eixo B** | [0, 0, -1, -2] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-081 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-082 — Polícia Mata 17 por Dia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Polícia mata 17 por dia |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | A polícia matou 6.243 pessoas em 2024, cerca de 17 por dia. 82% eram negras. |
| **Opção A** | Investigar e punir |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "A investigação começa. As famílias das vítimas finalmente são ouvidas." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Defender a polícia |
| **Efeitos B** | `Segurança` +5, `Dignidade` -15, `Integridade` -5 |
| **Consequência B** | "A impunidade policial continua." |
| **Eixo B** | [0, 0, -1, -2] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-082 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-083 — Porte para uso pessoal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Porte para uso pessoal |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 1 |
| **Cor A** | Verde |
| **Cor B** | Preto |
| **Problema** | A lei não diz quanta droga é uso pessoal. A polícia decide na hora, e jovens com pouca droga são presos como traficantes. |
| **Opção A** | Definir um critério |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "A regra fica clara. Pastores acusam o governo de liberar a droga." |
| **Eixo A** | [0, +1, +1, +1] |
| **Atores A** | `ACT-012` -1, `ACT-014` +1 |
| **Evento A** | — |
| **Opção B** | Manter a lei |
| **Efeitos B** | `Capital Político` +5, `Dignidade` -10, `Caixa` -10 |
| **Consequência B** | "Nada muda. A decisão segue com quem faz a abordagem." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-012` +1 |
| **Evento B** | "Presídios recebem mais jovens presos com pouca droga." · atraso 2 · `Dignidade` -10, `Segurança` -5 |
| **Aprendizado** | APR-083 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-084 — Operação com muitas mortes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Operação com muitas mortes |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Uma operação policial num bairro termina com muitos mortos. O governador comemora; as famílias pedem perícia independente. |
| **Opção A** | Pedir perícia federal |
| **Efeitos A** | `Integridade` +10, `Dignidade` +10, `Capital Político` -15 |
| **Consequência A** | "Peritos federais chegam. O governador diz que você está do lado do crime." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-023` +1, `ACT-019` +1 |
| **Evento A** | — |
| **Opção B** | Apoiar o governador |
| **Efeitos B** | `Segurança` +5, `Capital Político` +5, `Dignidade` -15, `Legitimidade` -5 |
| **Consequência B** | "A operação vira modelo. As famílias seguem sem respostas." |
| **Eixo B** | [0, 0, -1, -2] |
| **Atores B** | `ACT-008` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-084 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-085 — Câmeras nas fardas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Câmeras nas fardas |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Estados pedem verba federal para câmeras nas fardas. Técnicos querem gravação sem pausa; associações de policiais rejeitam. |
| **Opção A** | Exigir gravação contínua |
| **Efeitos A** | `Segurança` +10, `Integridade` +10, `Caixa` -15 |
| **Consequência A** | "As câmeras gravam o turno todo. Policiais reclamam de vigilância." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-007` +1, `ACT-008` -1 |
| **Evento A** | — |
| **Opção B** | Deixar a critério |
| **Efeitos B** | `Capital Político` +10, `Integridade` -10 |
| **Consequência B** | "Cada estado decide. Em muitos, a câmera liga só quando o policial quer." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-008` +1, `ACT-007` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-085 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-086 — Vans da facção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vans da facção |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Uma facção cobra taxa dos motoristas de van e controla as linhas de um bairro. Moradores pedem ônibus que chegue até lá. |
| **Opção A** | Criar linha pública |
| **Efeitos A** | `Dignidade` +10, `Segurança` +5, `Caixa` -15 |
| **Consequência A** | "O ônibus chega ao bairro. A facção perde parte da renda." |
| **Eixo A** | [-1, 0, 0, +1] |
| **Atores A** | `ACT-016` +1 |
| **Evento A** | — |
| **Opção B** | Ocupar com tropas |
| **Efeitos B** | `Segurança` +10, `Caixa` -10, `Dignidade` -10 |
| **Consequência B** | "Tropas ocupam o bairro. Os moradores passam a ser revistados todo dia." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-008` +1, `ACT-016` -1 |
| **Evento B** | "A tropa sai e a facção volta a cobrar." · atraso 2 · `Segurança` -15 |
| **Aprendizado** | APR-086 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-087 — Internação de adolescentes

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Internação de adolescentes |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | A Câmara quer ampliar o tempo de internação de adolescentes infratores. As unidades já estão lotadas. |
| **Opção A** | Investir no meio aberto |
| **Efeitos A** | `Dignidade` +10, `Segurança` -5, `Caixa` -10 |
| **Consequência A** | "Jovens cumprem medida na escola e no trabalho. Críticos falam em impunidade." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-013` +1 |
| **Evento A** | — |
| **Opção B** | Ampliar a internação |
| **Efeitos B** | `Segurança` +10, `Dignidade` -10, `Caixa` -15 |
| **Consequência B** | "Os jovens ficam mais tempo internados. As unidades lotam de vez." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-012` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-087 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-088 — Presos separados por facção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Presos separados por facção |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 3 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | Presídios separam presos por facção para evitar mortes. Mas assim cada ala vira território da facção, que recruta quem chega. |
| **Opção A** | Manter a separação |
| **Efeitos A** | `Segurança` +10, `Integridade` -5, `Dignidade` -5 |
| **Consequência A** | "As brigas diminuem. As facções continuam a recrutar nas alas." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Misturar os presos |
| **Efeitos B** | `Integridade` +10, `Segurança` -10, `Caixa` -10 |
| **Consequência B** | "Os presos são misturados e a vigilância aumenta. A tensão sobe." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-009` +1 |
| **Evento B** | "Uma briga entre facções deixa mortos num presídio." · atraso 1 · `Segurança` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-088 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-089 — Tiroteio perto da escola

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Tiroteio perto da escola |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 2 |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Escolas fecham por tiroteios durante operações. Professores pedem regra que evite operação perto da escola em horário de aula. |
| **Opção A** | Criar a regra |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Segurança` -5 |
| **Consequência A** | "Operações perto de escolas ficam para fora do horário de aula." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-013` +1, `ACT-008` -1 |
| **Evento A** | — |
| **Opção B** | Deixar com a polícia |
| **Efeitos B** | `Capital Político` +5, `Dignidade` -10, `Consciência` -5 |
| **Consequência B** | "A polícia mantém a decisão. As aulas continuam suspensas." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-008` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-089 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-090 — Redução de danos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Redução de danos |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Prefeituras pedem verba para abrigar usuários de drogas na rua sem exigir abstinência. Comunidades religiosas querem a verba. |
| **Opção A** | Financiar o cuidado |
| **Efeitos A** | `Dignidade` +10, `Segurança` +5, `Capital Político` -10, `Caixa` -10 |
| **Consequência A** | "Mais gente sai da rua e procura tratamento. Pastores reclamam." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-014` +1, `ACT-012` -1 |
| **Evento A** | — |
| **Opção B** | Comunidades religiosas |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -5, `Integridade` -5 |
| **Consequência B** | "A verba vai para as comunidades. Quem não aceita a regra volta à rua." |
| **Eixo B** | [+1, 0, -1, 0] |
| **Atores B** | `ACT-012` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-090 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-091 — Líder de bairro preso

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Líder de bairro preso |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 3 |
| **Cor A** | Azul |
| **Cor B** | Preto |
| **Problema** | Um líder de bairro que denunciava abusos da polícia é preso, acusado sem prova pública de ligação com facção. A ONU cobra o Brasil. |
| **Opção A** | Pedir apuração isenta |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "O caso é revisto por órgão independente. A polícia se diz desrespeitada." |
| **Eixo A** | [0, +1, +1, +1] |
| **Atores A** | `ACT-010` +1, `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Confiar na polícia |
| **Efeitos B** | `Segurança` +5, `Capital Político` +5, `Integridade` -10 |
| **Consequência B** | "A prisão é mantida. Outras lideranças param de denunciar." |
| **Eixo B** | [0, -1, 0, -1] |
| **Atores B** | `ACT-010` -1, `ACT-008` +1 |
| **Evento B** | "Um relatório internacional cita o Brasil." · atraso 1 · `Legitimidade` -10 |
| **Aprendizado** | APR-091 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-092 — Saída temporária

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Saída temporária |
| **Tipo** | Institucional |
| **Modo** | Prisional e Policial |
| **Quem fala** | Congresso Nacional |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | O Congresso aprova o fim da saída temporária de presos para visitar a família. Diretores de presídio pedem o veto. |
| **Opção A** | Vetar o fim |
| **Efeitos A** | `Dignidade` +5, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "A saída continua. A oposição diz que você solta bandidos." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-009` +1 |
| **Evento A** | — |
| **Opção B** | Sancionar o fim |
| **Efeitos B** | `Capital Político` +10, `Segurança` +5, `Dignidade` -10 |
| **Consequência B** | "A saída acaba. Os presos perdem o contato com a família." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-009` -1 |
| **Evento B** | "Sem visitas à família, crescem os motins." · atraso 2 · `Segurança` -10 |
| **Aprendizado** | APR-092 (doc 18) |
| **Status** | pendente de revisão (D-196) |

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

## 17.07 — Cartas do Modo Emendas (20)

### INST-101 — Emenda para Show

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Emenda para show |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Uma emenda parlamentar destina R$ 50 milhões para um show. O hospital local está sem remédios. |
| **Opção A** | Redirecionar ao hospital |
| **Efeitos A** | `Dignidade` +15, `Capital Político` -10, `Integridade` +5 |
| **Consequência A** | "O hospital recebe os recursos. O show é cancelado." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Manter o show |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -15, `Integridade` -5 |
| **Consequência B** | "O show acontece. O hospital fecha." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-101 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

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

### INST-114 — Cachê da festa junina

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cachê da festa junina |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Uma emenda paga o cachê de um cantor famoso na festa junina da cidade. Quadrilhas e artesãos locais pedem a verba para eles. |
| **Opção A** | Exigir grupos locais |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5, `Capital Político` -10 |
| **Consequência A** | "A festa fica menor e cheia de gente da terra. O deputado reclama." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-019` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Pagar o cantor famoso |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` +5, `Consciência` -5, `Caixa` -5 |
| **Consequência B** | "O show lota a praça. As quadrilhas da cidade ficam sem verba." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-019` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-114 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-115 — Presídio de gestão privada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Presídio de gestão privada |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Deputados de um estado juntam emendas para um presídio novo, gerido por empresa. Ela recebe por preso. |
| **Opção A** | Exigir gestão pública |
| **Efeitos A** | `Integridade` +10, `Dignidade` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "A obra atrasa para o Estado contratar agentes. A bancada do estado reclama." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-009` +1, `ACT-003` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar a cogestão |
| **Efeitos B** | `Segurança` +10, `Capital Político` +10, `Integridade` -10 |
| **Consequência B** | "O presídio abre rápido. A empresa assume a rotina das celas." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-003` +1, `ACT-009` -1 |
| **Evento B** | "A empresa cobra por preso e pede vagas sempre cheias" · atraso 2 · `Dignidade` -10, `Caixa` -5 |
| **Aprendizado** | APR-115 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-116 — Cesta básica com culto

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Cesta básica com culto |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Uma emenda paga cestas básicas por meio de uma ONG ligada a uma igreja. Famílias relatam que a cesta só sai depois do culto. |
| **Opção A** | Exigir entrega sem culto |
| **Efeitos A** | `Legitimidade` +10, `Dignidade` +5, `Capital Político` -10 |
| **Consequência A** | "A ONG assina a regra. Pastores aliados acusam o governo de perseguição." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-012` -1, `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Manter o convênio |
| **Efeitos B** | `Capital Político` +10, `Dignidade` +5, `Legitimidade` -10, `Integridade` -5 |
| **Consequência B** | "As cestas chegam. A regra do culto segue nos bairros." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-012` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-116 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-117 — Teto para grandes shows

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Teto para grandes shows |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Laranja |
| **Problema** | Na lei de incentivo, empresas patrocinam cultura com imposto devido. Artistas de periferia dizem que só turnês de fora são escolhidas. |
| **Opção A** | Limitar grandes eventos |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "Projetos pequenos captam mais. Grandes produtoras perdem patrocínio." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-019` +1, `ACT-006` -1 |
| **Evento A** | — |
| **Opção B** | Deixar a escolha livre |
| **Efeitos B** | `Capital Político` +10, `Consciência` -5, `Dignidade` -5 |
| **Consequência B** | "Os grandes eventos seguem. Coletivos de bairro buscam outro caminho." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-006` +1, `ACT-019` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-117 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-118 — Estrada para a mina

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Estrada para a mina |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Deputados juntam emendas para asfaltar uma estrada até a jazida de uma mineradora estrangeira. Vilas no caminho querem a obra. |
| **Opção A** | Cobrar contrapartida |
| **Efeitos A** | `Soberania` +10, `Caixa` +5, `Capital Político` -10 |
| **Consequência A** | "A mineradora paga parte da obra e atrasa o projeto. Os deputados reclamam." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-021` -1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Liberar a obra |
| **Efeitos B** | `Dignidade` +10, `Capital Político` +5, `Soberania` -10, `Caixa` -5 |
| **Consequência B** | "As vilas ganham asfalto. Os caminhões da mina usam a estrada primeiro." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-021` +1, `ACT-011` +1 |
| **Evento B** | "A mina contamina o rio das vilas perto da estrada" · atraso 2 · `Dignidade` -10, `Soberania` -5 |
| **Aprendizado** | APR-118 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-119 — Drones com condição

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Drones com condição |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 2 |
| **Cor A** | Verde |
| **Cor B** | Amarelo |
| **Problema** | Deputados oferecem emendas para comprar drones de fiscalização ambiental. Em troca, querem que as operações evitem a região deles. |
| **Opção A** | Recusar a condição |
| **Efeitos A** | `Integridade` +10, `Soberania` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "Os fiscais compram menos drones. A bancada corta outro apoio." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-018` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar os drones |
| **Efeitos B** | `Segurança` +10, `Caixa` +5, `Integridade` -10, `Soberania` -5 |
| **Consequência B** | "Os drones voam em outras regiões. Na região dos deputados, o fogo segue." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-001` +1, `ACT-018` -1 |
| **Evento B** | "Satélites mostram desmate na região poupada" · atraso 2 · `Soberania` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-119 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-120 — Hospital sem médicos

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Hospital sem médicos |
| **Tipo** | Institucional |
| **Modo** | Emendas |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Uma emenda ergue um hospital novo na cidade do deputado. Não há verba para pagar médicos nem remédios depois da inauguração. |
| **Opção A** | Trocar por custeio |
| **Efeitos A** | `Dignidade` +15, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "Postos da região ganham equipe. O deputado perde a placa da inauguração." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-014` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Inaugurar o hospital |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` +5, `Caixa` -10, `Dignidade` -5 |
| **Consequência B** | "A festa de inauguração enche a cidade. As alas seguem fechadas." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-003` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-120 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

## 17.08 — Cartas do Modo Bancadas (20)

### INST-121 — Bancada BBB

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Bancada BBB |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | A bancada BBB quer aprovar uma lei que flexibiliza o licenciamento ambiental e aumenta o armamento civil. Em troca, apoia seu pacote fiscal. |
| **Opção A** | Recusar |
| **Efeitos A** | `Capital Político` -15, `Soberania` +5, `Legitimidade` +5, `Integridade` +10 |
| **Consequência A** | "A bancada BBB se une contra você. Mas o meio ambiente é preservado." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Aceitar |
| **Efeitos B** | `Capital Político` +20, `Soberania` -10, `Dignidade` -10, `Integridade` -10 |
| **Consequência B** | "A lei passa. Mais desmatamento, mais armas. Mas o pacote fiscal é aprovado." |
| **Eixo B** | [+1, 0, -1, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-121 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-122 — Vaga do STF negociada

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vaga do STF negociada |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Preto |
| **Problema** | A bancada religiosa promete votar sua reforma se a próxima vaga no STF for de um nome indicado por ela. |
| **Opção A** | Indicar pelo currículo |
| **Efeitos A** | `Legitimidade` +10, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "A reforma perde votos. Juristas elogiam a escolha." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-012` -1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar o nome da bancada |
| **Efeitos B** | `Capital Político` +15, `Integridade` -10, `Legitimidade` -5 |
| **Consequência B** | "A reforma passa. O novo ministro deve a vaga a uma bancada." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-012` +1, `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-122 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-123 — Indenização no Marco Temporal

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Indenização no Marco Temporal |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Roxo |
| **Problema** | A bancada ruralista quer pôr o marco temporal na Constituição. Você pode oferecer indenização a quem comprou terra indígena de boa-fé. |
| **Opção A** | Oferecer indenização |
| **Efeitos A** | `Soberania` +10, `Legitimidade` +5, `Caixa` -15 |
| **Consequência A** | "Parte da bancada aceita o acordo. A conta sai do Tesouro." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-018` -1 |
| **Evento A** | "Fazendeiros sem título pedem a mesma indenização" · atraso 2 · `Caixa` -10, `Integridade` -5 |
| **Opção B** | Não negociar |
| **Efeitos B** | `Integridade` +5, `Capital Político` -15, `Segurança` -5 |
| **Consequência B** | "A PEC avança na Câmara. No campo, a tensão cresce." |
| **Eixo B** | [0, 0, +1, 0] |
| **Atores B** | `ACT-001` -1, `ACT-018` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-123 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-124 — Internação mais longa

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Internação mais longa |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | A bancada da bala troca a PEC da maioridade por mais tempo de internação para adolescentes. As unidades já estão cheias. |
| **Opção A** | Reforçar o socioeducativo |
| **Efeitos A** | `Dignidade` +10, `Caixa` -10, `Capital Político` -10 |
| **Consequência A** | "A bancada volta à PEC. As unidades ganham escola e equipe." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-013` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Ampliar a internação |
| **Efeitos B** | `Capital Político` +10, `Segurança` +5, `Dignidade` -10, `Caixa` -5 |
| **Consequência B** | "A PEC sai da pauta. Adolescentes ficam mais tempo nas unidades lotadas." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-011` +1, `ACT-013` -1 |
| **Evento B** | "Rebelião numa unidade lotada vira notícia" · atraso 2 · `Segurança` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-124 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-125 — Propaganda de apostas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Propaganda de apostas |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | A bancada das apostas quer liberar anúncio de bets em camisa de time e no intervalo do jogo. Clubes dizem que dependem dessa verba. |
| **Opção A** | Proibir os anúncios |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "Os anúncios somem da TV. Clubes pequenos perdem patrocínio." |
| **Eixo A** | [-1, -1, 0, -1] |
| **Atores A** | `ACT-022` -1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Liberar com taxa extra |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Dignidade` -10, `Consciência` -5 |
| **Consequência B** | "A taxa entra no caixa. Jovens veem apostas em todo jogo." |
| **Eixo B** | [+1, +1, 0, +1] |
| **Atores B** | `ACT-022` +1, `ACT-006` +1 |
| **Evento B** | "Famílias endividadas com apostas procuram o SUS" · atraso 2 · `Dignidade` -10, `Caixa` -5 |
| **Aprendizado** | APR-125 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-126 — Piso regional menor

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Piso regional menor |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-004` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Uma frente de empresários propõe um salário mínimo menor nas regiões mais pobres. Dizem que assim abrem mais vagas formais. |
| **Opção A** | Manter o piso nacional |
| **Efeitos A** | `Dignidade` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "O piso segue igual no país. Empresários do Norte e Nordeste reclamam." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-015` +1, `ACT-004` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar piso regional |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Dignidade` -15 |
| **Consequência B** | "O piso cai nas regiões pobres. Empresas anunciam vagas." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-015` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-126 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-127 — Multa por salário desigual

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Multa por salário desigual |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | A bancada feminina, de vários partidos, cobra multa para empresas que pagam menos às mulheres no mesmo cargo. O empresariado pede adiar. |
| **Opção A** | Aplicar as multas |
| **Efeitos A** | `Dignidade` +10, `Legitimidade` +10, `Capital Político` -10 |
| **Consequência A** | "Empresas revisam salários. Associações vão à Justiça contra a regra." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-004` -1, `ACT-024` +1 |
| **Evento A** | — |
| **Opção B** | Adiar a fiscalização |
| **Efeitos B** | `Capital Político` +10, `Caixa` +5, `Legitimidade` -10 |
| **Consequência B** | "A regra fica no papel por mais um ano. A bancada feminina rompe com você." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-004` +1, `ACT-024` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-127 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-128 — Revisão das cotas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Revisão das cotas |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Chega a hora de revisar a lei de cotas. Uma bancada quer só o critério de renda; o movimento negro quer manter renda e raça. |
| **Opção A** | Manter renda e raça |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Capital Político` -10 |
| **Consequência A** | "A lei segue com os dois critérios. A bancada promete nova tentativa." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-013` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Só critério de renda |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Consciência` -5 |
| **Consequência B** | "A cota racial sai da lei. Estudantes negros protestam nas federais." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-011` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-128 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-129 — Fundeb para aposentados

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fundeb para aposentados |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Prefeitos pedem à bancada municipalista usar o fundo da educação básica para pagar professores aposentados. Escolas perdem verba. |
| **Opção A** | Vetar o uso |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "A verba fica nas escolas. Prefeitos atrasam outros pagamentos." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-013` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Liberar o uso |
| **Efeitos B** | `Capital Político` +10, `Caixa` +10, `Consciência` -10 |
| **Consequência B** | "As prefeituras pagam as aposentadorias. Salas ficam sem reforma." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-013` -1 |
| **Evento B** | "Escolas sem reforma fecham salas no inverno" · atraso 2 · `Consciência` -10, `Dignidade` -5 |
| **Aprendizado** | APR-129 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-130 — Isenção para agrotóxico

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Isenção para agrotóxico |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Verde |
| **Problema** | Agrotóxicos têm isenção de impostos. A bancada ruralista diz que o fim dela encarece a comida no mercado. |
| **Opção A** | Acabar com a isenção |
| **Efeitos A** | `Caixa` +10, `Soberania` +5, `Capital Político` -10, `Dignidade` -5 |
| **Consequência A** | "A receita sobe. O agro repassa parte do custo para o preço da comida." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-001` -1, `ACT-018` +1 |
| **Evento A** | — |
| **Opção B** | Manter a isenção |
| **Efeitos B** | `Capital Político` +10, `Dignidade` +5, `Caixa` -10, `Soberania` -5 |
| **Consequência B** | "A comida não sobe agora. Rios perto das lavouras seguem com veneno." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-001` +1, `ACT-018` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-130 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-131 — Blindados ou perícia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Blindados ou perícia |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Preto |
| **Problema** | A bancada da bala quer verba para carros blindados nas polícias. Peritos dizem que faltam laboratórios e muitos crimes ficam sem solução. |
| **Opção A** | Investir em perícia |
| **Efeitos A** | `Segurança` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "Os inquéritos andam. A bancada diz que você desarma a polícia." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-007` +1, `ACT-008` -1 |
| **Evento A** | — |
| **Opção B** | Comprar os blindados |
| **Efeitos B** | `Capital Político` +10, `Segurança` +5, `Dignidade` -10, `Caixa` -5 |
| **Consequência B** | "Os blindados chegam às ruas. Os laboratórios seguem sem equipamento." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-008` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-131 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-132 — Obstrução pela palavra gênero

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Obstrução pela palavra gênero |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-012` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | A bancada religiosa trava a votação do orçamento até o governo tirar a palavra gênero do plano nacional de educação. |
| **Opção A** | Manter o texto |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Caixa` -10, `Capital Político` -10 |
| **Consequência A** | "O orçamento atrasa semanas. O plano segue com a palavra." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-013` +1, `ACT-012` -1 |
| **Evento A** | "Servidores ficam sem reajuste com o orçamento parado" · atraso 1 · `Capital Político` -10 |
| **Opção B** | Tirar a palavra |
| **Efeitos B** | `Capital Político` +10, `Caixa` +5, `Consciência` -10 |
| **Consequência B** | "O orçamento passa. Professores dizem que perdem apoio contra o preconceito." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-012` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-132 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-133 — Multa trocada por plantio

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Multa trocada por plantio |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | A bancada ruralista quer anistiar multas de desmate em troca de replantio. Compradores da Europa ameaçam boicote. |
| **Opção A** | Cobrar as multas |
| **Efeitos A** | `Soberania` +10, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "As multas seguem na Justiça. A bancada trava seus projetos." |
| **Eixo A** | [-1, +1, 0, 0] |
| **Atores A** | `ACT-018` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Trocar multa por plantio |
| **Efeitos B** | `Capital Político` +15, `Soberania` +5, `Integridade` -10, `Caixa` -5 |
| **Consequência B** | "Parte das áreas volta a ter mata. Quem desmatou não paga a multa." |
| **Eixo B** | [+1, -1, 0, 0] |
| **Atores B** | `ACT-001` +1, `ACT-018` -1 |
| **Evento B** | "Novos desmates esperam a próxima anistia" · atraso 2 · `Soberania` -10, `Integridade` -5 |
| **Aprendizado** | APR-133 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-134 — Repasse fixo para cultura

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Repasse fixo para cultura |
| **Tipo** | Institucional |
| **Modo** | Bancadas |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Azul |
| **Problema** | Uma frente parlamentar quer repasse fixo da União para a cultura de estados e cidades. Hoje a verba depende de edital. |
| **Opção A** | Criar o repasse fixo |
| **Efeitos A** | `Consciência` +10, `Dignidade` +5, `Caixa` -15 |
| **Consequência A** | "Cidades pequenas abrem casas de cultura. O caixa da União aperta." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-019` +1, `ACT-007` -1 |
| **Evento A** | "Prefeituras gastam a verba na festa da cidade" · atraso 2 · `Integridade` -10, `Caixa` -5 |
| **Opção B** | Manter os editais |
| **Efeitos B** | `Caixa` +10, `Consciência` -10, `Capital Político` -5 |
| **Consequência B** | "A verba segue por edital. Quem sabe escrever projeto leva mais." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-007` +1, `ACT-019` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-134 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-135 — Cassino no resort

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

### INST-136 — Porte em toda a fazenda

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

### INST-137 — Data do orgulho hétero

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

### INST-138 — Escala de seis por um

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

### INST-139 — Quem libera o veneno

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

### INST-140 — Petróleo para a escola

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

## 17.09 — Modo Impeachment

**Cena de impeachment (fora das 340, D-101):** as 5 cartas abaixo (`IMP-1..5`, Aprendizados `APR-IMP-1..5`) só aparecem na cena (`gdd/sistemas/03_impeachment.md`). **Cartas comuns do modo (INST-141..160, dentro das 340):** escritas nas ondas do P-015, sobre pressão e legitimidade antes do processo, nunca sobre as fases da cena (DP-011).

### IMP-1 — O Pedido

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Pedido |
| **Tipo** | Impeachment |
| **Modo** | Impeachment |
| **Fase** | 1 |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | A oposição protocolou um pedido de impeachment. O presidente da Câmara, seu adversário, aceita o pedido em 48 horas. |
| **Opção A** | Apelar ao povo |
| **Teste A** | `Consciência` > 45 (apoio +1) |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Segurança` -5 |
| **Consequência A** | "As ruas se enchem. Mas o Congresso se sente atacado." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Confiar na base |
| **Teste B** | `Caixa` > 45 (apoio +1) |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10 |
| **Consequência B** | "A base está rachada. Alguns aliados já negociam com a oposição." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-IMP-1 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

*Regras da cena: `gdd/sistemas/03_impeachment.md` (efeitos ×1, sem multiplicador do ano).*

### IMP-2 — A Comissão

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Comissão |
| **Tipo** | Impeachment |
| **Modo** | Impeachment |
| **Fase** | 2 |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | O presidente da Câmara aceitou o pedido. Uma comissão especial foi formada. O relator é seu adversário. |
| **Opção A** | Denunciar o golpe |
| **Teste A** | `Integridade` > 45 (apoio +1) |
| **Efeitos A** | `Integridade` +5, `Consciência` +5, `Segurança` -5 |
| **Consequência A** | "A denúncia ganha força nas ruas. Mas o Congresso ignora." |
| **Eixo A** | [0, 0, 0, 0] |
| **Opção B** | Negociar nos bastidores |
| **Teste B** | `Capital Político` > 25 (apoio +1) |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Integridade` -5 |
| **Consequência B** | "A comissão suaviza o parecer. Mas o povo percebe a compra de votos." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-IMP-2 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### IMP-3 — A Votação

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | A Votação |
| **Tipo** | Impeachment |
| **Modo** | Impeachment |
| **Fase** | 3 |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | A Câmara vai votar a autorização do processo. São precisos 342 de 513 votos. A contagem está apertada. |
| **Opção A** | Mobilizar as ruas |
| **Teste A** | `Consciência` > 55 (apoio +1) |
| **Efeitos A** | `Legitimidade` +10, `Soberania` -5, `Segurança` -5 |
| **Consequência A** | "As praças lotam. Os deputados sentem a pressão." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Negociar votos |
| **Teste B** | `Capital Político` > 35 (apoio +1) |
| **Efeitos B** | `Capital Político` +5, `Soberania` -10, `Segurança` -5 |
| **Consequência B** | "Alguns votos mudam de lado. O preço vem depois." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-IMP-3 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### IMP-4 — O Julgamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Julgamento |
| **Tipo** | Impeachment |
| **Modo** | Impeachment |
| **Fase** | 4 |
| **Quem fala** | Senado Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | O Senado julga o processo. São precisos 54 de 81 votos para condenar. |
| **Opção A** | Fazer a defesa no Senado |
| **Teste A** | `Dignidade` > 50 (apoio +1) |
| **Efeitos A** | `Consciência` +10, `Caixa` -5 |
| **Consequência A** | "A defesa é ouvida no país inteiro." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Oferecer cargos |
| **Teste B** | `Capital Político` > 40 (apoio +1) |
| **Efeitos B** | `Capital Político` +5, `Legitimidade` +5, `Dignidade` -10 |
| **Consequência B** | "Os cargos são aceitos. As promessas ao povo esperam." |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-IMP-4 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### IMP-5 — O Desfecho

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Desfecho |
| **Tipo** | Impeachment |
| **Modo** | Impeachment |
| **Fase** | 5 |
| **Quem fala** | Senado Federal |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | É o último dia. O resultado depende do apoio que você juntou e da sua última palavra. |
| **Opção A** | Falar à nação |
| **Teste A** | `Legitimidade` > 45 (absolvição, se apoio suficiente) |
| **Efeitos A** | `Legitimidade` +10, `Caixa` -5 |
| **Consequência A** | "O país para para ouvir." |
| **Eixo A** | [0, 0, 0, +1] |
| **Opção B** | Pactuar com o Congresso |
| **Teste B** | `Integridade` > 51 (absolvição, se apoio suficiente) |
| **Efeitos B** | `Integridade` +5, `Soberania` -5 |
| **Consequência B** | "O pacto é fechado. Quem manda agora?" |
| **Eixo B** | [0, 0, 0, 0] |
| **Aprendizado** | APR-IMP-5 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-141 — Pedidos na gaveta

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

### INST-142 — Atraso no repasse

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

### INST-143 — Recado do general

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

### INST-144 — Púlpito contra o governo

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

### INST-145 — Panelaço nas janelas

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

### INST-146 — Vice conversa com a oposição

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

### INST-147 — Greve geral pelo governo

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

### INST-148 — Show pela democracia

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

### INST-149 — Anúncios pelo impeachment

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

### INST-150 — Ministro tutor

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

### INST-151 — Denúncia lá fora

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

### INST-152 — Acampamento em Brasília

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

### INST-153 — Bondade antes da pesquisa

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

### INST-154 — Delação sem prova

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

### INST-155 — Vice conversa com rivais

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vice conversa com rivais |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Seu vice janta com líderes da oposição. Nos corredores, já falam do governo dele. Você pode romper em público ou trazê-lo para perto. |
| **Opção A** | Romper com o vice |
| **Efeitos A** | `Legitimidade` +10, `Consciência` +5, `Capital Político` -15 |
| **Consequência A** | "O vice vira oposição. Os rivais ganham um nome para o dia seguinte." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Dar um ministério a ele |
| **Efeitos B** | `Capital Político` +10, `Integridade` -5, `Legitimidade` -5 |
| **Consequência B** | "O vice ganha poder e sorri na foto. A conversa com a oposição continua." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-155 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-156 — Nota de governos estrangeiros

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Nota de governos estrangeiros |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Preto |
| **Problema** | Governos vizinhos querem soltar uma nota em defesa do seu mandato. A oposição diz que é interferência de fora na política do país. |
| **Opção A** | Aceitar a nota |
| **Efeitos A** | `Legitimidade` +10, `Soberania` -10, `Capital Político` -5 |
| **Consequência A** | "A nota sai. Lá fora, você ganha aliados; aqui, a oposição fala em traição." |
| **Eixo A** | [0, +1, 0, 0] |
| **Atores A** | `ACT-010` +1 |
| **Evento A** | — |
| **Opção B** | Recusar a nota |
| **Efeitos B** | `Soberania` +10, `Legitimidade` -5, `Consciência` -5 |
| **Consequência B** | "Você trata a crise em casa. Ninguém de fora fala pelo seu governo." |
| **Eixo B** | [0, -1, 0, 0] |
| **Atores B** | `ACT-010` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-156 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-157 — Pedidos na gaveta

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pedidos na gaveta |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | Câmara dos Deputados |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | O presidente da Câmara guarda pedidos de impeachment na gaveta. Ele não arquiva nem abre: usa os pedidos como ameaça a cada votação. |
| **Opção A** | Pedir prazo ao STF |
| **Efeitos A** | `Legitimidade` +5, `Integridade` +5, `Capital Político` -15 |
| **Consequência A** | "O STF analisa o caso. O presidente da Câmara se sente afrontado." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | "A Câmara trava suas pautas em resposta" · atraso 1 · `Capital Político` -10 |
| **Opção B** | Ceder nas votações |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Integridade` -5 |
| **Consequência B** | "A gaveta segue fechada. A cada votação, o preço sobe um pouco." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-157 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-158 — Consulta sobre o mandato

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Consulta sobre o mandato |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Um aliado propõe que o povo vote se você fica no cargo. A lei não prevê esse voto, e mudar a regra leva tempo. |
| **Opção A** | Propor a consulta |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +5, `Caixa` -10, `Capital Político` -5 |
| **Consequência A** | "O debate toma o país. O Congresso diz que você foge da crise." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-024` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Governar sem consulta |
| **Efeitos B** | `Capital Político` +5, `Consciência` -5 |
| **Consequência B** | "A ideia some. A crise segue nas mãos do Congresso." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-024` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-158 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-159 — Manobra nas contas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Manobra nas contas |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | O caixa não fecha. Um técnico sugere atrasar repasses aos bancos públicos para pagar benefícios. Juristas veem crime de responsabilidade. |
| **Opção A** | Atrasar os repasses |
| **Efeitos A** | `Dignidade` +10, `Caixa` +5, `Integridade` -15 |
| **Consequência A** | "Os benefícios saem em dia. A oposição guarda o caso para usar depois." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-007` +1 |
| **Evento A** | "A oposição usa as contas num pedido de impeachment" · atraso 2 · `Capital Político` -15, `Legitimidade` -5 |
| **Opção B** | Cortar benefícios |
| **Efeitos B** | `Integridade` +10, `Dignidade` -15, `Legitimidade` -5 |
| **Consequência B** | "As contas fecham dentro da lei. Famílias recebem menos este mês." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-006` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-159 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-160 — Recado do quartel

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Recado do quartel |
| **Tipo** | Institucional |
| **Modo** | Impeachment |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Azul |
| **Problema** | Um general diz, em segredo, que a tropa garante seu mandato se o Congresso tentar te tirar. Em troca, quer voz nas decisões. |
| **Opção A** | Aceitar a garantia |
| **Efeitos A** | `Segurança` +10, `Capital Político` +10, `Legitimidade` -15, `Integridade` -10 |
| **Consequência A** | "Os quartéis ficam do seu lado. A democracia fica refém da farda." |
| **Eixo A** | [0, 0, 0, -2] |
| **Atores A** | `ACT-008` +1 |
| **Evento A** | "Militares cobram cargos no governo" · atraso 1 · `Integridade` -10, `Capital Político` -5 |
| **Opção B** | Recusar a garantia |
| **Efeitos B** | `Legitimidade` +15, `Segurança` -10, `Capital Político` -5 |
| **Consequência B** | "Você exige silêncio da tropa. O general sai irritado." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-008` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-160 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

## 17.10 — Cartas do Modo Judiciário (20)

### INST-161 — Ministro do STF com 28 Mensagens

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ministro do STF |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | A imprensa revela que um ministro do STF tem 28 mensagens de um banqueiro investigado. A oposição pede impeachment. |
| **Opção A** | Apoiar a investigação |
| **Efeitos A** | `Consciência` +15, `Legitimidade` +10, `Capital Político` -30, `Integridade` +15 |
| **Consequência A** | "O ministro é investigado. O STF entra em crise. A lei vale para todos." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Defender o ministro |
| **Efeitos B** | `Capital Político` -20, `Consciência` -15, `Integridade` -15 |
| **Consequência B** | "O caso é arquivado. Mas o povo vê que a justiça é diferente para os poderosos." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-161 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-162 — Sentenças à venda

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Sentenças à venda |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | A PF prova que juízes de um tribunal vendiam sentenças. A punição máxima deles é a aposentadoria, com salário. Você pode propor mudar isso. |
| **Opção A** | Propor o fim da regalia |
| **Efeitos A** | `Integridade` +15, `Consciência` +10, `Capital Político` -15 |
| **Consequência A** | "Associações de juízes reagem. O povo aplaude a proposta." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-023` +1 |
| **Evento A** | "Tribunais atrasam processos do governo" · atraso 2 · `Capital Político` -10 |
| **Opção B** | Deixar com o CNJ |
| **Efeitos B** | `Capital Político` +10, `Integridade` -10, `Consciência` -5 |
| **Consequência B** | "O CNJ aposenta os juízes. Eles seguem com o salário em casa." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-162 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-163 — Lei derrubada no Supremo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Lei derrubada no Supremo |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | Supremo Tribunal Federal |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Verde |
| **Problema** | O STF derruba sua lei que proíbe espalhar agrotóxico de avião. Ambientalistas pedem uma emenda à Constituição para driblar a decisão. |
| **Opção A** | Cumprir e reescrever |
| **Efeitos A** | `Legitimidade` +10, `Integridade` +5, `Dignidade` -10 |
| **Consequência A** | "A lei cai. Seu time escreve outra, e as vilas perto das lavouras esperam." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-001` +1, `ACT-018` -1 |
| **Evento A** | — |
| **Opção B** | Driblar com emenda |
| **Efeitos B** | `Dignidade` +10, `Capital Político` -10, `Legitimidade` -10 |
| **Consequência B** | "A emenda avança. O STF e o Congresso entram em choque." |
| **Eixo B** | [-1, 0, 0, -1] |
| **Atores B** | `ACT-018` +1, `ACT-001` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-163 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-164 — Liminar trava a moradia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Liminar trava a moradia |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-016` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Roxo |
| **Problema** | Um juiz suspende sozinho seu programa de moradia, numa decisão provisória. As obras param até o tribunal julgar o recurso. |
| **Opção A** | Recorrer em silêncio |
| **Efeitos A** | `Integridade` +5, `Legitimidade` +5, `Dignidade` -10 |
| **Consequência A** | "A AGU recorre. As famílias esperam meses pelas chaves." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-016` -1 |
| **Evento A** | — |
| **Opção B** | Atacar o juiz em público |
| **Efeitos B** | `Consciência` +5, `Legitimidade` -10, `Integridade` -5 |
| **Consequência B** | "Sua base vibra. Juristas dizem que você ameaça a Justiça." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-016` +1, `ACT-023` -1 |
| **Evento B** | "Juízes se unem contra o governo" · atraso 1 · `Capital Político` -10 |
| **Aprendizado** | APR-164 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-165 — Fim do foro especial

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Fim do foro especial |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 1 |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | Deputados só podem ser julgados no STF, onde os casos andam devagar. Uma PEC leva esses processos para a primeira instância. |
| **Opção A** | Apoiar a PEC |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -15 |
| **Consequência A** | "Políticos passam a ser julgados como todo mundo. Aliados se assustam." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-011` -1, `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Manter o foro |
| **Efeitos B** | `Capital Político` +10, `Integridade` -10, `Legitimidade` -5 |
| **Consequência B** | "Os processos seguem no STF. A base agradece o silêncio." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-165 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-166 — Prisão em segunda instância

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Prisão em segunda instância |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Preto |
| **Cor B** | Vermelho |
| **Problema** | Uma PEC permite prender o réu após a condenação em segunda instância, antes do fim dos recursos. Você decide a posição do governo. |
| **Opção A** | Apoiar a PEC |
| **Efeitos A** | `Segurança` +10, `Integridade` +5, `Dignidade` -10 |
| **Consequência A** | "Recursos sem fim acabam. Quem não tem bom advogado é preso mais cedo." |
| **Eixo A** | [0, 0, -1, -1] |
| **Atores A** | `ACT-008` +1 |
| **Evento A** | — |
| **Opção B** | Defender a presunção |
| **Efeitos B** | `Dignidade` +10, `Segurança` -10, `Capital Político` -5 |
| **Consequência B** | "Só se prende ao fim dos recursos. Há quem fale em impunidade." |
| **Eixo B** | [0, 0, +1, +1] |
| **Atores B** | `ACT-023` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-166 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-167 — Habeas corpus em um dia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Habeas corpus em um dia |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Um banqueiro preso sai com habeas corpus em um dia. Na mesma semana, presos pobres esperam meses por um defensor público. |
| **Opção A** | Ampliar a Defensoria |
| **Efeitos A** | `Dignidade` +15, `Integridade` +5, `Caixa` -15 |
| **Consequência A** | "Mais defensores chegam às cadeias. Muitos presos sem julgamento saem." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-009` +1 |
| **Evento A** | — |
| **Opção B** | Restringir o habeas |
| **Efeitos B** | `Segurança` +10, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "O recurso fica mais difícil para todos, ricos e pobres." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-008` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-167 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-168 — Vazamento do inquérito

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vazamento do inquérito |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Vermelho |
| **Problema** | Um inquérito sigiloso contra um juiz vaza para a imprensa. O vazamento saiu da PF, que responde ao seu governo. |
| **Opção A** | Punir quem vazou |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Consciência` -10 |
| **Consequência A** | "O delegado é afastado. A imprensa diz que você protege o juiz." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-023` -1 |
| **Evento A** | — |
| **Opção B** | Defender a imprensa |
| **Efeitos B** | `Consciência` +10, `Integridade` -10, `Legitimidade` -5 |
| **Consequência B** | "O caso segue nas manchetes. O juiz diz que é julgado antes do processo." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-023` +1 |
| **Evento B** | "A defesa do juiz pede a anulação das provas" · atraso 2 · `Integridade` -10 |
| **Aprendizado** | APR-168 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-169 — Quarentena para juiz candidato

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Quarentena para juiz candidato |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Laranja |
| **Problema** | Juízes que ficam famosos com grandes casos deixam o cargo e logo disputam eleição. Um projeto cria um prazo de espera antes da candidatura. |
| **Opção A** | Apoiar a quarentena |
| **Efeitos A** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "Juízes esperam anos para entrar na política. Rivais falam em censura." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Liberar a candidatura |
| **Efeitos B** | `Capital Político` +10, `Integridade` -10 |
| **Consequência B** | "Juízes podem sair do tribunal direto para a urna." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-169 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-170 — Mais cadeiras no Supremo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Mais cadeiras no Supremo |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | O STF derruba suas leis em série. Aliados propõem aumentar o número de ministros para você nomear a maioria da corte. |
| **Opção A** | Aumentar o Supremo |
| **Efeitos A** | `Capital Político` +10, `Legitimidade` -15, `Integridade` -10 |
| **Consequência A** | "Você ganha a maioria na corte. O próximo presidente pode fazer o mesmo." |
| **Eixo A** | [0, 0, 0, -2] |
| **Atores A** | `ACT-011` +1 |
| **Evento A** | "Organismos internacionais criticam a mudança" · atraso 1 · `Legitimidade` -10, `Soberania` -5 |
| **Opção B** | Respeitar o tamanho |
| **Efeitos B** | `Legitimidade` +10, `Integridade` +5, `Capital Político` -10 |
| **Consequência B** | "A corte fica como está. Suas leis seguem em risco." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-011` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-170 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-171 — Despejo de acampamento

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Despejo de acampamento |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | Um juiz manda despejar famílias acampadas numa fazenda parada há anos. Você pode pedir uma mesa de mediação antes da polícia. |
| **Opção A** | Pedir mediação |
| **Efeitos A** | `Dignidade` +10, `Capital Político` -10, `Caixa` -5 |
| **Consequência A** | "O despejo espera. Famílias e fazendeiro negociam uma saída." |
| **Eixo A** | [-1, 0, +1, 0] |
| **Atores A** | `ACT-017` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Cumprir a ordem |
| **Efeitos B** | `Segurança` +10, `Dignidade` -15, `Legitimidade` -5 |
| **Consequência B** | "A polícia esvazia a fazenda. As famílias vão para a beira da estrada." |
| **Eixo B** | [+1, 0, 0, -1] |
| **Atores B** | `ACT-017` -1, `ACT-001` +1 |
| **Evento B** | "As famílias despejadas acampam em outra área" · atraso 1 · `Dignidade` -10, `Segurança` -5 |
| **Aprendizado** | APR-171 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-172 — Juiz das garantias

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Juiz das garantias |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Um juiz conduz a investigação e outro julga o caso: é o juiz das garantias. Faltam juízes no interior para cumprir a regra. |
| **Opção A** | Implantar já |
| **Efeitos A** | `Integridade` +10, `Dignidade` +5, `Caixa` -15 |
| **Consequência A** | "Mais juízes são contratados. Comarcas pequenas sofrem para se adaptar." |
| **Eixo A** | [-1, 0, +1, +1] |
| **Atores A** | `ACT-009` +1 |
| **Evento A** | — |
| **Opção B** | Adiar a regra |
| **Efeitos B** | `Caixa` +10, `Integridade` -10, `Dignidade` -5 |
| **Consequência B** | "O mesmo juiz segue do inquérito à sentença." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-009` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-172 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-173 — Juíza ameaçada pela milícia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Juíza ameaçada pela milícia |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Preto |
| **Cor B** | Azul |
| **Problema** | Uma juíza que julga chefes de milícia recebe ameaças. Juízes pedem sentenças assinadas sem nome, para não virar alvo. |
| **Opção A** | Criar juiz sem rosto |
| **Efeitos A** | `Segurança` +15, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência A** | "As sentenças saem sem assinatura. A defesa não sabe quem julga." |
| **Eixo A** | [0, 0, -1, -1] |
| **Atores A** | `ACT-008` +1 |
| **Evento A** | — |
| **Opção B** | Dar escolta federal |
| **Efeitos B** | `Segurança` +10, `Caixa` -10, `Capital Político` -5 |
| **Consequência B** | "A juíza ganha escolta. Outros juízes ameaçados também pedem." |
| **Eixo B** | [-1, 0, 0, +1] |
| **Atores B** | `ACT-009` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-173 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-174 — Homofobia como crime

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Homofobia como crime |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | Supremo Tribunal Federal |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | O Congresso nunca votou uma lei contra a homofobia. O STF decide que ela é crime, como o racismo, até a lei sair. |
| **Opção A** | Enviar lei própria |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Capital Político` -15 |
| **Consequência A** | "O projeto chega ao Congresso. Bancadas religiosas prometem barrar." |
| **Eixo A** | [0, 0, +2, 0] |
| **Atores A** | `ACT-012` -1, `ACT-024` +1 |
| **Evento A** | "Pastores convocam atos contra o projeto" · atraso 1 · `Capital Político` -10 |
| **Opção B** | Deixar com o Supremo |
| **Efeitos B** | `Capital Político` +5, `Legitimidade` -5, `Consciência` -5 |
| **Consequência B** | "A proteção depende da decisão do STF. O Congresso segue calado." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-012` +1, `ACT-024` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-174 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-175 — Vaga no Tribunal de Contas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vaga no Tribunal de Contas |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 1 |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Abre uma vaga no Tribunal de Contas, que fiscaliza seus gastos. Aliados querem um ex-deputado; técnicos pedem um auditor de carreira. |
| **Opção A** | Indicar o auditor |
| **Efeitos A** | `Integridade` +10, `Caixa` +5, `Capital Político` -15 |
| **Consequência A** | "O tribunal fica mais técnico. A base cobra a vaga perdida." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-009` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Indicar o ex-deputado |
| **Efeitos B** | `Capital Político` +15, `Integridade` -10, `Legitimidade` -5 |
| **Consequência B** | "O aliado agora fiscaliza quem o indicou." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-175 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-176 — Delação do banqueiro

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Delação do banqueiro |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Amarelo |
| **Cor B** | Azul |
| **Problema** | Um banqueiro preso quer delatar políticos em troca de pena menor. Seus aliados pedem uma lei que limite as delações. |
| **Opção A** | Limitar as delações |
| **Efeitos A** | `Capital Político` +10, `Integridade` -15, `Consciência` -5 |
| **Consequência A** | "A base respira. A imprensa diz que você fecha a porta da investigação." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` +1, `ACT-023` -1 |
| **Evento A** | "A delação vaza mesmo assim" · atraso 2 · `Integridade` -10 |
| **Opção B** | Manter as regras |
| **Efeitos B** | `Integridade` +10, `Consciência` +5, `Capital Político` -15 |
| **Consequência B** | "A delação segue. Nomes da sua base podem aparecer." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` -1, `ACT-023` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-176 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-177 — Penduricalhos acima do teto

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Penduricalhos acima do teto |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-009` |
| **Ano mínimo** | 2 |
| **Cor A** | Laranja |
| **Cor B** | Amarelo |
| **Problema** | Juízes recebem auxílios que somam muito acima do teto salarial. Você pode propor uma lei que corte esses extras. |
| **Opção A** | Cortar os extras |
| **Efeitos A** | `Caixa` +10, `Integridade` +10, `Capital Político` -15 |
| **Consequência A** | "Associações de juízes vão ao STF contra a lei." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-009` -1 |
| **Evento A** | "Tribunais julgam a lei em causa própria" · atraso 2 · `Legitimidade` -5, `Integridade` -5 |
| **Opção B** | Evitar a briga |
| **Efeitos B** | `Capital Político` +10, `Caixa` -10, `Integridade` -5 |
| **Consequência B** | "Os auxílios seguem. Professores comparam com os próprios salários." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-013` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-177 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-178 — Audiência de custódia

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Audiência de custódia |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | Ministério da Justiça |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Todo preso em flagrante deve ver um juiz logo. Policiais dizem que a regra solta criminosos; juízes dizem que ela evita abusos. |
| **Opção A** | Ampliar as audiências |
| **Efeitos A** | `Dignidade` +10, `Integridade` +5, `Segurança` -10 |
| **Consequência A** | "Mais presos são ouvidos logo. Abusos na prisão aparecem mais cedo." |
| **Eixo A** | [0, 0, +1, +1] |
| **Atores A** | `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Limitar as audiências |
| **Efeitos B** | `Segurança` +10, `Dignidade` -10, `Legitimidade` -5 |
| **Consequência B** | "Menos presos saem na hora. Abusos ficam sem testemunha." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | `ACT-008` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-178 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-179 — Parentes de juízes na causa

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Parentes de juízes na causa |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Cor A** | Azul |
| **Cor B** | Verde |
| **Problema** | Escritórios de parentes de juízes defendem grandes fazendeiros nos tribunais onde eles julgam. Uma lei pode proibir essa atuação. |
| **Opção A** | Proibir a atuação |
| **Efeitos A** | `Integridade` +15, `Legitimidade` +5, `Capital Político` -10 |
| **Consequência A** | "Os escritórios perdem clientes. Juízes dizem que você pune a família." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-023` +1, `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Confiar na suspeição |
| **Efeitos B** | `Capital Político` +10, `Integridade` -10, `Consciência` -5 |
| **Consequência B** | "Cada juiz decide se deve sair do caso do parente." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-001` +1, `ACT-023` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-179 (doc 18) |
| **Status** | pendente de revisão (D-196) |

### INST-180 — Ouvidoria de fora

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Ouvidoria de fora |
| **Tipo** | Institucional |
| **Modo** | Judiciário |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 2 |
| **Cor A** | Roxo |
| **Cor B** | Amarelo |
| **Problema** | Movimentos pedem uma ouvidoria do Judiciário com cidadãos de fora dos tribunais. Juízes dizem que é ataque à independência. |
| **Opção A** | Criar a ouvidoria |
| **Efeitos A** | `Consciência` +10, `Legitimidade` +10, `Capital Político` -15 |
| **Consequência A** | "Queixas contra juízes ganham porta de entrada. Tribunais protestam." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-024` +1 |
| **Evento A** | — |
| **Opção B** | Manter o controle interno |
| **Efeitos B** | `Capital Político` +5, `Consciência` -5, `Legitimidade` -5 |
| **Consequência B** | "Juízes seguem fiscalizados por juízes." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-024` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-180 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

## 17.11 — Cartas do Modo Influenciador (20)

### INST-181 — Influenciador Financiado por Bets

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Influenciador financiado |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 1 |
| **Técnica** | Cachê da Desgraça |
| **Cor A** | Vermelho |
| **Cor B** | Preto |
| **Problema** | Um influenciador com 10 milhões de seguidores oferece apoio. Ele pede R$ 2 milhões por mês. O dinheiro viria de uma casa de apostas. |
| **Opção A** | Recusar |
| **Efeitos A** | `Consciência` +10, `Integridade` +5, `Legitimidade` -10 |
| **Consequência A** | "O influenciador faz campanha contra você. Mas sua consciência está limpa." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Reação A** | Recusar |
| **Opção B** | Aceitar |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` +15, `Consciência` -15, `Integridade` -10 |
| **Consequência B** | "O influenciador elogia seu governo. Mas o dinheiro vem da perda de apostadores." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | — |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-181 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

### INST-182 — Boato contra a ministra

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Boato contra a ministra |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-018` |
| **Ano mínimo** | 1 |
| **Técnica** | Desmoralização |
| **Cor A** | Preto |
| **Cor B** | Verde |
| **Problema** | Perfis dizem que sua ministra do Meio Ambiente vendeu terras da Amazônia a estrangeiros. Não há prova. O boato viraliza. |
| **Opção A** | Demitir a ministra |
| **Efeitos A** | `Capital Político` +10, `Legitimidade` +5, `Integridade` -15 |
| **Consequência A** | "A ministra cai. Para muita gente, a demissão prova o boato." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-001` +1, `ACT-018` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Investigar a origem |
| **Efeitos B** | `Capital Político` -10, `Legitimidade` -5, `Integridade` +10 |
| **Consequência B** | "A PF rastreia os perfis. O boato segue no ar." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-018` +1 |
| **Evento B** | — |
| **Reação B** | Investigar |
| **Aprendizado** | APR-182 (doc 18) |
| **Status** | provisório (DP-021) |

### INST-183 — Vídeo falso de você

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vídeo falso de você |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Técnica** | Deepfake |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Um vídeo feito com IA mostra você. Nele, você anuncia o fim do auxílio. É falso, mas milhões de pessoas acreditam. |
| **Opção A** | Revidar com vídeo falso |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` +5, `Integridade` -15, `Consciência` -5 |
| **Consequência A** | "Seu time solta um vídeo falso do rival. As redes viram uma guerra de mentiras." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-023` -1 |
| **Evento A** | "Todo vídeo vira suspeito. Até os verdadeiros." · atraso 1 · `Integridade` -10, `Consciência` -5 |
| **Reação A** | Aceitar |
| **Opção B** | Pedir perícia à PF |
| **Efeitos B** | `Integridade` +10, `Consciência` +5, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência B** | "A perícia prova a fraude. O desmentido chega a menos gente que a mentira." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-023` +1 |
| **Evento B** | — |
| **Reação B** | Investigar |
| **Aprendizado** | APR-183 (doc 18) |
| **Status** | provisório (DP-021) |

### INST-184 — Pânico na fronteira

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pânico na fronteira |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 1 |
| **Técnica** | Pânico Moral |
| **Cor A** | Preto |
| **Cor B** | Roxo |
| **Problema** | Vídeos culpam refugiados de um país vizinho por todo crime e toda doença. É falso, mas a cidade da fronteira entra em pânico. |
| **Opção A** | Fechar a fronteira |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` +5, `Dignidade` -15, `Integridade` -10 |
| **Consequência A** | "A fronteira fecha. Famílias ficam presas do outro lado." |
| **Eixo A** | [0, -2, -1, -1] |
| **Atores A** | `ACT-010` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Acolher e checar os fatos |
| **Efeitos B** | `Dignidade` +10, `Consciência` +5, `Legitimidade` -10, `Caixa` -10 |
| **Consequência B** | "Os refugiados ficam. Parte da cidade ajuda, parte tem medo." |
| **Eixo B** | [0, +2, +1, 0] |
| **Atores B** | `ACT-010` +1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-184 (doc 18) |
| **Status** | provisório (DP-021) |

### INST-185 — Streamer critica o governo

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Streamer critica o governo |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 1 |
| **Técnica** | Desmoralização |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | Um streamer com 3 milhões de seguidores detona seu governo. Aliados querem espalhar, sem prova, que ele é pago por um rival. |
| **Opção A** | Espalhar o boato |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` +5, `Integridade` -10, `Consciência` -10 |
| **Consequência A** | "O boato pega. O streamer perde patrocínio e para de falar de política." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-024` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Debater ao vivo |
| **Efeitos B** | `Consciência` +10, `Integridade` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência B** | "Você entra na live dele. A audiência bate recorde, e as críticas também." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-024` +1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-185 (doc 18) |
| **Status** | provisório (DP-021) |

### INST-186 — Robôs de outro país

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Robôs de outro país |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-008` |
| **Ano mínimo** | 2 |
| **Técnica** | Fazenda de IA |
| **Cor A** | Preto |
| **Cor B** | Amarelo |
| **Problema** | Pesquisadores acham 8 mil perfis falsos que atacam seu governo. Uma potência estrangeira opera a rede. |
| **Opção A** | Investigar e expor |
| **Efeitos A** | `Soberania` +10, `Segurança` +5, `Integridade` +5, `Capital Político` -10 |
| **Consequência A** | "O mundo vê a interferência. A potência nega e ameaça retaliar." |
| **Eixo A** | [0, -1, 0, +1] |
| **Atores A** | `ACT-021` -1, `ACT-008` +1 |
| **Evento A** | "A potência estrangeira suspende compras do Brasil." · atraso 1 · `Caixa` -15 |
| **Reação A** | Investigar |
| **Opção B** | Abafar o caso |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Soberania` -15, `Integridade` -10 |
| **Consequência B** | "O comércio segue. Os perfis falsos também." |
| **Eixo B** | [+1, +1, 0, -1] |
| **Atores B** | `ACT-021` +1, `ACT-008` -1 |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-186 (doc 18) |
| **Status** | provisório (DP-021) |

### INST-187 — Aula contra os indígenas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aula contra os indígenas |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-013` |
| **Ano mínimo** | 1 |
| **Técnica** | Didatismo Acusatório |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | Um canal com cara de aula 'ensina' que indígenas destroem a floresta. É falso, e os anúncios do seu governo pagam parte dos vídeos. |
| **Opção A** | Tirar os anúncios |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "O canal perde a verba. Aliados dele no Congresso falam em censura." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-001` -1, `ACT-013` +1 |
| **Evento A** | — |
| **Reação A** | Recusar |
| **Opção B** | Manter os anúncios |
| **Efeitos B** | `Capital Político` +10, `Consciência` -15, `Dignidade` -5 |
| **Consequência B** | "O canal cresce com dinheiro público. Nas escolas, alunos repetem a aula." |
| **Eixo B** | [0, 0, -1, 0] |
| **Atores B** | `ACT-001` +1, `ACT-013` -1 |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-187 (doc 18) |
| **Status** | provisório (DP-021) |

### INST-188 — Golpe com rosto famoso

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Golpe com rosto famoso |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Técnica** | Deepfake |
| **Cor A** | Azul |
| **Cor B** | Laranja |
| **Problema** | Anúncios usam um vídeo falso de um médico famoso para vender uma 'cura' do diabetes. A plataforma lucra e não tira do ar. |
| **Opção A** | Multar a plataforma |
| **Efeitos A** | `Dignidade` +10, `Soberania` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "A plataforma paga a multa e acusa o Brasil de censurar a internet." |
| **Eixo A** | [-1, -1, 0, 0] |
| **Atores A** | `ACT-020` -1, `ACT-014` +1 |
| **Evento A** | — |
| **Reação A** | Recusar |
| **Opção B** | Esperar a autorregulação |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Integridade` -10 |
| **Consequência B** | "A plataforma promete agir. Os anúncios falsos seguem no ar." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-020` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-188 (doc 18) |
| **Status** | provisório (DP-021) |

### INST-189 — Elogio de robô

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Elogio de robô |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 3 |
| **Técnica** | Fazenda de IA |
| **Cor A** | Amarelo |
| **Cor B** | Laranja |
| **Problema** | Uma agência oferece 5 mil perfis falsos para elogiar seu governo nas redes. Ela garante: ninguém percebe que são robôs. |
| **Opção A** | Contratar a agência |
| **Efeitos A** | `Legitimidade` +15, `Capital Político` +5, `Caixa` -10, `Integridade` -15 |
| **Consequência A** | "Os elogios inundam as redes. O debate fica mais barulhento e mais falso." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-011` +1 |
| **Evento A** | "Uma reportagem revela os perfis pagos pelo governo." · atraso 1 · `Legitimidade` -10, `Integridade` -10 |
| **Reação A** | Aceitar |
| **Opção B** | Recusar a oferta |
| **Efeitos B** | `Integridade` +10, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência B** | "Você fica só com perfis reais. Os ataques dominam as redes." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-011` -1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-189 (doc 18) |
| **Status** | provisório (DP-021) |

### INST-190 — Medo da vacina

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Medo da vacina |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 1 |
| **Técnica** | Pânico Moral |
| **Cor A** | Laranja |
| **Cor B** | Vermelho |
| **Problema** | Vídeos dizem que a vacina contra o HPV paralisa meninas. É boato, mas pais desmarcam a vacinação nas escolas. |
| **Opção A** | Investigar quem lucra |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -10, `Dignidade` -10 |
| **Consequência A** | "A PF acha canais que vendem 'vacina natural'. O medo continua nas escolas." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Reação A** | Investigar |
| **Opção B** | Campanha com médicos |
| **Efeitos B** | `Dignidade` +10, `Consciência` +5, `Caixa` -15, `Legitimidade` -5 |
| **Consequência B** | "Médicos vão às escolas e às redes. A campanha custa caro e demora." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-014` +1 |
| **Evento B** | "A procura pela vacina volta a subir nas escolas." · atraso 2 · `Dignidade` +10 |
| **Reação B** | Recusar |
| **Aprendizado** | APR-190 (doc 18) |
| **Status** | provisório (DP-021) |

### INST-191 — Curso que culpa o pobre

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Curso que culpa o pobre |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 1 |
| **Técnica** | Didatismo Acusatório |
| **Cor A** | Azul |
| **Cor B** | Vermelho |
| **Problema** | Um coach oferece de graça seu curso a jovens do programa de emprego. A aula 'ensina' que pobre é pobre porque quer. É falso. |
| **Opção A** | Aceitar o curso |
| **Efeitos A** | `Legitimidade` +10, `Caixa` +5, `Consciência` -15, `Dignidade` -5 |
| **Consequência A** | "Os jovens aprendem a culpar quem é pobre. Até a si mesmos." |
| **Eixo A** | [+1, 0, 0, 0] |
| **Atores A** | `ACT-022` +1, `ACT-013` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Investigar quem financia |
| **Efeitos B** | `Integridade` +10, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência B** | "Uma casa de apostas banca o curso. O coach chama você de inimigo." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-022` -1 |
| **Evento B** | — |
| **Reação B** | Investigar |
| **Aprendizado** | APR-191 (doc 18) |
| **Status** | provisório (DP-021) |

### INST-192 — Boato da taxa no Pix

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Boato da taxa no Pix |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-007` |
| **Ano mínimo** | 1 |
| **Técnica** | Pânico Moral |
| **Cor A** | Vermelho |
| **Cor B** | Amarelo |
| **Problema** | A Receita passa a fiscalizar grandes movimentações por Pix. Vídeos dizem que o governo vai taxar o Pix. É falso, mas o medo cresce. |
| **Opção A** | Manter e explicar |
| **Efeitos A** | `Integridade` +10, `Caixa` +5, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência A** | "A norma fica. O desmentido demora, e parte do país passa a evitar o Pix." |
| **Eixo A** | [-1, 0, 0, -1] |
| **Atores A** | `ACT-007` +1 |
| **Evento A** | — |
| **Reação A** | Recusar |
| **Opção B** | Revogar a norma |
| **Efeitos B** | `Legitimidade` +10, `Capital Político` +5, `Integridade` -10, `Consciência` -5 |
| **Consequência B** | "O recuo vira 'prova' do boato. A Receita deixa de enxergar o dinheiro digital." |
| **Eixo B** | [+1, 0, 0, +1] |
| **Atores B** | `ACT-007` -1 |
| **Evento B** | "O crime organizado usa contas digitais para lavar dinheiro." · atraso 2 · `Segurança` -10, `Caixa` -10 |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-192 (doc 18) |
| **Status** | provisório (DP-023) |

### INST-193 — Indicação para o Esporte

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Indicação para o Esporte |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-011` |
| **Ano mínimo** | 2 |
| **Técnica** | Cachê da Desgraça |
| **Cor A** | Azul |
| **Cor B** | Amarelo |
| **Problema** | Um partido aliado indica para o Ministério do Esporte um ex-influenciador que lucrou com a perda dos seguidores nas apostas. |
| **Opção A** | Recusar a indicação |
| **Efeitos A** | `Integridade` +10, `Consciência` +5, `Capital Político` -15 |
| **Consequência A** | "O partido se sente traído e passa a votar contra seus projetos." |
| **Eixo A** | [0, 0, 0, 0] |
| **Atores A** | `ACT-011` -1 |
| **Evento A** | — |
| **Reação A** | Recusar |
| **Opção B** | Aceitar a indicação |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` +10, `Integridade` -10, `Consciência` -10 |
| **Consequência B** | "O ministro traz os fãs dele ao governo. E traz as casas de apostas." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-011` +1, `ACT-022` +1 |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-193 (doc 18) |
| **Status** | provisório (DP-023) |

### INST-194 — Comissão sobre a perda

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Comissão sobre a perda |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-014` |
| **Ano mínimo** | 2 |
| **Técnica** | Cachê da Desgraça |
| **Cor A** | Vermelho |
| **Cor B** | Laranja |
| **Problema** | Casas de apostas pagam influenciadores com parte do que os seguidores perdem. Um projeto quer proibir esse pagamento. |
| **Opção A** | Proibir a comissão |
| **Efeitos A** | `Dignidade` +10, `Consciência` +5, `Caixa` -10, `Legitimidade` -5 |
| **Consequência A** | "A comissão acaba. Muitos influenciadores largam as apostas e viram oposição." |
| **Eixo A** | [-1, 0, 0, 0] |
| **Atores A** | `ACT-014` +1, `ACT-022` -1 |
| **Evento A** | "Menos jovens se endividam com apostas." · atraso 2 · `Dignidade` +10 |
| **Reação A** | Recusar |
| **Opção B** | Deixar o setor se regular |
| **Efeitos B** | `Caixa` +10, `Capital Político` +5, `Consciência` -10, `Dignidade` -10 |
| **Consequência B** | "As apostas seguem em alta. Os influenciadores lucram com cada perda." |
| **Eixo B** | [+1, 0, 0, 0] |
| **Atores B** | `ACT-022` +1, `ACT-014` -1 |
| **Evento B** | — |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-194 (doc 18) |
| **Status** | provisório (DP-023) |

### INST-195 — Boato contra as urnas

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Boato contra as urnas |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 2 |
| **Técnica** | Desmoralização |
| **Cor A** | Preto |
| **Cor B** | Vermelho |
| **Problema** | Seu aliado perde uma eleição apertada. Influenciadores da sua base dizem que houve fraude nas urnas. É falso. |
| **Opção A** | Duvidar das urnas |
| **Efeitos A** | `Capital Político` +10, `Legitimidade` +5, `Integridade` -15, `Consciência` -5 |
| **Consequência A** | "Sua base vai às ruas. Mas foram essas urnas que elegeram você." |
| **Eixo A** | [0, 0, 0, -2] |
| **Atores A** | `ACT-022` +1, `ACT-023` -1 |
| **Evento A** | "Parte do país deixa de confiar em qualquer eleição." · atraso 1 · `Legitimidade` -10, `Integridade` -5 |
| **Reação A** | Aceitar |
| **Opção B** | Reconhecer o resultado |
| **Efeitos B** | `Integridade` +10, `Legitimidade` +5, `Capital Político` -15 |
| **Consequência B** | "Você parabeniza os eleitos. Aliados dizem que você entregou o jogo." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-023` +1, `ACT-022` -1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-195 (doc 18) |
| **Status** | provisório (DP-023) |

### INST-196 — Denúncia em massa

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Denúncia em massa |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-018` |
| **Ano mínimo** | 1 |
| **Técnica** | Fazenda de IA |
| **Cor A** | Verde |
| **Cor B** | Laranja |
| **Problema** | Uma ativista mostra garimpo ilegal na Amazônia. Perfis falsos denunciam a conta dela em massa, e a plataforma a suspende. |
| **Opção A** | Investigar os robôs |
| **Efeitos A** | `Integridade` +10, `Soberania` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência A** | "Os dados mostram robôs pagos pelo garimpo ilegal. A plataforma fala em censura." |
| **Eixo A** | [0, -1, 0, +1] |
| **Atores A** | `ACT-018` +1, `ACT-020` -1 |
| **Evento A** | — |
| **Reação A** | Investigar |
| **Opção B** | Deixar com a plataforma |
| **Efeitos B** | `Capital Político` +10, `Legitimidade` +5, `Consciência` -10, `Soberania` -5 |
| **Consequência B** | "A conta segue fora do ar. Outras vozes contra o garimpo se calam." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-020` +1, `ACT-018` -1 |
| **Evento B** | "O garimpo ilegal avança onde a ativista denunciava." · atraso 1 · `Soberania` -10 |
| **Reação B** | Aceitar |
| **Aprendizado** | APR-196 (doc 18) |
| **Status** | provisório (DP-023) |

### INST-197 — Aula contra o eleitor rival

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Aula contra o eleitor rival |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 3 |
| **Técnica** | Didatismo Acusatório |
| **Cor A** | Roxo |
| **Cor B** | Azul |
| **Problema** | Um canal da sua base dá 'aulas' que ensinam a ver quem vota no rival como inimigo do país. Os vídeos viralizam. |
| **Opção A** | Compartilhar a aula |
| **Efeitos A** | `Capital Político` +10, `Legitimidade` +5, `Consciência` -15 |
| **Consequência A** | "Sua base se inflama. Nas famílias, quem vota no rival vira inimigo." |
| **Eixo A** | [0, 0, 0, -1] |
| **Atores A** | `ACT-024` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Pedir que o canal pare |
| **Efeitos B** | `Consciência` +10, `Integridade` +5, `Capital Político` -10, `Legitimidade` -5 |
| **Consequência B** | "O canal obedece e acusa você de trair a base. A militância esfria." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-024` +1, `ACT-013` +1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-197 (doc 18) |
| **Status** | provisório (DP-023) |

### INST-198 — Vídeo falso do vizinho

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Vídeo falso do vizinho |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-010` |
| **Ano mínimo** | 1 |
| **Técnica** | Deepfake |
| **Cor A** | Verde |
| **Cor B** | Amarelo |
| **Problema** | Em um vídeo, o presidente de um país vizinho anuncia o fim da compra de carne do Brasil. O Itamaraty suspeita de IA. O agro quer revide. |
| **Opção A** | Retaliar o vizinho |
| **Efeitos A** | `Legitimidade` +10, `Soberania` +5, `Integridade` -10, `Consciência` -5 |
| **Consequência A** | "Você taxa os produtos do vizinho. Dias depois, o vídeo se revela falso." |
| **Eixo A** | [0, -1, 0, 0] |
| **Atores A** | `ACT-001` +1, `ACT-010` -1 |
| **Evento A** | "O vizinho revida e fecha o mercado a produtos do Brasil." · atraso 1 · `Caixa` -15 |
| **Reação A** | Aceitar |
| **Opção B** | Confirmar com o vizinho |
| **Efeitos B** | `Integridade` +10, `Segurança` +5, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência B** | "O vizinho desmente o vídeo. Nas redes, o agro chama você de fraco." |
| **Eixo B** | [0, +1, 0, 0] |
| **Atores B** | `ACT-010` +1, `ACT-001` -1 |
| **Evento B** | — |
| **Reação B** | Investigar |
| **Aprendizado** | APR-198 (doc 18) |
| **Status** | provisório (DP-023) |

### INST-199 — Rifas da facção

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Rifas da facção |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 3 |
| **Técnica** | Cachê da Desgraça |
| **Cor A** | Azul |
| **Cor B** | Preto |
| **Problema** | Influenciadores vendem rifas de carros nas redes. Quase todos perdem, e uma facção usa as rifas para lavar dinheiro. |
| **Opção A** | Seguir o dinheiro |
| **Efeitos A** | `Segurança` +10, `Integridade` +10, `Capital Político` -10, `Legitimidade` -10 |
| **Consequência A** | "A investigação leva meses. Ao fim, a Justiça bloqueia as contas da facção." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-023` +1 |
| **Evento A** | — |
| **Reação A** | Investigar |
| **Opção B** | Prender ao vivo |
| **Efeitos B** | `Legitimidade` +10, `Segurança` +5, `Integridade` -10, `Dignidade` -5 |
| **Consequência B** | "As prisões viram espetáculo. O dinheiro da facção some antes do bloqueio." |
| **Eixo B** | [0, 0, -1, -1] |
| **Atores B** | — |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-199 (doc 18) |
| **Status** | provisório (DP-023) |

### INST-200 — Pânico contra o funk

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Pânico contra o funk |
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-019` |
| **Ano mínimo** | 1 |
| **Técnica** | Pânico Moral |
| **Cor A** | Preto |
| **Cor B** | Roxo |
| **Problema** | Vídeos chamam o baile funk de 'escola do crime'. É falso, mas um projeto quer proibir os bailes. |
| **Opção A** | Apoiar a proibição |
| **Efeitos A** | `Legitimidade` +10, `Capital Político` +5, `Consciência` -10, `Dignidade` -10 |
| **Consequência A** | "Os bailes viram caso de polícia. Os jovens perdem o lazer do bairro." |
| **Eixo A** | [0, 0, -1, -1] |
| **Atores A** | `ACT-022` +1, `ACT-019` -1 |
| **Evento A** | — |
| **Reação A** | Aceitar |
| **Opção B** | Regularizar os bailes |
| **Efeitos B** | `Dignidade` +10, `Consciência` +5, `Legitimidade` -10, `Caixa` -5 |
| **Consequência B** | "Os bailes ganham alvará. Seus rivais dizem que você apoia o crime." |
| **Eixo B** | [0, 0, +1, +1] |
| **Atores B** | `ACT-019` +1 |
| **Evento B** | — |
| **Reação B** | Recusar |
| **Aprendizado** | APR-200 (doc 18) |
| **Status** | provisório (DP-023) |

---

## 17.12 — Cartas Temáticas (70)

7 temas × 10 cartas, em blocos de 10 IDs (DP-013, provisória). O `Modo` de cada carta temática é a arena onde o dilema se decide; cada tema passa por ≥ 3 modos e cada modo recebe de 5 a 9 temáticas (evitar o modo Impeachment).

| Tema | IDs | Chave `theme` | Fonte no repositório |
| :--- | :--- | :--- | :--- |
| Reforma Agrária | THEM-001..010 | `land_reform` | `docs/17` (THEM-001); `docs/03` §03.07; ACT-017 |
| Meio Ambiente | THEM-011..020 | `environment` | `docs/01_CONTEXTO_E_MOTIVACAO.md:9`; ACT-018 |
| Fome | THEM-021..030 | `hunger` | `docs/09_GLOSSARIO.md:542`; `docs/03` §03.20 |
| Saúde | THEM-031..040 | `health` | `docs/03` §03.18; ACT-014 |
| Trabalho | THEM-041..050 | `labor` | `docs/03` §03.19; ACT-015 |
| Racismo | THEM-051..060 | `racism` | `docs/03` §03.01; `docs/09` (ninguendade) |
| Cultura | THEM-061..070 | `culture` | `docs/03` §03.10; ACT-019 |

### THEM-001 — Reforma Agrária

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Reforma agrária |
| **Tipo** | Temática |
| **Modo** | Bancadas |
| **Tema** | Reforma Agrária |
| **Quem fala** | `ACT-017` |
| **Ano mínimo** | 1 |
| **Cor A** | Roxo |
| **Cor B** | Verde |
| **Problema** | O MST ocupa uma fazenda improdutiva. O agronegócio pressiona por despejo. |
| **Opção A** | Assentar as famílias |
| **Efeitos A** | `Dignidade` +10, `Soberania` +5, `Capital Político` -15 |
| **Consequência A** | "A terra é repartida. O agro protesta." |
| **Eixo A** | [-2, 0, +1, 0] |
| **Atores A** | — |
| **Evento A** | — |
| **Opção B** | Ordenar o despejo |
| **Efeitos B** | `Capital Político` +10, `Dignidade` -10, `Integridade` -5 |
| **Consequência B** | "A polícia despeja as famílias. O agro comemora." |
| **Eixo B** | [+2, 0, 0, -1] |
| **Atores B** | — |
| **Evento B** | — |
| **Aprendizado** | APR-THEM-001 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

---

## 17.13 — Cartas de Atores (70)

Numeração sequencial por ator, na ordem exigência → ataque → oferta; `ACT-010` e `ACT-021` não têm oferta (`gdd/sistemas/07_atores.md` §3.4; DP-015, provisória). O `Modo` de cada carta sai dos "Modos em que Aparece" do ator (`docs/12_FICHAS_DOS_MODOS.md` §12.3.3).

| Ator | IDs | Ator | IDs | Ator | IDs |
| :--- | :--- | :--- | :--- | :--- | :--- |
| ACT-001 | 001-003 | ACT-009 | 025-027 | ACT-017 | 048-050 |
| ACT-002 | 004-006 | ACT-010 | 028-029 | ACT-018 | 051-053 |
| ACT-003 | 007-009 | ACT-011 | 030-032 | ACT-019 | 054-056 |
| ACT-004 | 010-012 | ACT-012 | 033-035 | ACT-020 | 057-059 |
| ACT-005 | 013-015 | ACT-013 | 036-038 | ACT-021 | 060-061 |
| ACT-006 | 016-018 | ACT-014 | 039-041 | ACT-022 | 062-064 |
| ACT-007 | 019-021 | ACT-015 | 042-044 | ACT-023 | 065-067 |
| ACT-008 | 022-024 | ACT-016 | 045-047 | ACT-024 | 068-070 |

### ATOR-001 — Latifundiários

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | O Latifundiário cobra o favor |
| **Tipo** | Ator |
| **Modo** | Congresso |
| **Função** | `ACT-001` · Exigência |
| **Quem fala** | `ACT-001` |
| **Ano mínimo** | 1 |
| **Cor A** | Vermelho |
| **Cor B** | Verde |
| **Problema** | O Latifundiário oferece 50 mil votos em troca de controle total sobre a nomeação de juízes e delegados em sua região. |
| **Opção A** | Recusar |
| **Efeitos A** | `Capital Político` -15, `Dignidade` +10, `Integridade` +5 |
| **Consequência A** | "O Latifundiário fica furioso. Mas a dignidade é preservada." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-001` -1 |
| **Evento A** | — |
| **Opção B** | Aceitar |
| **Efeitos B** | `Capital Político` +20, `Dignidade` -15, `Integridade` -10 |
| **Consequência B** | "O Latifundiário garante votos. Mas a impunidade aumenta." |
| **Eixo B** | [0, 0, 0, -2] |
| **Atores B** | `ACT-001` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-001 (doc 18) |
| **Status** | aprovado; campos novos e ajustes provisórios (DP-016) |

---

## 17.14 — Resumo do Roteiro

| Tipo | Escritas | Total |
| :--- | :--- | :--- |
| **Institucionais** | 200 | 200 |
| **Temáticas** | 1 | 70 |
| **Atores** | 1 | 70 |
| **Total** | **202** | **340** |
| Cena de impeachment (fora das 340) | 5 | 5 |

---

## 17.15 — Referências

- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- ICON GAMES. *Senhor Presidente*. 2016.
- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.

---

**Última atualização:** 2026-10-19 (avaliação dos wireframes, D-161 a D-169)
**Versão:** 1.1 (em desenvolvimento)

