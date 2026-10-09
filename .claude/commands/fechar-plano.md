---
description: Audita plano, registra decisões, atualiza changelog e estado
argument-hint: P-xxx
allowed-tools: Read, Grep, Glob, Write, Edit, Bash(git add:*), Bash(git commit:*), Bash(git status:*)
---

# /fechar-plano — Fechamento de Plano

**Plano:** $ARGUMENTS

## Passo a Passo

1. **Auditoria:** Ler `gestao/plano-de-acao.md` e verificar o status e a evidência de cada etapa. Etapa não concluída → registrar o motivo.
2. **Verificação:** Amostrar 5 citações/afirmações do plano no arquivo citado (`.claude/rules/verificacao.md`).
3. **Decisões:** Adicionar em `gestao/decisoes.md` (D-xxx: decisão, data, fundamento).
4. **Changelog:** Adicionar em `gestao/changelog.md`, seção `[Unreleased]` (Adicionado, Alterado, Removido, Corrigido).
5. **Estado:** Atualizar `gestao/estado.md` (status, decisões recentes, riscos ativos, próximo passo).
6. **Plano:** Marcar como concluído em `gestao/plano-de-acao.md`, com evidências.
7. **Resposta ao PO:** Formato padrão (Fase / Insumos / Decisões pendentes ≤5 / Próximo passo).
8. **Commit:** Adicionar só os arquivos do plano e `git commit -m "docs: fecha plano P-xxx"`.

## Checklist

- [ ] Etapas auditadas
- [ ] 5 citações amostradas
- [ ] Decisões registradas
- [ ] Changelog atualizado
- [ ] Estado atualizado
- [ ] Plano marcado como concluído
- [ ] Resposta ao PO
- [ ] Commit feito
