update vinho 
	set ano_vinho = 2003
	where ano_vinho = 2005 ;
/* altera os vinhos cadastrados com 
	ano_vinho = 2005 para ano_vinho =2003 
	(não há na tabela, nada mudará ) */

update vinho 
	set ano_vinho = 2010
	where ano_vinho = 2008; 
/* altera todos os ano_vinho de 2008 para 2010 */

update vinho 
	set ano_vinho = 2020
	where ano_vinho = 2010 
	and tipo_vinho = 'branco';
/* altera todos os vinhos cujo ano = 2010
 	e o tipo = 'branco' para que o ano seja 2020 */