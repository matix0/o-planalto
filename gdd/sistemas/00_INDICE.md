# Índice de Sistemas — O Planalto

**Gerado por:** `/mapear-sistemas` (P-011, 2026-10-14) · **Formato:** D-063 · **Regra:** `.claude/rules/design-docs.md`

Cada sistema tem um GDD próprio em `gdd/sistemas/`, escrito com `/gdd-sistema`. O GDD mestre (`gdd/GDD.md`) aponta para eles.

## Sistemas

| # | Sistema | Arquivo | Inclui | Depende de | Pendências (GDD §16.4) | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 01 | Medidores | `01_medidores.md` | 8 medidores (sub-medidores removidos, D-094), relações, turnos e fases (multiplicador, recuperação), calibração inicial | — | P-6, P-8, P-11 | ✅ |
| 02 | Finais | `02_finais.md` | 27 finais, prioridade, epílogo | 01, 08, 04 | P-3, P-1 (parte) | ✅ |
| 03 | Impeachment | `03_impeachment.md` | Gatilhos, cena de 5 fases, placares | 01, 07, 02 | P-1 | ✅ |
| 04 | Eixo ideológico | `04_eixo.md` | 4 eixos, pontuação, revelação final | 05, 01 | P-9 | ✅ |
| 05 | Cartas | `05_cartas.md` | Estrutura, opções A/B, sorteio do lado, cor por opção e saldo por cor | 01 | — | ✅ |
| 06 | Sorteio | `06_sorteio.md` | Prioridade narrativa, cartas obrigatórias | 01, 05, 07, 08 | P-4 | ✅ |
| 07 | Satisfação dos atores | `07_atores.md` | Níveis, atualização, consequências | 01, 05 | P-10 | ✅ |
| 08 | Eventos encadeados | `08_eventos.md` | Atraso 1-2 turnos, aviso, epílogo | 01, 05 | — | ✅ |
| 09 | Desinformação | `09_desinformacao.md` | Modo Influenciador, inoculação | 01, 05 | — | ⏳ |
| 10 | Estado da partida | `10_estado_partida.md` | Máquina de estados, fim imediato, sessão | todos | P-12 | ⏳ |

P-14 (casos-limite, parâmetros e critérios de aceite) é atendida em todos os GDDs pela regra das 8 seções. P-5 (licenças) e P-7 (MCP/Godot) ficam fora deste índice: são de produção e técnica.

## Ordem de escrita

1. **01 Medidores → 02 Finais → 03 Impeachment → 04 Eixo** (decidida pelo PO).
2. Depois (aprovada pelo PO, 2026-10-14): 05 Cartas → 07 Atores → 08 Eventos → 06 Sorteio → 09 Desinformação → 10 Estado da partida.

**Atenção:** o 04 Eixo depende do 05 Cartas (os pontos vêm dos dados da opção, D-084), mas será escrito antes. O GDD do Eixo deve definir o campo de pontos da opção, e o 05 Cartas cita esse campo.

## Dependências

Sem ciclos. 02 Finais usa 04 (revelação) e 08 (epílogo); 03 Impeachment usa 02 para o final de condenação.

## Fontes

`gdd/GDD.md:238-488`, `docs/05_SISTEMAS_E_MECANICAS.md:76-665`, `docs/13_ARQUITETURA_TECNICA.md:57`; decisões do PO no `/mapear-sistemas` (2026-10-14): S10 e S8 dentro de 01; lado e cor dentro de 05; Finais e Estado da partida como sistemas próprios.
