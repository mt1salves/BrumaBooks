# Kayllane Santos e Marco Túlio - 2º Info Matutino

CREATE DATABASE BrumaBooks;

USE BrumaBooks;

CREATE TABLE Genero(
	idGenero INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE Pais(
	idPais INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE Livro(
	idLivro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tituloPrincipal VARCHAR(45) NOT NULL,
    tituloOriginal VARCHAR(45) NULL,
    Genero_idGenero INT NOT NULL,
    Pais_idPais INT NOT NULL,
    FOREIGN KEY (Genero_idGenero) REFERENCES Genero(idGenero),
    FOREIGN KEY (Pais_idPais) REFERENCES Pais(idPais)
);

CREATE TABLE Autor(
	idAutor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE Endereco(
	idEndereco INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    numero VARCHAR(45) NOT NULL,
    complemento VARCHAR(45) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    cep VARCHAR(45) NOT NULL
);

CREATE TABLE Editora(
	idEditora INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
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

INSERT INTO Livro (idLivro, tituloPrincipal, tituloOriginal, Genero_idGenero, Pais_idPais)
VALUES(1, 'Harry Potter and the Deathly Hallows', 1, 1), (2, 'Harry Potter e as Relíquias da Morte', 'Harry Potter and the Deathly Hallows', 1, 2);

INSERT INTO Pais (idPais, nome)
VALUES(1, 'Reino Unido'), (2, 'Brasil');

INSERT INTO Genero (idGenero, nome)
VALUES(1, 'Fantasia');

INSERT INTO Autor (idAutor, nome)
VALUES(1, 'J. K. Rowling');

INSERT INTO Endereco (idEndereco, logradouro, cidade, numero, complemento, bairro, cep)
VALUES(1, 'Abbey Road', 'Londres', '170', 'Estabelecimento administrativo', 'Oxford', '4753'), (2, 'Avenida Sandoval Moraes', 'Guanambi', '80', 'Estabelecimento administrativo', 'Santa Catarina', '46430000');

INSERT INTO Editora (idEditora, nome, Endereco_idEndereco)
VALUES(1, 'Bloomsbury Childrens Books', 1), (2, 'Rocco', 2);

INSERT INTO Autoria (Autor_idAutor, Livro_idLivro)
VALUES(1, 1);

INSERT INTO Edicao (Livro_idLivro, Editora_idEditora, numero, dataLancamento, isbn, preco)
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