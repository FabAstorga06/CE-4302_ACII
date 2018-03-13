#include "encrypt_algs.c"

#define SIZE_W 100
#define TITLE_W "Convertidor Imagenes"

/*********************************************************************************/

int img_h, img_w, img_channels;

IplImage* convert2gray(char* img_name ) {

  IplImage* img_proc = 0;
  // Carga una imagen
  img_proc = cvLoadImage(img_name, CV_LOAD_IMAGE_COLOR );
  // Verifica si la imagen se cargo exitosamente
  if(!img_proc ) {
    printf("No fue posible cargar la imagen: %s\n",img_name);
    exit(0);
  }

  int img_channels = img_proc->nChannels;
  printf("Procesando imagen de %dx%d con %d canales.\n",img_proc->height,
                                            img_proc->width,img_channels);
  // Crea ventana para mostrar imagen
  cvNamedWindow(TITLE_W, CV_WINDOW_AUTOSIZE);
  cvMoveWindow(TITLE_W, SIZE_W, SIZE_W);
  // Se crea un objeto que será la nueva imagen gris
  IplImage* img_gray = cvCreateImage(cvSize(img_proc->width, img_proc->height),
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

int main(int argc, char *argv[] )  {

  // Verifica si se inserto el nombre de la imagen al ejecutar
  if (argc < 2 ) {
    printf("Inserte el nombre de la imagen...\n\7");
    exit(0);
  }

  /* Se convierte imagen a escala de grises */
  IplImage* img_g = convert2gray(argv[1] );
  show_image(img_g);

  /* Se cambia de imagen a matriz */
  CvMat* mtx_g = cvCreateMat(img_g->height, img_g->width, CV_8UC1 );
  cvConvert( img_g, mtx_g );

  /* Encriptacion */
  //xor_encrypt(mtx_g, img_g->height, img_g->width);
  //simple_desp(mtx_g, img_g->height, img_g->width);
  // circular_desp(mtx_g, img_g->height, img_g->width);
  simple_add(mtx_g, img_g->height, img_g->width);

  return 0;
}
