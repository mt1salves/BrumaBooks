# Kayllane Santos e Marco Túlio - 2º Info Matutino

CREATE DATABASE BrumaBooks;

USE BrumaBooks;

CREATE TABLE Genero(
	idGenero INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE Pais(
	idPais INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE Livro(
	idLivro INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tituloPrincipal VARCHAR(45) NOT NULL,
    tituloOriginal VARCHAR(45) NOT NULL,
    Genero_idGenero INT NOT NULL,
    Pais_idPais INT NOT NULL,
    FOREIGN KEY (Genero_idGenero) REFERENCES Genero(idGenero),
    FOREIGN KEY (Pais_idPais) REFERENCES Pais(idPais)
);

CREATE TABLE Autor(
	idAutor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE Endereco(
	idEndereco INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    numero VARCHAR(45) NOT NULL,
    complemento VARCHAR(45) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    cep VARCHAR(45) NOT NULL
);

CREATE TABLE Editora(
	idEditora INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomeFantasia VARCHAR(45) NOT NULL,
    Endereco_idEndereco INT NOT NULL,
    FOREIGN KEY (Endereco_idEndereco) REFERENCES Endereco(idEndereco)
);

CREATE TABLE Autoria(
    Autor_idAutor INT NOT NULL,
    Livro_idLivro INT NOT NULL,
    FOREIGN KEY (Autor_idAutor) REFERENCES Autor(idAutor),
    FOREIGN KEY (Livro_idLivro) REFERENCES Livro(idLivro)
);

CREATE TABLE Edicao(
	Livro_idLivro INT NOT NULL,
    Editora_idEditora INT NOT NULL,
    FOREIGN KEY (Livro_idLivro) REFERENCES Livro(idLivro),
    FOREIGN KEY (Editora_idEditora) REFERENCES Editora(idEditora),
    numero VARCHAR(45) NOT NULL,
    dataLancamento DATE NOT NULL,
    isbn VARCHAR(45) NOT NULL,
    preco FLOAT UNSIGNED NOT NULL
);

INSERT INTO Livro
VALUES(1, 'Harry Potter and the Deathly Hallows', 'null', 1, 1);

INSERT INTO Pais
VALUES(1, 'Reino Unido');

INSERT INTO Genero
VALUES(1, 'Fantasia');

INSERT INTO Autor
VALUES(1, 'J. K. Rowling');

INSERT INTO Endereco
VALUES(1, 'Rua dos Estudantes', 'Brumado', '140', 'Casa', 'Ginásio Industrial', '46100000');

INSERT INTO Editora
VALUES(1, 'Bloomsbury Childrens Books', 1);

INSERT INTO Autoria
VALUES(1, 1);

INSERT INTO Edicao
VALUES(1, 1, 'null', 2014-07-27, '1408855712', 19.99);

SELECT Livro.tituloPrinciapal, Livro.TituloOriginal, Pais.nome
FROM Livro
INNER JOIN Pais
ON Livro.Pais_idPais = Genero.idPais;

SELECT Livro.tituloPrinciapal, Livro.TituloOriginal, Genero.nome
FROM Livro
INNER JOIN Genero
ON Livro.Genero_idGenero = Genero.idGenero;

SELECT l.tituloPrincipal, l.tituloOriginal, p.nome AS 'Pais', g.nome AS 'GeneroLiterario'
FROM Livro AS l -- Podemos omitir este 'AS' quando se quer apelidar tabelas
INNER JOIN Pais p
ON l.Pais_idPais = p.idPais
INNER JOIN Genero g
ON l.Genero_idGenero = g.idGenero;