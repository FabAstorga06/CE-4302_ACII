#include <unistd.h>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

unsigned int size;
double alpha;
double *x, *b, *y;

/******************************************************************/

void saxpy() {
for (int i = 0; i < size; ++i) {
    	y[i] = (x[i] * alpha) + b[i];
    }
}

void random_arr(double* arr ) {
  const double a = 5.0;
  for(int i = 0; i < size; i++)
    arr[i] = (double)rand() /(double)(RAND_MAX/a);
}

void init_data() {
    x = (double*) malloc(sizeof(double) * size);
    b = (double*) malloc(sizeof(double) * size);
    y = (double*) malloc(sizeof(double) * size); 

    random_arr(x);
    random_arr(b);
}

void print_result() {
    for(int i = 0; i < size; i++) 
        printf("%f * %f + %f = %f\n", x[i], alpha, b[i], y[i]);
    
}

/******************************************************************/

int main(int argc, char** argv)  {

    size = atoi(argv[1]);
    alpha = atol(argv[2]);
    init_data();

    clock_t start_time = clock();
    saxpy();
    double result = (double)(clock() - start_time) / 1000;

    print_result();
    printf( "Tiempo de ejecucion: %f segundos\n", result);

    free(x);
    free(b);
    free(y);
    return 0;
}


