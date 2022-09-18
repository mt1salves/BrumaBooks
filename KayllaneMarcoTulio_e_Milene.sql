# Kayllane Santos Silva, Marco Túlio Silva Santos Alves e Milene Stephany

-- Questão 01:

# Mostre o nome, sobrenome, CPF, matricula e data de nascimento de todos os estudantes
SELECT nome, sobrenome, cpf, matricula, data_de_nascimento FROM Estudante;

# Mostre o nome, sobrenome, CPF,  data de nascimento de todos os responsáveis
SELECT nome, sobrenome, cpf, data_de_nascimento FROM Responsavel;

# Mostre o nome, sobrenome, CPF, matricula e data de nascimento de todos os docentes
SELECT nome, sobrenome, cpf, matricula, data_de_nascimento FROM Docente;

# Mostre todos os dados de uma turma
DESCRIBE Turma;

# Mostre todos os dados de uma disciplina
DESCRIBE Disciplina;

-- Questão 02:

# Mostre todas as turmas cadastradas no banco de dados
SELECT * FROM Turma;

# Mostre o nome dos dois responsáveis de um estudante
SELECT
	r1.nome AS 'Nome do Responsável Feminino',
    r2.nome AS 'Nome do Responsável Masculino',
    e.nome AS 'Nome do Estudante'
FROM Responsavel r1
INNER JOIN Estudante e
ON e.id_Responsavel_1 = r1.id
INNER JOIN Responsavel r2
ON e.id_Responsavel_2 = r2.id;

# Mostre os dados de uma disciplina e nome do docente que a ministrou
SELECT
	di.nome AS 'Nome da Disciplina',
    di.codigo AS 'Código da Disciplina',
    di.serie AS 'Série da Disciplina',
    dc.nome AS 'Nome do Docente'
FROM Disciplina di
INNER JOIN Docente_Disciplina dd
ON dd.id_Disciplina = di.id
INNER JOIN Docente dc
ON dd.id_Docente = dc.id;

# Mostre o nome e o código de uma disciplina cursada por uma turma
SELECT
	di.nome AS 'Nome da Disciplina',
    di.codigo AS 'Código da Disciplina',
    t.nome AS 'Nome da Turma',
    t.codigo AS 'Código da Turma',
    t.serie AS 'Série da Turma',
    t.ano AS 'Ano da Turma'
FROM Disciplina di
INNER JOIN Turma_Disciplina tm
ON tm.id_Disciplina = di.id
INNER JOIN Turma t
ON tm.id_Turma = t.id;

# Mostre o nome, sobrenome, matricula e CPF dos estudantes de uma turma
SELECT 
	e.nome AS 'Nome do Estudante',
    e.sobrenome AS 'Sobrenome do Estudante',
    e.matricula AS 'Número de Matrícula',
    e.cpf AS 'CPF',
    t.nome AS 'Nome da Turma'
FROM Estudante e
INNER JOIN Estudante_Turma et
ON et.id_Estudante = e.id
INNER JOIN Turma t
ON t.id = et.id_Turma;