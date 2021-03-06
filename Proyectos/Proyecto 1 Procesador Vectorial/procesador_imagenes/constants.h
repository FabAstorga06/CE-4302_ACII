/* Dependencias del programa */
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <opencv2/core/core.hpp>
#include <opencv2/opencv.hpp>
#include <opencv2/highgui/highgui.hpp>

/* Constantes */
#define PARAMS 3
#define SIZE_W 200
#define TITLE_W "Image Converter"
#define BIT_AMOUNT 8

/* Funciones para encriptar */
#define PIX_VEC 4
#define XOR(x) ((x) ^ private_key)
#define MV(x) ((x) << bits_displ)
#define MV_BCK(x) ((x) >> bits_displ)

/* Constantes para encriptacion y decriptacion */
static uint8_t private_key = 0x0FA; // 250 en decimal
static uint8_t bits_displ = 2; // desplazamiento
static uint8_t pix_arr[PIX_VEC] = {12, 5, 100, 10}; //Clave de pixeles

/* Dimensiones y canales de la imagen */
unsigned int img_h = 0;
unsigned int img_w = 0;
