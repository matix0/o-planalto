# Changelog — O Planalto

**Histórico de mudanças do projeto.**

Formato: [Keep a Changelog](https://keepachangelog.com/).
Versionamento: [SemVer](https://semver.org/).

---

## [Unreleased]

### Adicionado
- Avaliação consolidada dos wireframes (`.claude/notas/avaliacao-wireframes/consolidado.md`) e decisões D-161 a D-169: rastro no medidor, revisão do ciano pelo TA, dica do toque, campo `quem_fala`, seletor 16/18/20/24, filete branco na calibração, Esc em 2 passos, Senado só com a meta, propostas P1/P2
- Docs 14, 14A, GDD 05 e doc 17 ajustados; prompt de wireframes com correções da 2ª rodada
- Seção GodotPrompter no `CLAUDE.md`
- Prompt da rodada final de wireframes (`gestao/prompts/wireframes-rodada-final.md`) com links das skills GodotPrompter v1.13.2; decisões D-170 a D-173 (viewport, coluna do PC, paleta neutra, modais A/B)
- GDD mestre 2.0 aprovado (P-013, D-129)
- Simulação de balanceamento do ECO (`.claude/notas/P-013-eco.md`); faixas dos §7 confirmadas (D-124, D-125)
- Citações dos finais Barbárie, Autogestão, Golpe Militar, República Soberana, Fome e Renúncia (categoria "Saída", D-127)
- Cartas da cena de impeachment INST-143 a 145 e APR-143 a 145
- Decisões D-124 a D-129
- `gdd/sistemas/`: GDDs 05 Cartas, 06 Sorteio, 07 Atores, 08 Eventos, 09 Desinformação, 10 Estado da partida — 8 seções cada (P-012); os 10 sistemas concluídos
- Final "Renúncia" (28º, ao abandonar o mandato), salvamento automático e "Continuar" (D-121, D-122)
- Campos de carta: `atores`, `eventos` (na opção), `tecnica` e `reacao` (modo Influenciador); tipo `Impeachment`
- Decisões D-098 a D-123
- Kit do GDD (P-011, D-093, adaptado do Claude Code Game Studios, MIT): regra `.claude/rules/design-docs.md` e comandos `/mapear-sistemas`, `/gdd-sistema`, `/revisar-gdds`
- `gdd/sistemas/`: índice de 10 sistemas (D-063) e GDDs 01 Medidores, 02 Finais, 03 Impeachment, 04 Eixo — 8 seções cada, com simulações do ECO e pareceres do GD
- Citações dos finais verificadas na web (17 com fonte; 4 com fonte fraca aceita; 5 sem citação)
- Campos `Teste A/B` nas cartas da cena de impeachment e `Eixo A/B` nas 22 cartas; vetores de eixo na calibração
- Decisões D-094 a D-096

- `gdd/GDD.md` 1.2 — documento mestre do GDD, fora do site (D-081)
- Doc 14 reescrito do zero: retrato, HUD de ícones, cor por opção, pontos de efeito, animações (GF), paleta ciano das faixas (TA), cena de impeachment (P-010)
- Doc 16 em duas partes: guia completo + tutorial de 4 telas (P-010)
- Doc 18: APR-161, APR-181, APR-THEM-001, APR-ATOR-001; seção "Rascunho" com 127 APRs; links verificados em 17 das 22 cartas (D-091)
- Decisões D-081 a D-092

### Alterado
- APR-002, 041, 061, 121 e ATOR-001 com dados verificados; doc 12 com a conexão dos 24 atores; `/validate-cards` alinhado aos GDDs 05-09
- Campo único `efeitos` com sinal (sai `custo`); lado sorteado a cada exibição; custo real por cor (D-098 a D-100)
- Atores com código `ACT-xxx`, satisfação inicial 50, cartas por função (ataque, exigência, oferta) (D-104 a D-108)
- Eventos só das opções, atraso de 1-2 turnos, disparo no início do turno; tabelas fixas removidas (D-109 a D-112, revisa D-024)
- Sorteio: 7 cartas por turno, sem repetição, teto de 3 obrigatórias, 1 por modo (D-113 a D-117; resolve P-4)
- GDD mestre §4.2, §4.4, §5.3, §5.4, §6.2-6.4, §6.8, §7.2, §8.5, §12.2 alinhados aos GDDs de sistema
- `/sync-docs`: docs 00, 02, 04, 05, 07 (nota), 08, 09, 11, 12, 13, 14, 15, `CLAUDE.md` e `/validate-finals` alinhados às D-098 a D-123 (atores `ACT-xxx`, 7 cartas, 28 finais, eventos nas opções, salvamento)
- Sub-medidores removidos (D-094); Consciência inicial 40; calibração ±5; bônus por equilíbrio +3 com todos > 45; fim do Ano 4 sem fechamento
- 27 finais (D-096): +Paralisia Fiscal, +Mandato Comum, −Protecionismo Soberano; finais em 100 só os 3 de Captura (≥ 95); `Capital Político` em 0 abre o impeachment (D-095)
- Impeachment: cena de 5 cartas extras com testes por opção e apoio; absolvição ~37% no gatilho principal
- Eixo: vetor por opção, radar de 8 pontas "disse × governou", revelação dupla
- Cenário passa a ser o Brasil, jogador é o Presidente (D-086, D-087); partida de ~15 min (D-088); medidor em 0 encerra na hora (D-089)
- Doc 17: Opção A/B com lado sorteado e cor por opção (D-084, D-092); Aprendizado aponta `APR-xxx` (D-090); 22 cartas
- Doc 13: esquema da carta com `opcao_a`/`opcao_b`, `cor` por opção e `aprendizado_id`; eixo por lado removido (vira pendência P-9)
- Doc 04: elenco substituído pelos 24 atores do doc 11 (D-085); docs 00, 02, 05, 08, 09, 12 alinhados
- `/validate-cards`: regras de cor por opção, APR e saldo por cor

### Corrigido
- Doc 12: relatores do impeachment de 2016 e "52 mensagens" (P-011)
- GDD mestre: trechos desatualizados apontados pelo `/revisar-gdds`
- Alucinações dos docs 14-18 (P-010): fatos errados (Anastasia, expectativa de vida, Marco Temporal, salário mínimo, juros, mortes por polícia, Master), consequências trocadas/duplicadas, limiares removidos (D-082)

### Removido
- Limiares de proteção por ano (D-082); rótulos "esquerda/direita" e "projeto bolsonarista/lulista" do manual

- Docs 14–18 (UI/UX, Fluxo, Manual, Roteiro das Cartas, Roteiro das Cartas de Aprendizado), escritos pelo PO; publicados na nova seção "Roteiros" do site (P-003)
- Site público em `site/` (Astro Starlight): home com as 6 seções, menu, sumário, anterior/próximo, busca local em pt-BR, temas claro/escuro (P-009, D-077)
- Página "Sobre e metodologia", aviso de conteúdo em 01–04 e 09, banner "incompleto" + `noindex` em 04, 05, 06, 08 e 10 (D-075, D-078)
- Fonte "Planalto Diagrama" (derivada da Noto Sans Mono, OFL) para alinhar os diagramas ASCII (P-009)
- Deploy por GitHub Actions (`.github/workflows/site.yml`)
- 12 subagentes em `.claude/agents/` (P-008)
- Comandos `/sync-tech`, `/sync-docs`, `/validate-cards`, `/validate-finals`, `/publish-docs` (P-008)
- Regras `subagentes.md`, `verificacao.md`, `isolamento.md` (P-008)
- `.claude/settings.json`, `.gitignore`, `docs/_config.yml` (P-008)
- Repositório git (D-074)
- Estrutura de docs vivos (6 arquivos em `gestao/`)
- Política de subagentes (`.claude/rules/`)
- Skill `/fechar-plano`
- 12 subagentes especializados

### Alterado
- Docs vivos movidos de `docs/` para `gestao/` (D-071)
- `CLAUDE.md` reescrito; estado carregado via `@gestao/estado.md` (P-008)
- `00_INDICE_GERAL.md` virou página inicial do Pages e lista 00-13 (P-008)
- Nome do projeto: "O Preço" → "O Planalto"
- Stack: Godot 4.6 → Godot 4.7

### Removido
- `docs/_config.yml` e front matter `permalink` do Jekyll (site agora é Starlight)
- `.claude/rules/subagents.md` (duplicava `gestao/equipe.md`)

### Corrigido
- `docs/10` restaurado na íntegra (texto enviado pelo PO); nenhum doc incompleto restante
- `docs/05`, `docs/06` e `docs/08` restaurados na íntegra (texto enviado pelo PO)
- `docs/04_DESIGN_DO_JOGO.md` restaurado na íntegra (04.01–04.16), texto enviado pelo PO
- `docs/12` e `docs/13`: título residual de chat (`# 📄 …md`); `docs/13`: bloco de código sem fechamento e resumo de chat no fim
- Referências a `Docs/` inexistente (README, `/fechar-plano`, docs vivos)
- `/fechar-plano`, `leitura.md`: blocos colados quebrados
- `docs/13` §13.2.5: instalação do MCP (`@cradial` → tugcantopaloglu, D-072); §13.7: pasta `docs/`

---

## [0.1.0] — 2026-10-09

### Adicionado

**Documentação Principal (14 arquivos):**
- `docs/00_INDICE_GERAL.md` — Visão geral
- `docs/01_CONTEXTO_E_MOTIVACAO.md` — Origem, objetivo, público
- `docs/02_IDENTIDADE_E_NOMENCLATURA.md` — Nome, cores, plataforma
- `docs/03_PESQUISAS_E_ESTUDOS.md` — 20 pesquisas temáticas
- `docs/04_DESIGN_DO_JOGO.md` — Medidores, turnos, modos, atores, cartas, finais
- `docs/05_SISTEMAS_E_MECANICAS.md` — Impeachment, eventos, pesos, eixo
- `docs/06_REFERENCIAS_E_INSPIRACOES.md` — Jogos e ferramentas
- `docs/07_HISTORICO_DE_DECISOES.md` — Adotado, descartado, aberto
- `docs/08_PRODUCAO_E_PROXIMOS_PASSOS.md` — Stack, equipe, cronograma
- `docs/09_GLOSSARIO.md` — Termos técnicos
- `docs/10_GUIA_DE_ESTILO_E_TOM.md` — Regras de escrita
- `docs/11_FICHAS_DOS_ATORES.md` — 20 fichas de atores
- `docs/12_FICHAS_DOS_MODOS.md` — 10 fichas de modos
- `docs/13_ARQUITETURA_TECNICA.md` — Stack Godot, estrutura de dados

**Docs Vivos (6 arquivos):**
- `gestao/estado.md` — Estado atual
- `gestao/decisoes.md` — Decisões numeradas
- `gestao/plano-de-acao.md` — Planos numerados
- `gestao/changelog.md` — Este arquivo
- `gestao/producao.md` — Riscos e lições
- `gestao/equipe.md` — 12 papéis

**Configuração de IA:**
- `CLAUDE.md` — Índice de contexto
- `.mcp.json` — Configuração MCP do Godot
- `.claude/agents/` — 12 subagentes
- `.claude/commands/` — 7 comandos
- `.claude/rules/` — Políticas

**GitHub Pages:**
- `docs/_config.yml` — Configuração do Jekyll
- `docs/index.md` — Página inicial
- `.github/workflows/deploy.yml` — Deploy automático

### Decisões Aprovadas

- D-001 a D-062 (ver `gestao/decisoes.md`)

### Riscos Documentados

- RP-01 a RP-08 (ver `gestao/producao.md`)

---

## [0.0.1] — 2026-10-01

### Adicionado

- Projeto iniciado
- Prompt inicial do projeto
- Primeiras pesquisas temáticas
- Definição do escopo inicial

---

## Como Usar Este Changelog

- **Mudanças menores:** adicionar em `[Unreleased]`
- **Novas versões:** criar seção com data
- **Categorias:** `Adicionado`, `Alterado`, `Removido`, `Corrigido`, `Segurança`
- **Versionamento:** SemVer (MAJOR.MINOR.PATCH)

---

## Próximas Versões

| Versão | Descrição Prevista |
| :--- | :--- |
| **0.2.0** | Arquivos 14-18 escritos |
| **0.3.0** | GDD completo |
| **0.4.0** | Protótipo técnico |
| **1.0.0** | Jogo publicado |

---

**Última atualização:** 2026-10-09