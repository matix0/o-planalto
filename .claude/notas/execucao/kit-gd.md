# Kit do GD para as ondas do P-015 (leitura curta)

Este kit substitui a leitura longa das Ondas 1 e 2. Leia **só** o que está listado aqui, mais o que a sua onda pede no bloco "Sua onda" do prompt. Tudo o que você escrever fica em `.claude/notas/execucao/onda-NN/` (pasta fora do git). Não altere nenhum outro arquivo do repositório.

## 1. Leitura obrigatória (curta)

| O quê | Onde |
| :--- | :--- |
| Regras de carta, baralho, tom, ética e dados | `gestao/prompts/criacao-cartas.md:53-86` |
| Formato da carta (tabela estendida) | `docs/17_ROTEIRO_DAS_CARTAS.md:11-41` |
| Decisões provisórias da Onda 0 (modos, IDs, temas, formato) | `gestao/decisoes-provisorias.md`, linhas DP-011 a DP-016 |
| Exemplo de onda pronta (formato, notas, relatório) | `.claude/notas/execucao/onda-02/cartas.md` (Geopolítico) e, no Influenciador, `.claude/notas/execucao/onda-01/cartas.md` |
| Ficha do seu modo e a lista de cartas planejadas (banco de ideias) | `docs/12_FICHAS_DOS_MODOS.md` (seção do modo; linhas no prompt) |
| Rascunhos de Aprendizado do modo (banco de ideias, fontes `[não verificado]`) | `docs/18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md` §18.14 (linhas no prompt) |
| Vozes dos atores que você usar | `docs/11_FICHAS_DOS_ATORES.md` (só as fichas usadas) |
| Cartas do P-003 (banco de ideias; nunca copiar sem revisar) | `git show origin/claude/eloquent-einstein-gez6rk:docs/17_ROTEIRO_DAS_CARTAS.md` (procure os IDs da onda) |

Consulte o resto (GDDs 04-09, doc 10) só para uma dúvida pontual, por `grep`, e cite a linha.

## 2. Limites (o script confere)

- Título ≤ 5 palavras · problema ≤ 140 caracteres (2 linhas) · opção ≤ 25 caracteres (D-177) · consequência ≤ 80. Contagem em NFC: acento conta 1.
- 2 opções (A, B); cores diferentes entre as 7: Vermelho, Azul, Verde, Amarelo, Roxo, Laranja, Preto.
- Eixo `[Eco, Dip, Soc, Est]`, inteiros −2..+2, nunca derivado do lado nem da cor.
- Efeitos: 2-4 medidores, múltiplos de 5, ±5..±30, ≥ 1 negativo (salvo Boa Vontade na oferta de ator). Medidores (nome na tabela): `Dignidade`, `Consciência`, `Soberania`, `Segurança`, `Integridade`, `Caixa`, `Capital Político`, `Legitimidade`.
- Atores: 0-3 por opção, `ACT-001..024`, valor ±1. Evento: 0-1 por opção, `"texto" · atraso 1-2 · 1-3 efeitos ±5..±20`.
- `Ano mínimo` 1-4 (padrão 1). `Quem fala`: `ACT-xxx` ou a instituição do modo (D-164).
- Influenciador: `Técnica` (Desmoralização, Pânico Moral, Deepfake, Fazenda de IA, Cache da Desgraça, Didatismo Acusatório); `Reação A/B` diferentes (Aceitar, Recusar, Investigar); a opção Aceitar perde Integridade ou Consciência.
- Nunca "esquerda/direita" nem rótulo ideológico no texto. Nenhum número ou dado no texto da carta: o dado vai para o Aprendizado, com fonte (D-091).

## 3. Atores (ID → nome)

ACT-001 Latifundiários · ACT-002 Investidores da Faria Lima · ACT-003 Construtoras · ACT-004 Empresariado Industrial · ACT-005 Universidades Privadas · ACT-006 Mercado · ACT-007 Tecnocratas · ACT-008 Militares · ACT-009 Servidores Públicos Estatais · ACT-010 Diplomatas do Itamaraty · ACT-011 Líder da Câmara (Centrão) · ACT-012 Pastores · ACT-013 Sindicato dos Professores · ACT-014 Profissionais da Saúde · ACT-015 Líder Sindical · ACT-016 Movimentos por Moradia (MTST) · ACT-017 Movimentos do campo (MST) · ACT-018 Movimentos ambientais · ACT-019 Artista Engajado · ACT-020 Meta (Big Tech) · ACT-021 Impérios Geopolíticos (China e EUA) · ACT-022 Coach Digital · ACT-023 Jornalista Independente · ACT-024 Influenciador Progressista. (`jogo/data/actors.json`)

## 4. Convenções já usadas (siga; divergência vira proposta ao PO)

- Diplomacia (`gdd/sistemas/04_eixo.md:22, 29`): − = autonomia nacional, controle interno ou projeto do BRICS; + = abertura comercial, alinhamento a potência ou instituição internacional, cooperação com vizinho.
- `ACT-021`: +1 quando o jogador cede à potência que pede; −1 quando recusa.
- Nomes reais: só os que já estão nos atores (D-083). Nenhuma citação nem acusação nova de pessoa viva (RC-08, D-190): use papéis ("um ministro", "o relator"). Paráfrase nunca entre aspas.
- Temas do aviso de conteúdo (violência policial, racismo, genocídio, ditadura e tortura, nazifascismo): sem detalhe gráfico; liste a dúvida para o PSI.
- Público de 15 a 30 anos, periférico e estudante: sem estereótipo de periferia.
- Toda opção tem custo real; não neutralize "moral por cor" (D-097).

## 5. Metas por onda (o `--wave-report` mostra)

- Eventos em 15-25% das opções (3-5 de 20).
- Diplomacia ≠ 0 em ≥ 3 opções (o baralho ainda está abaixo de 15%); cada eixo ≠ 0 em ≥ 15% quando o modo permitir.
- As 7 cores, cada uma com saldo negativo em algum medidor; toda opção com ≥ 1 custo.
- Carta ligada: ≥ 3 cartas com `Ano mínimo` 2-4 e efeito positivo, em medidores variados (prefira os pouco cobertos: Consciência, Integridade, Segurança, Legitimidade).
- Sem repetir dilemas de cartas já escritas (doc 17 e as outras ondas em `.claude/notas/execucao/onda-*/cartas.md`).

### Estado do baralho (atualizado pelo fio principal; leia antes de planejar)

Checagem com 57 cartas gravadas no doc 17 (Ondas 1-4, 2026-10-21):
- Eventos em 16% das opções, perto do piso da meta: **mire 4-5 eventos em 20 opções**.
- Eixos: Economia 39%, Diplomacia 43%, Sociedade 20%, Estado 37% — todos acima de 15%; mantenha a Sociedade ≥ 15%.
- Carta ligada (opção com efeito positivo e Ano mínimo 2-4): **Dignidade só tem 2** e Segurança 5 — inclua ≥ 2 opções Dignidade+ e ≥ 1 Segurança+ com Ano mínimo 2-4 por onda, quando o tema permitir.
- `ACT-021`: "comprar terras" e "base militar" já viraram INST-073, 074 e 077; para a exigência e o ataque do ator, use outros temas.
- Mito difundido (desmentido por órgão público) traz "É falso" ou "É boato" na própria carta; "sem prova" só para acusação a pessoa (PSI das Ondas 1 e 3).
- Técnicas do Influenciador fechadas (3-4 cada). Modos já completos: Geopolítico e Influenciador.

## 6. Saída

1. `onda-NN/cartas.md`: cabeçalho com status e checklist de progresso (atualize enquanto trabalha: o limite de uso pode parar você no meio), convenções da onda, as cartas no formato do doc 17 (`Status`: `provisório (DP-pendente)`; notas do GD abaixo de `---` de cada carta), relatório do script, propostas ao PO, dúvidas ao PSI e autoconferência de ≥ 5 citações.
2. `onda-NN/aprendizados.md`: por carta, vivência (≤ 110 caracteres), conceito (≤ 170), frase de impacto (≤ 55) e **pista de dado** (o fato a procurar e o tipo de fonte pública: Agência Senado/Câmara, IBGE, IPEA, gov.br, STF, TSE, Fórum de Segurança, ONU). Sem números: o dado entra depois, com link verificado. Afirmação de fato no conceito também vai para a pista.
3. Conferência: `python3 jogo/tools/cards_doc.py check --doc17 .claude/notas/execucao/onda-NN/cartas.md --no-learning --wave-report` com 0 erros.
4. Retorno ≤ 400 palavras: tabela das cartas (ID, título, cores, evento, ano mínimo), metas, propostas ao PO, dúvidas ao PSI, caminhos dos arquivos.
