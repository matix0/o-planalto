# 08 — Produção e Próximos Passos

**Documento de Planejamento de Produção do Jogo "O Planalto"**

Este documento consolida o planejamento de produção do jogo, incluindo a stack de desenvolvimento, a equipe, o cronograma, a validação pedagógica, as questões legais, a acessibilidade e a estratégia de distribuição. Cada seção apresenta a fundamentação teórica e prática que embasa cada decisão.

---

## 08.01 — Visão Geral da Produção

### 08.01.1. Panorama de Produção

| Elemento | Definição |
| :--- | :--- |
| **Stack** | Godot 4.7 + MCP + Agentes de IA |
| **Plataformas** | Mobile, Web e PC |
| **Equipe** | Mateus + colaboradores |
| **Cronograma** | 6-7 dias para o protótipo |
| **Validação** | Testes com 3-5 pessoas + educador |
| **Distribuição** | Play Store, Web, itch.io |
| **Modelo** | Gratuito (sem monetização interna) |
| **Salvamento** | Sem salvamento de progresso |

### 08.01.2. Princípios de Produção

A produção do "O Planalto" segue cinco princípios fundamentais:

| # | Princípio | Descrição |
| :--- | :--- | :--- |
| 1 | **Escopo controlado** | O jogo é simples (arrastar cartas), então o desenvolvimento é rápido. |
| 2 | **Iteração** | Os testes e validações são feitos em paralelo com o desenvolvimento. |
| 3 | **Flexibilidade** | O cronograma pode ser ajustado conforme necessário. |
| 4 | **Ética** | Sem dark patterns, sem monetização predatória, sem telemetria obrigatória. |
| 5 | **Documentação** | Tudo é documentado para facilitar a manutenção e o onboarding. |

### 08.01.3. Fundamentação Teórica

> "Um jogo educativo mal planejado é um jogo que nunca será usado." — Jesse Schell, *The Art of Game Design*

O planejamento de produção é fundamental em projetos de jogos educativos por três razões:

1. **Escopo controlado** — evita que o projeto cresça além do que é viável.
2. **Prazos realistas** — permite que a equipe saiba o que esperar.
3. **Qualidade garantida** — permite que os testes e validações sejam feitos.

---

## 08.02 — Stack de Desenvolvimento

### 08.02.1. Visão Geral

A stack de desenvolvimento é composta por três camadas:

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

### 08.02.2. Godot 4.7: Recursos Relevantes

O Godot 4.7 foi lançado em **18 de junho de 2026** e traz recursos importantes para o desenvolvimento assistido por IA e para a publicação multiplataforma.

| Recurso | Descrição | Impacto no Projeto |
| :--- | :--- | :--- |
| **Asset Store nativo** | Loja de assets integrada ao editor | Facilita a instalação de addons MCP e assets |
| **HDR output** | Suporte a alta faixa dinâmica | Melhora a qualidade visual das cartas |
| **Control offset transforms** | Transformações de UI sem quebrar o layout | Facilita animações de cartas |
| **GABE (Godot Android Build Environment)** | Exportação Gradle direto do Android | Permite exportar para Android sem PC |
| **Android Editor estável** | Editor completo no Android | Desenvolvimento mobile sem desktop |

### 08.02.3. MCP: Servidores Disponíveis

O ecossistema MCP para Godot está **maduro em 2026**. A pesquisa identificou múltiplos servidores com diferentes níveis de funcionalidade.

| Servidor MCP | Ferramentas | Godot | Destaques |
| :--- | :--- | :--- | :--- |
| **godot-editor-mcp** | 180 ferramentas, 29 categorias | 4.4+ | Servidor genérico, agnóstico de jogo |
| **tugcantopaloglu/godot-mcp** | 157 ferramentas | 4.7 (testado) | Controle total do engine, GDScript e C# |
| **yanhuifair/godot-mcp** | 281 ferramentas, 26 categorias | 4.6/4.7 | Cobertura abrangente |
| **Godot MCP Pro** | 163 ferramentas | 4.7 | Integração com Claude Code, Cursor, Windsurf |

**Recomendação:** **tugcantopaloglu/godot-mcp** (157 ferramentas, testado com Godot 4.7) ou **yanhuifair/godot-mcp** (281 ferramentas, cobertura abrangente).

### 08.02.4. Agentes de IA: Claude Code como Principal

A pesquisa confirma que **Claude é "genuinamente um dos melhores modelos para escrever GDScript e C#"**, com menos deriva entre Godot 3 e Godot 4 do que ferramentas de autocomplete.

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

### 08.02.5. Frameworks de Cartas para Godot

Existem frameworks prontos que aceleram o desenvolvimento de jogos de cartas em Godot.

| Framework | Destaques | Licença |
| :--- | :--- | :--- |
| **chun92/card-framework** | JSON Card Data, CardFactory, CardManager | MIT |
| **Card Game Skeleton** | Workflow visual para design de cartas | MIT |
| **TRUCO** | Framework ECS multiplayer para jogos de cartas | MIT |

**Recomendação:** **chun92/card-framework** — leve, flexível, com dados JSON e fábrica de cartas.

### 08.02.6. Fluxo de Trabalho

```
┌─────────────────────────────────────────────────────────────┐
│              FLUXO DE TRABALHO COM GODOT + MCP              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. INSTALAÇÃO                                              │
│     └──▶ Godot 4.7 (download em godotengine.org)           │
│     └──▶ MCP Server (pip install godot-editor-mcp)         │
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

### 08.02.7. Fundamentação Teórica

A escolha da stack se baseia em:

1. **Ecossistema MCP maduro** — múltiplos servidores com 120+ ferramentas disponíveis.
2. **Experiência do desenvolvedor** — Mateus já conhece Godot.
3. **Comunidade de IA** — Godot é adotado como "best engine for AI-assisted development".
4. **Arquivos legíveis por IA** — tudo em texto plano (.tscn, .gd).

> "Godot is quietly becoming the best engine for AI-assisted development." — Summer Engine, 2026

### 08.02.8. Referências

- GODOT ENGINE. *Godot 4.7 Release*. 2026.
- GODOT MCP. *godot-editor-mcp*. PyPI, 2026.
- TUGCANTOPALOGLU. *godot-mcp*. GitHub, 2026.
- YANHUIFAIR. *godot-mcp*. npm, 2026.
- SUMMER ENGINE. *Claude for Godot*. 2026.
- CHUN92. *card-framework*. GitHub, 2026.

---

## 08.03 — Equipe e Funções

### 08.03.1. Estrutura da Equipe

| Membro | Função | Responsabilidades |
| :--- | :--- | :--- |
| **Mateus** | Idealizador, programação, documentação | Liderança, desenvolvimento, escrita |
| **Vini** | A definir | A definir |
| **Professor interlocutor** | Validação pedagógica | Revisão de conteúdo, testes em sala |
| **Professor Alisson** | Revisão crítica | Auditoria de conteúdo, sugestões |
| **Terceiros** | A definir | Arte, som, design |

### 08.03.2. Funções Detalhadas

**Mateus — Idealizador, Programação, Documentação**

| Atribuição | Descrição |
| :--- | :--- |
| **Liderança** | Coordenar o projeto, tomar decisões finais |
| **Programação** | Desenvolver o jogo em Godot 4.7 com MCP |
| **Documentação** | Escrever e manter a documentação |
| **Pesquisa** | Validar dados e fontes |

**Vini — A Definir**

| Atribuição | Descrição |
| :--- | :--- |
| **A definir** | Dependendo das habilidades e interesses |

**Professor Interlocutor — Validação Pedagógica**

| Atribuição | Descrição |
| :--- | :--- |
| **Revisão de conteúdo** | Verificar se o conteúdo está alinhado com o currículo escolar |
| **Testes em sala** | Aplicar o jogo em sala de aula e coletar feedback |
| **Validação pedagógica** | Validar se o jogo cumpre os objetivos de aprendizagem |

**Professor Alisson — Revisão Crítica**

| Atribuição | Descrição |
| :--- | :--- |
| **Auditoria de conteúdo** | Identificar erros factuais e inconsistências |
| **Sugestões** | Propor melhorias e correções |
| **Revisão final** | Validar a versão final do jogo |

### 08.03.3. Equipe de Agentes de IA (12 Papéis)

Para o desenvolvimento assistido por IA, o projeto usa **12 subagentes especializados**:

| Papel | Missão | Modelo |
| :--- | :--- | :--- |
| **GP** | Fases, escopo, MVP, riscos | Sonnet |
| **GD** | Loops, regras, progressão, GDD | **Opus** |
| **PSI** | Ética, manipulação, psicologia | **Opus** |
| **GF** | Game feel, impacto emocional | Sonnet |
| **UX** | Telas, HUD, acessibilidade | Sonnet |
| **DEV** | Viabilidade, GDScript tipado | Sonnet |
| **ARQ** | Arquitetura, ADRs, guardrails | **Opus** |
| **ECO** | Economia, simulação | **Opus** |
| **QA** | Testes, critérios de aceite | Sonnet |
| **TA** | Assets CC0, shaders, VFX | Sonnet |
| **SFX** | Áudio CC0, mixagem | Sonnet |
| **AIW** | Prompts, CLAUDE.md, skills | Sonnet |

**Princípios dos agentes:**

1. Agentes **propõem**, nunca decidem.
2. Divergência entre papéis vira trade-off para o PO.
3. Escrita (Edit/Write) só na Fase 10, com ordem do PO.
4. Máximo **3 subagentes em paralelo**.
5. Notas incrementais desde o início.

### 08.03.4. Fundamentação Teórica

A estrutura da equipe se baseia em três princípios:

1. **Divisão de responsabilidades** — cada membro tem funções claras.
2. **Validação externa** — a revisão crítica é feita por alguém de fora do projeto.
3. **Colaboração** — a equipe trabalha junta, mas com autonomia.

> "Uma equipe bem estruturada é uma equipe que entrega." — Jesse Schell

### 08.03.5. Referências

- SCHELL, Jesse. *The Art of Game Design: A Book of Lenses*. Boca Raton: CRC Press, 2008.
- TIXHEAD REWORK. *Relatório de contexto consolidado*. 2026.

---

## 08.04 — Cronograma

### 08.04.1. Visão Geral do Cronograma

| Etapa | Prazo | Status |
| :--- | :--- | :--- |
| **Documentação (00-13)** | Outubro 2026 | ✅ Concluída |
| **Docs Vivos** | Outubro 2026 | ✅ Concluída |
| **Setup Claude Code** | Outubro 2026 | ✅ Concluída |
| **Arquivos 14-18** | Outubro-Novembro 2026 | ⏳ A iniciar |
| **GDD Completo** | Novembro 2026 | ⏳ A iniciar |
| **Protótipo Técnico** | Novembro 2026 (6-7 dias) | ⏳ A iniciar |
| **Testes com 3-5 pessoas** | Novembro 2026 | ⏳ A iniciar |
| **Validação com Educador** | Novembro 2026 | ⏳ A iniciar |
| **Publicação** | Dezembro 2026 | ⏳ A iniciar |

### 08.04.2. Estimativa de Esforço

| Etapa | Esforço Estimado | Dias Úteis |
| :--- | :--- | :--- |
| **Arquivos 14-18** | 5-6 dias | 5-6 |
| **GDD Completo** | 2-3 dias | 2-3 |
| **Protótipo Técnico** | 6-7 dias | 6-7 |
| **Testes** | 1-2 dias | 1-2 |
| **Ajustes** | 2-3 dias | 2-3 |
| **Validação** | 1-2 dias | 1-2 |
| **Publicação** | 1 dia | 1 |
| **Total** | **18-24 dias** | **18-24** |

### 08.04.3. Fases do Cronograma

```
┌─────────────────────────────────────────────────────────────┐
│                    CRONOGRAMA DE PRODUÇÃO                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  FASE 0 — DOCUMENTAÇÃO ✅                                   │
│  └──▶ 14 arquivos (00-13)                                   │
│                                                             │
│  FASE 1 — DOCS VIVOS ✅                                     │
│  └──▶ 6 arquivos (estado, decisões, planos, etc.)           │
│                                                             │
│  FASE 2 — SETUP ✅                                          │
│  └──▶ Claude Code + MCP + GitHub Pages                      │
│                                                             │
│  FASE 3 — ARQUIVOS DE APOIO ⏳                              │
│  └──▶ 14_UI_UX, 15_FLUXO, 16_MANUAL, 17_CARTAS, 18_APREND.  │
│                                                             │
│  FASE 4 — GDD COMPLETO ⏳                                   │
│  └──▶ Consolidação de todos os sistemas                     │
│                                                             │
│  FASE 5 — PROTÓTIPO TÉCNICO ⏳                              │
│  └──▶ Implementação em Godot 4.7                            │
│                                                             │
│  FASE 6 — TESTES ⏳                                         │
│  └──▶ 3-5 pessoas + educador                                │
│                                                             │
│  FASE 7 — PUBLICAÇÃO ⏳                                     │
│  └──▶ Play Store, Web, itch.io                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 08.04.4. Fundamentação Teórica

O cronograma se baseia em três princípios:

1. **Escopo controlado** — o jogo é simples (arrastar cartas), então o desenvolvimento é rápido.
2. **Iteração** — os testes e validações são feitos em paralelo com o desenvolvimento.
3. **Flexibilidade** — o cronograma pode ser ajustado conforme necessário.

> "O cronograma deve ser um guia, não uma prisão." — Fred Brooks, *The Mythical Man-Month*

### 08.04.5. Referências

- BROOKS, Fred. *The Mythical Man-Month*. Boston: Addison-Wesley, 1975.
- SCHWABER, Ken; SUTHERLAND, Jeff. *The Scrum Guide*. 2020.

---

## 08.05 — Validação Pedagógica

### 08.05.1. Metodologia de Validação

A validação pedagógica segue quatro etapas:

| Etapa | Descrição | Responsável |
| :--- | :--- | :--- |
| **1. Teste com 3-5 pessoas** | Feedback inicial sobre usabilidade e engajamento | Mateus |
| **2. Validação com educador** | Verificar se o conteúdo está alinhado com o currículo escolar | Professor interlocutor |
| **3. Teste com alunos** | Verificar se o jogo é compreensível e engajador | Professor interlocutor |
| **4. Ajustes** | Corrigir problemas identificados | Mateus |

### 08.05.2. Métricas de Validação

| Métrica | Descrição | Meta |
| :--- | :--- | :--- |
| **Compreensão** | O jogador entendeu o conceito? | > 80% |
| **Engajamento** | O jogador se sentiu engajado? | > 70% |
| **Aprendizado** | O jogador aprendeu algo novo? | > 80% |
| **Recomendação** | O jogador recomendaria o jogo? | > 70% |
| **Duração** | O jogo foi concluído em 30-40 minutos? | > 80% |

### 08.05.3. Parcerias Potenciais

| Parceiro | O que oferece | Status |
| :--- | :--- | :--- |
| **Politize!** | Validação de conteúdo, distribuição | ⏳ A ser buscada |
| **IAgora?** | Inspiração para o Modo Influenciador | ⏳ A ser buscada |
| **Escolas** | Testes em sala de aula | ⏳ A ser buscada |
| **Universidades** | Divulgação | ⏳ A ser buscada |

### 08.05.4. Fundamentação Teórica

A validação pedagógica se baseia em três princípios:

1. **Avaliação Formativa** — o feedback é coletado durante o desenvolvimento, não apenas no final.
2. **Design Centrado no Usuário** — as necessidades do público-alvo são o centro das decisões.
3. **Iteração** — o jogo é refinado com base no feedback.

> "A avaliação é uma ferramenta de aprendizagem, não um tribunal." — Paulo Freire

### 08.05.5. Referências

- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- SCRIVEN, Michael. *The Methodology of Evaluation*. 1967.
- NORMAN, Donald. *The Design of Everyday Things*. New York: Basic Books, 1988.

---

## 08.06 — Questões Legais

### 08.06.1. Citações e Direitos Autorais

| Item | Status | Recomendação |
| :--- | :--- | :--- |
| **Citações de Bolsonaro** | ⚠️ Risco de processo | Consultar advogado |
| **Citações de Hitler/Mussolini** | ⚠️ Uso educacional | Contextualizar, evitar apologia |
| **Citações de Lula, Brizola, Freire** | ✅ Domínio público | Usar com crédito |
| **Citações de Darcy Ribeiro** | ✅ Domínio público | Usar com crédito |
| **Citações de Josué de Castro** | ✅ Domínio público | Usar com crédito |

### 08.06.2. Registro do Jogo

| Item | Status | Recomendação |
| :--- | :--- | :--- |
| **Registro no INPI** | ⏳ A ser feito | Registrar a marca "O Planalto" |
| **Direitos autorais** | ⏳ A ser feito | Registrar o código-fonte |
| **Licença** | ⏳ A ser definida | Creative Commons ou MIT |

### 08.06.3. Avisos de Conteúdo

| Item | Status | Recomendação |
| :--- | :--- | :--- |
| **Trigger warnings** | ⏳ A ser definido | Avisar sobre genocídio, tortura, violência |
| **Classificação etária** | ⏳ A ser definida | Livre (pretendido) |
| **Aviso de linguagem** | ⏳ A ser definido | Avisar sobre linguagem direta e brutal |

### 08.06.4. Fundamentação Teórica

As questões legais se baseiam em três princípios:

1. **Uso educacional** — o jogo tem fins educativos, o que permite o uso de citações.
2. **Contextualização** — citações de Hitler e Mussolini são usadas para criticar o autoritarismo, não para promovê-lo.
3. **Transparência** — todas as fontes são citadas e creditadas.

> "O direito autoral existe para proteger a criação, não para impedir a educação." — Lei 9.610/1998

### 08.06.5. Referências

- Lei 9.610/1998. *Lei de Direitos Autorais*. Brasília: Congresso Nacional, 1998.
- INPI. *Manual de Marcas*. Rio de Janeiro: INPI, 2026.

---

## 08.07 — Acessibilidade e Avisos

### 08.07.1. Recursos de Acessibilidade

| Recurso | Status | Recomendação |
| :--- | :--- | :--- |
| **Modo daltônico** | ⏳ A ser definido | Usar padrões além de cores |
| **Tamanho de texto ajustável** | ⏳ A ser definido | 3 tamanhos (pequeno, médio, grande) |
| **Leitor de tela** | ⏳ A ser definido | Descrições de áudio para as cartas |
| **Idioma** | ⏳ A ser definido | Português (principal), Inglês, Espanhol |
| **Contraste** | ⏳ A ser definido | Alto contraste para legibilidade |

### 08.07.2. Avisos de Conteúdo

| Aviso | Descrição | Onde |
| :--- | :--- | :--- |
| **Genocídio** | O jogo aborda o genocídio da população negra | Tela inicial |
| **Tortura** | O jogo aborda a tortura na ditadura | Tela inicial |
| **Violência** | O jogo aborda a violência policial | Tela inicial |
| **Linguagem** | O jogo usa linguagem direta e brutal | Tela inicial |

### 08.07.3. Fundamentação Teórica

A acessibilidade se baseia em três princípios:

1. **Design Universal** — o jogo deve ser acessível ao maior número possível de pessoas.
2. **Inclusão** — o jogo deve incluir pessoas com deficiências.
3. **Transparência** — o jogo deve avisar sobre conteúdos sensíveis.

> "O design universal não é um luxo. É uma necessidade." — Ron Mace

### 08.07.4. Referências

- MACE, Ron. *Universal Design: Housing for the Lifespan of All People*. 1988.
- WCAG. *Web Content Accessibility Guidelines*. 2023.

---

## 08.08 — Estratégia de Distribuição

### 08.08.1. Canais de Distribuição

| Canal | Público | Vantagens |
| :--- | :--- | :--- |
| **Play Store** | Mobile | Alcance massivo |
| **Web (itch.io)** | Desktop | Fácil publicação |
| **GitHub Pages** | Web | Documentação acessível |
| **Escolas** | Estudantes | Validação pedagógica |
| **Universidades** | Estudantes | Público-alvo |
| **Redes sociais** | Jovens | Divulgação |

### 08.08.2. Estratégia de Divulgação

| Etapa | Descrição | Responsável |
| :--- | :--- | :--- |
| **1. Publicação do GitHub Pages** | Documentação acessível para terceiros | Mateus |
| **2. Publicação no itch.io** | Jogo acessível para desktop | Mateus |
| **3. Publicação na Play Store** | Jogo acessível para mobile | Mateus |
| **4. Divulgação em redes sociais** | Posts, vídeos, memes | Mateus |
| **5. Parcerias com escolas** | Testes em sala de aula | Professor interlocutor |
| **6. Parcerias com mídia alternativa** | Carta Capital, Brasil de Fato, Mídia NINJA | Mateus |

### 08.08.3. Fundamentação Teórica

A distribuição se baseia em três princípios:

1. **Acessibilidade** — o jogo deve estar disponível em múltiplas plataformas.
2. **Gratuidade** — o jogo deve ser gratuito para maximizar o alcance.
3. **Parcerias** — o jogo deve ser distribuído em parceria com escolas e mídia alternativa.

> "A educação é um direito, não uma mercadoria." — Paulo Freire

### 08.08.4. Referências

- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- ITCH.IO. *Publishing Guidelines*. 2026.
- GOOGLE PLAY. *Publishing Guidelines*. 2026.

---

## 08.09 — Métricas de Sucesso

### 08.09.1. Métricas Quantitativas

| Métrica | Meta | Prazo |
| :--- | :--- | :--- |
| **Jogadores** | 1.000 no primeiro mês | 1 mês |
| **Conclusão** | 70% dos jogadores completam o jogo | 1 mês |
| **Aprendizado** | 80% dos jogadores aprendem algo novo | 1 mês |
| **Engajamento** | 50% dos jogadores jogam mais de uma vez | 1 mês |
| **Avaliação** | Nota média > 4.0 | 1 mês |

### 08.09.2. Métricas Qualitativas

| Métrica | Descrição | Prazo |
| :--- | :--- | :--- |
| **Validação de educadores** | Aprovação de professores | 2 meses |
| **Validação de alunos** | Feedback positivo de estudantes | 2 meses |
| **Cobertura de mídia** | Menções na mídia alternativa | 3 meses |
| **Parcerias** | Parcerias com escolas e organizações | 3 meses |

### 08.09.3. Fundamentação Teórica

As métricas se baseiam em três princípios:

1. **Mensurabilidade** — o que não é medido não pode ser melhorado.
2. **Impacto** — as métricas devem medir o impacto real, não apenas o engajamento.
3. **Melhoria contínua** — as métricas devem ser usadas para melhorar o jogo.

> "O que não é medido não é gerenciado." — Peter Drucker

### 08.09.4. Referências

- DRUCKER, Peter. *The Effective Executive*. New York: Harper & Row, 1966.
- KIRKPATRICK, Donald. *Evaluating Training Programs*. 1959.

---

## 08.10 — Riscos e Mitigações

### 08.10.1. Riscos de Processo com IA

| ID | Risco | Impacto | Mitigação | Status |
| :--- | :--- | :--- | :--- | :--- |
| **RP-01** | Perda de contexto entre sessões | Alto | Docs vivos + `/fechar-plano` | 🟢 Mitigado |
| **RP-02** | Alucinação técnica | Alto | Citar `arquivo:linha` ou `[não verificado]` | 🟡 Ativo |
| **RP-03** | Decisão sem o PO | Alto | Log D-xxx | 🟢 Mitigado |
| **RP-04** | Plano executado diferente | Médio | Auditoria do GP | 🟡 Ativo |
| **RP-05** | Limite de uso em subagentes | Médio | Notas parciais; ondas menores | 🟡 Ativo |
| **RP-06** | Dados desatualizados | Médio | Validação via `arquivo:linha` | 🟡 Ativo |
| **RP-07** | Cartas inconsistentes | Alto | Guia de estilo + validação | 🔴 Alto |
| **RP-08** | Custo de tokens | Médio | Política de subagentes | 🟡 Ativo |

### 08.10.2. Riscos Técnicos

| ID | Risco | Impacto | Mitigação | Status |
| :--- | :--- | :--- | :--- | :--- |
| **RT-01** | Godot 4.7 + MCP inexperiente | Alto | Seguir fluxo documentado | 🟡 Ativo |
| **RT-02** | GDScript sem tipagem estática | Médio | Regra no `.claude/rules/` | 🟢 Mitigado |
| **RT-03** | Estrutura de dados mal definida | Alto | Arquivo 13 completo | 🟢 Mitigado |
| **RT-04** | Assets CC0 de baixa qualidade | Médio | Curadoria em Kenney/OpenGameArt | 🟡 Ativo |
| **RT-05** | Performance em mobile | Médio | Testes desde o início | 🟡 Ativo |
| **RT-06** | Exportação Web problemática | Médio | Testes em navegador | 🟡 Ativo |

### 08.10.3. Riscos de Conteúdo

| ID | Risco | Impacto | Mitigação | Status |
| :--- | :--- | :--- | :--- | :--- |
| **RC-01** | Conteúdo doutrinário | Alto | Revisão ética (PSI) | 🟡 Ativo |
| **RC-02** | Uso de dados desatualizados | Alto | Validação com fontes 2026 | 🟡 Ativo |
| **RC-03** | Citações erradas | Alto | Validação por historiador | 🟡 Ativo |
| **RC-04** | Cartas desbalanceadas | Médio | Simulações | 🟡 Ativo |
| **RC-05** | Finais inconsistentes | Médio | Validação cruzada | 🟡 Ativo |
| **RC-06** | Tom inadequado | Médio | Guia de estilo | 🟢 Mitigado |

### 08.10.4. Fundamentação Teórica

O gerenciamento de riscos se baseia em três princípios:

1. **Identificação precoce** — os riscos devem ser identificados antes que se tornem problemas.
2. **Mitigação proativa** — os riscos devem ser mitigados antes que causem danos.
3. **Monitoramento contínuo** — os riscos devem ser monitorados ao longo do projeto.

### 08.10.5. Referências

- TIXHEAD REWORK. *Relatório de contexto consolidado*. 2026.
- PMI. *A Guide to the Project Management Body of Knowledge (PMBOK Guide)*. 2021.

---

## 08.11 — Próximos Passos Imediatos

### 08.11.1. Lista de Próximos Passos

| # | Passo | Responsável | Prazo |
| :--- | :--- | :--- | :--- |
| 1 | Escrever `14_UI_UX_DESIGN.md` | Mateus | Imediato |
| 2 | Escrever `15_FLUXO_DO_JOGO.md` | Mateus | 1 dia |
| 3 | Escrever `16_MANUAL_DO_JOGADOR.md` | Mateus | 1 dia |
| 4 | Escrever `17_ROTEIRO_DAS_CARTAS.md` | Mateus | 2 dias |
| 5 | Escrever `18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md` | Mateus | 2 dias |
| 6 | Escrever o GDD Completo | Mateus | 3 dias |
| 7 | Montar o Protótipo Técnico | Mateus | 7 dias |
| 8 | Testar com 3-5 pessoas | Mateus | 2 dias |
| 9 | Validar com Educador | Professor interlocutor | 2 dias |
| 10 | Publicar e Divulgar | Mateus | 1 dia |

### 08.11.2. Fundamentação dos Próximos Passos

**Escrever os Arquivos 14-18**

**Por que:** Os documentos de apoio (14 a 18) são críticos para garantir a consistência do jogo. Sem eles, as cartas e Cartas de Aprendizado podem ser inconsistentes.

**Próximo passo:** Escrever o arquivo 14 (UI/UX) e seguir a ordem.

**Escrever o GDD Completo**

**Por que:** O GDD (Game Design Document) é o manual de desenvolvimento do jogo. Ele consolida todas as decisões de design.

**Próximo passo:** Escrever o GDD após a conclusão dos documentos de apoio.

**Montar o Protótipo Técnico**

**Por que:** O protótipo é a primeira versão jogável do jogo. Ele permite testar as mecânicas e validar o design.

**Próximo passo:** Montar o protótipo após a conclusão do GDD.

### 08.11.3. Referências

- SCHWABER, Ken; SUTHERLAND, Jeff. *The Scrum Guide*. 2020.
- RIES, Eric. *The Lean Startup*. New York: Crown Business, 2011.

---

## 08.12 — Considerações Finais

### 08.12.1. O Que Está Pronto

| Elemento | Status |
| :--- | :--- |
| **Documentação (00-13)** | ✅ Concluída |
| **Pesquisas (03)** | ✅ Concluída |
| **Design (04)** | ✅ Concluído |
| **Sistemas (05)** | ✅ Concluídos |
| **Referências (06)** | ✅ Concluídas |
| **Histórico (07)** | ✅ Concluído |
| **Produção (08)** | ✅ Concluída |
| **Stack (13)** | ✅ Definida |

### 08.12.2. O Que Falta

| Elemento | Status |
| :--- | :--- |
| **Arquivos 14-18** | ⏳ A iniciar |
| **GDD Completo** | ⏳ A iniciar |
| **Protótipo Técnico** | ⏳ A iniciar |
| **Testes** | ⏳ A iniciar |
| **Validação** | ⏳ A iniciar |
| **Publicação** | ⏳ A iniciar |

### 08.12.3. Mensagem Final

O projeto "O Planalto" está em um estágio avançado de design conceitual. A documentação está completa, o design está consolidado, os sistemas estão definidos. O próximo passo é transformar esse design em um produto jogável.

> "A jornada de mil milhas começa com um único passo." — Lao Tsé

**Vamos começar.**

---

## 08.13 — Referências

### 08.13.1. Produção

- BROOKS, Fred. *The Mythical Man-Month: Essays on Software Engineering*. Boston: Addison-Wesley, 1975.
- DRUCKER, Peter. *The Effective Executive*. New York: Harper & Row, 1966.
- RIES, Eric. *The Lean Startup*. New York: Crown Business, 2011.
- SCHELL, Jesse. *The Art of Game Design: A Book of Lenses*. Boca Raton: CRC Press, 2008.
- SCHWABER, Ken; SUTHERLAND, Jeff. *The Scrum Guide*. 2020.

### 08.13.2. Stack Técnica

- GODOT ENGINE. *Godot 4.7 Release*. 2026.
- GODOT MCP. *godot-editor-mcp*. PyPI, 2026.
- TUGCANTOPALOGLU. *godot-mcp*. GitHub, 2026.
- YANHUIFAIR. *godot-mcp*. npm, 2026.
- SUMMER ENGINE. *Claude for Godot*. 2026.
- CHUN92. *card-framework*. GitHub, 2026.

### 08.13.3. Validação

- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- SCRIVEN, Michael. *The Methodology of Evaluation*. 1967.
- NORMAN, Donald. *The Design of Everyday Things*. New York: Basic Books, 1988.
- KIRKPATRICK, Donald. *Evaluating Training Programs*. 1959.

### 08.13.4. Legal e Acessibilidade

- Lei 9.610/1998. *Lei de Direitos Autorais*. Brasília: Congresso Nacional, 1998.
- INPI. *Manual de Marcas*. Rio de Janeiro: INPI, 2026.
- MACE, Ron. *Universal Design: Housing for the Lifespan of All People*. 1988.
- WCAG. *Web Content Accessibility Guidelines*. 2023.

### 08.13.5. Riscos

- TIXHEAD REWORK. *Relatório de contexto consolidado*. 2026.
- PMI. *A Guide to the Project Management Body of Knowledge (PMBOK Guide)*. 2021.

---

**Última atualização:** Outubro de 2026
**Versão:** 2.0 (completa)
