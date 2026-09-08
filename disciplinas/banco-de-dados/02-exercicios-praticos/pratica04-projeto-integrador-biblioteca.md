# Prática 04 — Projeto integrador da biblioteca

**Unidades:** UA5, UA6 e UA7  
**Modalidade:** trio  
**Duração sugerida:** 3 encontros

## Objetivo

Projetar, implementar e consultar um pequeno banco relacional com rastreabilidade entre requisitos e solução.

## Etapa 1 — Modelo

1. Registre pelo menos oito regras de negócio.
2. Construa um diagrama ER com `leitor`, `livro`, `exemplar` e `emprestimo`.
3. Indique cardinalidades, identificadores e participação obrigatória/opcional.
4. Converta o modelo conceitual em esquema relacional até a 3FN.

## Etapa 2 — Implementação

1. Use [biblioteca-schema.sql](../03-codigos/biblioteca-schema.sql) como referência ou implemente sua própria versão.
2. Insira ao menos 5 leitores, 8 livros, 12 exemplares e 15 empréstimos.
3. Provoque intencionalmente três violações de integridade e registre as mensagens do SGBD.
4. Execute uma transação com `COMMIT` e outra com `ROLLBACK`.

## Etapa 3 — Consultas

Produza consultas para:

1. empréstimos ativos e atrasados;
2. leitores sem empréstimos;
3. quantidade de exemplares por livro;
4. total de empréstimos por leitor;
5. livros nunca emprestados;
6. os três livros mais emprestados;
7. média de dias entre empréstimo e devolução;
8. relatório mensal ordenado por quantidade.

## Entregáveis

- Requisitos, regras, diagrama ER e dicionário de dados.
- Scripts SQL comentados.
- Evidências de execução e análise de dois resultados.

## Avaliação

| Critério | Pontos |
|---|---:|
| Requisitos e modelo conceitual | 2,0 |
| Modelo lógico e normalização | 2,0 |
| Restrições e dados de teste | 2,0 |
| Consultas e resultados | 3,0 |
| Organização e justificativas | 1,0 |
| **Total** | **10,0** |

[Voltar aos exercícios](README.md)

