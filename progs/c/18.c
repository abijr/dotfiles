/*
 *
 *       Filename:  18.c
 *
 *    Description:  Calificaciones
 *         Author:  Abimael Martinez Carrete (), 
 *
 */


#include	<stdio.h>

int main(){
	float califa;
	char c;


	do{
	printf ( "Escriba la calificacion\n" );
	scanf ( "%f", &califa );

	
	if ( califa > 10 )
		printf ( "El numero no es una calificación\n");
	else if (califa >= 9 )
		printf ( "Es una A\n" );
	else if ( califa >= 8 && !(califa >= 9))
		printf ( "Es una B\n" );
	else if ( califa >= 7 && !(califa >= 8))
		printf ( "Es una C\n" );
	else
		printf ( "NA\n" );
	

	getchar();
	printf ( "Quiere salir? (s/n):" );
	scanf ( "%c", &c );
	}
	while ( c != 's' );
	

	return 0;
}
