
#include	<stdio.h>

int main(){

	int num1, num2, num3;
	 
	 
	printf ( "Escriba un numero:\n" );
	scanf ( "%d", &num1 );
	 
	printf ( "Escriba un numero:\n" );
	scanf ( "%d", &num2 );
	 
	printf ( "Escriba un numero:\n" );
	scanf ( "%d", &num3 );
	
	if ( (num1 > num2) && (num1 > num3))
		printf ( "El numero %d es el más grande.\n", num1 );
	else if (( num2 > num1) && (num2 > num3 ))
		printf ( "El numero %d es el más grande.\n", num2 );
	else if ( num3 > num1 && num3 > num2 )
		printf ( "El numero %d es el más grande.\n", num3 );
	else
		printf ( "Los numeros son iguales\n" );
	
	 
	return 0;	
}	

