-- Banco de Dados — estudo de caso Biblioteca Comunitária Horizonte
-- Dialeto: PostgreSQL
-- Dados exclusivamente sintéticos.

DROP TABLE IF EXISTS emprestimo;
DROP TABLE IF EXISTS exemplar;
DROP TABLE IF EXISTS livro;
DROP TABLE IF EXISTS leitor;

CREATE TABLE leitor (
    id_leitor INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(120) NOT NULL CHECK (TRIM(nome) <> ''),
    email VARCHAR(160) NOT NULL UNIQUE,
    data_cadastro DATE NOT NULL DEFAULT CURRENT_DATE,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE livro (
    id_livro INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    isbn CHAR(13) UNIQUE,
    titulo VARCHAR(200) NOT NULL CHECK (TRIM(titulo) <> ''),
    autor VARCHAR(160) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    ano_publicacao SMALLINT CHECK (ano_publicacao BETWEEN 1450 AND 2100)
);

CREATE TABLE exemplar (
    id_exemplar INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_livro INTEGER NOT NULL REFERENCES livro(id_livro),
    tombo VARCHAR(30) NOT NULL UNIQUE,
    data_aquisicao DATE,
    disponivel BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE emprestimo (
    id_emprestimo INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_leitor INTEGER NOT NULL REFERENCES leitor(id_leitor),
    id_exemplar INTEGER NOT NULL REFERENCES exemplar(id_exemplar),
    data_emprestimo DATE NOT NULL DEFAULT CURRENT_DATE,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    CHECK (data_prevista >= data_emprestimo),
    CHECK (data_devolucao IS NULL OR data_devolucao >= data_emprestimo)
);

-- Impede mais de um empréstimo ativo para o mesmo exemplar.
-- Índice parcial é um recurso do PostgreSQL.
CREATE UNIQUE INDEX uq_emprestimo_exemplar_ativo
    ON emprestimo (id_exemplar)
    WHERE data_devolucao IS NULL;

INSERT INTO leitor (nome, email, data_cadastro) VALUES
('Ana Souza', 'ana.souza@example.org', DATE '2026-02-10'),
('Bruno Lima', 'bruno.lima@example.org', DATE '2026-03-15'),
('Carla Nunes', 'carla.nunes@example.org', DATE '2026-04-03'),
('Diego Alves', 'diego.alves@example.org', DATE '2026-05-21'),
('Elisa Rocha', 'elisa.rocha@example.org', DATE '2026-06-12');

INSERT INTO livro (isbn, titulo, autor, categoria, ano_publicacao) VALUES
('9788535914849', 'Algoritmos para Todos', 'Lia Campos', 'Computação', 2022),
('9788575228289', 'Dados em Contexto', 'Rui Tavares', 'Computação', 2021),
('9786550000108', 'Cidade e Memória', 'Iara Melo', 'História', 2019),
('9786550000115', 'Ciência no Cotidiano', 'Caio Reis', 'Ciências', 2024),
('9786550000122', 'Leitura do Mundo', 'Nina Barros', 'Educação', 2020),
('9786550000139', 'Redes e Comunidades', 'Teo Martins', 'Sociologia', 2018),
('9786550000146', 'Introdução à Estatística', 'Eva Lopes', 'Matemática', 2023),
('9786550000153', 'Ética Digital', 'Bia Torres', 'Computação', 2025);

INSERT INTO exemplar (id_livro, tombo, data_aquisicao) VALUES
(1, 'T-001', DATE '2023-01-10'), (1, 'T-002', DATE '2024-02-15'),
(2, 'T-003', DATE '2023-03-20'), (2, 'T-004', DATE '2025-01-07'),
(3, 'T-005', DATE '2020-08-12'), (4, 'T-006', DATE '2025-02-18'),
(4, 'T-007', DATE '2025-02-18'), (5, 'T-008', DATE '2021-09-09'),
(6, 'T-009', DATE '2019-06-30'), (7, 'T-010', DATE '2024-04-04'),
(7, 'T-011', DATE '2024-04-04'), (8, 'T-012', DATE '2026-03-01');

INSERT INTO emprestimo
    (id_leitor, id_exemplar, data_emprestimo, data_prevista, data_devolucao)
VALUES
(1, 1, DATE '2026-03-01', DATE '2026-03-08', DATE '2026-03-07'),
(2, 3, DATE '2026-03-05', DATE '2026-03-12', DATE '2026-03-15'),
(1, 6, DATE '2026-04-10', DATE '2026-04-17', DATE '2026-04-16'),
(3, 8, DATE '2026-04-11', DATE '2026-04-18', DATE '2026-04-18'),
(4, 2, DATE '2026-05-02', DATE '2026-05-09', DATE '2026-05-08'),
(2, 10, DATE '2026-05-07', DATE '2026-05-14', DATE '2026-05-20'),
(3, 5, DATE '2026-06-01', DATE '2026-06-08', DATE '2026-06-06'),
(1, 4, DATE '2026-06-04', DATE '2026-06-11', DATE '2026-06-10'),
(4, 7, DATE '2026-06-15', DATE '2026-06-22', DATE '2026-06-23'),
(2, 1, DATE '2026-07-01', DATE '2026-07-08', DATE '2026-07-07'),
(3, 3, DATE '2026-07-03', DATE '2026-07-10', DATE '2026-07-10'),
(1, 10, DATE '2026-07-12', DATE '2026-07-19', DATE '2026-07-18'),
(4, 6, DATE '2026-08-01', DATE '2026-08-08', DATE '2026-08-07'),
(2, 8, DATE '2026-08-12', DATE '2026-08-19', DATE '2026-08-18'),
(3, 12, DATE '2026-09-01', DATE '2026-09-08', NULL);

UPDATE exemplar
SET disponivel = FALSE
WHERE id_exemplar = 12;

