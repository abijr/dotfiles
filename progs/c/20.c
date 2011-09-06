/*
 *       Filename:  20.c
 *    Description:  Obtener las raices de una ecuacion de 2do grado
 *         Author:  Abimael Martinez Carrete (), 
 */


#include	<stdio.h>
#include	<math.h>

int main ()
{
	int a, b, c;
	float raiz, resultado1, resultado2;
	 
	printf ( "Ingrese los valores de los coeficientes:\n" );
	printf ( "a:" );
	scanf ( "%d", &a );
	printf ( "b:" );
	scanf ( "%d", &b );
	printf ( "c:" );
	scanf ( "%d", &c );

	raiz = (b * b) - ( 4 * a * c ) ;
	printf ( "b^2 - 4ac = %.2f\n", raiz );
	if ( raiz > 0 ){
		raiz = sqrt( raiz );
		resultado1 = (-1 * b + raiz) / (2 * a);
		resultado2 = (-1 * b - raiz) / (2 * a);
		printf ( "Los resultados son: %.2f y %.2f\n", resultado1, resultado2 );
	} else {
		raiz *= -1;
		raiz = sqrt( raiz );
		printf ( "Los resultados imaginarios imaginarios son: %.1f ± %.1fi .\n", 
				(float) -b / (2 * a) , 
				(float) raiz / (2 * a) 
				);
	}
	


	return 0;
}
