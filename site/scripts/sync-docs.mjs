// Copia `docs/*.md` (fonte de verdade, legível no GitHub) para a coleção do Starlight,
// acrescentando o front matter que o Starlight exige. Os arquivos gerados não vão para o git.
//
// - O título vem de `src/docs-map.mjs`; o H1 do próprio doc sai do corpo (o Starlight já mostra o título).
// - Anterior/próximo seguem a ordem numérica 00–13, mesmo com o menu agrupado por seções.
// - Docs com `aviso` ganham um aviso de conteúdo no topo; docs `incompleto` ganham banner e `noindex`.

import { readFile, writeFile, readdir, rm, mkdir } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import path from 'node:path';
import { DOCS } from '../src/docs-map.mjs';

const raiz = path.resolve(fileURLToPath(import.meta.url), '../../..');
const origem = path.join(raiz, 'docs');
const destino = path.join(raiz, 'site/src/content/docs');
const BASE = '/o-planalto';

const AVISO = `:::caution[Aviso de conteúdo]
Este documento cita pessoas e partidos reais e traz posições assumidas pelo projeto. [Veja como trabalhamos e como contestar](${BASE}/sobre/).
:::`;

const banner = (secao) =>
	`<strong>Documento incompleto.</strong> O começo deste documento está faltando: a primeira seção completa é a ${secao}. O conteúdo está sendo recuperado.`;

const yaml = (valor) => JSON.stringify(valor);

// Medidores (D-014) e sub-medidores (D-015) escritos como código inline viram fichas do jogo no CSS.
const MEDIDORES = ['Dignidade', 'Consciência', 'Soberania', 'Segurança', 'Verdade', 'Caixa', 'Capital Político', 'Legitimidade', 'Desemprego', 'Inflação', 'Juros'];
const reMedidor = new RegExp('`(' + MEDIDORES.join('|') + ')`', 'g');

function marcarMedidores(corpo) {
	let emBloco = false;
	return corpo
		.split('\n')
		.map((linha) => {
			if (linha.startsWith('```')) emBloco = !emBloco;
			return emBloco ? linha : linha.replace(reMedidor, '<code class="medidor">$1</code>');
		})
		.join('\n');
}

function limparCorpo(texto) {
	let corpo = texto.replace(/^﻿/, '');
	// Front matter antigo (ex.: `permalink` da época do Jekyll).
	corpo = corpo.replace(/^---\n[\s\S]*?\n---\n/, '');
	const linhas = corpo.split('\n');
	// Remove linhas em branco, H1 e réguas (`---`) antes do primeiro conteúdo real.
	while (linhas.length && /^(\s*|#\s.*|-{3,}\s*)$/.test(linhas[0])) linhas.shift();
	return linhas.join('\n').trimEnd() + '\n';
}

const ordemNumerica = [...DOCS].sort((a, b) => a.arquivo.localeCompare(b.arquivo));

await mkdir(destino, { recursive: true });
for (const nome of await readdir(destino)) {
	if (/^\d{2}-.*\.md$/.test(nome)) await rm(path.join(destino, nome));
}

for (const [i, doc] of ordemNumerica.entries()) {
	const texto = await readFile(path.join(origem, doc.arquivo), 'utf8');
	const anterior = ordemNumerica[i - 1];
	const proximo = ordemNumerica[i + 1];
	const fm = [
		'---',
		`title: ${yaml(doc.titulo)}`,
		`description: ${yaml(doc.descricao)}`,
		'sidebar:',
		`  label: ${yaml(`${doc.arquivo.slice(0, 2)} · ${doc.curto}`)}`,
	];
	if (doc.incompleto) {
		fm.push('  badge:', '    text: incompleto', '    variant: default');
		fm.push(`banner:`, `  content: ${yaml(banner(doc.incompleto))}`);
		fm.push('head:', '  - tag: meta', '    attrs:', '      name: robots', '      content: noindex');
	}
	fm.push(anterior ? `prev:\n  link: ${yaml(`${BASE}/${anterior.slug}/`)}\n  label: ${yaml(anterior.titulo)}` : 'prev: false');
	fm.push(proximo ? `next:\n  link: ${yaml(`${BASE}/${proximo.slug}/`)}\n  label: ${yaml(proximo.titulo)}` : 'next: false');
	fm.push(`editUrl: ${yaml(`https://github.com/matix0/o-planalto/blob/main/docs/${doc.arquivo}`)}`);
	fm.push('---', '');

	const corpo = marcarMedidores(limparCorpo(texto));
	const saida = fm.join('\n') + (doc.aviso ? `${AVISO}\n\n` : '') + corpo;
	await writeFile(path.join(destino, `${doc.slug}.md`), saida);
}

console.log(`sync-docs: ${DOCS.length} documentos de docs/ → site/src/content/docs/`);
