/* Verifica si la entrada correspondiente al tipo de
 * algoritmo de encriptacion que desea el usuario es
 * valido
 */
int check_encrpt(void* in, void* empty ) {
  num_encrypt = atoi(in);
  return (num_encrypt < 1 || num_encrypt > 4) ? (!OK) : OK ;
}

/* Verifica si la entradas correspondientes a los porcentajes
 * de uso del procesador de la FPGA y del procesador vectorial
 * son numeros validos
 */
int check_prnctgs(void* in_a, void* in_b ) {
  int percent1 = atoi(in_a );
  int percent2 = atoi(in_b );
  return ((percent1+percent2) == 100 ) ? OK : (!OK) ;
}

/* Verifica si la cantidad de parametros es la correcta */
int check_am_params (void* in, void* empty ) {
  int am_prms = *(int *)(&in );
  return (am_prms == PARAMS) ? OK : (!OK) ;
}

/* Funcion que maneja los posibles errores en las entradas del programa
 * para que se pueda ejecutar correctamente. Lanza error en caso de detectar
 * algun parametro invalido
 */
void handle_exceptions (int (*fnct)(void*, void* ), void* input1, void* input2 ) {

    /* Verifica si las funciones se ejecutaron exitosamente */
    if ( (*fnct)(input1, input2) ) {
      return;
    } else goto param_err;

    /* Salta al error */
    param_err:
    printf("Inserte los parámetros correspondientes...\n");
    exit(0);
}
