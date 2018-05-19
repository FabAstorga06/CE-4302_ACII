#include <cuda.h>
#include <stdio.h>

#define N 10 // Tamaño de la matriz

/************************************************************************/

// Imprime las matrices
void print_mat(float mat[N][N] ) {
    for(int i = 0; i < N; i++){
        for (int j = 0; j < N; j++){
            printf ("%f \t", mat[i][j]);
        }
        printf ("\n");
    }
    printf ("\n\n");    
}

// Suma matrices
void cpu_add(float A[N][N], float B[N][N], float C[N][N] ) {
    for (int i = 0; i < N; i++){
        for (int j = 0; j < N; j++){
            C[i][j] = A[i][j] + B[i][j];
        }
    }
}

// Kernel
__global__ void add_mtx(float A[N][N], float B[N][N], float C[N][N]) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    C[i][j] = A[i][j] + B[i][j];
}

/************************************************************************/

int main() {

    float A [N][N], B [N][N], C [N][N]; 
    for (int i = 0; i < N; i++){
        for (int j = 0; j < N; j++){
            A [i][j] = i * N + j;
            B [i][j] = j * N + i;
        }
    }

    clock_t start_h = clock();
    cpu_add (A, B, C);
    clock_t end_h = clock();

    clock_t start_d = clock();
    // Kernel
    dim3 threads_block(16, 16); // Hilos y bloques
    dim3 num_blocks(N / threads_block.x, N / threads_block.y);
    add_mtx<<<num_blocks, threads_block>>>(A, B, C);
    clock_t end_d = clock();

    //Comparacion de tiempos 
    double time_d = (double)(end_d-start_d)/CLOCKS_PER_SEC;
    double time_h = (double)(end_h-start_h)/CLOCKS_PER_SEC;
    printf("Tiempo de GPU = %fs \t Tiempo de CPU = %fs\n", time_d, time_h);

}
