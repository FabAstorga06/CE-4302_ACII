### Operacion SAXPY con OpenCL

Para compilar, dirigase a la carpeta donde se encuentra el archivo "saxpy_par.c" e introduzca el siguiente comando:

    $ gcc -o saxpy_par saxpy_par.c -I/opt/AMDAPPSDK-3.0/include/ -L/opt/AMDAPPSDK-3.0/lib/x86_64/sdk-lamdocl64

Posteriormente, puede ejecutar el programa mediante los siguientes comandos:

    $  export LD_LIBRARY_PATH=/opt/AMDAPPSDK-3.0/lib/x86_64/sdk
    $ ./saxpy_par n a

Donde 'n' es la cantidad de elementos dentro de los arreglos, mientras que 'a' es el multiplicador en la operación saxpy.

Algunos ejemplos que se utilizaron como prueba:

    $ ./saxpy 100 5
    $ ./saxpy 1000 12
