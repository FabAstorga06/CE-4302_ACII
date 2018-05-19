#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#ifdef __APPLE__
#include <OpenCL/opencl.h>
#else
#include <CL/cl.h>
#endif
#define MEM_SIZE (128)
#define MAX_SOURCE_SIZE (0x100000)
#define SIZE 4

int *mtx_a, *mtx_b, *mtx_res;

/******************************************************************/

void init_matrix() {
  mtx_a = (int*) malloc(sizeof(int) * (SIZE*SIZE) );
  mtx_b = (int*) malloc(sizeof(int) * (SIZE*SIZE) );
  mtx_res = (int*) malloc(sizeof(int) * (SIZE*SIZE) );
  const double a = 20.0;
 
  for(int i = 0; i < SIZE; ++i) {
        for(int j = 0; j < SIZE ; ++j) {
            *(mtx_a + i*SIZE + j) = (int)rand() /(int)(RAND_MAX/a);
            *(mtx_b + i*SIZE + j) = (int)rand() /(int)(RAND_MAX/a);
        }
   }
}
void print_matrix(int* matrix ) {
 printf("----------\n");
 for(int i = 0; i < SIZE; i++) {
        for(int j=0;j < SIZE; j++) {   
            printf("%d ",(matrix[i*SIZE + j]));
            printf("|");
 
        }
        printf("\n----------\n");
    }
    printf("\n");
}

/******************************************************************/

int main(int argc, char** argv )  {

   init_matrix();
   print_matrix(mtx_a);
   print_matrix(mtx_b);

  cl_device_id device_id = NULL;
  cl_platform_id platform_id = NULL;
  cl_uint ret_num_devices;
  cl_uint ret_num_platforms;
  
  FILE *fp;
  char *source_str;
  size_t source_size;

  fp = fopen("mult_kernel.cl", "r");
  if (!fp) {
    fprintf(stderr, "Fallo al cargar kernel...\n");
    exit(1);
  }
  source_str = (char*)malloc(MAX_SOURCE_SIZE);
  source_size = fread( source_str, 1, MAX_SOURCE_SIZE, fp);
  fclose( fp );
 
  cl_int ret = clGetPlatformIDs(1, &platform_id, &ret_num_platforms);
  ret = clGetDeviceIDs( platform_id, CL_DEVICE_TYPE_CPU, 1, &device_id, &ret_num_devices);
 
  cl_context context = clCreateContext( NULL, 1, &device_id, NULL, NULL, &ret);
 
  cl_command_queue command_queue = clCreateCommandQueue(context, device_id, 0, &ret);
 
  cl_mem buffer_mtx_a = clCreateBuffer(context, CL_MEM_READ_ONLY, SIZE * SIZE * sizeof(int), NULL, &ret);
  cl_mem buffer_mtx_b = clCreateBuffer(context, CL_MEM_READ_ONLY, SIZE * SIZE * sizeof(int), NULL, &ret);
  cl_mem buffer_mtx_res = clCreateBuffer(context, CL_MEM_WRITE_ONLY, SIZE * SIZE * sizeof(int), NULL, &ret);
 
  ret = clEnqueueWriteBuffer(command_queue,buffer_mtx_a, CL_TRUE, 0, SIZE * SIZE * sizeof(int), mtx_a, 0, NULL, NULL);
  ret = clEnqueueWriteBuffer(command_queue, buffer_mtx_b, CL_TRUE, 0, SIZE * SIZE * sizeof(int), mtx_b, 0, NULL, NULL);
 
  cl_program program = clCreateProgramWithSource(context, 1, (const char **)(&source_str),
                                      (const size_t *)(&source_size), &ret);
 
  ret = clBuildProgram(program, 1, &device_id, NULL, NULL, NULL);
 
  cl_kernel kernel = clCreateKernel(program, "matrix_mult", &ret);

  // Set the arguments of the kernel
  ret = clSetKernelArg(kernel, 0, sizeof(cl_mem), (void *)&buffer_mtx_a);
  ret = clSetKernelArg(kernel, 1, sizeof(cl_mem), (void *)&buffer_mtx_b);
  ret = clSetKernelArg(kernel, 2, sizeof(cl_mem), (void *)&buffer_mtx_res);

  size_t globalSize[2] = {SIZE, SIZE};
  size_t localSize[2] = {1,1};
  clock_t start_time = clock();
  ret = clEnqueueNDRangeKernel(command_queue, kernel, 2, NULL, globalSize, localSize, 0, NULL, NULL);
  ret = clEnqueueReadBuffer(command_queue, buffer_mtx_res, CL_TRUE, 0,
                            SIZE * SIZE * sizeof(int), mtx_res, 0, NULL, NULL);

  double result = (double)(clock() - start_time) / 1000;
  printf("\n Resultado AxB = C \n");
  print_matrix(mtx_res);
  printf("Tiempo de ejecucion: %f segundos\n", result);
   
  ret = clFlush(command_queue);
  ret = clFinish(command_queue);
  ret = clReleaseKernel(kernel);
  ret = clReleaseProgram(program);
  ret = clReleaseMemObject(buffer_mtx_a);
  ret = clReleaseMemObject(buffer_mtx_b);
  ret = clReleaseMemObject(buffer_mtx_res);
  ret = clReleaseCommandQueue(command_queue);
  ret = clReleaseContext(context);
  free(mtx_a);
  free(mtx_b);
  free(mtx_res);
  free(source_str);
  return 0;
}










