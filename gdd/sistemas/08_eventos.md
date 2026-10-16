# 08 — Eventos Encadeados

**Sistema:** 08 (`gdd/sistemas/00_INDICE.md`) · **Inclui:** atraso de 1-2 turnos, aviso, epílogo
**Status:** ✅ Aprovado pelo PO (2026-10-16)

---

## 1. Visão geral

Evento encadeado é a consequência atrasada de uma escolha. Cada opção de carta pode agendar eventos (campo `eventos`); só os da opção escolhida entram na fila. Cada evento dispara 1 ou 2 turnos depois, no início do turno, antes da primeira carta: aparece numa tela de aviso e aplica seus efeitos nos medidores com o multiplicador do ano (`gdd/sistemas/01_medidores.md:28`). Não pode ser evitado. Eventos que cairiam depois do Ano 4 vão para o epílogo do final (`gdd/sistemas/02_finais.md:102`).

## 2. Fantasia do jogador

O jogador sente que o passado cobra a conta: uma decisão esquecida volta um ou dois anos depois, num aviso que ele não pode impedir. Aprende que política pública tem efeito retardado — cortar hoje vira epidemia amanhã; investir hoje vira cooperativa depois (`gdd/GDD.md:399-403`) — e que o epílogo herda o que ele plantou (pilar 1). O aviso chega antes da próxima decisão, para ligar causa e efeito antes de escolher de novo (pilar 3, ciclo de Kolb, `gdd/GDD.md:112`).

## 3. Regras detalhadas

### 3.1. Evento (dados)

| Campo | Regra |
| :--- | :--- |
| `texto` | Aviso de 1 linha |
| `atraso` | 1 ou 2 turnos |
| `efeitos` | 1 a 3 medidores; múltiplos de 5, de ±5 a ±30; positivos ou negativos; não exige custo |

- Cada opção tem o campo `eventos`, com 0 ou 1 evento (`gdd/sistemas/05_cartas.md` §3.3).
- Cartas da cena de impeachment não têm eventos.

### 3.2. Agendamento

- Opção escolhida no turno X → o evento entra na fila com destino X + `atraso`.
- Destino > 4 → epílogo.

### 3.3. Disparo

No início de cada turno, antes da primeira carta, na ordem de agendamento:

1. Mostra a tela de aviso com o `texto`.
2. Aplica os `efeitos` pela fórmula do GDD 01 (`gdd/sistemas/01_medidores.md:28-31`), com o multiplicador do ano em que dispara.
3. Medidor em 0 → §5.

### 3.4. Epílogo

Eventos com destino depois do Ano 4, ou ainda na fila quando a partida termina, aparecem como lista de `texto` no epílogo de qualquer final, sem aplicar efeitos (`gdd/sistemas/02_finais.md:102`).

## 4. Fórmulas

| Variável | Definição | Faixa |
| :--- | :--- | :--- |
| `X` | Turno em que a opção foi escolhida | 1-4 |
| `t` | `atraso` do evento | 1 ou 2 |
| `D` | Turno de destino: `D = X + t` | 2-6 |
| `M(D)` | Multiplicador do ano `D` | 0,75 / 1,0 / 1,5 (`gdd/sistemas/01_medidores.md:62`) |

- **Disparo:** `D` ≤ 4 → início do turno `D`; `D` > 4 → epílogo.
- **Efeito aplicado:** efeito base × `M(D)`, arredondado pela regra do GDD 01 (`gdd/sistemas/01_medidores.md:28-31`).

**Exemplos:** "Cortar verba da saúde" com "Epidemia na periferia" (`Dignidade` −15, `t` = 2):

- Ano 1 → `D` = 3, `M` = 1,0 → −15 no início do Ano 3.
- Ano 2 → `D` = 4, `M` = 1,5 → −22,5 → −23 (empate afasta do zero).
- Ano 3 → `D` = 5 → epílogo, sem efeito.

Como `D` ≥ 2, o multiplicador ×0,25 do Ano 1 nunca se aplica a eventos.

## 5. Casos-limite

| Caso | O que acontece |
| :--- | :--- |
| Evento leva medidor a 0 (exceto `Capital Político`) | Aplica todos os efeitos desse evento; final catastrófico (D-089); eventos restantes na fila vão ao epílogo |
| Evento leva `Capital Político` a 0 | Aplica todos os efeitos desse evento; abre o impeachment (D-095, GDD 03); depois da cena, os eventos restantes do turno disparam |
| Vários eventos no mesmo turno | Um por um, na ordem de agendamento; cada um com sua tela de aviso |
| Evento e carta de emergência no mesmo turno | Eventos primeiro; a emergência é a primeira carta depois deles (`gdd/sistemas/01_medidores.md` §3.4, passo 5) |
| Partida termina antes do destino (catástrofe ou condenação) | Eventos na fila vão ao epílogo, sem efeito |
| Opção que zera medidor e tem evento | O evento não é agendado (`gdd/sistemas/05_cartas.md` §5) nem vai ao epílogo |
| Ganho em medidor já em 100 | Limita a 100 (GDD 01) |
| Evento inválido (`atraso` fora de 1-2, > 3 efeitos, valor fora de ±5..±30, > 1 evento na opção, evento em carta de impeachment) | `/validate-cards` reprova; no jogo, a carta é excluída do baralho e o erro vai ao log |
| Epílogo sem eventos | A seção do epílogo não aparece na tela final |

## 6. Dependências

**Depende de:** 05 Cartas (campo `eventos` da opção; passo 3 da resolução) · 01 Medidores (aplicação dos efeitos: multiplicador e arredondamento).

**É usado por:**

| Sistema | Uso | Cita o 08? |
| :--- | :--- | :--- |
| 01 Medidores | Recebe os efeitos dos eventos | ✅ `gdd/sistemas/01_medidores.md:106` |
| 02 Finais | Epílogo com os eventos pendentes | ✅ `gdd/sistemas/02_finais.md:102,107` |
| 05 Cartas | Campo `eventos` na opção; passo 3 da §3.5 | ✅ `gdd/sistemas/05_cartas.md` §3.3, §3.5, §6 |
| 03 Impeachment | Cartas da cena sem eventos; a cena interrompe o disparo (§5) | ❌ não cita o 08 — ajuste na etapa 7 do P-012 |
| 06 Sorteio | Eventos disparam antes da primeira carta do turno | ⏳ a escrever |
| 10 Estado da partida | Guarda a fila de eventos e o epílogo | ✅ `gdd/sistemas/10_estado_partida.md` §3 |

**Removido:** relação com o 07 Atores — atores não têm eventos próprios; a pressão deles vem das cartas de ataque (`gdd/sistemas/07_atores.md` §3.2).

## 7. Parâmetros de ajuste

| Parâmetro | Atual | Faixa segura | O que afeta |
| :--- | :--- | :--- | :--- |
| Atraso | 1 ou 2 turnos | 1-2 | ≥ 3 → quase todo evento vira epílogo em 4 turnos |
| Eventos por opção | 0 ou 1 | 0-1 | Até ~28 avisos por partida (6-8 cartas por turno, `gdd/GDD.md` §5.4) |
| Medidores por evento | 1 a 3 | 1-3 | Legibilidade do aviso |
| Magnitude do efeito | ±5 a ±30 | ±5 a ±30 | Com ×1,5 no Ano 4, até ±45; mesma escala das cartas (`gdd/sistemas/05_cartas.md` §7) |
| Multiplicador | Do ano de destino | Fixo | Peso do evento × cartas |
| Opções com evento | Livre | `[a definir com o ECO]` | Avisos por turno; muitos cansam (pilar 2) |

Faixas: decisões do PO no P-012 e escala do GDD 05. Proporção de opções com evento: sem dado — nenhuma das 22 cartas escritas tem evento (`docs/17_ROTEIRO_DAS_CARTAS.md`) — `[não verificado]` até a simulação do ECO.

## 8. Critérios de aceite

| # | Critério | Como testar | Passa se |
| :--- | :--- | :--- | :--- |
| CA-01 | Dados do evento | `/validate-cards` | 0 ou 1 evento por opção; `atraso` 1 ou 2; 1-3 efeitos, múltiplos de 5, ±5 a ±30 |
| CA-02 | Sem evento na cena | `/validate-cards` | Nenhuma carta de impeachment tem evento |
| CA-03 | Só a opção escolhida | Escolher A numa carta em que só B tem evento | Fila continua vazia |
| CA-04 | Destino | Ano 1, opção com `atraso` 2 | Aviso no início do Ano 3, antes da primeira carta |
| CA-05 | Multiplicador | Evento `Dignidade` −15 disparando no Ano 4 | `Dignidade` cai 23 |
| CA-06 | Epílogo | Ano 3, opção com `atraso` 2 | Texto no epílogo; nenhum medidor muda |
| CA-07 | Ordem | 2 eventos com o mesmo destino | Disparam na ordem de agendamento, cada um com seu aviso |
| CA-08 | Fim por evento | Evento zera `Dignidade` com outro na fila | Final catastrófico; o outro vai ao epílogo |
| CA-09 | Impeachment por evento | Evento zera `Capital Político` | Cena abre; depois dela, os eventos restantes disparam |
| CA-10 | Emergência | Medidor ≤ 10 no fechamento e evento no turno seguinte | Evento dispara antes da carta de emergência |
| CA-11 | Opção que encerra | Opção que zera medidor e tem evento | Evento não aparece no epílogo |
| CA-12 | Sem pendentes | Final sem eventos na fila | Tela final sem a seção do epílogo |

## Ajustes para outros docs

Aplicar no `/sync-docs` e na etapa 7 do P-012 (não alterados por este GDD):

- Doc 05 §05.06.2-05.06.5 (`docs/05_SISTEMAS_E_MECANICAS.md`): remover as tabelas por ator, modo e medidor; fluxo "X+2" vira "X + atraso (1-2)".
- Doc 13 §13.3.1-13.3.2: `eventos_encadeados` sai da carta e entra como `eventos` na opção (`texto`, `atraso`, `efeitos`); §13.3.4: remover eventos do ator.
- Doc 11: remover o campo "Eventos Encadeados" das fichas.
- `gdd/GDD.md` §6.4 e `CLAUDE.md` ("Eventos Encadeados: 78"): a contagem passa a depender das cartas (revisa D-024).
- GDD 03: citar o 08 (cartas da cena sem eventos; cena interrompe o disparo).
