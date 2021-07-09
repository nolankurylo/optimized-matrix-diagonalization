#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "tests.h"
#include <time.h>
#include <string.h>

#define MAX_CIRCLE_ANGLE (1<<11) //How many values we are dividing sin and cos to
#define HALF_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE / 2)
#define QUARTER_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE / 4)
#define MASK_MAX_CIRCLE_ANGLE (MAX_CIRCLE_ANGLE - 1)

int fast_cossin_table[MAX_CIRCLE_ANGLE];
int scaleFactor;
int scaleFactorV = 15;
int scaleFactorU =15;

int scaleFactorPowerP = 16;



int FloatToIntTruncate(float f)
{
    return (int)f;
}
/**
 * Fast sin computation using the fast cossin table
 * Works between pi and -pi
 * https://www.flipcode.com/archives/Fast_Trigonometry_Functions_Using_Lookup_Tables.shtml
 * @param n Input angle that is scaled by the scale factor
 * @paramscaleFactorScale scaleFactor for the problem space. If not using scale factor, use scale scaleFactor 1.
 */
static int fastsin(int n)
{
    
    int adjustedFactor = HALF_MAX_CIRCLE_ANGLE / scaleFactor;

    // printf("the adjusted scaleFactor is: %d", adjustedFactor);

    int i = (n >>4) / M_PI;
    printf("sin lookup index %d\n",i);

    if (i < 0)
    {
        // printf("sin: %d\n", fast_cossin_table[(-((-i) & MASK_MAX_CIRCLE_ANGLE)) + MAX_CIRCLE_ANGLE]);
        return fast_cossin_table[(-((-i) & MASK_MAX_CIRCLE_ANGLE)) + MAX_CIRCLE_ANGLE];
    }
    else
    {
        // printf("sin: %d\n", fast_cossin_table[i & MASK_MAX_CIRCLE_ANGLE]);
        return fast_cossin_table[i & MASK_MAX_CIRCLE_ANGLE];
    }
}

/**
 * Fast cos computation using the fast cossin table
 * https://www.flipcode.com/archives/Fast_Trigonometry_Functions_Using_Lookup_Tables.shtml
 * @param n Input angle that is scaled by the scale factor
 * @param scaleFactor Scale scaleFactor for the problem space. If not using scale factor, use scale scaleFactor 1.
 */
static int fastcos(int n)
{
    // int adjustedFactor = 14-11
    int i = (n >> 4) / M_PI;

    // printf("cos lookup index %d\n",i);

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
    int SF = (32768) / maxPow2;
    return SF;

}

int fastArcTan(float arg)
{
    int scale = (1<<15); // sf of 15 to move up to 16 bit width
    int x = arg * scale;
    int min = 0.5 * scale;
    int max = 1.0 * scale;

    int temp1 = (0.142 * scale);
    int temp2 = (0.644 * scale);
    int temp3 = (0.928 * scale);
    // printf("x is %d \n", x);
    // printf("min is %d \n", min);
    // printf("max is %d \n", max);
    int angle = 0;

    if (x > min && x <= max)
    {
        angle = ((temp2) * x) >> 16; // 32 back to 16 bit, sf 30 to 14
        angle += (temp1); // add 16 with 16 bit
        return angle;
    }

    else if (x >= -min && x <= min)
    {
        angle = (temp3) * x; // 32 bit
        // printf("angle: %d\n",angle);
        return angle >>16; // back to 16 bit, sf 30 to 14
    }

    else if (x < -min && x >= -max)
    {
        angle = ((temp2) * x) >>16; // 32 back to 16 bit, sf 30 to 14
        angle -= (temp1); // 16 - 16 bit
        // printf("angle: %d\n",angle);
        return angle;
    }
    else
    {
        printf("WE REALLY FUCKED IT THIS TIME\n");
    }
     //remove this after we figure out scaling
}

int newArctan(int x, int y) // return float value of arctan (currently not using scale factor)
{
    // printf("x is %d \n", x);
    // printf("y is %d \n", y);
    int angle = 0;
    float arg;
    int int_arg;
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
            angle = -(fastArcTan(arg) + ((int)(M_PI * (1<<13)))); //angle 16bit - shift 3 bit pi to 16 bit
        }
        else
        {
            angle = ((int)(M_PI * (1<<13))) - fastArcTan(arg);
            
        }
    }
    else
    {
        arg = (float)x / (float)y;
        // printf("Arg in second if is: %.2f\n", arg);
        angle = fastArcTan(arg);
    }
    printf("Angle is %f\n", (float)angle/(1<<14));
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

int getThetaSum(int subMatrix[2][2])
{
    int x = subMatrix[0][1] + subMatrix[1][0];
    int y = subMatrix[1][1] - subMatrix[0][0];
    int thetaSum = newArctan(x, y);
    return thetaSum;
}

int getThetaDiff(int subMatrix[2][2])
{

    int x = subMatrix[1][0] - subMatrix[0][1];
    int y = subMatrix[1][1] + subMatrix[0][0];
    // printf("x: %d, y: %d\n", x, y);
    int thetaDiff = newArctan(x, y);
    return thetaDiff;
}

void getLMatrix(int thetaL, int L[2][2])
{
    // Adjust this to assign to indexes that u pass in based on the loop to make V and U
    L[0][0] = fastcos(thetaL);
    L[0][1] = -fastsin(thetaL);
    L[1][0] = fastsin(thetaL);
    L[1][1] = fastcos(thetaL);
}

void getRMatrix(int thetaR, int R[2][2])
{
    // Adjust this to assign to indexes that u pass in based on the loop to make V and U
    R[0][0] = fastcos(thetaR);
    R[0][1] = -fastsin(thetaR);
    R[1][0] = fastsin(thetaR);
    R[1][1] = fastcos(thetaR);
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

void matrixMultiply(int X[4][4], int Y[4][4], int newM[4][4], int scale)
{
    // this is the "slow" method, can look into using arm NEON but that shit is cryptic as fuck
    // Will want to change this to 4x4 matrices to accomodate the V and U instead
    // int shiftFactor = log(scaleFactor) / log(2); // 2^7 -> shift scaleFactor is 7

    int temp1, temp2, temp3, temp4, tempSum;
    int n = 4; // for a nxn matrix

    // float floatScale = 1 / (float)scaleFactor;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            // printf("P_00: %d, ",X[i][0]* Y[0][j]);
            // printf("P_01: %d, ",X[i][1]* Y[1][j]);
            // printf("P_02: %d, ",X[i][2]* Y[2][j]);
            // printf("P_03: %d\n",X[i][3]* Y[3][j]);

            // 16 bit x 16 bit
            temp1 = (X[i][0]* Y[0][j] ) >> 2;
            temp2 = (X[i][1]* Y[1][j] ) >> 2;
            temp3 = (X[i][2]* Y[2][j] ) >> 2;
            temp4 = (X[i][3]* Y[3][j] ) >> 2;
            
            // for (int k = 0; k < n; k++)
            // {

            //     // newM[i][j] += X[i][k] * Y[k][j] / scaleFactor;
            //     newM[i][j] += (X[i][k]* Y[k][j] ) >> 2;
                
            // }
            tempSum = temp1 + temp2 + temp3+ temp4; // 32 bit number - 2 for error adjusted = 30 bit number
            // printf("Temp Sum: %d\n",tempSum);
            tempSum >>= 13; // at 28 bits, shift back to scale factor of 15 bits
            newM[i][j] = tempSum;
            
        }
    }

}
// i row_idx, j col_idx (i=0, j=1 for pair (1-2))
void sweep(int row_idx, int col_idx, int U[4][4], int V[4][4], int M[4][4])
{
    
    int i, j, k;
    int M_iteration[2][2];
    M_iteration[0][0] = M[row_idx][row_idx];
    M_iteration[0][1] = M[row_idx][col_idx];
    M_iteration[1][0] = M[col_idx][row_idx];
    M_iteration[1][1] = M[col_idx][col_idx];

    int thetaDiff = getThetaDiff(M_iteration); //sf 14

    int thetaSum = getThetaSum(M_iteration); //sf 14

    printf("thetaDiff = %d\n", thetaDiff);
    printf("thetaSum = %d\n", thetaSum);

    int thetaL = getThetaL(thetaSum, thetaDiff); //sf 14
    int thetaR = getThetaR(thetaSum, thetaDiff); //sf 14

    int R_iteration[2][2]; //Will want to make into U and 4x4
    int L_iteration[2][2];

    getLMatrix(thetaL, L_iteration); //sf 15
    getRMatrix(thetaR, R_iteration); //sf 15

    //Get rotation matrices
    int U_iteration[4][4];
    int V_iteration[4][4];
    gen_identity_matrix(U_iteration, 1<<15); //Will want to make into V and 4x4, scale up to 2^16
    gen_identity_matrix(V_iteration, 1<<15);
    U_iteration[row_idx][row_idx] = L_iteration[0][0];
    U_iteration[row_idx][col_idx] = L_iteration[0][1];
    U_iteration[col_idx][row_idx] = L_iteration[1][0];
    U_iteration[col_idx][col_idx] = L_iteration[1][1];
    V_iteration[row_idx][row_idx] = R_iteration[0][0];
    V_iteration[row_idx][col_idx] = R_iteration[0][1];
    V_iteration[col_idx][row_idx] = R_iteration[1][0];
    V_iteration[col_idx][col_idx] = R_iteration[1][1];

    // int minV = get_min_int(V_iteration);
    // int maxV = get_max_int(V_iteration);
    // scaleFactorV = calculateScaleFactor(minV, maxV);
    // printf("scalefactorV: %d\n", scaleFactorV);

    // int minU = get_min_int(U_iteration);
    // int maxU = get_max_int(U_iteration);
    // scaleFactorU = calculateScaleFactor(minU, maxU);
    // printf("scalefactorU: %d\n", scaleFactorU);

    // // Transpose_4x4(V);
    // printf("V iteration:\n");
    // print_matrix_int(V_iteration);
    
    int newV[4][4];
    matrixMultiply(V_iteration, V, newV, 1 ); // V_iteration

    
    scaleFactorV -= 3;
    printf("New Scale Factor V: %d\n", scaleFactorV);

    memcpy(V, newV, sizeof(newV));

    Transpose_4x4(V_iteration);

    int new_M_iteration[4][4];
    // printf("New M\n");
    matrixMultiply(U_iteration, M, new_M_iteration, 21); //
    matrixMultiply(new_M_iteration, V_iteration, M, 21);
    printf("\nNew M Iteration:\n");
    print_matrix_int(new_M_iteration);
    printf("\nV_iteration:\n");
    print_matrix_int(V_iteration);
    printf("\nM:\n");
    print_matrix_int(M);
    
    

    Transpose_4x4(U_iteration);
    int newU[4][4];
    matrixMultiply(U, U_iteration, newU, 21);
    memcpy(U, newU, sizeof(newU));
    // scaleFactor -= 19;
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
    scaleFactor = calculateScaleFactor(min, max);

    int i, j, k;
    for (i = 0; i < MAX_CIRCLE_ANGLE; i++)
    {
        fast_cossin_table[i] = (int)(sin((double)i * M_PI / HALF_MAX_CIRCLE_ANGLE) * (1<<15));
        // printf("cos values: %d\n", fast_cossin_table[i] );
    }

    int scaled_M[4][4];
    int scaled_U[4][4];
    int scaled_V[4][4];

    scale_matrix(M, scaled_M, scaleFactor);
    // scale_matrix(U, scaled_U, scaleFactor);
    // scale_matrix(V, scaled_V, scaleFactor);
    gen_identity_matrix(scaled_U, 1<<scaleFactorU);
    gen_identity_matrix(scaled_V, 1<<scaleFactorV);
    print_matrix_int(scaled_M);
    printf("min: %f, max: %f, conversion scaleFactor is: %d\n", min, max, scaleFactor);

    for (k = 0; k < 1; k++) // 5 sweeps
    {
    for (i = 0; i < 3; i++) // 4 rows
    {
        for (j = i + 1; j < 4; j++) // each column in the row
        {

            sweep(i, j, scaled_U, scaled_V, scaled_M);
            printf("M Scaled: \n");
            print_matrix_int(scaled_M);
            printf("V Scaled: \n");
            print_matrix_int(scaled_V);
            printf("\n\n");
            // printf("%d - %d\n", i + 1, j + 1);
        }
    }
    // Transpose_4x4(U);
    }

    un_scale_matrix(M, scaled_M, 8);
    un_scale_matrix(U, scaled_U,15);
    un_scale_matrix(V, scaled_V, 15);

    printf("\n\nM:\n");
    print_matrix(M);
    Transpose_4x4(V);
    printf("\n\nU:\n");
    print_matrix(U);
    printf("\n\nV:\n");
    print_matrix(V);

    // So this gets us the correct value for M but as seen in the documentation we are gona make L and R into V12 and U12.
    // Once we figure out the process for U and V, we should be just about ready to start the optimization.
}
