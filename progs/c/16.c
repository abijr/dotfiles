/*
 *
 *       Filename:  16.c
 *
 *    Description:  par/impar
 *         Author:  Abimael Martinez Carrete (), 
 *
 */



#include	<stdio.h>

int main(){
	int r, x;

	printf ( "Escriba un numero:\n" );
	scanf ( "%d", &x );
	printf ( "El numero %d es: ", x );
	r = x % 2;
	if ( r == 1 ) 
		printf ( " impar\n" );
	else 
		printf ( " par\n" );
	 
	 
	return 0;
}
