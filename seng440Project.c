#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "tests.h"
#include <time.h>
#include <string.h>

#define MAX_CIRCLE_ANGLE 2048 //How many values we are dividing sin and cos to
#define HALF_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE / 2)
#define QUARTER_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE / 4)
#define MASK_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE - 1)

int fast_cossin_table[MAX_CIRCLE_ANGLE];

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
static int fastsin(int n, int factor)
{
    int adjustedFactor = HALF_MAX_CIRCLE_ANGLE / factor;

    // printf("the adjusted factor is: %d", adjustedFactor);

    int i = n * adjustedFactor / M_PI;

    if (i < 0)
    {
        // printf("sin of %d: %d\n", n, fast_cossin_table[(-((-i) & MASK_MAX_CIRCLE_ANGLE)) + MAX_CIRCLE_ANGLE]);
        return fast_cossin_table[(-((-i) & MASK_MAX_CIRCLE_ANGLE)) + MAX_CIRCLE_ANGLE];
    }
    else
    {
        // printf("sin of %d: %d\n", n, fast_cossin_table[i & MASK_MAX_CIRCLE_ANGLE]);
        return fast_cossin_table[i & MASK_MAX_CIRCLE_ANGLE];
    }
}

/**
 * Fast cos computation using the fast cossin table
 * https://www.flipcode.com/archives/Fast_Trigonometry_Functions_Using_Lookup_Tables.shtml
 * @param n Input angle that is scaled by the scale factor
 * @param factor Scale factor for the problem space. If not using scale factor, use scale factor 1.
 */
static int fastcos(int n, int factor)
{
    int adjustedFactor = HALF_MAX_CIRCLE_ANGLE / factor;
    int i = n * adjustedFactor / M_PI;

    if (i < 0)
    {
        // printf("cos of %d: %d\n", n, fast_cossin_table[((-i) + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE]);
        return fast_cossin_table[((-i) + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE];
    }
    else
    {

        // printf("cos of %d: %d\n", n, fast_cossin_table[(i + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE]);
        return fast_cossin_table[(i + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE];
    }
}

int calculateScaleFactor(int min, int max)
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

    // Assuming 16 bit -> 2^16 - 1 = 2^15 = 32768 --> SFx =  2^15 / 2^x where x is max pow of 2
    int scaleFactor = (32768) / maxPow2;

    return scaleFactor;
}

int fastArcTan(float arg, int factor)
{

    int x = arg * factor;
    int min = 0.5 * factor;
    int max = 1.0 * factor;

    // printf("x is %d \n", x);
    // printf("min is %d \n", min);
    // printf("max is %d \n", max);
    int angle = 0;
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
        printf("WE REALLY FUCKED IT THIS TIME\n", angle);
    }

    return angle / (factor); //remove this after we figure out scaling
}

int newArctan(int x, int y, int factor) // return float value of arctan (currently not using scale factor)
{
    // printf("x is %d \n", x);
    // printf("y is %d \n", y);
    int angle = 0;
    float arg;
    // x = 0.4;
    // y = -0.1;
    int abs_x = x;
    int abs_y = y;
    if (x < 0)
    {
        abs_x = x * -1;
    }
    if (y < 0)
    {
        abs_y = y * -1;
    }

    // printf("x/y should be: %.2f\n", x / y);

    // x = 4;
    // y = -2;
    if (abs_x > abs_y)
    {

        arg = (float)y / (float)x;

        // printf("Arg in first if is: %.2f\n", arg);
        if (arg < 0)
        {
            angle = -(fastArcTan(arg, factor) + ((int)(M_PI * factor) >> 1));
        }
        else
        {
            angle = ((int)(M_PI * factor) >> 1) - fastArcTan(arg, factor);
        }
    }
    else
    {
        arg = (float)x / (float)y;
        // printf("Arg in second if is: %.2f\n", arg);
        angle = fastArcTan(arg, factor);
    }
    // printf("Angle is %.2f\n", angle);

    return angle;
}

int getThetaR(int thetaSum, int thetaDiff)
{
    int thetaR2 = thetaSum + thetaDiff;

    return thetaR2 >> 1;
}

int getThetaL(int thetaSum, int thetaDiff)
{

    int thetaL2 = thetaSum - thetaDiff;

    return thetaL2 >> 1;
}

int getThetaSum(int subMatrix[2][2], int scaleFactor)
{
    int x = subMatrix[0][1] + subMatrix[1][0];
    int y = subMatrix[1][1] - subMatrix[0][0];
    int thetaSum = newArctan(x, y, scaleFactor);
    return thetaSum;
}

int getThetaDiff(int subMatrix[2][2], int scaleFactor)
{

    int x = subMatrix[1][0] - subMatrix[0][1];
    int y = subMatrix[1][1] + subMatrix[0][0];
    // printf("x: %d, y: %d\n", x, y);
    int thetaDiff = newArctan(x, y, scaleFactor);
    return thetaDiff;
}

void getLMatrix(int thetaL, int L[2][2], int scaleFactor)
{
    // Adjust this to assign to indexes that u pass in based on the loop to make V and U
    L[0][0] = fastcos(thetaL, scaleFactor);
    L[0][1] = -fastsin(thetaL, scaleFactor);
    L[1][0] = fastsin(thetaL, scaleFactor);
    L[1][1] = fastcos(thetaL, scaleFactor);
}

void getRMatrix(int thetaR, int R[2][2], int scaleFactor)
{
    // Adjust this to assign to indexes that u pass in based on the loop to make V and U
    R[0][0] = fastcos(thetaR, scaleFactor);
    R[0][1] = -fastsin(thetaR, scaleFactor);
    R[1][0] = fastsin(thetaR, scaleFactor);
    R[1][1] = fastcos(thetaR, scaleFactor);
}

void Transpose_4x4(int matrix[4][4])
{
    int transpose[4][4];
    for (int i = 0; i < 4; ++i)
        for (int j = 0; j < 4; ++j)
        {
            transpose[j][i] = matrix[i][j];
        }
    memcpy(matrix, transpose, sizeof(transpose));
}

void Transpos_2x2(int matrix[2][2])
{
    int transpose[2][2];
    for (int i = 0; i < 2; ++i)
        for (int j = 0; j < 2; ++j)
        {
            transpose[j][i] = matrix[i][j];
        }

    memcpy(matrix, transpose, sizeof(transpose));
}

void matrixMultiply(int X[4][4], int Y[4][4], int newM[4][4], int scaleFactor)
{
    // this is the "slow" method, can look into using arm NEON but that shit is cryptic as fuck
    // Will want to change this to 4x4 matrices to accomodate the V and U instead
    // int shiftFactor = log(scaleFactor) / log(2); // 2^7 -> shift factor is 7

    int temp;
    int n = 4; // for a nxn matrix

    // float floatScale = 1 / (float)scaleFactor;

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            newM[i][j] = 0;
            for (int k = 0; k < n; k++)
            {
                // newM[i][j] += X[i][k] * Y[k][j] / scaleFactor;
                temp = round(X[i][k] * Y[k][j] / scaleFactor);
                newM[i][j] += temp;
            }
        }
    }
}
// i row_idx, j col_idx (i=0, j=1 for pair (1-2))
void sweep(int row_idx, int col_idx, int scaleFactor, int U[4][4], int V[4][4], int M[4][4])
{

    int i, j, k;
    int M_iteration[2][2];
    M_iteration[0][0] = M[row_idx][row_idx];
    M_iteration[0][1] = M[row_idx][col_idx];
    M_iteration[1][0] = M[col_idx][row_idx];
    M_iteration[1][1] = M[col_idx][col_idx];

    int thetaDiff = getThetaDiff(M_iteration, scaleFactor);

    int thetaSum = getThetaSum(M_iteration, scaleFactor);

    int thetaL = getThetaL(thetaSum, thetaDiff);
    int thetaR = getThetaR(thetaSum, thetaDiff);

    int R_iteration[2][2]; //Will want to make into U and 4x4
    int L_iteration[2][2];

    getLMatrix(thetaL, L_iteration, scaleFactor);
    getRMatrix(thetaR, R_iteration, scaleFactor);

    //Get rotation matrices
    int U_iteration[4][4];
    int V_iteration[4][4];
    gen_identity_matrix(U_iteration, scaleFactor); //Will want to make into V and 4x4
    gen_identity_matrix(V_iteration, scaleFactor);
    U_iteration[row_idx][row_idx] = L_iteration[0][0];
    U_iteration[row_idx][col_idx] = L_iteration[0][1];
    U_iteration[col_idx][row_idx] = L_iteration[1][0];
    U_iteration[col_idx][col_idx] = L_iteration[1][1];
    V_iteration[row_idx][row_idx] = R_iteration[0][0];
    V_iteration[row_idx][col_idx] = R_iteration[0][1];
    V_iteration[col_idx][row_idx] = R_iteration[1][0];
    V_iteration[col_idx][col_idx] = R_iteration[1][1];

    // Transpose_4x4(V);
    int newV[4][4];
    matrixMultiply(V_iteration, V, newV, scaleFactor);

    memcpy(V, newV, sizeof(newV));

    Transpose_4x4(V_iteration);

    int new_M_iteration[4][4];
    matrixMultiply(U_iteration, M, new_M_iteration, scaleFactor);
    matrixMultiply(new_M_iteration, V_iteration, M, scaleFactor);

    printf("New M\n");
    print_matrix_int(M);

    Transpose_4x4(U_iteration);
    int newU[4][4];
    matrixMultiply(U, U_iteration, newU, scaleFactor);
    memcpy(U, newU, sizeof(newU));
}

int main(int argc, char *argv[])
{

    float U[4][4];
    float V[4][4];
    float M[4][4];
    float orginalM[4][4];
    //Will want to make into V and 4x4

    gen_M_matrix(M);
    memcpy(orginalM, M, sizeof(M));
    print_matrix(orginalM);

    float min = get_min(M);
    float max = get_max(M);
    int scaleFactor = calculateScaleFactor(min, max);

    int i, j, k;
    for (i = 0; i < MAX_CIRCLE_ANGLE; i++)
    {
        fast_cossin_table[i] = (int)(sin((double)i * M_PI / HALF_MAX_CIRCLE_ANGLE) * scaleFactor);
    }

    int scaled_M[4][4];
    int scaled_U[4][4];
    int scaled_V[4][4];

    scale_matrix(M, scaled_M, scaleFactor);
    // scale_matrix(U, scaled_U, scaleFactor);
    // scale_matrix(V, scaled_V, scaleFactor);
    gen_identity_matrix(scaled_U, scaleFactor);
    gen_identity_matrix(scaled_V, scaleFactor);
    print_matrix_int(scaled_M);
    printf("min: %f, max: %f, conversion factor is: %d\n", min, max, scaleFactor);

    // for (k = 0; k < 16; k++) // 5 sweeps
    // {
    for (i = 0; i < 3; i++) // 4 rows
    {
        for (j = i + 1; j < 4; j++) // each column in the row
        {

            sweep(i, j, scaleFactor, scaled_U, scaled_V, scaled_M);
            printf("M Scaled: \n");
            print_matrix_int(scaled_M);
            printf("\n\n");
            // printf("%d - %d\n", i + 1, j + 1);
        }
    }
    // Transpose_4x4(U);
    // }

    un_scale_matrix(M, scaled_M, scaleFactor);
    un_scale_matrix(U, scaled_U, scaleFactor);
    un_scale_matrix(V, scaled_V, scaleFactor);

    printf("\n\nM:\n");
    print_matrix(M);
    // Transpose_4x4(V);
    printf("\n\nU:\n");
    print_matrix(U);
    printf("\n\nV:\n");
    print_matrix(V);

    // So this gets us the correct value for M but as seen in the documentation we are gona make L and R into V12 and U12.
    // Once we figure out the process for U and V, we should be just about ready to start the optimization.
}
