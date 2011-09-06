/*
 *
 *       Filename:  23.c
 *    Description:  Nomina
 *         Author:  Abimael Martinez Carrete
 *
 */


#include	<stdio.h>

int main () 
{
	int   codigo = 0
		, piezas = 0
		, horas  = 0
			;
	 
	float   sueldo = 0 
		  , sueldo_extras = 0 
		  , comision = 0 
		  , ventas = 0
			  ;
	 
	char continuar;

	while ( 1 ) {

		printf ( "Este es un programa de nomina, entre el codigo de nomina:\n" );
		printf ( "1: Gerente \t\t 2: Trabajador horario\n" );
		printf ( "3: Trabajador comision \t 4: Trabajador a destajo\n" );
		printf ( "Codigo: " );
		scanf ( "%d", &codigo );

		switch ( codigo ) {
			case 1:	
				printf ( "Ha solicitado la nomina del gerente\n" );
				printf ( "Ingrese el sueldo: " );
				scanf ( "%f", &sueldo );
				printf ( "Total a pagar es: %.2f\n", sueldo );
				break;

			case 2:	
				printf ( "Ha solicitado la nomina del trabajador horario\n" );
				printf ( "Ingrese el sueldo horario: " );
				scanf ( "%f", &sueldo );
				printf ( "Ingrese las horas trabajadas: " );
				scanf ( "%d", &horas );
				sueldo_extras = (horas > 40) ? sueldo * 1.5 : sueldo;
				printf ( "Total a pagar es: %.2f\n", (float) sueldo * 40 + sueldo_extras * ( horas - 40 ) );
				break;

			case 3:	
				printf ( "Ha solicitado la nomina del Trabajador a comision\n" );
				printf ( "Ingrese el monto de ventas semanal: " );
				scanf ( "%f", &ventas );
				printf ( "Total a pagar es: %.2f\n", (float) 250 + .057 * ventas );
				break;

			case 4:	
				printf ( "Ha solicitado la nomina del Trabajador a destajo\n" );
				printf ( "Ingrese el numero de piezas completadas por el empleado: " );
				scanf ( "%d", &piezas );
				printf ( "Ingrese la comision por pieza: " );
				scanf ( "%f", &comision );
				printf ( "Total a pagar es: %.2f\n", (float) comision * piezas );
				break;
				 
			default:	
				printf ( "Codigo desconocido, \n" );
				break;
		}				/* -----  termina el switch  ----- */
		 
		getchar();
		printf ( "Desea continuar? (s/n): " );
		scanf ( "%c", &continuar );
		if ( continuar == 'n' )
			break;
		

	}

	 
	return 0;
}
