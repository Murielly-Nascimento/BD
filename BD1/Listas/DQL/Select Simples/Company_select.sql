/* TABELA COMPANY */

-- retorna todas as colunas da tabela employee 
select * 
	from employee e;
	
-- selecione duas colunas determinadas para a tabela employee 
select e.fname, e.salary
	from employee e;

-- 'as' define um apelido para a coluna apresentada
select e.fname as "Nome", e.salary as "Salario"
	from employee e;
	
-- não precisamas definir a tabela se usamos uma unica tabela
select fname as "Nome", salary as "Salario"
	from employee e;
	
-- retorna apenas elementos distintos (sem repetição)
select distinct p.plocation as "localização"
	from project p;
	
-- 'where' define uma condição para ser satisfeita pela coluna
select e.fname as "Nome", e.salary as "Salario"
	from employee e 
	where salary > 40000;
	
-- between define um range 
select e.fname as "Nome", e.salary as "Salario"
	from employee e 
	where salary between 40000 and 50000; -- inclue as bordas 
	
-- 'in' define uma lista, o elemento retornado terá 'plocation' igual um dos elementos descritos na lista do in
select pname as "Nome Projeto" 
	from project 
	where plocation in ('Bellaire', 'Houston');
	
-- retorna os elementos pname que possuem plocation diferente dos elementos da lista do 'not in'
select pname as "Nome Projeto" 
	from project 
	where plocation not in ('Bellaire', 'Houston');
	
	
-- lista os nomes dos funcionarios que trabalharem em algum projeto (possuem essn na tabela works_on)
select fname as "Nome"
	from employee 
	where ssn in ( 
		select essn
		from works_on );
		
-- lista todos os projetos ondo o 'John' trabalhou
select pno
	from works_on 
	where essn in ( 
		select ssn
		from employee 
		where fname = 'John');
		
-- retorna o nome dos projetos em que o 'john' trabalhou
select p.pname "Nome do projeto" 
	from project p
	where p.pnumber in (
		select pno
		from works_on 
		where essn in ( 
			select ssn
			from employee 
			where fname = 'John'
		)
	);