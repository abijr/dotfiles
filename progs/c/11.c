/*
 * =====================================================================================
 *
 *       Filename:  once.c
 *
 *    Description:  lee un numero entero y lo eleva al cuadrado
 *
 *        Version:  1.0
 *        Created:  08/19/2011 08:36:34 AM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Abimael Martinez Carrete (), 
 *
 * =====================================================================================
 */


#include	<stdio.h>

int main(){
	int numero;
	int cuadrado;

	printf ( "Introdusca un numero:" );
	scanf ( "%d", &numero );

	cuadrado = numero * numero;

	printf ( "El cuadrado de %d es %d\n", numero, cuadrado );

	return 0;

}
