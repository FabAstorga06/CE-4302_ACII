__kernel void saxpy_par(__global const double *x, __global const double *b, __global double *y, __global const double *alpha) {
    int i = get_global_id(0); 
    y[i] = *alpha * x[i] + b[i];
}