
INSERT INTO curso(id_curso,nome) VALUES
	(default, 'Libras'),
	(default, 'Indodésio');

INSERT INTO material(id_curso, nome_material, descricao) VALUES
	(11, 'Apostila de Libras', 'Livro para estudo guiado de Libras'),
	(12, 'Apostila de Indodésio', 'Livro para estudo guiado de Indonésio');

INSERT INTO endereco(id_endereco,cep, cidade, estado, bairro, logradouro, numero, complemento) VALUES
	(default, '38475-000', 'Monte Alegre de Minas', 'MG', 'Centro', 'Avenida 16 de Setembro', 365, NULL),
	(default, '38475-000', 'Monte Alegre de Minas', 'MG', 'Centro', 'Arthur Bernardes', 475, NULL);

INSERT INTO professor(id_professor, id_curso, id_endereco, cpf, nome, salario, sexo, especialidade) VALUES
	(default, 11,11, '775.342.296-88', 'Marcos Oliveira de Andrade', 1850.50, 'M', 'Libras'),
	(default, 12,12, '389.558.137- 09', 'Bruna Tavares Vieira', 1725.00, 'F', 'Indonésio');

INSERT INTO turma(id_turma, id_curso, id_professor, nivel, sala) VALUES
	(default, 11, 11, 'Iniciante', '1008'),
	(default, 12, 12, 'Iniciante', '1007');

INSERT INTO aula(id_aula, id_turma, nome, data_aula, horario) VALUES
	(default, 11, null, '2022-03-19', '07:00:00'),
	(default, 12, null, '2022-03-19', '08:50:00');

INSERT INTO aluno(id_aluno, id_endereco, cpf, nome, sexo) VALUES
	(default, 11, '145.457.789-45', 'Carlos de Almeida', 'M'),
	(default, 12, '487.457.145-98', 'Fabiane Catia de Oliveira', 'F');

INSERT INTO matricula(id_matricula,id_turma,id_aluno, numero, data_matricula, valor_total, nro_parcelas) VALUES
	(default, 11, 11, 21, '2020-07-07', 1450.98, 10),
 	(default, 12, 12, 22, '2020-04-27', 1290.54, 10);

INSERT INTO pagamento(id_pagamento,matricula_id_turma,id_matricula, valor, data_pagamento) VALUES
	(default, 11, 21, 800.00, '2022-03-18'),
	(default, 12, 22, 800.00, '2022-03-17');

INSERT INTO outros_funcionarios(id_funcionario, id_endereco, cpf, nome, sexo, salario, cargo) VALUES
	(default, 11, '751.289.162-78', 'Daniel Silva Lisboa', 'M', default, 'Faxineiro'),
	(default, 12, '852.371.591-68', 'Leonora Carvalho Borges ', 'F', default, 'Faxineira');

INSERT INTO avaliacao(id_avaliacao, id_turma, pontos, data_avaliacao) VALUES
	(default, 11, 10.0, '2022-03-19'),
	(default, 12, 10.0, '2022-03-19');

INSERT INTO aluno_material(id_aluno, nome_material, material_id_curso, foi_recebido) VALUES
	(11, 'Apostila de Libras', 11, True),
	(12, 'Apostila de Indodésio', 12, True);

INSERT INTO aluno_avaliacao(id_aluno, id_avaliacao, nota_aluno) VALUES
	(11, 11, 8.5),
	(12, 12, 4.7);

INSERT INTO aluno_aula (id_aluno, id_aula) VALUES
	(11, 11),
	(12, 12);
