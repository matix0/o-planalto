---
description: Escreve o GDD de um sistema, seção por seção, com aprovação do PO
argument-hint: <sistema>
allowed-tools: Read, Grep, Glob, Write, Edit
---

# /gdd-sistema — GDD de Sistema

Adaptado do Claude Code Game Studios (MIT, D-093). Segue `.claude/rules/design-docs.md`.

## Passos

1. **Validar:** o sistema existe em `gdd/sistemas/00_INDICE.md`? Se não, parar e sugerir `/mapear-sistemas`.
2. **Contexto:** ler o índice, `gdd/GDD.md`, as pendências do §16.4 ligadas ao sistema e os GDDs dos sistemas de que ele depende.
3. **Retomada:** se `gdd/sistemas/NN_<sistema>.md` já existe, continuar da primeira seção `[a definir]`.
4. **Esqueleto:** criar o arquivo com as 8 seções `[a definir]` e avisar o PO do caminho.
5. **Seção por seção:** pergunta → 2-4 alternativas com prós, contras e recomendação → decisão do PO → rascunho → aprovação → gravar a seção.
6. **Especialistas (opcional):** consultar GD, ECO ou PSI (máx. 3 em paralelo, retorno ≤ 400 palavras). O parecer vai ao PO; o agente não grava arquivos.
7. **Fechamento:** conferir as 8 seções; atualizar o status no índice; marcar no `gdd/GDD.md` §16.4 as pendências resolvidas; decisões novas vão para `gestao/decisoes.md` só com aprovação.

## Regras

- Nenhuma suposição e nenhum GDD inteiro de uma vez.
- Dependências nos dois sentidos: se o GDD cita outro sistema, avisar que o outro também precisa citar este.
