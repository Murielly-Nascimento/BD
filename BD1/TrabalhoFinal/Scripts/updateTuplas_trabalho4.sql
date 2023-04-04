/*As únicas tabelas que não foi feito um UPDATE buscando dados em outras tabelas foram as tabelas que não possuíam chaves_estrangeiras*/

UPDATE curso
  SET nome = 'Inglês Britânico'
  WHERE id_curso = 1;

UPDATE curso
  SET nome = 'Espanhol Mexicano'
  WHERE id_curso = 2;

UPDATE curso
  SET nome = 'Francês Suíço'
  WHERE id_curso = 3;

UPDATE material
  SET descricao = 'Livro para estudo guiado de Inglês Britânico'
  WHERE id_curso = 1;

UPDATE material
  SET descricao = 'Livro para estudo guiado de Espanhol Mexicano'
  WHERE id_curso = 2;

UPDATE material
  SET descricao = 'Livro para estudo guiado de Francês Suíço'
  WHERE id_curso = 3;

UPDATE endereco
  SET complemento = 'Ao lado da padaria Pão Gostoso'
  WHERE id_endereco = 9;

UPDATE endereco
  SET complemento = 'Apartamento 403'
  WHERE id_endereco = 1;

UPDATE endereco
  SET complemento = 'Em frente a praça Matriz'
  WHERE id_endereco in (
      SELECT id_endereco
      FROM aluno
      WHERE nome = 'Valéria Ribeiro Lima');

UPDATE professor
  SET salario = 2200.00
  WHERE id_professor = 1;

UPDATE professor
  SET salario = 2500.00
  WHERE id_professor = 9;

UPDATE professor
  SET salario = 2400.00
  WHERE id_professor in (
      SELECT id_professor
      FROM turma
      WHERE sala = '102');

update outros_funcionarios
    set nome = 'Daniel Carvalho Lisboa'
    where id_funcionario  = 10;

update outros_funcionarios
    set nome = 'Lenora Carvalho Lisboa'
    where id_funcionario  = 9;

update outros_funcionarios
    set cargo = 'vendedor'
    where id_endereco in(
        select id_endereco
        from endereco
        where id_endereco = 1);

UPDATE aula
    SET horario = '06:00:00'
    WHERE id_aula = 1;

UPDATE aula
    SET data_aula = '2021-02-06'
    WHERE id_aula = 2;

UPDATE aula
  set horario = '07:30:00'
  WHERE id_turma in(
      select id_turma
      FROM turma
      WHERE nivel = 'Iniciante');

UPDATE avaliacao
    SET pontos = 15.0
    WHERE id_avaliacao = 1;

UPDATE avaliacao
    SET data_avaliacao = '2022-03-15'
    WHERE id_avaliacao = 2;

UPDATE avaliacao
    set pontos = 17.0
    where id_turma in(
        select id_turma
        from turma
        where id_curso = 1);

update aluno
set nome = 'Valéria Ribeiro Lima da Costa'
where id_aluno = 3;

update aluno
set nome = 'Cassia de Alberto Oliveira Martins'
where id_aluno = 4;

update aluno
set sexo = 'O'
where id_aluno in (
    select distinct id_aluno
        from aluno_material
        where foi_recebido = true);

update turma
set sala = 205
where id_turma = 1;

update turma
set sala = '301'
where sala = '202';

update turma
set nivel = 'Avançado'
where id_professor in (
    select id_professor
        from professor
        where sexo = 'M');

UPDATE matricula
    SET data_matricula = '2023-10-20'
    WHERE id_matricula = 2;

UPDATE matricula
    SET valor_total = 3200.32
    WHERE id_aluno = 10;

UPDATE matricula
  SET nro_parcelas = '6', valor_total = (valor_total-200)
  WHERE id_turma in(
      select id_turma
      FROM turma
      WHERE nivel = 'Avançado');

UPDATE pagamento
    SET valor = 400.00
    WHERE matricula_id_turma = 5;

UPDATE pagamento
    SET data_pagamento = '2021-07-05'
    WHERE id_matricula = 13;

UPDATE pagamento
  SET valor = (valor*1.20)
  WHERE matricula_id_turma in(
      select id_turma
      FROM aula
      WHERE data_aula between '2021-01-01' and '2021-03-01');

/* altera o valor do pagamento para o valor da parcela, localizado na tabela de matricula
 * levando em conta o valor total dividido pelo nro de parcelas */
update pagamento
set valor = (
select m.valor_total/m.nro_parcelas
    from matricula m join pagamento p
        on m.id_matricula = p.id_matricula
        and m.id_turma = p.matricula_id_turma
    where id_pagamento = 1
)
where id_pagamento = 1;

/* altera o salario do professor que dá aula para a turma 10 para 2000 mais bonificação igual
 * a soma do valor total pago pelos alunos matriculados dividido pelos 12 meses */
update professor
set salario = 2000+(
select sum(m.valor_total)/12
    from matricula m
    where m.id_turma = 10)
where id_professor = (
select id_professor
    from turma
    where id_turma = 10)

/* altera a nota dos alunos que fizeram a avaliacao 3 para 60% da nota total */
update aluno_avaliacao
set nota_aluno = (
select pontos
    from avaliacao a
    where id_avaliacao = 3)*0.6
where id_avaliacao = 3
