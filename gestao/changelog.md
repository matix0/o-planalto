# Changelog — O Planalto

**Histórico de mudanças do projeto.**

Formato: [Keep a Changelog](https://keepachangelog.com/).
Versionamento: [SemVer](https://semver.org/).

---

## [Unreleased]

### Adicionado
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
- `.claude/rules/subagents.md` (duplicava `gestao/equipe.md`)

### Corrigido
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