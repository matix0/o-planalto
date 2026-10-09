# Produção — O Planalto

**Riscos, lições aprendidas e boas práticas do projeto.**

---

## Riscos de Processo com IA

| ID | Risco | Impacto | Probabilidade | Mitigação | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **RP-01** | Perda de contexto entre sessões | Alto | Alta | Docs vivos + `/fechar-plano` | 🟢 Mitigado |
| **RP-02** | Alucinação técnica | Alto | Alta | Citar `arquivo:linha` ou `[não verificado]` | 🟡 Ativo |
| **RP-03** | Decisão sem o PO | Alto | Média | Log D-xxx | 🟢 Mitigado |
| **RP-04** | Plano executado diferente do aprovado | Médio | Média | Auditoria do GP | 🟡 Ativo |
| **RP-05** | Limite de uso derruba subagentes longos | Médio | Alta | Notas parciais; ondas menores | 🟡 Ativo |
| **RP-06** | Dados desatualizados | Médio | Alta | Validação via `arquivo:linha` | 🟡 Ativo |
| **RP-07** | Cartas inconsistentes | Alto | Alta | Guia de estilo + validação | 🔴 Alto |
| **RP-08** | Custo de tokens | Médio | Alta | Política de subagentes | 🟡 Ativo |

---

## Riscos Técnicos

| ID | Risco | Impacto | Probabilidade | Mitigação | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **RT-01** | Godot 4.7 + MCP inexperiente | Alto | Média | Seguir fluxo documentado | 🟡 Ativo |
| **RT-02** | GDScript sem tipagem estática | Médio | Alta | Regra no `.claude/rules/` | 🟢 Mitigado |
| **RT-03** | Estrutura de dados mal definida | Alto | Baixa | Arquivo 13 completo | 🟢 Mitigado |
| **RT-04** | Assets CC0 de baixa qualidade | Médio | Média | Curadoria em Kenney/OpenGameArt | 🟡 Ativo |
| **RT-05** | Performance em mobile | Médio | Baixa | Testes desde o início | 🟡 Ativo |
| **RT-06** | Exportação Web problemática | Médio | Média | Testes em navegador | 🟡 Ativo |
| **RT-07** | Compatibilidade entre plataformas | Médio | Média | Testes em 3 plataformas | 🟡 Ativo |
| **RT-08** | Godot instalado é 4.6.stable, stack prevê 4.7 (D-052) — fonte: `godot --version` | Médio | Alta | Atualizar antes do P-005 ou rever D-052 | 🟡 Ativo |

---

## Riscos de Conteúdo

| ID | Risco | Impacto | Probabilidade | Mitigação | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **RC-01** | Conteúdo doutrinário | Alto | Média | Revisão ética (PSI) | 🟡 Ativo |
| **RC-02** | Uso de dados desatualizados | Alto | Alta | Validação com fontes 2026 | 🟡 Ativo |
| **RC-03** | Citações erradas | Alto | Média | Validação por historiador | 🟡 Ativo |
| **RC-04** | Cartas desbalanceadas | Médio | Alta | Simulações | 🟡 Ativo |
| **RC-05** | Finais inconsistentes | Médio | Média | Validação cruzada | 🟡 Ativo |
| **RC-06** | Tom inadequado para o público | Médio | Média | Guia de estilo | 🟢 Mitigado |
| **RC-07** | Termos técnicos mal explicados | Médio | Média | Glossário + Cartas de Aprendizado | 🟢 Mitigado |

---

## Riscos de Produção

| ID | Risco | Impacto | Probabilidade | Mitigação | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **RP2-01** | Prazo curto (6-7 dias para protótipo) | Alto | Alta | Escopo controlado | 🟡 Ativo |
| **RP2-02** | Equipe reduzida (1 pessoa + IA) | Alto | Alta | Uso intensivo de agentes | 🟡 Ativo |
| **RP2-03** | Sem orçamento para arte | Médio | Alta | Assets CC0 | 🟢 Mitigado |
| **RP2-04** | Validação pedagógica atrasada | Médio | Média | Agendar com antecedência | 🟡 Ativo |
| **RP2-05** | Parcerias não confirmadas | Médio | Média | Múltiplas opções | 🟡 Ativo |
| **RP2-06** | Publicação bloqueada | Médio | Baixa | Múltiplas plataformas | 🟡 Ativo |

---

## Lições Aprendidas (do TixHead)

### LL-01: Docs vivos funcionam

**Contexto:** O TixHead usou docs vivos por meses sem perda significativa de contexto.

**Aplicação:** Adotar a mesma estrutura no "O Planalto".

**Evidência:** `gestao/estado.md` + `gestao/decisoes.md` + `/fechar-plano`.

---

### LL-02: Subagentes com notas incrementais

**Contexto:** O TixHead perdeu 2 de 7 frentes de trabalho por limite de uso de subagentes.

**Aplicação:** Salvar progresso em arquivo desde o início.

**Evidência:** `.claude/rules/subagentes.md`.

---

### LL-03: Citar arquivo:linha

**Contexto:** O TixHead identificou 15/15 citações conferidas na Fase 0.

**Aplicação:** Toda afirmação técnica deve citar `arquivo:linha` ou marcar `[não verificado]`.

**Evidência:** `.claude/rules/citacoes.md`.

---

### LL-04: Máximo 3 subagentes em paralelo

**Contexto:** O TixHead definiu máximo de 3 subagentes em paralelo para evitar sobrecarga.

**Aplicação:** Seguir a mesma regra.

**Evidência:** `gestao/equipe.md`.

---

### LL-05: Skill /fechar-plano

**Contexto:** O TixHead usa um comando que audita, registra decisões, atualiza changelog e estado.

**Aplicação:** Criar comando similar.

**Evidência:** `.claude/commands/fechar-plano.md`.

---

### LL-06: Cópia isolada no scratchpad

**Contexto:** O TixHead executou ferramentas do template numa cópia isolada.

**Aplicação:** Sempre que testar algo, usar cópia isolada.

**Evidência:** `.claude/rules/isolamento.md`.

---

### LL-07: Ler template via git show

**Contexto:** O TixHead leu o template via `git show <ref>:<path>` para não depender do branch local.

**Aplicação:** Sempre que consultar referências, usar `git show`.

**Evidência:** `.claude/rules/leitura.md`.

---

### LL-08: Conferir no código

**Contexto:** O TixHead verificou no código as afirmações dos agentes.

**Aplicação:** Nunca confiar em afirmações sem verificação.

**Evidência:** `.claude/rules/verificacao.md`.

---

## Boas Práticas Adotadas

| # | Prática | Descrição |
| :--- | :--- | :--- |
| 1 | **Docs vivos** | Atualizar estado, decisões, planos e changelog a cada mudança |
| 2 | **Citação rigorosa** | Sempre citar `arquivo:linha` ou marcar `[não verificado]` |
| 3 | **Notas incrementais** | Salvar progresso em arquivo desde o início |
| 4 | **Ondas de subagentes** | Máximo 3 em paralelo |
| 5 | **Cópia isolada** | Testar em cópia isolada no scratchpad |
| 6 | **Leitura via git show** | Consultar referências via `git show <ref>:<path>` |
| 7 | **Verificação no código** | Conferir afirmações dos agentes no código |
| 8 | **Fechamento de plano** | Usar `/fechar-plano` a cada conclusão |
| 9 | **Resposta ao PO** | Formato: Fase / Insumos / Decisões / Próximo passo |
| 10 | **Economia de tokens** | Curto, bullets, tabelas |

---

## Monitoramento

| Risco | Como Monitorar | Frequência |
| :--- | :--- | :--- |
| RP-01 | Verificar `gestao/estado.md` | A cada sessão |
| RP-02 | Amostragem de citações | A cada plano |
| RP-03 | Verificar `gestao/decisoes.md` | A cada decisão |
| RP-04 | Auditoria do GP | A cada plano |
| RP-05 | Verificar uso de subagentes | A cada onda |
| RP-06 | Verificar fontes | A cada carta |
| RP-07 | Validação de cartas | A cada lote |
| RP-08 | Verificar custo | A cada plano |

---

**Última atualização:** 2026-10-09