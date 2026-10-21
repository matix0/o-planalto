# Onda 0 do P-015 — análise do GD

**Autor:** GD (subagente, Opus) · **Data:** 2026-10-20 · **Branch:** `claude/p014-p015` (aberta em `edfcb04`; citações reconferidas em `4177ec1`)
**Status:** CONCLUÍDA (2026-10-20) — análise para decisões provisórias; nenhum arquivo do repositório alterado além desta nota
**Escopo:** só proposta. O PO decide; o fio principal registra decisões provisórias.

## Progresso

- [x] Lido `gestao/prompts/criacao-cartas.md` (Onda 0 em :43-51) e `.claude/agents/gd.md`
- [x] GDD 05, 06, 07, 08 (:1-60), 09 (:1-60), 03 (:1-60)
- [x] GDD mestre (340/200/70/temas): `gdd/GDD.md:278`, `:440-449`, `:453-464`, `:654-678`
- [x] doc 17 (inteiro) — contagem por script (abaixo)
- [x] docs 18 (:1-140, índice, §18.09-18.15), 12, 11; docs 01, 03, 05, 09, 10, 13, 14 nos trechos citados
- [x] decisões D-097..D-130, D-164, D-176, D-177, D-190; DP-001..DP-008
- [x] jogo/data/cards.json, actors.json, impeachment.json, modes.json, meters.json, learning.json; game_data.gd
- [x] Análise dos 6 pontos
- [x] Resumo + divergências + rascunho das DPs
- [x] Autoverificação (`.claude/rules/verificacao.md`): 8 citações conferidas no HEAD `4177ec1` — `gdd/sistemas/06_sorteio.md:44`, `docs/12…:613`, `gestao/decisoes.md:113`, `jogo/scripts/game_data.gd:124`, `docs/09…:542`, `gdd/sistemas/07_atores.md:58`, `docs/17…:555`, `docs/11…:513`: todas batem

## Análise dos 6 pontos

Restrição que pesa em todos: no regime provisório, o fio principal **não pode mudar uma D-001..D-190** (`gestao/prompts/execucao-p014-p015.md:31`). Alternativa que muda D-xxx vira "bloqueio para o PO", não DP.

### Ponto 1 — Modo Impeachment (cena × slots INST-141..160)

Fatos: cena fora das 340 (D-101, `gestao/decisoes.md:113`; `gdd/sistemas/05_cartas.md:20`); INST-141..160 dentro das 200 (`gdd/GDD.md:462`); 10 modos × 20 (D-018, `gestao/decisoes.md:30`; D-020 `:32`). O jogo **já separa** a cena: `jogo/data/impeachment.json` usa `IMP-1..5` e `APR-IMP-1..5`, e o baralho fictício tem INST-141..143 como cartas comuns do modo `impeachment` (`jogo/data/cards.json`).

| Alt. | Descrição | Prós | Contras |
| :--- | :--- | :--- | :--- |
| **A** | 20 cartas comuns do modo Impeachment (INST-141..160, medidor `Legitimidade`) + cena com prefixo próprio `IMP-1..5` / `APR-IMP-1..5` | Não muda nenhuma D (mantém D-018, D-020, D-101); igual ao jogo hoje; 10 modos na regra de 1 por modo (`gdd/sistemas/06_sorteio.md:44`) | 20 cartas novas sobre o tema da cena (risco de repetição); renomeia 5 IDs aprovados (só metadado); lista do doc 12 (`docs/12_FICHAS_DOS_MODOS.md:433-447`) vira lixo — tem "Renunciar", que hoje é ação do menu (D-122) |
| B | 9 modos no baralho; as 20 vagas vão para outros modos | Modo Impeachment = só a cena, como diz o doc 12 (`:418`) | Muda D-018 e a composição de D-020/GDD 05 §3.1 → **bloqueio para o PO**; 20 ÷ 9 não fecha; mexe em `modes.json` e no sorteio |
| C | Baralho com 320 (180 INST) | Menos escrita (300 novas) | Muda D-020 ("340" em ~10 docs) → **bloqueio para o PO** |
| D | Cena volta a contar nas 340 (15 comuns + 5 cena) | Reaproveita os IDs | Reverte D-101 → **bloqueio**; carta da cena não é sorteável (`gdd/sistemas/06_sorteio.md:26`), então o modo teria 15 sorteáveis |

**Recomendação: A.** Única que cabe no regime provisório; o motor já funciona assim. Complementos (PROPOSTA): (1) as 20 comuns tratam de pressão e legitimidade **antes** do processo (pedidos engavetados, crime de responsabilidade, base rachada, contas rejeitadas, rua × plenário), nunca de fases da cena; (2) `ano_minimo` 2 como padrão do modo, porque os gatilhos do impeachment valem "desde Ano 2" (`gdd/sistemas/03_impeachment.md:22-24`; D-023) — alternativa: padrão 1, como os outros modos; (3) doc 17 §17.09 dividido em "Cena (fora das 340): IMP-1..5" e "Cartas do modo: INST-141..160"; doc 12 `:428-447` reescrito na onda do modo.

### Ponto 2 — Contagem e número-alvo

Contagem por script (`docs/17_ROTEIRO_DAS_CARTAS.md`): 18 INST comuns + 1 THEM + 1 ATOR = **20 dentro das 340**; + 5 da cena = 25 no doc. O "22" (`:5`, `:596-601`) e os "313 restantes" do estado antigo contam INST-141/142 dentro das 340 (resto do P-010, quando o modo tinha 2 cartas: `docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:590`).

**Número-alvo (com a alternativa A): 320 cartas novas + 320 Aprendizados novos** (340 − 20). Cena: 0 novas (as 5 seguem fora).

| Modo (INST) | Faixa | Escritas | A escrever |
| :--- | :--- | :--- | :--- |
| Congresso | 001-020 | 6 | 14 |
| Orçamento | 021-040 | 2 | 18 |
| Currículo e Mídia | 041-060 | 2 | 18 |
| Geopolítico | 061-080 | 2 | 18 |
| Prisional e Policial | 081-100 | 2 | 18 |
| Emendas | 101-120 | 1 | 19 |
| Bancadas | 121-140 | 1 | 19 |
| Impeachment (comuns) | 141-160 | 0 | 20 |
| Judiciário | 161-180 | 1 | 19 |
| Influenciador | 181-200 | 1 | 19 |
| **INST** | | **18** | **182** |
| **THEM** (7 × 10) | 001-070 | 1 | **69** (Reforma Agrária 9 + 6 temas × 10) |
| **ATOR** | 001-070 | 1 | **69** (exigência 23, ataque 24, oferta 22 — se ATOR-001 = exigência, ponto 5) |
| **Total** | | **20** | **320** |

Com B: também 320 (as 20 vagas mudam de modo). Com C: 300.
Ritmo: 32 ondas de 10 (`gestao/prompts/criacao-cartas.md:95`); ECO a cada ~40 → 8 rodadas. Metas que viram cota por onda (as 40 opções aprovadas têm 0 evento e 4 com Diplomacia ≠ 0):
- Eventos 15-25% das 680 opções (D-125) = 102-170, todas nas 640 opções novas → **3-5 opções com evento por onda de 20 opções** (102-170 ÷ 32 = 3,2-5,3; mirar 4).
- Diplomacia ≥ 15% (D-126) = ≥ 102 das 680 opções → faltam ≥ 98 → **≥ 3 por onda** (98 ÷ 32 = 3,1), mais no Geopolítico.
- Influenciador: 19 novas; se INST-181 = cachê da desgraça, faltam ≥ 1 cachê + ≥ 2 de cada outra técnica = 11 vagas presas, 8 livres (D-119).
- Banco de ideias: 124 rascunhos úteis na §18.14 (127 − 3 duplicatas da cena), nenhum para Judiciário, Influenciador, THEM e ATOR.

### Ponto 3 — Os 7 temas das THEM

**O que o repositório diz:** 70 = 7 temas × 10 (`docs/04_DESIGN_DO_JOGO.md:414`, `docs/05_SISTEMAS_E_MECANICAS.md:166`, `gdd/sistemas/05_cartas.md:20`); "7 temas transversais" sem nomes (`docs/12_FICHAS_DOS_MODOS.md:613`); só "Reforma Agrária" nomeado (`docs/17_ROTEIRO_DAS_CARTAS.md:555`). Não há lista de temas em nenhum doc, GDD, rascunho da §18.14 (que só tem INST) ou JSON. **Os 6 nomes abaixo são PROPOSTA do GD.**

**Critério usado (PROPOSTA):** "transversal" = assunto que aparece em ≥ 3 modos na lista de cartas planejadas do doc 12 e não é o núcleo de um modo; com pelo menos uma destas âncoras: pesquisa própria no doc 03 (dados para os Aprendizados), ator dedicado no doc 11 (voz para `quem_fala` e `atores`), ou menção explícita como tema do jogo.

| # | Tema (PROPOSTA) | Fontes no repositório | Modos onde já aparece (doc 12) | Ator dedicado |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Reforma Agrária (existe) | `docs/17…:555`; pesquisa 03.07 Agronegócio (`docs/03_PESQUISAS_E_ESTUDOS.md:239-262`) | Emendas `:337`, Influenciador `:539` | ACT-017 MST (`docs/11_FICHAS_DOS_ATORES.md:401-414`) |
| 2 | Meio Ambiente | prompt fundador: "como o agronegócio destrói o meio ambiente" (`docs/01_CONTEXTO_E_MOTIVACAO.md:9`); cor Verde = "agronegócio, meio ambiente" (`docs/10_GUIA_DE_ESTILO_E_TOM.md:258`); INST-121 licenciamento (`docs/17…:376`) | Congresso `:99`, Geopolítico `:252`, Emendas `:349-350`, Bancadas `:392`, `:398` | ACT-018 (`docs/11…:420-433`) |
| 3 | Fome | "A Geografia da Fome é um dos temas do jogo (Fome como Escolha Política)" (`docs/09_GLOSSARIO.md:542`); pesquisa 03.20 (`docs/03…:631-650`); Mapa da Fome em 03.14 (`docs/03…:464`); finais 24 e 25 (`gdd/sistemas/02_finais.md:80-81`) | Orçamento `:148`, `:151`, `:158`; Geopolítico `:244`, `:248` | — (MST "quer produzir alimentos", `docs/11…:414`) |
| 4 | Saúde | pesquisa 03.18 (`docs/03…:577-597`); finais 16 e 23 (`gdd/sistemas/02_finais.md:72`, `:79`) | Congresso `:108`, Orçamento `:140`, `:149`, `:154`, Geopolítico `:251`, Prisional `:293`, Emendas `:343`, `:351`, Influenciador `:533` | ACT-014 (`docs/11…:344-357`) |
| 5 | Trabalho | pesquisa 03.19 (`docs/03…:605`); desemprego "o tema aparece nas cartas" (`docs/09_GLOSSARIO.md:298`, `docs/05…:147`); cor Vermelho = "direitos trabalhistas" (`docs/10…:256`); final 4 (`gdd/sistemas/02_finais.md:59`) | Congresso `:93`, `:111`; Orçamento `:152`; Bancadas `:385-386`, `:397` | ACT-015 (`docs/11…:363-376`) |
| 6 | Racismo | pesquisa 03.01 Formação/escravidão (`docs/03…:9-30`); ninguendade (`docs/09…:522-528`); INST-082 "82% eram negras" (`docs/17…:330`); público periférico (`docs/01…:86`) | Currículo `:200`, `:204`; Prisional `:303`; Bancadas `:387` | — |
| 7 | Cultura | pesquisa 03.10 Arte e Resistência (`docs/03…:331-356`) e 03.09 Futebol (`:304`) | Orçamento `:147`, `:157`; Emendas `:345`, `:348`; Bancadas `:393` | ACT-019 (`docs/11…:439-452`) |

(As colunas "Modos" citam linhas de `docs/12_FICHAS_DOS_MODOS.md`.)

**Reservas (se o PO trocar algum):** Memória e Democracia — pesquisa 03.02 (`docs/03…:58`), Militares "pede anistia" (`docs/11…:241`), doc 12 `:109`, `:198`, `:302`, final 12 (`gdd/sistemas/02_finais.md:68`); Religião e Estado Laico — 03.06 (`docs/03…:208`), ACT-012, doc 12 `:189`, `:334`, `:347`, `:531` (risco de estereótipo, PSI); Moradia e Cidade — ACT-016 MTST (`docs/11…:382-395`), Construtoras "quer despejar famílias" (`docs/11…:144`), doc 12 `:150`, `:289`, `:344` (sem pesquisa no doc 03); Gênero — doc 12 em 5 modos (`:107`, `:190`, `:192`, `:205`, `:301`, `:386`, `:391`, `:396`, `:489`), sem ator nem pesquisa própria (PSI: pânico moral).

**Alternativas de conjunto:**
- **A (recomendada):** 1-7 da tabela. Prós: cada tema tem fonte; 5 dos 6 têm ator ou pesquisa; Saúde, Fome e Meio Ambiente puxam Diplomacia (vacinas `:251`, fertilizantes `:244`, Amazônia `:252`), que está em 10%. Contras: Racismo exige PSI em quase toda carta (já é aviso de conteúdo na lista provisória DP-008, `gdd/GDD.md:771`); Cultura tem menos peso nos medidores.
- B: troca Cultura por Memória e Democracia. Prós: liga aos finais de golpe; Contras: tortura/ditadura no aviso de conteúdo; mais nomes reais (RC-08).
- C: troca Racismo por Moradia e Cidade. Prós: dá casa ao MTST; tema do público periférico; Contras: sem pesquisa no doc 03 (dados todos novos, D-091).

**Quantas por tema:** 10 (70 ÷ 7). Reforma Agrária: faltam 9; os outros 6: 10 cada. **IDs em blocos de 10 por tema** (THEM-001..010 Reforma Agrária, 011..020 tema 2 … 061..070 tema 7), como as faixas de 20 dos modos. Ordem dos blocos: a das ondas (PO).

**`modo` das THEM (regra de 1 por modo, `gdd/sistemas/06_sorteio.md:44`):**

| Alt. | Regra | Prós | Contras |
| :--- | :--- | :--- | :--- |
| **a** | Cada THEM recebe um dos 10 modos: a arena onde o dilema se decide | É o que o GDD exige (`gdd/sistemas/05_cartas.md:28`) e o jogo valida (`jogo/scripts/game_data.gd:111`); igual ao protótipo; o tema fica "transversal" de fato | Precisa de cota para não inflar um modo |
| b | Um modo fixo por tema (10 cartas no mesmo modo) | Simples | Um modo com 30 cartas sai ~50% mais nas vagas sorteadas (peso por carta); tema deixa de ser transversal |
| c | Modo novo "Temática" (11º) | Separa INST e THEM | Muda GDD 05 §3.2 e o validador → **bloqueio para o PO** |

**Recomendação: a**, com cota PROPOSTA: cada tema em ≥ 3 modos; cada modo com 5-9 THEM no total (média 7); evitar o modo Impeachment. THEM-001 → **Bancadas** (pressão do agro: "Bancada BBB (Boi…)", `docs/12…:367`; MST e Latifundiários ligados a Bancadas, `:583`, `:599`); alternativa: Congresso. Tema vai numa linha **Tema** do doc 17 e, no JSON, numa chave opcional `theme` (slug EN: `land_reform`, `environment`, `hunger`, `health`, `labor`, `racism`, `culture`) — o jogo ignora chave desconhecida (`validate_card` não rejeita, `jogo/scripts/game_data.gd:103-156`); serve ao relatório do ECO.

> Nota de sincronia: durante esta análise entraram `4dc9c8e` e `4177ec1` (P-014). Citações de `gdd/GDD.md`, `gdd/sistemas/03_impeachment.md`, `gdd/sistemas/02_finais.md` e `jogo/scripts/game_data.gd` foram reconferidas no HEAD `4177ec1`.

### Ponto 4 — Formato da carta (tabela estendida do doc 17 → `jogo/data/cards.json`)

Hoje o modelo (`docs/17_ROTEIRO_DAS_CARTAS.md:13-29`) e as cartas (`:59-74`) não têm `tipo` explícito na tabela, `ano_minimo`, `atores`, `eventos`, `tecnica`, `reacao`, função ATOR nem `quem_fala` preenchido; THEM-001 e ATOR-001 usam "Modo: Temática (…)" / "Ator (…)" (`:555`, `:578`), que o jogo reprova (`jogo/scripts/game_data.gd:111-112`).

| Alt. | Proposta | Prós | Contras |
| :--- | :--- | :--- | :--- |
| **A** | Tabela estendida no doc 17 (abaixo) + script que gera o JSON | Legível pelo PO e pelo PSI; o doc 17 segue fonte (D-090 para o 18); diffs pequenos | Precisa de parser e de regras de escrita rígidas |
| B | Bloco JSON (chaves EN) dentro do doc 17 | Zero ambiguidade; cópia direta | PO lê pior; texto PT dentro de JSON; doc vira código |
| C | Escrever direto em `jogo/data/cards.json`; doc 17 gerado | Fonte única no jogo | Inverte a fonte (prompt manda o doc 17, `gestao/prompts/criacao-cartas.md:113`); P-015 não mexe em `jogo/` antes da fase 6 (`gestao/prompts/execucao-p014-p015.md:50`) |

**Recomendação: A.** Especificação (PROPOSTA):

**Regras do parser**
1. Carta = bloco que começa em `### <ID> — <título longo>`; ID por regex `^(INST|THEM|ATOR)-\d{3}$` ou `^IMP-[1-5]$`. O título longo do cabeçalho não vai ao JSON.
2. Linhas `| **Campo** | valor |`; leitura **por nome**, a ordem não importa (as aprovadas só ganham linhas). Campo desconhecido = erro. Valor vazio é proibido: campo sem conteúdo usa `—`.
3. Medidor sempre entre crases (`` `Capital Político` ``); sinal sempre explícito (`+10`, `-10`; aceita `−` U+2212 e normaliza). Texto ao jogador entre aspas retas só na Consequência e no texto do Evento; nada de `·` dentro de textos.
4. Contagem de caracteres em NFC (acento = 1), igual a `String.length()` do Godot (`jogo/scripts/game_data.gd:164`).

**Campos da carta**

| Linha no doc 17 | Obrig. | Formato no doc | Chave JSON | Valor JSON |
| :--- | :--- | :--- | :--- | :--- |
| (cabeçalho) ID | sempre | `### INST-001 — …` | `id` | string |
| **Título** | sempre | ≤ 5 palavras | `title` | string |
| **Tipo** | sempre | Institucional · Temática · Ator · Impeachment | `type` | `institutional` · `thematic` · `actor` · `impeachment` (`game_data.gd:14`) |
| **Modo** | sempre | um dos 10 nomes PT (tabela de conversão) | `mode` | id EN (`jogo/data/modes.json`) |
| **Tema** | só THEM | um dos 7 nomes | `theme` (opcional; PROPOSTA) | slug EN (ponto 3) |
| **Função** | só ATOR | `` `ACT-001` · Exigência `` | — (vai para `actors.json`) | `actors[ACT-001].cards.demand = "ATOR-001"` (`game_data.gd:218-223`) |
| **Fase** | só cena | 1-5 | `phase` | int (`game_data.gd:353-355`) |
| **Quem fala** | sempre | `` `ACT-xxx` `` ou nome da instituição | `speaker` | `"ACT-xxx"` ou o nome PT (D-136: texto ao jogador em PT) |
| **Ano mínimo** | sempre (fora da cena) | 1-4 | `prerequisites.min_year` | int; cena: 1 |
| **Técnica** | só Influenciador | Desmoralização · Pânico Moral · Deepfake · Fazenda de IA · Cachê da Desgraça · Didatismo Acusatório | `technique` | `demoralization` · `moral_panic` · `deepfake` · `ai_farm` · `doom_cache` · `accusatory_didacticism` (`game_data.gd:17`, mesma ordem de `gdd/sistemas/09_desinformacao.md:20`) |
| **Problema** | sempre | ≤ 140 caracteres, 2 linhas | `problem` | string |
| **Aprendizado** | sempre | `APR-… (doc 18)` | `learning_id` | string (ponto 5) |
| **Status** | sempre (PROPOSTA) | `aprovado` · `provisório (DP-nnn)` | — | não exportado; marca exigida por `gestao/prompts/execucao-p014-p015.md:25` |

**Campos de cada opção** (X = A ou B; `option_a` / `option_b`)

| Linha | Obrig. | Formato no doc | Chave JSON | Valor JSON |
| :--- | :--- | :--- | :--- | :--- |
| **Opção X** | sempre | ≤ 25 caracteres | `text` | string |
| **Cor X** | sempre | Vermelho · Azul · Verde · Amarelo · Roxo · Laranja · Preto | `color` | `red` · `blue` · `green` · `yellow` · `purple` · `orange` · `black` (hex iguais: `docs/14_UI_UX_DESIGN.md:258-264` × `jogo/scripts/ui/tokens.gd:22-28`) |
| **Eixo X** | sempre | `[-1, 0, +2, 0]` (Eco, Dip, Soc, Est) | `axis` | array de 4 inteiros |
| **Efeitos X** | sempre | `` `Medidor` ±N `` separados por vírgula | `effects` | `{ "<medidor EN>": int }` |
| **Atores X** | sempre | `` `ACT-001` +1, `ACT-017` -1 `` ou `—` | `actors` | `{ "ACT-001": 1 }` ou `{}` |
| **Evento X** | sempre | "texto" · atraso 2 · `Dignidade` -15 (1-3 medidores), ou — | `events` | `[{ "text": s, "delay": int, "effects": {…} }]` ou `[]` (chaves do protótipo: `jogo/data/cards.json`) |
| **Reação X** | só Influenciador | Aceitar · Recusar · Investigar | `reaction` | `accept` · `refuse` · `investigate` (`game_data.gd:18`) |
| **Teste X** | só cena | `` `Consciência` > 45 `` | `test` | `{ "meter": en, "op": ">", "value": 45 }` (`jogo/data/impeachment.json`) |
| **Consequência X** | sempre | `"…"` ≤ 80 caracteres | `consequence` | string sem as aspas |

**Conversões PT → EN**
- Medidores (`jogo/data/meters.json`): Dignidade `dignity` · Consciência `awareness` · Soberania `sovereignty` · Segurança `security` · Integridade `integrity` · Caixa `treasury` · Capital Político `political_capital` · Legitimidade `legitimacy`.
- Modos (`jogo/data/modes.json`): Congresso `congress` · Orçamento `budget` · Currículo e Mídia `curriculum_media` · Geopolítico `geopolitics` · Prisional e Policial `prison_police` · Emendas `amendments` · Bancadas `caucuses` · Impeachment `impeachment` · Judiciário `judiciary` · Influenciador `influencer`.
- Funções (`game_data.gd:20`; `docs/13_ARQUITETURA_TECNICA.md:330`): Ataque `attack` · Exigência `demand` · Oferta `offer`.

**Saída:** INST/THEM/ATOR → `jogo/data/cards.json`; cena (`IMP-n`) → `jogo/data/impeachment.json`; Função → campo `cards` de `jogo/data/actors.json`. Aprendizado (caixa do doc 18) → `jogo/data/learning.json`: VIVENCIAR → `lived`, CONCEITO → `concept`, DADOS → `data`, FONTE → `source.label`, link de "Fonte verificada" → `source.url` (o jogo agora exige http(s), senão a carta sai do baralho: `game_data.gd:329-336`), frase final → `impact`; linhas da caixa unidas sem as bordas `│`.

**Exemplo (INST-181 com o ponto 6 aplicado)**

```
| **Tipo** | Institucional |
| **Modo** | Influenciador |
| **Quem fala** | `ACT-022` |
| **Ano mínimo** | 1 |
| **Técnica** | Cachê da Desgraça |
| **Reação A** | Recusar |
| **Atores A** | — |
| **Evento A** | — |
| **Reação B** | Aceitar |
| **Atores B** | — |
| **Evento B** | — |
| **Status** | provisório (DP-nnn) |
```
→ `"type": "institutional", "mode": "influencer", "speaker": "ACT-022", "prerequisites": {"min_year": 1}, "technique": "doom_cache", "option_a": {…, "reaction": "refuse", "actors": {}, "events": []}`.

Pontos em aberto do formato (PROPOSTA, ficam com o PO): `ano_minimo` padrão 1 em todos os modos (`gdd/sistemas/06_sorteio.md:24`) × padrão 2 nos modos marcados "Ano 2-4" no doc 12 (`docs/12_FICHAS_DOS_MODOS.md:226`, `:370`, `:466`); recomendo 1 e decidir carta a carta. Validação de 140/80 só no script do doc: o jogo não checa problema nem consequência (`jogo/scripts/game_data.gd:103-156`).

### Ponto 5 — IDs, código do Aprendizado e `modo` de THEM/ATOR

**5a. Numeração ATOR** (70 = 22 × 3 + ACT-010 e ACT-021 × 2; `gdd/sistemas/07_atores.md:52`, `:58`). ATOR-001 aprovado = Latifundiários, "O Latifundiário cobra o favor": troca votos por controle de nomeações (`docs/17_ROTEIRO_DAS_CARTAS.md:577-581`) — pela tabela de níveis (`gdd/sistemas/07_atores.md:33-39`) é **exigência** (Neutro/Insatisfeito), não ataque nem oferta.

| Alt. | Regra | Prós | Contras |
| :--- | :--- | :--- | :--- |
| **A** | Sequencial por ator (ACT-001 → 024), dentro do ator na ordem **exigência → ataque → oferta** | ATOR-001 aprovado fica como está; 001-070 sem buraco; mesmo padrão "por ator" do protótipo (`jogo/data/actors.json`: ACT-001 → 001-003, ACT-010 → 004-005); onda por ator ou categoria | Sem fórmula simples depois do ACT-010 (deslocamento −1 e −2): consulta à tabela (o jogo já usa `actors.json`, `jogo/scripts/game_data.gd:218-223`) |
| B | Slots fixos: ATOR-(3n−2) / (3n−1) / 3n | Fórmula: ator = ⌈id/3⌉ | IDs até 072 com 2 buracos (030 e 063); "ATOR-072" com 70 cartas confunde contagem |
| C | Blocos por função: 001-024 ataque, 025-048 exigência, 049-070 oferta | Função pela faixa | ATOR-001 aprovado viraria "ataque" (não é) ou mudaria de ID |
| D | Sequencial na ordem do GDD (ataque → exigência → oferta) | Segue a ordem escrita no GDD 07 | ATOR-001 vira ataque (não é) ou é renumerado para 002 (muda carta aprovada) |

**Recomendação: A.** Tabela resultante (exigência / ataque / oferta):

| Ator | IDs | Ator | IDs | Ator | IDs |
| :--- | :--- | :--- | :--- | :--- | :--- |
| ACT-001 | 001-003 | ACT-009 | 025-027 | ACT-017 | 048-050 |
| ACT-002 | 004-006 | **ACT-010** | **028-029** (sem oferta) | ACT-018 | 051-053 |
| ACT-003 | 007-009 | ACT-011 | 030-032 | ACT-019 | 054-056 |
| ACT-004 | 010-012 | ACT-012 | 033-035 | ACT-020 | 057-059 |
| ACT-005 | 013-015 | ACT-013 | 036-038 | **ACT-021** | **060-061** (sem oferta) |
| ACT-006 | 016-018 | ACT-014 | 039-041 | ACT-022 | 062-064 |
| ACT-007 | 019-021 | ACT-015 | 042-044 | ACT-023 | 065-067 |
| ACT-008 | 022-024 | ACT-016 | 045-047 | ACT-024 | 068-070 |

Fórmula de conferência: início do ator n = 3(n−1) + 1 − [n > 10] − [n > 21].

**5b. Código do Aprendizado de THEM e ATOR.** Hoje há três convenções: GDD "APR-xxx, mesmo número da carta" (`gdd/sistemas/05_cartas.md:32`); doc 17/18 `APR-THEM-001` e `APR-ATOR-001` (`docs/17…:567`, `:590`; `docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:5`); protótipo `APR-201..270` / `APR-271..340` (`jogo/data/cards.json`). O jogo só exige `APR-<n>` para INST (`jogo/scripts/game_data.gd:122-125`).

| Alt. | Regra | Prós | Contras |
| :--- | :--- | :--- | :--- |
| **A** | `APR-THEM-nnn` e `APR-ATOR-nnn`; cena `APR-IMP-n` | Nada muda nas aprovadas; único sem colisão; lê-se o tipo; o jogo já aceita | GDD 05 §3.2 precisa de ajuste de redação ("mesmo número, com o prefixo do tipo") — é texto, não regra |
| B | Global: THEM n → APR-(200+n), ATOR n → APR-(270+n) | Sempre `APR-` + 3 dígitos; 001-340 | Muda APR-THEM-001 e APR-ATOR-001 aprovados; número ≠ número da carta (contra o GDD) |
| C | Literal "mesmo número" (THEM-001 → APR-001) | Letra do GDD | Colide com o APR-001 da INST-001 — inviável |

**Recomendação: A.** Validador: estender a regra de `game_data.gd:124-125` para THEM/ATOR (`APR-THEM-<n>`, `APR-ATOR-<n>`) é trabalho do P-014/migração (registrar, não fazer agora).

**5c. `modo` das THEM:** ponto 3 (alternativa a — modo por carta, arena do dilema).

**5d. `modo` das ATOR** (o ataque é obrigatório e isento, mas conta como modo visto, `gdd/sistemas/06_sorteio.md:44`):

| Alt. | Regra | Prós | Contras |
| :--- | :--- | :--- | :--- |
| **a** | Por carta, entre os "Modos em que Aparece" do ator (`docs/12_FICHAS_DOS_MODOS.md:581-606`), 3 cartas em ≥ 2 modos quando o ator tem ≥ 2 | Usa o critério já aprovado no P-013 (`:579`); espalha a pressão | Escolha manual por carta |
| b | Fixo: 1º modo da lista do ator | Mecânico | 3 cartas no mesmo modo; Latifundiários sempre Congresso |
| c | Modo novo "Ator" | Separa | Muda GDD 05 §3.2 e o validador → bloqueio para o PO |

**Recomendação: a.** ATOR-001 → **Congresso** (votos em troca de nomeações; Congresso está na lista de ACT-001, `docs/12…:583`); alternativa: Bancadas.

### Ponto 6 — Cartas aprovadas × regras novas

Achado além do prompt: não são só 4 opções e "Quem fala". As 25 aprovadas também precisam de: 3 consequências > 80 (`docs/17…:234`, `:314`, `:515`); `tecnica` e `reacao` na INST-181 (o jogo a reprova sem elas, `jogo/scripts/game_data.gd:131-132`, `:205-208`); `atores` e função na ATOR-001 (`game_data.gd:152-155`); `modo` válido em THEM-001 e ATOR-001 (`game_data.gd:111-112`); `ano_minimo` explícito em todas.

| Alt. | O que faz | Prós | Contras |
| :--- | :--- | :--- | :--- |
| **A+** | A do prompt (4 opções + Quem fala, uma a uma) **ampliada** com os itens acima | Tudo passa no validador do jogo e no `/validate-cards`; não toca efeitos, eixos nem cores (D-126 "vetores aprovados não mudam", `gestao/decisoes.md:138`) | 25 cartas com marca "provisório (DP-nnn)" até o PO |
| A | Só o que o prompt lista | Menor mudança | INST-181 e ATOR-001 seguem reprovadas no jogo; 3 consequências fora do limite |
| B | Exceção para as aprovadas antes de 2026-10-20 | Nada muda no texto | Contra D-177 ("checado pelo `/validate-cards`", `gestao/decisoes.md:189`) → **bloqueio para o PO**; no jogo, IMP-4 e IMP-5 reprovadas quebram a cena ("no valid card for phase", `jogo/scripts/game_data.gd:370-374`) |
| C | Só Quem fala; mantém as 4 opções | Texto aprovado intacto | Mesma quebra da cena; INST-002 e INST-101 fora do baralho |

**Recomendação: A+.** Textos propostos (contados em NFC):

| Carta | Campo | Hoje | Proposta | Car. |
| :--- | :--- | :--- | :--- | :--- |
| INST-002 | Opção A (`:85`) | Mobilizar senadores aliados (27) | Mobilizar senadores | 19 |
| INST-101 | Opção A (`:354`) | Redirecionar para o hospital (28) | Redirecionar ao hospital | 24 |
| IMP-4 (INST-144) | Opção B (`:470`) | Oferecer cargos a senadores (27) | Oferecer cargos | 15 |
| IMP-5 (INST-145) | Opção B (`:491`) | Selar um pacto com o Congresso (30) | Pactuar com o Congresso | 23 |
| INST-041 | Consequência B (`:234`) | 86, verbo no futuro | "A lei passa. Os alunos aprendem 'educação financeira' em vez de pensar." | 71 |
| INST-081 | Consequência A (`:314`) | 88 | "A população diz que 'nada foi feito'. Mas menos jovens entram no sistema." | 73 |
| INST-161 | Consequência A (`:515`) | 88 | "O ministro é investigado. O STF entra em crise. A lei vale para todos." | 70 |

As quatro opções batem com a vivência dos APR já aprovados (`docs/18…:111`, `:531`, `:691`); para IMP-5 a alternativa "Selar um pacto" (14) bate com `:717`, mas perde "Congresso" (lado B da cena = Congresso, `gdd/sistemas/03_impeachment.md:10`).

Quem fala (PROPOSTA; instituições citadas no repo: Câmara, Senado, STF em `docs/14_UI_UX_DESIGN.md:83`, Congresso Nacional em `docs/03…:387`; "Ministério da Fazenda/Justiça" não aparecem no repo e ficam [a confirmar pelo PO]):

| Carta | Quem fala | Por quê | Alternativa |
| :--- | :--- | :--- | :--- |
| INST-001 | Congresso Nacional | "O Congresso analisa…" (`:65`) | Câmara dos Deputados |
| INST-002 | Senado Federal | "O Senado vai analisar" (`:84`) | — |
| INST-003 | Câmara dos Deputados | CPI e presidente da Câmara (`:103`) | — |
| INST-004 | Senado Federal | Senado analisa a indicação (`:122`) | — |
| INST-005 | `ACT-001` | "A bancada ruralista quer…" (`:141`); Latifundiários oferecem votos no Congresso (`docs/11…:104`) | Congresso Nacional |
| INST-006 | Congresso Nacional | "O Congresso quer aumentar…" (`:160`) | — |
| INST-021 | `ACT-007` | Tecnocratas "pede mais cortes" (`docs/11…:222`) | Ministério da Fazenda [a confirmar] |
| INST-022 | `ACT-006` | credores pressionam; Mercado "exige cortes" (`docs/11…:201`) | Ministério da Fazenda [a confirmar] |
| INST-041 | Congresso Nacional | "O Congresso propõe…" (`:227`) | — |
| INST-042 | `ACT-012` | TV de um pastor (`:246`) | — |
| INST-061 | `ACT-010` | Diplomata "pede apoio ao BRICS" (`docs/11…:279`) | — |
| INST-062 | `ACT-021` | "Uma potência estrangeira oferece…" (`:288`) | — |
| INST-081 | Ministério da Justiça [a confirmar] | nenhum dos 24 atores administra presídios | — |
| INST-082 | Ministério da Justiça [a confirmar] | voz institucional no tema de aviso (violência policial) | `ACT-023` |
| INST-101 | `ACT-011` | Líder da Câmara "pede emendas" (`docs/11…:298`) | Câmara dos Deputados |
| INST-121 | Câmara dos Deputados | a BBB não é um dos 24 atores (`:376`) | `ACT-011` |
| IMP-1..3 | Câmara dos Deputados | DP-001 (`gestao/decisoes-provisorias.md:9`) | — |
| IMP-4..5 | Senado Federal | DP-001 | — |
| INST-161 | `ACT-023` | "A imprensa revela…" (`:512`); Jornalista "denuncia escândalo" (`docs/11…:530`) | Supremo Tribunal Federal |
| INST-181 | `ACT-022` | Coach "financiado por bets" (`docs/11…:513`) | — |
| THEM-001 | `ACT-017` | "O MST ocupa…" (`:558`) | Câmara dos Deputados |
| ATOR-001 | `ACT-001` | dono da carta (DP-001) | — |

Demais campos das aprovadas (PROPOSTA):
- INST-181: Técnica **Cachê da Desgraça**; Reação A **Recusar**, B **Aceitar** (como no exemplo do doc 05, `docs/05_SISTEMAS_E_MECANICAS.md:435-439`); B perde `Consciência` −15 e `Integridade` −10 → passa na regra do `aceitar` (`gdd/sistemas/09_desinformacao.md:28`).
- ATOR-001: Função **`ACT-001` · Exigência**; Atores A (Recusar) `ACT-001` −1; Atores B (Aceitar) `ACT-001` +1; Modo **Congresso** (5d).
- THEM-001: Modo **Bancadas**; Tema **Reforma Agrária** (ponto 3).
- Cena: IDs `IMP-1..5`, APR `APR-IMP-1..5`, linha **Fase** 1-5 (ponto 1).
- Todas: **Ano mínimo 1** (padrão, `gdd/sistemas/06_sorteio.md:24`; sem mudança de comportamento); Atores e Evento `—` nas INST/THEM (0 atores e 0 eventos são válidos); Status "provisório (DP-nnn)".


## Resumo — regras de escrita e estado do baralho (passo 2 do "Processo")

1. Carta: título ≤ 5 palavras; problema ≤ 140 caracteres/2 linhas; opção ≤ 25 (D-177); consequência ≤ 80; `quem_fala` obrigatório (D-164); A/B com lado sorteado e sem "esquerda/direita" (D-084) (`docs/10_GUIA_DE_ESTILO_E_TOM.md:100-105`; `gdd/sistemas/05_cartas.md:24-47`).
2. Opção: 1 das 7 cores, distintas em A e B (D-092, D-103); eixo de 4 inteiros −2..+2; 2-4 efeitos, múltiplos de 5, ±5..±30, ≥ 1 negativo (salvo Boa Vontade na oferta, D-108); 0-3 atores ±1 (a ATOR cita o próprio ator nas duas); 0-1 evento (atraso 1-2; 1-3 efeitos ±5..±20, D-125); `ano_minimo` 1-4, padrão 1.
3. Influenciador: 1 técnica de 6, reações distintas, `aceitar` perde Integridade ou Consciência; cada técnica em ≥ 2 cartas (D-119, D-120).
4. Baralho (avisos): eventos em 15-25% das opções; cada eixo ≠ 0 em ≥ 15%; toda cor com saldo negativo; carta ligada por medidor (cota "[a definir]").
5. Ética e dados: dado só com link verificado (D-091), senão a carta fica fora (D-102; o jogo agora tira a carta sem link http(s), `jogo/scripts/game_data.gd:329-336`); sem citação ou acusação nova de pessoa viva até o RC-08 (D-190); PSI obrigatório no Influenciador, no Prisional, com nome real e nos temas de aviso.
6. Estado: **20 de 340** escritas (18 INST + 1 THEM + 1 ATOR) + 5 da cena fora das 340; 25 Aprendizados ligados, todos com link (4 "fonte fraca": APR-061, -121, -144, -145; 2 com "[não verificado]" no texto ao jogador: APR-062 `docs/18…:441`, APR-THEM-001 `:827-828`); 124 rascunhos úteis.
7. Pendências das aprovadas: 0 de 25 com `quem_fala`; 4 opções > 25; 3 consequências > 80; INST-181 sem técnica/reação; ATOR-001 sem `atores`/função; THEM-001 e ATOR-001 sem modo válido; 0 eventos; Diplomacia em 10% (4 de 40 opções); custo por cor já cumprido.

## Divergências encontradas

**Prompt × repositório**
1. "22 escritas" (`gestao/prompts/criacao-cartas.md:46`): são 20 dentro das 340 + 5 da cena = 25 no doc. O doc 18 repete o 22 (`docs/18…:7`) e tem "2 de 20" no §18.09 com 5 APR (`:590`).
2. Ponto 6 lista só 4 opções e "Quem fala" (`criacao-cartas.md:50`); faltam 3 consequências > 80, técnica/reação da INST-181, `atores` e função da ATOR-001, modo de THEM-001/ATOR-001. "Nenhuma das 22" são 25 (com a cena).
3. "Diplomacia está em 9%" (`criacao-cartas.md:69`): 10% nas 40 opções comuns (9% = 4/44, contagem antiga).
4. `/validate-cards` "cita dados/cartas.json" (`criacao-cartas.md:104`): já corrigido no P-014 etapa 2 (`.claude/commands/validate-cards.md:10`).
5. Cena: o prompt usa INST-141..145; o jogo já usa `IMP-1..5` e `APR-IMP-1..5` (`jogo/data/impeachment.json`).
6. Citações com 1 linha de diferença: `docs/17…:388` → `:389`; `:566` → `:567`; `:595-600` → `:596-601`; `gdd/sistemas/05_cartas.md:31` → `:32`. `gdd/sistemas/03_impeachment.md:31` fala das 5 cartas extras no turno, não de "fora das 340" (isso está em `gdd/sistemas/05_cartas.md:20` e D-101).

**Dentro do repositório**
7. Três convenções de APR para THEM/ATOR (GDD 05 `:32` × doc 18 `:5` × `jogo/data/cards.json`).
8. Doc 12, modo Impeachment: gatilho "só a cena" (`docs/12…:418`) e INST-146..160 como ações da cena, com "Renunciar" (`:437`, `:446`) — conflita com D-122 (renúncia = "Abandonar mandato").
9. Doc 12 × doc 17: INST-082 "11 por dia" (`docs/12…:285`) × "17 por dia" (`docs/17…:322`); INST-161 "52 mensagens" (`docs/12…:476`) × "28" (`docs/17…:504`).
10. Banco de ideias do doc 12 com repetições: "Emenda para show" em INST-024 (`:143`) e INST-101 (`:332`); maioridade penal em INST-010, -087, -124, -200 (`:101`, `:290`, `:383`, `:543`); Marco Temporal em INST-005, -123, -172 (`:96`, `:382`, `:487`); indicação ao STF em INST-004 e -122 (`:95`, `:381`).
11. Doc 12 "Gatilhos: Ano 2-4" (Geopolítico, Bancadas, Judiciário: `:226`, `:370`, `:466`) × `ano_minimo` padrão 1 (`gdd/sistemas/06_sorteio.md:24`).
12. Exemplo do guia com opção de 29 caracteres: "Investir em programas sociais" (`docs/10_GUIA_DE_ESTILO_E_TOM.md:230`).
13. Nota "Regras da cena" fora do lugar, sob o Judiciário (`docs/17…:502`).
14. §18.14 tem 3 rascunhos duplicados dos APR da cena já aprovados (`docs/18…:4151-4235`): os "127 rascunhos" são 124 úteis.
15. Doc 11 "Cartas Associadas" ainda na numeração antiga de 5 por ator, ATOR-001..120 (ex.: `docs/11…:106`) × D-105.
16. Status desatualizados: "22 cartas" em `gdd/GDD.md:449`, `:489`; "hoje 22 jogáveis" em D-102 e `gdd/sistemas/05_cartas.md:90`.
17. INST-041 consequência B no futuro ("aprenderão", `docs/17…:234`) × "presente do indicativo" (`docs/10…:118`).
18. O validador do jogo não checa problema (140) nem consequência (80) (`jogo/scripts/game_data.gd:103-156`); o prompt os trata como "reprovam" (`criacao-cartas.md:54`).

## Rascunho das DPs (para o fio principal copiar em `gestao/decisoes-provisorias.md`)

| Pergunta | Alternativas | Escolhida | Por quê | Arquivos afetados | Como reverter |
| :--- | :--- | :--- | :--- | :--- | :--- |
| P-015 Onda 0 · 1. Modo Impeachment × cena | A) 20 comuns INST-141..160 + cena `IMP-1..5` · B) 9 modos · C) 320 cartas · D) cena dentro das 340 | A (+ `ano_minimo` 2 no modo, PROPOSTA) | Única sem mudar D-018/D-020/D-101; o jogo já funciona assim | `docs/17` §17.09, `docs/18` §18.09 (IDs da cena) | Voltar os IDs INST-141..145 e APR-141..145 |
| 2. Número-alvo | 320 (A ou B) · 300 (C) | 320 novas: 182 INST + 69 THEM + 69 ATOR; 32 ondas | Contagem por script: 20 escritas nas 340 | `docs/17` `:5`, `:596-601`; `docs/18` `:7`, `:4245-4250` | Recontar |
| 3. Temas THEM | A) RA + Meio Ambiente, Fome, Saúde, Trabalho, Racismo, Cultura · B) troca Cultura por Memória · C) troca Racismo por Moradia | A; 10 por tema, blocos de 10; `modo` por carta (cota 5-9 por modo); THEM-001 em Bancadas | Cada tema com fonte no repo (tabela do ponto 3) | `docs/17` §17.12 | Trocar nomes/ordem dos blocos |
| 4. Formato da carta | A) tabela estendida + script · B) JSON no doc · C) JSON como fonte | A | Legível ao PO/PSI, parse por nome de linha | `docs/17` §17.01.1 (modelo) | Voltar o modelo `:13-29` |
| 5. IDs | ATOR: A seq. por ator (exigência→ataque→oferta) · B slots · C por função · D ordem do GDD; APR: A `APR-THEM/ATOR-nnn` · B global · C literal; modo ATOR: a por carta · b fixo · c novo | ATOR A; APR A; modo ATOR a (ATOR-001 em Congresso, exigência) | Nenhuma carta aprovada muda de ID; o jogo aceita | `docs/17` §17.13, `docs/18` §18.12-18.13 | Renumerar |
| 6. Aprovadas × regras novas | A+ ampliada · A · B exceção · C só quem fala | A+ (textos e Quem fala do ponto 6) | Sem isso, IMP-4/5 quebram a cena e INST-181/ATOR-001 saem do baralho | 25 cartas do `docs/17` | Voltar o texto aprovado (git) |

## Notas de leitura

### Doc 17 — contagem por script (NFC, acento = 1 caractere)

Script: `/tmp/claude-0/-home-claude/ccf14043-d77f-5108-b917-ae211aec5076/scratchpad/count17.py` (fora do repo).

| Grupo | Cartas no doc 17 | IDs |
| :--- | :--- | :--- |
| INST comuns | 18 | 001-006 (Congresso 6), 021-022, 041-042, 061-062, 081-082 (2 cada), 101, 121, 161, 181 (1 cada) |
| Cena de impeachment | 5 | INST-141..145 (`docs/17_ROTEIRO_DAS_CARTAS.md:391-496`) |
| THEM | 1 | THEM-001 (`:550`) |
| ATOR | 1 | ATOR-001 (`:573`) |
| **Total no doc** | **25** | 20 dentro das 340 + 5 da cena |

- Doc 17 diz "22 de 340 + 5 da cena" (`:5`) e a tabela diz 20 INST + 1 + 1 = 22 (`:596-601`). Nenhum dos dois bate: dentro das 340 há **20**; no doc há **25**.
- Opções > 25: INST-002 A 27 (`:85`), INST-101 A 28 (`:354`), INST-144 B 27 (`:470`), INST-145 B 30 (`:491`) — confere com o prompt. INST-001 A tem exatamente 25 (`:66`), INST-004 B 25 (`:127`), INST-081 B 25 (`:316`) — no limite, passam.
- **Achado novo:** 3 consequências > 80 caracteres (sem aspas): INST-041 B 86 (`:234`), INST-081 A 88 (`:314`), INST-161 A 88 (`:515`). O prompt não lista (regra: `gestao/prompts/criacao-cartas.md:54`).
- Problema máximo: INST-121 com 140 (`:376`) — no limite, passa.
- "Quem fala": 0 de 25 cartas preenchem (só o modelo tem a linha, `:17`).
- Nota "Regras da cena" repetida por engano sob o Judiciário (`:502`).

### Doc 18

- 25 APR ligados (não 22): APR-001..006, 021-022, 041-042, 061-062, 081-082, 101, 121, 141-145, 161, 181, THEM-001, ATOR-001. Cabeçalho do §18.09 diz "2 de 20" e há 5 (`docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:590-733`). Status do topo diz 22 (`:7`); resumo diz 20 INST (`:4245-4250`).
- Código do APR: "INST-001 → APR-001; THEM-001 → APR-THEM-001" (`:5`) e caixa "CARTA DE APRENDIZADO — THEM-001" (`:813`), "APR-ATOR-001" (`:844`).
- §18.14: 127 rascunhos = Congresso 14 + Orçamento 18 + Currículo 18 + Geopolítico 18 + Prisional 18 + Emendas 19 + Bancadas 19 + Impeachment 3 (APR-143..145, duplicatas antigas das já ligadas, `:4151-4235`). **Nenhum rascunho para Judiciário, Influenciador, THEM ou ATOR.** Logo, §18.14 não sustenta nome de tema THEM.

### Doc 12

- MOD-008 Impeachment: INST-146..160 listados como títulos-ação de uma cena antiga ("Renunciar", "Aceitar a condenação", "Acionar o STF", "Convocar plebiscito"…) (`docs/12_FICHAS_DOS_MODOS.md:433-447`); gatilho do modo = só a cena (`:418`).
- Gatilhos "Ano 2-4": Geopolítico (`:226`), Bancadas (`:370`), Judiciário (`:466`); demais "Ano 1-4". Base para `ano_minimo` padrão por modo.
- "7 temas transversais" sem nomes (`:613`). Modos por ator: `:581-606`.

### Doc 11

- 24 atores e categorias: `docs/11_FICHAS_DOS_ATORES.md:56-81` (Capital 001-006, Estado 007-011, Sociedade Civil 012-019, Mídia e Tecnologia 020-024).
- "Cartas Associadas" ainda na numeração antiga de 5 por ator (ATOR-001..120): ex. `:106` ATOR-001..005 Latifundiários. ATOR-001 do doc 17 = "O Latifundiário cobra o favor" = ref. antiga `:106`.

### Fontes para temas THEM (busca no repo)

- Só "Reforma Agrária" nomeada (`docs/17_ROTEIRO_DAS_CARTAS.md:555`). "7 temas × 10" em `docs/04_DESIGN_DO_JOGO.md:414`, `docs/05_SISTEMAS_E_MECANICAS.md:166`, `gdd/sistemas/05_cartas.md:20`.
- Doc 03 tem 20 pesquisas (`docs/03_PESQUISAS_E_ESTUDOS.md:9-651`); as que não têm modo próprio: 03.01 Formação/escravidão (`:9`), 03.06 Neopentecostalismo (`:208`), 03.07 Agronegócio (`:239`, inclui Violência no Campo, Agricultura Familiar, Marco Temporal), 03.09 Futebol (`:304`), 03.10 Arte e Resistência (`:331`), 03.12 Privatizações e Desindustrialização (`:393`), 03.14 ODS (`:454`), 03.18 Saúde/SUS (`:577`), 03.19 Economia (`:605`), 03.20 Fome (`:631`).
- Doc 09: "Geografia da Fome é um dos temas do jogo (Fome como Escolha Política)" (`docs/09_GLOSSARIO.md:542`); inflação/juros/desemprego "o tema aparece nas cartas" (`:282`, `:290`, `:298`).
- Doc 01 (prompt fundador): "como o agronegócio destrói o meio ambiente" (`docs/01_CONTEXTO_E_MOTIVACAO.md:9`).

### Jogo (P-005 + P-014 etapa 2, HEAD `edfcb04`)

- `validate_card` (`jogo/scripts/game_data.gd:103-156`): `mode` tem de existir em `modes.json` (`:111`) — os 10 modos, inclusive `impeachment` (`jogo/data/modes.json`). Logo, THEM e ATOR **precisam** de um dos 10 modos.
- APR: não-impeachment exige prefixo `APR-` (`:122`); só INST exige `APR-<número>` (`:124-125`). THEM/ATOR passam com qualquer `APR-…`.
- `speaker` obrigatório; se começa com `ACT-`, o ator tem de existir (`:116-120`). Opção ≤ 25 por `String.length()` (`:12`, `:164`). Título ≤ 5 palavras (`:113`). **Não checa** problema (140) nem consequência (80).
- Chaves EN: cores `red/blue/green/yellow/purple/orange/black` (`:16`); técnicas `demoralization/moral_panic/deepfake/ai_farm/doom_cache/accusatory_didacticism` (`:17`); reações `accept/refuse/investigate` (`:18`); funções `attack/demand/offer` (`:20`).
- Medidores EN (`jogo/data/meters.json`): dignity=Dignidade, awareness=Consciência, sovereignty=Soberania, security=Segurança, integrity=Integridade, treasury=Caixa, political_capital=Capital Político, legitimacy=Legitimidade.
- Modos EN (`jogo/data/modes.json`): congress, budget, curriculum_media, geopolitics, prison_police, amendments, caucuses, impeachment, judiciary, influencer.
- Baralho fictício (`jogo/data/cards.json`, 40): **3 INST no modo `impeachment` (INST-141..143) jogáveis como cartas comuns**; THEM com `mode` de um modo institucional (THEM-001 prison_police; 002/004/005 impeachment; 003 budget); APR das THEM = APR-201..205; das ATOR = APR-271..275 (numeração global 201-270 / 271-340). ATOR: ACT-001 → ATOR-001 ataque, 002 exigência, 003 oferta; ACT-010 → ATOR-004 ataque, 005 exigência (`jogo/data/actors.json`, campo `cards`). `speaker` das THEM = nome do modo ("Impeachment", "Orçamento").
- Cena: `jogo/data/impeachment.json` usa `id` **IMP-1..IMP-5**, `phase` 1-5, `learning_id` **APR-IMP-1..5**, `speaker` "Câmara dos Deputados" (1-3) e "Senado Federal" (4-5) (DP-001).
- `gestao/decisoes-provisorias.md` DP-001: `quem_fala` = instituição do modo (INST e THEM), ator dono (ATOR), Câmara/Senado na cena.
- Evento: `{text, delay, effects}`; pré-requisito: `{"min_year": n}`; Aprendizado (`learning.json`): `{id, lived, concept, data, source:{label,url}, impact}`.

### Limites (doc 10)

- Título 5 palavras; problema 2 linhas/140; opção 25 (D-177); consequência 1 linha/80 (`docs/10_GUIA_DE_ESTILO_E_TOM.md:100-105`, `:205`, `:220`, `:237`).
- **Divergência:** exemplo do próprio guia "Investir em programas sociais" tem 29 caracteres (`docs/10_GUIA_DE_ESTILO_E_TOM.md:230`).

### Checagem das 25 aprovadas contra as regras novas (script `check17.py`)

- Cor, eixo, efeitos (2-4, múltiplos de 5, ±5..±30, ≥ 1 negativo) e cores distintas: **todas OK**.
- Faltam, além de `quem_fala` e dos 25 caracteres: (a) **INST-181 sem `tecnica` nem `reacao`** — o jogo reprova (`jogo/scripts/game_data.gd:131-132`, `:205-208`); o doc 05 já dá recusar/aceitar e o APR nomeia "cachê da desgraça" (`docs/05_SISTEMAS_E_MECANICAS.md:433-443`, `docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:788-790`); (b) **ATOR-001 sem `atores`** — tem de citar ACT-001 nas duas (`gdd/sistemas/07_atores.md:53`; `game_data.gd:152-153`) e sem função definida; (c) `ano_minimo` ausente em todas (padrão 1, `gdd/sistemas/06_sorteio.md:24`).
- Eixo nas 40 opções comuns: Eco 38%, Dip **10%**, Soc 32%, Est 35% (meta ≥ 15%, `gdd/sistemas/04_eixo.md:72`).
- Saldo por cor (40 opções comuns): toda cor já tem ≥ 1 medidor negativo (D-100 cumprida hoje).
- Origem do "22": no P-010 o modo Impeachment tinha 2 cartas (§18.09 "2 de 20", `docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:590`): 18 + 2 + 1 + 1 = 22. As fases 3-5 entraram no P-013 e o "+ 5 da cena" passou a contar 141-142 duas vezes. "313 restantes" (estado antigo) = 340 − 27, também conta a cena dentro das 340.

### Reescritas medidas (NFC)

| Carta | Atual | Proposta | Car. |
| :--- | :--- | :--- | :--- |
| INST-002 A | Mobilizar senadores aliados (27) | **Mobilizar senadores** (= vivência do APR-002, `docs/18…:111`) | 19 |
| INST-101 A | Redirecionar para o hospital (28) | **Redirecionar ao hospital** | 24 |
| INST-144 B | Oferecer cargos a senadores (27) | **Oferecer cargos** (= APR-144, `docs/18…:691`); alt. "Oferecer cargos no Senado" (25) | 15 |
| INST-145 B | Selar um pacto com o Congresso (30) | **Pactuar com o Congresso**; alt. "Selar um pacto" (14, = APR-145 `:717`) | 23 |
| INST-041 cons. B | … aprenderão 'educação financeira' em vez de pensar criticamente. (86; futuro) | A lei passa. Os alunos aprendem 'educação financeira' em vez de pensar. | 71 |
| INST-081 cons. A | … Mas, aos poucos, menos jovens entram no sistema. (88) | A população diz que 'nada foi feito'. Mas menos jovens entram no sistema. | 73 |
| INST-161 cons. A | … Mas o povo vê que a lei vale para todos. (88) | O ministro é investigado. O STF entra em crise. A lei vale para todos. | 70 |

