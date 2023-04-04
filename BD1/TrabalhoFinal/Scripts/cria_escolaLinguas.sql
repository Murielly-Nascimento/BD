/*Se houver algum schema de escolaLinguas ele será deletado*/
DROP SCHEMA escolaLinguas CASCADE;
/*Criamos o schema*/
CREATE SCHEMA escolaLinguas;
SET search_path TO escolaLinguas;

--ENDERECO
create table endereco
(
    /* CHAVE PRIMARIA */
    id_endereco serial,
    /* ATRIBUTOS */
    cep char(10) not null, -- exemplo: 38400-712
    cidade varchar(50) not null,
    estado char(2) not null,
    bairro varchar(50),
    logradouro varchar(100),
    numero int,
    complemento varchar(100)
);

--OUTROS FUNCIONARIOS
create table outros_funcionarios
(
    /* CHAVE PRIMARIA */
    id_funcionario serial,
    /* CHAVE ESTRANGEIRA */
    id_endereco int,
    /* ATRIBUTOS */
    cpf char (14) not null unique, -- exemplo: 123.123.123-12
    nome varchar (255),
    sexo char not null check (sexo in ('M', 'F', 'O')),
    salario float default 1500.00,
    cargo varchar (20)
);

--ALUNO
create table aluno
(
    /* CHAVE PRIMARIA */
    id_aluno serial,
    /* CHAVE ESTRANGEIRA */
    id_endereco int,
    /* ATRIBUTOS */
    cpf char(14) not null unique, -- exemplo: 123.456.789-01
    nome varchar(50) not null,
    sexo char not null check (sexo in ('M', 'F', 'O'))
);

--CURSO
create table curso
(
    /* CHAVE PRIMARIA */
    id_curso serial,
    /* ATRIBUTOS */
    nome varchar(20)
);

--PROFESSOR
create table professor(
    /* CHAVE PRIMARIA */
    id_professor serial,
    /* CHAVE ESTRANGEIRA */
    id_curso int not null,
    id_endereco int,
    /* ATRIBUTOS */
    cpf varchar(20),
    nome varchar(45),
    salario float not null default 250.00,
    sexo char,
    especialidade varchar(45)
);

--TURMA
create table turma
(
    /* CHAVE PRIMARIA */
    id_turma serial,
    /* CHAVE ESTRANGEIRA */
    id_curso int not null,
    id_professor int,
    /* ATRIBUTOS */
    nivel varchar(20),
    sala varchar(20)
);

--MATRICULA
create table matricula
(
    /* CHAVE PRIMARIA */
    id_matricula serial,
    /* CHAVE PRIMARIA - ESTRANGEIRA */
    id_turma int not null,
    /* CHAVE ESTRANGEIRA */
    id_aluno int not null,
    /* ATRIBUTOS */
    numero int not null,
    data_matricula date,
    valor_total float not null default 250.00,
    nro_parcelas int not null default 0
);

--PAGAMENTO
create table pagamento
(
    /* CHAVE PRIMARIA */
    id_pagamento serial,
    /* CHAVE ESTRANGEIRA */
    matricula_id_turma int not null,
    id_matricula int not null,
    /* ATRIBUTOS */
    valor float not null default 250.00,
    data_pagamento date
);

--AULA
create table aula
(
    /* CHAVE PRIMARIA */
    id_aula serial,
    /* CHAVE ESTRANGEIRA */
    id_turma int not null,
    /* ATRIBUTOS */
    nome varchar(20),
    data_aula date,
    horario time
);

--ALUNO_AULA
create table aluno_aula
(
    /* CHAVE PRIMARIA - ESTRANGEIRA */
    id_aluno int not null,
    id_aula int not null
);

--MATERIAL
create table material
(
    /* CHAVE PRIMARIA */
    nome_material varchar(45),
    /* ATRIBUTOS */
    descricao varchar(45),
    /* CHAVE ESTRANGEIRA */
    id_curso int not null
);

--ALUNO_MATERIAL
create table aluno_material
(
    /* CHAVE PRIMARIA - ESTRANGEIRA */
    id_aluno int not null,
    nome_material varchar(50) not null,
    material_id_curso int not null,
    /* ATRIBUTOS */
    foi_recebido boolean default false
);

--AVALIAÇÃO
create table avaliacao
(
    /* CHAVE PRIMARIA */
    id_avaliacao serial,
    /* CHAVE ESTRANGEIRA */
    id_turma int not null,
    /* ATRIBUTOS */
    pontos float not null default 10,
    data_avaliacao date
);

--ALUNO_AVALIACAO
create table aluno_avaliacao
(
    /* CHAVE PRIMARIA - ESTRANGEIRA */
    id_aluno int not null,
    id_avaliacao int not null,
    /* ATRIBUTOS */
    nota_aluno float default 0
);

alter table endereco
   add constraint endereco_pk primary key (id_endereco);

alter table outros_funcionarios
    add constraint outros_funcionarios_pk primary key (id_funcionario),
    add constraint endereco_fk foreign key (id_endereco)
   		references endereco(id_endereco) on update cascade on delete set null;

alter table aluno
   add constraint aluno_pk primary key (id_aluno) ,
   add constraint endereco_fk foreign key (id_endereco)
  		references endereco(id_endereco) on update cascade on delete set null;

alter table curso
    add constraint curso_pk primary key (id_curso);

alter table professor
    add constraint professor_pk primary key (id_professor) ,
    add constraint curso_fk foreign key (id_curso)
    	references curso(id_curso) on update cascade on delete cascade,
    add constraint endereco_fk foreign key (id_endereco)
   		references endereco(id_endereco) on update cascade on delete set null;

alter table turma
    add constraint turma_pk primary key (id_turma),
    add constraint curso_fk foreign key (id_curso)
    	references curso(id_curso) on update cascade on delete cascade,
    add constraint professor_fk foreign key (id_professor)
   		references professor(id_professor) on update cascade on delete set null;

alter table matricula
    add constraint matricula_pk primary key (id_matricula, id_turma),  -- definimos a chave primaria como sendo id_matricula e turma_fk
    add constraint turma_fk foreign key (id_turma)
    	references turma(id_turma) on update cascade on delete cascade,
    add constraint aluno_fk foreign key (id_aluno)
   		references aluno(id_aluno) on update cascade on delete cascade;

alter table pagamento
    add constraint pagamento_pk primary key (id_pagamento),
    add constraint matricula_fk foreign key (id_matricula,matricula_id_turma)
   		references matricula(id_matricula,id_turma) on update cascade on delete cascade;

alter table aula
    add constraint aula_pk primary key (id_aula),
    add constraint turma_fk foreign key (id_turma)
   		references turma(id_turma) on update cascade on delete cascade;

alter table aluno_aula
    add constraint aluno_aula_pk primary key (id_aluno, id_aula),
    add constraint aluno_fk foreign key (id_aluno)
    	references aluno(id_aluno) on update cascade on delete cascade,
    add constraint aula_fk foreign key (id_aula)
   		references aula(id_aula) on update cascade on delete cascade;

alter table material
    add constraint curso_fk foreign key (id_curso)
    	references curso(id_curso) on update cascade on delete cascade,
    add constraint nome_material_pk primary key (nome_material, id_curso);

alter table aluno_material
    add constraint aluno_material_pk primary key (id_aluno, nome_material, material_id_curso),
    add constraint aluno_fk foreign key (id_aluno)
    	references aluno(id_aluno) on update cascade on delete cascade,
    add constraint material_fk foreign key (nome_material, material_id_curso)
   		references material(nome_material, id_curso) on update cascade on delete cascade;

alter table avaliacao
    add constraint avaliacao_pk primary key (id_avaliacao),
    add constraint turma_fk foreign key (id_turma)
   		references turma(id_turma) on update cascade on delete cascade;

alter table aluno_avaliacao
    add constraint aluno_avaliacao_pk primary key (id_aluno, id_avaliacao),
    add constraint aluno_fk foreign key (id_aluno)
    	references aluno(id_aluno) on update cascade on delete cascade,
    add constraint avaliacao_fk foreign key (id_avaliacao)
    	references avaliacao(id_avaliacao) on update cascade on delete cascade;
