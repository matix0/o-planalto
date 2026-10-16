# 13 — Arquitetura Técnica

**Documento de Definição da Estrutura de Dados, Stack de Desenvolvimento e Sistemas do Jogo "O Planalto"**

Este documento define a arquitetura técnica do jogo, incluindo a stack de desenvolvimento (Godot 4.7 + MCP + Agentes de IA), a estrutura de dados de cada elemento (cartas, medidores, atores, turnos, finais), os algoritmos de sorteio e os sistemas de satisfação e eixo ideológico. É o documento-base para a implementação do protótipo.

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

1. **A sátira datada** — o "Senhor Presidente" satiriza o governo Bolsonaro; o "O Planalto" busca uma análise estrutural, sem nomes reais.
2. **O foco no orçamento** — o "Senhor Presidente" ensina que "você só ganha o jogo cortando orçamento"; o "O Planalto" ensina que o orçamento público não é como o de casa, e que investimento gera arrecadação futura.
3. **A ausência de fundamentação teórica** — o "Senhor Presidente" é entretenimento; o "O Planalto" é ferramenta de conscientização com base em pesquisa.

> "O 'Senhor Presidente' foi um marco para o público brasileiro, provando que há apetite para simulações políticas. Nosso projeto parte dessa herança, mas busca ir além: não apenas satirizar, mas conscientizar." — Mateus, idealizador do projeto

**Referências:**

- Icon Games. *Senhor Presidente*. 2016. Google Play.
- Drops de Jogos. *Desenvolvedor indie do Rio de Janeiro cria game satirizando o momento político nacional*. 2016.

### 13.1.3. Padrões de Projeto Recomendados

Para a implementação, recomendamos os seguintes padrões de projeto (*design patterns*):

| Padrão | Aplicação no Jogo |
| :--- | :--- |
| **Data-Driven Design** | Todo o conteúdo (cartas, atores, finais) é armazenado em arquivos de dados externos (JSON, Resource), não no código-fonte. |
| **State Machine** | O jogo tem estados bem definidos: Calibração, Turno, Carta, Carta de Aprendizado, Impeachment, Final. |
| **Observer Pattern** | Os medidores observam as mudanças de estado e atualizam a interface automaticamente via *signals*. |
| **Factory Pattern** | As cartas são criadas a partir de uma fábrica que lê os dados JSON e instancia os objetos. |
| **Strategy Pattern** | O algoritmo de sorteio pode ser alterado (aleatório, prioridade narrativa, etc.) sem mudar o resto do código. |

### 13.1.4. Escolha da Engine

| Engine | Vantagens | Desvantagens |
| :--- | :--- | :--- |
| **Godot 4.7** | Multiplataforma, open source, GDScript similar a Python, cena de cartas fácil de montar, ecossistema MCP maduro | Curva de aprendizado inicial |
| **HTML/JS** | Fácil de publicar na web, IA gera código facilmente | Mobile requer empacotamento (PWA, Capacitor), menos ferramentas MCP |

**Decisão:** **Godot 4.7** (confirmada). Justificativa detalhada na seção 13.2.

---

## 13.2. Stack de Desenvolvimento: Godot 4.7 + MCP + Agentes de IA

### 13.2.1. Visão Geral

A stack de desenvolvimento escolhida é composta por três camadas:

| Camada | Componente | Função |
| :--- | :--- | :--- |
| **Engine** | Godot 4.7 | Motor do jogo, editor visual, exportação multiplataforma |
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

**Recomendação:** **tugcantopaloglu/godot-mcp** (157 ferramentas, testado com Godot 4.7) ou **yanhuifair/godot-mcp** (281 ferramentas, cobertura abrangente).

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
│     └──▶ Godot 4.7 (download em godotengine.org)           │
│     └──▶ MCP Server (git clone + npm run build)            │
│     └──▶ Addon Godot (Asset Library ou GitHub)             │
│     └──▶ Claude Code / Cursor / VS Code Copilot            │
│                                                             │
│  2. CONFIGURAÇÃO                                            │
│     └──▶ Habilitar addon nas configurações de plugins      │
│     └──▶ Configurar cliente MCP (.mcp.json)                 │
│     └──▶ Testar conexão (listar cenas do projeto)          │
│                                                             │
│  3. DESENVOLVIMENTO                                         │
│     └──▶ Agente cria cenas, UI, scripts GDScript           │
│     └──▶ Agente testa e itera (playtest control)           │
│     └──▶ Desenvolvedor revisa e valida                      │
│                                                             │
│  4. PUBLICAÇÃO                                              │
│     └──▶ Exportar para Web (HTML5/WASM)                    │
│     └──▶ Exportar para Android (GABE ou PC)                │
│     └──▶ Exportar para Windows (executável)                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Passo a passo da configuração:**

1. **Instalar Godot 4.7** — download em godotengine.org.
2. **Instalar MCP Server** (`tugcantopaloglu/godot-mcp`, D-053; não publicado no npm) — `git clone https://github.com/tugcantopaloglu/godot-mcp.git`, `npm install`, `npm run build` (fonte: https://github.com/tugcantopaloglu/godot-mcp#installation). Configuração adiada para o P-005 (D-072).
3. **Instalar Addon Godot** — `[não verificado]` se este servidor exige addon; conferir no README dele no P-005.
4. **Habilitar Plugin** — idem, `[não verificado]`.
5. **Configurar Cliente MCP** — adicionar ao `.mcp.json` (caminho via variável de ambiente, para não versionar caminho absoluto):
   ```json
   {
     "mcpServers": {
       "godot": {
         "command": "node",
         "args": ["${GODOT_MCP_DIR}/build/index.js"],
         "env": { "GODOT_PATH": "${GODOT_PATH}" }
       }
     }
   }
   ```
6. **Abrir Claude Code / Cursor / VS Code Copilot** — começar a promptar.
7. **Desenvolver** — agentes de IA criam cenas, scripts e assets.
8. **Testar** — usar playtest control para rodar e observar o jogo.
9. **Exportar** — Web, Android, Windows.

### 13.2.6. Frameworks de Cartas para Godot

Existem frameworks prontos que aceleram o desenvolvimento de jogos de cartas em Godot.

| Framework | Destaques | Licença |
| :--- | :--- | :--- |
| **chun92/card-framework** | JSON Card Data, CardFactory, CardManager, sistema de eventos | MIT |
| **Card Game Skeleton** | Workflow visual para design de cartas, gerenciamento de decks, instanciação de cenas | MIT |
| **TRUCO** | Framework ECS multiplayer para jogos de cartas | MIT |
| **GD-Agentic-Skills** | Blueprint para card games com dados Resource-based | Open source |

**Recomendação:** **chun92/card-framework** — leve, flexível, com dados JSON e fábrica de cartas.

---

## 13.3. Estrutura de Dados

### 13.3.1. Estrutura de uma Carta

Cada carta é um **Resource** (`.tres`) ou **objeto JSON**. Regras: `gdd/sistemas/05_cartas.md` §3.

```json
{
  "id": "INST-001",
  "titulo": "Privatização da estatal",
  "modo": "Congresso",
  "tipo": "Institucional",
  "problema": "O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora.",
  "opcao_a": {
    "texto": "Nomear relator adversário",
    "cor": "vermelho",
    "eixo": [-1, 0, 0, 0],
    "efeitos": { "Capital Político": -10, "Soberania": 10 },
    "atores": {},
    "eventos": [],
    "consequencia": "O relator é adversário. O projeto avança."
  },
  "opcao_b": {
    "texto": "Aceitar as mudanças",
    "cor": "laranja",
    "eixo": [1, 0, 0, 0],
    "efeitos": { "Capital Político": 10, "Soberania": -15, "Caixa": 10, "Integridade": -5 },
    "atores": {},
    "eventos": [],
    "consequencia": "A lei passa. O povo paga a conta."
  },
  "aprendizado_id": "APR-001",
  "pre_requisitos": { "ano_minimo": 1 }
}
```

**Campos:**

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id` | String | Único: `INST-xxx`, `THEM-xxx`, `ATOR-xxx` |
| `titulo` | String | Até 5 palavras |
| `modo` | String | Um dos 10 modos |
| `tipo` | String | Institucional, Temática, Ator ou Impeachment (fora das 340, com `teste` por opção — D-101) |
| `problema` | String | Até 2 linhas |
| `opcao_a` / `opcao_b` | Objeto | Opções; o jogo sorteia o lado a cada exibição (D-084, D-099) |
| `aprendizado_id` | String | `APR-xxx` no doc 18 (D-090); sem aprovação, a carta fica fora do baralho (D-102) |
| `pre_requisitos` | Objeto | Só `ano_minimo` (1-4, padrão 1 — D-117) |
| `tecnica` | String | Só no modo Influenciador: uma de 6 técnicas (D-119) |

### 13.3.2. Estrutura de uma Opção

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `texto` | String | 1 linha |
| `cor` | String | Uma das 7 cores; cores distintas nas duas opções (D-092, D-103) |
| `eixo` | Array[4] | [Economia, Diplomacia, Sociedade, Estado], −2 a +2 (`gdd/sistemas/04_eixo.md`) |
| `efeitos` | Objeto | Campo único com sinal: 2-4 medidores, ±5 a ±30, múltiplos de 5, ≥ 1 negativo (D-098; exceção: Boa Vontade, D-108) |
| `atores` | Objeto | `{ "ACT-xxx": ±1 }`, 0-3 atores (D-106) |
| `eventos` | Array | 0 ou 1 evento: `texto`, `atraso` (1-2), `efeitos` (1-3 medidores) — D-111 |
| `reacao` | String | Só no modo Influenciador: `aceitar`, `recusar` ou `investigar` (D-120) |
| `teste` | Objeto | Só no tipo Impeachment (`gdd/sistemas/03_impeachment.md`) |
| `consequencia` | String | Frase curta mostrada após a escolha |

### 13.3.3. Estrutura de um Medidor

```json
{
  "nome": "Dignidade",
  "categoria": "Indicador Social",
  "valor_inicial": 45,
  "valor_atual": 45,
  "valor_minimo": 0,
  "valor_maximo": 100,
  "final_zero": "Barbárie",
  "final_cem": "Dependência Assistencialista",
  "cor": "#4CAF50",
  "icone": "dignidade.png"
}
```

**Campos:**

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `nome` | String | Nome do medidor |
| `categoria` | String | Categoria (Indicador Social, Recurso de Poder) |
| `valor_inicial` | Int | Valor no início do jogo |
| `valor_atual` | Int | Valor atual (muda durante o jogo) |
| `valor_minimo` | Int | Valor mínimo (0) |
| `valor_maximo` | Int | Valor máximo (100) |
| — | — | Sem campos de limiar: a cor e o significado vêm da faixa do valor (0-20 crítico, 21-40 baixo, 41-60 médio, 61-80, 81-100; doc 14 §14.11.3). Os únicos limiares com efeito são os 2 do fechamento do turno (`gdd/sistemas/01_medidores.md` §3.4) |
| `final_zero` | String | Final se chegar a 0 |
| `final_cem` | String | Final se chegar a 100 |
| `cor` | String | Não usado: a cor do ícone vem da faixa do valor (doc 14 §14.11.3) |
| `icone` | String | Ícone do medidor |

### 13.3.4. Estrutura de um Ator

```json
{
  "id": "ACT-001",
  "nome": "Latifundiários",
  "categoria": "Capital",
  "arquetipo": "Senhor de engenho, barão do café, dono de terras",
  "oferece": ["Capital Político"],
  "cobra": ["Soberania"],
  "cartas": { "ataque": "ATOR-xxx", "exigencia": "ATOR-xxx", "oferta": "ATOR-xxx" }
}
```

**Campos:** `id` (`ACT-001` a `ACT-024`, D-104); `nome`, `categoria`, `arquetipo` (doc 11); `oferece` / `cobra` (guia de escrita); `cartas` (uma por função; 2 atores sem `oferta` — D-105). Sem `preco` nem eventos próprios (D-107, D-109). A satisfação (começa em 50) fica no estado da partida. Regras: `gdd/sistemas/07_atores.md`.

### 13.3.5. Estado da Partida

O que é salvo automaticamente (D-121). Regras: `gdd/sistemas/10_estado_partida.md` §3.4.

| Dado | Sistema dono |
| :--- | :--- |
| Versão do formato, ano (1-4), estado atual, cartas do turno | 10 |
| 8 medidores e medidores que já tiveram emergência | 01, 06 |
| Satisfação dos 24 atores | 07 |
| Traçados "o que você disse" e "como você governou" | 04 |
| Cartas jogadas | 06 |
| Fila de eventos e epílogo | 08 |
| Impeachment usado, fase e apoio | 03 |

Uma única partida salva, apagada na tela final ou ao abandonar; entre partidas, só as configurações (D-123).

### 13.3.6. Estrutura de um Final

```json
{
  "id": "FINAL-001",
  "nome": "Barbárie",
  "categoria": "Catástrofe",
  "condicao": { "Dignidade": 0 },
  "descricao": "O povo é reduzido à mera sobrevivência. A vida não vale nada.",
  "citacao": "O povo é o que há de mais reles. Seu destino é ser uma mera força de trabalho, um carvão humano que se queima na produção.",
  "autor": "Darcy Ribeiro",
  "cor": "#B71C1C",
  "icone": "barbarie.png"
}
```

**Campos:**

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id` | String | Identificador único do final |
| `nome` | String | Nome do final |
| `categoria` | String | Categoria (Catástrofe, Captura, Perda da Democracia, Extermínio, Fortalecimento, Cuidado) |
| `condicao` | Objeto | Condição para o final ser acionado |
| `descricao` | String | Descrição narrativa |
| `citacao` | String | Citação de impacto |
| `autor` | String | Autor da citação |
| `cor` | String | Cor do final |
| `icone` | String | Ícone do final |

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

**Algoritmo:** `gdd/sistemas/04_eixo.md` §4 (média dos valores ≠ 0 × 5). Antes: pendente (P-9). Regra fixa: os pontos de cada eixo vêm dos dados da opção escolhida, **nunca do lado do arraste** (D-084; o lado é sorteado). O algoritmo antigo, que pontuava por "esquerda/direita", foi removido no P-010.

**Revelação Final:**

| Padrão | Revelação |
| :--- | :--- |
| **Dignidade, Consciência e Soberania altos** | *"Seu governo priorizou a dignidade, a educação e a soberania..."* |
| **Segurança, Capital Político e Caixa altos** | *"Seu governo priorizou a ordem, a estabilidade e a economia..."* |
| **Equilíbrio entre todos** | *"Seu governo buscou equilíbrio entre diferentes valores..."* |
| **Integridade e Consciência baixos** | *"Seu governo negligenciou a verdade e a educação..."* |
| **Dignidade e Soberania baixos** | *"Seu governo negligenciou o povo e a soberania..."* |

### 13.4.4. Sistema de Relações entre Medidores

| Medidor Afetado | Medidor que Afeta | Tipo de Relação | Efeito |
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

Detalhes: `gdd/sistemas/01_medidores.md`.

---

## 13.5. Formato de Armazenamento

### 13.5.1. Arquivos de Dados

| Arquivo | Formato | Conteúdo |
| :--- | :--- | :--- |
| `cartas.json` | JSON | Todas as 340 cartas |
| `medidores.json` | JSON | Os 8 medidores (sub-medidores removidos, D-094) |
| `atores.json` | JSON | Os 24 atores |
| `finais.json` | JSON | Os 28 finais (D-096, D-122) |
| `calibracao.json` | JSON | As 6 perguntas da calibração inicial |
| `eixo_ideologico.json` | JSON | Configuração do eixo 9axes |
| `dialogos.json` | JSON | Textos de interface (botões, mensagens) |

**Nota:** O Godot suporta nativamente **Resources** (`.tres`) para dados estruturados, que são mais performáticos que JSON para leitura em tempo de execução. Recomendamos usar **Resources para dados de jogo** e **JSON para dados de configuração**.

### 13.5.2. Exemplo de `cartas.json`

```json
{
  "cartas": [
    {
      "id": "INST-001",
      "titulo": "Privatização da estatal",
      "modo": "Congresso",
      "tipo": "Institucional",
      "problema": "O Congresso analisa um projeto de privatização da estatal de energia. O relator quer mudar o texto para beneficiar uma empresa doadora.",
      "opcao_a": {
        "texto": "Nomear relator adversário",
        "cor": "vermelho",
        "eixo": [-1, 0, 0, 0],
        "efeitos": { "Capital Político": -10, "Soberania": 10 },
        "atores": {},
        "eventos": [],
        "consequencia": "O relator é adversário. O projeto avança."
      },
      "opcao_b": {
        "texto": "Aceitar as mudanças",
        "cor": "laranja",
        "eixo": [1, 0, 0, 0],
        "efeitos": { "Capital Político": 10, "Soberania": -15, "Caixa": 10, "Integridade": -5 },
        "atores": {},
        "eventos": [],
        "consequencia": "A lei passa. O povo paga a conta."
      },
      "aprendizado_id": "APR-001",
      "pre_requisitos": { "ano_minimo": 1 }
    }
  ]
}
```

Eventos ficam dentro das opções (D-111); não há `eventos.json`.

---

## 13.6. Diagrama de Fluxo do Jogo

### 13.6.1. Fluxo Geral

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUXO GERAL DO JOGO                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  TELA INICIAL                                               │
│  └──▶ CALIBRAÇÃO (6 perguntas)                             │
│       └──▶ TURNO 1 (Ano 1 - Lua de Mel)                    │
│            └──▶ TURNO 2 (Ano 2 - Realidade Bate)           │
│                 └──▶ TURNO 3 (Ano 3 - Crise)               │
│                      └──▶ TURNO 4 (Ano 4 - Desfecho)       │
│                           └──▶ FINAL                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 13.6.2. Fluxo de um Turno

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUXO DE UM TURNO                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ABERTURA DO TURNO                                          │
│  └──▶ EVENTOS → OBRIGATÓRIAS → 7 CARTAS                    │
│       └──▶ CARTA 1 (Problema + Escolha + Consequência)     │
│            └──▶ CARTA DE APRENDIZADO 1                     │
│                 └──▶ CARTA 2                                │
│                      └──▶ CARTA DE APRENDIZADO 2           │
│                           └──▶ ...                          │
│                                └──▶ FECHAMENTO DO TURNO    │
│                                     └──▶ VERIFICAÇÃO       │
│                                          (medidor zerado?)  │
│                                          (impeachment?)     │
│                                          (evento encadeado?)│
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 13.6.3. Fluxo de uma Carta

```
┌─────────────────────────────────────────────────────────────┐
│                    FLUXO DE UMA CARTA                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  EXIBIR PROBLEMA                                            │
│  └──▶ JOGADOR ARRASTA (lado de cada opção sorteado)        │
│       └──▶ APLICAR EFEITOS NOS MEDIDORES                   │
│            └──▶ EXIBIR CONSEQUÊNCIA                        │
│                 └──▶ EXIBIR CARTA DE APRENDIZADO           │
│                      └──▶ VERIFICAR EVENTOS ENCADEADOS     │
│                           └──▶ PRÓXIMA CARTA                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

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
| Alternativo | 3 opções seguidas com efeito negativo em Capital Político | Ano 2 |
| Capital em 0 | Capital Político = 0 (D-095) | Ano 1 |

- Cada opção das fases 1-4 tem um teste de medidor; teste vencido = +1 apoio.
- Desfecho: absolvição se apoio ≥ 2 (≥ 3 com Capital em 0) e o teste da opção escolhida passar; senão, condenação.
- Condenação automática se a cena começa com Consciência < 15 E Integridade < 15.
- A cena ocorre 1× por partida.

Detalhes: `gdd/sistemas/03_impeachment.md`.

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

---

## 13.7. Estrutura de Pastas do Projeto

```
o-planalto/
│
├── assets/
│   ├── icones/
│   ├── fontes/
│   ├── sons/
│   └── imagens/
│
├── dados/
│   ├── cartas.json
│   ├── medidores.json
│   ├── atores.json
│   ├── finais.json
│   ├── eventos.json
│   ├── calibracao.json
│   ├── eixo_ideologico.json
│   └── dialogos.json
│
├── cenas/
│   ├── tela_inicial.tscn
│   ├── calibracao.tscn
│   ├── turno.tscn
│   ├── carta.tscn
│   ├── carta_aprendizado.tscn
│   ├── impeachment.tscn
│   └── final.tscn
│
├── scripts/
│   ├── gerenciador_jogo.gd
│   ├── gerenciador_cartas.gd
│   ├── gerenciador_medidores.gd
│   ├── gerenciador_atores.gd
│   ├── gerenciador_finais.gd
│   ├── sistema_sorteio.gd
│   ├── sistema_satisfacao.gd
│   └── sistema_eixo.gd
│
├── addons/
│   └── godot_mcp/          # Addon MCP
│
├── docs/                   # Documentação (GitHub Pages)
│   ├── 00_INDICE_GERAL.md
│   ├── 01_CONTEXTO_E_MOTIVACAO.md
│   ├── ...
│   └── 13_ARQUITETURA_TECNICA.md
│
├── gestao/                 # Docs vivos (D-071)
│
└── README.md
```

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

---

## 13.9. Considerações Técnicas

### 13.9.1. Performance

- **Mobile:** O jogo deve rodar em dispositivos com 2GB de RAM.
- **Web:** O jogo deve carregar em menos de 5 segundos.
- **PC:** O jogo deve rodar em qualquer máquina com Windows 10+.

### 13.9.2. Acessibilidade

- **Modo daltônico:** Usar padrões além de cores.
- **Tamanho de texto ajustável:** 3 tamanhos (pequeno, médio, grande).
- **Leitor de tela:** Descrições de áudio para as cartas.

### 13.9.3. Localização

- **Idioma principal:** Português (Brasil).
- **Idiomas futuros:** Inglês, Espanhol.

### 13.9.4. Versionamento

- **Formato:** SemVer (MAJOR.MINOR.PATCH).
- **Exemplo:** 1.0.0 (primeira versão estável).

### 13.9.5. Exportação

| Plataforma | Formato | Requisitos |
| :--- | :--- | :--- |
| **Web** | HTML/JS/WASM | Navegador moderno |
| **Android** | APK ou AAB | Android SDK + Java JDK + Gradle (ou GABE) |
| **Windows** | Executável (.exe) | Windows 10+ |
| **iOS** | Projeto Xcode | macOS + Xcode |

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
