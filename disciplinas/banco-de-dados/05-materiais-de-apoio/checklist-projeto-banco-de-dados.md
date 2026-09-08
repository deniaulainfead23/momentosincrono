# Checklist de projeto de Banco de Dados

## Requisitos

- [ ] O escopo do sistema está explícito.
- [ ] Entradas, saídas, consultas e operações foram identificadas.
- [ ] Regras de negócio possuem origem e exemplo verificável.
- [ ] Requisitos de segurança, volume, concorrência e recuperação foram registrados.

## Modelo conceitual

- [ ] Entidades representam conceitos do domínio, não telas do sistema.
- [ ] Relacionamentos têm nomes e cardinalidades justificadas.
- [ ] Identificadores e participações obrigatórias estão indicados.

## Modelo lógico

- [ ] Cada relação possui chave primária.
- [ ] Relacionamentos N:N foram resolvidos adequadamente.
- [ ] Chaves estrangeiras preservam integridade referencial.
- [ ] Dependências e formas normais foram verificadas.

## Implementação e validação

- [ ] Tipos e restrições correspondem ao dicionário de dados.
- [ ] Dados de teste incluem casos válidos, limites e violações.
- [ ] Transações críticas foram testadas com falha e recuperação.
- [ ] Consultas respondem às perguntas dos requisitos.
- [ ] Privilégios seguem o princípio do menor acesso necessário.
- [ ] Estratégia de backup e restauração foi realmente testada.

[Voltar aos materiais](README.md)

