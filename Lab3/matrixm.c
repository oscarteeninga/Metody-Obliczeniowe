#include <stdio.h>
#include <gsl/gsl_blas.h>
#include <time.h>

double naive_multiplication(gsl_matrix *A, gsl_matrix *B, int N) {
    gsl_matrix *C = gsl_matrix_calloc(N,N);
    gsl_matrix_set_zero(C);
    time_t start = clock();
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            for (int k = 0; k < N; k++) {
                int tmp = gsl_matrix_get(C, i, j) +gsl_matrix_get(A, i, k)*gsl_matrix_get(B, k, j);
                gsl_matrix_set(C, i, j, tmp);
            }
        }
    }
    printf("Naive:\t%g s\n", ((double) (clock()-start))/CLOCKS_PER_SEC);
    return ((double) (clock()-start))/CLOCKS_PER_SEC;
}

double better_multiplication(gsl_matrix *A, gsl_matrix *B, int N) {
    gsl_matrix *C = gsl_matrix_calloc(N,N);
    gsl_matrix_set_zero(C);
    time_t start = clock();
    for (int i = 0; i < N; i++) {
        for (int k = 0; k < N; k++) {
            for (int j = 0; j < N; j++) {
                int tmp = gsl_matrix_get(C, i, j) +gsl_matrix_get(A, i, k)*gsl_matrix_get(B, k, j);
                gsl_matrix_set(C, i, j, tmp);
            }
        }
    }
    printf("Better:\t%g s\n", ((double) (clock()-start))/CLOCKS_PER_SEC);
    return ((double) (clock()-start))/CLOCKS_PER_SEC;
}

double BLAS(gsl_matrix *A, gsl_matrix *B, int N) {
    gsl_matrix *C = gsl_matrix_calloc(N,N);
    gsl_matrix_set_zero(C);
    time_t start = clock();
    gsl_blas_dgemm(CblasNoTrans, CblasNoTrans, 1.0, A, B, 0.0, C);
    printf("BLAS:\t%g s\n", ((double) (clock()-start))/CLOCKS_PER_SEC);
    return ((double) (clock()-start))/CLOCKS_PER_SEC;
}

void gen(gsl_matrix *A, int N) {
    int RANGE = 1000;
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            gsl_matrix_set(A, i, j, (double)rand() / RAND_MAX * RANGE);
        }
    }
}

void test(gsl_matrix *A, gsl_matrix *B, int N, int R, char *file_name) {
    FILE *file = fopen(file_name, "w");
    fprintf(file, "Size,Naive,Better,BLAS\n");

    int max = N + 9*R;
    for (; N < max; N+=R) {
        gsl_matrix *A = gsl_matrix_calloc(N, N);
        gsl_matrix *B = gsl_matrix_calloc(N, N);
        gen(A, N);
        gen(B, N);
        printf("Test for size:\t %d\n", N);
        for (int i = 1; i <= 10; i++) {
            fprintf(file, "%d,%g,%g,%g\n", N, naive_multiplication(A, B, N), better_multiplication(A, B, N), BLAS(A, B, N));
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 4) return -1;
    char *file_name = argv[1];
    int N = atoi(argv[2]);
    int R = atoi(argv[3]);
    gsl_matrix *A = gsl_matrix_calloc(N, N);
    gsl_matrix *B = gsl_matrix_calloc(N, N);
    gen(A, N);
    gen(B, N);
    
    test(A, B, N, R, file_name);
}