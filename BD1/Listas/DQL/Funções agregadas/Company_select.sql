-- listar os empregados com maior salario
select fname as "Nome", lname as "Sobrenome", salary as "Salário" 
	from employee 
	where salary = (
		select max(salary) --'max' retorna o maior
			from employee);

-- retorna os elementos onde a coluna superssn é nula
select fname as "Nome", lname as "Sobrenome", salary as "Salário" 
	from employee e
	where e.superssn is null;
	
-- listar nomes dos empregados que moram em Houston, Texas
select e.fname, e.minit, e.lname
	from employee e 
	where e.address like '%Houston%TX%';
	
-- listar empregados que nasceram na decada de 50
select e.fname, e.minit, e.lname, e.bdate
	from employee e 
	where cast(e.bdate as text) like '__5%';

select e.fname, e.minit, e.lname, e.bdate
	from employee e 
	where e.bdate between '1950-01-01' and '1959-12-31';
	
-- selecionar empregados que o nome começa com A
select e.fname 
	from employee e 
	where e.fname like 'A%';
	
-- listar empregados ordenando por maior salario e depois, nome 
select *
	from employee 
	order by salary asc, fname desc;
	
-- ordenando por colunas dadas
select fname, lname, salary 	
	from employee
	order by 3, 1;
	
-- retorna os 3 empregados mais novos
select e.fname, e.lname, e.bdate
	from employee e
	order by e.bdate desc
	limit 3;

-- maior salario dos empregados 
select sum(salary) "Soma", 
		count(salary) "Nro", 
		avg(salary) "Media"
	from employee e;

-- empregado mais velho 
select e.fname "nome", e.bdate "nascimento"
	from employee e
	where bdate in ( 
		select min (bdate)
			from employee);
		
-- idade pelo nascimento do empregado mais velho
select e.fname "nome", e.bdate "nascimento", 
		(cast (now() as date) - bdate)/365 as "idade"
	from employee e
	where bdate in ( 
		select min (bdate)
			from employee);

-- retorna apenas a data, sem hora
select cast (now() as date); 

-- retorna a qtd de elementos
select count(*) from project p;

-- retorna a qtd de diferentes elementos 
select count ( distinct p.plocation) from project p;
