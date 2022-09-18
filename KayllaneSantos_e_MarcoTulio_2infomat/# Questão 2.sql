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