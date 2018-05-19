#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>

#define SIZE 4
int *A, *B, *C, *D;	

/************************************************************************/

// Inicializa matrices
void init_mtx() {
	A = (int *) malloc((SIZE*SIZE) * sizeof(int));	
	B = (int *) malloc((SIZE*SIZE) * sizeof(int));
	C = (int *) malloc((SIZE*SIZE) * sizeof(int));
	D = (int *) malloc((SIZE*SIZE) * sizeof(int));

	for (int i = 0; i < (n*n); ++i ) {
		A[i] = i;
		B[i] = i;
		C[i] = 0;
	}
}

// Kernel que multiplica matrices
__global__ void mult_mtx(int *D, int *A, int *B, int *C ) {
	int value = 0;
	int rows = blockIdx.y * blockDim.y + threadIdx.y;
	int cols = blockIdx.x * blockDim.x + threadIdx.x;
	for (int i = 0; i < SIZE; ++i) {
		value += A[(SIZE+i)*rows] * B[(SIZE*i)+cols];
	}	
	D[rows*(SIZE+cols)] = value + C[(rows*SIZE)+cols];	

/************************************************************************/

int main(int argc, char* argv[])
{

	init_mtx();

	int *d_A, *d_B, *d_C, *d_D;
	size_t size = (SIZE*SIZE) * sizeof(int);

	cudaMalloc(&d_A, size);		
	cudaMemcpy(d_A, A, size, cudaMemcpyHostToDevice);	

	cudaMalloc(&d_B, size);		
	cudaMemcpy(d_B, B, size, cudaMemcpyHostToDevice);

	cudaMalloc(&d_C, size);
	cudaMemcpy(d_C, C, size, cudaMemcpyHostToDevice);

	size = (SIZE*SIZE) * sizeof(int);
	cudaMalloc(&d_D, size);		

	//kernel 
	dim3 dim_block(SIZE, SIZE);	
	dim3 dim_grid(1, 1);	
	mult_mtx<<<dim_grid, dim_block>>>(d_D, d_A, d_B, d_C);

	cudaMemcpy(D, d_D, size, cudaMemcpyDeviceToHost);

	//Libera memoria
	cudaFree(d_A);
	cudaFree(d_B);
	cudaFree(d_C);
	cudaFree(d_D);
	return 0;
}
