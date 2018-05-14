#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <omp.h>

/*******************************************************************/
/* FUNCION QUE CALCULA EL FACTORIAL DE UN NUMERO */
long fact(long n ) {
  long res = 1;
  for (int i = 1; i <= n; i++) {
    res *= i;
  }
  return res;
}

/* FUNCION QUE APROXIMA e ELEVADO A ALGUN NUMERO CON PARALELIZACION
  VIA OPENMP  */
void e_aprox(int n, double x ) {
  double res = 0;
  #pragma omp parallel for reduction(+:res)
  for (int i = 0; i < n; i++) {
    res += (pow(x,i) / fact(i) );
  }
  printf("---------------------------------\n");
  printf("e**(%f): %f\n", x, res);
}

/*******************************************************************/
int main(int argc, char* argv[] ) {

  double start_time, run_time;
  int n = atoi(argv[1]);
  double x = atof(argv[2]);

  // Aproxima e elevado a algun numero y mide el tiempo 
  start_time = omp_get_wtime();
  e_aprox(n, x);
  run_time = omp_get_wtime() - start_time;
  printf("Tiempo: %f segundos \n",run_time);
  printf("---------------------------------\n");

  return 0;
}

/*           FIN         */
