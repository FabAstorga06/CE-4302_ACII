### Mutiplicación de dos matrices 4x4 con OpenCL

Para compilar, dirigase a la carpeta donde se encuentra el archivo "matrix_mult.c" e introduzca el siguiente comando:

    $ gcc -o mtx_mult matrix_mult.c -I/opt/AMDAPPSDK-3.0/include/ -L/opt/AMDAPPSDK-3.0/lib/x86_64/sdk -lamdocl64

Posteriormente, puede ejecutar el programa mediante los siguientes comandos:

    $  export LD_LIBRARY_PATH=/opt/AMDAPPSDK-3.0/lib/x86_64/sdk
    $ ./mtx_mult

