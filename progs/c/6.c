/*
 * =====================================================================================
 *
 *       Filename:  seis.c
 *					y siete...
 *    Description:  division flotante y entera
 *
 *        Version:  1.0
 *        Created:  08/18/2011 07:17:41 AM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Abimael Martinez Carrete (), 
 *
 * =====================================================================================
 */


/*-----------------------------------------------------------------------------
 *  CONSTANTES DE CARACTER
 *  Una constante de caracter es de un solo caracter encerrado en comillas simples
 *
 *  declaración: char letra = 'A';
 *  			 char op    = 'y';
 *-----------------------------------------------------------------------------*/

#include	<stdio.h>
int main(){
//	float div;
	int a = 5,
		b = 3;

	float c = 3.0;

	printf ( "Division enteros %f\n", (float) a/b );
	printf ( "Division enteros y flotantes %f\n", a/c );

	return 0;
}
