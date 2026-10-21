# Onda 1 — Fontes dos Aprendizados APR-182 a APR-191 (Influenciador)

**Status:** concluído pelo pesquisador de dados em 2026-10-21 (10 de 10 com fonte verificada por link). Nada aprovado pelo PO. Regra D-091: dado só entra com fonte conferida agora, trecho literal copiado da página e link; sem isso, `[não verificado]` e a carta sai do baralho.

**Data de acesso:** 2026-10-20, salvo indicação no bloco da APR (alguns trechos foram reconferidos em 2026-10-21).

## Checklist de progresso

- [x] APR-182 — Boato contra a ministra (Desmoralização): DataSenado, 2024, primária
- [x] APR-183 — Vídeo falso de você (Deepfake): Cetic.br, Painel TIC Integridade da Informação 2025, primária
- [x] APR-184 — Pânico na fronteira (Pânico Moral): Agência Brasil, 2025, imprensa (pública)
- [x] APR-185 — Streamer critica o governo (Desmoralização): Abraji, 2026, primária
- [x] APR-186 — Robôs de outro país (Fazenda de IA): Data Privacy Brasil, 2026, primária
- [x] APR-187 — Aula contra os indígenas (Didatismo Acusatório): MapBiomas, 2025, primária
- [x] APR-188 — Golpe com rosto famoso (Deepfake): NetLab-UFRJ, 2025, primária (universidade pública)
- [x] APR-189 — Elogio de robô (Fazenda de IA): TSE, Resolução 23.755/2026, primária (norma)
- [x] APR-190 — Medo da vacina (Pânico Moral): INCA, 2026, primária
- [x] APR-191 — Curso que culpa o pobre (Didatismo Acusatório): Agência Brasil, 2026, imprensa (pública) sobre estudo de instituto

## Como as fontes foram lidas (limites da ferramenta)

- As páginas foram lidas com WebFetch, que resume o conteúdo com um modelo e limita cada citação a cerca de 125 caracteres. Os "trechos literais" abaixo foram remontados pedindo a mesma frase em blocos consecutivos de até 120 caracteres e juntando-os; os números e as frases citados entre aspas foram devolvidos assim pela ferramenta. Quando a ferramenta devolveu só um resumo, o bloco diz "resumo do WebFetch, não literal".
- `curl` ficou bloqueado pelo proxy do agente (403 no CONNECT) e não foi contornado.
- Cada trecho tem até 300 caracteres; quando um dado precisa de duas frases, há mais de um trecho por APR.
- Não abriram para o WebFetch (não usadas): agenciagov.ebc.com.br (robots); planalto.gov.br/ccivil_03/leis/l9504.htm e os PDFs do NetLab em filesusr.com (exigem permissão de origem); IBGE Agência de Notícias, notícias 43816 e 43850 (404); gov.br/agu, ação contra a Meta (exige autenticação); gov.br/mds, Operação Acolhida (erro); gov.br/senappen, presos estrangeiros (página vazia); TecMundo (robots); Congresso em Foco, coluna 107046 (erro de servidor); cartilha do TRE-SP (URL longa demais).

---

## APR-182 — Boato contra a ministra

**Carta:** INST-182 · **Técnica:** Desmoralização · **Força da fonte:** primária

- **DADOS REAIS proposto (158 caracteres, limite 165):** Em 2024, 67% dos brasileiros de 16 anos ou mais viram, nos últimos seis meses, notícia que desconfiavam ser falsa. Metade deles acha difícil saber se é falsa.
- **FONTE da caixa (34 caracteres, limite 50):** DataSenado (Agência Senado), 2024.
- **url_label:** DataSenado, 2024
- **URL:** https://www12.senado.leg.br/institucional/datasenado/materias/relatorios-de-pesquisa/pesquisa-datasenado-revela-o-que-pensa-o-brasileiro-sobre-fake-news
- **Acesso:** 2026-10-20 (WebFetch; trechos remontados de blocos consecutivos de até 120 caracteres)
- **Sobre a fonte:** Instituto DataSenado (Senado Federal), pesquisa própria: Panorama Político, 21ª edição, "Notícias falsas e Democracia", agosto de 2024. Campo de 5 a 28 de junho de 2024, 21.808 entrevistas por telefone com pessoas de 16 anos ou mais (resumo do WebFetch, não literal).
- **Trecho literal 1 (211 caracteres):** "Entre os usuários de redes sociais, 72% relataram ter acessado notícias que desconfiam ser falsas nos últimos seis meses. Este dado revela que 67% da população com 16 anos ou mais já foi exposta a desinformação,"
- **Trecho literal 2 (147 caracteres):** "metade dos brasileiros que acessaram notícias falsas (50% ou 56.274.612 pessoas) considera ser difícil avaliar se uma notícia é falsa ou verdadeira"
- **Conferência do conceito (ok):** Definição de Desmoralização é do projeto (`docs/05_SISTEMAS_E_MECANICAS.md:414`). Os sinais "acusação grave sem prova" e "muita repetição" são heurísticas: o DataSenado mostra a exposição a notícias suspeitas, não mede repetição `[não verificado]` como efeito (a literatura sobre "efeito de verdade ilusória" não foi consultada nesta rodada). "Quem ganha se a pessoa cair" é pergunta-guia, não fato.
- **Ressalvas:**
  - Base do percentual: a manchete da Agência Senado (2024-08-23) diz "72% dos brasileiros", mas o corpo e o relatório dizem 72% dos usuários de redes sociais, o que equivale a 67% da população de 16 anos ou mais. O dado usa 67% (base: população de 16+), que é a base mais ampla e está literal no relatório.
  - Os 50% de dificuldade têm base só nas pessoas que viram notícia suspeita (56,3 milhões), não em toda a população; por isso o texto diz "Metade deles".
  - "Desconfiavam ser falsa" é percepção do entrevistado; a pesquisa não verificou se as notícias eram falsas.
- **Alternativas descartadas:**
  - Agência Senado, 2024-08-23, "Para brasileiros, notícias falsas impactam eleições, revela DataSenado" (https://www12.senado.leg.br/noticias/materias/2024/08/23/para-brasileiros-noticias-falsas-impactam-eleicoes-revela-datasenado): mesma pesquisa; 81% acham que notícias falsas podem afetar o resultado da eleição. Usada só para conferir a base e a data.
  - Senado Verifica, 2025-09-05 (https://www12.senado.leg.br/verifica/materias-especiais/2026/datasenado-o-que-os-brasileiros-pensam-sobre-o-combate-a-desinformacao): "Sete em cada 10 brasileiros já viram alguma notícia falsa"; reúne pesquisas sem data e sem metodologia. Fraca.
  - Cetic.br 2025, "34% dos usuários de Internet concordam que não vale a pena pesquisar": boa, mas fica com a APR-183 (mesma fonte).

---

## APR-183 — Vídeo falso de você

**Carta:** INST-183 · **Técnica:** Deepfake · **Força da fonte:** primária

- **DADOS REAIS proposto (162 caracteres, limite 165):** Em 2025, 41% dos usuários de internet (16 anos ou mais) relataram contato diário com deepfakes. Só 11% se sentem muito confiantes em identificar informação falsa.
- **FONTE da caixa (46 caracteres, limite 50):** Cetic.br/NIC.br, Painel TIC Integridade, 2025.
- **url_label:** Cetic.br, Painel TIC Integridade da Informação 2025
- **URL:** https://cetic.br/media/docs/publicacoes/2/pt-br/20260408150833/painel_tic_integridade_informacao_2025_resumoexecutivo_pt.pdf
- **Acesso:** 2026-10-20 (WebFetch; trechos remontados de blocos consecutivos de até 120 caracteres)
- **Sobre a fonte:** Cetic.br/NIC.br (braço do Comitê Gestor da Internet), Painel TIC - Integridade da Informação 2025, resumo executivo. Usuários de Internet de 16 anos ou mais; coleta em agosto e setembro de 2025; 5.250 entrevistas online (resumo do WebFetch, não literal). "Contato diário" é autodeclarado.
- **Trecho literal 1 (77 caracteres):** "41% dos usuários de Internet reportaram ter contato diariamente com deepfakes"
- **Trecho literal 2 (179 caracteres):** "Os dados também evidenciaram que 11% dos usuários de Internet se sentem muito confiantes na própria capacidade de identificar informações falsas ou enganosas que veem na Internet,"
- **Conferência do conceito (correção proposta):** Três pontos: (1) "vídeo falso" é estreito: a ANPD define deepfake como "áudios, fotos e vídeos modificados ou artificialmente criados por meio da inteligência artificial" (Radar Tecnológico nº 6, 2026, https://www.gov.br/anpd/pt-br/centrais-de-conteudo/documentos-tecnicos-orientativos/rt_deepfakes_anpd.pdf/@@display-file/file). (2) "voz sem pausa" não aparece em nenhuma fonte lida: o Correio Braziliense/EdiCase (2024-06-25) cita "o áudio pode parecer fora de sincronia, formal demais ou num tom acima do que a persona do vídeo costuma se comunicar"; o Canaltech (2026-05-21), sobre estudo do Data Privacy Brasil, cita "elementos robotizados em áudios e imagens". (3) "boca fora de sincronia" está certo: o Prodest/Governo do ES (https://prodest.es.gov.br/deepfake-como-descobrir-que-um-video-e-falso) diz "Caso não haja uma sincronia entre o que está sendo falado e a maneira como os lábios estão se movendo". Ressalva de peso: o relatório do GT Deepfakes (Secom e Secretaria de Políticas Digitais, https://www.gov.br/secom/pt-br/arquivos/2606_gt_relatorio-deepfake-v4-web.pdf/) afirma, segundo o WebFetch (resumo, não literal), que para pessoas sem recursos técnicos esses conteúdos são muitas vezes impossíveis de distinguir do real. Por isso "nenhuma fonte séria" é o sinal mais robusto; os sinais visuais falham em deepfakes bons. Proposta: trocar "vídeo falso" por "vídeo, foto ou voz falsos" e "voz sem pausa" por "voz artificial" (170 caracteres no máximo; a proposta tem 169).
  - **Original do GD (159):** Deepfake é vídeo falso feito com IA. Sinais: boca fora de sincronia, voz sem pausa e nenhuma fonte séria. Se todo vídeo pode ser falso, a verdade também perde.
  - **Proposta (169, limite 170):** Deepfake é vídeo, foto ou voz falsos feitos com IA. Sinais: boca fora de sincronia, voz artificial e nenhuma fonte séria. Se tudo pode ser falso, a verdade também perde.
- **Ressalvas:**
  - O dado é de percepção (autodeclarado): 41% dizem ter contato diário; a pesquisa não verifica se o conteúdo era mesmo deepfake. O texto da caixa diz "relataram".
  - Duas bases diferentes aparecem na mesma fonte: "41% da população da pesquisa" (usuários de Internet de 16+). O texto da caixa nomeia a base.
- **Alternativas descartadas:**
  - Agência Brasil, 2026-10-02, "Mesmo proibidos, deepfakes tomam conta das redes antes da eleição" (https://agenciabrasil.ebc.com.br/geral/noticia/2026-10/mesmo-proibidos-deepfakes-tomam-conta-das-redes-antes-da-eleicao): "pelo menos 554 vídeos e imagens do tipo deepfake foram publicadas nas redes sociais" e "Eles correspondem a 60% do total de 920 publicações coletadas entre os dias 16 de agosto e 28 de setembro" (levantamento VigIA/Lupa com o Recod.ai da Unicamp). Verificado, mas é imprensa, mede a campanha em curso e a cobertura associada cita candidatos. Serve para confirmar `docs/03_PESQUISAS_E_ESTUDOS.md:546`.
  - TSE, 2026-09-01, tese sobre deepfake (https://www.tse.jus.br/comunicacao/noticias/2026/Setembro/tse-fixa-tese-sobre-deepfake-e-delimita-regra-para-as-eleicoes-2026): a vedação do art. 9º-C, § 1º "pressupõe a caracterização do conteúdo como propaganda eleitoral". Sem número.
  - Convergência Digital (imprensa) repete o 41% do Cetic.br; descartada em favor da fonte primária.

---

## APR-184 — Pânico na fronteira

**Carta:** INST-184 · **Técnica:** Pânico Moral · **Força da fonte:** imprensa (pública)

- **DADOS REAIS proposto (146 caracteres, limite 165):** Em 2022, o Brasil tinha cerca de 1 milhão de estrangeiros e naturalizados, 0,5% da população. Os venezuelanos, maior grupo, eram cerca de 270 mil.
- **FONTE da caixa (40 caracteres, limite 50):** Agência Brasil, 2025 (Censo 2022, IBGE).
- **url_label:** Agência Brasil, 2025
- **URL:** https://agenciabrasil.ebc.com.br/geral/noticia/2025-06/venezuelanos-sao-maior-grupo-de-imigrantes-do-brasil
- **Acesso:** 2026-10-21 (trecho do lead) e 2026-10-20 (demais) (WebFetch; trechos remontados de blocos consecutivos de até 120 caracteres)
- **Sobre a fonte:** Agência Brasil (EBC), "Venezuelanos são maior grupo de imigrantes do Brasil", Vitor Abdala, 27/06/2025, sobre o Censo Demográfico 2022 do IBGE. A página primária do IBGE (Agência de Notícias) devolveu 404 ao WebFetch; a página do IBGE Educa, que abriu, confirma o total (ver abaixo). O percentual de 0,50% só foi conferido nesta matéria.
- **Trecho literal 1 (219 caracteres):** "Cerca de 1 milhão de estrangeiros ou brasileiros naturalizados viviam no Brasil em 2022, segundo dados do Censo Demográfico, divulgados nesta sexta-feira (27) pelo Instituto Brasileiro de Geografia e Estatística (IBGE)."
- **Trecho literal 2 (115 caracteres):** "Deste total, 793 mil eram estrangeiros e 216,3 mil eram naturais de outros países que se naturalizaram brasileiros."
- **Trecho literal 3 (191 caracteres):** "O número total de estrangeiros no país representa 0,50% do total da população no período e é 70% superior ao registrado no Censo de 2010 (592,6 mil estrangeiros ou brasileiros naturalizados)."
- **Trecho literal 4 (139 caracteres):** "Os venezuelanos formavam o maior grupo estrangeiro no Brasil, em 2022, com 271,5 mil pessoas, ocupando lugar que antes era dos portugueses."
- **Outra fonte lida:** Corroboração primária (IBGE Educa, "Cresce o número de imigrantes internacionais de acordo com o Censo 2022", matéria de 05/08/2025, https://educa.ibge.gov.br/jovens/materias-especiais/22738-cresce-o-numero-de-imigrantes-internacionais-de-acordo-com-o-censo-2022.html; acesso 2026-10-20): "Cerca de 1 milhão de pessoas naturais de outros países vivem no Brasil," e "70,3% a mais que em 2010 (592 mil pessoas)." A página não traz o percentual da população nem os venezuelanos.
- **Conferência do conceito (ok):** O conceito coincide com a definição acadêmica: Freire Filho e Herschmann (professores da ECO/UFRJ; artigo da revista Eco-Pós, título e ano não constam no texto extraído, datas de recebimento e aceite em 2003, https://revistaecopos.eco.ufrj.br/eco_pos/article/download/1133/1074/1966; acesso 2026-10-21) descrevem o processo em que "uma condição, um episódio, um indivíduo ou um grupo de pessoas passa a ser encarado como ameaça para os valores e os interesses basilares de uma sociedade" e dizem que "cada pânico moral tem seu bode expiatório" (apoia "um culpado pronto"). "Pressa para agir antes de pensar" é heurística `[não verificado]`.
- **Ressalvas:**
  - O trecho do 0,50% diz "estrangeiros", mas o total do lead (cerca de 1 milhão) soma 793 mil estrangeiros e 216,3 mil naturalizados, e é a esse total que o 0,50% se refere: a mesma frase compara com 592,6 mil "estrangeiros ou brasileiros naturalizados" em 2010 e diz que o total é 70% superior, o que só fecha com o ~1 milhão. Por isso a caixa diz "estrangeiros e naturalizados". Ler "0,50%" como só os 793 mil seria erro.
  - "Cerca de 270 mil" é arredondamento de 271,5 mil (guia de estilo, `docs/10_GUIA_DE_ESTILO_E_TOM.md:144-151`).
  - Dúvida para o PSI e o GD sobre o texto da carta: o problema da INST-184 afirma "Não há prova" (de doenças e crimes?). Um relatório da Câmara citado em artigo da REBESP (2021, https://revista.ssp.go.gov.br/index.php/rebesp/article/view/549/256) registra, segundo o WebFetch, "um aumento significativo dos casos de furto, de roubo e de lesão corporal" praticados por venezuelanos em Roraima entre 2015 e 2019, embora os autores concluam que os imigrantes não são os principais responsáveis pela criminalidade local. A afirmação absoluta pode ser contestada; o dado desta caixa evita o tema.
- **Alternativas descartadas:**
  - IBGE, Agência de Notícias (notícias 43816 e 43850, inclusive versão em inglês): 404 ao WebFetch.
  - Agência Brasil, 2026-04-30, "Brasil abriga mais de 2 milhões de imigrantes, refugiados" (https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2026-04/brasil-abriga-mais-de-2-milhoes-de-imigrantes-refugiados): "O Brasil abriga pouco mais de 2 milhões de imigrantes internacionais" e "Estima-se a residência de 680 mil venezuelanos no Brasil no início de 2026" (12º Relatório do OBMigra, MJSP). Base diferente (registros, não Censo) e sem percentual da população.
  - ACNUR e MJSP, Refúgio em Números (2024: 68.159 solicitações de refúgio, 27.150 venezuelanas, 39,8%): número alto sem denominador alimenta o pânico em vez de desfazê-lo.
  - Dados de prisão e crime (Folha BV, 2025-07-25: 449 estrangeiros presos em Roraima, 419 venezuelanos, fonte Sejuc-RR) e Operação Acolhida (agenciagov: robots; gov.br/mds: erro): descartados; estigmatizam sem contexto e/ou não abriram.

---

## APR-185 — Streamer critica o governo

**Carta:** INST-185 · **Técnica:** Desmoralização · **Força da fonte:** primária

- **DADOS REAIS proposto (140 caracteres, limite 165):** Em 2025, a Abraji registrou 204 alertas de ataques a jornalistas e veículos de imprensa. Em 55% deles, a origem ou a repercussão foi online.
- **FONTE da caixa (13 caracteres, limite 50):** Abraji, 2026.
- **url_label:** Abraji, 2026
- **URL:** https://www.abraji.org.br/noticias/abraji-registrou-204-alertas-de-violacoes-a-liberdade-de-imprensa-no-brasil-em-2025
- **Acesso:** 2026-10-20 (WebFetch; trechos remontados de blocos consecutivos de até 120 caracteres)
- **Sobre a fonte:** Abraji (Associação Brasileira de Jornalismo Investigativo), página "Abraji registrou 204 alertas de violações à liberdade de imprensa no Brasil em 2025", Samara Meneses, 24.07.2026, 09:00. A entidade é a autora do monitoramento. Os alvos citados são jornalistas e meios de comunicação; o WebFetch registrou que a página não menciona influenciadores como alvos (resumo, não literal).
- **Trecho literal 1 (102 caracteres):** "O estudo registrou 204 alertas de ataques contra jornalistas e meios de comunicação no Brasil em 2025."
- **Trecho literal 2 (207 caracteres):** "Em 55,4% dos alertas, os casos tiveram origem ou repercussão no ambiente online, representando um cenário de maior dificuldade para a identificação dos agressores e de prolongamento da exposição das vítimas."
- **Trecho literal 3 (192 caracteres):** "As agressões verbais, escritas e digitais foram o tipo mais frequente de violência, presentes em 36,3% dos alertas, seguidas pelas agressões físicas (27%) e pelo discurso estigmatizante (25%)."
- **Outra fonte lida:** Definição de "discurso estigmatizante", só no PDF do relatório (hospedado pelo Poder360, https://static.poder360.com.br/uploads/2026/08/Ataques-contra-jornalistas-relatorio-Abraji-2025.pdf; acesso 2026-10-20; citação parcial devolvida pelo WebFetch): "declarações públicas ou campanhas sistemáticas que buscam descredibilizar, criminalizar ou deslegitimar jornalistas". A página da Abraji não define o termo.
- **Conferência do conceito (ok):** Coerente com o que a Abraji mede como "discurso estigmatizante" (25% dos alertas): atacar a pessoa para descredibilizá-la, em vez de responder ao conteúdo. O sinal "a acusação vem sem prova" é heurística `[não verificado]`. O conceito fala de "quem critica" em geral; o dado é sobre jornalistas, e a caixa diz isso.
- **Ressalvas:**
  - Os dados são de ataques a jornalistas e veículos, não a streamers ou comunicadores independentes, e a APR-185 trata de um streamer. A caixa não afirma que o streamer esteja nesses 204 alertas. Se o PO trocar o título para "Crítico nas redes" (nota do GD em `cartas.md`), o dado continua servindo.
  - "Origem ou repercussão no ambiente online" não é o mesmo que "ataque feito nas redes sociais"; a caixa mantém a formulação da fonte.
  - O mesmo relatório informa que os autores dos ataques são 44,6% atores não estatais e 43,6% agentes estatais (A Pública, 2026-07-22, resumo do WebFetch). A caixa não usa isso, para não apontar culpado (RC-08).
- **Alternativas descartadas:**
  - A Pública, 2026-07-22, "Jornalistas e imprensa sofreram 204 ataques em 2025, aponta relatório da Abraji" (https://apublica.org/2026/07/jornalistas-e-imprensa-sofreram-204-ataques-em-2025-aponta-relatorio-da-abraji/): mesmos números; imprensa. Usada só para conferir.
  - Abraji, 2024-10-01, "Período eleitoral soma 38 mil ataques online contra a imprensa no país" (https://www.abraji.org.br/periodo-eleitoral-soma-38-mil-ataques-online-contra-a-imprensa-no-pais): 38.008 ataques online entre 16/08 e 18/09/2024, monitoramento da CDJor. O texto cita um deputado pelo nome. Descartada (RC-08).
  - Fenaj, Relatório da Violência contra Jornalistas 2024 (https://fenaj.org.br/wp-content/uploads/2025/05/Relatorio-da-Violencia-2024.pdf): segundo o WebFetch, 144 episódios em 2024, descredibilização em 9 casos (6,25%). Verificada; a Abraji traz a parte online e o ano de 2025.
  - Cetic.br, TIC Kids Online Brasil 2024 (tabela G20A, https://cetic.br/en/tics/kidsonline/2024/criancas/G20A/): discriminação testemunhada na internet por tipo (por exemplo, 25% pela cor ou raça). Fora do tema (crítico ao governo).

---

## APR-186 — Robôs de outro país

**Carta:** INST-186 · **Técnica:** Fazenda de IA · **Força da fonte:** primária

- **DADOS REAIS proposto (161 caracteres, limite 165):** De janeiro de 2025 a abril de 2026, o Observatório IA nas Eleições identificou 18 avatares de IA comentando política. Em 61% das ocorrências, nenhum aviso de IA.
- **FONTE da caixa (39 caracteres, limite 50):** Data Privacy Brasil e Aláfia Lab, 2026.
- **url_label:** Data Privacy Brasil, 2026
- **URL:** https://www.dataprivacybr.org/avatares-sinteticos-usados-para-atacar-politicos-e-instituicoes-democraticas-no-brasil/
- **Acesso:** 2026-10-20 (WebFetch; trechos remontados de blocos consecutivos de até 120 caracteres)
- **Sobre a fonte:** Observatório IA nas Eleições, iniciativa da Data Privacy Brasil (organização de pesquisa) com o Aláfia Lab; página "Avatares sintéticos usados para atacar políticos e instituições democráticas no Brasil", 18.05.2026. É a entidade autora do levantamento, não universidade nem órgão público. A página não descreve o método (resumo do WebFetch).
- **Trecho literal 1 (179 caracteres):** "Entre janeiro de 2025 e abril de 2026, o Observatório IA nas Eleições identificou 18 casos de avatares gerados por inteligência artificial usados para comentar política no Brasil."
- **Trecho literal 2 (115 caracteres):** "Em 61% das ocorrências, os conteúdos não traziam qualquer sinalização de que haviam sido produzidos com tecnologia."
- **Trecho literal 3 (140 caracteres):** "O que o usuário interpreta como reação espontânea pode ser, na verdade, uma construção artificial feita para reforçar determinada narrativa."
- **Outra fonte lida:** Mesma pesquisa, página "Brasil tem 18 influenciadores de política gerados por IA" (https://www.dataprivacybr.org/documentos/brasil-tem-18-influenciadores-de-politica-gerados-por-ia/; sem data explícita, aponta matéria do g1 de 20/05/2026): "Em 61% das publicações não havia qualquer aviso de que o conteúdo havia sido gerado por inteligência artificial." Aqui a palavra é "publicações"; a página linkada diz "ocorrências", e a caixa usa a da página linkada.
- **Conferência do conceito (correção proposta):** "Perfis sem rosto" não se sustenta: os avatares estudados têm rosto sintético, e o Canaltech (2026-05-21, https://canaltech.com.br/inteligencia-artificial/maioria-dos-influencers-politicos-feitos-com-ia-escondem-que-nao-sao-reais/) diz, segundo o WebFetch (resumo), que a origem artificial só foi percebida após "análise técnica detalhada" de falhas de resolução, proporção e elementos robotizados em áudios e imagens. "Contas novas" e "posts no mesmo minuto" não aparecem nas fontes lidas: o Aos Fatos (2026-09-23, https://www.aosfatos.org/noticias/fazendas-de-ia-inflam-pauta-da-extrema-direita-com-255-perfis-e-mais-de-mil-posts/) descreve "um mesmo conteúdo apareceu simultaneamente em até seis perfis" e posts em colaboração entre contas, e o WebFetch registrou que o texto não menciona contas novas, rostos ausentes nem padrão de horário. Proposta: manter só o que as fontes sustentam (o mesmo conteúdo em vários perfis ao mesmo tempo; nenhum aviso de IA). Tamanho igual ao original (155).
  - **Original do GD (155):** Fazenda de IA é uma rede de perfis falsos coordenados que imitam gente real. Sinais: contas novas, frases iguais, posts no mesmo minuto e perfis sem rosto.
  - **Proposta (155, limite 170):** Fazenda de IA é uma rede de perfis falsos coordenados que imitam gente real. Sinais: o mesmo conteúdo em vários perfis ao mesmo tempo e nenhum aviso de IA.
- **Ressalvas:**
  - A carta INST-186 trata de uma rede operada do exterior. Nenhuma fonte lida documenta uma rede estrangeira dirigida ao Brasil: os textos do Aos Fatos e do Data Privacy não dizem se alguma rede é operada fora (registro do WebFetch), e as buscas por rede estrangeira verificável não acharam fonte aberta com trecho literal. O dado ilustra a técnica (perfis de IA que imitam gente real, sem aviso), não a origem estrangeira.
  - Os avatares do estudo assumem papéis como eleitor comum e apoiador espontâneo (resumo do WebFetch); a caixa não os descreve nem os nomeia.
  - "Avatares" é a palavra do estudo; a página irmã diz "influenciadores artificiais".
- **Alternativas descartadas:**
  - Aos Fatos e A Pública, 2026-09-23, "Fazendas de IA inflam pauta da extrema direita com 255 perfis e mais de mil posts" (https://www.aosfatos.org/noticias/fazendas-de-ia-inflam-pauta-da-extrema-direita-com-255-perfis-e-mais-de-mil-posts/): 255 perfis no Instagram, 1.204 posts, "acumularam 58 milhões de visualizações", de 15 de agosto a 15 de setembro de 2026 (relatório do Instituto Democracia em Xeque, "Produção em escala: fazendas de conteúdo com IA no Instagram nas eleições de 2026"). Verificada e confirma `docs/03_PESQUISAS_E_ESTUDOS.md:561`. Descartada: imprensa e só um lado do espectro político, o que pode virar leitura partidária no jogo.
  - Aos Fatos, 2025-07-28, perfis no TikTok com IA sobre o tarifaço (https://www.aosfatos.org/noticias/perfis-tiktok-ia-desinformar-tarifaco-milhoes-views/): 30 perfis, 15,4 milhões de visualizações. Imprensa.
  - Data Privacy Brasil, 2026-03-16, "Dois em cada três conteúdos políticos gerados por IA circulam sem sinalização" (https://www.dataprivacybr.org/dois-em-cada-tres-conteudos-politicos-gerados-por-ia-circulam-sem-sinalizacao-aponta-observatorio-ia-nas-eleicoes/): segundo o WebFetch, 137 conteúdos entre dezembro de 2025 e fevereiro de 2026, "ao menos 100" sem sinalização. Boa reserva, mesma fonte.

---

## APR-187 — Aula contra os indígenas

**Carta:** INST-187 · **Técnica:** Didatismo Acusatório · **Força da fonte:** primária

- **DADOS REAIS proposto (137 caracteres, limite 165):** De 1985 a 2024, as terras indígenas perderam menos de 1% da vegetação nativa. Em áreas privadas, a perda foi de 21%, segundo o MapBiomas.
- **FONTE da caixa (28 caracteres, limite 50):** MapBiomas, Coleção 10, 2025.
- **url_label:** MapBiomas, 2025
- **URL:** https://brasil.mapbiomas.org/wp-content/uploads/sites/4/2025/08/Fact_Colecao10_22.08.2025_v9.pdf
- **Acesso:** 2026-10-20 (WebFetch; trechos remontados de blocos consecutivos de até 120 caracteres)
- **Sobre a fonte:** MapBiomas, "Mapas anuais de cobertura e uso da terra no Brasil, Coleção 10 (1985-2024)", documento "40 anos de transformação do território brasileiro", seção "Dinâmica do uso da terra por categoria fundiária". A data não consta no texto; o nome do arquivo indica 22.08.2025.
- **Trecho literal 1 (178 caracteres):** "No Brasil, entre 1985 e 2024, as TIs perderam menos de 1% de sua área de vegetação nativa, enquanto nas áreas privadas ou áreas com CAR sem registro fundiário, a perda foi de 21%"
- **Trecho literal 2 (140 caracteres):** "Dentre as categorias fundiárias, as TIs estão entre as áreas mais conservadas, com 615 mil ha de vegetação nativa perdidos entre 1985 e 2024"
- **Conferência do conceito (ok, com ressalva de terminologia):** "Didatismo acusatório" é rótulo do projeto (`docs/05_SISTEMAS_E_MECANICAS.md:419`). Não achei fonte externa que use o termo `[não verificado]` (a busca no Congresso em Foco, coluna 107046, falhou por erro de servidor). Os sinais "nenhuma fonte, um lado só, um grupo tratado como problema" são verificáveis pelo jogador e coerentes com a pista do GD.
- **Ressalvas:**
  - A categoria do MapBiomas é "áreas privadas ou áreas com CAR sem registro fundiário" (CAR = Cadastro Ambiental Rural); a caixa resume como "áreas privadas". O PO pode preferir o nome completo se couber.
  - O "menos de 1%" refere-se à vegetação nativa que a própria terra indígena tinha em 1985 (resumo do WebFetch), não à área total do país.
  - O dado é contraponto: a carta não diz de que o canal acusa os indígenas. Se a acusação for outra que não a ambiental, o GD pode pedir outra escolha, por exemplo a população indígena no Censo 2022 (as páginas do IBGE não abriram).
  - Coleção 11 do MapBiomas (1985-2025) foi lançada em 12/08/2026 (https://brasil.mapbiomas.org/mapbiomas-lanca-colecao-11-de-cobertura-e-uso-da-terra/, acesso 2026-10-21); a página não traz números de terras indígenas e o factsheet em PDF (https://brasil.mapbiomas.org/wp-content/uploads/sites/3/2026/08/Factsheet-Colecao-11-12082026-1.pdf) não abriu. Os números da Coleção 10 estão verificados; atualizar quando a Coleção 11 puder ser lida.
  - Tema sensível (racismo contra indígenas): passa pelo PSI (nota do GD).
- **Alternativas descartadas:**
  - AlmaPreta, 2024-08-31 (https://almapreta.com.br/sessao/cotidiano/terras-indigenas-conservam-99-da-vegetacao-nativa-desde-1985/): "com apenas 1% da vegetação nativa perdida entre 1985 e 2023" e 28% em áreas privadas (Coleção 9); imprensa e edição anterior.
  - Portal Amazônia, 2023-09-03 (https://portalamazonia.com/meio-ambiente/terras-indigenas-tiveram-menos-de-1-de-sua-area-de-vegetacao-nativa-desmatada-em-38-anos/): 17% em áreas privadas (1985-2022); imprensa e edição anterior.
  - MapBiomas, "Terras indígenas contribuem para a preservação das florestas" (https://mapbiomas.org/terras-indigenas-contribuem-para-a-preservacao-das-florestas): página sem data explícita (o endereço sugere abril de 2022), "os últimos 30 anos" e 20,6% em áreas privadas; mais antiga que a Coleção 10.

---

## APR-188 — Golpe com rosto famoso

**Carta:** INST-188 · **Técnica:** Deepfake · **Força da fonte:** primária (universidade pública)

- **DADOS REAIS proposto (127 caracteres, limite 165):** Em abril e maio de 2025, o NetLab/UFRJ analisou uma amostra de 6.579 anúncios de saúde em redes sociais: 76% eram fraudulentos.
- **FONTE da caixa (18 caracteres, limite 50):** NetLab/UFRJ, 2025.
- **url_label:** NetLab-UFRJ, 2025
- **URL:** https://netlab.eco.ufrj.br/en/post/disinformation-can-kill-scam-ads-fraud-and-health-disinformation-on-meta-platforms
- **Acesso:** 2026-10-20 (WebFetch; trechos remontados de blocos consecutivos de até 120 caracteres)
- **Sobre a fonte:** NetLab (Laboratório de Estudos de Internet e Redes Sociais) da UFRJ, página "Disinformation Can Kill: Scam Ads, Fraud, and Health Disinformation on Meta Platforms", 21 de dezembro de 2025; coleta em abril e maio de 2025. A página abre em inglês. O WebFetch registrou que ela não fala de deepfake no corpo do texto (só no título de um link da barra lateral).
- **Trecho literal 1 (132 caracteres):** "Between April and May 2025, we collected nearly 170,000 ads containing health-related terms that were displayed on Meta's platforms."
- **Trecho literal 2 (142 caracteres):** "We then manually analyzed a sample of 6,579 ads, seeking to identify the characteristics, narratives, and patterns present in these campaigns."
- **Trecho literal 3 (94 caracteres):** "At this stage, we identified 4,997 fraudulent health-related ads (76% of the analyzed sample)."
- **Outra fonte lida:** Imprensa que liga o estudo ao rosto falsificado: Tecnoblog, 2025-12-22, "76% dos anúncios sobre saúde na Meta são golpe, mostra estudo" (https://tecnoblog.net/noticias/76-dos-anuncios-sobre-saude-na-meta-sao-golpe-mostra-estudo/; resumo do WebFetch): "mais de 76% continham algum tipo de irregularidade ou fraude" e, em alguns casos, "vídeos manipulados com inteligência artificial para imitar a voz do médico". O artigo cita só a UFRJ, não o NetLab.
- **Conferência do conceito (ok, com ressalva):** "Promessa de cura" combina com o dado (76% da amostra eram anúncios de saúde fraudulentos). "Pressa" e "compra fora de loja oficial" são sinais comuns de golpe, mas não aparecem nas páginas lidas `[não verificado]`. A página do NetLab não fala de deepfake; o elo com o rosto falsificado vem da imprensa (Tecnoblog) e do estudo de 2024 do mesmo laboratório (ver descartados). Na caixa, a linha TÉCNICA (Deepfake) e a frase de impacto fazem esse elo.
- **Ressalvas:**
  - O dado não é sobre deepfake: é a escala de anúncios de saúde fraudulentos nas redes. Se o PO quiser um dado direto sobre rosto falsificado por IA, a alternativa verificada é o estudo do NetLab de 2024 (primeira alternativa descartada), que cita políticos em anúncios; não usada por causa da RC-08.
  - A fonte nomeia as plataformas da Meta; a caixa diz só "redes sociais". O PO decide se nomeia a empresa (nota do GD sobre o ator ACT-020 e D-083).
  - Os 76% são da amostra analisada manualmente (6.579 anúncios), não dos cerca de 170 mil coletados.
  - O link abre em inglês.
- **Alternativas descartadas:**
  - NetLab/UFRJ, 2024-06-23, "Estudo identifica milhares de anúncios com vídeos manipulados por IA para aplicar 'golpe da Serasa'" (https://netlab.eco.ufrj.br/post/estudo-identifica-milhares-de-an%C3%BAncios-com-v%C3%ADdeos-manipulados-por-ia-para-aplicar-golpe-da-serasa): "Entre os meses de março e maio, 4.321 publicações impulsionadas nas redes sociais da Meta (Facebook e Instagram) utilizaram a imagem de políticos manipuladas por Inteligência Artificial (IA) para aplicar golpes" e "Dos 4.321 anúncios falsos identificados, 1.154 não foram moderados pela Meta." Verificada. Mostra deepfake e falha de moderação (combina com a vivência da carta), mas a página nomeia políticos vivos, inclusive o presidente: descartada pela RC-08. É a melhor reserva se o PO aceitar esse risco.
  - Poder360, 2024-06-19, "Anúncios em plataformas da Meta usam deepfakes de políticos para golpes" (https://www.poder360.com.br/brasil/anuncios-em-plataformas-da-meta-usam-deepfakes-de-politicos-para-golpes/): mesma pesquisa de 2024; imprensa.
  - NetLab/UFRJ, 2025-02-07, "Redes da Meta são um ambiente propício para golpes online": 1.770 anúncios maliciosos de 151 anunciantes entre 10 e 21/01/2025; não menciona IA.
  - Fonte Segura (Fórum Brasileiro de Segurança Pública), 2026-08-18, "O avanço do estelionato em um Brasil cada vez mais digital" (https://fontesegura.forumseguranca.org.br/o-avanco-do-estelionato-em-um-brasil-cada-vez-mais-digital/): "Em 2025, o Brasil contabilizou 2.261.055 ocorrências de estelionato, abrangendo tanto modalidades tradicionais quanto digitais." Verificada e primária; não trata de deepfake nem de anúncios de plataforma. Reserva.
  - AGU, ação contra a Meta por golpes com imagens manipuladas (gov.br/agu): a página exige autenticação e não abriu.

---

## APR-189 — Elogio de robô

**Carta:** INST-189 · **Técnica:** Fazenda de IA · **Força da fonte:** primária (norma)

- **DADOS REAIS proposto (157 caracteres, limite 165):** Regra do TSE (2026): perfis comprovadamente falsos ou robôs podem ser removidos por ordem judicial se repetirem crime eleitoral ou fatos notoriamente falsos.
- **FONTE da caixa (33 caracteres, limite 50):** TSE, Res. 23.755/2026, art. 38-A.
- **url_label:** TSE, Resolução 23.755/2026
- **URL:** https://www.tse.jus.br/legislacao/compilada/res/2026/resolucao-no-23-755-de-2-de-marco-de-2026
- **Acesso:** 2026-10-20 (WebFetch; trechos remontados de blocos consecutivos de até 120 caracteres)
- **Sobre a fonte:** Tribunal Superior Eleitoral, texto compilado da Resolução nº 23.755, de 2 de março de 2026, que altera a Resolução nº 23.610/2019 (propaganda eleitoral). A página avisa que não substitui a publicação no DJE-TSE nº 30, de 4.3.2026. O WebFetch confirmou que o art. 38-A está completo na página, sem cortes.
- **Trecho literal 1 (247 caracteres):** "Art. 38-A. A remoção de perfil será feita quando se tratar de usuário comprovadamente falso, apócrifo ou vinculado a pessoa que sequer exista fora do universo digital (perfil automatizado ou robô), cujas publicações configurem a reiterada prática:"
- **Trecho literal 2 (225 caracteres):** "I - de crime eleitoral; II - de publicação de fatos notoriamente inverídicos ou gravemente descontextualizados que possam atingir a integridade do processo eleitoral, que tenham sido assim reconhecidos pela Justiça Eleitoral."
- **Trecho literal 3 (136 caracteres):** "§ 1º As determinações de remoção de perfil serão aplicadas em processo judicial em que seja assegurada a ampla defesa e o contraditório."
- **Conferência do conceito (ok, com ressalva à pista do GD):** "Cria a ilusão de que todo mundo apoia" tem apoio no Data Privacy Brasil (ver APR-186): "O que o usuário interpreta como reação espontânea pode ser, na verdade, uma construção artificial feita para reforçar determinada narrativa." "Elogios iguais" combina com a definição de disparo em massa da Res. TSE 23.732/2024, art. 37, XXI (https://www.tse.jus.br/legislacao/compilada/res/2024/resolucao-no-23-732-de-27-de-fevereiro-de-2024): "estratégia coordenada de envio, compartilhamento ou encaminhamento de um mesmo conteúdo". "Perfis sem história" e "números que crescem do nada" são heurísticas `[não verificado]` nas fontes lidas.
- **Ressalvas:**
  - A pista do GD dizia "regra do TSE que proíbe perfis falsos, robôs e disparo em massa". O art. 38-A não proíbe esses perfis em geral: prevê a remoção, em processo judicial, de perfil comprovadamente falso ou robô cujas publicações configurem a reiterada prática de crime eleitoral ou de fatos notoriamente inverídicos reconhecidos pela Justiça Eleitoral. Os termos "disparo em massa", "contas inautênticas" e "comportamento inautêntico coordenado" não aparecem no texto da Res. 23.755 (WebFetch). Por isso a caixa diz "podem ser removidos por ordem judicial".
  - A regra não diz que perfil falso que só elogia seja ilícito: vale quando o perfil repete crime eleitoral ou fatos notoriamente falsos. A INST-189 (contratar perfis para elogiar) não deve ser apresentada como ilegal só por isso. O GD e o PSI conferem o tom.
  - § 2º: "É permitida a exclusão pelos provedores de aplicação apenas nas hipóteses de perfis falsos, automatizados ou robô." Dito de outro modo, a plataforma só pode excluir nesses casos (resumo do WebFetch).
  - A resolução vale para as eleições de 2026; o texto é compilado.
  - Nenhuma pessoa viva é nomeada (D-190).
- **Alternativas descartadas:**
  - Res. TSE 23.732/2024 (https://www.tse.jus.br/legislacao/compilada/res/2024/resolucao-no-23-732-de-27-de-fevereiro-de-2024): art. 9º-C (deepfake, cassação) e art. 9º-B, § 3º (chatbots e avatares); o WebFetch informou que o texto não trata de perfis falsos ou robôs além de "chatbots". Usada para as APR-183 e deste conceito.
  - Lei 9.504/1997, art. 57-B (planalto.gov.br): o WebFetch bloqueou a origem (PROVENANCE_REQUIRED).
  - Cartilha do TRE-SP sobre propaganda eleitoral 2026: URL longa demais para o WebFetch.
  - CPMI das Fake News (2019-2020), alternativa do GD: não pesquisada nesta rodada `[não verificado]`.

---

## APR-190 — Medo da vacina

**Carta:** INST-190 · **Técnica:** Pânico Moral · **Força da fonte:** primária

- **DADOS REAIS proposto (159 caracteres, limite 165):** O INCA estima cerca de 19 mil casos novos de câncer do colo do útero por ano (2026–2028), causado pelo HPV e altamente prevenível por vacinação e rastreamento.
- **FONTE da caixa (31 caracteres, limite 50):** INCA/Ministério da Saúde, 2026.
- **url_label:** INCA, 2026
- **URL:** https://www.gov.br/inca/pt-br/assuntos/cancer/numeros/estimativa/sintese-de-resultados-e-comentarios
- **Acesso:** 2026-10-20 (WebFetch; trechos remontados de blocos consecutivos de até 120 caracteres)
- **Sobre a fonte:** Instituto Nacional de Câncer (INCA, Ministério da Saúde), página "Síntese de Resultados e Comentários", seção Estimativa, triênio 2026-2028. O WebFetch recusou reproduzir o parágrafo inteiro e devolveu trechos curtos; os trechos abaixo vêm de duas leituras que coincidem.
- **Trecho literal 1 (70 caracteres):** "é de 19.310, com risco estimado de 17,59 casos a cada 100 mil mulheres"
- **Trecho literal 2 (49 caracteres):** "Nas mulheres, é o terceiro câncer mais incidente."
- **Trecho literal 3 (90 caracteres):** "O câncer do colo do útero é causado pela infecção persistente por tipos oncogênicos do HPV"
- **Trecho literal 4 (60 caracteres):** "altamente prevenível por vacinação e rastreamento organizado"
- **Conferência do conceito (ok):** "Caso isolado vira regra" tem apoio no relatório da USP sobre o Acre, segundo o Aos Fatos (2019-12-02, https://www.aosfatos.org/noticias/relatorio-da-usp-cita-desinformacao-entre-causas-de-rejeicao-vacina-anti-hpv-no-acre/; resumo do WebFetch): "Não foi a vacina contra o HPV, mas fatores emocionais e socioeconômicos que provocaram reações adversas"; 10 dos 12 adolescentes avaliados tiveram diagnóstico de crises não epilépticas de origem psicogênica. O caso de Bertioga (2014) da pista do GD não foi conferido em fonte aberta nesta rodada `[não verificado]`. "Nenhum dado oficial" é pergunta-guia, não fato.
- **Ressalvas:**
  - O INCA estima casos novos para o triênio 2026-2028 (não é contagem). "Cerca de 19 mil" arredonda 19.310.
  - A caixa diz "causado pelo HPV"; a frase do INCA diz "pela infecção persistente por tipos oncogênicos do HPV" (simplificação). A versão para população do INCA (https://www.gov.br/inca/pt-br/assuntos/cancer/tipos/colo-do-utero/versao-para-populacao; resumo do WebFetch) diz que a vacina "não protege contra todos os tipos oncogênicos do HPV" e que o exame preventivo continua necessário; por isso a caixa fala em vacinação "e rastreamento".
  - A página do INCA não usa as palavras "segura" ou "eficaz" sobre a vacina. A Folhapress/Bem Paraná (2026-03-23) atribui ao Ministério da Saúde que ela é "segura, eficaz e oferecida gratuitamente pelo SUS para meninas e meninos de 9 a 14 anos" (imprensa; não usada na caixa).
  - O problema da carta diz "É boato" (pré-desmentido); a caixa traz o dado oficial que o mito esconde. Tema de saúde de menores: o PSI confere o tom (nota do GD).
- **Alternativas descartadas:**
  - Agência Brasil, 2025-08-27, "Vacina do HPV avança no público-alvo, mas precisa resgatar mais velhos" (https://agenciabrasil.ebc.com.br/saude/noticia/2025-08/vacina-do-hpv-avanca-no-publico-alvo-mas-precisa-resgatar-mais-velhos): "a cobertura vacinal em meninas de 9 a 14 anos atingiu 82%" (fonte: Ministério da Saúde; resumo do WebFetch). Verificada; reserva (imprensa pública).
  - Folhapress/Bem Paraná, 2026-03-23, "Câncer de colo de útero matou 20 mulheres por dia em 2025 no Brasil" (https://www.bemparana.com.br/bem-estar/cancer-de-colo-do-utero-matou-20-mulheres-por-dia-em-2025-no-brasil/): "matou quase 20 mulheres por dia em 2025, com 7.249 óbitos no ano", dados preliminares do Ministério da Saúde (resumo do WebFetch). Imprensa e dado preliminar.
  - Futuro da Saúde, 2026-02-04 (https://futurodasaude.com.br/inca-estimativas-cancer-2026-2028/): "câncer do colo do útero, com 19 mil casos por ano". Imprensa especializada; a página do INCA é melhor.
  - SBIm/Fundação do Câncer (via Agência Brasil): "entre 26% e 37% dos jovens consultados não sabiam" que a vacina previne o câncer do colo do útero. Indireto.
  - Perda e retomada do certificado de eliminação do sarampo (alternativa do GD): não pesquisada nesta rodada.

---

## APR-191 — Curso que culpa o pobre

**Carta:** INST-191 · **Técnica:** Didatismo Acusatório · **Força da fonte:** imprensa (pública) sobre estudo de instituto

- **DADOS REAIS proposto (152 caracteres, limite 165):** Em 2026, o Atlas da Mobilidade Social mostrou que 48% dos filhos dos 25% mais pobres seguem nesse grupo na vida adulta. Só 8% chegam aos 25% mais ricos.
- **FONTE da caixa (50 caracteres, limite 50):** Agência Brasil, 2026 (Atlas da Mobilidade Social).
- **url_label:** Agência Brasil, 2026
- **URL:** https://agenciabrasil.ebc.com.br/direitos-humanos/noticia/2026-07/genero-raca-e-origem-familiar-definem-mobilidade-social-diz-estudo
- **Acesso:** 2026-10-20 (WebFetch; trechos remontados de blocos consecutivos de até 120 caracteres)
- **Sobre a fonte:** Agência Brasil (EBC), "Gênero, raça e origem familiar definem mobilidade social, diz estudo", Bruno Bocchini (edição de Sabrina Craide), 31/07/2026, sobre o Atlas da Mobilidade Social, plataforma do Instituto Mobilidade e Desenvolvimento Social (Imds) com o grupo de pesquisa Prospera Lab. A base é o artigo acadêmico "Intergenerational Mobility in the Land of Inequality" (Britto et al., 2025), com dados administrativos da Receita Federal e dos ministérios do Trabalho e Emprego e do Desenvolvimento Social, mais pesquisas domiciliares do IBGE (resumo do WebFetch). A matéria não informa vínculo universitário nem revisão por pares do Atlas; o Atlas em si não foi aberto.
- **Trecho literal 1 (171 caracteres):** "O estudo mostra ainda que filhos de pais que estavam entre os 25% mais pobres da população têm 48% de chance de permanecer nesse mesmo grupo quando atingem a idade adulta."
- **Trecho literal 2 (179 caracteres):** "As possibilidades de romper esse ciclo são reduzidas: apenas 8,32% conseguem alcançar o grupo dos 25% mais ricos e somente 1,28% chegam ao estrato dos 10% com maior renda do país."
- **Conferência do conceito (ok, com ressalva de terminologia):** "Didatismo acusatório" é rótulo do projeto (`docs/05_SISTEMAS_E_MECANICAS.md:419`); não achei fonte externa que use o termo `[não verificado]`. O dado combina com o sinal "história de sucesso no lugar de dado": os números mostram o peso da origem familiar na renda adulta, contra a ideia de culpa individual.
- **Ressalvas:**
  - "Em 2026" é o ano da divulgação (30-31/07/2026). As gerações comparadas nasceram de 1983 a 1990 (matéria e InfoMoney).
  - O 48% é a chance de permanecer entre os 25% mais pobres na vida adulta; o 8,32% é a chance de chegar aos 25% mais ricos (não aos 10% mais ricos: 1,28%). A caixa arredonda para 8%.
  - A Agência Brasil não informa o tamanho da amostra. O InfoMoney (imprensa, 2026-07-31, resumo do WebFetch) diz que o Atlas "acompanha cerca de 7 milhões de brasileiros nascidos entre 1983 e 1990, com renda medida entre 25 e 29 anos"; essa linha não é citação literal e não entra na caixa.
  - Dúvida do GD sobre a consequência A de INST-191 pesar para quem é pobre: o dado mostra que a origem pesa, o que dialoga com essa dúvida.
- **Alternativas descartadas:**
  - InfoMoney, 2026-07-31 (https://www.infomoney.com.br/?p=3432761): "48% dos nascidos nos lares que estão entre os 25% mais pobres permanecem nesta condição" e "E apenas 8,32% chegam ao quarto mais rico da população" (resumo do WebFetch). Imprensa privada; mesmo estudo.
  - SBT News, 2026-07-31, "Filhos dos mais pobres têm só 8% de chance de chegar ao topo" (https://sbtnews.sbt.com.br/noticia/brasil/filhos-dos-mais-pobres-tem-so-8-de-chance-de-chegar-ao-topo): o título chama de "topo" o grupo dos 25% mais ricos. Imprensa; mesmo estudo.
  - IBGE, Síntese de Indicadores Sociais e IPEA (alternativas do GD): as páginas do IBGE não abriram e as buscas por mobilidade intergeracional do IPEA não levaram a página aberta com trecho literal nesta rodada.
  - OCDE, tempo de gerações para a renda média (aparece só em resultados de busca de imprensa): não conferido.

---

## Tabela-resumo

| APR | Dado (resumo) | FONTE (caixa) | Força | Conceito |
| :--- | :--- | :--- | :--- | :--- |
| APR-182 | 67% dos brasileiros de 16+ viram notícia suspeita em 6 meses; metade acha difícil saber (2024) | DataSenado (Agência Senado), 2024 | primária | ok |
| APR-183 | 41% dos usuários de internet relatam contato diário com deepfakes; 11% muito confiantes (2025) | Cetic.br/NIC.br, 2025 | primária | correção proposta |
| APR-184 | ~1 milhão de estrangeiros e naturalizados = 0,5% da população; venezuelanos ~270 mil (Censo 2022) | Agência Brasil, 2025 (Censo 2022, IBGE) | imprensa pública | ok |
| APR-185 | 204 alertas de ataques a jornalistas em 2025; 55% com origem ou repercussão online | Abraji, 2026 | primária | ok |
| APR-186 | 18 avatares de IA comentando política (jan/2025 a abr/2026); 61% sem aviso de IA | Data Privacy Brasil e Aláfia Lab, 2026 | primária | correção proposta |
| APR-187 | Terras indígenas perderam <1% da vegetação nativa em 1985-2024; áreas privadas, 21% | MapBiomas, Coleção 10, 2025 | primária | ok (termo do projeto) |
| APR-188 | 76% de uma amostra de 6.579 anúncios de saúde eram fraudulentos (abr-mai/2025) | NetLab/UFRJ, 2025 | primária | ok, com ressalva |
| APR-189 | Art. 38-A: remoção judicial de perfis falsos/robôs que repetem crime eleitoral ou fatos notoriamente falsos | TSE, Res. 23.755/2026 | primária (norma) | ok, com ressalva |
| APR-190 | ~19 mil casos novos/ano de câncer do colo do útero (2026-2028), prevenível por vacinação e rastreamento | INCA/Ministério da Saúde, 2026 | primária | ok |
| APR-191 | 48% dos filhos dos 25% mais pobres seguem nesse grupo; 8% chegam aos 25% mais ricos (2026) | Agência Brasil, 2026 (Atlas da Mobilidade Social) | imprensa pública | ok (termo do projeto) |

**Contagem:** 10 de 10 com link aberto e trecho literal (nenhum `[não verificado]` no texto ao jogador). 8 fontes primárias e 2 de imprensa pública (APR-184 e APR-191). Conceitos com correção proposta: APR-183 e APR-186. Conceitos com ressalva: APR-188 e APR-189.

## Dúvidas para o PO, o GD e o PSI

1. **INST-184, "Não há prova"** (`cartas.md`, problema da carta): sem o objeto da frase, a afirmação absoluta pode ser contestada (relatório da Câmara citado na REBESP, 2021, sobre furto e roubo em Roraima; ver APR-184). Sugestão: dizer "Não há prova de que sejam a causa" ou limitar a doenças. A caixa evita o tema.
2. **APR-188 não prova o deepfake em si.** O dado é sobre anúncios de saúde fraudulentos. A reserva que mostra deepfake em anúncio de golpe e falha de moderação é o estudo do NetLab de 2024, mas a página nomeia políticos vivos (RC-08). Decisão do PO. Também decide se a caixa nomeia a Meta.
3. **APR-186 não prova origem estrangeira.** Não achei fonte aberta com trecho literal sobre rede estrangeira dirigida ao Brasil. O dado ilustra a técnica.
4. **APR-189**: a regra do TSE não proíbe perfil que só elogia. A caixa diz o que o artigo diz; o tom do aprendizado deve evitar chamar a oferta da carta de crime.
5. **APR-185**: os dados são de jornalistas e veículos, não de streamers.
6. **"Didatismo acusatório"** (APR-187 e APR-191) e **"Desmoralização"** como nomes de técnica são do projeto (`docs/05_SISTEMAS_E_MECANICAS.md:414`, `:419`); não achei fonte externa que use os termos. "Pânico moral" tem base acadêmica (APR-184).
7. **APR-184 e APR-191** têm fonte de imprensa pública porque a página do IBGE e o site do Atlas não abriram; trocar quando abrirem.
8. **APR-187**: a Coleção 11 do MapBiomas (1985-2025, lançada em 12/08/2026) pode atualizar os números; o factsheet não abriu.
9. **Termos de acesso**: todos os links são páginas públicas; o da APR-188 abre em inglês.

## Achados extras (fora das dez cartas)

- `docs/03_PESQUISAS_E_ESTUDOS.md:546` (554 deepfakes, 60% de 920 publicações): **confirmado**. Agência Brasil, Tâmara Freire, 02/10/2026 (https://agenciabrasil.ebc.com.br/geral/noticia/2026-10/mesmo-proibidos-deepfakes-tomam-conta-das-redes-antes-da-eleicao; acesso 2026-10-20): "pelo menos 554 vídeos e imagens do tipo deepfake foram publicadas nas redes sociais," e "Eles correspondem a 60% do total de 920 publicações coletadas entre os dias 16 de agosto e 28 de setembro." Levantamento do projeto VigIA, da agência de checagem Lupa, em parceria com o Recod.ai da Unicamp. A frase "mais que triplicou entre 2024 e 2025" (mesma linha) continua `[não verificado]`.
- `docs/03_PESQUISAS_E_ESTUDOS.md:561` (255 perfis, 58 milhões de visualizações): **confirmado**. Aos Fatos, Bianca Bortolon, 23/09/2026 (https://www.aosfatos.org/noticias/fazendas-de-ia-inflam-pauta-da-extrema-direita-com-255-perfis-e-mais-de-mil-posts/; acesso 2026-10-20): "acumularam 58 milhões de visualizações", relatório "Produção em escala: fazendas de conteúdo com IA no Instagram nas eleições de 2026", do Instituto Democracia em Xeque, de 15 de agosto a 15 de setembro. A fonte trata de perfis "com pautas da extrema direita no Instagram"; a lista de técnicas do doc 03 atribuída à "direita" (`:553-563`) não tem fonte própria `[não verificado]`.
- `docs/03_PESQUISAS_E_ESTUDOS.md:552` ("78% caem em fake news emocionais"; "81% afirmam saber que a tecnologia pode criar deepfakes"): não verificado nesta rodada. O DataSenado 2024 tem 81% para outro dado (notícias falsas podem afetar a eleição).


## Conferência do fio principal (2026-10-21)

5 fontes abertas de novo (WebFetch): APR-182 (DataSenado: "a maioria (67%) da população com 16 anos ou mais já recebeu notícias falsas"; a metade vale para quem viu notícia suspeita), APR-185 (Abraji: 204 alertas; "Em 55,4% dos alertas, os casos tiveram origem ou repercussão no ambiente online"), APR-187 (MapBiomas: "nas áreas privadas ou áreas com CAR sem registro fundiário, a perda foi de 21%"), APR-189 (TSE, art. 38-A: perfil "comprovadamente falso, apócrifo" com "reiterada prática"), APR-191 (Agência Brasil, 31/07/2026: 48% e 8,32%). 5/5 conferem. Ajustes: APR-182 tirou "nos últimos seis meses" (a fonte diz "já recebeu") e APR-187 diz "áreas privadas ou sem registro da terra", como a fonte.
