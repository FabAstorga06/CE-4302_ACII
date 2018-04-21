#include "encrypt.cpp"

/*********************************************************************************/

void convert2gray(char* img_name, cv::Mat &img_proc ) {

  // Carga una imagen
  img_proc = cv::imread(img_name, CV_LOAD_IMAGE_GRAYSCALE );
  // Verifica si la imagen se cargo exitosamente
  if(!img_proc.data ) {
    printf("No fue posible cargar la imagen: %s\n",img_name);
    exit(0);
  }

  img_h = img_proc.rows;
  img_w = img_proc.cols;

  // Crea ventana para mostrar imagen
  cv::namedWindow(TITLE_W, cv::WINDOW_AUTOSIZE);
  cv::moveWindow(TITLE_W, img_w, img_h);

}

void show_image (cv::Mat &img) {
  // Muestra la imagen
  cv::imshow(TITLE_W, img );
  // Espera por una señal del teclado para cerrar ventana
  cv::waitKey();
}

/*********************************************************************************/

int main(int argc, char* argv[] )  {

  /* Maneja excepciones de los parámetros de entrada */
  int num_encrypt = atoi(argv[2]);
  if (argc != PARAMS) {
    printf("Inserte los parámetros correspondientes...\n");
    exit(0);
  }
  if(num_encrypt < 1 || num_encrypt > 4 ) {
    printf("Inserte los parámetros correspondientes...\n");
    exit(0);
  }

  /*******************************************************************/

  /* SE MUESTRA IMAGEN EN ESCALA DE GRISES */

  /* Se convierte imagen a escala de grises */
  cv::Mat img_g;
  convert2gray(argv[1], img_g );

  /*******************************************************************/
  /* SE ENCRIPTA IMAGEN */
  switch(num_encrypt) {

     case 1:
        /* Encriptacion con XOR */
        printf("----ENCRYPT XOR----\n");
        xor_encrypt(img_g);
        show_image(img_g);
        /* Desencripta con la misma funcion XOR */
        printf("----DECRYPT XOR----\n");
        xor_encrypt(img_g);
        show_image(img_g);
        break;

     case 2:
       /* Encriptacion con desplazamiento simple */
        printf("----ENCRYPT SIMPLE DISPLACE----\n");
        simple_desp(img_g);
        show_image(img_g);
       /* Desencripta con desplazamiento simple (se pierde info) */
        printf("----DECRYPT SIMPLE DISPLACE----\n");
        decrypt_simple_desp(img_g);
        show_image(img_g);
        break;
     case 3:
        /* Encriptacion con desplazamiento circular */
        printf("----ENCRYPT CIRCULAR DISPLACE----\n");
        circular_desp(img_g);
        show_image(img_g);
        /* Desencripta con desplazamiento circular  */
        printf("----DECRYPT CIRCULAR DISPLACE----\n");
        decrypt_circular_desp(img_g);
        show_image(img_g);
        break;

     case 4:
     /* Encriptacion con suma simple */
        printf("----ENCRYPT SIMPLE ADD----\n");
        simple_add(img_g);
        show_image(img_g);
        /* desencripta con suma simple */
        printf("----DECRYPT SIMPLE ADD----\n");
        simple_add_decrypt(img_g);
        show_image(img_g);
        break;

      default:
         break;
  }

  return 0;
}
