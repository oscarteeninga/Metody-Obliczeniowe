all:
	gcc -Wall -I/usr/local/include -c blas.c -o blas.o
	gcc -L/usr/local/gsl blas.o -lgsl -lgslcblas -o blas
	rm -r blas.o 