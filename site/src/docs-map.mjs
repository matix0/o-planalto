// Fonte única dos metadados do site: título, seção, avisos e estado de cada doc em `docs/`.
// Usado pelo script de sincronização (scripts/sync-docs.mjs), pelo menu (astro.config.mjs)
// e pelos cards da home (src/components/SecoesHome.astro).

export const SECOES = [
	{ nome: 'Visão geral', resumo: 'O que é o jogo, para quem e por que ele existe.' },
	{ nome: 'Identidade e pesquisa', resumo: 'Nome, cores, tom e os estudos que sustentam o jogo.' },
	{ nome: 'Design do jogo', resumo: 'Medidores, cartas, finais, atores e modos.' },
	{ nome: 'Produção e histórico', resumo: 'Referências, decisões tomadas e plano de produção.' },
	{ nome: 'Referência rápida', resumo: 'Glossário e guia de estilo para quem escreve as cartas.' },
	{ nome: 'Técnico', resumo: 'Stack, estrutura de dados e fluxos do protótipo.' },
];

// `aviso`: o doc cita pessoas ou partidos reais e posições assumidas (D-075).
// `incompleto`: o começo do doc está faltando; valor = primeira seção completa (D-078).
export const DOCS = [
	{ arquivo: '00_INDICE_GERAL.md', slug: '00-indice-geral', titulo: '00 — Índice Geral', curto: 'Índice geral', secao: 'Visão geral', descricao: 'Visão geral do projeto O Planalto e mapa da documentação.' },
	{ arquivo: '01_CONTEXTO_E_MOTIVACAO.md', slug: '01-contexto-e-motivacao', titulo: '01 — Contexto e Motivação', curto: 'Contexto e motivação', secao: 'Visão geral', descricao: 'Origem, objetivo, público e tom do jogo.', aviso: true },
	{ arquivo: '02_IDENTIDADE_E_NOMENCLATURA.md', slug: '02-identidade-e-nomenclatura', titulo: '02 — Identidade e Nomenclatura', curto: 'Identidade e nomenclatura', secao: 'Identidade e pesquisa', descricao: 'Nome, cores, identidade visual, plataforma e formato do jogo.', aviso: true },
	{ arquivo: '03_PESQUISAS_E_ESTUDOS.md', slug: '03-pesquisas-e-estudos', titulo: '03 — Pesquisas e Estudos', curto: 'Pesquisas e estudos', secao: 'Identidade e pesquisa', descricao: 'Pesquisas temáticas que fundamentam o jogo.', aviso: true },
	{ arquivo: '04_DESIGN_DO_JOGO.md', slug: '04-design-do-jogo', titulo: '04 — Design do Jogo', curto: 'Design do jogo', secao: 'Design do jogo', descricao: 'Premissa, medidores, turnos, modos, atores, cartas, finais e balanceamento do jogo.', aviso: true },
	{ arquivo: '05_SISTEMAS_E_MECANICAS.md', slug: '05-sistemas-e-mecanicas', titulo: '05 — Sistemas e Mecânicas', curto: 'Sistemas e mecânicas', secao: 'Design do jogo', descricao: 'Relações entre os medidores do jogo.', incompleto: '05.09' },
	{ arquivo: '11_FICHAS_DOS_ATORES.md', slug: '11-fichas-dos-atores', titulo: '11 — Fichas dos Atores', curto: 'Fichas dos atores', secao: 'Design do jogo', descricao: 'Perfil detalhado dos 20 atores do jogo.' },
	{ arquivo: '12_FICHAS_DOS_MODOS.md', slug: '12-fichas-dos-modos', titulo: '12 — Fichas dos Modos', curto: 'Fichas dos modos', secao: 'Design do jogo', descricao: 'Os 10 modos institucionais do jogo.' },
	{ arquivo: '06_REFERENCIAS_E_INSPIRACOES.md', slug: '06-referencias-e-inspiracoes', titulo: '06 — Referências e Inspirações', curto: 'Referências e inspirações', secao: 'Produção e histórico', descricao: 'Referências teóricas e síntese das inspirações.', incompleto: '06.13' },
	{ arquivo: '07_HISTORICO_DE_DECISOES.md', slug: '07-historico-de-decisoes', titulo: '07 — Histórico de Decisões', curto: 'Histórico de decisões', secao: 'Produção e histórico', descricao: 'O que foi adotado, descartado e o que segue em aberto.' },
	{ arquivo: '08_PRODUCAO_E_PROXIMOS_PASSOS.md', slug: '08-producao-e-proximos-passos', titulo: '08 — Produção e Próximos Passos', curto: 'Produção e próximos passos', secao: 'Produção e histórico', descricao: 'Equipe, cronograma, validação pedagógica e questões legais.', incompleto: '08.3' },
	{ arquivo: '09_GLOSSARIO.md', slug: '09-glossario', titulo: '09 — Glossário', curto: 'Glossário', secao: 'Referência rápida', descricao: 'Termos institucionais, políticos e do jogo.', aviso: true },
	{ arquivo: '10_GUIA_DE_ESTILO_E_TOM.md', slug: '10-guia-de-estilo-e-tom', titulo: '10 — Guia de Estilo e Tom', curto: 'Guia de estilo e tom', secao: 'Referência rápida', descricao: 'Checklist de qualidade para escrever as cartas.', incompleto: '10.10' },
	{ arquivo: '13_ARQUITETURA_TECNICA.md', slug: '13-arquitetura-tecnica', titulo: '13 — Arquitetura Técnica', curto: 'Arquitetura técnica', secao: 'Técnico', descricao: 'Stack, estrutura de dados, sistemas e fluxos do jogo.' },
];

export const numero = (doc) => doc.arquivo.slice(0, 2);
