-- create

create schema lojaVinhos;

create table regiao 
(
	regiao_id int not null, 
	nome_regiao varchar (100) not null, 
	mapa_regiao bytea, 
	descricao_regiao text,
	constraint regiao_pk primary key (id_regiao)
);

create table vinicola
(
	id_vinicola int not null, 
	nome_vinicola varchar(100) not null, 
	descricao_vinicola varchar(15), 
	fone_vinicola varchar(15), 
	fax_vinicola varchar(15), 
	fk_id_regiao int default '0' not null,
	constraint vinicola_pk primary key (id_vinicola), 
	constraint vinicola_regiao_fk foreign key (fk_id_regiao)
		references regiao(id_regiao)
		on update cascade on delete no action 
);

create table vinho 
(
	id_vinho int not null, 
	nome_vinho varchar(50) not null, 
	tipo_vinho varchar(10) default ' ' not null, 
	ano_vinho int default '0' not null, 
	descricao_vinho text, 
	preco_vinho decimal(8,2), 
	fk_id_vinicola int not null, 
	constraint vinho_pk primary key (id_vinho), 
	constraint vinho_vinicola_fk foreign key (fk_id_vinicola)
		references vinicolo(id_vinicola)
		on update cascade on delete no action, 
	constraint check_tipo_vinho check (tipo_vinho in ('branco', 'tinto', 'rose', 'espumante'))
);