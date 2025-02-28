-- Criando a Tabela de Professores
CREATE TABLE professores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(100) NOT NULL
);

-- Criando a Tabela de Disciplinas
CREATE TABLE disciplinas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    professor_id INT REFERENCES professores(id) ON DELETE SET NULL
);

-- Criando a Tabela de Alunos
CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL
);

-- Criando a Tabela de Matrículas (Relacionamento N:N entre Alunos e Disciplinas)
CREATE TABLE matriculas (
    id SERIAL PRIMARY KEY,
    aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
    disciplina_id INT REFERENCES disciplinas(id) ON DELETE CASCADE,
    data_matricula DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Inserindo Dados na Tabela Professores
INSERT INTO professores (nome, departamento) VALUES
('Carlos Mendes', 'Matemática'),
('Fernanda Lima', 'História'),
('João Silva', 'Ciências');

-- Inserindo Dados na Tabela Disciplinas
INSERT INTO disciplinas (nome, carga_horaria, professor_id) VALUES
('Matemática', 60, 1),
('História', 40, 2),
('Biologia', 50, 3);

-- Inserindo Dados na Tabela Alunos
INSERT INTO alunos (nome, data_nascimento) VALUES
('Maria Souza', '2010-05-12'),
('Carlos Silva', '2009-08-23'),
('Ana Pereira', '2011-02-17');

-- Inserindo Dados na Tabela Matrículas
INSERT INTO matriculas (aluno_id, disciplina_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);
