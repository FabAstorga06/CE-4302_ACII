#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <cv.h>
#include <highgui.h>

#define SIZE_W 100
#define TITLE_W "Convertidor Imagenes"

/*********************************************************************************/

IplImage* convert2gray(char* img_name ) {

  IplImage* img_proc = 0;
  int img_h, img_w, img_channels;
  // Carga una imagen
  img_proc = cvLoadImage(img_name, CV_LOAD_IMAGE_COLOR );
  // Verifica si la imagen se cargo exitosamente
  if(!img_proc ) {
    printf("No fue posible cargar la imagen: %s\n",img_name);
    exit(0);
  }
  // Obtiene los datos de la imagen **
  img_h = img_proc->height;
  img_w = img_proc->width;
  img_channels = img_proc->nChannels;
  printf("Procesando imagen de %dx%d con %d canales.\n",img_h,
                                                      img_w,img_channels);
  // Crea ventana para mostrar imagen
  cvNamedWindow(TITLE_W, CV_WINDOW_AUTOSIZE);
  cvMoveWindow(TITLE_W, SIZE_W, SIZE_W);
  // Se crea un objeto que será la nueva imagen gris
  IplImage* img_gray = cvCreateImage(cvSize(img_w, img_h), IPL_DEPTH_8U, 1);
  // Cambia escala de imagen de RGB a gris
  cvCvtColor(img_proc, img_gray, CV_RGB2GRAY);
  return img_gray;
}

void show_image (IplImage* img) {
  // Muestra la imagen
  cvShowImage(TITLE_W, img );
  // Espera por una señal del teclado para cerrar ventana
  cvWaitKey(0);
  cvReleaseImage(&img );
}

/*********************************************************************************/

int main(int argc, char *argv[] )  {

  // Verifica si se inserto el nombre de la imagen al ejecutar
  if (argc < 2 ) {
    printf("Inserte el nombre de la imagen...\n\7");
    exit(0);
  }

  show_image( convert2gray(argv[1]) );

  return 0;
}
