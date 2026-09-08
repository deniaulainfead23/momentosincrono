# Prática 02 — Regras, integridade e dicionário de dados

**Unidades:** UA2 e UA4  
**Modalidade:** trio  
**Duração sugerida:** 70 minutos

## Objetivo

Converter regras de negócio em metadados, restrições e casos de teste.

## Regras iniciais

- O e-mail do leitor é obrigatório e não pode se repetir.
- A data prevista não pode ser anterior à data do empréstimo.
- A devolução pode ficar sem data enquanto o empréstimo estiver ativo.
- Um empréstimo só pode citar leitor e exemplar existentes.

## Tarefas

1. Elabore o dicionário das tabelas `leitor` e `emprestimo` com nome, tipo, nulidade, chave, padrão, regra e descrição.
2. Associe cada regra a `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `DEFAULT` ou `CHECK`.
3. Produza quatro testes válidos e quatro inválidos.
4. Descreva uma transação de duas etapas e explique o risco de confirmar apenas a primeira.
5. Defina privilégios mínimos para atendente, gestor e administrador.

## Entregáveis

- Dicionário de dados.
- Matriz regra × restrição.
- Casos de teste com resultado esperado.

## Critérios de avaliação

| Critério | Evidência esperada | Pontos |
|---|---|---:|
| Metadados | tipos e descrições sem ambiguidade | 3,0 |
| Integridade | restrições compatíveis com as regras | 3,0 |
| Testes | casos de sucesso e violação | 2,5 |
| Segurança | privilégios mínimos justificados | 1,5 |
| **Total** | | **10,0** |

[Voltar aos exercícios](README.md)

