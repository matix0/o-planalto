// Fonte única dos metadados do site: título, seção, avisos e estado de cada doc em `docs/` e `gdd/`.
// Usado pelo script de sincronização (scripts/sync-docs.mjs), pelo menu (astro.config.mjs)
// e pelos cards da home (src/components/SecoesHome.astro).

export const SECOES = [
	{ nome: 'Visão geral', resumo: 'O que é o jogo, para quem e por que ele existe.' },
	{ nome: 'Identidade e pesquisa', resumo: 'Nome, cores, tom e os estudos que sustentam o jogo.' },
	{ nome: 'Design do jogo', resumo: 'Medidores, cartas, finais, atores e modos.' },
	{ nome: 'Produção e histórico', resumo: 'Referências, decisões tomadas e plano de produção.' },
	{ nome: 'Referência rápida', resumo: 'Glossário e guia de estilo para quem escreve as cartas.' },
	{ nome: 'Roteiros', resumo: 'As 340 cartas e suas Cartas de Aprendizado.' },
	{ nome: 'Técnico', resumo: 'Stack, estrutura de dados e fluxos do protótipo.' },
	{ nome: 'GDD', resumo: 'O Game Design Document: o mestre e os 10 sistemas, com as regras completas.' },
];

// `aviso`: o doc cita pessoas ou partidos reais e posições assumidas (D-075).
// `incompleto`: o começo do doc está faltando; valor = primeira seção completa (D-078).
// `pasta`: pasta de origem a partir da raiz do repositório (padrão `docs`); `num`: número exibido no menu.
export const DOCS = [
	{ arquivo: '00_INDICE_GERAL.md', slug: '00-indice-geral', titulo: '00 — Índice Geral', curto: 'Índice geral', secao: 'Visão geral', descricao: 'Visão geral do projeto O Planalto e mapa da documentação.' },
	{ arquivo: '01_CONTEXTO_E_MOTIVACAO.md', slug: '01-contexto-e-motivacao', titulo: '01 — Contexto e Motivação', curto: 'Contexto e motivação', secao: 'Visão geral', descricao: 'Origem, objetivo, público e tom do jogo.', aviso: true },
	{ arquivo: '02_IDENTIDADE_E_NOMENCLATURA.md', slug: '02-identidade-e-nomenclatura', titulo: '02 — Identidade e Nomenclatura', curto: 'Identidade e nomenclatura', secao: 'Identidade e pesquisa', descricao: 'Nome, cores, identidade visual, plataforma e formato do jogo.', aviso: true },
	{ arquivo: '03_PESQUISAS_E_ESTUDOS.md', slug: '03-pesquisas-e-estudos', titulo: '03 — Pesquisas e Estudos', curto: 'Pesquisas e estudos', secao: 'Identidade e pesquisa', descricao: 'Pesquisas temáticas que fundamentam o jogo.', aviso: true },
	{ arquivo: '04_DESIGN_DO_JOGO.md', slug: '04-design-do-jogo', titulo: '04 — Design do Jogo', curto: 'Design do jogo', secao: 'Design do jogo', descricao: 'Premissa, medidores, turnos, modos, atores, cartas, finais e balanceamento do jogo.', aviso: true },
	{ arquivo: '05_SISTEMAS_E_MECANICAS.md', slug: '05-sistemas-e-mecanicas', titulo: '05 — Sistemas e Mecânicas', curto: 'Sistemas e mecânicas', secao: 'Design do jogo', descricao: 'Os 9 sistemas do jogo: medidores, cartas, sorteio, atores, eventos, impeachment, eixo, calibração e desinformação.' },
	{ arquivo: '11_FICHAS_DOS_ATORES.md', slug: '11-fichas-dos-atores', titulo: '11 — Fichas dos Atores', curto: 'Fichas dos atores', secao: 'Design do jogo', descricao: 'Perfil detalhado dos 20 atores do jogo.' },
	{ arquivo: '12_FICHAS_DOS_MODOS.md', slug: '12-fichas-dos-modos', titulo: '12 — Fichas dos Modos', curto: 'Fichas dos modos', secao: 'Design do jogo', descricao: 'Os 10 modos institucionais do jogo.' },
	{ arquivo: '06_REFERENCIAS_E_INSPIRACOES.md', slug: '06-referencias-e-inspiracoes', titulo: '06 — Referências e Inspirações', curto: 'Referências e inspirações', secao: 'Produção e histórico', descricao: 'Jogos, ferramentas, testes políticos e teorias que inspiraram o projeto.' },
	{ arquivo: '07_HISTORICO_DE_DECISOES.md', slug: '07-historico-de-decisoes', titulo: '07 — Histórico de Decisões', curto: 'Histórico de decisões', secao: 'Produção e histórico', descricao: 'O que foi adotado, descartado e o que segue em aberto.' },
	{ arquivo: '08_PRODUCAO_E_PROXIMOS_PASSOS.md', slug: '08-producao-e-proximos-passos', titulo: '08 — Produção e Próximos Passos', curto: 'Produção e próximos passos', secao: 'Produção e histórico', descricao: 'Stack, equipe, cronograma, validação, questões legais e distribuição.', aviso: true },
	{ arquivo: '09_GLOSSARIO.md', slug: '09-glossario', titulo: '09 — Glossário', curto: 'Glossário', secao: 'Referência rápida', descricao: 'Termos institucionais, políticos e do jogo.', aviso: true },
	{ arquivo: '10_GUIA_DE_ESTILO_E_TOM.md', slug: '10-guia-de-estilo-e-tom', titulo: '10 — Guia de Estilo e Tom', curto: 'Guia de estilo e tom', secao: 'Referência rápida', descricao: 'Tom, regras de escrita, diálogos, finais e checklists para escrever as cartas.', aviso: true },
	{ arquivo: '14_UI_UX_DESIGN.md', slug: '14-ui-ux-design', titulo: '14 — UI/UX Design', curto: 'UI/UX design', secao: 'Design do jogo', descricao: 'Telas, HUD, gesto, animações e acessibilidade do jogo.', aviso: true },
	{ arquivo: '15_FLUXO_DO_JOGO.md', slug: '15-fluxo-do-jogo', titulo: '15 — Fluxo do Jogo', curto: 'Fluxo do jogo', secao: 'Design do jogo', descricao: 'O fluxo completo de uma partida, da tela inicial ao final.' },
	{ arquivo: '16_MANUAL_DO_JOGADOR.md', slug: '16-manual-do-jogador', titulo: '16 — Manual do Jogador', curto: 'Manual do jogador', secao: 'Visão geral', descricao: 'Guia para jogar O Planalto.', aviso: true },
	{ arquivo: '17_ROTEIRO_DAS_CARTAS.md', slug: '17-roteiro-das-cartas', titulo: '17 — Roteiro das Cartas', curto: 'Roteiro das cartas', secao: 'Roteiros', descricao: 'Roteiro das cartas do jogo (22 de 340 escritas).', aviso: true },
	{ arquivo: '18_ROTEIRO_DAS_CARTAS_DE_APRENDIZADO.md', slug: '18-roteiro-das-cartas-de-aprendizado', titulo: '18 — Roteiro das Cartas de Aprendizado', curto: 'Cartas de aprendizado', secao: 'Roteiros', descricao: 'Roteiro das Cartas de Aprendizado, por modo.', aviso: true },
	{ arquivo: '13_ARQUITETURA_TECNICA.md', slug: '13-arquitetura-tecnica', titulo: '13 — Arquitetura Técnica', curto: 'Arquitetura técnica', secao: 'Técnico', descricao: 'Stack, estrutura de dados, sistemas e fluxos do jogo.' },
	{ pasta: 'gdd', arquivo: 'GDD.md', slug: 'gdd', num: 'GDD', titulo: 'GDD — Game Design Document', curto: 'GDD mestre', secao: 'GDD', descricao: 'Documento mestre do jogo: pilares, loop, sistemas, conteúdo, arte, áudio e balanceamento.', aviso: true },
	{ pasta: 'gdd/sistemas', arquivo: '00_INDICE.md', slug: 'gdd-00-indice', titulo: 'GDD 00 — Índice de Sistemas', curto: 'Índice de sistemas', secao: 'GDD', descricao: 'Os 10 sistemas do jogo, suas dependências e a ordem de escrita dos GDDs.' },
	{ pasta: 'gdd/sistemas', arquivo: '01_medidores.md', slug: 'gdd-01-medidores', titulo: 'GDD 01 — Medidores', curto: 'Medidores', secao: 'GDD', descricao: 'Os 8 medidores, as relações entre eles, o fechamento do turno e a calibração.' },
	{ pasta: 'gdd/sistemas', arquivo: '02_finais.md', slug: 'gdd-02-finais', titulo: 'GDD 02 — Finais', curto: 'Finais', secao: 'GDD', descricao: 'Os 28 finais, a prioridade entre eles, as citações e o epílogo.', aviso: true },
	{ pasta: 'gdd/sistemas', arquivo: '03_impeachment.md', slug: 'gdd-03-impeachment', titulo: 'GDD 03 — Impeachment', curto: 'Impeachment', secao: 'GDD', descricao: 'Gatilhos, a cena de 5 fases, os testes e os placares.' },
	{ pasta: 'gdd/sistemas', arquivo: '04_eixo.md', slug: 'gdd-04-eixo', titulo: 'GDD 04 — Eixo Ideológico', curto: 'Eixo ideológico', secao: 'GDD', descricao: 'Os 4 eixos, a pontuação das opções e a revelação final.' },
	{ pasta: 'gdd/sistemas', arquivo: '05_cartas.md', slug: 'gdd-05-cartas', titulo: 'GDD 05 — Cartas', curto: 'Cartas', secao: 'GDD', descricao: 'Estrutura da carta, opções, sorteio do lado, cores e resolução.' },
	{ pasta: 'gdd/sistemas', arquivo: '06_sorteio.md', slug: 'gdd-06-sorteio', titulo: 'GDD 06 — Sorteio', curto: 'Sorteio', secao: 'GDD', descricao: 'Elegibilidade, cartas obrigatórias, variedade e sorteio do turno.' },
	{ pasta: 'gdd/sistemas', arquivo: '07_atores.md', slug: 'gdd-07-atores', titulo: 'GDD 07 — Satisfação dos Atores', curto: 'Satisfação dos atores', secao: 'GDD', descricao: 'Níveis de satisfação, atualização e cartas dos 24 atores.' },
	{ pasta: 'gdd/sistemas', arquivo: '08_eventos.md', slug: 'gdd-08-eventos', titulo: 'GDD 08 — Eventos Encadeados', curto: 'Eventos encadeados', secao: 'GDD', descricao: 'Eventos agendados pelas opções, atraso, aviso e epílogo.' },
	{ pasta: 'gdd/sistemas', arquivo: '09_desinformacao.md', slug: 'gdd-09-desinformacao', titulo: 'GDD 09 — Desinformação', curto: 'Desinformação', secao: 'GDD', descricao: 'O modo Influenciador, as 6 técnicas e a inoculação.' },
	{ pasta: 'gdd/sistemas', arquivo: '10_estado_partida.md', slug: 'gdd-10-estado-partida', titulo: 'GDD 10 — Estado da Partida', curto: 'Estado da partida', secao: 'GDD', descricao: 'Máquina de estados, fim imediato, abandono e salvamento.' },
];

export const numero = (doc) => doc.num ?? doc.arquivo.slice(0, 2);
