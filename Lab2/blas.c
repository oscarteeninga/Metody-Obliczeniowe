#include <stdio.h>
#include <gsl/gsl_blas.h>
#include <time.h>

const int RANGE = 10000;

void test(FILE *fp, int N) {
  gsl_matrix *A = gsl_matrix_calloc(N, N);
  gsl_vector *v = gsl_vector_calloc(N);
  gsl_vector *w = gsl_vector_calloc(N);

  for (int i = 0; i < N; i++)
  {
    gsl_vector_set(v, i, (double)rand() / RAND_MAX * RANGE);
    gsl_vector_set(w, i, (double)rand() / RAND_MAX * RANGE);
    for (int j = 0; j < N; j++)
    {
      gsl_matrix_set(A, i, j, (double)rand() / RAND_MAX * RANGE);
    }
  }

  clock_t start, end;
  double ddot_time, dgemv_time;

  double tmp;
  start = clock();
  gsl_blas_ddot(v, w, &tmp);
  end = clock();
  ddot_time = 1000000*((double) (end - start)) / CLOCKS_PER_SEC;

  double alpha = 1.0;
  double beta = 1.0;
  start = clock();
  gsl_blas_dgemv(CblasNoTrans, alpha, A, v, beta, w);
  end = clock();
  dgemv_time = ((double) (end - start)) / CLOCKS_PER_SEC;

  printf("\nddot time:  %.10lf s\ndgemv time: %.10lf s \n\n", ddot_time, dgemv_time);
  fprintf(fp,"%d,%.10f,%d\n",N,ddot_time,1);
  fprintf(fp,"%d,%.10f,%d\n",N,dgemv_time,2);
}

int main(void)
{
  FILE *fp = fopen("times.csv", "w");
  fprintf(fp, "Size,Time,Type\n");
  if (fp == NULL)
    printf("\nCan't open file\n");
  int N = 1000;
  int p = 0;
  for (int i = 0; i < 100; i++) {
    printf("Pomiar: ");
    printf("%d", i+1);
    printf(" wielkość wektora: ");
    printf("%d", N);
    test(fp, N);
    if (p == 9) {
      N += 1000;
      p = 0;
    }
    else {
      p++;
    }
  }

  return 0;
}