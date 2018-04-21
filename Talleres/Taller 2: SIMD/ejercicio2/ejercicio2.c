#include <emmintrin.h>
#include <smmintrin.h>
#include <stdio.h>

#define ROWS 2
#define COLS 8

/*************************************************************************************/
 /* Imprime matriz */
void print_mtx(short* mtx ) {
  for (int i = 0; i < ROWS; ++i)    {
    for (int j = 0; j < COLS; ++j)
      printf("%hu\t", (short)mtx[(j+i) * ROWS]);
    printf("\n");
  }
}

/* Lee la matriz de entrada */
void read_mtx(short* mtx ) {
  printf("Matrix data: ");
  for(int i = 0; i < ROWS ; ++i ) {
    for (int j = 0 ; j < COLS ; ++j ) {
      printf("Row %d, Col %d:\t", i+1, j+1 );
      scanf("%hu", (short*)(&mtx[j+i * ROWS]) );
    }
  }
}

/*************************************************************************************/

int main(int argc, char* argv[] ) {

  short* mtx_in = (short*) malloc( (ROWS*COLS) * sizeof(short));
  read_mtx(mtx_in );
  printf("Matrix: \n");
  print_mtx(mtx_in );

  __m128i v1 = _mm_set_epi16(mtx_in[7],mtx_in[6],mtx_in[5],mtx_in[4],
                            mtx_in[3],mtx_in[2],mtx_in[1],mtx_in[0]); //Fila 1 de la matriz

  __m128i v2 = _mm_set_epi16(mtx_in[15],mtx_in[14],mtx_in[13],mtx_in[12],
                            mtx_in[11],mtx_in[10],mtx_in[9],mtx_in[8]); //Fila 2 de la matriz

  __m128i res = _mm_max_epi16 (v1, v2); // Maximos valores de ambos vectores

  short* vec_shrt_m128i = (short *)(&res);

  printf("Max vector result: \n");
  print_mtx(vec_shrt_m128i);
  return 1;
}
