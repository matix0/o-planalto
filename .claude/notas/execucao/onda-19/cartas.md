# Onda 19 do P-015 — INST-176 a INST-180 — rascunho do GD (modo D-196)

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-22 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO — todas as cartas `pendente de revisão (D-196)`; nada gravado no doc 17.
**Conferência:** `PYTHONDONTWRITEBYTECODE=1 python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-19/cartas.md --no-learning --wave-report --style`

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

### INST-176 — Prisão de Banqueiro

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

---

**Notas do GD (INST-176):** Troca de foco do tema "Prisão de banqueiro" (doc 12 :493) para a delação; não repete a INST-167 (habeas corpus).

### INST-177 — Juiz Recebe Propina

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

---

**Notas do GD (INST-177):** Troca do tema "Juiz recebe propina" (doc 12 :494), próximo da INST-162. Proposta ao PO.

### INST-178 — Porte de Drogas Não É Crime

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

---

**Notas do GD (INST-178):** Troca do tema "Porte de drogas" (doc 12 :495), já na INST-083 (Prisional). Proposta ao PO.

### INST-179 — PF Prende Lobista do STJ

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

---

**Notas do GD (INST-179):** Troca de foco do tema "lobista do STJ" (doc 12 :496) para o mecanismo do impedimento, sem caso real (RC-08).

### INST-180 — Ouvidoria Externa do Judiciário

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

**Notas do GD (INST-180):** Tema do banco (doc 12 :497).


## Relatório do script

```

5 cartas conferidas, 0 erros.

Avisos do baralho (todas as cartas do doc 17):
  Eventos: 2 de 10 opções (20%; meta 15-25%, D-125)
  Eixo Economia ≠ 0: 1 (10%)  ⚠ abaixo de 15% (D-126)
  Eixo Diplomacia ≠ 0: 0 (0%)  ⚠ abaixo de 15% (D-126)
  Eixo Sociedade ≠ 0: 2 (20%)
  Eixo Estado ≠ 0: 3 (30%)
  Cor black: dignity -10, legitimacy -5, security +10
  Cor blue: awareness +5, integrity +25, legitimacy +5, political_capital -25
  Cor green: awareness -5, integrity -10, political_capital +10
  Cor orange: integrity +10, political_capital -15, treasury +10
  Cor purple: awareness +10, legitimacy +10, political_capital -15
  Cor red: dignity +10, integrity +5, security -10
  Cor yellow: awareness -10, integrity -20, legitimacy -5, political_capital +25, treasury -10
  Carta ligada — dignity: 1 opções com efeito positivo (0 com ano mínimo 2-4)
  Carta ligada — awareness: 2 opções com efeito positivo (2 com ano mínimo 2-4)
  Carta ligada — sovereignty: 0 opções com efeito positivo (0 com ano mínimo 2-4)
  Carta ligada — security: 1 opções com efeito positivo (0 com ano mínimo 2-4)
  Carta ligada — integrity: 4 opções com efeito positivo (3 com ano mínimo 2-4)
  Carta ligada — treasury: 1 opções com efeito positivo (1 com ano mínimo 2-4)
  Carta ligada — political_capital: 4 opções com efeito positivo (4 com ano mínimo 2-4)
  Carta ligada — legitimacy: 2 opções com efeito positivo (2 com ano mínimo 2-4)
  Cartas por modo/tipo: judiciary 5
```

## Propostas ao PO

- Trocas de tema registradas nas notas (repetição com cartas escritas ou desfecho da cena). Diplomacia abaixo da meta: o Judiciário quase não tem ator de fora.
- Sem PSI (D-196); temas sensíveis marcados nas notas.
