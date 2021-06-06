#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "tests.h"
#include <time.h>

#define MAX_CIRCLE_ANGLE 2048 //How many values we are dividing sin and cos to
#define HALF_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE / 2)
#define QUARTER_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE / 4)
#define MASK_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE - 1)
#define HALF_MAX_CIRCLE_ANGLE_DIV_PI (HALF_MAX_CIRCLE_ANGLE / M_PI)

float fast_cossin_table[MAX_CIRCLE_ANGLE];

float test_matrix[matrix_size][matrix_size];

int FloatToInt(float f)
{
    return (int)f;
}
/**
 * Fast sin computation using the fast cossin table
 * https://www.flipcode.com/archives/Fast_Trigonometry_Functions_Using_Lookup_Tables.shtml
 * 
 */
static float fastsin(float n)
{
    float f = n * HALF_MAX_CIRCLE_ANGLE / M_PI;
    int i = FloatToInt(f);

    if (i < 0)
    {
        return fast_cossin_table[(-((-i) & MASK_MAX_CIRCLE_ANGLE)) + MAX_CIRCLE_ANGLE];
    }
    else
    {
        return fast_cossin_table[i & MASK_MAX_CIRCLE_ANGLE];
    }
}

/**
 * Fast cos computation using the fast cossin table
 * https://www.flipcode.com/archives/Fast_Trigonometry_Functions_Using_Lookup_Tables.shtml
 */
static float fastcos(float n)
{
    float f = n * HALF_MAX_CIRCLE_ANGLE_DIV_PI;
    int i = FloatToInt(f);

    if (i < 0)
    {
        return fast_cossin_table[((-i) + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE];
    }
    else
    {
        return fast_cossin_table[(i + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE];
    }
}

static float arctan(float n)
{
    if (n > 0.5 && n < 1)
    {
    }
}

int calcConversionFactor(int min, int max)
{
    int closestPow2Min = pow(2, ceil(log(abs(min)) / log(2)));
    int closestPow2Max = pow(2, ceil(log(abs(max)) / log(2)));

    int maxPow2;

    if (closestPow2Min > closestPow2Max)
    {
        maxPow2 = closestPow2Min;
    }
    else
    {
        maxPow2 = closestPow2Max;
    }

    // Assuming 16 bit -> 2^16 - 1 = 2^15 = 32768
    int conversionFactor = (32768) / (maxPow2);

    return conversionFactor;
}

float fastArcTan(float arg, int factor)
{

    int x = arg * factor;
    int min = 0.5 * factor;
    int max = 1.0 * factor;

    printf("x: %d, min: %d, max: %d\n", x, min, max);
    float angle = 0;
    if (x > min && x <= max)
    {
        angle = ((int)(0.644 * factor)) * x + ((int)(0.142 * factor));
    }

    if (x >= -min && x <= min)
    {
        angle = ((int)(0.928 * factor)) * x;
    }

    if (x < -min && x >= -max)
    {
        angle = ((int)(0.644 * factor)) * x - ((int)(0.142 * factor));
    }

    return angle / (128 * 128); //remove this after we figure out scaling
}

float arctanFast(int x, int y, int factor) // return float value of arctan (currently not using scale factor)
{
    float angle;
    float arg;
    if (x > y)
    {
        arg = (float)y / (float)x;
        angle = fastArcTan(arg, factor);
    }
    else
    {
        arg = (float)x / (float)y;
        angle = M_PI / 2 - fastArcTan(arg, factor);
        ;
    }
}

float getThetaR(float thetaSum, float thetaDiff)
{
    // See page 8
    return 0;
}

float getThetaL(float thetaSum, float thetaDiff)
{

    //  see page 8

    return 0;
}

int main(int argc, char *argv[])
{

    long i;
    for (i = 0; i < MAX_CIRCLE_ANGLE; i++)
    {
        fast_cossin_table[i] = (float)sin((double)i * M_PI / HALF_MAX_CIRCLE_ANGLE);
    }

    gen_test_matrix();
    print_matrix();
    float min = get_min();
    float max = get_max();
    int conversionFactor = calcConversionFactor(min, max);
    printf("min: %f, max: %f, conversion factor is: %d\n", min, max, conversionFactor);

    float arctanTest = arctanFast(1, 2, conversionFactor);
    printf("arctan() = %.2f\n", arctanTest);
}
