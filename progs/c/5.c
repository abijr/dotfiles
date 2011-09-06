/*
 * =====================================================================================
 *
 *       Filename:  cinco.c
 *
 *    Description:  Programa que calcula la edad en Dias...
 *
 *        Version:  1.0
 *        Created:  08/16/2011 08:10:19 AM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Abimael Martinez Carrete (), 
 *
 * =====================================================================================
 */

#include	<stdio.h>

int main(){

	int anios = 19;
	int meses = 11;
	int dias = 16;


	printf ( "Tienes %d dias de viejo\n", anios * 365 + meses * 30 - dias );

	return 0;
}
