/*
 * ================================================================================
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
 *         Author:  Abimael Martinez Carrete 
 *
 * =================================================================================
 */


#include	<stdio.h>

int main(){
	 
	printf ( "%-8.1f %-8.1f %-8.1f \n", 3.0, 12.5, 523.3 ); 
	printf ( "%-8.1f %-8.1f %-8.1f \n", 233.0, 1382.5, 53.390 ); 
	return 0;
}



/*-----------------------------------------------------------------------------
 *  Entrada y Salida de Datos
 *-----------------------------------------------------------------------------
 * 
 *  El lenguaje C tiene una coleccion de funciones de biblioteca que incluye
 *  funciones de entrada y salida. Estas funciones son:
 *   
 *  	getchar()
 *  	putchar()
 *  	scanf()
 *  	printf()
 *  	gets()
 *  	puts()
 *  
 *  Estas funciones permiten la transferencia de información entre la computadora
 *  y los dispositivos de entrada-salida estandar. Por ejemplo: un teclado y un
 *  monitor.
 *
 *  Las funciones getchar() y putchar() permiten la transferencia de caracteres
 *  individuales hacia adentro y hacia afuera de la computadora, scanf() y
 *  printf() permiten la transferencia de caracteres individuales, valores
 *  numericos y cadenas de caracteres, gets() y puts() permiten la entrada y 
 *  salida de cadenas de caracteres.
 *
 *
 *  Un especificador de campo ( %2d ) controla el espacio cuando es impreso.
 *-----------------------------------------------------------------------------*/
