/*
 *       Filename:  13.c
 *
 *    Description:  calcula el area de un triangulo.
 *         Author:  Abimael Martinez Carrete
 */

#include	<stdio.h>

int main(){
	int base;
	int altura;

	printf ( "Introdusca la altura del triangulo:\n" );
	scanf ( "%d", &altura );

	printf ( "Introdusca la base del triangulo:\n" );
	scanf ( "%d", &base );

	printf ( "El área del triangulo es: %.1f\n", (float)(base*altura)/2 );

	return 0;
}
