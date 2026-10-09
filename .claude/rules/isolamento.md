# Política de Isolamento

## Regra

**Sempre testar em cópia isolada no scratchpad**, nunca no projeto do PO.

## Como Fazer

```bash
cp -r "<projeto>" "<scratchpad>/o-planalto-test"
godot --headless --path "<scratchpad>/o-planalto-test" --quit
```

- `--headless`, `--path` e `--quit` existem no Godot 4.6 (`godot --help`).
- Não existem `--run-tests` nem `--user-data-dir` (`godot --help`, 4.6).
- Runner de testes (GUT, gdUnit4…): `[não verificado]` — definir na D-068 (Estratégia de testes).
- Isolamento de `user://`: `[não verificado]` — definir no P-005.
