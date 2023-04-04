
delete from vinicola 
	where id_vinicola = 10; 
/* não irá deletar, id_vinicola 
 	com on delete no action
	referenciado em vinho */

delete from vinho 
	where id_vinho = 3;
/* delete executado, elemento da linha
	onde id_vinho = 3 será eliminado */