create schema samuellegal2b;
use samuellegal2b;

CREATE TABLE professor(
	matricula integer PRIMARY key AUTO_INCREMENT,
    nome varchar(30),
 	salario decimal (8,2),
    formação varchar(50),
    CH_disponivel INTEGER
);
CREATE TABLE curso(
	codigo integer PRIMARY key AUTO_INCREMENT,
    nome varchar(40),
	nivel VARCHAR (20),
    vagas_porAno integer,
    mat_coordenador integer,
    FOREIGN key (mat_coordenador) REFERENCES professor(matricula)
);
CREATE TABLE sala(
	numero integer PRIMARY key,
    descricao varchar(50),
    andar integer,
    capacidade integer
);
CREATE TABLE disciplina(
	id integer PRIMARY key AUTO_INCREMENT,
    nome varchar(30),
    qtde_matriculados integer,
	cod_curso INTEGER,
    mat_professor INTEGER,
    CH integer,
    dia_semana VARCHAR(15),
    turno CHAR,
    num_sala integer,
    FOREIGN key (cod_curso) REFERENCES curso(codigo),
    FOREIGN key (num_sala) REFERENCES sala(numero),
    FOREIGN key (mat_professor) REFERENCES professor(matricula)
);
INSERT INTO professor VALUES
	(1,'Maria Xavier', 5697.52,'Ciências da Computação',10),
	(2,'Leticia Vitória', 6987.32,'Administração',12),
	(3,'Silvia Veras', 7512.14,'Engenharia de Software',0),
	(4,'Vagner Montana', 5876.78,'Análise e Desenvolvimento de Sistemas',null),
	(5,'Carla Pedrosa', 5697.96,'Ciências da Computação',25),
	(6,'Pedro Cardoso', 7512.52,'Engenharia de Software',12);
INSERT INTO curso VALUES
	(1,'Redes de Computadores','Técnico',80,5),
	(2,'Informática para Internet','Técnico',140,null),
	(3,'Análise e Desenvolvimento de Sistemas','Superior',100,4),
	(4,'Comércio','Técnico',60,null),
	(5,'Banco de Dados','Pós-graduação',50,5);
INSERT INTO sala VALUES
	(1, 'Sala de aula 1',1,50),(2, 'Sala de aula 2',1,30),(3, 'Sala de aula 3',1,25),
	(4, 'Auditório',3,300),(5,'Sala Multimídia',2,50),(6,'Laboratório 01',2,23),(7,'Laboratório 02',2,21);
INSERT INTO disciplina VALUES
	(1,'Banco de Dados',23,1,3,60,'segunda-feira','N',6),
	(2,'Banco de Dados 1',19,3,5,80,'sexta-feira','N',6),
	(3,'Administração Geral',34,4,null,30,'sexta-feira','T',1),
	(4,'Contabilidade',0,4,2,45,'segunda-feira','N',2),
	(5,'Multimídia',12,3,5,60,'terça-feira','M',5),
	(6,'TCC',8,5,2,50,'quarta-feira','N',3),
	(7,'Metodologia Científica'	,40,1,2,30,'quarta-feira','T',null),
	(8,'Programação 2',0 ,3,1,40,'quinta-feira','M',6),
	(9,'Português Instrumental',null,null,null,40,'quarta-feira','T',2),
	(10,'Banco de Dados',32,1,3,60,'segunda-feira','N',6),
	(11,'Banco de Dados 2',14,3,1,80,'segunda-feira','T',7),
	(12,'Inglês Técnico',15,4,null,50,'segunda-feira','T',2);

-- 1
select nome from professor where salario < 6000.01 and formação not in('Administração','Ciências da Computação');
-- 2
select descricao from sala where andar in (2,3,6) and capacidade > 99;
-- 3
select nome from disciplina where dia_semana in ('terça-feira','quarta-feira') and turno = 'T';
-- 4
select nome from curso where nivel = 'Técnico' and nome like '% de %';
-- 5
select nome,vagas_porAno / 2 from curso where mat_coordenador is not null;
-- 6
select nome, dia_semana, turno from disciplina where nome like 'Banco de Dados%';
-- 7
select nome from disciplina where mat_professor and qtde_matriculados is not null;
-- 8
select nome from disciplina where turno = 'M' and dia_semana = 'terça-feira' or turno = 'T' and dia_semana = 'segunda-feira';