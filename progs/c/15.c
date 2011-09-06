/*
 *
 *       Filename:  15.c
 *
 *    Description:  Funciones Biblioteca
 *         Author:  Abimael Martinez Carrete (), 
 *
 */



#include	<stdio.h>
#include	<math.h>

int main()
{
	int x = 4,
		y;

	y = pow(x, 2);
	printf ( "x = %d, y = %d\n", x, y );
	 
	y = sqrt(x);
	printf ( "x = %d, y = %d\n", x, y );

	return 0;
}
