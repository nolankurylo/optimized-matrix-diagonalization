#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "tests.h"
#include <time.h>

#define MAX_CIRCLE_ANGLE 2048 //How many values we are dividing sin and cos to
#define HALF_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE / 2)
#define QUARTER_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE / 4)
#define MASK_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE - 1)

float fast_cossin_table[MAX_CIRCLE_ANGLE];

float test_matrix[matrix_size][matrix_size];

int FloatToIntTruncate(float f)
{
    return (int)f;
}
/**
 * Fast sin computation using the fast cossin table
 * Works between pi and -pi
 * https://www.flipcode.com/archives/Fast_Trigonometry_Functions_Using_Lookup_Tables.shtml
 * @param n Input angle that is scaled by the scale factor
 * @param factor Scale factor for the problem space. If not using scale factor, use scale factor 1.
 */
static float fastsin(float n, int factor)
{
    int adjustedFactor = HALF_MAX_CIRCLE_ANGLE / factor;

    printf("the adjusted factor is: %d", adjustedFactor);

    float f = n * adjustedFactor / M_PI;
    int i = FloatToIntTruncate(f);

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
 * @param n Input angle that is scaled by the scale factor
 * @param factor Scale factor for the problem space. If not using scale factor, use scale factor 1.
 */
static float fastcos(float n, int factor)
{
    int adjustedFactor = HALF_MAX_CIRCLE_ANGLE / factor;
    float f = n * adjustedFactor / M_PI;
    int i = FloatToIntTruncate(f);

    if (i < 0)
    {
        return fast_cossin_table[((-i) + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE];
    }
    else
    {
        return fast_cossin_table[(i + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE];
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

    // printf("x is %d \n", x);
    // printf("min is %d \n", min);
    // printf("max is %d \n", max);
    float angle = 0;
    if (x > min && x <= max)
    {
        angle = ((int)(0.644 * factor)) * x + ((int)(0.142 * factor));
    }

    else if (x >= -min && x <= min)
    {
        angle = ((int)(0.928 * factor)) * x;
    }

    else if (x < -min && x >= -max)
    {
        angle = ((int)(0.644 * factor)) * x - ((int)(0.142 * factor));
    }
    else
    {
        printf("edge\n", angle);
    }

    return angle / (factor * factor); //remove this after we figure out scaling
}

float newArctan(float x, float y, int factor) // return float value of arctan (currently not using scale factor)
{
    float angle = 0;
    float arg;
    x = 0.4;
    y = -0.1;
    float abs_x = x;
    float abs_y = y;
    if (x < 0)
    {
        abs_x = x * -1;
    }
    if (y < 0)
    {
        abs_y = y * -1;
    }

    printf("x/y should be: %.2f\n", x / y);

    // x = 4;
    // y = -2;
    if (abs_x > abs_y)
    {

        arg = y / x;

        printf("Arg in first if is: %.2f\n", arg);
        if (arg < 0)
        {
            angle = -(fastArcTan(arg, factor) + (M_PI / 2));
        }
        else
        {
            angle = (M_PI / 2) - fastArcTan(arg, factor);
        }
    }
    else
    {
        arg = x / y;
        printf("Arg in second if is: %.2f\n", arg);
        angle = fastArcTan(arg, factor);
    }
    printf("Angle is %.2f\n", angle);

    return angle;
}

float getThetaR(float thetaSum, float thetaDiff)
{
    float thetaR2 = thetaSum + thetaDiff;

    return thetaR2 / 2;
}

float getThetaL(float thetaSum, float thetaDiff)
{

    float thetaL2 = thetaSum - thetaDiff;

    return thetaL2 / 2;
}

float getThetaSum(float subMatrix[4][4], int conversionFactor)
{
    float x = subMatrix[0][1] + subMatrix[1][0];
    float y = subMatrix[1][1] - subMatrix[0][0];
    float thetaSum = newArctan(x, y, conversionFactor);
    return thetaSum;
}

float getThetaDiff(float subMatrix[4][4], int conversionFactor)
{

    float x = subMatrix[1][0] - subMatrix[0][1];
    float y = subMatrix[1][1] + subMatrix[0][0];

    float thetaDiff = newArctan(x, y, conversionFactor);
    printf("diff = %.2f\n", thetaDiff);
    return thetaDiff;
}

int main(int argc, char *argv[])
{

    long i;
    for (i = 0; i < MAX_CIRCLE_ANGLE; i++)
    {
        fast_cossin_table[i] = (float)sin((double)i * M_PI / HALF_MAX_CIRCLE_ANGLE);
    }

    print_matrix();
    float min = get_min();
    float max = get_max();
    int conversionFactor = calcConversionFactor(min, max);
    printf("min: %f, max: %f, conversion factor is: %d\n", min, max, conversionFactor);

    float thetaDiff = getThetaDiff(test_matrix, conversionFactor);
    float thetaSum = getThetaSum(test_matrix, conversionFactor);
    float L = getThetaL(thetaSum, thetaDiff);
    float R = getThetaR(thetaSum, thetaDiff);

    printf("Sum = %.2f, Diff= %.2f\n", thetaSum, thetaDiff);
    printf("L = %.2f, R= %.2f\n", L, R);
}
