# Prompt — Criação das cartas (doc 17) e das Cartas de Aprendizado (doc 18)

**Para quem:** sessão do Claude Code (Opus 5.5) aberta na raiz do repositório, como fio principal.
**Como usar:** cole o bloco abaixo inteiro. O fio principal orquestra os subagentes do projeto (`.claude/agents/`) e as skills (`.claude/commands/`).
**Citações:** conferidas no commit `b5beea5` (2026-10-16). Se o `main` mudar, o `main` vale; avise o PO se encontrar divergência.
**Uso interno:** cita a D-097, que fica só em docs internos (`gestao/decisoes.md:109`). Não copie este prompt para o site.
**Insumos:** pareceres do GD e do QA (2026-10-16). O parecer do PSI foi interrompido; as regras éticas abaixo vêm direto dos docs.

---

```
# Papel
Você é o fio principal do projeto "O Planalto" (CLAUDE.md). Sua missão: escrever, em ondas, as cartas que faltam no docs/17_ROTEIRO_DAS_CARTAS.md e as Cartas de Aprendizado delas no docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md. Você orquestra os subagentes do projeto e as skills; o PO aprova cada onda.

# Governança (obrigatória)
- Só o PO decide. Você e os agentes propõem (CLAUDE.md, "Regras de Governança").
- Nenhuma escolha sem o PO: diante de lacuna, pare e pergunte com 2-4 alternativas, prós, contras e recomendação.
- Cite `arquivo:linha` ou marque `[não verificado]` (.claude/rules/citacoes.md). Confira 5 afirmações dos agentes por onda (.claude/rules/verificacao.md).
- Subagentes: no máximo 3 em paralelo, notas incrementais em .claude/notas/, retorno ≤ 400 palavras (.claude/rules/subagentes.md).
- Os subagentes do projeto só leem (Read, Grep, Glob; Bash em ECO e QA). Quem grava no doc 17 e no doc 18 é você, depois do OK do PO.
- Responda ao PO no formato "Fase / Insumos / Decisões pendentes (≤5) / Próximo passo" (CLAUDE.md).

# Fonte de verdade (leia antes de tudo)
- gdd/sistemas/05_cartas.md (inteiro) — estrutura, faixas e critérios de aceite.
- gdd/sistemas/06_sorteio.md:24-31 — `ano_minimo` e carta ligada a medidor (D-115).
- gdd/sistemas/07_atores.md:16-58 — atores, níveis e cartas ATOR.
- gdd/sistemas/08_eventos.md:18-28 — eventos encadeados.
- gdd/sistemas/09_desinformacao.md:16-45 — modo Influenciador.
- gdd/sistemas/04_eixo.md:16-32 e :72 — eixo e cobertura mínima.
- docs/10_GUIA_DE_ESTILO_E_TOM.md:96-270, :485-520, :660-691 — escrita, o que evitar e checklists.
- docs/11_FICHAS_DOS_ATORES.md e docs/12_FICHAS_DOS_MODOS.md:71-552 — vozes, interesses e contexto.
- docs/17_ROTEIRO_DAS_CARTAS.md e docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md — formato e cartas já aprovadas.
- docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:875 em diante — 127 Aprendizados em rascunho (§18.14), banco de ideias.
- gestao/decisoes.md:94-172 — D-083 a D-160.
Se este prompt e o repositório divergirem, siga o repositório e liste a divergência.

# Regra de ouro
Não invente mecânica, número, regra, nome de tema ou dado. Sem fonte, use "[a definir]" ou "[não verificado]". As cartas já aprovadas (doc 17) não mudam.

# Onda 0 — decisões do PO (BLOQUEIA a escrita)
Antes da 1ª carta, apresente estes pontos ao PO, com alternativas e recomendação, e espere a resposta:
1. Modo Impeachment: as 5 cartas da cena ficam fora das 340 (D-101, gestao/decisoes.md:113; gdd/sistemas/03_impeachment.md:31), mas INST-141 a 160 seguem dentro das 200 (gdd/GDD.md:462; docs/17_ROTEIRO_DAS_CARTAS.md:388). Alternativas do GD: (A) 20 cartas comuns sobre impeachment + as 5 da cena com outro prefixo; (B) 9 modos, com as 20 vagas redistribuídas; (C) total abaixo de 340.
2. Contagem: o doc 17 diz 22 escritas (docs/17_ROTEIRO_DAS_CARTAS.md:595-600); o GD contou 18 INST comuns + 1 THEM + 1 ATOR + 5 da cena; gestao/estado.md fala em 313 restantes. Fechar o número-alvo.
3. Os 7 temas das THEM: só "Reforma Agrária" tem nome (docs/17_ROTEIRO_DAS_CARTAS.md:554); docs/12_FICHAS_DOS_MODOS.md:613 diz apenas "7 temas transversais".
4. Formato da carta: o modelo docs/17_ROTEIRO_DAS_CARTAS.md:13-29 não tem `ano_minimo`, `atores`, `eventos`, `tecnica`, `reacao` nem a função da carta ATOR, todos exigidos pelos GDDs (gdd/sistemas/05_cartas.md:26-46). Proponha a tabela estendida (ver "Formato de saída") ou o JSON de jogo/data/cards.json.
5. IDs: regra de numeração ATOR → ator e função (ataque/exigência/oferta); código do Aprendizado de THEM/ATOR — o GDD diz "mesmo número" (gdd/sistemas/05_cartas.md:31), o doc 17 usa APR-THEM-001 (docs/17_ROTEIRO_DAS_CARTAS.md:566); `modo` das THEM e ATOR para a regra de 1 por modo (gdd/sistemas/06_sorteio.md:44).
Registre as respostas com /fechar-plano antes da Onda 1.

# Regras por carta (reprovam)
- `titulo` ≤ 5 palavras; `problema` ≤ 2 linhas e 140 caracteres; opção ≤ 60 caracteres; consequência ≤ 80 caracteres (docs/10_GUIA_DE_ESTILO_E_TOM.md:100-105).
- Duas opções, A e B, nomes internos; o lado é sorteado e nunca se escreve "esquerda/direita" (D-084; gdd/sistemas/05_cartas.md:50-51).
- Cor: uma das 7 (Vermelho, Azul, Verde, Amarelo, Roxo, Laranja, Preto), a de quem propõe a opção; cores diferentes em A e B (D-092, D-103; docs/10_GUIA_DE_ESTILO_E_TOM.md:250-262).
- Eixo [Eco, Dip, Soc, Est], inteiros −2..+2; nunca derivado do lado nem da cor (gdd/sistemas/04_eixo.md:29-30).
- Efeitos: 2-4 medidores, múltiplos de 5, ±5..±30, ≥ 1 negativo (D-098). Única exceção: uma opção da carta de oferta de ator (Boa Vontade, D-108).
- Atores: 0-3 por opção, `ACT-001..024`, valor ±1; carta ATOR cita o próprio ator nas duas opções (gdd/sistemas/07_atores.md:46, :53).
- Eventos: 0 ou 1 por opção, com `texto` (1 linha), `atraso` 1-2 e 1-3 efeitos múltiplos de 5, ±5..±20 (gdd/sistemas/08_eventos.md:22-26).
- `ano_minimo` 1-4, padrão 1 (gdd/sistemas/06_sorteio.md:24).
- Influenciador: `tecnica` = 1 de 6 (desmoralizacao, panico_moral, deepfake, fazenda_ia, cache_desgraca, didatismo_acusatorio); `reacao` diferente em A e B (aceitar, recusar, investigar); a opção `aceitar` perde Integridade ou Consciência (gdd/sistemas/09_desinformacao.md:20-30). Campos ausentes fora do modo.
- ATOR: 22 atores × 3 (ataque, exigência, oferta) + ACT-010 e ACT-021 × 2, sem oferta (gdd/sistemas/07_atores.md:52, :58). Vozes e interesses: docs/11_FICHAS_DOS_ATORES.md.
- Aprendizado com 5 blocos — vivência (2 linhas), conceito (3), dados (3), fonte (1), frase de impacto (1) (docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:27-35). No modo Influenciador, nomeia a técnica e ensina a reconhecê-la (gdd/sistemas/09_desinformacao.md:30).

# Regras de baralho (avisos; persiga ao escrever)
- 15%-25% das opções com evento (D-125; gdd/sistemas/08_eventos.md:27).
- Cada eixo ≠ 0 em ≥ 15% das opções; Diplomacia está em 9% (gdd/sistemas/04_eixo.md:72; D-126).
- Cada cor com saldo negativo em ≥ 1 medidor (D-100; gdd/sistemas/05_cartas.md:73).
- Cada técnica em ≥ 2 cartas do Influenciador (D-119).
- Carta ligada (D-115): cada medidor precisa de opções com efeito positivo, também com `ano_minimo` 2-4. Cota: "[a definir]" (o GD sugere ≥ 10%; não aplicar sem o PO).

# Tom e ética
- Tom: voz ativa, presente, 2ª pessoa, frases ≤ 20 palavras, sem gerúndio nem advérbio (docs/10_GUIA_DE_ESTILO_E_TOM.md:113-123). Evitar jargão, eufemismo, panfletagem, sarcasmo cruel, ufanismo, derrotismo e neutralidade excessiva (docs/10_GUIA_DE_ESTILO_E_TOM.md:487-502).
- O problema apresenta o dilema sem tomar partido, com fatos concretos (docs/10_GUIA_DE_ESTILO_E_TOM.md:204-207). A consequência mostra o resultado sem julgar e nunca é cruel (:236-240).
- Toda opção tem custo real (D-097, D-098). O alinhamento do jogo (D-097, gestao/decisoes.md:109) nunca aparece em texto para o jogador; não se neutraliza o "moral" por cor.
- Nomes reais: mantidos nos atores e citações (D-083), mas RC-08 segue ativo (gestao/estado.md, "Riscos Ativos"). Não crie acusação nova contra pessoa real viva; use papéis ("um ministro", "o relator"). Na dúvida, pergunte ao PO.
- Temas do aviso de conteúdo — genocídio, tortura, violência policial, linguagem direta (gdd/GDD.md:762-769): sem detalhe gráfico; passam pelo PSI.
- Público de 15 a 30 anos, periférico e estudante (CLAUDE.md): sem estereótipo de periferia (docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:61).
- Influenciador: inocular, nunca ensinar a manipular; a carta expõe a técnica e o Aprendizado a nomeia (D-118).

# Dados (D-091)
- Dado só entra com fonte verificada por link, conferida na web na hora. Sem link: "[não verificado]", e a carta fica fora do baralho até a fonte (D-102).
- Prefira fontes públicas primárias: Agência Senado/Câmara, IBGE, IPEA, Fórum Brasileiro de Segurança Pública, Tesouro, STF. Números arredondados (docs/10_GUIA_DE_ESTILO_E_TOM.md:144-151).
- Ao aproveitar um rascunho da §18.14, mova o texto para a seção do modo e verifique a fonte de novo.

# Equipe por onda (máx. 3 em paralelo)
1. GD (Opus) — rascunha as cartas da onda: dilema, opções, cores, eixo, efeitos, atores, eventos, `ano_minimo`. Lê as fichas do modo e dos atores.
2. Você — verifica a fonte de cada dado na web e redige o Aprendizado.
3. PSI (Opus) — revisa ética e manipulação (não neutralidade, D-097). Obrigatório no Influenciador, no Prisional e Policial, em cartas com nome real e nos temas do aviso de conteúdo.
4. ECO (Opus) — a cada ~40 cartas: saldo por cor, % de eventos, cobertura de eixo, carta ligada por medidor.
5. QA (Sonnet) — roda o checklist abaixo e o /validate-cards.
Ordem sugerida pelo GD: Influenciador e Geopolítico primeiro (regras próprias; cobertura de Diplomacia), depois os demais modos; ATOR por categoria do ator; THEM um tema por onda. Ordem final: PO.
Tamanho da onda: 10 cartas + 10 Aprendizados.

# Formato de saída (proposta para a Onda 0)
Tabela do doc 17 (docs/17_ROTEIRO_DAS_CARTAS.md:58-73) com estas linhas a mais: **Tipo**, **Ano mínimo**, **Função** (só ATOR), **Técnica** (só Influenciador), e por opção **Atores A/B**, **Evento A/B** (texto · atraso · efeitos), **Reação A/B** (só Influenciador). Efeitos sempre como `Medidor` ±N. Aprendizado no formato de caixa do doc 18 (docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:76-100), com a linha "Fonte verificada" e o link. Use o formato que o PO aprovar.

# Checklist por carta (antes de entregar ao PO)
☐ limites de palavras e caracteres · ☐ voz ativa, presente, 2ª pessoa · ☐ cores distintas entre as 7 · ☐ eixo −2..+2 · ☐ 2-4 efeitos, múltiplos de 5, ±5..±30, ≥ 1 negativo (salvo Boa Vontade) · ☐ atores 0-3, ±1; ATOR cita o ator nas duas · ☐ evento 0-1, atraso 1-2, efeitos ±5..±20 · ☐ `ano_minimo` · ☐ Influenciador: técnica + reações distintas + `aceitar` com custo · ☐ Aprendizado com 5 blocos e link · ☐ sem "esquerda/direita" e sem rótulo ideológico · ☐ checklist docs/10_GUIA_DE_ESTILO_E_TOM.md:662-691.

# Critério de "pronto" da onda
1. /validate-cards sem erros na onda (o comando cita dados/cartas.json, .claude/commands/validate-cards.md:10; use o doc 17 e o doc 18 como fonte, como ele mesmo prevê).
2. Contagem de caracteres por script, sem violação.
3. Relatório de avisos do baralho (eventos, eixo, cor, técnicas, carta ligada).
4. Parecer do PSI quando obrigatório.
5. 5 citações conferidas à mão.
6. PO aprova → você grava no doc 17 e no doc 18, atualiza os status (docs/17_ROTEIRO_DAS_CARTAS.md:5, :595-600; docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md:7) e roda /fechar-plano.

# Fora do escopo
- jogo/data/cards.json: hoje só tem 40 cartas fictícias (D-135, gestao/decisoes.md:147); o teste fixa 40 (jogo/tests/test_data.gd:14). Migrar as cartas reais para o JSON é outro plano.
- Mudar regra de GDD. Divergência vira pergunta ao PO.

# Processo
1. Leia a "Fonte de verdade".
2. Resuma em 5-10 linhas as regras e o estado do baralho.
3. Onda 0: leve os 5 pontos ao PO e espere.
4. Ondas 1..N: GD → dados e Aprendizado → PSI → QA → PO → gravar → /fechar-plano. ECO a cada ~40 cartas.
5. No fim de cada onda: cartas da onda, relatório de avisos, divergências e pendências.
```
