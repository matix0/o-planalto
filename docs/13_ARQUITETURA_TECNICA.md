# 13 — Arquitetura Técnica

**Documento de Definição da Estrutura de Dados, Stack de Desenvolvimento e Sistemas do Jogo "O Planalto"**

Este documento define a arquitetura técnica do jogo, incluindo a stack de desenvolvimento (Godot 4.7.2 + MCP + Agentes de IA), a estrutura de dados de cada elemento (cartas, medidores, atores, turnos, finais), os algoritmos de sorteio e os sistemas de satisfação e eixo ideológico. Foi o documento-base do protótipo (P-005, pasta `jogo/`) e, desde a sincronização de 2026-10-20 (`docs/13.1_RELATORIO_SINCRONIZACAO.md`), descreve o que o protótipo implementa. O que ainda é plano vem marcado **(planejado)**.

**Convenções:**

| Tema | Regra |
| :--- | :--- |
| Idioma (D-136) | Chaves, ids, valores de enumeração, nomes de arquivo e código em EN; texto exibido ao jogador em PT-BR. |
| Projeto Godot (D-137) | Na subpasta `jogo/`, fora do alcance de `site/`, `docs/` e `gdd/`. |
| Dados (D-138) | JSON em `jogo/data/`, não `.tres`. |
| Citações | `arquivo:linha` no estado de 2026-10-20. O P-014 ainda altera `jogo/`; confira a linha antes de depender dela. |

---

## 13.1. Fundamentação Teórica

### 13.1.1. Arquitetura de Jogos Baseados em Cartas

Jogos baseados em cartas (*card-based games*) como *Reigns*, *Reigns: Her Majesty* e *Reigns: Game of Thrones* utilizam uma arquitetura de **dados orientados a tabelas**. Cada carta é um registro em uma tabela, com campos que definem seu comportamento. O motor do jogo lê esses registros e os converte em eventos jogáveis.

> "A arquitetura de *Reigns* é baseada em um sistema de cartas que são armazenadas em um banco de dados e sorteadas conforme o estado do reino. Cada carta tem um conjunto de pré-requisitos, efeitos e consequências." — François Alliot, criador de *Reigns*

### 13.1.2. Influência de "Senhor Presidente" (2016)

O jogo **Senhor Presidente** (Icon Games, 2016) é uma referência fundamental para o projeto. Trata-se de um simulador político brasileiro onde o jogador assume o papel do presidente da fictícia **República do Bananistão** e precisa **sobreviver ao mandato de 4 anos**.

**Mecânicas centrais do "Senhor Presidente":**

| Elemento | Descrição |
| :--- | :--- |
| **Objetivo** | Sobreviver ao mandato de 4 anos |
| **Foco** | Gestão de recursos, popularidade e sobrevivência política |
| **Recursos** | Popularidade, dinheiro, apoio do Congresso |
| **Riscos** | Impeachment, revolta armada, tentativa de assassinato |
| **Tom** | Humor, sátira política |

**O que o projeto "O Planalto" herda do "Senhor Presidente":**

1. **A estrutura de 4 anos de mandato** — o jogo é dividido em 4 turnos, um por ano.
2. **A mecânica de sobrevivência** — o jogador precisa equilibrar diferentes forças para não ser deposto.
3. **A sátira política como ferramenta educativa** — o humor torna o conteúdo acessível.

**O que o projeto "O Planalto" supera:**

1. **A sátira datada** — o "Senhor Presidente" satiriza o governo Bolsonaro; o "O Planalto" busca uma análise estrutural do sistema político brasileiro (o cenário é o Brasil, D-086). Nomes reais aparecem só em atores e citações dos finais (D-083); o parecer jurídico segue pendente (RC-08).
2. **O foco no orçamento** — o "Senhor Presidente" ensina que "você só ganha o jogo cortando orçamento"; o "O Planalto" ensina que o orçamento público não é como o de casa, e que investimento gera arrecadação futura.
3. **A ausência de fundamentação teórica** — o "Senhor Presidente" é entretenimento; o "O Planalto" é ferramenta de conscientização com base em pesquisa.

> "O 'Senhor Presidente' foi um marco para o público brasileiro, provando que há apetite para simulações políticas. Nosso projeto parte dessa herança, mas busca ir além: não apenas satirizar, mas conscientizar." — Mateus, idealizador do projeto

**Referências:**

- Icon Games. *Senhor Presidente*. 2016. Google Play.
- Drops de Jogos. *Desenvolvedor indie do Rio de Janeiro cria game satirizando o momento político nacional*. 2016.

### 13.1.3. Padrões de Projeto Recomendados

Para a implementação, recomendamos os seguintes padrões de projeto (*design patterns*). A terceira coluna diz o que o protótipo (P-005) fez de fato:

| Padrão | Aplicação no Jogo | No protótipo (P-005) |
| :--- | :--- | :--- |
| **Data-Driven Design** | Todo o conteúdo (cartas, atores, finais) é armazenado em arquivos de dados externos (JSON, Resource), não no código-fonte. | Adotado, com JSON (D-138), carregado e validado por `GameData` (`jogo/scripts/game_data.gd:43-74`). |
| **State Machine** | O jogo tem estados bem definidos: Calibração, Turno, Carta, Carta de Aprendizado, Impeachment, Final. | Adotado em `GameFlow`, com 9 estados (`jogo/scripts/core/game_flow.gd:11-12`; §13.6.6). |
| **Observer Pattern** | Os medidores observam as mudanças de estado e atualizam a interface automaticamente via *signals*. | Parcial: `Game.state_changed` e `Settings.changed` são *signals* (`jogo/scripts/autoload/game.gd:9`, `jogo/scripts/autoload/settings.gd:6`); o núcleo (`GameFlow`) é puro e não emite sinais (`jogo/scripts/core/game_flow.gd:3-5`). |
| **Factory Pattern** | As cartas são criadas a partir de uma fábrica que lê os dados JSON e instancia os objetos. | Não adotado: a carta é um `Dictionary` validado e indexado por `GameData` (`jogo/scripts/game_data.gd:30,58-65`), sem fábrica nem objeto de carta. |
| **Strategy Pattern** | O algoritmo de sorteio pode ser alterado (aleatório, prioridade narrativa, etc.) sem mudar o resto do código. | Parcial: o sorteio fica isolado em `DrawRules` (`jogo/scripts/core/draw_rules.gd`), sem interface intercambiável. |

### 13.1.4. Escolha da Engine

| Engine | Vantagens | Desvantagens |
| :--- | :--- | :--- |
| **Godot 4.7** | Multiplataforma, open source, GDScript similar a Python, cena de cartas fácil de montar, ecossistema MCP maduro | Curva de aprendizado inicial |
| **HTML/JS** | Fácil de publicar na web, IA gera código facilmente | Mobile requer empacotamento (PWA, Capacitor), menos ferramentas MCP |

**Decisão:** **Godot 4.7** (confirmada; em uso: 4.7.2, D-130). Justificativa detalhada na seção 13.2.

---

## 13.2. Stack de Desenvolvimento: Godot 4.7 + MCP + Agentes de IA

### 13.2.1. Visão Geral

A stack de desenvolvimento escolhida é composta por três camadas:

| Camada | Componente | Função |
| :--- | :--- | :--- |
| **Engine** | Godot 4.7.2 (D-130) | Motor do jogo, editor visual, exportação multiplataforma |
| **Protocolo** | MCP (*Model Context Protocol*) | Ponte entre o agente de IA e o editor Godot |
| **Agente** | Claude Code / Cursor / VS Code Copilot | Agente de IA que escreve código, cria cenas e testa o jogo |

```
┌─────────────────────────────────────────────────────────────┐
│              STACK DE DESENVOLVIMENTO                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │   AGENTE    │◄──►│     MCP     │◄──►│   GODOT     │     │
│  │  (Claude)   │    │   SERVER    │    │    4.7      │     │
│  └─────────────┘    └─────────────┘    └─────────────┘     │
│                                                             │
│  O agente escreve     O MCP traduz      O Godot executa    │
│  código e comandos    comandos em       e renderiza o      │
│  em linguagem         chamadas à API    jogo em tempo      │
│  natural              do editor         real               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 13.2.2. Godot 4.7: Recursos Relevantes para o Projeto

O Godot 4.7 foi lançado em **18 de junho de 2026** e traz recursos importantes para o desenvolvimento assistido por IA e para a publicação multiplataforma.

| Recurso | Descrição | Impacto no Projeto |
| :--- | :--- | :--- |
| **Asset Store nativo** | Loja de assets integrada ao editor | Facilita a instalação de addons MCP e assets |
| **HDR output** | Suporte a alta faixa dinâmica | Melhora a qualidade visual das cartas |
| **Control offset transforms** | Transformações de UI sem quebrar o layout | Facilita animações de cartas |
| **GABE (Godot Android Build Environment)** | Exportação Gradle direto do Android | Permite exportar para Android sem PC |
| **Android Editor estável** | Editor completo no Android | Desenvolvimento mobile sem desktop |
| **AreaLight3D** | Novo nó para luzes retangulares | (Não aplicável — jogo 2D) |
| **Scene Paint Mode** | Pintura de cenas | (Não aplicável — jogo de cartas) |

### 13.2.3. MCP: Servidores Disponíveis

O ecossistema MCP para Godot está **maduro em 2026**. A pesquisa identificou múltiplos servidores com diferentes níveis de funcionalidade.

| Servidor MCP | Ferramentas | Godot | Destaques |
| :--- | :--- | :--- | :--- |
| **godot-editor-mcp** | 180 ferramentas, 29 categorias | 4.4+ | Servidor genérico, agnóstico de jogo, sempre ativo |
| **tugcantopaloglu/godot-mcp** | 157 ferramentas | 4.7 (testado) | Controle total do engine, GDScript e C#/.NET |
| **yanhuifair/godot-mcp** | 281 ferramentas, 26 categorias | 4.6/4.7 | Cobertura abrangente, file-based tools |
| **Godot MCP Pro** | 163 ferramentas | 4.7 | Integração com Claude Code, Cursor, Windsurf |
| **Better Godot MCP** | 17 ferramentas compostas | 4.x | Foco em cenas, nós, GDScript, shaders, animação |
| **Godot MCP Toolkit** | 112 ferramentas | 4.7 | Playtest control, ClassDB, 150+ operações |
| **godot-mcp-enhanced** | 33 ferramentas / 199 ações | 4.5-4.7 | Arquitetura de 3 camadas (headless + editor + game bridge) |

**Adotado:** **tugcantopaloglu/godot-mcp** (D-053; 157 ferramentas, testado com Godot 4.7), instalado em `~/.local/share/godot-mcp`, fora do repositório, no commit `88f0fbc` (D-131). O **yanhuifair/godot-mcp** (281 ferramentas) não foi adotado.

### 13.2.4. Agentes de IA: Claude Code como Principal

A pesquisa confirma que **Claude é "genuinamente um dos melhores modelos para escrever GDScript e C#**", com menos deriva entre Godot 3 e Godot 4 do que ferramentas de autocomplete.

| Agente | Integração MCP | Vantagens |
| :--- | :--- | :--- |
| **Claude Code** | Nativa | Melhor modelo para GDScript, terminal agêntico |
| **Cursor** | Nativa | IDE completa com Claude integrado |
| **VS Code Copilot** | Via MCP | Integração com editor popular |
| **Windsurf** | Via MCP | IDE agêntica |
| **Cline** | Via MCP | Agente open source |

**Boas práticas para GDScript com Claude:**

| Prática | Descrição |
| :--- | :--- |
| **Tipagem estática obrigatória** | Toda variável, parâmetro e retorno deve ser explicitamente tipado |
| **Composição sobre herança** | Limitar herança de cena a uma camada |
| **Sinais para comunicação** | Usar *signals* em vez de referências diretas entre nós |
| **Guia de estilo oficial** | Seguir as convenções de nomenclatura e ordenação do Godot |

### 13.2.5. Fluxo de Trabalho

```
┌─────────────────────────────────────────────────────────────┐
│              FLUXO DE TRABALHO COM GODOT + MCP              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. INSTALAÇÃO                                              │
│     └──▶ Godot 4.7.2 (download em godotengine.org)          │
│     └──▶ MCP Server (git clone + npm run build)             │
│     └──▶ Claude Code / Cursor / VS Code Copilot             │
│                                                             │
│  2. CONFIGURAÇÃO                                            │
│     └──▶ Configurar cliente MCP (.mcp.json)                 │
│     └──▶ Testar conexão (listar cenas do projeto)           │
│                                                             │
│  3. DESENVOLVIMENTO                                         │
│     └──▶ Agente cria cenas, UI, scripts GDScript            │
│     └──▶ Agente testa e itera (headless; MCP em cópia)      │
│     └──▶ Desenvolvedor revisa e valida                      │
│                                                             │
│  4. PUBLICAÇÃO                                              │
│     └──▶ Exportar para Web (HTML5/WASM): 1º preset          │
│     └──▶ Exportar para Android e Windows (planejado)        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Passo a passo da configuração:**

1. **Instalar Godot 4.7.2** — download em godotengine.org (D-130: `godot --version` = `4.7.2.stable.official.ed1daf0bf`; o 4.6 fica guardado para rollback).
2. **Instalar o MCP Server** (`tugcantopaloglu/godot-mcp`, D-053; não publicado no npm) — `git clone https://github.com/tugcantopaloglu/godot-mcp.git`, `npm install`, `npm run build` (fonte: https://github.com/tugcantopaloglu/godot-mcp#installation). Instalado em `~/.local/share/godot-mcp`, fora do repositório (D-131).
3. **Addon e plugin** — não são necessários: o servidor não exige addon (D-131). O projeto não tem pasta `addons/`.
4. **Configurar o cliente MCP** — `.mcp.json` na raiz do repositório (D-132). Os caminhos vêm de `GODOT_MCP_DIR` e `GODOT_PATH`, definidas no `~/.bashrc`, cada uma com um padrão absoluto (`${VAR:-…}`), porque o app desktop não lê o `~/.bashrc` (`.mcp.json:3-7`):
   ```json
   {
     "mcpServers": {
       "godot": {
         "command": "node",
         "args": ["${GODOT_MCP_DIR:-/caminho/do/godot-mcp}/build/index.js"],
         "env": { "GODOT_PATH": "${GODOT_PATH:-/caminho/do/godot}" }
       }
     }
   }
   ```
   Os padrões do arquivo real são caminhos absolutos do computador de quem instalou; aqui estão genéricos.
5. **Abrir Claude Code / Cursor / VS Code Copilot** — começar a promptar.
6. **Desenvolver** — agentes de IA criam cenas, scripts e assets em `jogo/`.
7. **Testar** — `jogo/tests/run_all.sh` numa cópia isolada (§13.2.7). O `run_project` do MCP só roda na cópia (regra abaixo).
8. **Exportar** — Web primeiro (D-188); Android e Windows **(planejado)**. Ver §13.9.5.

**Regra de isolamento do MCP (D-189, revisa D-133):** o `run_project` do servidor injeta o autoload `mcp_interaction_server.gd` e uma linha `[autoload]` no `project.godot` do projeto em que roda (`gestao/prompts/correcoes-p014.md:26`). Por isso:

- O MCP roda **só numa cópia isolada** de `jogo/` (por exemplo, `cp -r jogo <scratchpad>/pt`), nunca em `jogo/`.
- Uma checagem no pre-commit barra `mcp_interaction_server` no `jogo/project.godot` **(planejado — P-014 etapa 5; o local do hook, git ou Claude Code, está por definir: `gestao/prompts/correcoes-p014.md:73`)**. Hoje não há hook em `.git/hooks` nem em `.claude/settings.json`, e o `project.godot` está limpo (`jogo/project.godot:18-23`).
- A ideia anterior, autoload em `tools/mcp/` só em debug e fora dos presets de exportação (D-133), não existe no repositório e foi revista pela D-189.

### 13.2.6. Frameworks de Cartas para Godot

Existem frameworks prontos que aceleram o desenvolvimento de jogos de cartas em Godot.

| Framework | Destaques | Licença |
| :--- | :--- | :--- |
| **chun92/card-framework** | JSON Card Data, CardFactory, CardManager, sistema de eventos | MIT |
| **Card Game Skeleton** | Workflow visual para design de cartas, gerenciamento de decks, instanciação de cenas | MIT |
| **TRUCO** | Framework ECS multiplayer para jogos de cartas | MIT |
| **GD-Agentic-Skills** | Blueprint para card games com dados Resource-based | Open source |

**Recomendação:** **chun92/card-framework** — leve, flexível, com dados JSON e fábrica de cartas (D-055).

**No protótipo (P-005): não adotado.** A carta de arrastar é própria (`SwipeCard`, `jogo/scripts/ui/components/swipe_card.gd`), o projeto não tem `addons/` e os dados são `Dictionary` lidos de JSON, sem fábrica de cartas (§13.1.3). A D-055 segue registrada como recomendação; o relatório de sincronização a lista como ponto aberto (`docs/13.1_RELATORIO_SINCRONIZACAO.md`).

### 13.2.7. Testes e Isolamento

Os testes rodam só no Godot headless por enquanto (D-134); um runner de terceiros (GUT, gdUnit4) fica para depois (D-068, parcial).

| Item | Como é hoje |
| :--- | :--- |
| Runner | `jogo/tests/run_all.sh` roda `--import` e depois cada `tests/test_*.gd` com `godot --headless --path <projeto> -s res://tests/<arquivo>`. O teste falha se o código de saída for diferente de 0 ou se a saída tiver `SCRIPT ERROR` (`jogo/tests/run_all.sh:8-21`). |
| Uso | `GODOT=/caminho/do/godot jogo/tests/run_all.sh <cópia>`; sem argumento, testa a pasta que contém o script (`run_all.sh:2-7`). |
| Testes | 18 arquivos `jogo/tests/test_*.gd`: dados (`test_data`), regras do núcleo (`test_core_*`), telas (`test_shell`, `test_game_screen`, `test_impeachment_screen`, `test_final_screen`, `test_ui_kit`, `test_theme`, `test_settings`), partida inteira pela API (`test_playthrough`) e pela interface (`test_e2e`). |
| Capturas | `jogo/tests/shot_*.gd` geram imagens; precisam de tela (`xvfb-run`) e não fazem parte do `run_all.sh`. |
| Isolamento | Sempre numa cópia fora do projeto do PO (`.claude/rules/isolamento.md`) e com `XDG_DATA_HOME` próprio, para o `user://` do PO não ser tocado (`gestao/prompts/correcoes-p014.md:24-25`). Os testes de salvamento e de configurações gravam em arquivos temporários (`jogo/tests/test_core_save.gd:4`, `jogo/tests/test_settings.gd:3-5`). |

---

## 13.3. Estrutura de Dados

Os GDDs (`gdd/`) e os docs 04, 05, 12, 14 e 14A ainda escrevem os campos da carta com nomes em PT; os arquivos de dados usam chaves em EN (D-136). Os **valores** de enumeração também são EN (ids de modo, tipo, cor, medidor, técnica e reação, listados nas subseções). A tabela dá a equivalência.

| Elemento | Nome nos GDDs e docs (PT) | Chave nos dados (EN) |
| :--- | :--- | :--- |
| Carta | `titulo`, `modo`, `tipo`, `quem_fala`, `problema`, `opcao_a` / `opcao_b`, `aprendizado_id`, `pre_requisitos` / `ano_minimo`, `tecnica` | `title`, `mode`, `type`, `speaker`, `problem`, `option_a` / `option_b`, `learning_id`, `prerequisites` / `min_year`, `technique` |
| Opção | `texto`, `cor`, `eixo`, `efeitos`, `atores`, `eventos`, `consequencia`, `reacao`, `teste` | `text`, `color`, `axis`, `effects`, `actors`, `events`, `consequence`, `reaction`, `test` |
| Evento | `texto`, `atraso`, `efeitos` | `text`, `delay`, `effects` |
| Medidor | `nome`, `categoria`, `valor_inicial`, `final_zero`, `final_cem` | `name`, `category`, `initial`, `zero_ending`, `capture_ending` |
| Ator | `nome`, `categoria`, `arquetipo`, `oferece`, `cobra`, `cartas` (`ataque`, `exigencia`, `oferta`) | `name`, `category`, `archetype`, `offers`, `costs`, `cards` (`attack`, `demand`, `offer`) |
| Final | `nome`, `categoria`, `condicao`, `descricao`, `citacao`, `autor` | `name`, `category`, `conditions` (lista), sem `descricao` (§13.3.6), `quote`, `author` |

### 13.3.1. Estrutura de uma Carta

Cada carta é um **objeto JSON** em `jogo/data/cards.json` (D-138). Regras: `gdd/sistemas/05_cartas.md` §3. Uma carta inválida fica fora do baralho e o motivo vai para `GameData.errors` (`jogo/scripts/game_data.gd:4-5,59-65`); as regras de validação estão em `validate_card` (`game_data.gd:103-156`).

```json
{
  "id": "INST-001",
  "title": "Privatização da estatal",
  "mode": "congress",
  "type": "institutional",
  "speaker": "Congresso",
  "problem": "O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora.",
  "option_a": {
    "text": "Nomear relator adversário",
    "color": "red",
    "axis": [-1, 0, 0, 0],
    "effects": { "political_capital": -10, "sovereignty": 10 },
    "actors": {},
    "events": [],
    "consequence": "O relator é adversário. O projeto avança."
  },
  "option_b": {
    "text": "Aceitar as mudanças",
    "color": "orange",
    "axis": [1, 0, 0, 0],
    "effects": { "political_capital": 10, "sovereignty": -15, "treasury": 10, "integrity": -5 },
    "actors": {},
    "events": [],
    "consequence": "A lei passa. O povo paga a conta."
  },
  "learning_id": "APR-001",
  "prerequisites": { "min_year": 1 }
}
```

Exemplo ilustrativo, não é a carta de `cards.json`; a carta do protótipo, com evento e ator, está em §13.5.2.

**Campos:**

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id` | String | Único; o prefixo acompanha o `type`: `INST-xxx`, `THEM-xxx`, `ATOR-xxx` (`game_data.gd:15`). As 5 cartas da cena de impeachment usam `IMP-n` (§13.3.8) |
| `title` | String | Até 5 palavras (`game_data.gd:113-114`) |
| `mode` | String | Id de um dos 10 modos de `modes.json`: `congress`, `budget`, `curriculum_media`, `geopolitics`, `prison_police`, `amendments`, `caucuses`, `impeachment`, `judiciary`, `influencer`. O nome exibido (PT-BR) fica no arquivo de modos |
| `type` | String | `institutional`, `thematic`, `actor` ou `impeachment` (fora das 340, com `test` por opção — D-101) (`game_data.gd:14`) |
| `speaker` | String | Quem apresenta o problema (D-164; nos GDDs, `quem_fala`): um id de ator `ACT-xxx` existente ou o nome da instituição do modo. Obrigatório (`game_data.gd:115-120`). O validador aceita `quem_fala` como sinônimo (`game_data.gd:82,116`) |
| `problem` | String | Até 2 linhas (limite ainda não validado no código) |
| `option_a` / `option_b` | Objeto | Opções; o jogo sorteia o lado a cada exibição (D-084, D-099) |
| `learning_id` | String | `APR-xxx`, a Carta de Aprendizado em `learning.json` (nos GDDs, `aprendizado_id`; texto-fonte no doc 18, D-090). Nas institucionais, `APR-` + o número da carta (`game_data.gd:121-125`). Sem Carta de Aprendizado válida, a carta fica fora do baralho (D-102; `jogo/scripts/core/draw_rules.gd:16-17`) |
| `prerequisites` | Objeto | Só `min_year` (1-4, padrão 1 — D-117) (`game_data.gd:126-128`) |
| `technique` | String | Só no modo Influenciador: uma de 6 técnicas (D-119): `demoralization`, `moral_panic`, `deepfake`, `ai_farm`, `doom_cache`, `accusatory_didacticism` (`game_data.gd:17,130-134`) |

### 13.3.2. Estrutura de uma Opção

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `text` | String | Frase curta, até 25 caracteres; letra acentuada conta 1 (D-177) (`game_data.gd:12,164-165`) |
| `color` | String | Uma das 7 cores: `red`, `blue`, `green`, `yellow`, `purple`, `orange`, `black` (`game_data.gd:16`); cores distintas nas duas opções (D-092, D-103) (`game_data.gd:139-140`) |
| `axis` | Array[4] | [economy, diplomacy, society, state], inteiros de −2 a +2 (`gdd/sistemas/04_eixo.md`; `game_data.gd:170-172`) |
| `effects` | Objeto | Campo único com sinal, `{ "<id do medidor>": ±n }`: 2-4 medidores, ±5 a ±30, múltiplos de 5, ≥ 1 negativo (D-098; única exceção, Boa Vontade, D-108: uma opção da carta de oferta de um ator). As chaves são ids de medidor (§13.3.3) (`game_data.gd:143-150,173-183,215`) |
| `actors` | Objeto | `{ "ACT-xxx": ±1 }`, 0-3 atores (D-106) (`game_data.gd:184-191`) |
| `events` | Array | 0 ou 1 evento (D-111): `text`, `delay` (1-2), `effects` (1-3 medidores, ±5 a ±20 — D-125) (`game_data.gd:192-204`) |
| `reaction` | String | Só no modo Influenciador: `accept`, `refuse` ou `investigate`, distintas nas duas opções (D-120); `accept` perde `integrity` ou `awareness` (`game_data.gd:18,205-212`) |
| `test` | Objeto | Só no tipo `impeachment`: `{ "meter": id, "op": operador, "value": n }`, com operador `<`, `>`, `<=` ou `>=` (`game_data.gd:11,213-214,361`; `gdd/sistemas/03_impeachment.md`) |
| `consequence` | String | Frase curta mostrada após a escolha; obrigatória (`game_data.gd:166-167`) |

### 13.3.3. Estrutura de um Medidor

```json
{
  "id": "dignity",
  "name": "Dignidade",
  "category": "social",
  "initial": 45,
  "zero_ending": "END-001",
  "capture_ending": null
}
```

Trecho de `jogo/data/meters.json:2-9`. Ids dos 8 medidores: `dignity` (Dignidade), `awareness` (Consciência), `sovereignty` (Soberania), `security` (Segurança), `integrity` (Integridade), `treasury` (Caixa), `political_capital` (Capital Político) e `legitimacy` (Legitimidade). A ordem do array é a ordem de desempate (`game_data.gd:25`).

**Campos:**

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id` | String | Id EN, usado em `effects`, nos testes e no estado da partida |
| `name` | String | Nome exibido (PT-BR) |
| `category` | String | `social` (Indicador Social) ou `power` (Recurso de Poder) |
| `initial` | Int | Valor no início do jogo, de 0 a 100; os 8 somam 375 (D-141) |
| `zero_ending` | String ou null | Id do final se chegar a 0. `political_capital` tem `null`: o 0 abre o impeachment (D-095) |
| `capture_ending` | String ou null | Final de Captura, com valor ≥ 95 no fim do Ano 4 (D-096). Só `security`, `political_capital` e `legitimacy` têm |
| — | — | Sem campos de limiar: a cor e o significado vêm da faixa do valor (0-20 crítico, 21-40 baixo, 41-60 médio, 61-80, 81-100; doc 14 §14.11.3). Os únicos limiares com efeito são os 2 do fechamento do turno (`gdd/sistemas/01_medidores.md` §3.4) |

**Não estão no arquivo, por desenho:** o valor atual (vive no estado da partida, `RunState.meters`, `jogo/scripts/core/run_state.gd:16`); o mínimo 0 e o máximo 100 (constantes `MIN_VALUE` e `MAX_VALUE`, `jogo/scripts/core/meter_rules.gd:10-11`); a cor (vem da faixa do valor, doc 14 §14.11.3); o ícone (derivado do id: `res://assets/icons/meter_<id>.svg`, `jogo/scripts/ui/components/meter_icon.gd:195`).

### 13.3.4. Estrutura de um Ator

```json
{
  "id": "ACT-001",
  "name": "Latifundiários",
  "category": "capital",
  "archetype": "Senhor de engenho, barão do café, dono de terras",
  "offers": ["political_capital"],
  "costs": ["sovereignty"],
  "cards": { "attack": "ATOR-001", "demand": "ATOR-002", "offer": "ATOR-003" }
}
```

Trecho de `jogo/data/actors.json:2-18`.

**Campos:** `id` (`ACT-001` a `ACT-024`, D-104); `name`, `category` e `archetype` (doc 11); `category` é `capital`, `state`, `civil_society` ou `media_tech` (`game_data.gd:19`); `offers` / `costs` (nos GDDs, `oferece` / `cobra`: ids de medidor, do guia de escrita); `cards` (uma por função: `attack`, `demand`, `offer`; `{}` se o ator não tem carta própria: hoje só `ACT-001` e `ACT-010` têm, e no baralho final 2 atores ficam sem `offer` — D-105) (`game_data.gd:20,248-250`). Sem `preco` nem eventos próprios (D-107, D-109). A satisfação (começa em 50, `jogo/data/balance.json:118`) fica no estado da partida (`RunState.actors`). Regras: `gdd/sistemas/07_atores.md`.

### 13.3.5. Estado da Partida

O que é salvo automaticamente (D-121). Regras: `gdd/sistemas/10_estado_partida.md` §3.4. Implementação: `RunState` (`jogo/scripts/core/run_state.gd`), serializado por `to_dict()` (`run_state.gd:63-97`) em `user://save.json` (`jogo/scripts/autoload/save_manager.gd:6`).

| Campos no salvamento | Conteúdo | Sistema dono |
| :--- | :--- | :--- |
| `format_version` | Versão do formato, hoje 1 (`run_state.gd:7`); a versão do save (D-065) segue pendente | 10 |
| `seed`, `rng_state` | Semente e estado do sorteador, gravados como texto porque o JSON não guarda inteiros de 64 bits (`run_state.gd:66-67,152-159`); a partida retomada segue a mesma sequência | 10, 06 |
| `state`, `year` | Estado atual (§13.6.6) e ano (1-4) | 10 |
| `meters`, `emergency_used`, `emergency_pending`, `closing_changes` | 8 medidores (id → 0-100); medidores que já tiveram emergência; emergências à espera; mudanças do último fechamento | 01, 06 |
| `actors` | Satisfação dos 24 atores (`ACT-xxx` → 0-100) | 07 |
| `said_sum`, `said_count`, `governed_sum`, `governed_count` | Traçados "o que você disse" e "como você governou": soma e contagem por eixo | 04 |
| `played`, `turn_cards`, `turn_mandatory`, `current_card` | Cartas jogadas; cartas do turno; obrigatórias a mostrar; carta na tela (id, lado de `option_a`, motivo) | 06, 05 |
| `last_result`, `readonly` | Resultado da última carta (consequência, mudanças, Aprendizado); ao reabrir, volta só para leitura, sem repetir efeitos | 05, 10 |
| `event_queue`, `event_seq`, `epilogue`, `turn_events`, `event_cursor`, `current_event` | Fila de eventos, epílogo e o evento na tela | 08 |
| `capital_streak`, `impeachment` | Contagem do gatilho alternativo; cena (fase, apoio, gatilhos, onde voltar) | 03 |
| `calibration_index`, `calibration_side_a` | Pergunta atual da calibração e o lado sorteado | 01, 10 |
| `ending`, `save_failed_notified` | Final (id, motivo, medidor); se o aviso de falha ao gravar já saiu | 02, 10 |

Uma única partida salva, apagada na tela final ou ao abandonar; entre partidas, só as configurações (D-123; §13.3.7). O `Game` grava depois de cada ação que muda a partida (`jogo/scripts/autoload/game.gd:161-179`). Um salvamento ilegível, que não é JSON ou tem outro `format_version` é apagado, com o aviso "Não foi possível continuar o mandato" (`save_manager.gd:36-53`, `game.gd:37-54`).

A gravação é direta no arquivo, **não atômica** (`save_manager.gd:21-25`). Gravar em `save.json.tmp` e renomear é correção do P-014 etapa 5 (V-008) **(planejado**; `gestao/prompts/correcoes-p014.md:70`**)**. No Web, a persistência de `user://` ainda não foi verificada (RT-12, `gestao/estado.md:155`) `[não verificado]`.

### 13.3.6. Estrutura de um Final

```json
{
  "id": "END-001",
  "name": "Barbárie",
  "category": "catastrophe",
  "trigger": "instant",
  "conditions": [
    { "meter": "dignity", "op": "==", "value": 0 }
  ],
  "quote": "Socialismo ou barbárie.",
  "author": "Rosa Luxemburgo (Brochura de Junius, 1915)",
  "source": "https://www.marxists.org/francais/luxembur/junius/"
}
```

Trecho de `jogo/data/endings.json:2-17`.

**Campos:**

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id` | String | `END-001` a `END-028` |
| `name` | String | Nome do final |
| `category` | String | `catastrophe`, `extermination`, `democracy_loss`, `capture`, `strengthening`, `care_sovereignty`, `neutral` ou `exit` (Catástrofe, Extermínio e Exploração, Perda da Democracia, Captura, Fortalecimento, Cuidado e Soberania, Neutro e Saída — D-127) (`game_data.gd:21`; `jogo/scripts/core/ending_rules.gd:8-17`) |
| `trigger` | String | Quando o final é checado: `instant` (medidor em 0, na hora), `impeachment` (condenação), `end_of_term` (fim do Ano 4) ou `exit` (Renúncia) (`game_data.gd:22`) |
| `conditions` | Array | Lista de `{ meter, op, value }`, todas verdadeiras; `op` é `==`, `<`, `>` ou `>=` (`game_data.gd:23`). Vazia em `END-007` (condenação), `END-027` (Mandato Comum, o neutro de fim de mandato) e `END-028` (Renúncia). Nas Capturas, o `value` do `>=` vem de `balance.json` (`capture_at_or_above`, 95), qualquer que seja o do arquivo (`game_data.gd:276-285`) |
| `quote` | String | Citação de impacto; falta nos finais sem fonte verificada, `END-005` e `END-012` (D-091) |
| `author` | String | Autor e obra ou data da citação |
| `source` | String | Link da fonte (D-091) |

Não existem nos dados `descricao`, `cor` e `icone`. Cor e ícone não são usados: a tela final mostra só o nome da categoria como etiqueta (`CATEGORY_LABELS`, `jogo/scripts/core/ending_rules.gd:8-17`). A descrição curta que o doc 14 §14.09 pede aparece como o marcador "[descrição curta do final — a definir]" (`jogo/scripts/core/game_flow.gd:28,459`), ponto aberto no relatório de sincronização. Regras de prioridade no fim do mandato: `gdd/sistemas/02_finais.md` (§13.4.5).

### 13.3.7. Configurações do Jogador

As configurações ficam em `user://settings.cfg` (`ConfigFile`, seção `settings`), fora do salvamento da partida (`jogo/scripts/autoload/settings.gd:8-9`). Valor inválido volta ao padrão (`settings.gd:86-99`); cada mudança vale na hora, pelo sinal `changed` (`settings.gd:6,37-46`).

| Chave | Tipo | Padrão | Faixa |
| :--- | :--- | :--- | :--- |
| `text_step` | Int | 18 | 16, 18, 20 ou 24 px (D-165); 36 px só como base de teste (D-169) (`settings.gd:10-11`) |
| `reduce_motion` | Bool | false | — |
| `high_contrast` | Bool | false | — |
| `drag_limit` | Float | 0,40 | De 0,25 a 0,40 da largura da carta (D-146, D-158; `Tokens.DRAG_LIMIT_MIN` e `DRAG_LIMIT_DEFAULT`, `jogo/scripts/ui/tokens.gd:77-78`; `settings.gd:12-19`) |
| `tutorial_seen` | Bool | false | — |
| `audio` | Dicionário | `{}` | `[a definir]`: os controles de áudio não estão definidos nos docs |

### 13.3.8. Outros Esquemas

| Arquivo | Estrutura | Validação |
| :--- | :--- | :--- |
| `modes.json` | Array de 10 modos: `id` (§13.3.1), `name` (nome exibido), `main_meters` e `first_card`. `main_meters` e `first_card` são só informativos: nenhum script os lê | O modo da carta precisa existir (`game_data.gd:47,111-112`) |
| `calibration.json` | Array de 6 perguntas (`game_data.gd:9`): `id` (`CAL-1`, ...), `question`, `option_a` e `option_b`, cada uma com `text`, `effects` (cada valor ±5, `balance.json:117`) e `axis` (como na opção, §13.3.2). Sem cor partidária (D-166) | `game_data.gd:289-310` |
| `learning.json` | Array de Cartas de Aprendizado: `id` (`APR-xxx`; `APR-IMP-n` na cena), os blocos do doc 18 (`lived`, `concept`, `data`, `source` com `label` e `url`, `impact`) e `fictitious` (true só nos dados do protótipo, D-139). Carta real exige `source.url` http(s) (D-091, V-015) | `game_data.gd:313-339` |
| `impeachment.json` | Array das 5 cartas da cena, uma por fase: como a carta (§13.3.1), com `type` `impeachment`, `phase` (1-5, única), `test` em cada opção e sem eventos. Ids `IMP-1` a `IMP-5`, a confirmar na Onda 0 do P-015 | `game_data.gd:342-374` |
| `balance.json` | Objeto de parâmetros, abaixo | Lido com `balance.get(chave, padrão)` |

**Parâmetros de `jogo/data/balance.json`:**

| Chave | Conteúdo | Sistema |
| :--- | :--- | :--- |
| `year_multipliers` | Multiplicador por ano: 0,25 · 0,75 · 1,0 · 1,5 | 01 |
| `relations` | 10 relações entre medidores: `source`, `op`, `value`, `effects` (§13.4.4) | 01 |
| `awareness_loss_doubling` | `integrity_below` 30 e `factor` 2 | 01 |
| `thresholds` | Os 2 limiares do fechamento (§13.4.4) | 01 |
| `balance_bonus` | `all_above` 45 e `amount` 3 | 01 |
| `emergency_at_or_below`, `linked_card_below` | 10 e 30 | 01, 06 |
| `calibration_step` | 5 | 01 |
| `actor_initial`, `actor_step`, `actor_levels` | 50, 10 e os 5 níveis (`id`, `max`, `role`) | 07 |
| `cards_per_turn`, `max_mandatory_per_turn` | 7 e 3 | 06 |
| `capture_at_or_above`, `capture_warning_at_or_above` | 95 e 81 | 02 |
| `reveal_high_above`, `reveal_low_below` | 60 e 40 (D-175) | 04 |

---

## 13.4. Sistemas

### 13.4.1. Sistema de Sorteio

Regras e fórmulas: `gdd/sistemas/06_sorteio.md`. 7 cartas por turno, sem repetição; até 3 obrigatórias (emergência → ator Furioso → medidor < 30); vagas restantes com peso igual, 1 por modo; sorteio uma a uma na exibição.

### 13.4.2. Sistema de Satisfação dos Atores

Regras e fórmulas: `gdd/sistemas/07_atores.md`. `s(a) ← clamp(s(a) + 10 × d(o,a), 0, 100)`, com `d` vindo do campo `atores` da opção; o nível define a função de carta sorteável.

### 13.4.3. Sistema de Eixo Ideológico

O eixo ideológico é calculado a partir das escolhas do jogador, usando o modelo **9axes adaptado**.

**Eixos:**

| Eixo | Extremo A | Extremo B | Pontuação |
| :--- | :--- | :--- | :--- |
| **Economia** | Coletivismo | Mercado | -10 a +10 |
| **Diplomacia** | Nacionalismo | Globalismo | -10 a +10 |
| **Sociedade** | Conservadorismo | Progressismo | -10 a +10 |
| **Estado** | Autoritarismo | Liberdade | -10 a +10 |

**Algoritmo:** `gdd/sistemas/04_eixo.md` §4 (média dos valores ≠ 0 × 5); código em `jogo/scripts/core/axis_rules.gd:49-70`. Regra fixa: os pontos de cada eixo vêm dos dados da opção escolhida, **nunca do lado do arraste** (D-084; o lado é sorteado). O algoritmo antigo, que pontuava por "esquerda/direita", foi removido no P-010.

**Revelação Final:**

| Padrão | Revelação |
| :--- | :--- |
| **Dignidade, Consciência e Soberania altos** | *"Seu governo priorizou a dignidade, a educação e a soberania."* |
| **Segurança, Capital Político e Caixa altos** | *"Seu governo priorizou a ordem, a estabilidade e a economia."* |
| **Equilíbrio entre todos** | *"Seu governo buscou equilíbrio entre diferentes valores."* |
| **Integridade e Consciência baixos** | *"Seu governo deixou a verdade e a educação em segundo plano."* |
| **Dignidade e Soberania baixos** | *"Seu governo deixou os direitos do povo e a soberania em segundo plano."* |
| **Nenhum dos anteriores** (D-175) | *"Nenhum padrão resume seu governo. Os números contam o resto."* |

Limiares (D-175): "alto" é valor **> 60** e "baixo" é valor **< 40**, lidos de `balance.json` (`reveal_high_above` e `reveal_low_below`, `jogo/data/balance.json:151-152`); "Equilíbrio" é ter os 8 medidores entre 40 e 60. Vale o primeiro padrão que casar, na ordem da tabela; se nenhum casar, vale o 6º texto, "sem padrão" (`jogo/scripts/core/axis_rules.gd:35-47,96-111`). Os textos são os de `gdd/GDD.md:534-539`, revistos pelo PSI (achado P-07 da validação; provisórios, DP-009).

### 13.4.4. Sistema de Relações entre Medidores

| Medidor que Afeta | Medidor Afetado | Tipo de Relação | Efeito |
| :--- | :--- | :--- | :--- |
| **Dignidade** | Consciência | Cascata | Quando Dignidade < 30, Consciência -5 por turno. Quando Dignidade > 70, Consciência +3 por turno. |
| **Consciência** | Legitimidade | Assimétrica | Quando Consciência > 60, Legitimidade -5 por turno. Quando Consciência < 30, Legitimidade +5 por turno. |
| **Soberania** | Caixa | Imediata | Quando Soberania < 30, Caixa +10 no turno, mas Dignidade -5. |
| **Segurança** | Dignidade | Condicional | Quando Segurança < 30, Dignidade -10. |
| **Integridade** | Consciência | Multiplicadora | Quando Integridade < 30, efeitos negativos em Consciência são dobrados. |
| **Caixa** | Legitimidade | Invertida | Quando Caixa > 70, Legitimidade -3 por turno. Quando Caixa < 30, Legitimidade -5 por turno. |
| **Capital Político** | Caixa | Direta | Quando Capital Político < 30, Caixa -10. |
| **Legitimidade** | Capital Político | Direta | Quando Legitimidade < 30, Capital Político -10. |

**Cadeias de Consequências:**

| Cadeia | Descrição |
| :--- | :--- |
| **Cadeia da Barbárie** | Dignidade cai → Consciência cai → Legitimidade sobe → Capital Político sobe → Soberania cai. |
| **Cadeia da Revolta** | Dignidade cai → Consciência sobe → Legitimidade cai → Capital Político cai → abre a cena de impeachment (D-095). |
| **Cadeia da Dependência** | Soberania cai → Caixa sobe → Dignidade cai → Consciência cai → Integridade cai → Desintegração. |
| **Cadeia da Resistência** | Consciência sobe → Integridade sobe → Dignidade sobe → Soberania sobe → Legitimidade sobe → República Soberana. |

**Efeitos Não-Lineares (Limiares):** só 2 vigentes, aplicados no fechamento do turno.

| Limiar | Efeito |
| :--- | :--- |
| **Integridade < 20** | −1 em cada um dos outros 7 medidores |
| **Legitimidade > 90** | Consciência −10 |

**Bônus por equilíbrio:** no fechamento do turno, se todos os 8 medidores estão > 45, todos ganham +3 (1× por turno).

Os valores desta seção estão em `jogo/data/balance.json` (`relations` em `balance.json:8-90`, `awareness_loss_doubling` em `balance.json:91-94`, `thresholds` em `balance.json:95-110`, `balance_bonus` em `balance.json:111-114`) e são aplicados no fechamento do turno por `MeterRules.close_turn` (`jogo/scripts/core/meter_rules.gd:57-80`).

Detalhes: `gdd/sistemas/01_medidores.md`.

### 13.4.5. Mapa dos Sistemas no Código

| Sistema (GDD) | Código (`jogo/scripts/core/`) | Dados (`jogo/data/`) |
| :--- | :--- | :--- |
| 01 Medidores | `meter_rules.gd` | `meters.json`, `balance.json`, `calibration.json` |
| 02 Finais | `ending_rules.gd`: no fim do mandato, vale a categoria de maior prioridade e, dentro dela, o final mais específico (D-174); aviso de Captura | `endings.json`, `balance.json` |
| 03 Impeachment | `impeachment_rules.gd` (gatilhos, placares) e a cena em `game_flow.gd` | `impeachment.json` |
| 04 Eixo | `axis_rules.gd` | `balance.json` (só a revelação); nomes e textos dos eixos são constantes no código |
| 05 Cartas | `card_rules.gd` (lado e cor) | `cards.json`, `learning.json` |
| 06 Sorteio | `draw_rules.gd` | `balance.json` |
| 07 Atores | `actor_rules.gd` | `actors.json`, `balance.json` |
| 08 Eventos | `event_rules.gd` | Dentro das opções de `cards.json` |
| 09 Desinformação | `disinfo_rules.gd` (nome da técnica) | `cards.json` (`technique`, `reaction`) |
| 10 Estado da partida | `game_flow.gd` (máquina de estados) e `run_state.gd` (estado); o arquivo é de `autoload/save_manager.gd` | — |

---

## 13.5. Formato de Armazenamento

### 13.5.1. Arquivos de Dados

Em `jogo/data/` (D-138):

| Arquivo | Formato | Conteúdo |
| :--- | :--- | :--- |
| `cards.json` | JSON | Todas as 340 cartas (hoje 40 fictícias, D-135 e D-139; as 340 entram no P-015) |
| `meters.json` | JSON | Os 8 medidores (sub-medidores removidos, D-094) |
| `actors.json` | JSON | Os 24 atores |
| `endings.json` | JSON | Os 28 finais (D-096, D-122) |
| `calibration.json` | JSON | As 6 perguntas da calibração inicial |
| `modes.json` | JSON | Os 10 modos (id e nome exibido) |
| `learning.json` | JSON | As Cartas de Aprendizado (hoje 45 fictícias; texto real: doc 18, D-090) |
| `impeachment.json` | JSON | As 5 cartas da cena de impeachment |
| `balance.json` | JSON | Parâmetros de balanceamento (§13.3.8) |
| `eixo_ideologico.json` | JSON | **(planejado)** Configuração do eixo 9axes; hoje são constantes em `jogo/scripts/core/axis_rules.gd:7-30` |
| `dialogos.json` | JSON | **(planejado)** Textos de interface (botões, mensagens); hoje ficam nas cenas e scripts, e as chaves de i18n seguem pendentes (D-066) |

Fora de `jogo/data/`, em `user://`: `save.json` (§13.3.5) e `settings.cfg` (§13.3.7).

**Nota (D-138):** o Godot suporta nativamente **Resources** (`.tres`) para dados estruturados, que são mais performáticos que JSON para leitura em tempo de execução. A D-138 manteve **JSON para todos os dados**, de jogo e de configuração. Os arquivos são lidos por `JSON.new().parse` e validados na carga; a raiz precisa ser do tipo esperado (array ou objeto), senão o arquivo é recusado (`jogo/scripts/game_data.gd:377-390`).

### 13.5.2. Exemplo de `cards.json`

```json
[
  {
    "id": "INST-001",
    "title": "Congresso fictício 1",
    "mode": "congress",
    "type": "institutional",
    "speaker": "Congresso",
    "problem": "[Fictício] Problema da carta INST-001.",
    "option_a": {
      "text": "[Fictício] Opção A",
      "color": "green",
      "axis": [2, -2, -1, 2],
      "effects": { "political_capital": 25, "legitimacy": 10, "integrity": -25, "treasury": -5 },
      "actors": { "ACT-004": 1 },
      "events": [
        {
          "text": "[Fictício] Evento encadeado.",
          "delay": 2,
          "effects": { "treasury": 15, "awareness": 20, "security": -15 }
        }
      ],
      "consequence": "[Fictício] Consequência da opção A."
    },
    "option_b": {
      "text": "[Fictício] Opção B",
      "color": "purple",
      "axis": [-2, 2, 2, 0],
      "effects": { "legitimacy": -5, "awareness": 15, "treasury": 20 },
      "actors": { "ACT-019": 1 },
      "events": [],
      "consequence": "[Fictício] Consequência da opção B."
    },
    "learning_id": "APR-001",
    "prerequisites": { "min_year": 1 }
  }
]
```

Trecho de `jogo/data/cards.json:1-62`, reformatado (carta fictícia do protótipo, D-139). A raiz do arquivo é um **array** de cartas, não um objeto com a chave `cartas` (`game_data.gd:58,387-389`).

Eventos ficam dentro das opções (D-111); não há `eventos.json`.

---

## 13.6. Diagrama de Fluxo do Jogo

### 13.6.1. Fluxo Geral

```
┌─────────────────────────────────────────────────────────────┐
│                     FLUXO GERAL DO JOGO                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  TELA INICIAL                                               │
│  └──▶ TUTORIAL (só na 1ª vez)                               │
│       └──▶ CALIBRAÇÃO (6 perguntas)                         │
│            └──▶ TURNO 1 (Ano 1 - Lua de Mel)                │
│                 └──▶ TURNO 2 (Ano 2 - Realidade Bate)       │
│                      └──▶ TURNO 3 (Ano 3 - Crise)           │
│                           └──▶ TURNO 4 (Ano 4 - Desfecho)   │
│                                └──▶ FINAL                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

O tutorial só aparece na primeira partida (`Settings.tutorial_seen`, `jogo/scripts/ui/screens/title_screen.gd:70`). Cada ano abre com o cartão do ano (§13.6.6).

### 13.6.2. Fluxo de um Turno

```
┌─────────────────────────────────────────────────────────────┐
│                      FLUXO DE UM TURNO                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ABERTURA DO TURNO                                          │
│  └──▶ CARTÃO DO ANO → EVENTOS → OBRIGATÓRIAS → 7 CARTAS     │
│       └──▶ CARTA 1 (Problema + Escolha + Consequência)      │
│            └──▶ CARTA DE APRENDIZADO 1                      │
│                 └──▶ CARTA 2                                │
│                      └──▶ CARTA DE APRENDIZADO 2            │
│                           └──▶ ...                          │
│                                └──▶ FECHAMENTO DO TURNO     │
│                                     └──▶ VERIFICAÇÃO        │
│                                          (medidor zerado?)  │
│                                          (impeachment?)     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

O evento encadeado não é checado no fechamento: dispara no início do turno de destino, antes da primeira carta (§13.6.5, D-112; `jogo/scripts/core/game_flow.gd:155-165`). OBRIGATÓRIAS e FECHAMENTO são passos instantâneos, sem tela própria (`game_flow.gd:7-9`).

### 13.6.3. Fluxo de uma Carta

```
┌─────────────────────────────────────────────────────────────┐
│                      FLUXO DE UMA CARTA                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  EXIBIR PROBLEMA                                            │
│  └──▶ JOGADOR ARRASTA (lado de cada opção sorteado)         │
│       └──▶ APLICAR EFEITOS (medidores, eixo, atores)        │
│            └──▶ AGENDAR EVENTO DA OPÇÃO                     │
│                 └──▶ EXIBIR CONSEQUÊNCIA                    │
│                      └──▶ EXIBIR CARTA DE APRENDIZADO       │
│                           └──▶ GATILHO ALTERNATIVO?         │
│                                └──▶ PRÓXIMA CARTA           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

A escolha só agenda o evento da opção (`game_flow.gd:262`); ele dispara no início do turno de destino (§13.6.5), não depois do Aprendizado (D-112). O gatilho alternativo do impeachment (3 opções seguidas que tiram Capital Político) é checado depois do Aprendizado (D-179; `game_flow.gd:306-315`). Medidor a 0, exceto Capital Político, leva direto ao final, sem consequência nem Aprendizado (`game_flow.gd:245-250`); Capital Político a 0 abre a cena de impeachment (`game_flow.gd:251-260`).

### 13.6.4. Fluxo do Impeachment

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUXO DO IMPEACHMENT                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  GATILHO (1 dos 4; a cena ocorre 1× por partida)           │
│  └──▶ Consciência < 15 E Integridade < 15?                 │
│       └──▶ SIM: CONDENAÇÃO AUTOMÁTICA                      │
│  └──▶ CARTA 1 (O Pedido)                                   │
│       └──▶ CARTA 2 (A Comissão)                            │
│            └──▶ CARTA 3 (A Votação)                        │
│                 └──▶ CARTA 4 (O Julgamento)                │
│                      └──▶ CARTA 5 (O Desfecho)             │
│                           └──▶ ABSOLVIÇÃO ou CONDENAÇÃO    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

| Gatilho | Condição | Desde |
| :--- | :--- | :--- |
| Principal | Legitimidade < 20 E Capital Político < 20 | Ano 2 |
| Crise | Integridade < 20 E Consciência < 20 | Ano 2 |
| Alternativo | 3 opções seguidas com efeito negativo em Capital Político, checado após o Aprendizado da 3ª carta; a contagem zera ao abrir o Ano 2 (D-179) | Ano 2 |
| Capital em 0 | Capital Político = 0 (D-095) | Ano 1 |

- Cada opção das fases 1-4 tem um teste de medidor; teste vencido = +1 apoio.
- Desfecho: absolvição se apoio ≥ 2 (≥ 3 com Capital em 0) e o teste da opção escolhida passar; senão, condenação.
- Condenação automática se a cena começa com Consciência < 15 E Integridade < 15.
- A cena ocorre 1× por partida.

Detalhes: `gdd/sistemas/03_impeachment.md`. Código: gatilhos em `jogo/scripts/core/impeachment_rules.gd:24-39`, desfecho em `impeachment_rules.gd:54-57` e a cena em `game_flow.gd:318-435`.

### 13.6.5. Fluxo dos Eventos Encadeados

```
┌─────────────────────────────────────────────────────────────┐
│                FLUXO DOS EVENTOS ENCADEADOS                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  DECISÃO (Turno X)                                          │
│  └──▶ AGENDAR EVENTO DA OPÇÃO (Turno X + atraso 1-2)       │
│       └──▶ INÍCIO DO TURNO DE DESTINO (> 4 → EPÍLOGO):     │
│            └──▶ EXIBIR AVISO ESPECIAL                      │
│                 └──▶ APLICAR EFEITOS                       │
│                      └──▶ CONTINUAR JOGO                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 13.6.6. Estados da Partida e Telas

A máquina de estados é `GameFlow` (`jogo/scripts/core/game_flow.gd:11-12`); o shell `AppMain` troca a tela conforme o estado (`jogo/scripts/ui/main.gd:30-40`). Os nomes do GDD 10 (`INICIO`, `CALIBRACAO`, ...) são os conceitos; no código os estados são EN.

| Estado (`GameFlow`) | Tela (`AppMain`) | Estado no GDD 10 | O que acontece |
| :--- | :--- | :--- | :--- |
| `start` | `title` | `INICIO` | Título: "Continuar" ou "Novo mandato" |
| `calibration` | `calibration` | `CALIBRACAO` | 6 perguntas |
| `year_intro` | `game` | (abertura do turno) | Cartão do ano; no Ano 4, aviso de Captura |
| `events` | `game` | `EVENTOS` | Eventos encadeados do turno |
| `card` | `game` | `OBRIGATORIAS` e `CARTA` | Carta sorteada, com o lado sorteado |
| `consequence` | `game` | `CARTA` | Consequência da escolha |
| `learning` | `game` | `CARTA` | Carta de Aprendizado |
| `impeachment` | `impeachment` | `IMPEACHMENT` | Cena de 5 fases |
| `final` | `final` | `FINAL` | Tela final |

Todos os estados, exceto `start` e `final`, podem ser retomados (`RESUMABLE`, `game_flow.gd:13-14`). Telas fora da máquina de estados: `tutorial`, `settings` e `about`; o shell tem ainda 3 camadas sobre a tela: aviso (*toast*), modal de confirmação e menu de pausa (`main.gd:9`). As telas estão em `main.gd:18-27`.

---

## 13.7. Estrutura de Pastas do Projeto

### 13.7.1. Repositório

```
o-planalto/
│
├── jogo/                   # Projeto Godot 4.7.2 (D-137): ver 13.7.2
│
├── docs/                   # Documentação (fonte do site, GitHub Pages)
│   ├── 00_INDICE_GERAL.md
│   ├── 01_CONTEXTO_E_MOTIVACAO.md
│   ├── ...
│   ├── 13_ARQUITETURA_TECNICA.md
│   ├── 13.1_RELATORIO_SINCRONIZACAO.md
│   └── ...                 # 14 a 18 (e 14A)
│
├── gdd/                    # GDD mestre e os 10 sistemas (também no site, D-143)
├── gestao/                 # Docs vivos (D-071)
├── site/                   # Site público (Astro Starlight, D-077)
├── .claude/                # Agentes, comandos e regras do Claude Code
├── .github/workflows/      # Deploy do site
├── .mcp.json               # Cliente MCP do Godot (D-132)
├── CLAUDE.md
└── README.md
```

### 13.7.2. Projeto Godot (`jogo/`)

```
jogo/
├── project.godot           # Godot 4.7, GL Compatibility, 390×844 (D-170)
├── data/                   # JSON do jogo (13.5)
│   ├── cards.json
│   ├── meters.json
│   ├── actors.json
│   ├── endings.json
│   ├── modes.json
│   ├── calibration.json
│   ├── learning.json
│   ├── impeachment.json
│   └── balance.json
├── scripts/
│   ├── game_data.gd        # Autoload GameData: carga e validação dos JSON
│   ├── autoload/           # game.gd, save_manager.gd, settings.gd
│   ├── core/               # Regras puras: *_rules.gd, game_flow.gd, run_state.gd
│   ├── ui/                 # main.gd (shell), tokens.gd, theme_builder.gd, app_screen.gd
│   │   ├── screens/        # title, tutorial, calibration, game, impeachment, final, settings, about
│   │   └── components/     # carta (swipe_card), HUD, medidor, Aprendizado, modal, placar, radar...
│   └── dev/                # gallery.gd (galeria dos componentes)
├── scenes/
│   ├── main.tscn           # Cena principal
│   ├── screens/            # Uma cena por tela
│   ├── components/         # Componentes reutilizáveis
│   └── dev/                # gallery.tscn
├── assets/
│   ├── fonts/              # Inter e Poppins (OFL) e os avisos OFL-*.txt
│   └── icons/              # Ícones provisórios (SVG)
├── tests/                  # test_*.gd (headless), shot_*.gd (capturas), run_all.sh
├── export_presets.cfg      # (planejado) 1º preset: Web (D-188)
└── README.md
```

Não existem `addons/` (o MCP não exige addon, D-131) nem `tools/mcp/` (D-189).

### 13.7.3. Camadas e Autoloads

| Camada | Onde | Papel |
| :--- | :--- | :--- |
| Dados | `jogo/data/*.json` | Conteúdo e balanceamento, sem código |
| Autoloads | `jogo/project.godot:18-23` | `GameData` (`scripts/game_data.gd`, classe `GameDatabase`): carrega e valida os JSON. `Settings`: configurações em `user://settings.cfg`. `SaveManager`: lê e grava `user://save.json`. `Game`: **única API das telas para a partida**, envolve `GameFlow`, salva depois de cada ação e emite `state_changed` e `toast_requested` (`jogo/scripts/autoload/game.gd:1-10`) |
| Núcleo | `jogo/scripts/core/` | Regras puras (`RefCounted`): `GameFlow` (máquina de estados), `RunState` (estado serializável) e funções estáticas por sistema (`*Rules`). Sem nós nem arquivos (`game_flow.gd:3-5`), testáveis em headless |
| Interface | `jogo/scripts/ui/`, `jogo/scenes/` | `AppMain` (shell: telas, tema, pausa, modal, avisos), telas e componentes; `Tokens` e `ThemeBuilder` concentram cores, tamanhos e tema |

Ordem de carga dos autoloads: `GameData`, `Settings`, `SaveManager`, `Game` (`project.godot:20-23`). O núcleo não referencia autoload algum: recebe o `GameData` pelo construtor (`game_flow.gd:37-40`). As telas falam com o `Game` (partida) e o `Settings`; só o `Game` chama o `SaveManager`; uma exceção é o tutorial, que lê `GameData.meters` para mostrar os níveis iniciais (`jogo/scripts/ui/screens/tutorial_screen.gd:186`).

---

## 13.8. Assets Públicos e Conteúdos Liberados

O projeto usará **assets públicos e conteúdos liberados**. A pesquisa identificou os principais repositórios.

### 13.8.1. Arte 2D e 3D

| Recurso | Licença | Destaques |
| :--- | :--- | :--- |
| **Kenney** | CC0 | Mais de 60.000 assets, 200+ pacotes, 100+ pacotes 2D |
| **OpenGameArt** | CC0, CC-BY, GPL | Grande coleção de arte para jogos |
| **Openclipart** | CC0 | Clip art livre |
| **BurningWell** | Domínio Público | Imagens e texturas |

### 13.8.2. Música e Sons

| Recurso | Licença | Destaques |
| :--- | :--- | :--- |
| **FreeMusicArchive** | CC0 | Muitas músicas CC0 |
| **Freesound** | CC0 | Milhares de efeitos sonoros |
| **GameSounds.xyz** | Royalty-free | Música e sons |
| **Open Music Archive** | Domínio Público | Gravações fora de copyright |

### 13.8.3. Fontes

| Recurso | Licença | Destaques |
| :--- | :--- | :--- |
| **Google Fonts** | OFL, Apache | Poppins, Inter (usadas no projeto) |
| **OpenFontLibrary** | OFL, Domínio Público | Fontes livres |
| **dotcolon** | CC0 | Fontes CC0 |
| **DaFont** | Variadas | Grande coleção de fontes |

### 13.8.4. Recursos Gerais

| Recurso | Destaques |
| :--- | :--- |
| **Awesome Gamedev** | Coleção curada de recursos free culture |
| **Awesome Uncopyright** | Lista curada de obras em domínio público |
| **PD Games** | Jogos completamente em domínio público |

### 13.8.5. Restrição Fundamental

**Não será usada IA generativa para arte, música ou assets.** Isso é uma escolha ética e prática:

1. **Ética** — respeitar o trabalho de artistas humanos.
2. **Qualidade** — assets CC0 de qualidade estão disponíveis.
3. **Consistência** — assets públicos têm estilo coeso.

### 13.8.6. Assets do Protótipo

| Tipo | Hoje | Licença | Onde |
| :--- | :--- | :--- | :--- |
| Fontes | Inter (corpo) e Poppins (títulos) | OFL 1.1, com aviso de licença na tela Sobre (D-140) | `jogo/assets/fonts/` (`OFL-Inter.txt`, `OFL-Poppins.txt`) |
| Ícones | Provisórios, desenhados para o protótipo (SVG); trocar pelos ícones CC0 definitivos (D-140; TA) | Próprios | `jogo/assets/icons/` (`jogo/assets/icons/README.md:1-3`) |
| Retratos | Silhueta genérica com nome (D-142) | Próprios | `jogo/assets/icons/portrait_silhouette.svg` |
| Áudio | Nenhum (fora do escopo do protótipo, `jogo/README.md:132`) | — | — |

Regra de licença (D-140): ícones só CC0 (o Font Awesome saiu); fontes do Google Fonts (OFL) com crédito e aviso na tela Sobre. Para áudio e para imagens que não são ícones, a regra segue por definir `[não verificado]`; as tabelas de 13.8.1 a 13.8.4 listam também licenças que a D-140 não cobre (CC-BY, GPL, *royalty-free*, variadas).

A tela Sobre ainda cita "Kenney (CC0)" entre os assets (`jogo/scripts/ui/screens/about_screen.gd:19`). A lista real de assets e o aviso de licença do Godot (`Engine.get_license_text()`) são a D-188 (P-014 etapa 5) **(planejado)**.

---

## 13.9. Considerações Técnicas

### 13.9.1. Performance

- **Mobile:** O jogo deve rodar em dispositivos com 2GB de RAM.
- **Web:** O jogo deve carregar em menos de 5 segundos.
- **PC:** O jogo deve rodar em qualquer máquina com Windows 10+.

São metas: o protótipo não foi medido em aparelho (fora do escopo do P-005, `jogo/README.md:132`). O projeto usa o renderizador GL Compatibility (`jogo/project.godot:35-36`).

### 13.9.2. Acessibilidade

- **Modo daltônico:** Usar padrões além de cores. **(planejado, pós-MVP — D-151, D-178)**
- **Tamanho de texto ajustável:** 4 tamanhos no seletor, 16, 18 (padrão), 20 e 24 px (D-165); 36 px só como base de teste (D-169) (`jogo/scripts/autoload/settings.gd:10-11`).
- **Alto contraste e reduzir movimento:** nas configurações, valendo na hora (`settings.gd:12-19`; D-169).
- **Alternativa ao arraste:** tocar numa metade da carta revela a opção e um segundo toque, depois de 0,5 s, confirma (D-145, D-157). No teclado, seta revela e Enter confirma sem o intervalo (D-185; `jogo/README.md:22-28`).
- **Leitor de tela:** nomes e descrições de acessibilidade nos controles (`accessibility_name`, D-152), que valem no PC. No Android e no iOS, aguarda o suporte do Godot; sem narração por TTS por enquanto **(planejado)**.

### 13.9.3. Localização

- **Idioma principal:** Português (Brasil).
- **Idiomas futuros:** Inglês, Espanhol **(planejado)**. As chaves de i18n seguem pendentes (D-066); hoje os textos estão nas cenas e scripts.

### 13.9.4. Versionamento

- **Formato:** SemVer (MAJOR.MINOR.PATCH) **(planejado)**: o `project.godot` ainda não declara versão.
- **Exemplo:** 1.0.0 (primeira versão estável).
- **Salvamento:** tem versão própria, `format_version`, hoje 1 (`jogo/scripts/core/run_state.gd:7`; D-065 pendente).

### 13.9.5. Exportação

| Plataforma | Formato | Requisitos | Estado |
| :--- | :--- | :--- | :--- |
| **Web** | HTML/JS/WASM | Navegador moderno | 1º preset, excluindo `scenes/dev/*` e `tests/*` (D-188; `gestao/prompts/correcoes-p014.md:72`). **(planejado)**: ainda não há `export_presets.cfg` |
| **Android** | APK ou AAB | Android SDK + Java JDK + Gradle (ou GABE) | **(planejado)** |
| **Windows** | Executável (.exe) | Windows 10+ | **(planejado)** |
| **iOS** | Projeto Xcode | macOS + Xcode | **(planejado)** |

No Android, o botão Voltar vira Esc e, na tela de título, sai do jogo (`config/quit_on_go_back=false`, `jogo/project.godot:16`; `NOTIFICATION_WM_GO_BACK_REQUEST` em `jogo/scripts/ui/main.gd:101-106`; D-185).

---

## 13.10. Referências

- 9axes. *Teste de espectro político*. 2026.
- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- CHUN92. *card-framework: A flexible and lightweight toolkit for building 2D card games in Godot*. GitHub, 2026.
- GAMMA, Erich; HELM, Richard; JOHNSON, Ralph; VLISSIDES, John. *Design Patterns: Elements of Reusable Object-Oriented Software*. Boston: Addison-Wesley, 1994.
- GODOT ENGINE. *Godot 4.7 Release*. 2026.
- GODOT MCP. *godot-editor-mcp: A generic, game-agnostic MCP server for AI-driven Godot development*. PyPI, 2026.
- ICON GAMES. *Senhor Presidente*. 2016.
- KENNEY. *High-quality game art under CC0*. 2026.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.
- SUMMER ENGINE. *Claude for Godot: How to Use Claude to Build Godot Games in 2026*. 2026.
- TUGCANTOPALOGLU. *godot-mcp: 157 tools for AI-driven game development*. GitHub, 2026.
- YANHUIFAIR. *godot-mcp: 281 tools, 26 categories, Godot 4.6/4.7 coverage*. npm, 2026.
