
-- produto cartesiano
select * from aluno a, orientador o 
    where a.orientador_id = o.id;

-- inner join == join : junção interna
select * from 
    aluno a inner join orientador o on 
        o.id = a.orientador_id;

-- left outer join : junção + coluna à esquerda
select * from 
    orientador o left outer join aluno a on 
        o.id = a.orientador_id;
        
-- right outer join : junção + coluna à direta
select * from 
    orientador o right outer join aluno a on 
        o.id = a.orientador_id;

-- executa a junção, mas retorna apenas os que tiverem orientador null
select * from 
    orientador o left outer join aluno a on 
        o.id = a.orientador_id
    where a.orientador_id is null;

-- full outer join : retorna a junção e todos os elementos que não se juntam
select * from 
    orientador o full outer join aluno a on a.orientador_id = o.id
    where a.orientador_id is null;

-- cross join : produto cartesiano sem condição de igualdade
select * from 
    orientador o cross join aluno a;