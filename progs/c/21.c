/*
 *       Filename:  21.c
 *    Description:  switch
 *         Author:  Abimael Martinez Carrete (), 
 */

#include	<stdio.h>

int main ()
{
	char letra;
	printf ( "r = rojo, v = verde, a = azul\n" );
	scanf ( "%c", &letra );
	
	switch ( letra ) {
		case 'r':	
		case 'R':	
			printf ( "rojo\n" );
			break;

		case 'v':	
			printf ( "verde\n" );
			break;

		case 'a':	
			printf ( "azul\n" );
			break;

		default:	
			printf ( "error: brain not found...\n" );
			break;
	}				/* -----  end switch  ----- */

	return 0;
}
