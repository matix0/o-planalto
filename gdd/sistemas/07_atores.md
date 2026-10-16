# 07 — Satisfação dos Atores

**Sistema:** 07 (`gdd/sistemas/00_INDICE.md`) · **Inclui:** níveis, atualização, consequências
**Status:** ✅ Aprovado pelo PO (2026-10-16) · **Pendências resolvidas:** P-10

---

## 1. Visão geral

24 atores (`ACT-001` a `ACT-024`, D-085) em 4 categorias — Capital, Estado, Sociedade Civil, Mídia e Tecnologia (`gdd/GDD.md:492-501`). Cada ator tem satisfação de 0 a 100, que começa em 50, e um nível (Furioso a Aliado) que muda a chance de suas cartas aparecerem e o que ele faz (`gdd/GDD.md:375-383`). A satisfação muda quando o jogador escolhe uma opção cujo campo `atores` cita o ator: cada opção diz, de forma explícita, quem atende (+1) e quem contraria (−1). Os atores têm 70 cartas próprias (`ATOR-xxx`): 22 atores com 3 e 2 atores com 2.

## 2. Fantasia do jogador

O jogador governa cercado de gente que quer algo dele. Cada ator tem rosto, voz, motivação e medo (`docs/11_FICHAS_DOS_ATORES.md:33-52`), e o jogador aprende que atender um grupo quase sempre contraria outro: não dá para agradar todos (pilar 4). Sente a pressão crescer quando um grupo se irrita — ele volta mais vezes e cobra mais caro — e percebe que o apoio de um aliado também tem dono. Aprende que governar é negociar com interesses organizados, não só administrar números (pilares 1 e 3).

## 3. Regras detalhadas

### 3.1. Ator (dados)

| Campo | Regra |
| :--- | :--- |
| `id` | `ACT-001` a `ACT-024`, único |
| `nome`, `categoria`, `arquetipo` | Das fichas do doc 11; `categoria` é uma das 4 (`gdd/GDD.md:496-501`) |
| `oferece` / `cobra` | Medidores das fichas; guia de escrita, sem regra no jogo |
| `cartas` | 3 IDs `ATOR-xxx`, um por função (§3.4); 2 IDs para os 2 atores sem oferta |

O campo `preco` foi removido: o custo fica nos `efeitos` das cartas (D-098). O ator não tem eventos próprios: eventos vêm só das opções (`gdd/sistemas/08_eventos.md` §1).

### 3.2. Satisfação e níveis

Satisfação inteira de 0 a 100; começa em 50 para todos.

| Nível | Faixa | Carta do ator sorteável |
| :--- | :--- | :--- |
| Furioso | 0-20 | Ataque |
| Insatisfeito | 21-40 | Exigência |
| Neutro | 41-60 | Exigência |
| Satisfeito | 61-80 | Oferta |
| Aliado | 81-100 | Oferta |

- Só a carta da função do nível atual pode sair. Furioso torna o ataque obrigatório no turno seguinte; as demais funções têm peso igual (`gdd/sistemas/06_sorteio.md` §3.3-3.4).
- Ator sem carta de oferta não tem carta sorteável em Satisfeito e Aliado.

### 3.3. Atualização

- Cada opção traz `atores: { "ACT-xxx": +1 | -1 }`, com 0 a 3 atores (`gdd/sistemas/05_cartas.md` §3.3).
- Ao escolher a opção, cada ator citado recebe +10 ou −10; limita a 0-100. Sem multiplicador do ano.
- O nível é recalculado na hora e vale para o próximo sorteio (passo 2b de `gdd/sistemas/05_cartas.md` §3.5).

### 3.4. Cartas do ator

- 70 cartas `ATOR-xxx`: 22 atores × 3 (ataque, exigência, oferta) + 2 atores × 2 (ataque, exigência).
- A carta de um ator cita esse ator nas duas opções.
- Cada carta de ator sai no máximo 1 vez por partida (`gdd/sistemas/06_sorteio.md` §3.1).

### 3.5. Pendência

Os 2 atores sem carta de oferta: escolha do PO ao escrever as cartas deles no doc 17.

## 4. Fórmulas

| Variável | Definição | Faixa |
| :--- | :--- | :--- |
| `s(a)` | Satisfação do ator `a` | 0-100; começa em 50 |
| `d(o,a)` | Valor do ator `a` no campo `atores` da opção `o` | −1, 0 (não citado), +1 |
| `P` | Passo | 10 |

- **Atualização:** `s(a) ← clamp(s(a) + P × d(o,a), 0, 100)`, sem multiplicador do ano.
- **Nível:** Furioso se `s` ≤ 20; Insatisfeito se ≤ 40; Neutro se ≤ 60; Satisfeito se ≤ 80; senão Aliado.

**Exemplo:** Latifundiários (`ACT-001`) começam em 50 (Neutro). Três opções que os contrariam: 50 → 40 → 30 → 20 — Furioso; só a carta de ataque pode sair. Uma opção que os atende leva a 30 (Insatisfeito) e libera de novo a exigência.

**Ritmo:** de 50, 3 contrariedades até Furioso e 2 atendimentos até Satisfeito (50 → 60 → 70; 60 ainda é Neutro).

## 5. Casos-limite

| Caso | O que acontece |
| :--- | :--- |
| Carta da função do nível atual já saiu nesta partida | O ator fica sem carta sorteável até mudar de nível |
| Ator sem carta de oferta em Satisfeito ou Aliado | Sem carta sorteável (§3.2) |
| Satisfação em 0 ou 100 | Limita; não encerra a partida nem abre final |
| Opção cita o mesmo ator 2×, `id` inexistente ou > 3 atores | `/validate-cards` reprova; no jogo, a carta é excluída do baralho e o erro vai ao log |
| Carta de ator não cita esse ator numa das opções | `/validate-cards` reprova |
| Opção zera um medidor | Atores atualizados no passo 2b, antes do final (`gdd/sistemas/05_cartas.md` §5) |
| Carta de oferta (Satisfeito ou Aliado) — Evento de Boa Vontade (`gdd/GDD.md:458`, `gdd/sistemas/01_medidores.md:51`) | Uma opção pode ter 0 efeitos negativos; única exceção à `gdd/sistemas/05_cartas.md` §3.3 |
| Atores no fim do Ano 4 | A satisfação não entra nos finais (GDD 02) |

## 6. Dependências

**Depende de:** 05 Cartas (campo `atores`, cartas ATOR, passo 2b da resolução).

**É usado por:**

| Sistema | Uso | Cita o 07? |
| :--- | :--- | :--- |
| 01 Medidores | Recebe o efeito da carta de oferta (Boa Vontade) | ✅ `gdd/sistemas/01_medidores.md:51,105` |
| 05 Cartas | Campo `atores`, passo 2b, exceção da Boa Vontade | ✅ `gdd/sistemas/05_cartas.md` §3.3, §3.5, §6 |
| 06 Sorteio | Lê nível e função da carta; ataque obrigatório; "1× por partida" | ✅ `gdd/sistemas/06_sorteio.md` §3 |
| 10 Estado da partida | Guarda `s(a)` dos 24 atores | ⏳ a escrever |

O GDD 07 não lê os medidores: a satisfação só muda pelo campo `atores`.

## 7. Parâmetros de ajuste

| Parâmetro | Atual | Faixa segura | O que afeta |
| :--- | :--- | :--- | :--- |
| Satisfação inicial | 50 | 50 fixo | Mesmo ponto de partida; outro valor cria viés |
| Passo `P` | 10 | 5 a 15 | Velocidade de mudança de nível: 10 → 3 contrariedades até Furioso; 15 → 2; 5 → 6 |
| Atores por opção | 0 a 3 | 0 a 3 | Quantos níveis mudam numa escolha |
| Faixas dos níveis | 20 / 40 / 60 / 80 | ±5 em cada corte | Tempo do ator em cada função de carta |
| Cartas por ator | 3 (2 para 2 atores) | Fixo (D-020) | Total de 70 cartas ATOR |

Passo e faixas: `gdd/GDD.md:377-392`. Ritmo: ⌈30 / `P`⌉ (de 50 a 20). Faixas seguras: proposta aprovada pelo PO (2026-10-16), sem simulação do ECO `[não verificado]`.

## 8. Critérios de aceite

| # | Critério | Como testar | Passa se |
| :--- | :--- | :--- | :--- |
| CA-01 | Dados do ator | Validação dos dados | 24 atores, `id` único `ACT-001`..`ACT-024`; `categoria` entre as 4; sem `preco` |
| CA-02 | Cartas por ator | `/validate-cards` | 70 cartas ATOR: 22 × 3 + 2 × 2; cada carta com uma função (ataque, exigência, oferta) |
| CA-03 | Campo `atores` | `/validate-cards` | 0 a 3 atores por opção, sem repetir, `id` existente, valor ±1 |
| CA-04 | Autocitação | `/validate-cards` | A carta de um ator o cita nas duas opções |
| CA-05 | Exceção Boa Vontade | `/validate-cards` | Opção sem efeito negativo só em carta de oferta |
| CA-06 | Valor inicial | Início da partida no protótipo | Os 24 atores em 50 (Neutro) |
| CA-07 | Atualização | Escolher opção com `{ACT-001: -1}` | `s(ACT-001)` cai 10, sem multiplicador, em qualquer ano |
| CA-08 | Limites | 6 contrariedades seguidas | `s` para em 0; o jogo continua |
| CA-09 | Nível → função | Ator Furioso | Só a carta de ataque dele é elegível |
| CA-10 | Ator sem oferta | Ator sem oferta em Aliado | Nenhuma carta dele é elegível |
| CA-11 | Ordem | Opção que zera medidor e cita ator | Ator atualizado antes da tela final (passo 2b) |

## Ajustes para outros docs

Aplicar no `/sync-docs` e na etapa 7 do P-012 (não alterados por este GDD):

- Docs 11 e 13: IDs dos atores passam a `ACT-xxx`; cartas seguem `ATOR-xxx`.
- Doc 11: "Cartas Associadas" de 5 para 3 (ou 2) por ator, uma por função.
- Doc 13 §13.3.4 (`docs/13_ARQUITETURA_TECNICA.md:347`): remover `preco`; exemplo usa "Coronel" (ator antigo).
- Doc 05 §05.05.4 (`docs/05_SISTEMAS_E_MECANICAS.md:322-339`): remover a tabela de consequências.
- `gdd/GDD.md` §6.3: trocar o algoritmo `atende_ator`/`contraria_ator` pelo campo `atores` (§3.3) e citar este GDD.

## Pendência de roteiro

- Escolher os 2 atores sem carta de oferta (§3.5) ao escrever as cartas deles no doc 17.
