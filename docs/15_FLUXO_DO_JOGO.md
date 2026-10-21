# 15 — Fluxo do Jogo

**O fluxo completo de uma partida de "O Planalto"**

Este documento define o fluxo da experiência do jogador: a partida, a tela inicial, a calibração, o turno, a carta, o impeachment, os eventos encadeados, os finais e o eixo ideológico. **Revisado no P-010** (2026-10-13) para corrigir alucinações da versão anterior. As telas estão no doc 14; as regras numéricas, no GDD (`gdd/GDD.md`).

---

## 15.01 — Princípios

| # | Princípio | Descrição |
| :--- | :--- | :--- |
| 1 | **Progressão clara** | O jogador sabe em que ano, fase e carta está (rodapé, doc 14 §14.02) |
| 2 | **Ritmo curto** | Partida de ~15 min (D-088) |
| 3 | **Feedback constante** | Cada escolha mostra consequência e efeito nos medidores |
| 4 | **Escolhas significativas** | Toda opção tem custo (pilar 4) |
| 5 | **Fim sem aviso prévio** | Medidor em 0 encerra a partida na hora (D-089) |

---

## 15.02 — Fluxo Geral

```
TELA INICIAL
 └─▶ TUTORIAL (3-4 telas)
      └─▶ CALIBRAÇÃO (6 perguntas)
           └─▶ TURNO 1 (Ano 1 — Lua de Mel)
                └─▶ TURNO 2 (Ano 2 — Realidade Bate)
                     └─▶ TURNO 3 (Ano 3 — Crise)
                          └─▶ TURNO 4 (Ano 4 — Desfecho)
                               └─▶ FINAL + EIXO IDEOLÓGICO

Em qualquer carta ou evento: medidor em 0 ──▶ FINAL CATASTRÓFICO (na hora)
Gatilho de impeachment (Capital Político em 0 em qualquer ano) ──▶ CENA DE IMPEACHMENT
Menu de pausa: "Abandonar mandato" ──▶ FINAL "RENÚNCIA" (na calibração: volta ao início, sem final)

Estados e salvamento automático: gdd/sistemas/10_estado_partida.md
```

### 15.02.1. Duração (aprovada pelo PO, 2026-10-13)

| Etapa | Duração |
| :--- | :--- |
| **Tela inicial** | 10-20 s |
| **Tutorial** | 30-45 s |
| **Calibração** | ~1 min |
| **Turno (7 cartas, D-113)** | 2-3 min cada; 8-12 min nos 4 turnos |
| **Impeachment (se houver)** | 1-2 min |
| **Final + eixo** | 1-2 min |
| **Total** | **≈ 12-18 min** |

**Por carta (≈ 15-22 s):** leitura 5-8 s + arraste 2-3 s + consequência 2-3 s + Aprendizado curto 5-8 s. O "saiba mais" é opcional e soma tempo.

---

## 15.03 — Tela Inicial

| Ação | O que acontece |
| :--- | :--- |
| **Continuar** | Só se houver partida salva: retoma no ponto exato (D-121) |
| **Novo mandato** | Tutorial → Calibração; com partida salva, pede confirmação e a apaga sem final |
| **Configurações** | Áudio e acessibilidade (doc 14 §14.12.1) |
| **Sobre** | Créditos e licenças |

Os avisos de conteúdo aparecem na tela inicial (GDD §14.3).

---

## 15.04 — Calibração Inicial

Seis perguntas (±5 cada, GDD 01 Medidores; vetores de eixo pelo GDD 04 formam o traçado "o que você disse"), uma por tela, respondidas **arrastando**, como as cartas (doc 14 §14.12). Ao final, os medidores iniciais (GDD §13.1) são ajustados.

| # | Pergunta | Resposta A | Efeito A | Eixo A | Resposta B | Efeito B | Eixo B |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | "O governo deve priorizar segurança ou prevenção?" | Segurança | `Segurança` +5, `Dignidade` −5 | [0, 0, -1, -1] | Prevenção | `Dignidade` +5, `Segurança` −5 | [0, 0, +1, +1] |
| 2 | "O Brasil deve se alinhar aos EUA ou ao BRICS?" | EUA | `Soberania` −5 | [0, +1, 0, 0] | BRICS | `Soberania` +5 | [0, -1, 0, 0] |
| 3 | "O Estado deve investir em educação ou cortar gastos?" | Educação | `Consciência` +5, `Caixa` −5 | [-1, 0, 0, 0] | Cortar | `Caixa` +5, `Consciência` −5 | [+1, 0, 0, 0] |
| 4 | "A mídia deve ser livre ou regulada?" | Livre | `Integridade` +5 | [0, 0, 0, +2] | Regulada | `Integridade` −5 | [0, 0, 0, -1] |
| 5 | "O governo deve taxar grandes fortunas?" | Sim | `Dignidade` +5, `Caixa` −5 | [-2, 0, 0, 0] | Não | `Caixa` +5, `Dignidade` −5 | [+2, 0, 0, 0] |
| 6 | "O povo deve participar das decisões?" | Sim | `Legitimidade` +5, `Consciência` +5 | [0, 0, 0, +2] | Não | `Capital Político` +5, `Consciência` −5 | [0, 0, 0, -2] |

A pergunta 6 foi corrigida no P-010 (antes: "Sim → `Consciência` −10"). O GDD (§16.4, P-11) mantém a pendência de revisão da pergunta 2 pelo PSI.

**Referência:** a calibração se inspira na "Bússola 2026" (`docs/05_SISTEMAS_E_MECANICAS.md:561`) `[não verificado]`.

---

## 15.05 — Fluxo de um Turno

```
ABERTURA DO TURNO (cartão "Ano X — Fase")
 └─▶ EVENTOS ENCADEADOS do turno (§15.08)
      └─▶ OBRIGATÓRIAS (até 3) + SORTEIO até 7 CARTAS (gdd/sistemas/06_sorteio.md)
           └─▶ CARTA 1 ─▶ ... ─▶ CARTA 7   (fluxo de §15.06)
                └─▶ FECHAMENTO DO TURNO (gdd/sistemas/01_medidores.md §3.4)
                     ├─▶ relações entre medidores
                     ├─▶ gatilho de impeachment?
                     └─▶ próximo turno, ou FINAL se for o Ano 4
```

### 15.05.1. As 4 Fases

| Fase | Ano | Foco | Multiplicador |
| :--- | :--- | :--- | :--- |
| **Lua de Mel** | 1 | Apresentação | ×0,25 |
| **Realidade Bate** | 2 | Eventos encadeados | ×0,75 |
| **Crise** | 3 | Impeachment | ×1,0 |
| **Desfecho** | 4 | Finais | ×1,5 |

Não há limiares de proteção por ano (D-082).

**Ordem do fechamento do turno** (`gdd/sistemas/01_medidores.md` §3.4): relações, limiares e bônus de uma vez → medidor em 0 → carta de emergência para medidor ≤ 10 → gatilho de impeachment.

---

## 15.06 — Fluxo de uma Carta

```
EXIBIR CARTA (lado de cada opção sorteado)
 └─▶ JOGADOR ARRASTA (vê o texto da opção e a cor da borda; sem pista)
      └─▶ JOGADOR SOLTA ALÉM DO LIMITE
           └─▶ APLICAR EFEITOS (com o multiplicador do ano)
                └─▶ MEDIDOR EM 0? ── sim ──▶ FINAL CATASTRÓFICO
                     └─▶ não: PONTOS DE EFEITO + CONSEQUÊNCIA (espera o toque)
                          └─▶ CARTA DE APRENDIZADO (resumo; "saiba mais" opcional)
                               └─▶ REGISTRAR EVENTOS ENCADEADOS
                                    └─▶ PRÓXIMA CARTA
```

| Etapa | Duração |
| :--- | :--- |
| Exibir carta + leitura | 5-8 s |
| Arraste | 2-3 s |
| Efeitos, pontos e consequência | 2-3 s |
| Carta de Aprendizado (resumo) | 5-8 s |
| **Total** | **≈ 15-22 s** |

---

## 15.07 — Fluxo do Impeachment

### 15.07.1. Gatilhos (GDD §6.5.1, a partir do Ano 2)

| Condição | Regra |
| :--- | :--- |
| **Principal** | `Legitimidade` < 20 E `Capital Político` < 20 |
| **Alternativo** | 3 opções seguidas que tiram `Capital Político` |
| **Capital em 0** | `Capital Político` = 0, em qualquer ano (D-095) |
| **Crise** | `Integridade` < 20 E `Consciência` < 20 |

### 15.07.2. A cena

```
GATILHO
 └─▶ CENA ESPECIAL (tela escurece — doc 14 §14.08)
      └─▶ 1. O PEDIDO
           └─▶ 2. A COMISSÃO   (placar da comissão)
                └─▶ 3. A VOTAÇÃO   (placar da Câmara: 342 de 513)
                     └─▶ 4. O JULGAMENTO   (placar do Senado: 54 de 81)
                          └─▶ 5. O DESFECHO ─▶ ABSOLVIÇÃO ou CONDENAÇÃO
```

| Fase | Opção A (povo): teste | Opção B (Congresso): teste |
| :--- | :--- | :--- |
| **1. O Pedido** | `Consciência` > 45 | `Caixa` > 45 |
| **2. A Comissão** | `Integridade` > 45 | `Capital Político` > 25 |
| **3. A Votação** | `Consciência` > 55 | `Capital Político` > 35 |
| **4. O Julgamento** | `Dignidade` > 50 | `Capital Político` > 40 |
| **5. O Desfecho** | `Legitimidade` > 45 | `Integridade` > 51 |

- Cada fase é uma carta extra com duas opções; o teste usa o valor antes do efeito; teste vencido nas fases 1-4 = +1 apoio. Efeitos sem multiplicador do ano.
- Absolvição: apoio ≥ 2 (≥ 3 se a cena abriu por `Capital Político` = 0) e teste do Desfecho; senão, condenação. Absolvido: `Capital Político` = máx(atual; 20), `Legitimidade` +10.
- Condenação automática se a cena começa com `Consciência` < 15 E `Integridade` < 15. A cena ocorre 1× por partida.
- Regras completas, efeitos e placares: `gdd/sistemas/03_impeachment.md`.

**Referências:** Revista Acervo (Arquivo Nacional), *Os sentidos do golpe*, 2025; ROCHA, Daniel França da, *Golpe versus impeachment*, UFPE, 2021 `[não verificado]`.

---

## 15.08 — Fluxo dos Eventos Encadeados

```
DECISÃO (Turno X) — só a opção escolhida agenda o seu evento (0 ou 1)
 └─▶ AGENDAR com atraso de 1 ou 2 turnos (definido em cada evento)
      ├─▶ cai até o Ano 4: início do turno, antes da 1ª carta, AVISO + EFEITOS (× multiplicador do ano)
      └─▶ passa do Ano 4: entra no EPÍLOGO da tela final
```

| Regra | Definição |
| :--- | :--- |
| **Atraso** | 1 ou 2 turnos, definido nos dados de cada evento (`gdd/sistemas/08_eventos.md` §3, D-110) |
| **Aviso** | Destaque na borda da tela + ícone (doc 14 §14.10) |
| **Evitável?** | Não (D-111) |
| **Depois do Ano 4** | Aparece no epílogo do final |

### 15.08.1. Exemplos

| Decisão | Evento | Efeitos |
| :--- | :--- | :--- |
| Cortar verba da saúde | Epidemia na periferia | `Dignidade` −15, `Segurança` −10 |
| Privatizar a água | Aumento de tarifas | `Dignidade` −10, `Legitimidade` −10 |
| Cortar o Bolsa Família | Fome volta ao mapa | `Dignidade` −20, `Legitimidade` −15 |
| Investir em educação | Jovens criam cooperativa | `Dignidade` +10, `Caixa` +5 |

**Pendência:** os efeitos destes exemplos diferem dos do GDD §6.4 (ex.: epidemia sem `Segurança` −10 no GDD). Pela D-111, um evento mexe em 1-3 medidores; os valores finais saem da escrita das cartas no doc 17.

---

## 15.09 — Fluxo dos Finais

```
DURANTE A PARTIDA
 ├─▶ MEDIDOR EM 0 ──▶ FINAL CATASTRÓFICO (na hora — D-089)
 └─▶ "ABANDONAR MANDATO" ──▶ RENÚNCIA (na hora — D-122)

FIM DO ANO 4
 └─▶ VERIFICAR FINAIS DE COMBINAÇÃO (GDD §9.1)
      └─▶ TELA FINAL: final + epílogo + eixo ideológico + medidores
```

| Regra | Status |
| :--- | :--- |
| Medidor em 0 | Final catastrófico na hora |
| Finais de combinação | Checados no fim do Ano 4 |
| Medidor em 100 (finais "se 100") | Só os 3 de Captura, com ≥ 95 no fim do Ano 4 (`gdd/sistemas/02_finais.md`) |
| Nenhuma condição atendida no fim do Ano 4 | Mandato Comum (`gdd/sistemas/02_finais.md`) |
| Mais de um final possível ao mesmo tempo | Prioridade por categoria (`gdd/sistemas/02_finais.md` §3.3) |

### 15.09.1. Os 28 Finais (D-096, D-122)

| Categoria | Quantidade | Exemplos |
| :--- | :--- | :--- |
| **Catástrofe** | 8 | Barbárie, Paralisia Fiscal, Colônia |
| **Captura** | 3 | Estado Policial, Hegemonia Autoritária |
| **Perda da Democracia** | 5 | Autoritarismo Eleitoral, Golpe Militar |
| **Extermínio e Exploração** | 2 | Genocídio Institucionalizado |
| **Fortalecimento** | 5 | República Soberana e Popular |
| **Cuidado e Soberania** | 3 | Fome como Escolha Política |
| **Neutro** | 1 | Mandato Comum |
| **Saída** | 1 | Renúncia (ao abandonar o mandato) |

---

## 15.10 — Fluxo do Eixo Ideológico

```
FIM DA PARTIDA
 └─▶ CÁLCULO DOS 4 EIXOS
      └─▶ GRÁFICO DE RADAR
           └─▶ REVELAÇÃO DO PADRÃO
                └─▶ "O país que você construiu reflete os valores que você priorizou."
```

| Eixo | Extremo A | Extremo B |
| :--- | :--- | :--- |
| **Economia** | Coletivismo | Mercado |
| **Diplomacia** | Nacionalismo | Globalismo |
| **Sociedade** | Conservadorismo | Progressismo |
| **Estado** | Autoritarismo | Liberdade |

Os pontos de cada eixo vêm dos dados da opção escolhida, nunca do lado do arraste (D-084; o lado é sorteado).

| Padrão | Revelação |
| :--- | :--- |
| Dignidade, Consciência e Soberania altos | *"Seu governo priorizou a dignidade, a educação e a soberania."* |
| Segurança, Capital Político e Caixa altos | *"Seu governo priorizou a ordem, a estabilidade e a economia."* |
| Equilíbrio entre todos | *"Seu governo buscou equilíbrio entre diferentes valores."* |
| Consciência e Integridade baixos | *"Seu governo deixou a verdade e a educação em segundo plano."* |
| Dignidade e Soberania baixos | *"Seu governo deixou os direitos do povo e a soberania em segundo plano."* |
| Nenhum dos anteriores (D-175) | *"Nenhum padrão resume seu governo. Os números contam o resto."* |

**Pendência:** como cada escolha pontua os eixos, e a revelação usa medidores em vez dos eixos (GDD §16.4, P-9).

**Referência:** modelo 9axes (D-027) `[não verificado]` quanto à versão e ao ano.

---

## 15.11 — Pendências

| # | Pendência | Onde resolver |
| :--- | :--- | :--- |
| 1 | Final por medidor em 100 | GDD de Finais |
| 2 | Final quando nenhuma condição é atendida | GDD de Finais |
| 3 | Prioridade entre finais simultâneos | GDD de Finais (P-3) |
| 4 | Dois impeachments (cena × `Capital Político` = 0) | GDD de Impeachment (P-1) |
| 5 | Fórmula dos placares do impeachment | GDD de Impeachment |
| 6 | Ordem das verificações no fechamento do turno | GDD de Medidores (P-8) |
| 7 | Efeitos dos eventos-exemplo × GDD §6.4 | Doc 05 / GDD |
| 8 | Pontuação do eixo ideológico | GDD do Eixo (P-9) |

---

**Última atualização:** 2026-10-13 (P-010)
**Versão:** 1.1 (revisada)
