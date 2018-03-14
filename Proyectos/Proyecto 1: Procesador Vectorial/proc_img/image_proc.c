#include "encrypt_algs.c"


extern unsigned int img_h, img_w, img_channels;

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

  // Verifica si se inserto el nombre de la imagen al ejecutar
  if (argc != PARAMS ) {
    printf("Inserte los parámetros correspondientes...\n");
    exit(0);
  }
  // Verifica el algoritmo de encriptacion escogido por el usuario
  int num_encrypt = atoi(argv[2] );
  if (num_encrypt < 1 || num_encrypt > 4) {
    printf("Inserte un algoritmo de encriptación disponible...\n");
    exit(0);
  }
  // Verifica los porcentajes seleccionados por el usuario
  int p1 = atoi(argv[3] );
  int p2 = atoi(argv[4] );
  if ( (p1 + p2) != 100) {
    printf("Porcentajes invalidos, intente de nuevo...\n");
    exit(0);
  }

  /* SE MUESTRA IMAGEN EN ESCALA DE GRISES */
  // Se convierte imagen a escala de grises
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
       printf("Algo ha fallado, inténtelo de nuevo...\n");
       exit(0);
  }

  return 0;
}
