# 07 — Histórico de Decisões

**Documento de Registro das Decisões do Projeto "O Planalto"**

Este documento consolida o histórico de todas as decisões tomadas ao longo do desenvolvimento do projeto, incluindo o que foi adotado, o que foi descartado, o que está em aberto, as auditorias realizadas e as correções aplicadas. Cada seção apresenta a fundamentação que embasa cada decisão.

---

## 07.1. Fundamentação Teórica sobre Registro de Decisões

### 07.1.1. Por Que Documentar Decisões

Documentar decisões é uma prática fundamental em projetos complexos, conhecida como **Architecture Decision Records (ADRs)**. Ela serve a três propósitos:

1. **Memória institucional** — evita que decisões sejam refeitas ou esquecidas.
2. **Rastreabilidade** — permite entender *por que* uma decisão foi tomada, não apenas *qual* foi.
3. **Onboarding** — facilita a entrada de novos membros na equipe.

> "Uma decisão não documentada é uma decisão que será questionada novamente." — Michael Nygard, criador do conceito de ADR

### 07.1.2. Metodologia de Registro

Cada decisão é registrada com:

| Campo | Descrição |
| :--- | :--- |
| **Elemento** | O que foi decidido |
| **Motivo** | Por que foi decidido |
| **Status** | Adotado, Descartado ou Em Aberto |
| **Fundamentação** | Base teórica ou prática |

### 07.1.3. Versionamento do Projeto

| Versão | Data | Descrição |
| :--- | :--- | :--- |
| **v1** | Outubro de 2026 | Proposta inicial do projeto |
| **v2** | Outubro de 2026 | Auditoria e correções de consistência |
| **v3** | Outubro de 2026 | Correções do Professor Alisson |
| **v4** | Outubro de 2026 | Renomeação para "O Planalto" |
| **v5** | Outubro de 2026 | Definição da stack Godot 4.7 + MCP |
| **v6** | Outubro de 2026 | Documentação completa e modular |

---

## 07.2. O Que Foi Adotado

### 07.2.1. Tabela de Decisões Adotadas

| # | Elemento | Decisão | Fundamentação |
| :--- | :--- | :--- | :--- |
| 1 | **Nome** | "O Planalto" | Remete à política brasileira sem ser panfletário |
| 2 | **Medidores** | 8 medidores + 3 sub-medidores econômicos | Cobertura temática e complexidade sistêmica |
| 3 | **Estrutura de Turnos** | 4 turnos (4 anos), 6-8 cartas por turno | Teoria do Flow e contexto escolar |
| 4 | **Modos** | 10 modos institucionais | Cobertura de todas as instituições |
| 5 | **Atores** | 14 atores base + 6 de expansão | Representação de todos os tipos sociais |
| 6 | **Cartas** | 340 cartas inventariadas | 200 institucionais + 70 temáticas + 70 de atores |
| 7 | **Finais** | 26 finais consolidados | Cobertura de todas as possibilidades de governo |
| 8 | **Impeachment** | Cena de golpe, a partir do Ano 2 | Análise do impeachment de 2016 |
| 9 | **Eventos Encadeados** | 78 eventos mapeados | Sistema de "Ripple Chains" |
| 10 | **Pesos e Gatilhos** | Prioridade narrativa | Design de *Reigns* adaptado |
| 11 | **Cartas de Aprendizado** | Estrutura de 4 blocos, 16 exemplos escritos | Pedagogia freiriana e microlearning |
| 12 | **Calibração** | Bússola 2026 (6 perguntas) | Ferramenta de bússola eleitoral |
| 13 | **Modo Influenciador** | IAgora? (teoria da inoculação) | Exposição controlada à desinformação |
| 14 | **Eixo Ideológico** | Modelo 9axes adaptado | Representação multidimensional |
| 15 | **Balanceamento** | Menos punitivo | Teoria do Flow e erro como aprendizado |
| 16 | **Cores Partidárias** | Sistema de cores para sinalizar espectro | Psicologia das cores na política |
| 17 | **Stack** | Godot 4.7 + MCP + Agentes de IA | Ecossistema maduro para desenvolvimento com IA |
| 18 | **Assets** | Apenas CC0 e domínio público | Ética e viabilidade |
| 19 | **Plataforma** | Mobile, Web e PC | Acessibilidade e distribuição |
| 20 | **Modo** | Singleplayer, sem salvamento | Foco na experiência e simplicidade técnica |

### 07.2.2. Fundamentação das Decisões Principais

#### Nome "O Planalto"

**Motivo:** Remete diretamente à política brasileira (Palácio do Planalto) sem carregar o peso de um símbolo partidário.

**Fundamentação:** Pesquisas sobre naming de jogos sérios mostram que títulos eficazes são curtos, memoráveis e não polarizam. "O Planalto" atende a todos os critérios.

#### Estrutura em 4 Turnos

**Motivo:** O jogo é dividido em 4 turnos, um por ano de mandato.

**Fundamentação:** A escolha se baseia em:
1. **Teoria do Flow (Csikszentmihalyi)** — a dificuldade aumenta gradualmente.
2. **Scaffolding (Wood, Bruner e Ross)** — cada fase fornece suporte para a próxima.
3. **Zona de Desenvolvimento Proximal (Vygotsky)** — os desafios são progressivos, mas alcançáveis.
4. **Aprendizagem Experiencial (Kolb)** — o ciclo de aprendizagem é aplicado em cada turno.

#### Impeachment como Cena de Golpe

**Motivo:** O impeachment não é negociação. É uma cena de golpe.

**Fundamentação:** A análise do impeachment de Dilma Rousseff em 2016 mostrou que o processo foi um **golpe parlamentar, jurídico e midiático**. O relator Antonio Anastasia admitiu que as pedaladas fiscais não configuravam crime.

#### Stack Godot 4.7 + MCP + Agentes de IA

**Motivo:** A stack foi escolhida por sua maturidade e integração com agentes de IA.

**Fundamentação:** O ecossistema MCP para Godot está maduro em 2026, com múltiplos servidores oferecendo 120+ ferramentas. Godot é adotado como "best engine for AI-assisted development".

---

## 07.3. O Que Foi Descartado

### 07.3.1. Tabela de Decisões Descartadas

| # | Elemento | Motivo do Descarte | Alternativa Adotada |
| :--- | :--- | :--- | :--- |
| 1 | **9 medidores** | Muitos medidores sobrecarregam o jogador | 8 medidores + 3 sub-medidores |
| 2 | **8 turnos** | Muitos turnos fragmentam a experiência | 4 turnos (4 anos) |
| 3 | **Pesos matemáticos** | Transformam a experiência em jogo de números | Prioridade narrativa |
| 4 | **Impeachment como negociação** | Transforma um golpe em barganha | Cena de golpe |
| 5 | **Aliança Externa como medidor** | Redundante com Soberania e Caixa | Integrado a Soberania e Caixa |
| 6 | **Paixão Nacional como medidor** | Poderia ser um "botão mágico" | Evento especial |
| 7 | **Citações rebuscadas** | Afastam o público jovem | Linguagem direta e brutal |
| 8 | **Eixo ideológico binário** | Reforça a polarização | Modelo 9axes adaptado |
| 9 | **Terra Canarinha** | Pode soar ufanista | "O Planalto" |
| 10 | **Cidade Maravilhosa** | Muito associado ao Rio | "O Planalto" |
| 11 | **Vila Nova** | Genérico | "O Planalto" |
| 12 | **O Preço** | Pode ser pesado demais | "O Planalto" |
| 13 | **IA generativa para arte** | Questão ética e de qualidade | Assets CC0 |
| 14 | **HTML/JS** | Menos integração com MCP e editor visual | Godot 4.7 |

### 07.3.2. Fundamentação dos Descartes Principais

#### Por Que Descartar o Eixo Ideológico Binário

**Motivo:** O eixo binário "esquerda vs. direita" reforça a polarização que o jogo busca combater.

**Fundamentação:** O modelo 9axes permite uma representação **multidimensional** do espectro político, evitando a dicotomia simplista.

> "O espectro político é multidimensional. Reduzi-lo a esquerda-direita é uma simplificação grosseira." — The Political Compass

#### Por Que Descartar a IA Generativa para Arte

**Motivo:** O projeto não usará IA generativa para arte, música ou assets.

**Fundamentação:** A escolha é ética e prática:
1. **Ética** — respeitar o trabalho de artistas humanos.
2. **Qualidade** — assets CC0 de qualidade estão disponíveis.
3. **Consistência** — assets públicos têm estilo coeso.

#### Por Que Descartar o HTML/JS como Stack Principal

**Motivo:** O ecossistema MCP para JavaScript é menos maduro que o de Godot.

**Fundamentação:** A pesquisa mostrou que o Godot tem 120+ ferramentas MCP disponíveis, enquanto o JavaScript tem menos opções. Além disso, o Godot tem um editor visual que pode ser controlado por agentes de IA.

---

## 07.4. O Que Está em Aberto

### 07.4.1. Tabela de Itens em Aberto

| # | Item | Status | Próximo Passo |
| :--- | :--- | :--- | :--- |
| 1 | **Nome do Jogo** | ✅ "O Planalto" | Fechado |
| 2 | **Identidade Visual** | ⏳ Esboçada | Detalhar no arquivo 14 |
| 3 | **GDD Completo** | ⏳ A ser escrito | Após documentos de apoio |
| 4 | **Protótipo Técnico** | ⏳ Não iniciado | Após GDD |
| 5 | **Ordem das Cartas** | ⏳ A definir | Definir no arquivo 15 |
| 6 | **Validação Pedagógica** | ⏳ A ser feita | Após protótipo |
| 7 | **Parcerias** | ⏳ A serem buscadas | Politize!, IAgora?, escolas |
| 8 | **Questões Legais** | ⏳ A serem discutidas | Citações de Bolsonaro, Hitler, Mussolini |
| 9 | **Avisos de Conteúdo** | ⏳ A serem definidos | Trigger warnings |
| 10 | **Acessibilidade** | ⏳ A ser definida | Modo daltônico, leitor de tela |
| 11 | **Documentos de Apoio** | ⏳ A serem escritos | Arquivos 09 a 23 |

### 07.4.2. Fundamentação dos Itens em Aberto

#### Validação Pedagógica

**Por que está em aberto:** A validação pedagógica depende do protótipo técnico. Só é possível validar o jogo quando ele estiver jogável.

**Próximo passo:** Após o protótipo, testar com 3-5 pessoas e validar com o Professor interlocutor.

#### Questões Legais

**Por que está em aberto:** As citações de Bolsonaro, Hitler e Mussolini podem gerar processos. É preciso consultar um advogado.

**Próximo passo:** Consultar um advogado especializado em direito autoral e difamação.

#### Acessibilidade

**Por que está em aberto:** A acessibilidade depende das decisões de UI/UX, que ainda não foram tomadas.

**Próximo passo:** Definir no arquivo 14 (UI/UX Design).

---

## 07.5. Auditoria e Correções (v2)

### 07.5.1. Contexto da Auditoria

A auditoria v2 foi realizada após a consolidação inicial do projeto, com o objetivo de identificar inconsistências, lacunas e erros factuais.

### 07.5.2. Tabela de Correções

| # | Correção | Status | Fundamentação |
| :--- | :--- | :--- | :--- |
| 1 | Número de medidores: 7 → 8 | ✅ | Inclusão do medidor `Verdade` |
| 2 | Número de cartas: 270 → 340 | ✅ | Auditoria do baralho |
| 3 | Impeachment: negociação → cena de golpe | ✅ | Análise do impeachment de 2016 |
| 4 | Eventos encadeados: genéricos → conectados com temas reais | ✅ | Sistema de "Ripple Chains" |
| 5 | Pesos: matemáticos → prioridade narrativa | ✅ | Design de *Reigns* adaptado |
| 6 | Finais: 24 → 26 | ✅ | Inclusão de finais de cuidado |
| 7 | Balanceamento: punitivo → menos punitivo | ✅ | Teoria do Flow |
| 8 | Eixo ideológico: binário → suavizado | ✅ | Modelo 9axes |
| 9 | 145 cartas ajustadas com `Verdade` | ✅ | Auditoria do baralho |
| 10 | Cartas de Aprendizado: estrutura definida | ✅ | Pedagogia freiriana |

### 07.5.3. Fundamentação das Correções

#### Inclusão do Medidor `Verdade`

**Motivo:** O medidor `Verdade` foi adicionado para capturar a integridade do debate público.

**Fundamentação:** A desinformação é uma arma de destruição da democracia. Sem um medidor que capte isso, o jogo não refletiria a realidade.

#### Reformulação do Impeachment

**Motivo:** O impeachment foi reformulado de "negociação" para "cena de golpe".

**Fundamentação:** A análise do impeachment de 2016 mostrou que o processo não foi uma negociação, mas um golpe parlamentar, jurídico e midiático.

---

## 07.6. Correções do Professor Alisson (v3)

### 07.6.1. Contexto das Correções

O Professor Alisson revisou o "Livro do Projeto" e fez 26 comentários com sugestões de correção e aprimoramento. Todas foram incorporadas.

### 07.6.2. Tabela de Correções

| # | Correção | Status | Onde foi incorporado |
| :--- | :--- | :--- | :--- |
| 1 | Nome do jogo deve remeter à política | ✅ "O Planalto" | Arquivo 02 |
| 2 | Adicionar sistema de cores partidárias | ✅ | Arquivo 02 |
| 3 | Adicionar formação do Brasil como exportador de commodities | ✅ | Arquivo 03 |
| 4 | Adicionar domínio chinês sobre o Brasil | ✅ | Arquivo 03 |
| 5 | Adicionar educação integral vs. punitivismo | ✅ | Arquivo 03 |
| 6 | Adicionar privatizações como recurso eleitoral | ✅ | Arquivo 03 |
| 7 | Adicionar boom de commodities no governo Lula | ✅ | Arquivo 03 |
| 8 | Adicionar governabilidade neoliberal | ✅ | Arquivo 03 |
| 9 | Corrigir relação impeachment-bolsonarismo (crise, não causa) | ✅ | Arquivo 03 |
| 10 | Adicionar contradição: pedaladas legalizadas após impeach | ✅ | Arquivo 03 |
| 11 | Corrigir números das bancadas | ✅ | Arquivo 03 |
| 12 | Criar Bancada Progressista e de Intervenção Estatal | ✅ | Arquivo 03 |
| 13 | Republicanos como neoliberal | ✅ | Arquivo 03 |
| 14 | Corrigir perfil da mídia (liberal-progressista) | ✅ | Arquivo 03 |
| 15 | Reforçar redes sociais vs. TV | ✅ | Arquivo 03 |
| 16 | Adicionar mídia como beneficiária das privatizações | ✅ | Arquivo 03 |
| 17 | Adicionar Carta Capital e Quebrando o Tabu | ✅ | Arquivo 03 |
| 18 | Adicionar Neymar | ✅ | Arquivo 03 |
| 19 | Revisar medidores cheios (ambíguos) | ✅ | Arquivo 04 |
| 20 | Ajustar impeachment para Ano 2 | ✅ | Arquivo 05 |
| 21 | Adotar modelo 9axes/11axes | ✅ | Arquivo 05 |
| 22 | Criar atores com recompensas específicas | ✅ | Arquivo 04 |
| 23 | Adicionar dados sobre população carcerária | ✅ | Arquivo 03 |
| 24 | Adicionar Josué de Castro como fonte | ✅ | Arquivo 03 |
| 25 | Adicionar Marco Temporal | ✅ | Arquivo 03 |
| 26 | Adicionar desemprego, inflação e juros | ✅ | Arquivo 03 |

### 07.6.3. Fundamentação das Correções

#### Corrigir a Relação Impeachment-Bolsonarismo

**Motivo:** O texto anterior sugeria que o impeachment causou o bolsonarismo. A correção estabelece que a **crise econômica e política** foi a causa.

**Fundamentação:** Soluções fascistas sempre surgem em meio a crises. O impeachment foi um **sintoma** da crise, não a causa.

#### Adotar Modelo 9axes

**Motivo:** O eixo binário "esquerda vs. direita" reforça a polarização.

**Fundamentação:** O modelo 9axes permite uma representação **multidimensional** do espectro político.

#### Adicionar Desemprego, Inflação e Juros

**Motivo:** O Professor Alisson sugeriu que esses indicadores econômicos tornariam o jogo mais rico.

**Fundamentação:** "Só essa dinâmica sozinha já daria um jogo foda." — Professor Alisson

---

## 07.7. Lições Aprendidas

### 07.7.1. A Importância da Revisão Crítica

Os comentários do Professor Alisson foram fundamentais para corrigir erros factuais, ajustar números e adicionar temas que faltavam. A revisão crítica é essencial para a qualidade do projeto.

**Lição:** Toda documentação deve passar por revisão externa antes de ser considerada final.

### 07.7.2. A Importância da Fundamentação Teórica

A pesquisa sobre jogos sérios, pedagogia e ciência política forneceu a base para decisões de design que, de outra forma, seriam arbitrárias.

**Lição:** Decisões de design devem ser fundamentadas em teoria e pesquisa, não em intuição.

### 07.7.3. A Importância da Simplicidade

A redução de 9 para 8 medidores, de 8 para 4 turnos, e a simplificação do sistema de pesos mostram que **menos é mais** em jogos educativos.

**Lição:** A simplicidade é uma escolha pedagógica. O jogo deve ser fácil de entender, mas difícil de dominar.

### 07.7.4. A Importância da Acessibilidade

O balanceamento menos punitivo, os limiares de proteção e os mecanismos de recuperação garantem que o jogo não afaste o jogador.

**Lição:** Um jogo educativo que é punitivo demais afasta o jogador. O erro deve ser informativo, não punitivo.

### 07.7.5. A Importância da Modularidade

A separação da documentação em arquivos menores permite que cada parte seja editada independentemente.

**Lição:** Documentação modular é mais fácil de manter e atualizar.

---

## 07.8. Próximas Decisões

### 07.8.1. Decisões Pendentes

| # | Decisão | Prazo | Responsável |
| :--- | :--- | :--- | :--- |
| 1 | Escrever os documentos 09, 10, 11, 12 | Antes do GDD | Equipe |
| 2 | Escrever os documentos 14, 15, 16, 17, 18 | Antes do protótipo | Equipe |
| 3 | Escrever o GDD completo | Após documentos de apoio | Equipe |
| 4 | Montar o protótipo técnico | Após GDD | Equipe |
| 5 | Testar com 3-5 pessoas | Após protótipo | Equipe |
| 6 | Validar com educador | Após testes | Professor interlocutor |
| 7 | Publicar e divulgar | Após validação | Equipe |

### 07.8.2. Fundamentação das Próximas Decisões

#### Escrever os Documentos de Apoio

**Por que:** Os documentos de apoio (09 a 12) são críticos para garantir a consistência do jogo. Sem eles, as cartas e Cartas de Aprendizado podem ser inconsistentes.

**Próximo passo:** Escrever o arquivo 09 (Glossário) e seguir a ordem de produção.

#### Escrever o GDD Completo

**Por que:** O GDD (Game Design Document) é o manual de desenvolvimento do jogo. Ele consolida todas as decisões de design.

**Próximo passo:** Escrever o GDD após a conclusão dos documentos de apoio.

---

## 07.9. Versionamento do Projeto

### 07.9.1. Histórico de Versões

| Versão | Data | Descrição | Arquivos Afetados |
| :--- | :--- | :--- | :--- |
| **v1** | Out/2026 | Proposta inicial do projeto | — |
| **v2** | Out/2026 | Auditoria e correções de consistência | 00-08, 13 |
| **v3** | Out/2026 | Correções do Professor Alisson | 00-08, 13 |
| **v4** | Out/2026 | Renomeação para "O Planalto" | 00-08, 13 |
| **v5** | Out/2026 | Definição da stack Godot 4.7 + MCP | 13 |
| **v6** | Out/2026 | Documentação completa e modular | 00-08, 13 |

### 07.9.2. Próximas Versões

| Versão | Data Prevista | Descrição |
| :--- | :--- | :--- |
| **v7** | Out/2026 | Documentos de apoio críticos (09-12) |
| **v8** | Nov/2026 | Documentos de apoio importantes (14-18) |
| **v9** | Nov/2026 | GDD Completo |
| **v10** | Nov/2026 | Protótipo Técnico |

---

## 07.10. Referências

- NYGARD, Michael. *Documenting Architecture Decisions*. 2011.
- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.
- FREIRE, Paulo. *Pedagogia do Oprimido*. Rio de Janeiro: Paz e Terra, 1968.
- KOLB, David. *Experiential Learning*. Englewood Cliffs: Prentice-Hall, 1984.
- VYGOTSKY, Lev. *A Formação Social da Mente*. São Paulo: Martins Fontes, 1984.
- WOOD, David; BRUNER, Jerome; ROSS, Gail. *The Role of Tutoring in Problem Solving*. Journal of Child Psychology and Psychiatry, 1976.
- Political Compass. *The Political Compass*. 2001.
- 9axes. *Teste de espectro político*. 2026.
- Alisson, Professor. *Comentários sobre o Livro do Projeto*. 2026.
- Revista Acervo (Arquivo Nacional). *Os sentidos do golpe*. Rio de Janeiro: Arquivo Nacional, 2025.