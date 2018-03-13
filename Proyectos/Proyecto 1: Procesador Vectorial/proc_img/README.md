# Procesador imagenes con OpenCV

Agrega escala de grises a una imagen con la biblioteca OpenCV en C y encripta mediante uno de los cuatro algoritmos disponibles. 

### Compilacion
Para compilar el código, primero debe instalar OpenCV. Posteriormente dirígase a la carpeta donde se encuentra el archivo Makefile y ejecute el siguiente comando: 
* $ make

### Ejecución
Para ejecutar el código, corra el ejecutable que se generó en la carpeta donde se encuentran los archivos, mediante el siguiente comando: 
* $ ./img vegeta.jpg n porcentaje1 porcentaje2


donde n es un numero entero del 1 al 4 el cual representa el algoritmo de encriptación que desee utilizar según la siguiente convención:
1 -> Algoritmo XOR 
2 -> Desplazamiento simple
3 -> Desplazamiento circular
4 -> Suma simple

Los otros parametros corresponden a los porcentajes de procesamiento por el procesador propio de la FPGA (porcentaje1), mientras que el otro es el porcentaje procesado por el procesador vectorial realizado en Verilog, el cual se encuentra en la carpeta [proc_vect](https://github.com/FabAstorga06/CE-4302_ACII/tree/master/Proyectos/Proyecto%201:%20Procesador%20Vectorial/proc_vect). 

### Ejemplo de uso 
* $ ./img vegeta.jpg 3 70 30

Al ejecutarse el comando anterior, la imagen se cambiará a escala de grises, se encriptará mediante el algoritmo de desplazamiento circular con un 70% procesado por el CPU de la FPGA y 30% procesado por el procesador vectorial implementado.