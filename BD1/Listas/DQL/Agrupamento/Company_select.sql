
-- uso do agrupamento no parentesco dos dependentes
select d.relationship, count (d.relationship)
	from dependent d
	group by d.relationship;
	
-- retorna as faixas salarias, qtd e soma em cada faixa 
select e.salary , count (e.salary), sum (e.salary)
	from employee e
	group by e.salary
	order by e.salary;
	
-- retorna as faixas salariais acima de 40000 
select e.salary , count (e.salary), sum (e.salary)
	from employee e
	group by e.salary
	having e.salary >40000
	order by e.salary;
	
-- agrupa os elementos entre 30000 e 40000 
	-- e retorna os grupos acima de 35000
select e.salary , count (e.salary), sum (e.salary)
	from employee e
	where e.salary between 30000 and 40000
	group by e.salary
	having e.salary >35000
	order by e.salary;