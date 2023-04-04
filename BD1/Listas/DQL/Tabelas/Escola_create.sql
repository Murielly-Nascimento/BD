create schema escola;

create table orientador (
	id int primary key, 
	nome varchar(255)
);

create table aluno (
	matricula int not null, 
	nome varchar(255),
	orientador_id int, 
	constraint aluno_pk primary key (matricula), 
	constraint aluno_orientador_id_fk foreign key (orientador_id) references orientador(id)
		on update no action on delete no action 
);

insert into orientador values 
	(1, 'Prof. José'), 
	(2, 'Profa. Maria');

insert into aluno values 
	(1, 'Carlos', NULL), 
	(2, 'Roberto', 2), 
	(3, 'Ailton', NULL);