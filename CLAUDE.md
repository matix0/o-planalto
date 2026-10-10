# CLAUDE.md — O Planalto

**Índice de contexto para agentes de IA. Máximo 200 linhas.**

## Sobre o Projeto

**O Planalto** é um jogo educativo de conscientização política, inspirado em *Reigns*, onde o jogador arrasta cartas para a esquerda ou direita.

| Item | Valor |
| :--- | :--- |
| **Objetivo** | Conscientização política, não doutrinação |
| **Público-alvo** | Jovens de 15 a 30 anos, periféricos e estudantes |
| **Stack** | Godot 4.7 + MCP + Agentes de IA |
| **Plataformas** | Mobile, Web e PC |
| **Assets** | Apenas CC0 e domínio público |

## Idioma

- Docs em PT-BR.
- Código, eventos e chaves em EN.

## Estrutura de Dados

- **Medidores:** 8 + 3 sub-medidores
- **Turnos:** 4 (4 anos)
- **Modos:** 10 institucionais
- **Atores:** 24 (4 categorias, D-081)
- **Cartas:** 342 (200 INST + 70 THEM + 72 ACT)
- **Eventos encadeados:** 108
- **Finais:** 26
- **Eixo Ideológico:** Modelo 9axes adaptado
- **Cores Partidárias:** Vermelho, Azul, Verde, Amarelo, Roxo, Laranja, Preto

## Documentação

- `docs/` — 19 arquivos de documentação (00-18), fonte do site
- `site/` — site público (Astro Starlight, D-077), gerado de `docs/`; metadados em `site/src/docs-map.mjs`
- `gestao/` — 6 docs vivos (estado, decisões, planos, changelog, produção, equipe)

## Regras de Governança

1. Só o PO decide. Agentes propõem, nunca decidem.
2. Alternativas (2-4) com prós, contras e recomendação.
3. Economia de tokens: curto, bullets, tabelas.
4. Nenhum código ou arquivo sem ordem explícita.
5. Citar `arquivo:linha` ou marcar `[não verificado]`.

## Formato de Resposta ao PO

```
Fase: [Fase atual do projeto]
Insumos: [O que foi consultado]
Decisões pendentes (≤5):
  - [Decisão] — [Alternativa A / B / C]
Próximo passo: [O que fazer em seguida]
```

## Política de Subagentes

- Máximo 3 em paralelo.
- Notas incrementais desde o início.
- Retorno ≤ 400 palavras com citações.
- Aprovação do PO fora de plano.

## Comandos

| Comando | Descrição |
| :--- | :--- |
| `/fechar-plano` | Audita plano, registra decisões, atualiza changelog e estado |
| `/sync-tech` | Sincroniza arquitetura técnica (arquivo 13) |
| `/sync-docs` | Sincroniza toda a documentação (00-13) |
| `/validate-cards` | Valida as 342 cartas |
| `/validate-finals` | Valida os 26 finais |
| `/publish-docs` | Publica a documentação no GitHub Pages |

## Subagentes

| Papel | Missão | Modelo |
| :--- | :--- | :--- |
| GP | Fases, escopo, riscos | Sonnet |
| GD | Loops, regras, GDD | **Opus** |
| PSI | Ética, manipulação | **Opus** |
| GF | Game feel | Sonnet |
| UX | Telas, HUD, acessibilidade | Sonnet |
| DEV | Viabilidade, GDScript | Sonnet |
| ARQ | Arquitetura, ADRs | **Opus** |
| ECO | Economia, simulação | **Opus** |
| QA | Testes, critérios | Sonnet |
| TA | Assets CC0, shaders | Sonnet |
| SFX | Áudio CC0, mixagem | Sonnet |
| AIW | Prompts, CLAUDE.md | Sonnet |

Detalhes dos papéis: `gestao/equipe.md`.

## Stack Técnica

- **Engine:** Godot 4.7 (instalado: 4.6 — risco RT-08)
- **MCP:** `tugcantopaloglu/godot-mcp` (D-053) — configuração adiada para o P-005 (D-072)
- **Agente:** Claude Code (Opus 5.5)
- **Fontes:** Poppins (títulos) + Inter (corpo)
- **Assets:** Kenney, OpenGameArt, FreeMusicArchive, Google Fonts

## Referências Rápidas

- `docs/13_ARQUITETURA_TECNICA.md` — Stack e estrutura de dados
- `docs/04_DESIGN_DO_JOGO.md` — Medidores, cartas, finais
- `docs/10_GUIA_DE_ESTILO_E_TOM.md` — Regras de escrita
- `gestao/estado.md` — Estado atual (carregado abaixo)

## Estado Atual

@gestao/estado.md

---

**Última atualização:** 2026-10-09
