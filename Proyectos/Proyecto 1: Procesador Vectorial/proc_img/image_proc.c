#include "encrypt_algs.c"
#include "exceptions.c"

/*********************************************************************************/

IplImage* convert2gray(char* img_name ) {

  IplImage* img_proc = 0;
  // Carga una imagen
  img_proc = cvLoadImage(img_name, CV_LOAD_IMAGE_COLOR );
  // Verifica si la imagen se cargo exitosamente
  if(!img_proc ) {
    printf("No fue posible cargar la imagen: %s\n",img_name);
    exit(0);
  }

  img_h = img_proc->height;
  img_w = img_proc->width;
  img_channels = img_proc->nChannels;
  printf("Procesando imagen de %dx%d con %d canales.\n",img_h,
                                            img_w,img_channels);
  // Crea ventana para mostrar imagen
  cvNamedWindow(TITLE_W, CV_WINDOW_AUTOSIZE);
  cvMoveWindow(TITLE_W, SIZE_W, SIZE_W);
  // Se crea un objeto que será la nueva imagen gris
  IplImage* img_gray = cvCreateImage(cvSize(img_w, img_h),
                                            IPL_DEPTH_8U, 1);
  // Cambia escala de imagen de RGB a gris
  cvCvtColor(img_proc, img_gray, CV_RGB2GRAY);
  return img_gray;
}

void show_image (IplImage* img) {
  // Muestra la imagen
  cvShowImage(TITLE_W, img );
  // Espera por una señal del teclado para cerrar ventana
  cvWaitKey(0);
}

/*********************************************************************************/

int main(int argc, char* argv[] )  {

  /* Maneja excepciones de los parámetros de entrada */
  handle_exceptions(check_am_params, (void *)(intptr_t)(argc), NULL );
  handle_exceptions(check_encrpt, argv[2], NULL );
  handle_exceptions(check_prnctgs, argv[3], argv[4] );

  /*******************************************************************/

  /* SE MUESTRA IMAGEN EN ESCALA DE GRISES */

  /* Se convierte imagen a escala de grises */
  IplImage* img_g = convert2gray(argv[1] );
  show_image(img_g);

  /* Se cambia de imagen a matriz */
  CvMat* mtx_g = cvCreateMat(img_h, img_w, CV_8UC1 );
  cvConvert( img_g, mtx_g );

  /*******************************************************************/
  /* SE ENCRIPTA IMAGEN */
  switch(num_encrypt) {

     case 1:
        /* Encriptacion con XOR */
        printf("----ENCRYPT XOR----\n");
        xor_encrypt(mtx_g);
        /* Desencripta con la misma funcion XOR */
        printf("----DECRYPT XOR----\n");
        xor_encrypt(mtx_g);
        break;

     case 2:
        /* Encriptacion con desplazamiento simple */
        printf("----ENCRYPT SIMPLE DISPLACE----\n");
        simple_desp(mtx_g);
        /* Desencripta con desplazamiento simple (se pierde info) */
        printf("----DECRYPT SIMPLE DISPLACE----\n");
        decrypt_simple_desp(mtx_g);
        break;

     case 3:
        /* Encriptacion con desplazamiento circular */
        printf("----ENCRYPT CIRCULAR DISPLACE----\n");
        circular_desp(mtx_g);
        /* Desencripta con desplazamiento circular  */
        printf("----DECRYPT CIRCULAR DISPLACE----\n");
        decrypt_circular_desp(mtx_g);
        break;

     case 4: /**** TOMAR EN CUENTA EL DESBORDAMIENTO ******/
     /* Encriptacion con suma simple */
        printf("----ENCRYPT SIMPLE ADD----\n");
        simple_add(mtx_g);
        /* desencripta con suma simple */
        printf("----DECRYPT SIMPLE ADD----\n");
        simple_add_decrypt(mtx_g);
        break;

     default:
        break;
  }

  return 0;
}
