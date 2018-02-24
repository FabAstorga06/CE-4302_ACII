###Aproximacion de 'e' elevado a un numero.


Para compilar, dirigase a la carpeta donde se encuentra el archivo "e_aprox.c" e introduzca el siguiente comando:

- $ gcc -o e -fopenmp e_aprox.c -lm 

Posteriormente, puede ejecutar el programa mediante el siguiente comando:

- $ ./e N X

Donde N se refiere a la cantidad de iteraciones para el calculo de la operacion y X el número para elevar 'e'.

Algunos ejemplos: 

- $ ./e 50 3.1423
- $ ./e N 125 45.700
- $ ./e N 250 10.9694
