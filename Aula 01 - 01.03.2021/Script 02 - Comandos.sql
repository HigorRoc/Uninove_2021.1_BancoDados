TIPOS DE DADOS - ORACLE
NUMBER(X,Y)
X - tamanho total
Y - quantidade de casas decimais. OPCIONAL. Se não informado, não possui casas decimais.

VARCHAR2(X)
X - quantidade de caracteres alfanuméricos

DATE
Variável do tipo data

CRIACAO DE TABELAS

CREATE TABLE <nome tabela> (
<nome coluna>		<tipo dado coluna>,
<nome coluna>		<tipo dado coluna>,
<nome coluna>		<tipo dado coluna>,
<nome coluna>		<tipo dado coluna>,
<nome coluna>		<tipo dado coluna>
)

Exemplo:
CREATE TABLE aluno (
ra		number(12),
cpf		number(11),
nome		varchar2(100),
dtnasc		date
)

Apagar tabela
DROP TABLE <nome tabela>;

DROP TABLE aluno;

Chave primária

CREATE TABLE aluno (
ra		number(12) PRIMARY KEY,
cpf		number(11),
nome		varchar2(100),
dtnasc		date
)

Gravar dados na tabela
INSERT INTO <nome tabela> VALUES (<valor1>,<valor2>,...,<valorn>);
ou
INSERT INTO <nome tabela> (<campo1>, <campo2>,...,<campon>) VALUES (<valor1>,<valor2>,...,<valorn>);

Exemplo

INSERT INTO aluno values (1,222,'leonardo mantovani','02/02/2019');

INSERT INTO aluno (ra,nome) values (2,'monica silva');

Alterar dados na tabela
UPDATE <nome tabela> set <campo1>=<valor1>
WHERE <condicao>

UPDATE aluno set nome='leonardo a t mantovani'
WHERE ra=1;


Apagar dado da tabela
DELETE FROM <nome tabela> WHERE <condicao>;
DELETE FROM aluno where ra = 2;

se esquecer o WHERE no delete ou no update TODAS as linhas serão apagadas ou alteradas (salvo exceções)

CONSULTA DOS DADOS
SELECT <campos> from <nome tabela> WHERE <condicao>;

Ordenar
SELECT <campos> from <nome tabela> WHERE <condicao> order by <campo> <asc ou desc>;

Exemplo:
SELECT nome, ra from aluno WHERE ra>3 order by nome asc; 

SELECT nome, ra from aluno WHERE ra>3 order by nome desc;


SELECT nome, ra from aluno WHERE ra>3 order by nome;
Nota: quando nao é informado nem asc nem desc, assume-se asc como valor padrão 

Somar todos os valores da coluna (tem que ser numérica)
SELECT sum(<coluna>) from <nome tabela> WHERE <condicao>;

Media valores da coluna (tem que ser numérica)
SELECT avg(<coluna>) from <nome tabela> WHERE <condicao>;

Maior valor da coluna (tem que ser numérica)
SELECT max(<coluna>) from <nome tabela> WHERE <condicao>;

Menor valor da coluna (tem que ser numérica)
SELECT min(<coluna>) from <nome tabela> WHERE <condicao>;

Contar quantidade de linhas
SELECT count(*) from <nome tabela> WHERE <condicao>;

Nota: em <condicao> pode-se utilizar operadores lógicos - AND e OR
Nota 2: é possível fazer contas tanto no SELECT quanto no WHERE a partir dos campos da tabela ou valores pré-determinados
