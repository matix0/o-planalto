# O Planalto

**Jogo Educativo de Conscientização Política**

---

## Sobre o Projeto

**O Planalto** é um jogo educativo digital de curta duração (30-40 minutos) que busca **conscientizar politicamente** sem doutrinar. O jogador assume o papel de governante de uma cidade-estado fictícia e precisa tomar decisões que afetam a vida da população.

**Objetivo:** Mostrar que toda escolha política tem um preço, e que politização ≠ polarização.

**Público-alvo:** Jovens de 15 a 30 anos, especialmente periféricos e estudantes.

**Stack:** Godot 4.7 + MCP + Agentes de IA.

**Assets:** Apenas CC0 e domínio público.

---

## Documentação

A documentação completa está em [`docs/`](./docs/) e é publicada via GitHub Pages.

| # | Arquivo | Conteúdo |
| :--- | :--- | :--- |
| 00 | [Índice Geral](./docs/00_INDICE_GERAL.md) | Visão geral |
| 01 | [Contexto](./docs/01_CONTEXTO_E_MOTIVACAO.md) | Origem, objetivo |
| 02 | [Identidade](./docs/02_IDENTIDADE_E_NOMENCLATURA.md) | Nome, cores |
| 03 | [Pesquisas](./docs/03_PESQUISAS_E_ESTUDOS.md) | 20 pesquisas |
| 04 | [Design](./docs/04_DESIGN_DO_JOGO.md) | Medidores, cartas, finais |
| 05 | [Sistemas](./docs/05_SISTEMAS_E_MECANICAS.md) | Impeachment, eventos |
| 06 | [Referências](./docs/06_REFERENCIAS_E_INSPIRACOES.md) | Jogos, ferramentas |
| 07 | [Histórico](./docs/07_HISTORICO_DE_DECISOES.md) | Decisões |
| 08 | [Produção](./docs/08_PRODUCAO_E_PROXIMOS_PASSOS.md) | Stack, equipe |
| 09 | [Glossário](./docs/09_GLOSSARIO.md) | Termos |
| 10 | [Estilo](./docs/10_GUIA_DE_ESTILO_E_TOM.md) | Regras de escrita |
| 11 | [Atores](./docs/11_FICHAS_DOS_ATORES.md) | 20 atores |
| 12 | [Modos](./docs/12_FICHAS_DOS_MODOS.md) | 10 modos |
| 13 | [Arquitetura](./docs/13_ARQUITETURA_TECNICA.md) | Stack, dados |

**GitHub Pages:** https://matix0.github.io/o-planalto/

---

## Docs Vivos

Para agentes de IA, os docs vivos estão em [`gestao/`](./gestao/):

- [`gestao/estado.md`](./gestao/estado.md) — Estado atual
- [`gestao/decisoes.md`](./gestao/decisoes.md) — Decisões
- [`gestao/plano-de-acao.md`](./gestao/plano-de-acao.md) — Planos
- [`gestao/changelog.md`](./gestao/changelog.md) — Changelog
- [`gestao/producao.md`](./gestao/producao.md) — Riscos
- [`gestao/equipe.md`](./gestao/equipe.md) — 12 papéis

---

## Estrutura do Repositório

```text
o-planalto/
├── CLAUDE.md          # Contexto para agentes
├── README.md          # Este arquivo
├── .claude/
│   ├── agents/        # 12 subagentes
│   ├── commands/      # 6 comandos
│   ├── rules/         # Políticas
│   └── settings.json  # Permissões do projeto
├── gestao/            # Docs vivos (agentes)
│   ├── estado.md
│   ├── decisoes.md
│   ├── plano-de-acao.md
│   ├── changelog.md
│   ├── producao.md
│   └── equipe.md
├── docs/              # Documentação (GitHub Pages)
│   ├── _config.yml
│   └── 00-13 (14 arquivos; 00 é a página inicial)
├── assets/            # Assets CC0 (P-005)
├── dados/             # Dados do jogo em JSON (P-005)
├── cenas/             # Cenas do Godot (P-005)
├── scripts/           # Scripts GDScript (P-005)
└── addons/            # Addons, incl. MCP (P-005)
```

---

## Como Contribuir

1. Ler a documentação em `docs/`.
2. Consultar os docs vivos em `gestao/`.
3. Seguir as políticas em `.claude/rules/`.
4. Usar os comandos disponíveis (ex: `/fechar-plano`).

---

## Licença

A definir (Creative Commons ou MIT).

---

## Contato

- **Idealizador:** Mateus
- **Repositório:** https://github.com/matix0/o-planalto

---

**Última atualização:** Outubro de 2026

