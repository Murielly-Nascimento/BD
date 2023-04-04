-- produto cartesiano
select * from cliente c, cupom_desconto cd  
    where c.cod_cliente = cd.cod_cliente;

-- join 
select * from cliente natural join cupom_desconto;

/* 
    o produto cartesiano consume muito memoria da máquina
    o natural join é mais eficiente
*/

-- retorna quais os clientes (pelo cod) e quantos cupons cada um tem
select cd.cod_cliente , count (*) 
    from cupom_desconto cd
    group by cd.cod_cliente;

-- retorna o nome dos cliente e a qtd de cupons de cada um
    -- natural join so pode ser usado se o nome dos ids for o mesmo para as duas tabelas
select c.cod_cliente "codigo", c.nome "nome", count (c.cod_cliente) "qtd de cupons"
    from cliente c natural join cupom_desconto cd
    group by c.cod_cliente
    order by c.cod_cliente;

