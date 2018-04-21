#include <emmintrin.h>
#include <smmintrin.h>
#include <stdio.h>

#define ROWS 4
#define COLS 4

/*************************************************************************************/
 /* Imprime matriz */
void print_mtx(float* mtx ) {
  for (int i = 0; i < ROWS; ++i)    {
    for (int j = 0; j < COLS; ++j) {
      printf("%f\t", (float)mtx[(j+i) * ROWS] );
    }
    printf("\n");
  }
}

/* Lee la matriz de entrada */
void read_mtx(float* mtx) {
  printf("Matrix data: ");
  for(int i = 0; i < ROWS ; ++i ) {
    for (int j = 0 ; j < COLS ; ++j ) {
      printf("Row %d, Col %d:\t", i+1, j+1 );
      scanf("%f", (float*)&mtx[j +i * ROWS] );
    }
  }
}

/*************************************************************************************/

int main(int argc, char* argv[] ) {

  float* mtx_A = (float*) malloc((ROWS*COLS) * sizeof(float));
  float* mtx_B = (float*) malloc((ROWS*COLS) * sizeof(float));
  float* mtx_res = (float*) malloc((ROWS*COLS) * sizeof(float));

  /* Lee la primera matriz */
  read_mtx(mtx_A);
  printf("Matrix A: \n");
  print_mtx(mtx_A);

  /* Lee la segunda matriz */
  read_mtx(mtx_B);
  printf("Matrix B: \n");
  print_mtx(mtx_B);

  float* tmp_mtx_A = mtx_A;
  float* tmp_mtx_B = mtx_B;
  float* tmp_mtx_res = mtx_res;

  const __m128 B_x = _mm_load_ps(tmp_mtx_B);
  const __m128 B_y = _mm_load_ps(tmp_mtx_B + 4);
  const __m128 B_z = _mm_load_ps(tmp_mtx_B + 8);
  const __m128 B_w = _mm_load_ps(tmp_mtx_B + 12);

  for (int i = 0; i < ROWS; ++i, tmp_mtx_A += ROWS, tmp_mtx_res += ROWS ) {
      printf("Matrix A values: %f\n", tmp_mtx_A[0] );
      __m128 A_x = _mm_set1_ps(tmp_mtx_A[0]);
      __m128 A_y = _mm_set1_ps(tmp_mtx_A[1]);
      __m128 A_z = _mm_set1_ps(tmp_mtx_A[2]);
      __m128 A_w = _mm_set1_ps(tmp_mtx_A[3]);

      __m128 X = _mm_mul_ps(A_x , B_x);
      __m128 Y = _mm_mul_ps(A_y , B_y);
      __m128 Z = _mm_mul_ps(A_z , B_z);
      __m128 W = _mm_mul_ps(A_w , B_w);

      __m128 rst = _mm_add_ps(X,_mm_add_ps( Y, _mm_add_ps (Z , W)));

      _mm_store_ps(tmp_mtx_res, rst);
  }
  printf("Multiplication result: \n");
  print_mtx(mtx_res);
  return 1;
}
