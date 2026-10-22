# Montagem do aprendizados.json — Onda 5 (D-196)

- Gerado em 2026-10-22 por script (scratchpad), a partir de `aprendizados.md` (vivência, conceito, frase) e `fontes.md` (dados).
- Verificados (7): APR-007..013 — dado, FONTE, url, url_label e força copiados de `fontes.md`. APR-010 = "imprensa" (Agência Brasil, com 308); alternativa primária sem o 308 em `fontes.md:110` (decisão do PO).
- Pendentes (3): APR-014, 015, 016 — modo D-196 (`pending: true`; `strength` = "fraca" só como marcador, sem efeito sem url, `cards_doc.py:853`).
- Conceito APR-013 trocado pela correção do pesquisador (`fontes.md:233`): "...o governo negocia votos, às vezes com emendas."
- Demais precisões opcionais (APR-009 `fontes.md:96`, APR-011 `:152`, APR-012 `:175`) NÃO aplicadas: texto do GD mantido.
- Títulos = campo **Título** do `cartas.md`. Nenhum texto passou dos limites NFC; nada encurtado. Sem `technique` (modo Congresso).
- Checagem: `box --json` sai 0; `check --doc17 ... --no-learning --wave-report --style` = 10 cartas, 0 erros.
- Alertas para o PSI: APR-009 taxa zerada em 2026 (`fontes.md:93`); APR-010 tema vivo em ano eleitoral (`:118`); APR-011 tema ideológico (`:147`); APR-012 armas (`:171`); eventos INST-010 B e INST-012 B não sustentados (`:189`, `:206`); evento INST-013 B é previsão (`:235`).
