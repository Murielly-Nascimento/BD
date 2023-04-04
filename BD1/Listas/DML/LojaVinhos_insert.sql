SET search_path TO lojavinhos;

insert into regiao (regiao_id, nome_regiao) values (5, 'Serras Gauchas');
insert into regiao (regiao_id, nome_regiao,descricao_regiao) values (11, 'Serras Catarinenses','lalala');
insert into regiao (descricao_regiao, nome_regiao, regiao_id) values ('regiao qualquer', 'Vale do Sao Francisco',15);
insert into regiao values (10, 'Vale do Maipo','','Vinicola Chilena');
insert into regiao (regiao_id, nome_regiao) values (2, 'Vale Central');
insert into regiao (regiao_id, nome_regiao) values (8, 'Outras Regioes');

insert into vinicola (id_vinicola, fk_id_regiao, nome_vinicola, fone_vinicola) 
values (4, 5, 'Vinho do Pessego', '2222-5555'),
    (5, 5, 'Aurora', '2323-5454'),
    (6, 11, 'Miolo', '3232-4545'),
    (7, 11, 'Concha do Bode', '2222-1111'),
    (8, 11, 'Barrica de Carvalho', '1111-5555'),
    (9, 15, 'Arco do Cedro', '2222-3333'),
    (10, 15, 'Recheio', '1234-4321'),
    (11, 10, 'Sangue do Bom', '6789-9876'),
    (12, 10, 'Vinicola do Padre', '1122-2211'),
    (13, 10, 'Vinicola do Frei', '9966-6699'),
    (14, 2, 'Maputcho', '2442-7371'),
    (15, 2, 'Concha e Polo', '5458-8584'),
    (16, 2, 'Vinhedo Sto Beberr?o', '9732-2379');

insert into vinho (id_vinho, fk_id_vinicola, nome_vinho, ano_vinho, tipo_vinho, preco_vinho) 
values (1, 4, 'vinho do bao', 2008, 'branco', 22.45),
        (2, 8, 'Casa Blanca', 2008, 'branco', 12.45),
        (3, 4, 'Frei Damiao', 2008, 'espumante', 222.50),
        (4, 5, 'Sabor do Vale', 2008, 'branco', 10.45),
        (5, 8, 'Encorpado da Serra', 2008, 'tinto', 13.45),
        (6, 9, 'Sabor a mesa', 2008, 'rose', 26.45),
        (7, 10, 'Trapicho', 2008, 'rose', 102.95),
        (8, 12, 'Carrapicho', 2008, 'rose', 22.45),
        (9, 5, 'Videira Aurora', 2008, 'branco', 23.65),
        (10, 12, 'Sangria', 2008, 'tinto', 27.45),
        (11, 7, 'Vinhedo Doce', 2008, 'branco', 55.22),
        (12, 8, 'Joao Marcos', 2008, 'tinto', 63.15),
        (13, 4, 'Patricia Raviera', 2008, 'rose', 18.45),
        (14, 5, 'Palmeira Dourada', 2008, 'branco', 22.45),
        (15, 6, 'Olho do Lince', 2008, 'rose', 23.99),
        (16, 4, 'Carvalho Branco', 2008, 'espumante', 22.45),
        (17, 5, 'Carvalho Doce', 2008, 'tinto', 29.45),
        (18, 14, 'Giulia Dolito', 2008, 'espumante', 23.65),
        (19, 15, 'Esperanza', 2008, 'branco', 28.15),
        (21, 12, 'Sangue de Boaaa', 2008, 'tinto', 29.85),
        (22, 4, 'Ultimo Gole', 2008, 'tinto', 30.12),
        (23, 5, 'Saideira', 2008, 'espumante', 60.45),
        (24, 8, 'Sorrento', 2009, 'tinto', 54.45);