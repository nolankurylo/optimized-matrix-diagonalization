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


/**
 * Fast sin computation using the fast cossin table
 * Works between pi and -pi
 * https://www.flipcode.com/archives/Fast_Trigonometry_Functions_Using_Lookup_Tables.shtml
 * @param n Input angle that is scaled by the scale factor
 * @paramscaleFactorScale scaleFactor for the problem space. If not using scale factor, use scale scaleFactor 1.
 */
static int fastsin(int n)
{


    int i = (n >>4) / M_PI; //scale down to a value within the bin range

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
 * @param scaleFactor Scale scaleFactor for the problem space. If not using scale factor, use scale scaleFactor 1.
 */
static int fastcos(int n)
{
    int i = (n >> 4) / M_PI; //scale down to a value within the bin range

    if (i < 0)
    {
        return fast_cossin_table[((-i) + QUARTER_MAX_CIRCLE_ANGLE) & MASK_MAX_CIRCLE_ANGLE];
    }
    else
    {
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
    int SF = (32768) / maxPow2;
    return SF;

}

int fastArcTan(float arg)
{
    int scale = (1<<15); // sf of 15 to move up to 16 bit width
    int x = arg * scale;
    int min = round(0.5 * scale);
    int max = 1.0 * scale;

    int temp1 = round(0.142 * scale);
    int temp2 = round(0.644 * scale);
    int temp3 = round(0.928 * scale);
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
        return angle >>16; // back to 16 bit, sf 30 to 14
    }

    else if (x < -min && x >= -max)
    {
        angle = ((temp2) * x) >>16; // 32 back to 16 bit, sf 30 to 14
        angle -= (temp1); // 16 - 16 bit
        return angle;
    }
    else
    {
        return 0; // error -> should never hit this else
    }
     //remove this after we figure out scaling
}

int newArctan(int x, int y) // return float value of arctan (currently not using scale factor)
{
    int angle = 0;
    float arg;
    int int_arg;
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
    if (abs_x > abs_y)
    {

        arg = (float)y / (float)x;
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
        angle = fastArcTan(arg);
    }
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

void matrixMultiply(int X[4][4], int Y[4][4], int newM[4][4])
{

    int col1, col2, col3, col4, colSum;
    int n = 4; // for a 4x4 matrix

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {

            // 16 bit x 16 bit
            col1 = (X[i][0]* Y[0][j] ) >> 2; // shift right 2 for worst case of 4 additions
            col2 = (X[i][1]* Y[1][j] ) >> 2;
            col3 = (X[i][2]* Y[2][j] ) >> 2;
            col4 = (X[i][3]* Y[3][j] ) >> 2;
            
            colSum = col1 + col2 + col3+ col4; // 32 bit number - 2 worst-case adjustment = 30 bit number - SF = 
            colSum >>= 13; // at 28 bits, shift back to scale factor of 15 bits
            newM[i][j] = tempSum;
            
        }
    }

}
// i row_idx, j col_idx (i=0, j=1 for pair (1-2))
void sweep(int row_idx, int col_idx, int U[4][4], int V[4][4], int M[4][4])
{
    
    int i, j, k;

    //Get 2x2 Matrix of M for current iteration of i and j
    int M_iteration[2][2];
    M_iteration[0][0] = M[row_idx][row_idx];
    M_iteration[0][1] = M[row_idx][col_idx];
    M_iteration[1][0] = M[col_idx][row_idx];
    M_iteration[1][1] = M[col_idx][col_idx];

    //Get θsum and θdiff for current iteration of i and j
    int thetaDiff = getThetaDiff(M_iteration); //sf 14
    int thetaSum = getThetaSum(M_iteration); //sf 14

    //Get left and right rotation angles for current iteration of i and j
    int thetaL = getThetaL(thetaSum, thetaDiff); //sf 14
    int thetaR = getThetaR(thetaSum, thetaDiff); //sf 14

    //Get left and right rotation matrices for current iteration of i and j
    int R_iteration[2][2]; //Will want to make into U and 4x4
    int L_iteration[2][2];
    getLMatrix(thetaL, L_iteration); //sf 15
    getRMatrix(thetaR, R_iteration); //sf 15

    
    int U_iteration[4][4];
    gen_identity_matrix(U_iteration, 1<<15); // scaled up to 2^16 bit width
    //U_i,j -> U_iteration - identity matrix
    U_iteration[row_idx][row_idx] = L_iteration[0][0]; 
    U_iteration[row_idx][col_idx] = L_iteration[0][1];
    U_iteration[col_idx][row_idx] = L_iteration[1][0];
    U_iteration[col_idx][col_idx] = L_iteration[1][1];

    //V_i,j -> V_iteration - identity matrix
    int V_iteration[4][4];
    gen_identity_matrix(V_iteration, 1<<15); // scaled up to 2^16 bit width
    V_iteration[row_idx][row_idx] = R_iteration[0][0];
    V_iteration[row_idx][col_idx] = R_iteration[0][1];
    V_iteration[col_idx][row_idx] = R_iteration[1][0];
    V_iteration[col_idx][col_idx] = R_iteration[1][1];
    
    // Update V
    int V_prime[4][4];
    matrixMultiply(V_iteration, V, V_prime); // V' = V_iteration & V
    memcpy(V, V_prime, sizeof(V_prime)); // V = V'
    Transpose_4x4(V_iteration); // V_interation^T

    // Update M
    int M_prime[4][4];
    matrixMultiply(U_iteration, M, M_prime); // M' = U_iteration * M * V_iteration^T
    matrixMultiply(M_prime, V_iteration, M); // M = M'
    
    // Update U
    int U_prime[4][4];
    Transpose_4x4(U_iteration); // U_iteration^T
    matrixMultiply(U, U_iteration, U_prime); // U' = U * U_iteration^T
    memcpy(U, U_prime, sizeof(U_prime)); // U = U'
}

int main(int argc, char *argv[])
{

    float U[4][4];
    float V[4][4];
    float M[4][4];
    float orginalM[4][4];
    //Will want to make into V and 4x4

    // Generate the M matrix and save a copy in originalM
    gen_M_matrix(M);
    memcpy(orginalM, M, sizeof(M));

    printf("\nOriginal Matrix\n");
    print_matrix(orginalM);

    //Get scale factor of the generated matrix
    float min = get_min(M);
    float max = get_max(M);
    scaleFactor = calculateScaleFactor(min, max); // 2^8

    int i, j, k;

    //Populate the cossin lookup table, will populate 2048 bins with 2^15 scale factor values.
    for (i = 0; i < MAX_CIRCLE_ANGLE; i++)
    {
        fast_cossin_table[i] = (int)(sin((double)i * M_PI / HALF_MAX_CIRCLE_ANGLE) * (1<<15));
    }

    int scaled_M[4][4];
    int scaled_U[4][4];
    int scaled_V[4][4];

    scale_matrix(M, scaled_M, scaleFactor);
    gen_identity_matrix(scaled_U, 1<<15);
    gen_identity_matrix(scaled_V, 1<<15);
  
    //The main loop. This is the implementation of the Cyclical Jacobi Method.
    for (k = 0; k < 5; k++) // 5 sweeps
    {
        for (i = 0; i < 3; i++) // 4 rows
        {
            for (j = i + 1; j < 4; j++) // each column in the row
            {
                sweep(i, j, scaled_U, scaled_V, scaled_M);
            }
        }
    }
    
    Transpose_4x4(scaled_V);

    un_scale_matrix(M, scaled_M, 8); // SF = 2^8
    un_scale_matrix(U, scaled_U, 15); // SF = 2^15
    un_scale_matrix(V, scaled_V, 15); // SF = 2^15

    printf("\n\nFinal M:\n");
    
    print_matrix(M);
    printf("\n\nFinal U:\n");

    print_matrix(U);
    printf("\n\nFinal V:\n");
    print_matrix(V);
}
