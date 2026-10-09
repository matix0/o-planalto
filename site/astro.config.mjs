// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import { DOCS, SECOES } from './src/docs-map.mjs';

export default defineConfig({
	site: 'https://matix0.github.io',
	base: '/o-planalto',
	integrations: [
		starlight({
			title: 'O Planalto',
			description:
				'Documentação aberta de um jogo educativo de cartas sobre política brasileira, para jovens de 15 a 30 anos.',
			defaultLocale: 'root',
			locales: { root: { label: 'Português', lang: 'pt-BR' } },
			favicon: '/favicon.svg',
			social: [{ icon: 'github', label: 'Repositório no GitHub', href: 'https://github.com/matix0/o-planalto' }],
			sidebar: [
				{ label: 'Comece aqui', items: [{ label: 'Início', link: '/' }, 'sobre'] },
				...SECOES.map(({ nome }) => ({
					label: nome,
					items: DOCS.filter((doc) => doc.secao === nome).map((doc) => doc.slug),
				})),
			],
			tableOfContents: { minHeadingLevel: 2, maxHeadingLevel: 3 },
			customCss: [
				'@fontsource/inter/400.css',
				'@fontsource/inter/500.css',
				'@fontsource/inter/600.css',
				'@fontsource/poppins/600.css',
				'@fontsource/poppins/700.css',
				'@fontsource/poppins/800.css',
				'@fontsource/noto-sans-mono/400.css',
				'./src/styles/planalto.css',
			],
			components: { Footer: './src/components/Footer.astro' },
			expressiveCode: {
				themes: ['github-dark-default', 'github-light-default'],
				styleOverrides: { borderRadius: '12px', codeFontSize: '0.8125rem', codeLineHeight: '1.4' },
			},
		}),
	],
});
