/* tabela Compra */

-- create

create schema compra; 

create table produto (
    cod_produto serial not null, 
    nome varchar (25), 
    valor float, 
    constraint produto_fk primary key (cod_produto)
);

create table cliente (
    cod_cliente serial not null, 
    nome varchar (25), 
    data_nasc date , 
    constraint cliente_pk primary key (cod_cliente) 
);

create table compra (
    cod_cliente int , 
    cod_produto int, 
    dataHora date, 
    constraint compra_pk primary key (cod_cliente, cod_produto),
    constraint cod_cliente_fk foreign key (cod_cliente) 
        references cliente(cod_cliente),
    constraint cod_produto_fk foreign key (cod_produto) 
        references produto(cod_produto)
);

insert into produto(nome, valor) values 
    ('Queijo', 15.00), 
    ('Goiabada', 8.00), 
    ('Doce de leite', 7.00);

insert into cliente(nome, data_nasc) values 
    ('Maria', '2000-01-05'), 
    ('Ana', '1998-05-03'), 
    ('Carlos', '1990-02-02');

insert into compra values 
    (1, 1, '2016-10-20 00:00:00'),
    (1, 2, '2016-10-20 00:00:00'),
    (1, 3, '2016-10-20 00:00:00'),
    (2, 1, '2016-10-20 00:00:00'),
    (2, 2, '2016-10-20 00:00:00'),
    (2, 2, '2016-10-20 00:00:00');

