
/* SELECT */

/* EXISTS */
-- retorna todos os cliente que fizeram compras 
    -- ou seja, todo cliente que tem seu cod_cliente em pelo menos uma compra
select * 
    from cliente 
    where exists 
        ( select 1
            from compra 
            where compra.cod_cliente = cliente.cod_cliente);

-- retorna todos os elemento da tabela gerada atraves do 2º select 
select * from (
    select * from cliente 
        where data_nasc > '1998-01-01') as lista
    where lista.nome like '_n%'; 
