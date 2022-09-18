SET search_path TO escolaLinguas;

/*Trabalho 04*/
/*Consultas Simples por tabela*/

/*TABELA OUTROS_FUNCIONARIOS*/
/*Nomes dos funcionários que moram no endereco 1*/
select nome
from outros_funcionarios of2
where of2.id_endereco = '1';

/*Cargos distintos*/
select distinct cargo
from outros_funcionarios;

/*Funcionários com salário entre 1000 e 1500*/
select nome, salario
from outros_funcionarios of2
where of2 .salario  between '1000' and '1500';

/*Funcionários com a inicial A*/
select *
from outros_funcionarios of2
where of2.nome like 'A%';

/*Nome e salário de funcionários por ordem alfabética*/
select nome,salario
from outros_funcionarios of2
order by of2.nome;

/*TABELA MATERIAL*/
/*Busca todas as colunas da tabela material cuja linha possui o id do curso igual a 3*/
select *
from material
where id_curso=3;

/*Busca todos os materiais com nomes distintos (neste caso, retornará todos, uma vez que todos possuem nomes diferente)*/
select distinct nome_material
from material

/*Busca todas as colunas da tabela material cujas linhas possuem o id do curso entre 1 e 5*/
select *
from material
where id_curso between 1 and 5;

/*Busca a coluna nome_material da tabela material cujo nome_material possui a substring "Inglês"*/
select nome_material
from material
where nome_material like '%Inglês';

/*Busca todas as colunas da tabela material e ordena estes resultados pelo nome do material de maneira ascendente (ordem alfabética)*/
select *
from material
order by nome_material asc;

/*TABELA TURMA*/
/*Busca todas as colunas da tabela turma cujo id do professor é igual a 5*/
select *
from turma
where id_professor = 5;

/*Busca os registros distintos referentes a coluna nível da tabela turma */
select distinct nivel
from turma

/*Busca todas as colunas da tabela turma cujo id da turma está entre 6 e 10*/
select *
from turma
where id_turma between 6 and 10;

/*Busca os registros referentes a coluna sala da tabela turma cujos números da sala começam com '10' (buscar as salas que estão no 1° andar)*/
select sala
from turma
where sala like '10_';

/*Busca todas as colunas da tabela turma*/
select *
from turma
order by nivel desc, sala asc;

/*TABELA ALUNO*/
/*buscando todos os alunos do sexo masculino*/
SELECT *
FROM aluno
WHERE sexo = 'M';

/*buscando as opções de sexo para um aluno*/
SELECT DISTINCT sexo
FROM aluno;

/*buscando os nomes dos alunos em ordem alfabética*/
SELECT nome
FROM aluno
ORDER BY nome ASC;

/*buscando os alunos de id entre 1 e 4*/
SELECT id_aluno, nome
FROM aluno
WHERE id_aluno BETWEEN 1 AND 4;

/*buscando os alunos de nome parecido com 'Jo', como por exemplo, 'João' e 'Joana'.*/
SELECT nome
FROM aluno
WHERE nome LIKE 'Jo%';

/*TABELA CURSO*/
/*buscando o id do curso de 'Inglês'*/
SELECT id_curso
FROM curso
WHERE nome = 'Inglês';

/*buscando todos os cursos com nomes distintos (essa busca nâo faz tanto sentido)*/
SELECT DISTINCT nome
FROM curso

/*buscando todos os nomes dos cursos em ordem alfabética*/
SELECT nome
FROM curso
ORDER BY nome ASC;

/*buscando os cursos de id entre 2 e 5*/
SELECT id_curso, nome
FROM curso
WHERE id_curso BETWEEN 2 AND 5;

/*buscando os alunos de nome parecido com 'Es'.*/
SELECT nome
FROM curso
WHEREnome LIKE 'Es%';

/*TABELA ENDERECO*/
/*Listar o id, cidade, bairro, logradouro e o número da tabela endereço da tupla de cep 38400-106*/
SELECT id_endereco, cidade, bairro, logradouro, numero
FROM endereco
WHERE cep = '38400-106';

/*Listar todos os logradouros distintos da tabela endereco*/
SELECT DISTINCT logradouro
FROM endereco;

/*Listar o logradouro, bairro e o numero da tabela endereco no qual os ids das tuplas estao entre 4 e 9*/
SELECT logradouro, bairro, numero
FROM endereco
WHERE id_endereco BETWEEN 4 AND 9;

/*Listar os logradouros da tabela endereco que começam com 'Avenida'*/
SELECT logradouro
FROM endereco
WHERE UPPER (logradouro) LIKE 'Avenida%';

/*Listar o logradouro, número e bairro da tabela endereco ordenados em ordem decrescente, tendo como paramêtro o logradouro*/
SELECT logradouro, numero, bairro
FROM endereco
ORDER BY logradouro DESC;

/*TABELA PROFESSOR*/
/*Listar o nome e o salario do professor que tem o inglês como sua especialidade*/
SELECT nome, salario
FROM professor
WHERE especialidade = 'Inglês';

/*Listar todos os salarios distintos da tabela professor*/
SELECT DISTINCT salario
FROM professor;

/*Listar o cpf e o nome dos professores que têm salário entre 2200 e 2600*/
SELECT cpf, nome
FROM professor
WHERE salario BETWEEN 2200.00 AND 2600;

/*Listar o cpf e o salario de todos os professores que tenham Fernanda como nome*/
SELECT cpf, salario
FROM professor
WHERE UPPER (nomer) LIKE 'Fernanda%';

/*Listar o cpf, nome e salario dos professores em ordem decrescente de salário*/
SELECT cpf, nome, salario
FROM professor
ORDER BY salario DESC;

/*TABELA MATRICULA*/
/*retorna id e valor das matriculas com valor total entre 1000 e 1500*/
select id_matricula, valor_total
from matricula m
where m.valor_total between 1000 and 1500;

/*retorna todas as datas em que foi criada alguma matricula*/
select distinct data_matricula
from matricula m ;

/*retorna matricula ordenadas a partir da feita mais recentemente*/
select id_matricula , data_matricula
from matricula
order by data_matricula desc;

/*retorna as matriculas que possuem nro_parcelas maior que 5 e valor total menor que 1500*/
select id_matricula , valor_total
from matricula
where nro_parcelas > 5
and valor_total < 1500;

/*retorna o valor das matriculas que foram feitas no dia 21 independente do mes ou ano*/
select id_matricula , valor_total
from matricula
where cast(data_matricula as text) like '____-__-21';

/*TABELA PAGAMENTO*/
/*retorna data e valor de todos os pagamento feitos em 2019*/
select p.data_pagamento, p.valor
from pagamento p
where cast(p.data_pagamento as text) like '2019%';

/*retorna todos os pagamentos abaixo de 500*/
select p.id_pagamento
from pagamento p
where p.valor < 500;

/*retorna os diferentes valores de pagamentos feitos*/
select distinct valor
from pagamento p ;

/*retorna todos os pagamentos feitos em 2019*/
select p.id_pagamento , p.data_pagamento
from pagamento p
where p.data_pagamento between '2019-01-01' and '2019-12-31';

/*retorna os 5 pagamentos feitos por ultimo com suas respectivas datas*/
select p.id_pagamento , p.data_pagamento
from pagamento p
order by p.data_pagamento desc
limit 5;

/*TABELA_AVALIAÇÃO*/
/*Este comando realiza a consulta da data da avaliacao registrada na turma com id 7;*/
SELECT data_avaliacao
FROM avaliacao av
WHERE av.id_turma = 7;

/*Esta consulta seleciona todas as datas de avaliacao com datas distintas;*/
SELECT DISTINCT data_avaliacao
FROM avaliacao av;

/*Esta consulta seleciona as colunas de id, pontos e data das avaliacoes com id entre 1 e 3;*/
SELECT a.id_avaliacao, a.pontos, a.data_avaliacao
FROM avaliacao a
WHERE id_avaliacao BETWEEN 1 AND 3;

/*Esta consulta seleciona as colunas de id e data de avaliacao e as ordena de forma descendente;*/
SELECT id_avaliacao, data_avaliacao
FROM avaliacao a
ORDER BY DESC;

/*Esta consulta seleciona a coluna de pontos de avaliacao e filtra as colunas para apenas aquelas com data de dia 15;*/
SELECT pontos
FROM avaliacao a
WHERE cast(data_avaliacao AS text) LIKE '%15';

/*TABELA_AULA*/
/*Esta consulta seleciona as colunas de id e data da aula cujo horario seja igual a 07h;*/
SELECT a.id_aula, a.data_aula
FROM aula a
WHERE a.horario = '07:00:00';

/*Esta consulta seleciona as tabelas de id e horarios sem repeticao;*/
SELECT DISTINCT a.id_aula, a.horario
FROM aula a

/*Esta consulta seleciona as tabelas de id e horarios cujo horario estejam entre 7h e 10h;*/
SELECT a.id_aula, a.horario
FROM aula a
WHERE a.horario BETWEEN '07:00:00' AND '10:00:00';

/*Esta consulta seleciona as tabelas de id e horarios e os organiza em ordem ascendente;*/
SELECT a.id_aula, a.horario
FROM aula a
ORDER BY ASC;

/*Esta consulta seleciona a coluna de id, data e horario de aula e filtra as colunas para que sejam mostradas apenas as linhas com horario de 08;*/
SELECT a.id_aula, a.data_aula, a.horario
FROM aula a
WHERE cast(data_avaliacao AS text) LIKE '%08';


/*CONSULTAS ANINHADAS*/

/*Lista o id do aluno, o nome e o cpf de todos os alunos que tiraram nota abaixo ou igual a 6.0 pontos nas avaliações*/
select a.id_aluno, a.nome, a.cpf
    from aluno a
    where id_aluno in (
        select id_aluno from aluno_avaliacao
        where nota_aluno <= 6.0)

/*Buscar o nome dos cursos, tais quais existam turmas de nível intermediario e que possuam salas situadas no 2° andar ('20_');*/
select nome
	from curso
	where id_curso in(
		select id_curso
			from turma
			where nivel like 'Intermediário' and sala like '20_');

/*retorna o nome dos alunos que moram no 'Alto Umuarama'*/
select a.nome
	from aluno a
	where id_endereco in (
		select id_endereco
			from endereco e
			where e.bairro = 'Alto Umuarama');

/*Esta consulta seleciona a coluna horario da tabela turma e filtra os ids em uma consulta aninhada para aqueles que estejam apenas entre 1 e 5;*/
SELECT horario
	FROM aula a
  WHERE id_turma IN (
		SELECT id_turma
			FROM turma t
	    WHERE t.id_professor BETWEEN 1 AND 5);

/*O bairro em que os funcionários masculinos moram*/
select bairro
    from endereco e
    where e.id_endereco in(
        select id_endereco
        from outros_funcionarios of2
        where of2.sexo = 'M');

/*Nome dos funcionários que moram no bairro Bom Jesus*/
select nome
    from outros_funcionarios of2
    where of2.id_endereco in(
        select id_endereco
        from endereco e
        where e.bairro = 'Bom Jesus'
    );

/*Bairros onde os funcionários masculinos não moram ou bairros em que somente as funcionárias moram*/
select bairro
    from endereco e
    where e.id_endereco not in(
        select id_endereco
        from outros_funcionarios of2
        where of2.sexo = 'M');

/*CONSULTAS COM FUNÇÕES DE AGREGAÇÃO*/

--Retorna a média do valor da parcela dos cursos de idioma de maneira agrupada pelo numero de parcelas
select avg(valor_total/nro_parcelas) as "Média de preço dos cursos", nro_parcelas as "Numero de Parcelas"
    from matricula
    group by nro_parcelas;

/*Busca o maior valor total de matrícula para cada grupo distinto de número de parcelas que é superior a 3 e mostra os dados referentes a este valor total, seu numero de parcelas e o valor de cada parcela*/
select
	valor_total as "Maior Valor Total",
	nro_parcelas as "Numero de Parcelas",
	(valor_total/nro_parcelas) as "Maior Valor de Parcela"
from matricula
where valor_total in (
						select max(valor_total)
						from matricula
						group by nro_parcelas
						having nro_parcelas > 3)
order by nro_parcelas;

/*Buscando o valor pago por um aluno em todas as suas matrículas na escola*/
SELECT
    aluno.nome,
    sum(matricula.valor_total)
FROM
    matricula
INNER JOIN
    aluno on aluno.id_aluno = matricula.id_aluno
GROUP BY
    aluno.nome
ORDER BY
    sum(matricula.valor_total);

/*retorna a qtd de avaliações que foram aplicadas em cada uma das turmas*/
select id_turma , count(id_turma)
	from avaliacao
	group by id_turma
	order by id_turma;

/*Esta consulta seleciona a coluna id, id da turma e horario, filtrando pelos horarios maiores que 07h, realizando a contagem de quantas linhas existem com a mesma informacao;*/
SELECT id_aula, id_turma, horario, COUNT(a.id_aula)
    FROM aula a
    GROUP BY a.id_aula
    HAVING horario > '07:00:00';

/*Número de funcionárias*/
select count()
    from outros_funcionarios
    group by sexo
    having sexo = 'F';

/*A soma dos salários dos faxineiros*/
select sum(salario) "Soma"
    from outros_funcionarios
    group by cargo
    having cargo = 'Faxineiro';

/*O menor salário de funcionário masculino*/
select min(salario)
    from outros_funcionarios of2
    group by sexo
    having sexo = 'M';

/*O maior salário de funcionária*/
select max(salario)
    from outros_funcionarios of2
    group by sexo
    having sexo = 'F';

/*A média dos salários dos vendedores*/
select avg(salario)
    from outros_funcionarios
    group by cargo
    having cargo = 'vendedor';

/*CONSULTAS AVANÇADAS*/

/*Lista o nome do curso, o nível da turma e o nome do professor responsável em ordem alfabética*/
select c.nome as "Idioma do curso", t.nivel as "Nível da turma",
    p.nome as "Nome do professor responsável pela turma"
        from curso c
        inner join turma t
        on c.id_curso  = t.id_curso
        inner join professor p
        on t.id_professor  = p.id_professor
        order by p.nome asc

/*Buscando os dados: cpf, nome, sexo, salario, cargo de outros funcionários, junto com seus respectivos endereços (logradouro), ordenando do menor salário ao maior.*/
SELECT
    cpf,
    nome,
    sexo,
    salario,
    cargo,
    logradouro
FROM
    outros_funcionarios
INNER JOIN endereco
    ON outros_funcionarios.id_endereco = endereco.id_endereco
ORDER BY salario;

/*retorna os cursos que estão sem professor no momento*/
select c.nome
	from curso c
	where id_curso in (
		select t.id_curso
		from professor p full outer join turma t
		on p.id_professor = t.id_professor
		where p.id_professor is null
		or t.id_professor is null);

/*Esta consulta seleciona as colunas especificadas realizando uma juncao onde as linhas serao filtradas caso o id do professor na tabela turma seja igual ao id na tabela professor;*/
SELECT t.id_turma, p.id_professor, p.nome, p.especialidade , t.sala, t.nivel
	FROM turma t INNER JOIN professor p
	ON t.id_professor = p.id_professor;

/*Em que turma o aluno está*/
select
    a.nome as "Aluno",
    t.id_turma  as "Turma"
    from aluno a
    inner join turma t
        select m.id_turma
        from matricula m
        where m.id_aluno = a.id_aluno);

/*Nome do aluno e o curso em que ele está matriculada*/
select
    a.nome as "Aluno",
    c.nome  as "Curso"
    from aluno a
    inner join curso c
    on c.id_curso in(
        select t.id_curso
        from turma t
        where t.id_turma in(
            select m.id_turma
            from matricula m
            where m.id_aluno = a.id_aluno));

/*Busca os nomes dos alunos, o nível da turma que o mesmo está matriculado, e o nome do curso cuja turma está cadastrada, uma vez que este curso esteja dentre os cursos de línguas românticas (de base latina)*/
select a.nome as "Nome do Aluno", t.nivel "Nivel da Turma", c.nome "Curso de Língua Romântica"
  from aluno a
  left join matricula m
  on a.id_aluno = m.id_aluno
  inner join turma t
  on t.id_turma = m.id_turma
  inner join curso c
  on t.id_curso = c.id_curso and c.nome in (
  	select nome
    	from curso
    	where nome = 'Espanhol' or nome = 'Francês' or nome = 'Italiano'
  );

/*Busca os alunos que possuem o maior e o menos valor total na tabela matrícula e faz uma right join com professor, para verificar se exsite um professor que mora no mesmo endereço que estes alunos (que é pai, mãe, etc do alunod)*/
  select p.nome as "Nome do Professor", a.nome as "Nome do aluno"
  	from professor p
  	right join aluno a
  	on a.id_endereco = p.id_endereco
  	inner join matricula m
  	on a.id_aluno = m.id_aluno
  	where m.valor_total in(
  		select max(valor_total)
  			from matricula
  	) or m.valor_total in(
  		select min(valor_total)
  			from matricula
  	);
