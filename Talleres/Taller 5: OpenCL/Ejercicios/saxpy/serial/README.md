### Operacion SAXPY

Para compilar, dirigase a la carpeta donde se encuentra el archivo "saxpy_ser.c" e introduzca el siguiente comando:

    $ gcc -o saxpy saxpy_ser.c

Posteriormente, puede ejecutar el programa mediante el siguiente comando:

    $ ./saxpy n a

Donde 'n' es la cantidad de elementos dentro de los arreglos, mientras que 'a' es el multiplicador en la operación saxpy.

Algunos ejemplos que se utilizaron como prueba:

    $ ./saxpy 100 5
    $ ./saxpy 1000 12
