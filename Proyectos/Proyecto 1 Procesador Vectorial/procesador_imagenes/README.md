# Procesador imagenes con OpenCV

Agrega escala de grises a una imagen con la biblioteca OpenCV en C y encripta mediante uno de los cuatro algoritmos disponibles. 

### Compilación
Para compilar el código, primero debe instalar OpenCV. Posteriormente dirígase a la carpeta donde se encuentra el archivo Makefile y ejecute el siguiente comando: 
* $ make

### Ejecución
Para ejecutar el código, corra el ejecutable que se generó en la carpeta donde se encuentran los archivos, mediante el siguiente comando: 
* $ ./img imgs/vegeta.jpg n 


donde n es un numero entero del 1 al 4 el cual representa el algoritmo de encriptación que desee utilizar según la siguiente convención:
* 1 -> Algoritmo XOR 
* 2 -> Desplazamiento simple
* 3 -> Desplazamiento circular
* 4 -> Suma simple

El procesador vectorial realizado en Verilog, el cual se encuentra en la carpeta [proc_vect](https://github.com/FabAstorga06/CE-4302_ACII/tree/master/Proyectos/Proyecto%201:%20Procesador%20Vectorial/proc_vect), será el encargado de encriptar la imagen en escala de grises. 

### Ejemplo de uso 
* $ ./img imgs/vegeta.jpg 3 

Al ejecutarse el comando anterior, la imagen se cambiará a escala de grises, se encriptará mediante el algoritmo de desplazamiento circular y se encriptará mediante el procesador vectorial diseñado en lenguaje de descripción de hardware.

### Otros ejemplos 

* $ ./img imgs/pl.jpeg 1 
* $ ./img imgs/hh.png 4 