---
description: Mapeia os sistemas do jogo, dependências e ordem de escrita dos GDDs
allowed-tools: Read, Grep, Glob, Write, Edit
---

# /mapear-sistemas — Mapa de Sistemas

Adaptado do Claude Code Game Studios (MIT, D-093).

## Fontes

`gdd/GDD.md`, `docs/04_DESIGN_DO_JOGO.md`, `docs/05_SISTEMAS_E_MECANICAS.md`, `docs/13_ARQUITETURA_TECNICA.md`. Se `gdd/sistemas/00_INDICE.md` existir, partir dele.

## Passos

1. **Sistemas explícitos:** listar os sistemas citados nas fontes, com `arquivo:linha`.
2. **Sistemas implícitos:** listar os que as regras exigem mas ninguém nomeou (ex.: sorteio do lado da carta). Marcar como proposta.
3. **Revisão do PO:** mostrar as duas listas; o PO aprova, corta ou junta sistemas.
4. **Dependências:** para cada sistema, de quais depende. Apontar ciclos.
5. **Prioridade e ordem:** propor a ordem de escrita respeitando as dependências. Ordem já decidida pelo PO: Medidores → Finais → Impeachment → Eixo.
6. **Pendências:** ligar cada pendência do GDD §16.4 ao sistema que a resolve.
7. **Gravar** `gdd/sistemas/00_INDICE.md` só após a aprovação, com: sistema, arquivo, depende de, pendências, status (⏳/🟡/✅).

## Regras

- Nenhuma suposição: dúvida vira pergunta ao PO.
- Não escrever GDD de sistema aqui; isso é o `/gdd-sistema`.
