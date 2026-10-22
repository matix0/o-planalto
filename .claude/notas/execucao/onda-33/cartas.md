# Onda 33 do P-015 — Cartas de ator ATOR-062 a ATOR-070 — rascunho do GD

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

### ATOR-062 — Coach Digital

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Diploma de curso online |
| **Tipo** | Ator |
| **Modo** | Currículo e Mídia |
| **Função** | `ACT-022` · Exigência |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 1 |
| **Problema** | O Coach Digital exige que o MEC reconheça seus cursos online de empreendedorismo como formação técnica, com diploma. |
| **Opção A** | Reconhecer os cursos |
| **Cor A** | Laranja |
| **Efeitos A** | `Legitimidade` +10, `Consciência` -15 |
| **Consequência A** | "Os jovens ganham diploma rápido. O mercado não sabe o que ele vale." |
| **Eixo A** | [+1, 0, 0, +1] |
| **Atores A** | `ACT-022` +1, `ACT-013` -1 |
| **Evento A** | — |
| **Opção B** | Exigir avaliação do MEC |
| **Cor B** | Roxo |
| **Efeitos B** | `Consciência` +5, `Legitimidade` -10 |
| **Consequência B** | "O curso passa por prova. O Coach chama o MEC de inimigo do sucesso." |
| **Eixo B** | [-1, 0, 0, -1] |
| **Atores B** | `ACT-022` -1 |
| **Evento B** | "Seguidores do Coach atacam o ministro nas redes" · atraso 1 · `Capital Político` -10, `Legitimidade` -5 |
| **Aprendizado** | APR-ATOR-062 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-062):** Mecanismo: credenciamento de curso. Não repete coach na aula (INST-050) nem curso que culpa o pobre (INST-191).

### ATOR-063 — Coach Digital

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Imposto é roubo |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-022` · Ataque |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 1 |
| **Problema** | Furioso, o Coach Digital diz aos seguidores que imposto é roubo e ensina a esconder dinheiro no exterior. |
| **Opção A** | Acionar a Receita |
| **Cor A** | Preto |
| **Efeitos A** | `Caixa` +10, `Legitimidade` -10, `Capital Político` -5 |
| **Consequência A** | "A Receita autua o Coach. Ele vira mártir e vende curso sobre perseguição." |
| **Eixo A** | [-1, -1, 0, -1] |
| **Atores A** | `ACT-022` -1 |
| **Evento A** | — |
| **Opção B** | Ignorar o vídeo |
| **Cor B** | Amarelo |
| **Efeitos B** | `Capital Político` +5, `Caixa` -10, `Consciência` -5 |
| **Consequência B** | "O vídeo passa sem resposta. A sonegação vira moda entre os seguidores." |
| **Eixo B** | [+1, +1, 0, +1] |
| **Atores B** | `ACT-022` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-063 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-063):** Mecanismo: pregação da sonegação. Diplomacia: controle de remessa (−1) × deixar sair (+1).

### ATOR-064 — Coach Digital

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Coach vende o programa |
| **Tipo** | Ator |
| **Modo** | Congresso |
| **Função** | `ACT-022` · Oferta |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 2 |
| **Problema** | Aliado, o Coach Digital oferece divulgar seu programa de primeiro emprego para a legião de jovens que o segue. Quer só aparecer no vídeo. |
| **Opção A** | Gravar com o Coach |
| **Cor A** | Amarelo |
| **Efeitos A** | `Legitimidade` +15, `Dignidade` +5 |
| **Consequência A** | "O programa viraliza entre os jovens. O Coach ganha selo de governo." |
| **Eixo A** | [+1, 0, -1, 0] |
| **Atores A** | `ACT-022` +1 |
| **Evento A** | "O Coach usa o selo para vender cursos caros" · atraso 2 · `Consciência` -10, `Integridade` -5 |
| **Opção B** | Divulgar nas escolas |
| **Cor B** | Vermelho |
| **Efeitos B** | `Caixa` -10, `Dignidade` +5 |
| **Consequência B** | "A campanha chega pelas escolas técnicas. Mais lenta, sem vendedor." |
| **Eixo B** | [-1, 0, 0, 0] |
| **Atores B** | `ACT-022` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-064 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-064):** Boa Vontade na A com custo adiado no evento. Carta ligada (Ano 2, Dignidade+).

### ATOR-065 — Jornalista Independente

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Sigilo nos gastos |
| **Tipo** | Ator |
| **Modo** | Congresso |
| **Função** | `ACT-023` · Exigência |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 1 |
| **Problema** | O Jornalista Independente exige o fim do sigilo sobre visitas e gastos do palácio. Seus aliados pedem calma. |
| **Opção A** | Abrir os dados |
| **Cor A** | Verde |
| **Efeitos A** | `Integridade` +15, `Capital Político` -10 |
| **Consequência A** | "As planilhas saem. Aliados aparecem em lugares estranhos." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-023` +1, `ACT-011` -1 |
| **Evento A** | — |
| **Opção B** | Manter o sigilo |
| **Cor B** | Preto |
| **Efeitos B** | `Capital Político` +5, `Integridade` -10, `Consciência` -5 |
| **Consequência B** | "Os aliados respiram. A palavra sigilo vira manchete toda semana." |
| **Eixo B** | [0, 0, 0, -1] |
| **Atores B** | `ACT-023` -1, `ACT-011` +1 |
| **Evento B** | "Um vazamento expõe os gastos do palácio" · atraso 2 · `Integridade` -10, `Legitimidade` -10 |
| **Aprendizado** | APR-ATOR-065 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-065):** Mecanismo: transparência × proteção de aliados.

### ATOR-066 — Jornalista Independente

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Reportagem contra o ministro |
| **Tipo** | Ator |
| **Modo** | Judiciário |
| **Função** | `ACT-023` · Ataque |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 1 |
| **Problema** | Furioso, o Jornalista Independente publica uma reportagem sobre negócios de um ministro. Aliados pedem um processo para calá-lo. |
| **Opção A** | Processar o jornalista |
| **Cor A** | Preto |
| **Efeitos A** | `Capital Político` +10, `Consciência` -10, `Legitimidade` -10 |
| **Consequência A** | "O processo se arrasta. O jornalista gasta o que não tem." |
| **Eixo A** | [0, 0, 0, -2] |
| **Atores A** | `ACT-023` -1 |
| **Evento A** | — |
| **Opção B** | Investigar o ministro |
| **Cor B** | Verde |
| **Efeitos B** | `Integridade` +10, `Capital Político` -15 |
| **Consequência B** | "A Controladoria abre apuração. O ministro ameaça levar o partido embora." |
| **Eixo B** | [0, 0, 0, +1] |
| **Atores B** | `ACT-023` +1, `ACT-011` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-066 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-066):** Mecanismo: assédio judicial. Não repete ministro aliado sob suspeita (INST-007): aqui o alvo é o mensageiro.

### ATOR-067 — Jornalista Independente

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Checagem contra boatos |
| **Tipo** | Ator |
| **Modo** | Currículo e Mídia |
| **Função** | `ACT-023` · Oferta |
| **Quem fala** | `ACT-023` |
| **Ano mínimo** | 2 |
| **Problema** | Aliado, o Jornalista Independente propõe ensinar alunos de escola pública a checar boatos antes de compartilhar. |
| **Opção A** | Levar às escolas |
| **Cor A** | Verde |
| **Efeitos A** | `Consciência` +15, `Integridade` +5 |
| **Consequência A** | "Os alunos aprendem a duvidar do print. Levam a dúvida para casa." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-023` +1 |
| **Evento A** | — |
| **Opção B** | Usar a ferramenta da Meta |
| **Cor B** | Azul |
| **Efeitos B** | `Caixa` -10, `Consciência` +5 |
| **Consequência B** | "A big tech entra na escola com vídeos prontos. E com a marca dela." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-023` -1, `ACT-020` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-067 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-067):** Boa Vontade na A. Carta ligada (Ano 2, Consciência+).

### ATOR-068 — Influenciador Progressista

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Verba para canais independentes |
| **Tipo** | Ator |
| **Modo** | Orçamento |
| **Função** | `ACT-024` · Exigência |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 1 |
| **Problema** | O Influenciador Progressista quer a publicidade do governo também em canais independentes. Hoje ela vai para plataformas estrangeiras. |
| **Opção A** | Dividir a verba |
| **Cor A** | Roxo |
| **Efeitos A** | `Consciência` +5, `Legitimidade` +5, `Integridade` -10 |
| **Consequência A** | "Canais pequenos crescem. A oposição fala em mesada para aliados." |
| **Eixo A** | [-1, -1, +1, 0] |
| **Atores A** | `ACT-024` +1 |
| **Evento A** | — |
| **Opção B** | Manter as regras |
| **Cor B** | Azul |
| **Efeitos B** | `Integridade` +5, `Consciência` -5, `Capital Político` -5 |
| **Consequência B** | "A verba segue a audiência. O influenciador se sente traído." |
| **Eixo B** | [+1, +1, 0, 0] |
| **Atores B** | `ACT-024` -1, `ACT-020` +1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-068 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-068):** Mecanismo: publicidade oficial como pluralidade ou favor.

### ATOR-069 — Influenciador Progressista

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Live contra o governo |
| **Tipo** | Ator |
| **Modo** | Bancadas |
| **Função** | `ACT-024` · Ataque |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 1 |
| **Problema** | Furioso, o Influenciador Progressista faz uma live: diz que o governo traiu os jovens. Pede que ninguém vote nos aliados. |
| **Opção A** | Entrar na live |
| **Cor A** | Vermelho |
| **Efeitos A** | `Capital Político` -10, `Consciência` +5 |
| **Consequência A** | "Você assume erros ao vivo. Parte da base volta, parte não perdoa." |
| **Eixo A** | [0, 0, 0, +1] |
| **Atores A** | `ACT-024` +1 |
| **Evento A** | — |
| **Opção B** | Ignorar a live |
| **Cor B** | Azul |
| **Efeitos B** | `Capital Político` +5, `Legitimidade` -10, `Consciência` -5 |
| **Consequência B** | "O governo segue calado. Os jovens trocam o voto pela abstenção." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-024` -1 |
| **Evento B** | "Jovens desistem de tirar o título" · atraso 2 · `Legitimidade` -10, `Consciência` -5 |
| **Aprendizado** | APR-ATOR-069 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-069):** Mecanismo: fogo amigo. Não repete o streamer (INST-185), que é crítico de fora da base.

### ATOR-070 — Influenciador Progressista

| Campo | Conteúdo |
| :--- | :--- |
| **Título** | Namoro sem controle |
| **Tipo** | Ator |
| **Modo** | Prisional e Policial |
| **Função** | `ACT-024` · Oferta |
| **Quem fala** | `ACT-024` |
| **Ano mínimo** | 2 |
| **Problema** | Aliado, o Influenciador Progressista oferece vídeos para ensinar jovens a reconhecer namoro abusivo e pedir ajuda. |
| **Opção A** | Apoiar a série |
| **Cor A** | Vermelho |
| **Efeitos A** | `Segurança` +10, `Dignidade` +10 |
| **Consequência A** | "Os vídeos circulam nas escolas. As denúncias chegam mais cedo." |
| **Eixo A** | [0, 0, +1, 0] |
| **Atores A** | `ACT-024` +1 |
| **Evento A** | — |
| **Opção B** | Fazer campanha oficial |
| **Cor B** | Laranja |
| **Efeitos B** | `Caixa` -15, `Segurança` +5 |
| **Consequência B** | "A campanha sai com cara de governo. Poucos jovens compartilham." |
| **Eixo B** | [0, 0, 0, 0] |
| **Atores B** | `ACT-024` -1 |
| **Evento B** | — |
| **Aprendizado** | APR-ATOR-070 (doc 18) |
| **Status** | pendente de revisão (D-196) |

---

**Notas do GD (ATOR-070):** Boa Vontade na A. Carta ligada (Ano 2, Segurança+ e Dignidade+). Diferente da aula contra o abuso (INST-043).


## Relatório do script

`cards_doc.py check --no-learning --wave-report --style`: 0 erros, 0 avisos de estilo; `box --json` sai 0. Avisos de Técnica (D-119) são do baralho, não desta onda.

## Propostas ao PO

- ATOR-040 usa `ACT-021` como dono da patente (não há ator da indústria farmacêutica).
- Dados e fatos só nas pistas (`aprendizados.md`), para o P-016.
