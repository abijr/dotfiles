/*
 * =====================================================================================
 *
 *       Filename:  doce.c
 *
 *    Description:  Ejemplos de captura de datos.
 *
 *        Version:  1.0
 *        Created:  08/23/2011 07:16:10 AM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Abimael Martinez Carrete (), 
 *
 * =====================================================================================
 */



#include	<stdio.h>

int main(){
	long x,y;

	printf ( "Entre dos numeros que quiera multiplicar:\n" );
	 
	scanf ( "%ld %ld", &x, &y );
	 
	printf ( "El resultado de la multiplicación entre %ld y %ld es: %ld\n", x, y, x * y );


	return 0;
	
}
