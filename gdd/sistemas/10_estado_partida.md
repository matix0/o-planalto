# 10 — Estado da Partida

**Sistema:** 10 (`gdd/sistemas/00_INDICE.md`) · **Inclui:** máquina de estados, fim imediato, sessão
**Status:** ✅ Aprovado pelo PO (2026-10-16) · **Pendências resolvidas:** P-12

---

## 1. Visão geral

Máquina de estados que conduz a partida do início ao fim e guarda o que os outros sistemas precisam: medidores, satisfação dos atores, traçados do eixo, cartas jogadas, fila de eventos e usos únicos (emergência, impeachment). Fluxo: calibração → 4 turnos (eventos → 7 cartas → fechamento) → final, com a cena de impeachment quando um gatilho dispara. Qualquer passo pode encerrar a partida na hora (medidor em 0, condenação, "Abandonar mandato"). O estado é salvo automaticamente após cada passo — uma única partida salva, apagada na tela final — e nenhuma escolha pode ser desfeita. Entre partidas, só as configurações ficam guardadas.

## 2. Fantasia do jogador

O jogador sente um mandato contínuo e irreversível: não há botão de voltar — o que foi decidido está decidido, como no governo real (pilar 1). Se o celular toca ou o app fecha, o mandato espera no ponto exato, sem perder nada e sem segunda chance. Ele pode sair, mas sair é uma escolha política com nome: a "Renúncia" tem tela própria e mostra o país e os valores que ele deixou (pilar 5). Cada partida começa limpa, sem placar nem coleção, para que ele jogue pelos dilemas, não pelas conquistas.

## 3. Regras detalhadas

### 3.1. Estados

| Estado | O que acontece | Fonte |
| :--- | :--- | :--- |
| `INICIO` | Tela inicial: "Continuar" (se há partida salva) ou "Novo mandato" | — |
| `CALIBRACAO` | 6 perguntas: medidores iniciais e traçado "o que você disse" | GDD 01 §3.2, GDD 04 |
| `EVENTOS` | Disparo dos eventos com destino neste turno | GDD 08 §3.3 |
| `OBRIGATORIAS` | Lista de obrigatórias do turno | GDD 06 §3.3 |
| `CARTA` | Sorteio da vaga, exibição (lado sorteado) e resolução: efeitos → eixo → atores → eventos → consequência → Aprendizado | GDD 06 §3.4, GDD 05 §3.4-3.5 |
| `FECHAMENTO` | 6 passos do fechamento do turno | GDD 01 §3.4 |
| `IMPEACHMENT` | Cena de 5 cartas | GDD 03 §3.2 |
| `FINAL` | Tela final: final, citação, epílogo, eixo, medidores | GDD 02 |

### 3.2. Transições

1. `INICIO` → `CALIBRACAO` (novo) ou → estado salvo (continuar).
2. `CALIBRACAO` → `OBRIGATORIAS` do Ano 1 (sem eventos no Ano 1).
3. `EVENTOS` → `OBRIGATORIAS` → `CARTA` (até 7 ou até acabarem as elegíveis) → `FECHAMENTO`.
4. `FECHAMENTO` dos Anos 1-3 → `EVENTOS` do ano seguinte.
5. Fim do Ano 4: só o passo 6 do fechamento (gatilho de impeachment) → `FINAL` (`gdd/sistemas/01_medidores.md` §3.4).
6. `Capital Político` em 0 após carta ou evento, ou gatilho no passo 6 → `IMPEACHMENT`. Absolvição → volta ao ponto em que parou; condenação → `FINAL`.
7. Outro medidor em 0, em qualquer estado → `FINAL` (Catástrofe), na hora.

### 3.3. Abandonar mandato

- No menu de pausa, com confirmação, em qualquer estado exceto `INICIO` e `FINAL`.
- Em `CALIBRACAO`: apaga a partida, sem final.
- Nos demais: `FINAL` com "Renúncia" (completo: citação, epílogo, eixo, medidores).

### 3.4. O que o estado guarda

| Dado | Sistema dono |
| :--- | :--- |
| Ano (1-4), estado atual, cartas do turno | 10 |
| 8 medidores | 01 |
| Medidores que já tiveram emergência | 01, 06 |
| Satisfação dos 24 atores | 07 |
| Traçados "o que você disse" e "como você governou" | 04 |
| Cartas jogadas | 06 |
| Fila de eventos e epílogo | 08 |
| Impeachment usado, fase e apoio | 03 |

### 3.5. Salvamento

- Automático após cada transição e cada carta resolvida.
- Uma única partida salva; apagada ao entrar em `FINAL` ou ao abandonar.
- Sem desfazer: a escolha é salva antes da tela de consequência.
- Entre partidas, só as configurações (som, tamanho do texto, "tutorial visto").

## 4. Fórmulas

| Variável | Definição | Faixa |
| :--- | :--- | :--- |
| `C` | Cartas jogadas no turno | 0-7 (GDD 06) |
| `I` | Cartas da cena de impeachment | 0 ou 5 (GDD 03) |
| `t_c` | Tempo por carta | 15-22 s (`gdd/GDD.md` §4.2) |
| `t_x` | Tempo fixo: calibração, avisos, fechamentos, tela final | `[não verificado]` |

- **Cartas por partida:** Σ `C` + `I` ≤ 28 + 5 = 33.
- **Duração:** (Σ `C` + `I`) × `t_c` + `t_x`. Com 28 cartas, as cartas levam 7,0-10,3 min; o GDD prevê 12-18 min (D-088), e a diferença (5-8 min) fica em `t_x`, a medir no protótipo.
- **Salvamentos por partida:** ~1 por carta + 1 por transição ≈ 28 + 16 ≈ 44 gravações pequenas.

**Exemplo:** sem impeachment, baralho cheio: 28 × 18 s = 8,4 min de cartas; com impeachment, 33 × 18 s = 9,9 min.

**Observação para o playtest:** só com cartas, a partida fica abaixo de 12 min; a meta de ~15 min (D-088) depende de `t_x`.

## 5. Casos-limite

| Caso | O que acontece |
| :--- | :--- |
| App fecha na tela de consequência ou de Aprendizado | Ao reabrir, mostra de novo a consequência e o Aprendizado (só leitura); a escolha não é refeita |
| App fecha no meio da cena de impeachment | Retoma na fase em que parou, com o apoio já conquistado |
| App fecha durante a calibração | Retoma na pergunta em que parou |
| Salvamento corrompido ou ilegível | Apaga o salvamento; aviso "Não foi possível continuar o mandato"; vai para `INICIO` |
| Falha ao gravar (sem espaço, navegador sem armazenamento) | Segue sem salvar, com aviso discreto 1× por partida; se fechar, a partida se perde |
| "Novo mandato" com partida salva | Pede confirmação; apaga o salvamento sem gerar "Renúncia" (reservada ao abandono pelo menu de pausa) |
| Abandonar durante a cena de impeachment | "Renúncia" (§3.3); a cena não termina |
| Medidor em 0 e gatilho de impeachment no mesmo passo | O 0 em outro medidor vence: Catástrofe (`gdd/sistemas/02_finais.md` §3.2) |
| Atualização do jogo com partida salva de outra versão | Se o formato mudou, vale a regra do salvamento corrompido; a versão do formato fica gravada no salvamento |
| Turno sem nenhuma carta elegível | Pula `CARTA` e vai ao `FECHAMENTO` (`gdd/sistemas/06_sorteio.md` §5) |

## 6. Dependências

**Depende de:** todos os sistemas — o 10 executa e guarda o estado de 01 (medidores, calibração, fechamento), 02 (finais), 03 (impeachment), 04 (traçados do eixo), 05 (resolução da carta), 06 (sorteio), 07 (atores) e 08 (eventos). O 09 não tem estado próprio.

| Sistema | O que o 10 guarda ou executa | Cita o 10? |
| :--- | :--- | :--- |
| 01 Medidores | Executa efeito e fechamento; guarda medidores | ✅ `gdd/sistemas/01_medidores.md:108` |
| 02 Finais | Aciona o fim; Renúncia | ✅ `gdd/sistemas/02_finais.md` §3.1, §3.2, §6 |
| 03 Impeachment | Estado da cena | ✅ `gdd/sistemas/03_impeachment.md:80` |
| 04 Eixo | Guarda os traçados | ✅ `gdd/sistemas/04_eixo.md:64` |
| 05 Cartas | Executa a resolução | ✅ `gdd/sistemas/05_cartas.md` §6 |
| 06 Sorteio | Guarda as cartas jogadas | ✅ `gdd/sistemas/06_sorteio.md` §6 |
| 07 Atores | Guarda a satisfação | ✅ `gdd/sistemas/07_atores.md` §6 |
| 08 Eventos | Guarda a fila e o epílogo | ✅ `gdd/sistemas/08_eventos.md` §6 |

## 7. Parâmetros de ajuste

| Parâmetro | Atual | Faixa segura | O que afeta |
| :--- | :--- | :--- | :--- |
| Turnos | 4 | Fixo (D-016) | Duração e fases |
| Frequência de salvamento | Após cada carta e transição | Fixo | Perda ao fechar o app: nada além da tela atual |
| Partidas salvas | 1 | Fixo | Impede "salvar e testar" escolhas (pilar 1) |
| Aviso de falha ao gravar | 1× por partida | 1× | Informa sem incomodar |
| Confirmação de "Abandonar" / "Novo mandato" | 1 passo | 1-2 passos | Evita saída por toque acidental |
| `t_x` (tempo fixo por partida) | A medir no playtest do protótipo | 5-8 min | Fecha a meta de ~15 min (D-088) com 28 × `t_c` (§4) |

Turnos: D-016; salvamento e confirmação: decisões do PO no P-012; faixa de `t_x`: diferença calculada na §4, a medir no protótipo.

## 8. Critérios de aceite

| # | Critério | Como testar | Passa se |
| :--- | :--- | :--- | :--- |
| CA-01 | Fluxo completo | Partida sem impeachment nem catástrofe | Calibração → 4 × (eventos → até 7 cartas → fechamento) → final, nesta ordem |
| CA-02 | Ano 1 sem eventos | Início do Ano 1 | Nenhum aviso de evento |
| CA-03 | Fim do Ano 4 | Última carta do Ano 4 | Só o passo 6 do fechamento; depois, tela final |
| CA-04 | Impeachment e retorno | `Capital Político` em 0 na 3ª carta do Ano 2, absolvição | Após a cena, o turno continua na 4ª carta |
| CA-05 | Catástrofe na hora | `Dignidade` em 0 no meio do turno | Tela final na hora; cartas restantes não aparecem |
| CA-06 | Retomar | Fechar o app na 4ª carta do Ano 3 e reabrir | "Continuar" volta à mesma carta e ao mesmo estado |
| CA-07 | Sem desfazer | Fechar na tela de consequência e reabrir | Consequência e Aprendizado reaparecem; a escolha não é reoferecida |
| CA-08 | Uma partida salva | Terminar a partida | Salvamento some; tela inicial sem "Continuar" |
| CA-09 | Renúncia | "Abandonar mandato" no Ano 2 | Tela "Renúncia" com citação, epílogo, eixo e medidores; salvamento apagado |
| CA-10 | Abandonar na calibração | "Abandonar mandato" na 3ª pergunta | Volta à tela inicial, sem final; salvamento apagado |
| CA-11 | Novo mandato | "Novo mandato" com partida salva, confirmando | Salvamento apagado sem final; começa a calibração |
| CA-12 | Salvamento corrompido | Abrir com arquivo de salvamento inválido | Aviso e tela inicial, sem travar |
| CA-13 | Configurações | Mudar o tamanho do texto, terminar e começar outra partida | Tamanho do texto mantido; nenhum dado de jogo mantido |

## Ajustes para outros docs

Aplicar no `/sync-docs` e na etapa 7 do P-012 (não alterados por este GDD):

- `gdd/GDD.md` §4.4: trocar "sessão parcial (se pausado)" e "não tem salvamento" pelo salvamento automático (§3.5); §8.5 e §9: 28 finais.
- `CLAUDE.md` e `gestao/estado.md`: "Finais: 27" → 28 (revisa D-096).
- Doc 13 §13.3.5: estrutura do estado conforme §3.4.
- Doc 15: fluxo com "Continuar", "Abandonar mandato" e "Renúncia".
- GDD 03 §3.2 (`gdd/sistemas/03_impeachment.md:31`): "6-8 do turno" → 7 (D-113).

## Pendências

- Citação e categoria do final "Renúncia" (`gdd/sistemas/02_finais.md` §3.1, §3.5).
- Gravação local em Godot (web e mobile): `[não verificado]` — P-005.
