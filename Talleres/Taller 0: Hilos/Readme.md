### Descripción
Aplicación en C en la que interactúan 2 hilos. El primer hilo simula un proceso de muestreo, al generar un número entero de bits aleatorio (entre 0 y 255) y almacenarlo en un arreglo cada 10 milisegundos. El segundo hilo toma los datos, uno a uno del arreglo, y aplica una operación XOR con el número 0X20 y muestra el dato como un caracter en la terminal.


### Compilación y ejecución
Para ejecutar la aplicación, dirígase a la carpeta "Taller 0: Hilos" (donde se encuentra el Makefile) por medio de la terminal y compile con make, ejecutando el siguiente comando:
- $ make

Posteriormente, debe correr el ejecutable generado por medio del siguiente comando:
- $ ./exct N

Cabe resaltar que "N" es cualquier número entero positivo, el cual pertenece a la cantidad de datos para realizar el muestreo y demás operaciones. Por lo que si quiere realizar un muestreo de 10 datos, deberá insertar el siguiente comando, por ejemplo:
- $ ./exct 10
