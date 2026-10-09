# 02 — Identidade e Nomenclatura

---

## 2.1. Nome do Jogo

**"O Planalto"** — nome provisório adotado.

### Justificativa

O nome foi escolhido por três razões:

**1. Remete diretamente à política brasileira sem ser panfletário.**
O Palácio do Planalto é a sede do Poder Executivo Federal. O nome evoca a política institucional sem carregar o peso de um símbolo partidário.

**2. É curto, memorável e brasileiro.**
Funciona bem em mobile, web e PC. É fácil de pronunciar e lembrar.

**3. Não é ufanista nem derrotista.**
Não remete a "Brasil sil sil" nem a "Brasil colônia". É um nome neutro que convida à reflexão.

### Alternativas Descartadas

| Candidato | Motivo do Descarte |
| :--- | :--- |
| **Terra Canarinha** | Pode soar ufanista ou remeter ao "Brasil sil sil". |
| **Cidade Maravilhosa** | Muito associado ao Rio especificamente. |
| **Vila Nova** | Genérico, pode não chamar atenção. |
| **O Preço** | Pode ser pesado demais. |

### Fundamentação Teórica sobre Naming de Jogos Educativos

Pesquisas sobre naming de jogos sérios mostram que títulos eficazes:

1. **São curtos e fáceis de lembrar** — "Conta Comigo!" (TCE-BA), "Liga do Congresso" (Congresso em Foco).
2. **Remetem ao tema sem serem panfletários** — "Zona Eleitoral" (jogo sobre campanha), "FuraCâmara" (jogo sobre Legislativo).
3. **Não polarizam** — nomes que remetem a um espectro político específico afastam parte do público.

---

## 2.2. Sistema de Cores Partidárias

**Comentário do Professor Alisson:** *"Mesmo sem os nomes reais, talvez seja interessante uma alusão indireta aos partidos, como as cores, por exemplo."*

### Proposta

| Cor | Espectro | Referência |
| :--- | :--- | :--- |
| **Vermelho** | Esquerda | PT, PDT, PSOL |
| **Azul** | Centro-direita | PSDB, PSB |
| **Verde** | Agronegócio | Bancada ruralista |
| **Amarelo** | Centro | MDB, Centrão |
| **Roxo** | Esquerda radical | PSOL, PSTU |
| **Laranja** | Direita liberal | NOVO, Republicanos |
| **Preto** | Extrema-direita | PL, bolsonarismo |

**Como funciona:** Cada carta tem uma **borda colorida** que sinaliza sua inclinação. O jogador aprende a associar cores a espectros políticos sem que o jogo use rótulos explícitos.

### Fundamentação Teórica sobre Cores na Comunicação Política

A escolha de cores não é arbitrária. Pesquisas sobre psicologia das cores e comunicação política mostram que:

| Cor | Significado Universal | Uso Político |
| :--- | :--- | :--- |
| **Vermelho** | Paixão, urgência, sangue | Historicamente associado à esquerda (revolução, socialismo) |
| **Azul** | Confiança, estabilidade, tradição | Associado à direita e ao centro-direita |
| **Verde** | Natureza, esperança, crescimento | Associado ao agronegócio e ao ambientalismo |
| **Amarelo** | Otimismo, energia, alerta | Associado ao centro e ao populismo |
| **Roxo** | Realeza, espiritualidade, transformação | Associado à esquerda radical e a movimentos identitários |
| **Laranja** | Criatividade, entusiasmo, mudança | Associado ao liberalismo econômico e à inovação |
| **Preto** | Poder, morte, mistério | Associado à extrema-direita e ao autoritarismo |

> "As cores não são apenas um elemento estético. Elas comunicam valores e posicionamentos políticos antes mesmo que o leitor processe o texto." — Norberto Bobbio, *Direita e Esquerda*

---

## 2.3. Identidade Visual (Esboço)

| Elemento | Definição | Justificativa |
| :--- | :--- | :--- |
| **Paleta primária** | Verde (esperança), Azul (confiança), Cinza (neutralidade) | Evita cores partidárias na interface principal |
| **Paleta secundária** | Vermelho (urgência), Amarelo (coletividade) | Usadas em alertas e destaques |
| **Tipografia** | **Poppins** (títulos) + **Inter** (corpo) | Fontes modernas, legíveis, sem serifa |
| **Estilo de ícones** | Vetorial, minimalista, geométrico | Funciona bem em mobile, web e PC |
| **Layout das cartas** | Fundo escuro, texto branco, ícones coloridos por medidor | Contraste alto, legibilidade |
| **Animações** | Apenas o gesto de arrastar + feedback visual de medidores | Simplicidade, foco na mecânica |

### Fundamentação sobre Tipografia em Jogos Educativos

Pesquisas sobre design de jogos educativos mostram que:

1. **Sans-serif é predominante** — fontes como Poppins e Inter são legíveis em telas pequenas.
2. **Evitar fontes rebuscadas** — fontes decorativas podem afastar o público 15-30.
3. **Contraste é essencial** — fundo escuro com texto claro reduz fadiga visual.

### Fundamentação sobre Minimalismo

O minimalismo no design de cartas serve a três propósitos:

1. **Reduz a carga cognitiva** — o jogador foca no texto e nas escolhas, não em ilustrações complexas.
2. **Facilita a produção** — sem IA generativa, ícones vetoriais são mais viáveis.
3. **Mantém a coerência visual** — todas as cartas seguem o mesmo padrão.

---

## 2.4. Plataforma e Engine

| Item | Definição |
| :--- | :--- |
| **Plataformas** | Mobile, Web e PC |
| **Modo** | Singleplayer |
| **Engine principal** | Godot 4.7 + MCP + Agentes de IA |
| **Engine alternativa** | HTML/JS (caso seja mais prático) |
| **Salvamento** | Sem salvamento de progresso |
| **Publicação** | Play Store, Web, itch.io |

### Justificativa da Escolha de Plataforma

A escolha por **mobile, web e PC** se justifica por:

1. **Acessibilidade** — o jogo pode ser jogado em qualquer dispositivo.
2. **Distribuição** — web e mobile permitem alcance massivo.
3. **Público-alvo** — jovens de 15 a 30 anos usam majoritariamente mobile.

### Justificativa da Escolha da Engine

A escolha por **Godot 4.7 + MCP + Agentes de IA** se justifica por:

1. **Experiência do desenvolvedor** — Mateus já conhece a engine.
2. **Multiplataforma** — exporta para Windows, Web, Android e iOS.
3. **Ecossistema MCP maduro** — 180+ ferramentas disponíveis para agentes de IA.
4. **Comunidade de IA** — Godot é adotado como "best engine for AI-assisted development".
5. **Open source** — sem custos de licenciamento.

### Fundamentação sobre Singleplayer e Sem Salvamento

A escolha por **singleplayer** e **sem salvamento de progresso** se justifica por:

1. **Foco na experiência** — o jogador completa a jornada em uma sessão (30-40 minutos).
2. **Reflexão imediata** — o impacto das escolhas é sentido na hora, sem interrupções.
3. **Simplicidade técnica** — sem necessidade de servidores ou sistemas de save.

---

## 2.5. Formato

| Item | Definição |
| :--- | :--- |
| **Duração** | 30-40 minutos |
| **Turnos** | 4 turnos (4 anos) |
| **Cartas por turno** | 6-8 |
| **Total de cartas jogadas** | 24-32 |
| **Mecânica** | Arrastar cartas para esquerda ou direita |

### Fundamentação da Duração

A duração de **30-40 minutos** foi escolhida com base em:

1. **Pesquisas sobre atenção** — jovens de 15 a 30 anos mantêm atenção focada por 30-40 minutos em atividades interativas.
2. **Contexto escolar** — uma aula tem 50 minutos, então o jogo cabe em uma sessão.
3. **Curva de aprendizado** — tempo suficiente para apresentar todos os modos e atores.

---

## 2.6. Assets Utilizados

O projeto usará apenas **assets públicos e conteúdos liberados** (CC0, domínio público).

| Categoria | Fonte | Licença |
| :--- | :--- | :--- |
| **Ícones** | Kenney, OpenGameArt | CC0 |
| **Fontes** | Google Fonts (Poppins, Inter) | OFL |
| **Música** | FreeMusicArchive, Freesound | CC0 |
| **Efeitos sonoros** | Freesound, GameSounds.xyz | CC0 |
| **Texturas** | BurningWell, OpenClipArt | Domínio Público |

### Restrição Fundamental

**Não será usada IA generativa para arte, música ou assets.** Isso é uma escolha ética e prática:

1. **Ética** — respeitar o trabalho de artistas humanos.
2. **Qualidade** — assets CC0 de qualidade estão disponíveis.
3. **Consistência** — assets públicos têm estilo coeso.

---

## Referências

- BOBBIO, Norberto. *Direita e Esquerda: Razões e Significados de uma Distinção Política*. São Paulo: UNESP, 1995.
- HELLER, Eva. *A Psicologia das Cores*. São Paulo: G. Gili, 2013.
- LIDWELL, William; HOLDEN, Kritina; BUTLER, Jill. *Universal Principles of Design*. Beverly: Rockport, 2010.
- SALEN, Katie; ZIMMERMAN, Eric. *Rules of Play: Game Design Fundamentals*. Cambridge: MIT Press, 2003.
- KENNEY. *High-quality game art under CC0*. 2026.
- Google Fonts. *Poppins & Inter*. 2026.