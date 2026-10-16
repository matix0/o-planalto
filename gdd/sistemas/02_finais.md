# 02 — Finais

**Sistema:** 02 (`gdd/sistemas/00_INDICE.md`) · **Inclui:** 28 finais, prioridade, epílogo
**Status:** ✅ Aprovado pelo PO (2026-10-15) · **Pendências:** P-3, P-1 (parte)

---

## 1. Visão geral

O sistema decide como a partida termina. São **28 finais** (D-096; +Renúncia, GDD 10). Os finais de **Catástrofe** acontecem na hora em que um medidor chega a 0 — exceto `Capital Político`, que abre o impeachment (D-095). Os demais são checados **no fim do Ano 4**, por uma regra de prioridade; se nenhum vale, o jogador recebe o final neutro **"Mandato Comum"**. A tela final mostra final, citação, epílogo dos eventos encadeados pendentes, eixo ideológico e valores dos medidores (`docs/14_UI_UX_DESIGN.md` §14.09).

## 2. Fantasia do jogador

O jogador descobre "o país que construiu": o final é a soma das escolhas, não um prêmio. Finais graves se impõem aos bons — ninguém ganha "Democracia Participativa" se também produziu um genocídio. Não há vitória; há um retrato com uma citação real que provoca reflexão (pilar 5).

## 3. Regras detalhadas

### 3.1. Categorias

| Categoria | Qtd | Quando | Finais (condições: `docs/04_DESIGN_DO_JOGO.md` §04.08) |
| :--- | :--- | :--- | :--- |
| Catástrofe | 8 | Na hora, medidor em 0 | Barbárie, Alienação Total, Colônia, Autogestão Popular, Desintegração, **Paralisia Fiscal** (Caixa = 0, novo), Impeachment (só por condenação na cena — D-095), Revolta Popular |
| Extermínio e Exploração | 2 | Fim do Ano 4 | #16, #17 |
| Perda da Democracia | 5 | Fim do Ano 4 | #11 a #15 |
| Captura | 3 | Fim do Ano 4, medidor ≥ 95 | Estado Policial (Segurança), Hegemonia Autoritária (Capital Político), Ufanismo Vazio (Legitimidade) |
| Fortalecimento | 5 | Fim do Ano 4 | #18 a #22 (faixa "boa", junto com Cuidado e Soberania) |
| Cuidado e Soberania | 3 | Fim do Ano 4 | #23 a #25 (#26 removido: duplicava o #20) (faixa "boa") |
| Neutro | 1 | Fim do Ano 4, se nenhum outro vale | **Mandato Comum** (novo) |
| Saída | 1 | Na hora, ao "Abandonar mandato" fora da calibração (`gdd/sistemas/10_estado_partida.md` §3.3) | **Renúncia** (novo) |

### 3.2. Catástrofe na hora

- Medidor em 0 após uma carta, um evento (GDD 08) ou um fechamento de turno → final da Catástrofe desse medidor (`gdd/sistemas/01_medidores.md` §3.3-3.4).
- Dois ou mais em 0 na mesma carta ou evento → vale o medidor que mais perdeu nessa carta; empate pela ordem de `gdd/GDD.md` §6.1.1.
- `Capital Político` em 0 → cena de impeachment (GDD 03), não final direto (D-095).
- "Abandonar mandato" → Renúncia na hora, sem passar pela prioridade; tela completa (`gdd/sistemas/10_estado_partida.md` §3.3).

### 3.3. Fim do Ano 4

1. Depois da última carta do Ano 4 **não há** relações, limiares nem bônus (`gdd/sistemas/01_medidores.md` §3.4).
2. Checa o gatilho de impeachment com os valores da última carta; se disparar, a cena acontece primeiro (GDD 03).
3. Lê as condições de todos os finais não-Catástrofe com esses valores.
4. Prioridade: Extermínio → Perda da Democracia → Captura → faixa "boa" (Fortalecimento + Cuidado e Soberania) → Mandato Comum.
5. Dentro da categoria (ou da faixa boa), vence o final com mais condições; empate pela ordem da tabela.

### 3.4. Aviso de Captura

No início do Ano 4, se `Segurança`, `Capital Político` ou `Legitimidade` estiver ≥ 81, o cartão "Ano 4" mostra um aviso curto citando o medidor em extremo (sem número).

### 3.5. Citações

Só entram no jogo com fonte verificada (D-091). Verificação na web em 2026-10-15 e 2026-10-16 (P-013), aprovada pelo PO.

| # | Final | Citação | Autor | Fonte |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Barbárie | "Socialismo ou barbárie." | Rosa Luxemburgo (*Brochura de Junius*, 1915) | [marxists.org](https://www.marxists.org/francais/luxembur/junius/) |
| 2 | Alienação Total | "Não é moda, quem pensa incomoda / … não vira massa de manobra" | MV Bill ("Só Deus Pode Me Julgar") | [letras.mus.br](https://www.letras.mus.br/blog/frases-mv-bill/) |
| 3 | Colônia | "Em lugar do cidadão formou-se um consumidor, que aceita ser chamado de usuário." | Milton Santos (*O Espaço do Cidadão*, 1987) | [Vitruvius](https://vitruvius.com.br/revistas/read/arquitextos/23.268/8604) |
| 4 | Autogestão Popular | "A emancipação dos trabalhadores deve ser obra dos próprios trabalhadores." | Estatutos da AIT (1864) | [marxists.org](https://www.marxists.org/archive/marx/iwma/documents/1864/rules.htm) · [UFMG](https://www.fafich.ufmg.br/hist_discip_grad/AIT_Estatutos_1864.pdf) |
| 5 | Desintegração | Adaptação (não é citação) | — | — |
| — | Paralisia Fiscal (novo) | "O bem que o Estado pode fazer é limitado; o mal, infinito." | Roberto Campos (*Na virada do milênio*, 1999) — fonte fraca | [Wikiquote](https://pt.wikiquote.org/wiki/Roberto_Campos) |
| 6 | Impeachment | "Uma condenação política exige obrigatoriamente a ocorrência de um crime de responsabilidade…" | Dilma Rousseff (Senado, 29/08/2016) | [Agência Brasil](https://agenciabrasil.ebc.com.br/politica/noticia/2016-08/confira-integra-do-discurso-de-dilma-em-julgamento-do-impeachment-no-senado) |
| 7 | Revolta Popular | "Liberdade ainda que tardia." | Lema da Inconfidência Mineira | [Wikipedia](https://en.wikipedia.org/wiki/Flag_of_Minas_Gerais) |
| 8 | Estado Policial | "Brasil, ame-o ou deixe-o." | Slogan do governo Médici | [UFPE](https://periodicos.ufpe.br/revistas/pedaletra/article/view/245311) |
| 9 | Hegemonia Autoritária | "Tudo no Estado, nada fora do Estado, nada contra o Estado." | Mussolini (28/10/1925) | [Wikipedia](https://en.wikipedia.org/wiki/Benito_Mussolini) |
| 10 | Ufanismo Vazio | "Crer, obedecer, combater." | Lema fascista | [Wikipedia](https://en.wikipedia.org/wiki/Glossary_of_Fascist_Italy) |
| 11 | Autoritarismo Eleitoral | Adaptação (Oliveira Vianna) | — | — |
| 12 | Golpe Militar | "Temos ódio à ditadura. Ódio e nojo." | Ulysses Guimarães (promulgação da Constituição, 05/10/1988) | [CEDEC](https://acervodigital.cedec.org.br/wp-content/uploads/2022/09/Ulysses-Guimaraes-discurso-na-data-da-promulgacao-da-Constituicao.pdf) |
| 13 | Golpe Institucional | "Já temi a minha morte duas vezes, hoje temo a morte da democracia." | Dilma Rousseff (Senado, 29/08/2016) | [Agência Senado](https://www12.senado.leg.br/noticias/materias/2016/08/30/dilma-fala-ao-senado-e-diz-temer-a-201cmorte-da-democracia201d-1) |
| 14 | Populismo Autoritário | "Você não é nada, seu povo é tudo." | Propaganda nazista | [DHM](https://www.dhm.de/lemo/kapitel/ns-regime/innenpolitik/volksgemeinschaft) |
| 15 | Colônia Digital | "Nossos dados são extraídos, monetizados e usados para concentrar o poder político e econômico nas mãos de um punhado de bilionários." | Lula (Barcelona, 17/04/2026) | [Brasil de Fato](https://www.brasildefato.com.br/2026/04/17/lula-critica-big-techs-e-avanco-da-extrema-direita-durante-a-1a-cupula-brasil-espanha/) |
| 16 | Genocídio Institucionalizado | "E daí? Lamento. Quer que eu faça o quê?" | Jair Bolsonaro (28/04/2020) | [CartaCapital](https://www.cartacapital.com.br/politica/retrospectiva-as-piores-declaracoes-de-bolsonaro-durante-a-pandemia/) |
| 17 | Exploração Necropolítica | "Índio já tem terra demais, vamos tratá-los como seres humanos…" | Jair Bolsonaro (2018) | [IHU](https://ihu.unisinos.br/publicacoes/78-noticias/575956-nem-um-centimetro-a-mais-para-terras-indigenas-diz-bolsonaro) |
| 18 | República Soberana e Popular | "Todo o poder emana do povo, que o exerce por meio de representantes eleitos ou diretamente, nos termos desta Constituição." | Constituição Federal de 1988, art. 1º, parágrafo único | [Planalto](https://www.planalto.gov.br/ccivil_03/constituicao/constituicao.htm) |
| 19 | Democracia Participativa | "Ninguém liberta ninguém, ninguém se liberta sozinho: os homens se libertam em comunhão." | Paulo Freire (*Pedagogia do Oprimido*) | [Projeto Memória](http://www.projetomemoria.art.br/PauloFreire/pensamento/02_pensamento_pedagogia_do_oprimido.html) |
| 20 | Desenvolvimento Soberano | "Queremos um Brasil forte e independente." | Leonel Brizola (28/08/1961) | [Brasil de Fato](https://www.brasildefato.com.br/2021/08/21/resistiremos-ate-o-fim-anuncia-brizola-a-espera-do-bombardeio-do-piratini/) |
| 21 | Cidadania Ativa e Mobilizada | "A democracia não é só o direito de votar." | Lula | [PT](https://pt.org.br/lula-a-democracia-nao-e-so-o-direito-de-votar-mas-tambem-ajudar-a-governar/) |
| 22 | Paz Social e Justiça | "Sem justiça, a paz será impossível." | Dom Helder Câmara (Oslo, 1974) | [Inst. Dom Helder](https://domheldercamara.org.br/2018/01/05/dom-helder-o-profeta-dos-direitos-humanos/) |
| 23 | Cuidado como Política de Estado | "Quero mostrar ao mundo que é possível cuidar do povo pobre." | Lula | [PT](https://pt.org.br/quero-mostrar-que-e-possivel-cuidar-do-povo-pobre-afirma-lula/) |
| 24 | Soberania que Alimenta | "Ninguém faz opção pela pobreza." (paráfrase de entrevista, 2023) — fonte fraca | Lula | [Aos Fatos](https://www.aosfatos.org/noticias/lula-contexto-brasileiros-pobres/) |
| 25 | Fome como Escolha Política | "Quem tem fome tem pressa." | Herbert de Souza, Betinho (lema da Ação da Cidadania, 1993) — fonte fraca | [Agência Brasil](https://agenciabrasil.ebc.com.br/geral/noticia/2017-08/eventos-no-rio-homenageiam-betinho-nos-20-anos-de-sua-morte) |
| — | Renúncia (novo) | "Forças terríveis levantaram-se contra mim…" | Jânio Quadros (carta-renúncia, 25/08/1961) | [Agência Senado](https://www12.senado.leg.br/noticias/especiais/arquivo-s/ha-60-anos-congresso-aceitou-renuncia-e-abortou-golpe-de-janio-quadros) |
| — | Mandato Comum (novo) | "Só há duas opções nesta vida: se resignar ou se indignar." | Darcy Ribeiro (atribuída) — fonte fraca | [Wikiquote](https://pt.wikiquote.org/wiki/Darcy_Ribeiro) |

Finais com "—" são exibidos sem citação até o PO indicar uma com fonte. As marcadas "fonte fraca" foram aceitas pelo PO.

## 4. Fórmulas

- `atende(f)`: todas as condições de `f` verdadeiras com os valores da última carta do Ano 4. Comparações estritas (`>`, `<`), como no doc 04; Captura usa `≥ 95`.
- `peso(f)`: número de condições de `f`.
- Final escolhido: o primeiro que atende na ordem (categoria pela prioridade de §3.3 → peso decrescente → ordem da tabela); nenhum → Mandato Comum.

**Exemplo:** fim do Ano 4 com Dignidade 85, Consciência 75, Soberania 72, Integridade 74, demais 50. Atendem #18 (4 condições) e #25 (3), ambos na faixa boa → vence **#18 República Soberana e Popular** (mais condições).

## 5. Casos-limite

| Caso | O que acontece |
| :--- | :--- |
| Medidor em 0 durante a cena de impeachment | Catástrofe na hora; a cena é interrompida |
| Absolvição no impeachment | O jogo continua; o GDD 03 define o que acontece com `Capital Político` em 0 |
| Captura e final bom ao mesmo tempo | Captura vence (houve aviso no início do Ano 4) |
| Gatilho de impeachment no fim do Ano 4 | A cena acontece antes dos finais |
| Medidor exatamente no limite (ex.: 70 em "> 70") | Não atende (comparação estrita) |
| Medidor ≤ 10 no fim do Ano 4 | Sem carta de emergência: o mandato acabou |
| Eventos que cairiam depois do Ano 4 | Epílogo de qualquer final, inclusive Catástrofe |
| Final sem citação verificada | Exibido sem citação (D-091) |

## 6. Dependências

01 Medidores (valores, medidor em 0, fim do Ano 4 sem fechamento) · 03 Impeachment (cena, condenação) · 04 Eixo (revelação na tela final) · 08 Eventos (epílogo) · 05 Cartas (fim imediato, `gdd/sistemas/05_cartas.md` §5) · 06 Sorteio (fim do Ano 4 sem emergência; turno curto) · 10 Estado da partida (aciona o fim; Renúncia). Cada um deve citar o 02 de volta.

## 7. Parâmetros de ajuste

| Parâmetro | Atual | Faixa | O que afeta |
| :--- | :--- | :--- | :--- |
| Limite da Captura | ≥ 95 | 90-100 | Frequência dos finais de Captura |
| Limite do aviso de Captura | ≥ 81 | 75-90 | Antecedência do aviso |
| Limites das condições | doc 04 | ±10 | Dificuldade de cada final |
| Ordem das categorias | §3.3 | — | Quais finais se impõem |

## 8. Critérios de aceite

1. Caixa em 0 após uma carta → Paralisia Fiscal na hora.
2. `Capital Político` em 0 → abre a cena de impeachment, não um final.
3. Dignidade e Soberania em 0 na mesma carta, com perda maior em Soberania → Colônia.
4. Exemplo da seção 4 → #18.
5. #24 e #20 atendidos juntos → #24 (4 condições contra 3).
6. Segurança 96 no fim do Ano 4 e nenhum Extermínio/Perda da Democracia → Estado Policial; Segurança ≥ 81 no início do Ano 4 → aviso no cartão.
7. Todos os medidores em 50 no fim do Ano 4 → Mandato Comum.
8. Consciência 85, Integridade 85, Legitimidade 72 após a última carta do Ano 4 → #21 (sem perda de fechamento).
