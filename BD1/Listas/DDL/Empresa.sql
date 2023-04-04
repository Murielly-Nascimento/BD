create schema empresa; -- cria um esquema

drop schema empresa; -- apaga um esquema (se ele estiver vazio)
drop schema company cascade; -- apaga um esquema (se tiver tabelas)

create table empregado (
	-- definição de colunas
	cpf char (14) not null, 
	nome varchar (20) not null, 
	sobrenome varchar (20) not null, 
	datanasc date not null, 
	endereco varchar (255) not null, 
	sexo char not null check (sexo in ('M', 'F')), -- defini uma condição para o sexo
	salario decimal (9,2) not null, 
	supervisorcpf char (14), 
	departamentonro int not null,
	-- definição de restrição
	constraint emppk primary key (cpf), 
	constraint superfk foreign key (supervisorcpf) references empregado (cpf)
);

create table departamento (
	-- definição de colunas
	numerodepto int not null, 
	nome varchar (45) not null, 
	gerentecpf char (14) not null, 
	data_inicio timestamp default now(), -- tipo 'yyyy-mm-dd hh:mm:ss' 
	-- definição de restrição 
	constraint deptopk primary key (numerodepto),
	constraint gerentefk foreign key (gerentecpf) references empregado (cpf) -- empregado precisará já estar cadastrado 
);

alter table empregado 
	add constraint deptofk foreign key (departamentonro) references departamento (numerodepto); -- departamento já precisa estar cadastrado

alter table departamento rename gerentecpf to gerente_cpf; -- renomeia a coluna 'gerentecpf' para 'gerente_cpf'

alter table departamento drop constraint gerentefk; -- apaga a constraint 'gerentefk'

alter table departamento 
	add foreign key (gerente_cpf) references empregado(cpf); -- cria nova fk
	
alter table departamento rename constraint departamento_gerente_cpf_fkey to gerente_fk; -- altera o nome da constraint

alter table empregado drop sobrenome; -- deleta coluna

alter table empregado add column sobrenome varchar(45) not null; -- adiciona nova coluna (com tipo e restrições)
