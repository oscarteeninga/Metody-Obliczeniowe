all:

normal:
	gcc -Wall -I/usr/local/include -c matrixm.c -o matrixm.o
	gcc -L/usr/local/gsl matrixm.o -lgsl -lgslcblas -o matrixm
	rm -r matrixm.o 

optimal:
	gcc -Wall -O3 -I/usr/local/include -c matrixm.c -o matrixm.o
	gcc -L/usr/local/gsl matrixm.o -lgsl -lgslcblas -o matrixm
	rm -r matrixm.o 