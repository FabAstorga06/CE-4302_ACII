#include "constants.h"

// Variable temporal de prueba 
int tmp = 5;
/*****************************************************************/

/* Algoritmo de encriptacion XOR
 * para una imagen en escala de grises
 */
void xor_encrypt(CvMat* mtx ) {
  CvScalar pix;
  uint8_t xx, xor_val;
  for(int i = 0; i < tmp; i++) {
    for(int j = 0; j < tmp; j++) {
       pix = cvGet2D( mtx, j, i);
       xx = (uint8_t)(pix.val[0]);
       printf( "%d ",xx);
       xor_val = XOR(xx);
       CvScalar xor_scal = cvRealScalar( xor_val );
       cvSet2D(mtx, j, i, xor_scal );
       printf( "Dato XOR: %.f |", cvGet2D( mtx, j, i).val[0]);
    }
    printf("\n");
  }
}

/*****************************************************************/

/* Algoritmo de encriptacion que desplaza los pixeles
 * una cierta cantidad de veces a la izquierda
 * para una imagen en escala de grises
 */
void simple_desp (CvMat* mtx ) {
  CvScalar pix;
  uint8_t xx, res;
  for(int i = 0; i < tmp; i++) {
    for(int j = 0; j < tmp; j++) {
       pix = cvGet2D( mtx, j, i);
       xx = (uint8_t)(pix.val[0]);
       printf( "%d ",xx);
       res = MV(xx);
       CvScalar disp_scal = cvRealScalar(res );
       cvSet2D(mtx, j, i, disp_scal );
       printf( "Dato desplazado: %.f |", cvGet2D( mtx, j, i).val[0]);
    }
    printf("\n");
  }
}

void decrypt_simple_desp (CvMat* mtx ) {
  CvScalar pix;
  uint8_t xx, res;
  for(int i = 0; i < tmp; i++) {
    for(int j = 0; j < tmp; j++) {
       pix = cvGet2D( mtx, j, i);
       xx = (uint8_t)(pix.val[0]);
       printf( "%d ",xx);
       res = MV_BCK(xx);
       CvScalar res_scal = cvRealScalar(res);
       cvSet2D(mtx, j, i, res_scal );
       printf( "Dato desplazado: %.f |", cvGet2D( mtx, j, i).val[0]);
    }
    printf("\n");
  }

}

/*****************************************************************/
/* Algoritmo de encriptacion que desplaza los pixeles
 * una cierta cantidad de veces a la izquierda y guarda
 * los bits a la derecha que se han desplazado para una
 * imagen en escala de grises
 */
void circular_desp (CvMat* mtx ) {
  CvScalar pix;
  uint8_t xx, res_l, res_r, or_res;
  for(int i = 0; i < tmp; i++) {
    for(int j = 0; j < tmp; j++) {
       pix = cvGet2D( mtx, j, i);
       xx = (uint8_t)(pix.val[0]);
       printf( "%d ",xx);
       res_l = MV(xx);
       res_r = xx >> (BIT_AMOUNT - bits_displ );
       or_res = (res_l | res_r);

       CvScalar res_scal = cvRealScalar(or_res);
       cvSet2D(mtx, j, i, res_scal );
       printf( "Dato desplazado: %.f |", cvGet2D( mtx, j, i).val[0]);
    }
    printf("\n");
  }
}

void decrypt_circular_desp (CvMat* mtx ) {
  CvScalar pix;
  uint8_t xx, res_l, res_r, or_res;
  for(int i = 0; i < tmp; i++) {
    for(int j = 0; j < tmp; j++) {
       pix = cvGet2D( mtx, j, i);
       xx = (uint8_t)(pix.val[0]);
       printf( "%d ", xx);
       res_l = xx << (BIT_AMOUNT -bits_displ) ;
       res_r = xx >> bits_displ ;
       or_res = (res_l | res_r);
       CvScalar res_scal = cvRealScalar(or_res);
       cvSet2D(mtx, j, i, res_scal);
       printf( "Dato desplazado: %.f |", cvGet2D( mtx, j, i).val[0]);
    }
    printf("\n");
  }
}

/*****************************************************************/
/* Algoritmo de encriptacion que suma cada 4 pixeles
 * con un arreglo de pixeles establecidos para una
 * imagen en escala de grises
 */
void simple_add (CvMat* mtx) {
  CvScalar pix;
  uint8_t xx, res;
  int offset = 0;
  for(int i = 0; i < tmp; i++) {
    for(int j = 0; j < tmp; j++) {
       if (offset == PIX_VEC) {
         offset = 0;
       }
       pix = cvGet2D( mtx, j, i);
       xx = (uint8_t)(pix.val[0]);
       printf( "%d ",xx);
       res = xx + (pix_arr[offset] );
       CvScalar res_scal = cvRealScalar(res );
       cvSet2D(mtx, j, i, res_scal );
       printf( "Dato sumado: %.f |", cvGet2D( mtx, j, i).val[0]);
       offset += 1;
    }
    printf("\n");
  }
}

/* Algoritmo de decriptacion que resta cada 4 pixeles
 * con el arreglo de pixeles clave establecidos para una
 * imagen en escala de grises
 */
void simple_add_decrypt (CvMat* mtx) {
  CvScalar pix;
  uint8_t xx, res;
  int offset = 0;
  for(int i = 0; i < tmp; i++) {
    for(int j = 0; j < tmp; j++) {
       if (offset == PIX_VEC) {
         offset = 0;
       }
       pix = cvGet2D( mtx, j, i);
       xx = (uint8_t)(pix.val[0]);
       printf( "%d ",xx);
       res = xx - (pix_arr[offset] );
       CvScalar res_scal = cvRealScalar(res );
       cvSet2D(mtx, j, i, res_scal );
       printf( "Dato restado: %.f |", cvGet2D( mtx, j, i).val[0]);
       offset += 1;
    }
    printf("\n");
  }
}
