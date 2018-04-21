#include "constants.h"

/*****************************************************************/

/* Algoritmo de encriptacion XOR
 * para una imagen en escala de grises
 */
void xor_encrypt(cv::Mat &mtx ) {
  uint8_t pix, xor_val;
  for(unsigned int j = 0; j < img_h; j++) {
    for(unsigned int i = 0; i < img_w; i++) {
       pix = mtx.at<uint8_t>(j,i);
    //   printf( "%d ", pix);
       xor_val = XOR(pix) ;
       mtx.at<uint8_t>(j, i) = xor_val;
    //   printf( "Dato XOR: %d |", mtx.at<uint8_t>(j, i) );
    }
  //  printf("\n");
  }
}

/*****************************************************************/

/* Algoritmo de encriptacion que desplaza los pixeles
 * una cierta cantidad de veces a la izquierda
 * para una imagen en escala de grises
 */
void simple_desp (cv::Mat &mtx ) {
  uint8_t pix, res;
  for(unsigned int j = 0; j < img_h; j++) {
    for(unsigned int i = 0; i < img_w; i++) {
       pix = mtx.at<uint8_t>(j,i);
  //     printf( "%d ",pix);
       res = MV(pix);
       mtx.at<uint8_t>(j, i) = res;
  //     printf( "Dato desplazado: %d | ", mtx.at<uint8_t>(j, i) );
    }
  //  printf("\n");
  }
}

/* Algoritmo de decriptacion que desplaza los pixeles
 * una cierta cantidad de veces a la derecha
 * para una imagen en escala de grises, se pierde info
 */
void decrypt_simple_desp (cv::Mat &mtx ) {
  uint8_t pix, res;
  for(unsigned int j = 0; j < img_h; j++) {
    for(unsigned int i = 0; i < img_w; i++) {
       pix = mtx.at<uint8_t>(j,i);
  //     printf( "%d ",pix);
       res = MV_BCK(pix);
       mtx.at<uint8_t>(j, i) = res;
  //     printf( "Dato desplazado: %d | ", mtx.at<uint8_t>(j, i) );
    }
  //  printf("\n");
  }

}

/*****************************************************************/
/* Algoritmo de encriptacion que desplaza los pixeles
 * una cierta cantidad de veces a la izquierda y guarda
 * los bits a la derecha que se han desplazado para una
 * imagen en escala de grises
 */
void circular_desp (cv::Mat &mtx ) {
  uint8_t pix, res_l, res_r, or_res;
  for(unsigned int j = 0; j < img_h; j++) {
    for(unsigned int i = 0; i < img_w; i++) {
       pix = mtx.at<uint8_t>(j,i);
  //     printf( "%d ",pix);
       res_l = MV(pix);
       res_r = pix >> (BIT_AMOUNT - bits_displ);
       or_res = (res_l | res_r);
       mtx.at<uint8_t>(j, i) = or_res;
  //     printf( "Dato desplazado circular: %d | ", mtx.at<uint8_t>(j, i));
    }
//    printf("\n");
  }
}


/* Algoritmo de decriptacion que desplaza los pixeles
 * una cierta cantidad de veces a la derecha y guarda
 * los bits a la izquierda
 */
void decrypt_circular_desp (cv::Mat &mtx) {
  uint8_t pix, res_l, res_r, or_res;
  for(unsigned int j = 0; j < img_h; j++) {
    for(unsigned int i = 0; i < img_w; i++) {
       pix = mtx.at<uint8_t>(j,i);
  //     printf( "%d ", pix);
       res_l = pix << (BIT_AMOUNT - bits_displ) ;
       res_r = pix >> bits_displ ;
       or_res = (res_l | res_r);
       mtx.at<uint8_t>(j, i) = or_res;
  //     printf( "Dato desplazado circular: %d | ", mtx.at<uint8_t>(j, i));
    }
//    printf("\n");
  }
}


/*****************************************************************/
/* Algoritmo de encriptacion que suma cada 4 pixeles
 * con un arreglo de pixeles establecidos para una
 * imagen en escala de grises
 */
void simple_add (cv::Mat &mtx) {
  unsigned char pix;
  uint8_t res;
  int offset = 0;
  for(unsigned int j = 0; j < img_h; j++) {
    for(unsigned int i = 0; i < img_w; i++) {
       if (offset == PIX_VEC) {
         offset = 0;
       }
       pix = (unsigned char)(mtx.at<uint8_t>(j,i));
  //     printf( "%d ",pix);
       res = pix + (pix_arr[offset] );
       mtx.at<uint8_t>(j, i) = res;
  //     printf( "Dato sumado: %d |", mtx.at<uint8_t>(j, i) );
       offset += 1;
    }
  //  printf("\n");
  }
}

/* Algoritmo de decriptacion que resta cada 4 pixeles
 * con el arreglo de pixeles clave establecidos para una
 * imagen en escala de grises
 */
void simple_add_decrypt (cv::Mat &mtx) {
  unsigned char pix;
  uint8_t res;
  int offset = 0;
  for(unsigned int j = 0; j < img_h; j++) {
    for(unsigned int i = 0; i < img_w; i++) {
       if (offset == PIX_VEC) {
         offset = 0;
       }
       pix = (unsigned char)(mtx.at<uint8_t>(j,i));
  //     printf( "%d ",pix);
       res = pix - (pix_arr[offset] );
       mtx.at<uint8_t>(j, i) = res;
  //     printf( "Dato sumado: %d |", mtx.at<uint8_t>(j, i) );
       offset += 1;
    }
  //  printf("\n");
  }
}
