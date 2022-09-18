--1. Listar a data de nascimento e o endereço dos empregados com nome: John B Smith
select e.bdate, e.address 
	from employee e 
	where upper (e.fname) = 'JOHN' 
	and upper (e.minit) = 'B' 
	and upper (e.lname) = 'SMITH';

--2. Listar o nome e endereço dos empregados que trabalham no departamento ’Research’
select e.fname, e.address 
	from employee e 
	where dno in(
		select d.dnumber 
		from department d
		where d.dname = 'Research'
	);
	
/*3. Para todo projeto localizado em ’Stafford’, listar o número do projeto, o número do departamento
 * que o controla e o último nome, endereço e data de nascimento do gerente do departamento.
 * */
select 
	p.pnumber as "Nro Projeto",
	p.dnum as "Nro Departamento",
	e.lname as "Sobrenome do Gerente",
	e.address as "Endereco do Gerente",
	e.bdate as "Data de Nasc. do Gerente"
from project p 
join employee e 
	on p.dnum in(
		select d.dnumber 
		from department d
	where mgrssn = e.ssn and p.plocation = 'Stafford'
	);

/*4. Listar o nome e endereço dos empregados que trabalham no departamento ’Research’ 
 * considerando os novos esquemas*/
select e.fname, e.address 
	from employee e 
	where e.dno in(
		select d.dnumber 
		from department d
		where d.dname = 'Research'
	);

--5. Para cada empregado, liste o seu primeiro e o seu último nome acompanhados do último nome de seu supervisor.
select 
	e.fname as employee_first,
	e.lname as employee_last,
	sup.fname as supervisor_first,
	sup.lname as supervisor_last
from employee e 
join employee sup
	on e.superssn = sup.ssn
	order by sup.ssn;

/*6. Listar o nome e o endereço dos empregados que trabalham no departamento ’Research’ 
considerando as novas tabelas employee e department e usando apelidos*/
select 
	e.fname as "Empregado",
	e.address as "Endereco"
from employee e 
	where e.dno in(
		select d.dnumber 
		from department d 
		where d.dname = 'Research'
	);

--7. Listar o produto cartesiano de empregados e departamentos
select * from employee e, department d;

--8. Listar todos os salários distintos
select distinct(e.salary) 
	from employee e; 

/*
 *9. Listar os números dos projetos que envolvam um empregado cujo último nome é ’Wong’ 
 * sendo que o empregado deve ser trabalhador ou gerente do departamento que controla 
 * o projeto.
*/

select wo.pno "Nro projeto", e.fname, e.lname 
	from employee e, works_on wo 
	where e.ssn = wo.essn 
	and e.lname = 'Wong'
	union(
		select p.pnumber "Nro projeto", e.fname, e.lname
			from project p, department d, employee e
			where p.dnum = d.dnumber 
			and d.mgrssn = e.ssn 
			and e.lname = 'Wong');

--10 Listar o nome de todo empregado cujo endereço está em Houston, Texas
select e.fname 
	from employee e
	where e.address like '%Houston%TX';
	
--11 Listar o nome de todos os empregados nascidos na década de 50
select e.fname, e.minit, e.lname, e.bdate 
	from employee e 
	where cast(e.bdate as text) like '__5%';

/* 12. Listar o nome e os salários resultantes de um aumento de 10% para os 
 * funcionários do projeto ’Productx’*/
select 
	e.fname as "Nome",
	e.minit,
	e.lname,
	e.salary * 1.10 as "Salário"
	from employee e 
	inner join works_on wo 
	on e.ssn = wo.essn
	where wo.pno in(
		select p.pnumber 
		from project p 
		where p.pname = 'ProductX'
	);

--RESP do PROF
SELECT e.fname, e.minit, e.lname, e.salary*1.1 AS NewSalary
	FROM employee e, project p, works_on wo
	WHERE e.ssn=wo.essn AND wo.pno=p.pnumber
	AND p.pname='ProductX';

--13. Listar todos os empregados no departamento 5 cujo salário está entre 30000 e 40000
select *
	from employee e 
	where e.dno = '5' and 
	e.salary between 30000 and 40000;

--RESP do PROF
SELECT *
	FROM employee e
	WHERE e.dno='5'
	AND e.salary BETWEEN 30000 AND 40000;

/*14. Listar os empregados e projetos em que eles estão trabalhando, ordenados pelo 
departamento e, dentro de cada departamento, ordenado pelo último e primeiro nome*/
select e.dno, e.fname, e.lname, wo.pno 
	from employee e 
	inner join works_on wo 
	on e.ssn = wo.essn
	order by e.dno, e.lname, e.fname;

--RESP do PROF
SELECT e.dno, e.fname, e.lname, wo.pno 
	FROM employee e, works_on wo 
	WHERE wo.essn=e.ssn 
	ORDER BY e.dno, e.fname, e.lname;

/*15. Listar a soma de salários, o maior salário e a média de salários, somente para 
funcionários do departamento 'Research'*/
select sum(e.salary), max(e.salary), avg(e.salary)
	from employee e 
	where e.dno in(
		select d.dnumber 
		from department d
		where d.dname = 'Research'
	);

--RESP do PROF
SELECT SUM(salary), MAX(salary), MIN(salary), AVG(salary)
	FROM employee, department
	WHERE dno=dnumber 
	AND dname='Research';
	
--16. Listar o número de salários distintos
select count(distinct e.salary)
	from employee e;

--RESP do PROF
SELECT COUNT(DISTINCT salary)
	FROM employee;

--17. Listar o nome dos empregados que têm dois ou mais dependentes
select e.fname, e.lname 
	from employee e
	where(
		select count(*) 
		from dependent d
		where e.ssn = d.essn 
	)>= 2;

--RESP do PROF
SELECT lname, fname
	FROM employee
	WHERE (SELECT COUNT(*)
		FROM dependent
		WHERE essn=ssn) >= 2;
	
/*18. Listar para cada departamento seu número, a quantidade de empregados e a média 
salarial de seus empregados.*/
select e.dno, count(*), avg(e.salary) 
	from employee e 
	inner join department d 
	on d.dnumber = e.dno 
	group by e.dno;

--RESP do PROF
SELECT dnumber, COUNT(*), AVG(salary)
	FROM department, employee
	WHERE dno=dnumber
	GROUP BY dnumber;

-- 19.Listar para cada projeto seu número, nome e a quantidade de empregados que trabalham no projeto.
select 
	p.pnumber as "Número",
	p.pname as "Nome",
	count(*) as "Número de empregados"
	from project p inner join works_on wo 
	on wo.pno = p.pnumber
	group by p.pnumber, p.pname; 

/*20. Listar para cada projeto onde trabalham mais de dois empregados seu número e a 
* quantidade de empregados que trabalham no projeto */
sELECT pnumber, pname, COUNT(*)
	FROM project, works_on
	WHERE pno=pnumber
	GROUP BY pnumber, pname
	HAVING COUNT (*)> 2;


	
	

	
	
select * from employee e;

select e.fname as "Nome", e.salary as "Salário"
	from employee e;

--Distinct remove os repetidos
select distinct p.plocation as "Localização"
	from project p;

select e.fname as "Nome", e.salary as "Salário"
	from employee e
	where e.salary >= 40000 
	and e.salary <= 50000;

select e.fname as "Nome", e.salary as "Salário"
	from employee e
	where e.salary = 40000;

-- BETWEEN inclui as bordas
select e.fname as "Nome", e.salary as "Salário"
	from employee e
	where e.salary between 40000 and 50000;

select pname as "Nome Projeto"
	from project
	where upper (plocation) not in ('BELLAIRE', 'HOUSTON');

--Listar funcionários que trabalham em projetos
select fname as "Nome" from employee 
	where ssn in (
		select essn
		from works_on
	);

--Listar funcionários que não trabalham em projetos
select fname as "Nome" from employee 
	where ssn not in (
		select essn
		from works_on
	);

select p.pname "Nome projeto" from project p
	where p.pnumber in(
		select pno 
			from works_on 
		where essn not in (
			select ssn
				from employee 
			where fname = 'John'));
		
select fname, lname, salary
from employee 
where salary in (
	select max(salary)
		from employee);
	
select fname, lname, salary
	from employee e
	where e.superssn is null;

--Funcionários com a inicial J
select e.fname
	from employee e 
	where e.fname like 'J%'; 

--Funcioários nascidos na década de 50
select e.fname
	from employee e 
	where cast(e.bdate as text) like '__5%'; 

select e.fname, e.salary from employee e
	order by salary asc, fname  desc;

select e.fname, e.salary from employee e
	order by 2,1;

--Listar os projetos em que John trabalha
select p.pname "Nome Projeto" from project p
	where p.pnumber in(
		select pno 
		from works_on
		where essn in(
			select ssn 
			from employee 
			where fname = 'John'
		) 
	);

--Funções agregadas

--Soma dos salários dos empregados, quantos recebem e a média da soma
select sum(salary) "Soma", count(salary) "Nro", avg(salary) "Media"
	from employee e;

--Mostra data e hora atual
select now();

--Idade dos empregados
select fname "Nome", (cast(now() as date) - bdate)/365 as "Idade"
	from employee;

--Empregado mais velho
select fname "Nome", (cast(now() as date) - bdate)/365 as "Idade"
	from employee 
	where bdate in (select min(bdate)
					from employee);

--Quantos projetos estão cadastrados				
select count(*) 
	from project p;

--Quantas localizações de projetos há
select count(distinct p.plocation)
	from project p;

--Agrupamentos

--Relacionamentos de dependentes
select d.relationship
	from dependent d 
	group by d.relationship ;

select distinct relationship from dependent d;

--Campos NULOS também são contados
select p.plocation, count(p.plocation)
	from project p 
	group by p.plocation;

-- Parentesco diferente de esposa e feminino
select d.relationship as "Parentesco", count(d.relationship)
	from dependent d 
	where d.sex ='F'
	group by d.relationship 
	having d.relationship <> 'SPOUSE';

--Funcionárias femininas
select e.fname
	from employee e
	where e.sex ='F';

-- Funcionário sem supervisor
select 
	e.fname as employee_first,
	e.lname as employee_last,
	sup.fname as supervisor_first,
	sup.lname as supervisor_last
from employee e 
left outer join employee sup
	on e.superssn = sup.ssn
	where sup.ssn is null;







	
