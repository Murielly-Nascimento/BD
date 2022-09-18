DELETE FROM curso
WHERE id_curso = 11;

DELETE FROM curso
WHERE id_curso = 12;

DELETE FROM material
WHERE id_curso = 11;

DELETE FROM material
WHERE id_curso = 12;

DELETE FROM endereco
WHERE id_endereco = 11;

DELETE from endereco
WHERE id_endereco = 12;

DELETE from professor
WHERE cpf = '775.342.296-88';

DELETE FROM professor
WHERE nome = 'Bruna Tavares Vieira';

DELETE from outros_funcionarios
WHERE id_funcionario = 11;

DELETE from outros_funcionarios
WHERE id_funcionario = 12;

DELETE FROM aula
WHERE id_aula = 11;

DELETE FROM aula
WHERE id_aula = 12;

DELETE FROM aluno
WHERE id_aluno = 11;

DELETE FROM aluno
WHERE id_aluno = 12;

DELETE FROM turma
WHERE id_turma = 11;

DELETE FROM turma
WHERE id_turma = 12;

DELETE FROM matricula
WHERE id_matricula = 21;

DELETE FROM matricula
WHERE id_matricula = 22;

DELETE FROM pagamento
WHERE id_pagamento = 21;

DELETE FROM pagamento
WHERE id_pagamento = 22;

DELETE FROM aluno_aula
WHERE id_aluno = 11 AND id_aula = 11;

DELETE FROM aluno_aula
WHERE id_aluno = 12 AND id_aula = 12;

DELETE FROM aluno_avaliacao
WHERE id_aluno = 11 AND id_avaliacao = 11;

DELETE FROM aluno_avaliacao
WHERE id_aluno = 12 AND id_avaliacao = 12;

DELETE FROM aluno_material
WHERE id_aluno = 11 AND material_id_curso = 11;

DELETE FROM aluno_material
WHERE id_aluno = 12 AND material_id_curso = 12;

DELETE FROM avaliacao
WHERE id_avaliacao = 21;

DELETE FROM avaliacao
WHERE id_avaliacao = 22;
