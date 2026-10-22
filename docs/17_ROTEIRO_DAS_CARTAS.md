# 17 — Roteiro das Cartas

**Roteiro das cartas do jogo "O Planalto"**

Este documento guarda o texto das cartas, organizadas por modo e por tipo. **Status: 87 de 340 cartas escritas + 5 cartas da cena de impeachment (`IMP-1..5`, fora das 340, D-101).** Contagem refeita na Onda 0 do P-015 (DP-012); cartas novas escritas em ondas (`gestao/prompts/criacao-cartas.md`). Revisado no P-010 (2026-10-13): cor por opção (D-092), opções A/B com lado sorteado (D-084), Carta de Aprendizado no doc 18 (D-090).

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
| **Institucionais** | 85 | 200 |
| **Temáticas** | 1 | 70 |
| **Atores** | 1 | 70 |
| **Total** | **87** | **340** |
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

