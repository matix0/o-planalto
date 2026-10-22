# Onda 8 do P-015 — Orçamento (INST-039, 040) e Currículo e Mídia (INST-043 a 050) — rascunho do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015` · **Modo:** D-196 (sem pesquisa web)
**Status:** CONCLUÍDO — rascunho para o PSI e o PO; todas as cartas "provisório (DP-pendente)".

## Progresso

- [x] Brief D-196, kit, fichas MOD-002/003 (`docs/12_FICHAS_DOS_MODOS.md:121-215`), INST-021/022/041/042 (doc 17 `:235-345`), Ondas 5-7
- [x] 10 cartas escritas
- [x] Check com 0 erros e 0 avisos
- [x] Aprendizados (md + json)

## Convenções desta onda

- Onda 7 ainda vazia em `onda-07/cartas.md` (só cabeçalho) quando esta foi escrita: o título planejado INST-039 "Verba para cisternas" repete o INST-032 "Cisternas no Nordeste" (`docs/12_FICHAS_DOS_MODOS.md:146,153`); a 039 vira **renúncia fiscal** (proposta ao PO nº 1).
- Um mecanismo por carta; nenhum número no texto; nenhuma pessoa real.

---

### INST-039 — Isenção Fiscal Invisível

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
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-039):** Gasto tributário: a renúncia de receita não passa pela disputa do orçamento como um gasto comum. Não repete a INST-026 (criar imposto) nem a INST-024 (bloqueio). `ACT-015` defende o emprego na fábrica. Eixo Eco ±1.

### INST-040 — Taxar Grandes Heranças

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
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-040):** Mecanismo federativo (imposto estadual, teto pelo Senado), diferente da INST-026 (imposto federal sobre fortunas × consumo). Ano 2: carta ligada a Dignidade+. Afirmação do teto pelo Senado vai para a pista.

### INST-043 — Educação Sexual

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
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-043):** Pânico moral (tema do modo). Sem detalhe gráfico; a aula é de proteção, não de sexo. Ano 2: carta ligada a Segurança+. Sem evento de propósito, para não dramatizar um caso de abuso. Dúvida ao PSI.

### INST-044 — Fake News em Emissora

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
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-044):** Mito desmentido traz "É falso" na carta (kit §5). Não repete a INST-042 (renovação de concessão por troca de apoio): aqui o dilema é resposta × punição. Cassar = Est −2 (controle).

### INST-045 — Proibição de Ideologia de Gênero

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
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-045):** Escolha técnica do livro didático × pressão política. Não repete a INST-011 (Escola sem Partido, Onda 5) nem a INST-041. Evita o termo "ideologia de gênero" no texto ao jogador (rótulo). Ano 2: Dignidade+.

### INST-046 — Privatização da TV Pública

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
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-046):** Comunicação pública ≠ estatal: o conselho separa a TV do governo (Est +1). Comprador estrangeiro dá Diplomacia (kit §4).

### INST-047 — Método Paulo Freire

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
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-047):** Educação de jovens e adultos; não nomeia o educador no texto (título interno). Ano 3: Dignidade+. Opção B com ganho pequeno de Consciência para não virar "moral por cor" (D-097).

### INST-048 — TV Comunitária

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
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-048):** Mídia alternativa por outorga de rádio comunitária (mais próxima do público que TV). "Quebrada" é gíria do público-alvo; o PSI confere se soa estereotipado.

### INST-049 — Educação Financeira em vez de Sociologia

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
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-049):** Patrocínio privado no currículo; não repete a INST-041 (retirar disciplinas). Banco estrangeiro dá Diplomacia.

### INST-050 — Influenciadora Dando Aula de Cidadania

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
| **Status** | provisório (DP-pendente) |

---

**Notas do GD (INST-050):** Alcance × conteúdo; o coach é o ator ACT-022 (arquétipo, sem pessoa real). Não repete o Influenciador (MOD-010): aqui o dilema é contratação pública.

## Relatório do script

`check --no-learning --wave-report --style`: 10 cartas, 0 erros, 0 avisos de estilo. Eventos 5/20 (25%); Diplomacia ≠ 0 em 4 opções; Sociedade 25%; carta ligada: Dignidade+ com ano 2-4 em 3 opções (040, 045, 047), Segurança+ em 1 (043). `box --json aprendizados.json` sai 0.

## Propostas ao PO

1. INST-039: trocar "Verba para cisternas" (repete INST-032) por renúncia fiscal.
2. INST-045 e 049: títulos internos da ficha mantidos; o texto ao jogador evita "ideologia de gênero" e não fala em trocar Sociologia (já coberto na 041).

## Dúvidas ao PSI

1. INST-043 (abuso infantil): tom, ausência de evento, se "Barrar as aulas" com Segurança −10 é moral por cor.
2. INST-045: "famílias de vários tipos" é claro sem ser panfletário?
3. INST-048: "quebrada" no título soa estereotipado?
4. INST-047: consequência "Críticos dizem que o método doutrina" é equilibrada?
5. INST-044: vacina como tema de mentira ("É falso") pede fonte no P-016.

## Autoconferência (citações)

- Cartas planejadas do Orçamento: `docs/12_FICHAS_DOS_MODOS.md:135-156` — conferido.
- Cartas planejadas do Currículo: `docs/12_FICHAS_DOS_MODOS.md:186-205` — conferido.
- INST-041 Quem fala Congresso, B Preto: `docs/17_ROTEIRO_DAS_CARTAS.md:293-318` — conferido.
- INST-026 fortunas × consumo: `onda-06/cartas.md:273` — conferido.
- INST-011 Escola sem Partido: `onda-05/cartas.md` (problema) — conferido.
