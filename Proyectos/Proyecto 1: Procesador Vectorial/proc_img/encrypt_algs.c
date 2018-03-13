#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <cv.h>
#include <highgui.h>

#define PIX_VEC 4
#define XOR(x) ((x) ^ private_key)
#define DISPLACE(x) ((x) << bits_displ)

static uint8_t private_key = 0x0FA; // 250 en decimal
static uint8_t bits_displ = 2; // desplazamiento
static int pix_arr[PIX_VEC] = {12, 5, 100, 10}; //Clave de pixeles

/*****************************************************************/

/* Algoritmo de encriptacion XOR
 * para una imagen en escala de grises
 */
void xor_encrypt (CvMat* mtx, int mtx_h, int mtx_w) {
  CvScalar pix;
  int xx, xor_val;
  for(int i=0; i<mtx_w; i++) {
    for(int j=0; j<mtx_h; j++) {
       pix = cvGet2D( mtx, j, i);
       xx = (int)(pix.val[0]);
       printf( "%d ",xx);
       xor_val = XOR(xx);
       CvScalar xor_scal = cvRealScalar( xor_val );
       cvSet2D(mtx, j, i, xor_scal );
       printf( "Dato XOR: %.f ", cvGet2D( mtx, j, i).val[0]);
    }
    printf("\n");
  }
}

/*****************************************************************/

/* Algoritmo de encriptacion que desplaza los pixeles
 * una cierta cantidad de veces a la izquierda
 * para una imagen en escala de grises
 */
void simple_desp (CvMat* mtx, int mtx_h, int mtx_w) {
  CvScalar pix;
  int xx, res;
  for(int i=0; i<mtx_w; i++) {
    for(int j=0; j<mtx_h; j++) {
       pix = cvGet2D( mtx, j, i);
       xx = (int)(pix.val[0]);
       printf( "%d ",xx);
       res = DISPLACE(xx);
       CvScalar disp_scal = cvRealScalar(res );
       cvSet2D(mtx, j, i, disp_scal );
       printf( "Dato desplazado: %.f ", cvGet2D( mtx, j, i).val[0]);
    }
    printf("\n");
  }
}

/*****************************************************************/
/* Algoritmo de encriptacion que desplaza los pixeles
 * una cierta cantidad de veces a la izquierda y guarda
 * los bits a la derecha que se han desplazadopara una
 * imagen en escala de grises
 */
void circular_desp (CvMat* mtx, int mtx_h, int mtx_w) {

}

/*****************************************************************/
/* Algoritmo de encriptacion que suma cada 4 pixeles
 * con un arreglo de pixeles establecidos para una
 * imagen en escala de grises
 */
void simple_add (CvMat* mtx, int mtx_h, int mtx_w) {
  CvScalar pix;
  int xx, res;
  int offset = 0;
  for(int i=0; i<10; i++) {
    for(int j=0; j<10; j++) {
       if (offset == PIX_VEC) {
         offset = 0;
       }
       pix = cvGet2D( mtx, j, i);
       xx = (int)(pix.val[0]);
       printf( "%d ",xx);
       res = xx + (pix_arr[offset] );
       CvScalar res_scal = cvRealScalar(res );
       cvSet2D(mtx, j, i, res_scal );
       printf( "Dato sumado: %.f ", cvGet2D( mtx, j, i).val[0]);
       offset += 1;
    }
    printf("\n");
  }

}
