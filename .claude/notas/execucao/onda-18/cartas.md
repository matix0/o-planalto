# Onda 18 do P-015 — INST-166 a INST-175 — rascunho do GD (modo D-196)

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-18/cartas.md --no-learning --wave-report --style`

## Progresso

- [x] Brief D-196, kit, doc 12 (MOD-008 :409-449, MOD-009 :459-497), DP-011, GDD 03, doc 17 (títulos já escritos e INST-161 :3313), títulos das Ondas 1-12
- [x] Cartas escritas
- [x] Check com 0 erros e 0 avisos de estilo
- [x] Aprendizados (md e json)

## Convenções desta onda

- Impeachment (DP-011): pressão e legitimidade antes do processo, nunca as fases da cena IMP-1..5. Onda 15/16 (INST-141..154) não existiam ao escrever; conferir repetição no fechamento.
- Judiciário: um mecanismo por carta, com alavanca real do Executivo (lei, PEC, indicação, Defensoria, PF). Nenhuma pessoa nem caso identificável (RC-08, D-190).
- Temas do doc 12 que repetiam cartas escritas (INST-005, 083, 097, 123, 161) foram trocados; ver notas e propostas.
- Nenhum número no texto ao jogador; fatos na pista do Aprendizado.

---

### INST-166 — Prisão em Segunda Instância

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

---

**Notas do GD (INST-166):** Tema do banco (doc 12 :483).

### INST-167 — Habeas Corpus para Banqueiro

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

---

**Notas do GD (INST-167):** Tema "Seletividade" (doc 12 :484), com alavanca do Executivo.

### INST-168 — PF Investiga Ministro do STF

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

---

**Notas do GD (INST-168):** Troca do tema (doc 12 :485): a INST-161 já trata de apoiar a investigação de um ministro. Proposta ao PO.

### INST-169 — CNJ Afasta Juiz

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

---

**Notas do GD (INST-169):** Troca do tema "CNJ afasta juiz" (doc 12 :486), que se sobrepõe à INST-162 e à INST-180. Proposta ao PO.

### INST-170 — Aumento do Número de Ministros do STF

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

---

**Notas do GD (INST-170):** Tema do banco (doc 12 :487). Não repete a INST-004 nem a INST-122 (indicação de uma vaga).

### INST-171 — Juiz Bloqueia Demarcação Indígena

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

---

**Notas do GD (INST-171):** Troca do tema "demarcação indígena" (doc 12 :488), que repete a INST-005 e a INST-123 (Marco Temporal). Proposta ao PO.

### INST-172 — Julgamento do Marco Temporal

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

---

**Notas do GD (INST-172):** Troca do tema "Marco Temporal" (doc 12 :489), já na INST-005 e na INST-123. Proposta ao PO.

### INST-173 — Juíza Ameaçada por Milícias

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

---

**Notas do GD (INST-173):** Tema do banco (doc 12 :490). Violência sem detalhe.

### INST-174 — Homofobia é Crime

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

---

**Notas do GD (INST-174):** Tema do banco (doc 12 :491).

### INST-175 — Tribunal de Contas Aprova Contas

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

---

**Notas do GD (INST-175):** Tema "Impunidade" (doc 12 :492), com a alavanca da indicação.


## Relatório do script

```

10 cartas conferidas, 0 erros.

Avisos do baralho (todas as cartas do doc 17):
  Eventos: 4 de 20 opções (20%; meta 15-25%, D-125)
  Eixo Economia ≠ 0: 6 (30%)
  Eixo Diplomacia ≠ 0: 0 (0%)  ⚠ abaixo de 15% (D-126)
  Eixo Sociedade ≠ 0: 8 (40%)
  Eixo Estado ≠ 0: 12 (60%)
  Cor black: dignity -30, integrity +5, legitimacy -10, security +35
  Cor blue: integrity +25, legitimacy +15, political_capital -40, security +10, treasury -5
  Cor green: dignity -15, legitimacy -5, security +10
  Cor orange: dignity -5, integrity -20, political_capital +10, treasury +10
  Cor purple: awareness +5, dignity +20, political_capital -25, treasury -5
  Cor red: awareness +10, dignity +30, integrity +5, legitimacy -5, political_capital -5, security -10, treasury -30
  Cor yellow: awareness -15, integrity -10, legitimacy -20, political_capital +30
  Carta ligada — dignity: 5 opções com efeito positivo (3 com ano mínimo 2-4)
  Carta ligada — awareness: 2 opções com efeito positivo (2 com ano mínimo 2-4)
  Carta ligada — sovereignty: 0 opções com efeito positivo (0 com ano mínimo 2-4)
  Carta ligada — security: 5 opções com efeito positivo (4 com ano mínimo 2-4)
  Carta ligada — integrity: 7 opções com efeito positivo (3 com ano mínimo 2-4)
  Carta ligada — treasury: 2 opções com efeito positivo (0 com ano mínimo 2-4)
  Carta ligada — political_capital: 4 opções com efeito positivo (2 com ano mínimo 2-4)
  Carta ligada — legitimacy: 3 opções com efeito positivo (2 com ano mínimo 2-4)
  Cartas por modo/tipo: judiciary 10
```

## Propostas ao PO

- Trocas de tema registradas nas notas (repetição com cartas escritas ou desfecho da cena). Diplomacia abaixo da meta: o Judiciário quase não tem ator de fora.
- Sem PSI (D-196); temas sensíveis marcados nas notas.
