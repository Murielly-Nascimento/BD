/* TABELA CUPOM */ 

create schema "Cupom"

CREATE TABLE "Cupom".cliente (
    cod_cliente serial NOT NULL,
    nome varchar(45) NOT NULL,
    data_nasc date NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cod_cliente)
);

CREATE TABLE "Cupom".cupom_desconto (
    cod_cupom serial NOT NULL,
    valor decimal(8,2) NOT NULL,
    validade date NOT NULL,
    cod_cliente int not null,
    CONSTRAINT cupom_pk PRIMARY KEY (cod_cupom),
    constraint cupom_FK foreign key (cod_cliente) references cliente(cod_cliente)
);

-- inserir dados 
insert into "Cupom".cliente (nome, data_nasc) values 
    ('Maria',  '2000-01-05'), 
    ('Ana', '1998-05-03'), 
    ('Carlos', '1990-02-02');

insert into "Cupom".cupom_desconto (valor, validade, cod_cliente) values 
    (0.3, '2020-10-20', 1),
    (0.4, '2020-10-20', 1),
    (0.15, '2020-10-20', 1),
    (0.15, '2020-10-20', 2),
    (0.15, '2020-10-20', 2);
