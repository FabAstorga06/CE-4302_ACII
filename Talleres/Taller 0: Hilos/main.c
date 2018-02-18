#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>
#include <stdint.h>
#include <unistd.h>

/*******************************************************************/
#define MAX_VALUE 256
#define SLEEP_TIME 100000
#define XOR(x) ((x) ^ 0x20)

uint8_t* data_arr;
uint8_t _data, xor_data;
unsigned long ulong_length;
pthread_mutex_t _lock;

/*******************************************************************/
/*  GENERA NUMEROS DE 8 BITS ALEATORIOS  */
void *generate_random() {
  //Se generan datos aleatorios y se agregan al arreglo de datos
  for (unsigned int i = 0; i < ulong_length; i++) {
    _data = rand() % MAX_VALUE;

    pthread_mutex_lock(&_lock);
    data_arr[i] = _data;
    pthread_mutex_unlock(&_lock);

    printf( "Hilo 1 - Dato: %d\n", data_arr[i] );
    usleep(SLEEP_TIME);
  }
}

/*  APLICA XOR A LOS DATOS ALEATORIOS  */
void *xor_op() {
  //Se les aplica XOR a los datos
  for (unsigned int i = 0; i < ulong_length; i++) {

    pthread_mutex_lock(&_lock);
    xor_data = XOR( data_arr[i] );
    pthread_mutex_unlock(&_lock);

    printf("Hilo 2 - %d ^ 0x20: %d\n", data_arr[i], xor_data );
    printf("**************************\n");
    usleep(SLEEP_TIME + 100 );
  }
}

/*******************************************************************/
int main(int argc, char* argv[] ) {

  /* Verifica la entrada */
  if (atoi(argv[1]) < 0) {
    fprintf(stderr, "El numero %s no puede ser negativo...\n", argv[1] );
    return -1;
  }

  /* Ejecucion de programa con hilos */
  srand(time(NULL));
  ulong_length = atol(argv[1]);
  data_arr = ( uint8_t *) malloc(sizeof( uint8_t ) * ulong_length);
  pthread_t _task1, _task2;

  pthread_mutex_init(&_lock, NULL);
  pthread_create(&_task1, NULL, generate_random, NULL);
  pthread_create(&_task2, NULL, xor_op, NULL);

  pthread_join(_task1, NULL);
  pthread_join(_task2, NULL);
  pthread_mutex_destroy(&_lock);

  free(data_arr);
  return 0;
}

/*           FIN         */
