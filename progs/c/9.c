/*
 * =====================================================================================
 *
 *       Filename:  ocho.c
 *
 *    Description:  Tipos de Datos
 *
 *        Version:  1.0
 *        Created:  08/18/2011 07:46:47 AM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Abimael Martinez Carrete (), 
 *
 * =====================================================================================
 */


#include	<stdio.h>

int main(){
	 
	float f = 120.0;
	float c = (f - 32) * 5 / 9;
	 
	printf ( "%.2f grados fahrenheit son %5.2f grados Centigrados.\n", f, c );
	 
	return 0;
}



/*-----------------------------------------------------------------------------
 *  Entrada y Salida de Datos
 *  El lenguaje C tiene una coleccion de funciones de biblioteca que incluye
 *  funciones de entrada y salida. Estas funciones son:
 *  	getchar()
 *  	putchar()
 *  	scanf()
 *  	printf()
 *  	gets()
 *  	puts()
 *-----------------------------------------------------------------------------*/
