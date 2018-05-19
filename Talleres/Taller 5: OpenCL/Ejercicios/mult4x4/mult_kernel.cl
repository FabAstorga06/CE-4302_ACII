__kernel void matrix_mult(__global const int *mtx_a, __global const int *mtx_b, __global int *mtx_res) {
    int rows = get_global_id(0);
    int cols = get_global_id(1);
    int res = 0;
    int size = 4;
    for (int i = 0; i < size; ++i)  {
        res = res + mtx_a[i + cols*size] * mtx_b[i*size + rows];
    }
    mtx_res[rows + size*cols] = res;
}
