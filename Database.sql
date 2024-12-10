CREATE TABLE tbl_aluno(
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) UNIQUE NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR (20) NOT NULL,
    matricula VARCHAR(30) UNIQUE NOT NULL
) ;

CREATE TABLE tbl_professor(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    categoria VARCHAR(20)
) ;

CREATE TABLE tbl_curso(
   id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    duracao INT NOT NULL,
   codigo_curso VARCHAR(15) UNIQUE NOT NULL,
   id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES tbl_professor(id)
) ;

CREATE TABLE tbl_aluno_curso(
    id AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
   FOREIGN KEY (id_curso) REFERENCES tbl_curso(id),
   FOREIGN KEY (id_aluno) REFERENCES tbl_aluno(id)
) ;

CREATE TABLE tbl_disciplina(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo_disciplina VARCHAR (15) UNIQUE NOT NULL,
   id_curso INT NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES tbl_curso(id),
    FOREIGN KEY (id_professor) REFERENCES tbl_professor(id)
) ;

CREATE TABLE tbl_nota_aluno(
    id INT AUTO_INCREMENT PRIMARY KEY,
    avaliacao VARCHAR(50) NOT NULL,
    data_avaliacao DATE,
    nota DECIMAL(5,2) NOT NULL
) ;

CREATE TABLE tbl_turma(
    id INT AUTO_INCREMENT PRIMARY KEY,
    semestre VARCHAR(20) NOT NULL,
    disciplina_id INT NOT NULL,
    professor_id INT NOT NULL,
    id_curso INT NOT NULL,
    id_nota_aluno INT NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES tbl_disciplina(id),
    FOREIGN KEY (id_professor) REFERENCES tbl_professor(id),
    FOREIGN KEY (id_curso) REFERENCES tbl_curso(id),
    FOREIGN KEY (id_nota_aluno) REFERENCES tbl_nota_aluno(id)
) ;
