# 04 — Eixo Ideológico

**Sistema:** 04 (`gdd/sistemas/00_INDICE.md`) · **Inclui:** 4 eixos, pontuação, revelação final
**Status:** ✅ Aprovado pelo PO (2026-10-15) · **Pendências resolvidas:** P-9 · **Revisão 2026-10-20** (D-175): provisória, DP-009

---

## 1. Visão geral

Quatro eixos bipolares de −10 a +10 (modelo 9axes adaptado, D-027). Cada opção de carta traz um vetor de pontos escrito na própria carta. No fim, um **radar de 8 pontas** mostra dois traçados — **"o que você disse"** (calibração) e **"como você governou"** (cartas) — e duas revelações: **"o país que você construiu"** (medidores, `gdd/GDD.md` §9.2) e **"os valores que guiaram seu governo"** (eixos).

## 2. Fantasia do jogador

O jogador se reconhece — ou se surpreende — no próprio governo. A distância entre o que disse e o que fez provoca reflexão sem rótulo binário (pilar 5).

## 3. Regras detalhadas

### 3.1. Eixos

| Eixo | Polo − | Polo + |
| :--- | :--- | :--- |
| Economia | Coletivismo | Mercado |
| Diplomacia | Nacionalismo | Globalismo |
| Sociedade | Conservadorismo | Progressismo |
| Estado | Autoritarismo | Liberdade |

### 3.2. Pontuação

- Cada opção tem `eixo = [Eco, Dip, Soc, Est]`, inteiros de −2 a +2; 0 = eixo não está em jogo. Vetores das 22 cartas: `docs/17_ROTEIRO_DAS_CARTAS.md` (campos Eixo A/B); das 12 respostas da calibração: `docs/15_FLUXO_DO_JOGO.md` §15.04. Propostos pelo GD e aprovados pelo PO (2026-10-15). BRICS conta como Nacionalismo.
- Os pontos nunca vêm do lado do arraste nem da cor partidária (D-084, D-092).
- As cartas da cena de impeachment também pontuam.
- Dois traçados: calibração ("o que você disse") e cartas jogadas ("como você governou").

### 3.3. Revelação dos eixos

Mostra o texto do eixo com maior |posição| do traçado "como você governou"; empate pela ordem Economia → Diplomacia → Sociedade → Estado.

| Eixo | Polo − | Polo + | Sem posição (0) |
| :--- | :--- | :--- | :--- |
| Economia | "Seu governo apostou no Estado e no que é de todos para dividir a riqueza." | "Seu governo confiou no mercado e na iniciativa privada para gerar riqueza." | "A economia não foi o centro das suas escolhas." |
| Diplomacia | "Seu governo pôs o interesse nacional acima dos acordos com o mundo." | "Seu governo apostou na cooperação e na abertura ao mundo." | "Você quase não decidiu o lugar do Brasil no mundo." |
| Sociedade | "Seu governo preservou costumes e instituições tradicionais." | "Seu governo ampliou direitos e mudou costumes." | "Os costumes não foram o centro das suas escolhas." |
| Estado | "Seu governo concentrou poder para impor ordem." | "Seu governo limitou o poder do Estado sobre as pessoas." | "Você quase não mexeu no tamanho do poder do Estado." |

A revelação dos medidores continua com os textos de `gdd/GDD.md` §9.2: 5 padrões na ordem da tabela, alto > 60, baixo < 40, e um 6º texto quando nenhum casa (D-175).

## 4. Fórmulas

`pos(eixo) = (Σ valores ≠ 0 / nº de opções com valor ≠ 0 nesse eixo) × 5`; nenhuma opção tocou o eixo → `pos = 0`. Faixa: −10 a +10.

**Exemplo:** três opções tocam Economia com −2, −1, +1 → (−2 / 3) × 5 = **−3,3** (levemente Coletivismo).

## 5. Casos-limite

| Caso | O que acontece |
| :--- | :--- |
| Partida encerrada por Catástrofe | Revelação com as escolhas feitas até ali |
| Eixo não tocado | Posição 0; texto "sem posição" |
| Empate de |posição| entre eixos | Ordem fixa Economia → Diplomacia → Sociedade → Estado |
| Opção com vetor todo 0 | Não conta em nenhum denominador |
| Medidor exatamente em 60 ou 40 | Não é "alto" nem "baixo" (comparação estrita); conta para o equilíbrio (D-175) |
| Nenhum padrão dos medidores casa | Texto "sem padrão" do `gdd/GDD.md` §9.2; o marcador "[a definir]" nunca aparece (D-175) |

## 6. Dependências

05 Cartas (campo `eixo` por opção) · 01 Medidores (calibração; revelação dos medidores) · 02 Finais (tela final) · 03 Impeachment (cartas da cena pontuam) · 10 Estado da partida. Cada um deve citar o 04 de volta.

## 7. Parâmetros de ajuste

| Parâmetro | Atual | Faixa | O que afeta |
| :--- | :--- | :--- | :--- |
| Escala dos vetores | ±2 | ±1 a ±3 | Nuance por opção |
| Fator de escala | ×5 | — | Mantém −10..+10 |
| Cobertura mínima por eixo | — | ≥ 15% das opções com valor ≠ 0 | Diplomacia hoje: 4 de 44 (9%). Regra para a escrita das cartas; `/validate-cards` avisa abaixo de 15% (D-126). Os vetores já aprovados não mudam |
| "Alto" na revelação | > 60 (`reveal_high_above`) | 55-70 | Frequência dos padrões 1 e 2 (D-175) |
| "Baixo" na revelação | < 40 (`reveal_low_below`) | 30-40 | Frequência dos padrões 4 e 5; os medidores começam em 40-55 (D-175) |

## 8. Critérios de aceite

1. Exemplo da seção 4 → −3,3.
2. Eixo sem pontos → 0 e texto "sem posição".
3. Trocar o lado em que a opção aparece não muda a pontuação.
4. O radar mostra os dois traçados (disse × governou).
5. Toda posição fica entre −10 e +10.
6. Nenhuma tela final mostra "[a definir" na revelação dos medidores (D-175).
7. Todos os 8 medidores em 50 → texto do equilíbrio; Consciência e Integridade em 39 → padrão 4; em 40 → não é "baixo".
8. Dignidade 20, Segurança 90 e os demais em 50 → texto "sem padrão".
9. Mudar `reveal_high_above` no `balance.json` muda o resultado do teste de fronteira (o limite é lido do arquivo).

## Pendência de roteiro

Parecer do GD (2026-10-15): a opção "íntegra" quase sempre puxa para Coletivismo, Progressismo ou Liberdade — o eixo passa a medir moral. **Atualizado (D-097):** a neutralização foi cancelada pelo PO; fica só a meta de mais cartas de Diplomacia (≥ 15% por eixo). Toda opção mantém custo real.
