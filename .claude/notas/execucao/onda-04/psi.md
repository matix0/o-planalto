# Onda 4 — Revisão do PSI (modo Geopolítico, INST-073 a INST-080)

**Autor:** PSI (subagente, Opus) · **Data:** 2026-10-21 · **Branch:** `claude/p014-p015`
**Status:** CONCLUÍDO. É proposta: o PO decide. Sem commit; nenhum outro arquivo alterado.
**Insumos:** `onda-04/cartas.md`, `onda-04/fontes.md`, `onda-04/aprendizados.json` (e `aprendizados.md`); padrão das Ondas 1 e 2 (`onda-01/psi.md`, `onda-02/psi.md`); `docs/10_GUIA_DE_ESTILO_E_TOM.md:239`, `:258-262`; `docs/11_FICHAS_DOS_ATORES.md:479-496`; `jogo/scripts/game_data.gd:83-84`; `jogo/scripts/ui/components/content_warnings.gd:9`; `gestao/decisoes.md:109` (D-097), `:115` (D-103), `:202` (D-190); `gestao/estado.md:151` (RC-08), `:169`.
**Conferência:** textos novos contados em NFC (acento = 1) por script no scratchpad. Uma cópia das cartas com todos os ajustes, inclusive os opcionais, passou no `cards_doc.py check --style` (8 cartas, 0 erros, 0 avisos de estilo; as 7 cores seguem com saldo negativo em pelo menos um medidor). Uma cópia do JSON passou no `box` (saída 0; vivência em 2 linhas, conceito e dado em 3, 63 colunas). Rodei com `PYTHONDONTWRITEBYTECODE=1`; `git status` limpo.

**Resumo:** 3 aprovadas, 5 com ajuste, 0 reprovadas.

## Veredito por carta

| Carta | Veredito | Problema (PSI) | Texto exato de substituição |
| :--- | :--- | :--- | :--- |
| INST-073 | ajustar | O título "Compra de terras pela China" e "Fundos chineses" (`cartas.md:32`, `:39`, `:42`) dão à China um papel que a caixa não sustenta: a lei vale para qualquer estrangeiro (`fontes.md:46`). O pouco que se achou, imprensa de 2020, põe a China em 21º lugar entre os donos estrangeiros de terra (`fontes.md:50`). Em ano de eleição, a carta reforça sem base o medo de que "a China compra o Brasil". O `ACT-021` já é "China e EUA" (`docs/11_FICHAS_DOS_ATORES.md:479`), e a carta funciona igual sem nacionalidade. | **Título** (3 palavras): "Terras para estrangeiros" · **Problema** (117): "O Congresso libera a compra de terras por estrangeiros. Fundos de fora negociam fazendas de soja. Falta a sua sanção." · **Consequência A** (64): "Dinheiro de fora entra no campo. Fazendas de soja mudam de dono." · APR-073 `title`: "Terras para estrangeiros" · Alternativa com as duas potências, **Problema** (128): "O Congresso libera a compra de terras por estrangeiros. Fundos dos EUA e da China negociam fazendas de soja. Falta a sua sanção." |
| INST-074 | ajustar | (1) "Querem tratá-las como terroristas" (`cartas.md:70`) envelheceu: os EUA já designaram o PCC e o CV em 28/05/2026 (`fontes.md:66`). (2) "E agir em solo brasileiro" põe na voz do jogo uma intenção dos EUA que não é fato público (`fontes.md:86`). É acusação nova a um país (D-190). Escrito como oferta da cena, o texto vira hipótese. "Duas facções" é o que a fonte diz. (3) A vivência diz "em troca de chamá-las de terroristas" (`aprendizados.json:19`), o que o problema não diz. Sobre o tom partidário, ver a resposta 3. Opcional, para o ECO: o eixo da opção A tem Sociedade −1 (`cartas.md:74`), mas a opção não perde nada em direitos. Para o público da periferia, operação militar estrangeira contra facção não sai de graça para os moradores. | **Problema** (112): "Os EUA, que tratam duas facções como terroristas, oferecem drones e agentes para combatê-las em solo brasileiro." · APR-074 `lived` (108): "Você decidiu se aceitava drones e agentes dos EUA no Brasil contra facções que eles tratam como terroristas." · Opcional, **Efeitos A**: `Segurança` +15, `Capital Político` +5, `Soberania` -15, `Dignidade` -5 |
| INST-075 | ajustar (leve) | "O clube dos países ricos" (`cartas.md:101`) é apelido (`fontes.md:119`) usado como definição, mas a OCDE tem membros de renda média (`fontes.md:123`). As aspas marcam o apelido e mantêm a explicação rápida. O resto está ok: a opção alinhada ganha `Integridade`, sem caricatura, e a troca de 2019 aparece sem nomes. | **Problema** (139): "Os EUA apoiam a entrada do Brasil na OCDE, o 'clube dos países ricos'. Em troca, o Brasil abre mão de vantagens de país em desenvolvimento." |
| INST-076 | aprovar | A carta não desinforma sobre saúde: as duas opções vacinam. O atraso da produção nacional tem base no caso real, com a licença em 2007 e a produção em 2009 (`fontes.md:153`), por falta de capacidade técnica (`fontes.md:158`). A farmacêutica não tem nome. Sobre as "sanções", ver a resposta 6. | — |
| INST-077 | ajustar (Aprendizado) | A carta está ok quanto ao aviso "Racismo". A remoção aparece sem detalhe gráfico (`cartas.md:166`). Os quilombolas vão à Justiça (evento A, `:169`) e não aparecem como obstáculo; a consequência B põe o custo no aluguel, não nas famílias. Ver a resposta 1. O conceito (`aprendizados.json:59`) define o quilombo só pela escravidão ("descendentes de pessoas escravizadas"). A Corte fala em comunidades "formadas inicialmente por pessoas que escaparam da escravidão" (`fontes.md:200`). Para o público negro e periférico, nomear a resistência é mais exato e não reduz o grupo à condição de vítima. | APR-077 `concept` (166): "Quilombos são comunidades negras formadas por quem resistiu à escravidão e por seus descendentes. A Constituição reconhece a elas a propriedade das terras que ocupam." |
| INST-078 | aprovar (sugestão opcional) | A periferia aparece como beneficiária, sem estereótipo. A exigência de tarifa é cenário com instituição real (`fontes.md:259`). Passa como hipótese, como a oferta da China na INST-064, e a caixa não generaliza. Opcional: "A obra é pública" (`cartas.md:197`) sugere que a opção do Banco Mundial privatiza, o que a carta não diz; o GD tirou a privatização para não repetir a INST-065. | Opcional, **Consequência A** (62): "A obra chega a menos bairros. Parte do custo sai do seu caixa." |
| INST-079 | aprovar | Ex-agente e potência sem nome. A alusão ao caso de 2013 passa (ver a resposta 4). A caixa traz só a regra, e a consequência A não é cruel. | — |
| INST-080 | ajustar (cor) | O golpe aparece sem detalhe ("prende opositores", `cartas.md:268`), e o aviso "Ditadura e tortura" cobre o tema (`content_warnings.gd:9`). O problema é a cor B, Verde (`cartas.md:255`): ela faz o agronegócio, um setor real, propor o reconhecimento de um governo golpista. Hoje a cor não tem legenda para o jogador (pendente, `gestao/estado.md:169`). Com legenda, vira a mensagem "o agro apoia golpe", que em 2026 é acusação de campanha (D-190). O critério é o da INST-187 na Onda 1. O Laranja, a direita liberal (`docs/10_GUIA_DE_ESTILO_E_TOM.md:261`), guarda a ideia do GD de pôr o comércio na frente sem apontar um setor econômico. A cor A segue Amarelo (D-103 respeitada). | **Cor B**: Laranja |

## Respostas às dúvidas do GD (`cartas.md:307-315`)

1. **INST-077:** não há estereótipo (ver a tabela). O lugar já aparece na carta ("do Maranhão"), não só no Aprendizado; está ok, porque a caixa mostra o desfecho real, a condenação. A carta não precisa dizer que hoje a área está delimitada (`fontes.md:214`): é uma decisão hipotética do mandato, e o evento A repete o que aconteceu.
2. **INST-080:** "prende opositores", sem detalhe, está ok. Já a cor B Verde se lê como acusação ao agro quando houver legenda. Trocar por Laranja.
3. **INST-074:** a carta fica com um dos lados do debate eleitoral, o da soberania contra a designação. A D-097 permite, e o PSI não pede neutralidade. O problema era a intenção atribuída aos EUA, já corrigida. A caixa só relata o ato dos EUA, sem pessoa nem governo. Nomear o PCC e o CV, como faz a fonte, não estigmatiza a periferia.
4. **INST-079:** passa. A alusão é a um fato público de 2013, sem nome e sem acusar o ex-agente ou a potência. O personagem é estrangeiro, e o jogo o trata como denunciante.
5. **INST-075:** usar as aspas (ajuste acima). "O clube de economias ricas" teria a mesma imprecisão.
6. **INST-076:** "Os EUA aplicam sanções" passa como consequência hipotética. A pressão é padrão público (a dissertação da Fiocruz registra pressão de países desenvolvidos, `fontes.md:158`), e a carta não afirma um fato passado. Se o PO quiser risco zero, **Consequência A** (71): "A produção nacional leva meses. Os EUA ameaçam o comércio com o Brasil."
7. **Cores:** pela D-097, nada a pedir, exceto a INST-080 B. A opção Vermelha pagar em `Dignidade` na 076 A é honesto, porque o atraso tem base no caso real.

## Dúvidas do pesquisador que tocam em ética (`fontes.md:373-384`)

- **1 (APR-074):** a caixa está ok; o ajuste corrige a premissa da carta.
- **2 (APR-077):** manter "Em 2025" com "divulgou", e o número da Corte (171). Não usar as contagens do TJMA, que divergem.
- **3 (APR-079):** passa. Concordo em não afirmar nada sobre o pedido de asilo de 2013 sem checagem.
- **4 (APR-080):** não usar a opção B (Venezuela, `fontes.md:349`). É um país real e polarizador na semana do 2º turno, não houve golpe militar, e a situação atual da suspensão não foi conferida. Manter o Protocolo de Ushuaia.
- **5 e 8 (APR-075 e APR-073):** ok com os ajustes das cartas.

## Só o PO decide

1. **INST-073:** trocar a China por "estrangeiros" muda o tema do doc 12 (`docs/12_FICHAS_DOS_MODOS.md:248`). Recomendo "Fundos de fora"; há a alternativa com EUA e China.
2. **INST-080:** cor B Laranja (recomendado) ou Verde.
3. **INST-074:** `Dignidade` -5 na opção A (opcional; o ECO confere o saldo).
4. **INST-076:** manter "aplicam sanções" (recomendado) ou usar "ameaçam o comércio".
5. **Propostas do GD com lado ético** (`cartas.md:299-302`). Tema da INST-080: a A, golpe, é a recomendada. A C alude a um chefe de Estado vivo (RC-08), e a B puxa a carta para a guerra cultural. Ator dos quilombolas: a A, a aproximação com o `ACT-017`, é a recomendada, porque a reação não aparece na tela (`jogo/scripts/game_data.gd:83-84`).

## Fora do escopo (para o GD e o QA)

- Nas INST-079 A e INST-080 A, o jogador decide sozinho o que a lei divide: a extradição passa pelo STF (`aprendizados.json:85`), e a suspensão no Mercosul exige consenso (`fontes.md:338`). A caixa corrige. Para a 080, o pesquisador sugeriu a troca "Propor a suspensão" (18).
- Os textos de evento desta onda não têm ponto final, como na Onda 2.
