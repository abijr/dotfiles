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
	int evento = 5;
	char carrera = 'c';
	float tiempo = 25.7;

	printf ( "El tiempo ganador de la carrera %c, del evento %d, fue %.2f\n", carrera, evento, tiempo );

	return 0;
}
