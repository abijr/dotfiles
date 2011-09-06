/*
 *
 *       Filename:  19.c
 *
 *    Description:  Mayor y menor 
 *
 *         Author:  Abimael Martinez Carrete (), 
 *
 */



#include	<stdio.h>

int main(){
	int a,b,c;
	int min, max;
	printf ( "Ingrese 3 numeros:\n" );
	scanf ( "%d %d %d", &a, &b, &c );

	min = a;
	max = b;
	
	if ( min > b ) {
		min = b;
		max = a;
	} 
	if ( min > c) {
		min = c;
	}
	if ( max < c ) {
		max = c;
	}


	printf ( "El numero mayor es: %d\n", max );
	printf ( "El numero menor es: %d\n", min );

	return 0;
}
