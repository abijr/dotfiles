/*
 *       Filename:  22.c
 *    Description:  menu cafeteria
 *         Author:  Abimael Martinez Carrete
 */


#include	<stdio.h>
#include	<string.h>

 
int main ()
{
	int op;
	gotoxy(25,2);
	printf ( "MENU\n" );
	printf ( "1: Desayuno\n" );
	printf ( "2: Comida\n" );
	printf ( "3: Cena\n" );
	scanf ( "%d", &op );
	
	switch ( op ) {
		case 1:	
			printf ( "Todos los desayunos incluyen jugo o leche\n" );
			printf ( "Huevos rancheros ... $25\n" );
			printf ( "Hot Cakes        ... $28\n" );
			break;

		case 2:	
			printf ( "Todos las comidas incluyen un refresco\n" );
			printf ( "Hamburgesa con papas ...  $30\n" );
			printf ( "Hot Dog              ...  $20\n" );
			printf ( "\n" );
			break;

		case 3:	
			printf ( "Todas las cenas incluyen jugo o leche\n" );
			printf ( "Moyetes       ..... $23\n" );
			printf ( "\n" );
			break;

		default:	
			printf ( "error: brain not found...\n" );
			break;
	}				/* -----  end switch  ----- */

	return 0;

}
