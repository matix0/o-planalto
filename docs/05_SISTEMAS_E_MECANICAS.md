
### Fundamentação Teórica

O sistema de satisfação é baseado no **design de *Reigns***, onde cada facção (Igreja, Povo, Exército, Tesouro) tem um nível de satisfação que afeta o reinado. No nosso jogo, os atores são as "facções" que o jogador precisa equilibrar.

---

## 05.09 — Sistema de Relações entre Medidores

### Relações Primárias (Efeitos Diretos)

| Medidor Afetado | Medidor que Afeta | Tipo de Relação | Efeito |
| :--- | :--- | :--- | :--- |
| **Dignidade** | Consciência | Cascata | Quando Dignidade < 30, Consciência -5 por turno. Quando Dignidade > 70, Consciência +3 por turno. |
| **Consciência** | Legitimidade | Assimétrica | Quando Consciência > 60, Legitimidade -5 por turno. Quando Consciência < 30, Legitimidade +5 por turno. |
| **Soberania** | Caixa | Imediata | Quando Soberania < 30, Caixa +10 no turno, mas Dignidade -5. |
| **Segurança** | Dignidade | Condicional | Quando Segurança < 30, Dignidade -10. |
| **Verdade** | Consciência | Multiplicadora | Quando Verdade < 30, efeitos negativos em Consciência são dobrados. |
| **Caixa** | Legitimidade | Invertida | Quando Caixa > 70, Legitimidade -3 por turno. Quando Caixa < 30, Legitimidade -5 por turno. |
| **Capital Político** | Caixa | Direta | Quando Capital Político < 30, Caixa -10. |
| **Legitimidade** | Capital Político | Direta | Quando Legitimidade < 30, Capital Político -10. |

### Cadeias de Consequências

| Cadeia | Descrição |
| :--- | :--- |
| **Cadeia da Barbárie** | Dignidade cai → Consciência cai → Legitimidade sobe → Capital Político sobe → Soberania cai. |
| **Cadeia da Revolta** | Dignidade cai → Consciência sobe → Legitimidade cai → Capital Político cai → Impeachment. |
| **Cadeia da Dependência** | Soberania cai → Caixa sobe → Dignidade cai → Consciência cai → Verdade cai → Pós-Verdade. |
| **Cadeia da Resistência** | Consciência sobe → Verdade sobe → Dignidade sobe → Soberania sobe → Legitimidade sobe → República Soberana. |

### Efeitos Não-Lineares (Limiares)

| Limiar | Efeito |
| :--- | :--- |
| **Verdade < 20** | Todos os outros medidores perdem 1 ponto por turno. |
| **Consciência < 15** | O povo não reage a nenhuma crise. |
| **Soberania < 15** | O país se torna um protetorado. |
| **Legitimidade > 90** | O povo idolatra o governante. Consciência -10 por turno. |

---

## Referências

- ALLIOT, François. *Reigns: Design Philosophy*. 2016.
- CSIKSZENTMIHALYI, Mihaly. *Flow: The Psychology of Optimal Experience*. New York: Harper & Row, 1990.
- MCGUIRE, William. *Resistance to Persuasion*. 1964.
- VAN DER LINDEN, Sander. *Inoculation Theory*. 2022.
- WORLD ORDER. *Ripple Chains*. 2024.
- Revista Acervo (Arquivo Nacional). *Os sentidos do golpe*. Rio de Janeiro: Arquivo Nacional, 2025.
- Alisson, Professor. *Comentários sobre o Livro do Projeto*. 2026.