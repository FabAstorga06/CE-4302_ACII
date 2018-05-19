#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifdef __APPLE__
#include <OpenCL/opencl.h>
#else
#include <CL/cl.h>
#endif
#define MAX_SOURCE_SIZE (0x100000)

double *alpha, *x, *b, *y;
unsigned int size;

/**********************************************************************/

void random_arr(double* arr ) {
  const double a = 5.0;
  for(int i = 0; i < size; ++i)
    arr[i] = (double)rand() /(double)(RAND_MAX/a);
}

void init_data() {
    x = (double*)malloc(sizeof(double) * size);
    b = (double*)malloc(sizeof(double) * size);
    y = (double*)malloc(sizeof(double) * size);
    
    random_arr(x);
    random_arr(b);
}

/**********************************************************************/

int main(int argc, char** argv ) {

    size = atoi(argv[1]);
    alpha = (double*) malloc(sizeof(double));
    *alpha = atol(argv[2]);
    init_data(size);

    // Archivo para cargar el kernel del programa
    FILE *fp;
    char *source_str;
    size_t source_size;

    // Lee el kernel
    fp = fopen("saxpy_kernel.cl", "r");
    if (!fp) {
        fprintf(stderr, "Fallo al cargar el kernel...\n");
        exit(1);
    }
    source_str = (char*)malloc(MAX_SOURCE_SIZE);
    source_size = fread( source_str, 1, MAX_SOURCE_SIZE, fp);
    fclose(fp);
 
    //Obtiene plataforma y la información del dispositivo
    cl_platform_id platform_id = NULL;
    cl_device_id device_id = NULL;   
    cl_uint ret_num_devices;
    cl_uint ret_num_platforms;
    cl_int ret = clGetPlatformIDs(1, &platform_id, &ret_num_platforms );
    ret = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_CPU, 1, 
                            &device_id, &ret_num_devices );
 
    //Crea contexto OpenCL
    cl_context context = clCreateContext( NULL, 1, &device_id, NULL, NULL, &ret);
 
    // Crea cola comandos
    cl_command_queue command_queue = clCreateCommandQueue(context, device_id, 0, &ret);
 
    // Crea buffers de memoria en el dispositivo para cada vector 
    cl_mem x_mem_obj = clCreateBuffer(context, CL_MEM_READ_ONLY, 
            size * sizeof(double), NULL, &ret);
    cl_mem b_mem_obj = clCreateBuffer(context, CL_MEM_READ_ONLY,
            size * sizeof(double), NULL, &ret);
    cl_mem alpha_mem_obj = clCreateBuffer(context, CL_MEM_READ_ONLY, 
            size * sizeof(double), NULL, &ret);
    cl_mem y_mem_obj = clCreateBuffer(context, CL_MEM_WRITE_ONLY, 
            size * sizeof(double), NULL, &ret);

    // Copia listas x, y , alpha en los buffers respectivos
    ret = clEnqueueWriteBuffer(command_queue, x_mem_obj, CL_TRUE, 0,
            size * sizeof(double), x, 0, NULL, NULL);
    ret = clEnqueueWriteBuffer(command_queue, b_mem_obj, CL_TRUE, 0, 
            size * sizeof(double), b, 0, NULL, NULL);
    ret = clEnqueueWriteBuffer(command_queue, alpha_mem_obj, CL_TRUE, 0, 
            size * sizeof(double), alpha, 0, NULL, NULL);

    //3. Crea programa desde el archivo fuente del kernel
    cl_program program = clCreateProgramWithSource(context, 1, 
            (const char**)(&source_str), (const size_t *)(&source_size), &ret);
 
    // Build al programa
    ret = clBuildProgram(program, 1, &device_id, NULL, NULL, NULL);

    //4. Crea kernel OpenCL 
    cl_kernel kernel = clCreateKernel(program, "saxpy_par", &ret);
 
    // Setea argumentos al kernel
    ret = clSetKernelArg(kernel, 0, sizeof(cl_mem), (void *)&x_mem_obj);
    ret = clSetKernelArg(kernel, 1, sizeof(cl_mem), (void *)&b_mem_obj);
    ret = clSetKernelArg(kernel, 2, sizeof(cl_mem), (void *)&y_mem_obj);
    ret = clSetKernelArg(kernel, 3, sizeof(cl_mem), (void *)&alpha_mem_obj);


    // Ejecuta el kernel 
    size_t global_item_size = size;
    size_t local_item_size = 1; 
    clock_t start_time = clock();
    ret = clEnqueueNDRangeKernel(command_queue, kernel, 1, NULL, 
            &global_item_size, &local_item_size, 0, NULL, NULL);
    ret = clEnqueueReadBuffer(command_queue, y_mem_obj, CL_TRUE, 0, 
            size * sizeof(double), y, 0, NULL, NULL);

    double result = (double)(clock() - start_time) / 1000;

    // Imprime resultados y tiempo
    for(int i = 0; i < size; ++i)
        printf("%f * %f + %f = %f\n", x[i], *alpha, b[i], y[i]);
    printf( "Tiempo de ejecucion: %f segundos\n", result);

    // Libera memoria utilizada
    ret = clFlush(command_queue);
    ret = clFinish(command_queue);
    ret = clReleaseKernel(kernel);
    ret = clReleaseProgram(program);
    ret = clReleaseMemObject(x_mem_obj);
    ret = clReleaseMemObject(b_mem_obj);
    ret = clReleaseMemObject(y_mem_obj);
    ret = clReleaseMemObject(alpha_mem_obj);
    ret = clReleaseCommandQueue(command_queue);
    ret = clReleaseContext(context);
    free(x);
    free(b);
    free(y);
    free(alpha);
    return 0;
}


