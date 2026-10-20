# Prompt mestre — Execução do P-014 (correções) e do P-015 (cartas)

**Para quem:** membro da equipe, no Claude Code (Opus 5.5), na raiz do repositório.
**Como usar:** na 1ª vez, `git checkout main && git pull && git checkout -b claude/p014-p015`; cole o bloco abaixo. Quando a sessão acabar (contexto, limite de uso ou fim do dia), abra uma sessão nova na mesma branch e cole o mesmo bloco: ele retoma de onde parou.
**O PO só valida no fim** (escolha do PO, 2026-10-20): no meio, o agente segue a própria recomendação e grava cada escolha como **provisória**, para o PO aprovar ou reverter de uma vez.
**Especificações detalhadas:** `gestao/prompts/correcoes-p014.md` (P-014) e `gestao/prompts/criacao-cartas.md` (P-015). Este prompt manda na ordem e na forma de decidir; aqueles mandam no conteúdo. As branches citadas neles (`claude/p014-correcoes`, `claude/p015-cartas`) não são usadas: tudo vai na `claude/p014-p015`.

---

```
# Papel
Você é o fio principal da execução do P-014 (correções do protótipo) e do P-015 (cartas reais + migração para o jogo) do "O Planalto" (CLAUDE.md). Você trabalha até terminar os dois, em várias sessões, e entrega ao PO um pacote para validar de uma vez.

# 1. Ao abrir cada sessão
1. Leia CLAUDE.md, gestao/estado.md, .claude/rules/*.md, gestao/prompts/correcoes-p014.md, gestao/prompts/criacao-cartas.md e gestao/validacao-2026-10-20.md.
2. Leia gestao/execucao-p014-p015.md (diário da execução). Se não existir, crie-o com as fases da seção 4 deste prompt, todas "⏳".
3. Confira a branch (`claude/p014-p015`; ignore as branches citadas nos prompts de especificação) e `git status`. Continue na 1ª fase não concluída.
4. Ao fim de cada etapa: commit (mensagem em PT, com "Co-Authored-By"), atualize o diário (o que fez, evidência, próximo passo) e o status em gestao/plano-de-acao.md. Nunca termine uma sessão com trabalho sem commit.

# 2. Como decidir sem o PO (decisões provisórias)
Onde os prompts de especificação dizem "pergunte ao PO", "PO aprova" ou "decisão do PO":
1. Liste 2-4 alternativas com prós e contras, como sempre.
2. Escolha a sua recomendação e siga.
3. Registre em gestao/decisoes-provisorias.md uma linha por escolha: `DP-nnn | data | pergunta | alternativas | escolhida | por quê | arquivos afetados | como reverter`. Não crie D-xxx: o PO converte as DP aprovadas em D-xxx no fim.
4. Cartas e Aprendizados aprovados assim ficam marcados "provisório (DP-nnn)" no doc 17 e no doc 18.
Valem para: Onda 0 do P-015 (os 6 pontos), aprovação de cada seção de GDD, aprovação de cada onda de cartas, texto do 6º padrão da revelação (D-175), lista unificada de avisos de conteúdo (D-190), números de layout, local do pre-commit, campo `quem_fala` nas 40 cartas fictícias.

NÃO decida sozinho (registre como "bloqueio para o PO" no diário e siga com outra coisa):
- Qualquer coisa que dependa do parecer jurídico (RC-08): nenhuma citação nova nem acusação nova de pessoa real viva.
- Dado sem fonte verificada na web (D-091): fica "[não verificado]" e a carta fica fora do baralho (D-102).
- Mudar uma decisão D-001 a D-190 já registrada.
- Push para o main, merge no main, publicar o site (/publish-docs).

# 3. Regras que continuam valendo
- Cite `arquivo:linha` ou `[não verificado]`; confira 5 afirmações de cada subagente.
- Subagentes: no máximo 3 em paralelo; notas incrementais em .claude/notas/execucao/; retorno ≤ 400 palavras. Se um subagente parar por limite de uso, retome-o depois (não comece outro do zero).
- PSI é obrigatório onde os prompts mandam (Influenciador, Prisional e Policial, nomes reais, temas do aviso de conteúdo, textos novos que o jogador lê). A revisão do PSI não é dispensada pelas decisões provisórias.
- Isolamento: jogo e testes só numa cópia no scratchpad com `XDG_DATA_HOME` próprio; nunca o MCP do Godot em jogo/ (D-189).
- Skill `godot-prompter:*` antes de cada sistema Godot.

# 4. Ordem das fases
| Fase | O que | Especificação |
| 1 | P-014 etapa 2 (`/validate-cards` com opção ≤ 25 caracteres e `quem_fala`) | correcoes-p014.md "2." |
| 2 | P-014 etapa 1 (GDDs e docs) em paralelo com o P-015 Onda 0 | correcoes-p014.md "1."; criacao-cartas.md "Onda 0" |
| 3 | P-014 etapas 3, 4, 5 (código) em paralelo com as ondas de cartas do P-015 | correcoes-p014.md "3."-"5."; criacao-cartas.md "Ondas" |
| 4 | P-014 etapa 6 (testes) e etapa 7 (verificação ponta a ponta); as ondas de cartas continuam | correcoes-p014.md "6."-"7." |
| 5 | Ondas de cartas até o número-alvo da Onda 0 (ECO a cada ~40 cartas) | criacao-cartas.md |
| 6 | P-015 migração para jogo/data/ + simulação do ECO com o baralho real | criacao-cartas.md "Etapa final" |
| 7 | Verificação final de tudo junto (seção 5) e entrega (seção 6) | este prompt |
Paralelo = subagentes em arquivos diferentes (P-014 mexe em jogo/, gdd/, docs/ menos 17 e 18; P-015 mexe em docs/17 e docs/18 até a fase 6). Máximo de 3 subagentes ao mesmo tempo no total.

# 5. Verificação final (fase 7)
- jogo/tests/run_all.sh verde numa cópia isolada, com o baralho real.
- Simulação headless de ~2.000 partidas pela classe GameFlow (perfis e checagens de correcoes-p014.md "7."): medidores 0-100, determinismo, salvar/restaurar, atraso dos eventos, cobertura dos 28 finais, taxa de fim de mandato × catástrofe × impeachment, nenhuma tela final com "[a definir".
- Partida pela interface do título ao final (test_e2e e capturas em 390×844, 360×800 e PC, texto 16-36 e alto contraste), sem palavra de lado (D-084), sem número de medidor antes do final, rótulo da opção sempre dentro da tela.
- /validate-cards no baralho inteiro sem erro.
- grep de "[a definir]" que aparece ao jogador: lista do que sobrou.

# 6. Entrega ao PO
1. gestao/entrega-p014-p015.md com:
   - Resumo (≤ 10 linhas): o que foi feito, números (cartas escritas, testes, simulação), veredito para o playtest P-006.
   - Tabela das decisões provisórias (link para gestao/decisoes-provisorias.md), agrupadas por impacto, com "aprovar / reverter".
   - Cartas e Aprendizados novos: contagem por modo e tipo; os que ficaram fora do baralho e por quê.
   - Bloqueios para o PO (seção 2) e pendências.
   - Resultado da verificação final (seção 5) com evidências.
2. /fechar-plano para o P-014 e o P-015 (status "✅ aguardando validação do PO").
3. Push da branch `claude/p014-p015` e PR para o main (sem merge). Avise o PO no formato "Fase / Insumos / Decisões pendentes (≤5) / Próximo passo", com o link do PR.

# 7. Critério de "pronto"
Todas as fases do diário em ✅; verificação final sem regressão; entrega escrita; PR aberto. Antes disso, não pare para pedir aprovação: só pare por bloqueio sem alternativa, registrando-o no diário.
```
