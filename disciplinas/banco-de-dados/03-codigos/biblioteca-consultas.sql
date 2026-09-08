-- Consultas progressivas — Biblioteca Comunitária Horizonte
-- Execute biblioteca-schema.sql antes deste arquivo.

-- 1. Projeção, filtro e ordenação
SELECT titulo, autor, ano_publicacao
FROM livro
WHERE ano_publicacao >= 2022
ORDER BY ano_publicacao DESC, titulo;

-- 2. Filtros compostos e precedência explícita
SELECT titulo, categoria, ano_publicacao
FROM livro
WHERE ano_publicacao BETWEEN 2020 AND 2025
  AND categoria <> 'História'
ORDER BY titulo;

-- 3. Empréstimos ativos
SELECT e.id_emprestimo, l.nome, li.titulo, e.data_prevista
FROM emprestimo AS e
JOIN leitor AS l ON l.id_leitor = e.id_leitor
JOIN exemplar AS ex ON ex.id_exemplar = e.id_exemplar
JOIN livro AS li ON li.id_livro = ex.id_livro
WHERE e.data_devolucao IS NULL
ORDER BY e.data_prevista;

-- 4. Leitores sem empréstimos: LEFT JOIN preserva todos os leitores
SELECT l.id_leitor, l.nome
FROM leitor AS l
LEFT JOIN emprestimo AS e ON e.id_leitor = l.id_leitor
WHERE e.id_emprestimo IS NULL
ORDER BY l.nome;

-- 5. Quantidade de exemplares por livro
SELECT li.id_livro, li.titulo, COUNT(ex.id_exemplar) AS total_exemplares
FROM livro AS li
LEFT JOIN exemplar AS ex ON ex.id_livro = li.id_livro
GROUP BY li.id_livro, li.titulo
ORDER BY total_exemplares DESC, li.titulo;

-- 6. Total de empréstimos por leitor, inclusive zero
SELECT l.id_leitor, l.nome, COUNT(e.id_emprestimo) AS total_emprestimos
FROM leitor AS l
LEFT JOIN emprestimo AS e ON e.id_leitor = l.id_leitor
GROUP BY l.id_leitor, l.nome
ORDER BY total_emprestimos DESC, l.nome;

-- 7. Livros nunca emprestados
SELECT li.id_livro, li.titulo
FROM livro AS li
WHERE NOT EXISTS (
    SELECT 1
    FROM exemplar AS ex
    JOIN emprestimo AS e ON e.id_exemplar = ex.id_exemplar
    WHERE ex.id_livro = li.id_livro
)
ORDER BY li.titulo;

-- 8. Três livros mais emprestados
SELECT li.titulo, COUNT(*) AS total_emprestimos
FROM livro AS li
JOIN exemplar AS ex ON ex.id_livro = li.id_livro
JOIN emprestimo AS e ON e.id_exemplar = ex.id_exemplar
GROUP BY li.id_livro, li.titulo
ORDER BY total_emprestimos DESC, li.titulo
FETCH FIRST 3 ROWS ONLY;

-- 9. Média de dias dos empréstimos já devolvidos
SELECT ROUND(AVG(data_devolucao - data_emprestimo), 2) AS media_dias
FROM emprestimo
WHERE data_devolucao IS NOT NULL;

-- 10. Relatório mensal
SELECT EXTRACT(YEAR FROM data_emprestimo) AS ano,
       EXTRACT(MONTH FROM data_emprestimo) AS mes,
       COUNT(*) AS total_emprestimos
FROM emprestimo
GROUP BY EXTRACT(YEAR FROM data_emprestimo),
         EXTRACT(MONTH FROM data_emprestimo)
ORDER BY ano, mes;

-- 11. Exemplo de transação: execute e confira antes de trocar ROLLBACK por COMMIT
START TRANSACTION;

UPDATE exemplar
SET disponivel = FALSE
WHERE id_exemplar = 11 AND disponivel = TRUE;

INSERT INTO emprestimo
    (id_leitor, id_exemplar, data_emprestimo, data_prevista)
VALUES
    (5, 11, DATE '2026-09-08', DATE '2026-09-15');

ROLLBACK;

