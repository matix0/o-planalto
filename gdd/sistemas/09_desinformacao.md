# 09 — Desinformação

**Sistema:** 09 (`gdd/sistemas/00_INDICE.md`) · **Inclui:** modo Influenciador, inoculação
**Status:** ✅ Aprovado pelo PO (2026-10-16)

---

## 1. Visão geral

Sistema de conteúdo: as 20 cartas do modo Influenciador (INST-181 a INST-200, `docs/12_FICHAS_DOS_MODOS.md`), cada uma ensinando uma de 6 técnicas de manipulação, indicada no campo `tecnica` (`docs/05_SISTEMAS_E_MECANICAS.md` §05.10.2). A inoculação (McGuire, 1964; van der Linden, 2022, `gdd/GDD.md` §6.8) acontece pela exposição na carta, pela escolha e pela Carta de Aprendizado, que nomeia a técnica. Não há mecânica nova: o peso nos medidores está no GDD 01 (`Integridade` < 30 dobra a perda de `Consciência`) e a frequência em crise vem do sorteio (carta ligada a medidor < 30, GDD 06).

## 2. Fantasia do jogador

O jogador sente a tentação do atalho: alcance fácil, apoio pago, uma mentira que ajuda o governo. Vê como a desinformação é financiada (bets, agro, igrejas, crime organizado) e como influenciadores são cooptados (`docs/12_FICHAS_DOS_MODOS.md`, MOD-010). Depois de decidir, a Carta de Aprendizado nomeia a técnica que ele acabou de viver — e ele aprende a reconhecê-la fora do jogo, que é o objetivo da inoculação: resistência no jogador, não no personagem (pilar 3). Aprende também que recusar o atalho custa alcance ou apoio, e que aceitar corrói a confiança pública (pilar 4).

## 3. Regras detalhadas

### 3.1. Técnicas

`tecnica` aceita 6 valores: `desmoralizacao`, `panico_moral`, `deepfake`, `fazenda_ia`, `cache_desgraca`, `didatismo_acusatorio` (definições: `docs/05_SISTEMAS_E_MECANICAS.md` §05.10.2).

### 3.2. Cartas do modo Influenciador

| Regra | Detalhe |
| :--- | :--- |
| `tecnica` | Obrigatório, exatamente 1; só existe neste modo |
| `reacao` (em cada opção) | `aceitar`, `recusar` ou `investigar`; as duas opções com reações diferentes |
| Opção `aceitar` | Efeito negativo em `Integridade` ou `Consciência` |
| Cobertura | Cada técnica em ≥ 2 das 20 cartas |
| Aprendizado | Nomeia a técnica e ensina a reconhecê-la (doc 18) |

Valem também todas as regras do GDD 05 (2-4 efeitos, ≥ 1 negativo, cor, eixo, `atores`).

### 3.3. Guia de escrita (não é regra)

| Reação | Custo típico (`gdd/GDD.md` §6.8) |
| :--- | :--- |
| Aceitar | Perde `Integridade` e `Consciência`; ganha alcance (`Legitimidade` ou `Capital Político`) |
| Recusar | Perde `Legitimidade` |
| Investigar | Perde `Capital Político`; ganha `Integridade` |

### 3.4. Já em outros sistemas

- Peso: `Integridade` < 30 dobra a perda de `Consciência` (`gdd/sistemas/01_medidores.md:29`).
- Frequência: medidor < 30 puxa carta ligada (`gdd/sistemas/06_sorteio.md` §3.3).
- Eventos fixos do modo: removidos (D-109).

## 4. Fórmulas

| Variável | Definição | Faixa |
| :--- | :--- | :--- |
| `n(t)` | Cartas do modo com a técnica `t` | ≥ 2 |
| Σ `n(t)` | Total de cartas do modo | 20 |

- **Cobertura:** `n(t)` ≥ 2 para as 6 técnicas; Σ `n(t)` = 20 (8 cartas livres).
- **Efeito:** fórmula do GDD 01, com o dobro na perda de `Consciência` se `Integridade` < 30 (`gdd/sistemas/01_medidores.md:28-31,63`).

**Exemplo:** Ano 3 (`M` = 1,0), `Integridade` 25. Opção `aceitar` do exemplo do doc 05 (`Consciência` −15, `Integridade` −10; `docs/05_SISTEMAS_E_MECANICAS.md` §05.10.4): `Consciência` −15 × 2 × 1,0 = −30; `Integridade` 25 → 15. Com `Integridade` ≥ 30, seria só −15 em `Consciência`.

## 5. Casos-limite

| Caso | O que acontece |
| :--- | :--- |
| Carta do modo sem `tecnica` ou com mais de uma | `/validate-cards` reprova |
| `tecnica` ou `reacao` fora do modo Influenciador | `/validate-cards` reprova |
| As duas opções com a mesma `reacao` | `/validate-cards` reprova |
| Opção `aceitar` sem perda em `Integridade` nem `Consciência` | `/validate-cards` reprova |
| Técnica com < 2 cartas no modo | `/validate-cards` avisa (não reprova) enquanto o roteiro está incompleto; a carta segue jogável |
| Nenhuma opção `aceitar` (ex.: recusar × investigar) | Permitido; a regra do `aceitar` não se aplica |
| Nenhuma carta do modo na partida | Permitido; o sorteio não reserva vaga por modo (`gdd/sistemas/06_sorteio.md` §3.4) |
| Aprendizado não nomeia a técnica | Revisão do doc 18 reprova; sem aprovação, a carta fica fora do baralho (D-102) |
| `Integridade` em 0 por uma opção `aceitar` | Final catastrófico (D-089), pelo `gdd/sistemas/05_cartas.md` §5 |

## 6. Dependências

**Depende de:** 05 Cartas (estrutura; campos `tecnica` e `reacao`) · 01 Medidores (dobro da perda de `Consciência` com `Integridade` < 30) · 06 Sorteio (frequência em crise via carta ligada).

**É usado por / citado em:**

| Sistema | Uso | Cita o 09? |
| :--- | :--- | :--- |
| 05 Cartas | Campos `tecnica` e `reacao` | ✅ `gdd/sistemas/05_cartas.md` §3.2, §3.3, §6 |
| 01 Medidores | Dobro da `Consciência` = peso da desinformação | ✅ `gdd/sistemas/01_medidores.md` §6 |
| 06 Sorteio | Cartas do modo puxadas por medidor < 30 | ✅ `gdd/sistemas/06_sorteio.md` §6 |
| Doc 18 | Aprendizado nomeia a técnica | Na escrita do doc 18 (fora do P-012) |

## 7. Parâmetros de ajuste

| Parâmetro | Atual | Faixa segura | O que afeta |
| :--- | :--- | :--- | :--- |
| Cartas do modo | 20 | Fixo (D-020) | Exposição às técnicas |
| Número de técnicas | 6 | 4-8 | Variedade pedagógica; > 8 não cabe na cobertura mínima |
| Cobertura mínima por técnica | 2 | 1-3 | 3 × 6 = 18 em 20 deixa quase nenhuma folga |
| Dobro da `Consciência` | ×2 com `Integridade` < 30 | ×1,5 a ×2 | Peso da desinformação; ajustado só no GDD 01 (`gdd/sistemas/01_medidores.md` §7) |

Técnicas: `docs/05_SISTEMAS_E_MECANICAS.md` §05.10.2; cobertura: decisão do PO no P-012. Faixas seguras: proposta aprovada pelo PO (2026-10-16) `[não verificado]`.

## 8. Critérios de aceite

| # | Critério | Como testar | Passa se |
| :--- | :--- | :--- | :--- |
| CA-01 | Técnica obrigatória | `/validate-cards` no modo Influenciador | Toda carta do modo tem exatamente 1 `tecnica` entre as 6 |
| CA-02 | Campos exclusivos | `/validate-cards` nos outros modos | Nenhuma carta fora do modo tem `tecnica` ou `reacao` |
| CA-03 | Reações distintas | `/validate-cards` | As duas opções de cada carta do modo têm `reacao` diferentes |
| CA-04 | Custo de aceitar | `/validate-cards` | Toda opção `aceitar` perde `Integridade` ou `Consciência` |
| CA-05 | Cobertura | `/validate-cards` com as 20 cartas | Cada técnica em ≥ 2 cartas; se não, aviso (não reprova) |
| CA-06 | Aprendizado | Revisão do doc 18 | Cada Aprendizado do modo nomeia a técnica e ensina a reconhecê-la |
| CA-07 | Peso | Opção `aceitar` com `Consciência` −15, Ano 3, `Integridade` 25 | `Consciência` cai 30 |
| CA-08 | Frequência em crise | `Integridade` 25 no início do turno, com carta elegível do modo que tenha `Integridade` positiva | Uma carta ligada a `Integridade` entre as obrigatórias (`gdd/sistemas/06_sorteio.md` §3.3) |

## Ajustes para outros docs

Aplicar no `/sync-docs` e na etapa 7 do P-012 (não alterados por este GDD):

- `gdd/GDD.md` §6.8: as 3 reações viram guia de escrita (§3.3); citar o campo `tecnica` e este GDD.
- Doc 05 §05.10.3 (`docs/05_SISTEMAS_E_MECANICAS.md`): idem.
- Doc 12 MOD-010: "Gatilhos de Aparição" passa a citar o GDD 06 (carta ligada a medidor < 30); "Eventos Encadeados" do modo removidos (D-109).
- Doc 13 §13.3: campos `tecnica` (carta) e `reacao` (opção), só no modo Influenciador.
