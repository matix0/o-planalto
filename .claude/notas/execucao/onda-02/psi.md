# Onda 2 — Revisão do PSI (modo Geopolítico, INST-063 a INST-072)

**Autor:** PSI (subagente, Opus) · **Data:** 2026-10-21 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO. É proposta: o PO decide. Sem commit; nenhum outro arquivo alterado.
**Insumos:** `onda-02/cartas.md`, `onda-02/fontes.md`, `onda-02/aprendizados.json`; `docs/10_GUIA_DE_ESTILO_E_TOM.md:132`, `:236-240`, `:487-502`; `jogo/scripts/ui/components/content_warnings.gd:10`; `gestao/decisoes.md:109` (D-097), `:202` (D-190); `gestao/decisoes-provisorias.md:17` (DP-009); `gestao/estado.md:151` (RC-08).
**Conferência:** os textos novos foram contados em NFC por script no scratchpad. Uma cópia das cartas com os ajustes, incluindo os opcionais, passou no `cards_doc.py check` (10 cartas, 0 erros), e uma cópia do JSON passou no `box` (saída 0). Rodei com `PYTHONDONTWRITEBYTECODE=1`.

**Resumo:** 5 aprovadas, 5 com ajuste, 0 reprovadas.

## Veredito por carta

| Carta | Veredito | Problema (PSI) | Texto exato de substituição |
| :--- | :--- | :--- | :--- |
| INST-063 | ajustar | (1) "por risco de espionagem" (`cartas.md:34`) põe a acusação na voz do jogo. É uma alegação dos EUA (IPEA, `fontes.md:33-36`). (2) O conceito diz que a China "pressiona", e as fontes lidas não mostram isso (`fontes.md:41`). (3) O IPEA diz "not explicitly excluded" (`fontes.md:33`); escrever só "não excluiu" apaga a restrição implícita. A perda de `Segurança` pode ficar: com "alegam", ela se lê como a perda da parceria com os EUA (`cartas.md:43`). Opcional: "Manter a concorrência" descreve a opção pelo motivo, enquanto a outra descreve o ato; um nome simétrico deixa a escolha mais clara. | **Problema** (117): "Os EUA pedem que o Brasil vete uma empresa chinesa no 5G. Alegam risco de espionagem. Sem ela, a rede fica mais cara." · APR-063 `concept` (151): "EUA e China disputam a tecnologia do mundo, e cada um quer os outros países do seu lado. Escolher tem preço: em dinheiro, em segurança ou em autonomia." · APR-063 `data` (159): "Em 2021, o leilão do 5G não excluiu a Huawei de forma explícita, apesar da pressão dos EUA. O edital previu uma rede privativa e segura para o governo federal." · Opcional, **Opção B** (24): "Manter a empresa chinesa" |
| INST-064 | ajustar (Aprendizado) | A carta está ok: é uma oferta comercial, sem acusação, e "importados chineses" fala de concorrência, não de estigma. O conceito, porém, afirma uma lei geral que a fonte não sustenta ("Sem ela, o país vende matéria-prima…"): o Banco Central mostra o que o Brasil vende e compra, não a causa (`fontes.md:62`). | APR-064 `concept` (159): "A tarifa de importação protege a indústria local. Sem ela, o país corre o risco de vender matéria-prima e comprar produto pronto. Isso se chama reprimarização." |
| INST-065 | ajustar (Aprendizado) | A carta está ok: o cenário repete as condições do acordo de 1998. O conceito diz que o FMI exige privatização como regra. O próprio FMI diz que só exige quando é essencial, e o acordo de 2002 não teve privatização (`fontes.md:83`). É uma afirmação sobre um órgão real que vai além do fato público. | APR-065 `concept` (153): "O FMI empresta a países em crise, mas exige condições: metas fiscais, reformas e, às vezes, privatizações. O dinheiro alivia agora; o ajuste pesa depois." |
| INST-066 | aprovar | Empresa real no seu papel real (a União tem a ação especial). A venda é hipotética e o comprador não tem nome. A caixa não sugere que houve veto de verdade (o negócio de 2018-2020 caiu por disputa entre as empresas, `fontes.md:107`). | — |
| INST-067 | ajustar | "Sócios do BRICS propõem" (`cartas.md:142`) mostra como fato do bloco uma proposta que não existe (Nova Délhi 2026 e IPEA 2025, `fontes.md:126-127`), em ano de eleição e com o boato "o real vai acabar" circulando. Dizer que é um sócio só e usar o condicional marcam que é hipótese; a caixa continua desmentindo. | **Problema** (121): "Um sócio do BRICS defende uma moeda comum. O Brasil dependeria menos do dólar, mas deixaria de decidir os próprios juros." |
| INST-068 | aprovar (sugestão opcional) | A morte aparece sem detalhe gráfico e com a palavra direta que o guia pede (`docs/10_GUIA_DE_ESTILO_E_TOM.md:132`), como avisa a tela inicial: "O jogo fala de fome e morte sem eufemismo" (`content_warnings.gd:10`). Opcional: o evento só cobra custo político do Presidente. A morte dos soldados (jovens, muitos da periferia) deveria pesar na `Dignidade`, que mede os direitos do povo (DP-009, `gestao/decisoes-provisorias.md:17`). | Opcional, **Evento A**: "Soldados brasileiros morrem no conflito" · atraso 1 · `Legitimidade` -10, `Dignidade` -5 |
| INST-069 | ajustar | A consequência A mostra os indígenas só protestando contra a mina (`cartas.md:199`), o que repete a imagem do "indígena que atrapalha". Mostrar o direito violado e o caminho legal liga a carta ao conceito da caixa (consulta prévia, OIT 169, `fontes.md:180`). No resto, sem estereótipo: "povos" vem no plural e a mineradora não tem nome. | **Consequência A** (68): "O potássio sai do chão, sem consulta. Povos indígenas vão à Justiça." |
| INST-070 | aprovar | Empresa real, sem acusação; a greve aparece sem estigma. "Protege o caixa" é um efeito plausível (IPEA 2017, `fontes.md:206`), não uma acusação, e pode ficar. | — |
| INST-071 | aprovar | Ameaçar com tarifas quem cria imposto digital é um padrão público (USTR, 2019-2021, `fontes.md:224-239`). Ver a resposta sobre o tarifaço. | — |
| INST-072 | aprovar | A fala é atribuída a um país e aparece sem aspas na tela (o script tira as aspas, `jogo/tools/cards_doc.py:362`). É uma queixa pública e antiga (revisão de 2009-2011, `fontes.md:270`). A frase de impacto ajuda a combater o patriotismo contra o vizinho. | — |

## Respostas às dúvidas do GD (`cartas.md:318-326`)

1. **INST-068 (mortes):** o tom é adequado para 15 a 30 anos (ver a tabela). Manter "morrem".
2. **INST-069 (mineração e povos indígenas):** sem estereótipo depois do ajuste da consequência A. Não precisa de aviso novo: "Racismo" já está na lista (DP-008).
3. **INST-072 (Paraguai):** passa, porque é queixa pública, atribuída a um país, sem aspas.
4. **INST-063 (espionagem):** sim, precisa de "alegam" (ver o ajuste).
5. **Empresas e países reais:** estão ok. Embraer e Petrobras aparecem no papel real; a pressão dos EUA é pública. A oferta da China na INST-064 é hipótese, não acusação.
6. **INST-067 (boato "o real vai acabar"):** o risco existe. Por isso o ajuste do problema, mantendo o desmentido na caixa (o "Por isso" já saiu do JSON, de acordo).
7. **Cores:** nada a pedir. Pela D-097, o PSI não pede neutralidade (`gestao/decisoes.md:109`).

## Dúvidas do pesquisador que tocam em ética (`fontes.md:302-313`)

- **APR-071, tarifaço de 2026: não usar.** (a) A tarifa não veio de imposto digital, que o Brasil não tem (`fontes.md:244`); o jogador concluiria uma causa falsa. (b) O tema é munição na campanha do 2º turno e envolve políticos vivos (RC-08 alto, `gestao/estado.md:151`). Manter o dado da USTR de 2021. Rever depois do parecer jurídico e da eleição; se o tarifaço entrar um dia, dizer que a tarifa de 2026 não veio de imposto digital.
- **APR-063, nomear a Huawei: recomendo nomear.** É fato público (IPEA) e não há acusação: o dado diz que ela não foi excluída, e a alegação de espionagem fica com os EUA na carta. Se o PO preferir não nomear, existe uma versão sem o nome (`fontes.md:42`).
- **APR-065:** adotar a redação mais segura (ajuste acima). **APR-070:** manter o texto atual.
- **Doc 03 §03.13:** a citação atribuída ao IPEA é de outro autor (`fontes.md:131`). Está fora desta revisão, mas a D-190 manda conferir citações no original: corrigir a atribuição.

## Só o PO decide

1. **INST-063:** nomear a Huawei; trocar ou não o nome da Opção B (opcional).
2. **INST-068:** pôr `Dignidade` no evento muda o balanceamento; o ECO confere.
3. **INST-071:** deixar o tarifaço de fora agora e marcar quando rever.
4. **INST-067:** o problema novo muda o cenário (um sócio só, no condicional).

## Fora do escopo (para o QA)

- Os títulos no JSON usam maiúsculas em cada palavra ("Moeda Comum do BRICS", "Envio de Tropas", "Corte de Fertilizantes", "Preço do Petróleo", "Taxação das Big Techs") e não batem com o título das cartas.
- Os textos de evento desta onda não têm ponto final; os da Onda 1 têm.
