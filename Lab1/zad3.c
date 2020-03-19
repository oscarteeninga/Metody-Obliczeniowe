#include <stdio.h>
#include <math.h>
#include <gsl/gsl_ieee_utils.h>

int main(void)
{
    float f = 1.0/pow(2, 125);
    double d = 1.0/pow(2, 1020);

    printf("%s\n", "Dla float32");
    for (int i = 0; f != 0.0; i++)
    {
        printf(" f=");
        gsl_ieee_printf_float(&f);
        printf("\n");

        f = f/2.0;
    }

    printf("%s\n", "Dla float64");
    for (int i = 0; d != 0.0; i++)
    {
        printf(" d=");
        gsl_ieee_printf_double(&d);
        printf("\n");

        d = d/2.0;
    }
    //Mantysa przestaje być znormalizowana w momencie osiągnięcia przez cechę wartości "00000000001"

    return 0;
}
