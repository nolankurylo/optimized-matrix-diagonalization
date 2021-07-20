#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define matrix_size 4
#define subset_matrix_size 2
#define COSSIN_BINS (1 << 11) //How many values we are dividing sin and cos to
#define HALF_COSSIN_BINS (COSSIN_BINS >> 1)
#define QUARTER_COSSIN_BINS (COSSIN_BINS >> 2)
#define MASK_COSSIN_BINS (COSSIN_BINS - 1)
#define M_PI 3.14159265358979323846
#define OVER_PI 1 / M_PI // operator strength reduction

int fast_cossin_table[COSSIN_BINS];

/**
 * Matrix M initilization
 * @param M matrix with size 4x4
 */
void gen_M_matrix(float M[matrix_size][matrix_size])
{
    M[0][0] = 31;
    M[0][1] = 77;
    M[0][2] = -11;
    M[0][3] = 26;
    M[1][0] = -42;
    M[1][1] = 14;
    M[1][2] = 79;
    M[1][3] = -53;
    M[2][0] = -68;
    M[2][1] = -10;
    M[2][2] = 45;
    M[2][3] = 90;
    M[3][0] = 34;
    M[3][1] = 16;
    M[3][2] = 38;
    M[3][3] = -19;
}

/**
 * Indentity matrix initilization
 * @param identity matrix with size 4x4 to be filled
 * @param scaleFactor factor to scale diagonal elements by
 */
void gen_identity_matrix(int identity[matrix_size][matrix_size], int scaleFactor)
{
    int i, j;

    for (i ^= i; !(i & matrix_size); i++)
    {
        for (j ^= j; !(j & matrix_size); j++)
        {
            if (j == i)
            {
                identity[j][i] = scaleFactor; // diagonal elements are 1 x scaleFactor
            }
            else
            {
                identity[j][i] = 0;
            }
        }
    }
}

/**
 * Converts a floating point type matrix to an integer type matrix via a scaleFactor
 * @param float_matrix floating point matrix with size 4x4 to be scaled up
 * @param int_matrix integer matrix with size 4x4 to be filled 
 * @param scaleFactor factor to scale diagonal elements by
 */
void scale_matrix(float float_matrix[matrix_size][matrix_size], int int_matrix[matrix_size][matrix_size], int scaleFactor)
{

    int i, j;
    for (i ^= i; !(i & matrix_size); i++)
    {
        for (j ^= j; !(j & matrix_size); j++)
        {
            int_matrix[i][j] = round(scaleFactor * float_matrix[i][j]); // rounding to nearest integer for fixed point arithmetic
        }
    }
}

/**
 * Converts an integer type matrix to a floating point type matrix via a scaleFactor
 * @param float_matrix floating point matrix with size 4x4 to be filled
 * @param int_matrix integer matrix with size 4x4 to be scaled down
 * @param scalePower power of 2 to unscale by based on the updated value of the scaleFactor
 */
void un_scale_matrix(float float_matrix[matrix_size][matrix_size], int int_matrix[matrix_size][matrix_size], int scalePower)
{
    register int i, j;

    float scale = 1 / (float)(1 << scalePower); // operator strength reduction

    for (i ^= i; !(i & matrix_size); i++)
    {
        for (j ^= j; !(j & matrix_size); j++)
        {
            float_matrix[i][j] = (float)int_matrix[i][j] * scale;
        }
    }
}

/**
 * Outputs the contents of a 4x4 matrix to the console in floating-point
 * @param print_M matrix to be parsed
 */
void print_matrix(float print_M[matrix_size][matrix_size])
{
    register int i, j;
    for (i ^= i; !(i & matrix_size); i++)
    {
        for (j ^= j; !(j & matrix_size); j++)
        {
            printf("%f ", print_M[i][j]);
            if (j == matrix_size - 1)
            {
                printf("\n");
            }
        }
    }
}

/**
 * Outputs the contents of a 4x4 matrix to the console in integer
 * @param print_M matrix to be parsed
 */
void print_matrix_int(int print_M[matrix_size][matrix_size])
{
    register int i, j;
    for (i ^= i; !(i & matrix_size); i++)
    {
        for (j ^= j; !(j & matrix_size); j++)
        {
            printf("%d ", print_M[i][j]);
            if (j == matrix_size - 1)
            {
                printf("\n");
            }
        }
    }
    printf("\n");
}

/**
 * Approximates the value of sin(x) using an integer look-up table
 * @param n value that can be scaled to the correct index of the look-up table
 */
int fastsin(int n)
{

    int i = (n >> 4) * OVER_PI; //scale down to a value within the bin range

    if (i < 0)
    {
        return fast_cossin_table[(-((-i) & MASK_COSSIN_BINS)) + COSSIN_BINS];
    }
    else
    {
        return fast_cossin_table[i & MASK_COSSIN_BINS];
    }
}

/**
 * Approximates the value of cos(x) using an integer look-up table
 * @param n value that can be scaled to the correct index of the look-up table
 */
int fastcos(int n)
{
    int i = (n >> 4) * OVER_PI; //scale down to a value within the bin range

    if (i < 0)
    {
        return fast_cossin_table[((-i) + QUARTER_COSSIN_BINS) & MASK_COSSIN_BINS];
    }
    else
    {
        return fast_cossin_table[(i + QUARTER_COSSIN_BINS) & MASK_COSSIN_BINS];
    }
}


/**
 * Computes linear piecewise approximation for arctangent function
 * @param arg value of argument x in arctan(x)
 */
int piecewiseLinearApprox(float arg)
{
    int scale = (1 << 15); // sf of 15 to move up to 16 bit width
    int x = arg * scale;
    int min = round(0.5 * scale);
    int max = 1.0 * scale;

    int temp1 = round(0.142 * scale); // changhe name of these?
    int temp2 = round(0.644 * scale);
    int temp3 = round(0.928 * scale);
    int angle = 0;

    if (x > min && x <= max)
    {
        angle = ((temp2)*x) >> 16; // 32 back to 16 bit, sf 30 to 14
        angle += (temp1);          // add 16 with 16 bit
        return angle;
    }

    else if (x >= -min && x <= min)
    {
        angle = (temp3)*x;  // 32 bit
        return angle >> 16; // back to 16 bit, sf 30 to 14
    }

    else if (x < -min && x >= -max)
    {
        angle = ((temp2)*x) >> 16; // 32 back to 16 bit, sf 30 to 14
        angle -= (temp1);          // 16 - 16 bit
        return angle;
    }
    else
    {
        return 0; // error -> should never hit this else
    }
}

/**
 * Identifies and computes the arctananget eqaution based on x and y coordinates 
 * @param x coordinate
 * @param y coordinate
 */
int fastArcTan(int x, int y)
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
            angle = -(piecewiseLinearApprox(arg) + ((int)(M_PI * (1 << 13)))); //angle 16bit - shift 3 bit pi to 16 bit
        }
        else
        {
            angle = ((int)(M_PI * (1 << 13))) - piecewiseLinearApprox(arg);
        }
    }
    else
    {
        arg = (float)x / (float)y;
        angle = piecewiseLinearApprox(arg);
    }
    return angle;
}
/** 
 * Computes theta R using thetaDiff and thetaSum
 * @param thetaSum Theta sum is the sumation of theta R and theta L
 * @param thetaDiff Theta sum is the difference between theta R and theta L
 * 
*/
int getThetaR(int thetaSum, int thetaDiff)
{
    int thetaR2 = thetaSum + thetaDiff;

    return thetaR2 >> 1;
}

/** 
 * Computes theta L using thetaDiff and thetaSum
 * @param thetaSum Theta sum is the sumation of theta R and theta L
 * @param thetaDiff Theta sum is the difference between theta R and theta L
 * 
*/
int getThetaL(int thetaSum, int thetaDiff)
{

    // add	r0, r0, r1
    // asr	r0, r0, #1

    // int thetaL2;
    // __asm__ (
    //     "sub %0, %1, %2\n\t"
    //     "asr %0, %0, #1\n\t"
    //     : "=r" (thetaL2)
    //     : "r" (thetaSum) ,"r" (thetaDiff)
    //     );
    // return thetaL2;

    int thetaL2 = thetaSum - thetaDiff;
    return thetaL2 >> 1;
}

/** 
 * Get theta sum from the current iteration values
 * @param subMatrix a 2x2 matrix with the values of the current iteration 
 * 
*/
int getThetaSum(int subMatrix[subset_matrix_size][subset_matrix_size])
{
    int x = subMatrix[0][1] + subMatrix[1][0];
    int y = subMatrix[1][1] - subMatrix[0][0];
    int thetaSum = fastArcTan(x, y);
    return thetaSum;
}

/** 
 * Get theta diff from the current iteration values
 * @param subMatrix a 2x2 matrix with the values of the current iteration 
 * 
*/
int getThetaDiff(int subMatrix[subset_matrix_size][subset_matrix_size])
{

    int x = subMatrix[1][0] - subMatrix[0][1];
    int y = subMatrix[1][1] + subMatrix[0][0];
    int thetaDiff = fastArcTan(x, y);
    return thetaDiff;
}

/** 
 * Get the left 2x2 matrix to multiply into M and U
 * @param thetaL the angle associated with the values of the left matrix
 * @param L the left matrix to assign the computed sin and cos values to
 * 
*/
void getLMatrix(int thetaL, int L[subset_matrix_size][subset_matrix_size])
{
    L[0][0] = fastcos(thetaL);
    L[0][1] = -fastsin(thetaL);
    L[1][0] = fastsin(thetaL);
    L[1][1] = fastcos(thetaL);
}

/** 
 * Get the left 2x2 matrix to multiply into M and U
 * @param thetaR the angle associated with the values of the left matrix
 * @param R the left matrix to assign the computed sin and cos values to
 * 
*/
void getRMatrix(int thetaR, int R[subset_matrix_size][subset_matrix_size])
{
    R[0][0] = fastcos(thetaR);
    R[0][1] = -fastsin(thetaR);
    R[1][0] = fastsin(thetaR);
    R[1][1] = fastcos(thetaR);
}

void Transpose_4x4(int matrix[matrix_size][matrix_size])
{
    int transpose[matrix_size][matrix_size];
    register int i, j;
    for (i ^= i; !(i & matrix_size); i++)
    {
        for (j ^= j; !(j & matrix_size); j += 2) // Loop unrolling
        {
            transpose[j][i] = matrix[i][j];
            transpose[j + 1][i] = matrix[i][j + 1];
        }
    }
    memcpy(matrix, transpose, sizeof(transpose));
}

void Transpos_2x2(int matrix[subset_matrix_size][matrix_size])
{
    int transpose[subset_matrix_size][subset_matrix_size];
    register int i, j;
    for (i ^= i; !(i & subset_matrix_size); i++)
        for (j ^= j; !(j & subset_matrix_size); j += 2) // Loop unrolling
        {
            transpose[j][i] = matrix[i][j];
            transpose[j + 1][i] = matrix[i][j + 1];
        }

    memcpy(matrix, transpose, sizeof(transpose));
}

void matrixMultiply(int X[matrix_size][matrix_size], int Y[matrix_size][matrix_size], int newM[matrix_size][matrix_size])
{

    int col1, col2, col3, col4, colSum;
    register int i, j;

    for (i ^= i; !(i & matrix_size); i++)
    {
        col1 = (X[i][0] * Y[0][0]) >> 2; // software pipelining
        col2 = (X[i][1] * Y[1][0]) >> 2;
        col3 = (X[i][2] * Y[2][0]) >> 2;
        col4 = (X[i][3] * Y[3][0]) >> 2;
        colSum = col1 + col2 + col3 + col4;
        for (j ^= j; !(j & matrix_size); j++)
        {
            newM[i][j] = colSum >> 13;
            // 16 bit x 16 bit
            col1 = (X[i][0] * Y[0][j + 1]) >> 2; // shift right 2 for worst case of 4 additions
            col2 = (X[i][1] * Y[1][j + 1]) >> 2;
            col3 = (X[i][2] * Y[2][j + 1]) >> 2;
            col4 = (X[i][3] * Y[3][j + 1]) >> 2;

            colSum = col1 + col2 + col3 + col4; // 32 bit number - 2 worst-case adjustment = 30 bit number - SF =                      // at 28 bits, shift back to scale factor of 15 bits
        }
    }
}
// i row_idx, j col_idx (i=0, j=1 for pair (1-2))
void sweep(int row_idx, int col_idx, int U[matrix_size][matrix_size], int V[matrix_size][matrix_size], int M[matrix_size][matrix_size])
{

    register int i, j, k;

    //Get 2x2 Matrix of M for current iteration of i and j
    int M_iteration[subset_matrix_size][subset_matrix_size];
    M_iteration[0][0] = M[row_idx][row_idx];
    M_iteration[0][1] = M[row_idx][col_idx];
    M_iteration[1][0] = M[col_idx][row_idx];
    M_iteration[1][1] = M[col_idx][col_idx];

    //Get θsum and θdiff for current iteration of i and j
    int thetaDiff = getThetaDiff(M_iteration); //sf 14
    int thetaSum = getThetaSum(M_iteration);   //sf 14

    //Get left and right rotation angles for current iteration of i and j
    int thetaL = getThetaL(thetaSum, thetaDiff); //sf 14
    int thetaR = getThetaR(thetaSum, thetaDiff); //sf 14

    //Get left and right rotation matrices for current iteration of i and j
    int R_iteration[subset_matrix_size][subset_matrix_size]; //Will want to make into U and 4x4
    int L_iteration[subset_matrix_size][subset_matrix_size];
    getLMatrix(thetaL, L_iteration); //sf 15
    getRMatrix(thetaR, R_iteration); //sf 15

    int U_iteration[matrix_size][matrix_size];
    gen_identity_matrix(U_iteration, 1 << 15); // scaled up to 2^16 bit width
    //U_i,j -> U_iteration - identity matrix
    U_iteration[row_idx][row_idx] = L_iteration[0][0];
    U_iteration[row_idx][col_idx] = L_iteration[0][1];
    U_iteration[col_idx][row_idx] = L_iteration[1][0];
    U_iteration[col_idx][col_idx] = L_iteration[1][1];

    //V_i,j -> V_iteration - identity matrix
    int V_iteration[matrix_size][matrix_size];
    gen_identity_matrix(V_iteration, 1 << 15); // scaled up to 2^16 bit width
    V_iteration[row_idx][row_idx] = R_iteration[0][0];
    V_iteration[row_idx][col_idx] = R_iteration[0][1];
    V_iteration[col_idx][row_idx] = R_iteration[1][0];
    V_iteration[col_idx][col_idx] = R_iteration[1][1];

    // Update V
    int V_prime[matrix_size][matrix_size];
    matrixMultiply(V_iteration, V, V_prime); // V' = V_iteration & V
    memcpy(V, V_prime, sizeof(V_prime));     // V = V'
    Transpose_4x4(V_iteration);              // V_interation^T

    // Update M
    int M_prime[matrix_size][matrix_size];
    matrixMultiply(U_iteration, M, M_prime); // M' = U_iteration * M * V_iteration^T
    matrixMultiply(M_prime, V_iteration, M); // M = M'

    // Update U
    int U_prime[matrix_size][matrix_size];
    Transpose_4x4(U_iteration);              // U_iteration^T
    matrixMultiply(U, U_iteration, U_prime); // U' = U * U_iteration^T
    memcpy(U, U_prime, sizeof(U_prime));     // U = U'
}

int main(int argc, char *argv[])
{

    float U[matrix_size][matrix_size];
    float V[matrix_size][matrix_size];
    float M[matrix_size][matrix_size];
    float orginalM[matrix_size][matrix_size];
    //Will want to make into V and 4x4

    // Generate the M matrix and save a copy in originalM
    gen_M_matrix(M);
    memcpy(orginalM, M, sizeof(M));

    printf("\nOriginal Matrix\n");
    print_matrix(orginalM);

    int scaleFactor = 256; // 2^8 - calculated offline

    int i, j;

    //Populate the cossin lookup table, will populate 2048 bins with 2^15 scale factor values.
    for (i = 0; i < COSSIN_BINS; i++)
    {
        fast_cossin_table[i] = (int)(sin((double)i * M_PI / HALF_COSSIN_BINS) * (1 << 15));
    }

    int scaled_M[matrix_size][matrix_size];
    int scaled_U[matrix_size][matrix_size];
    int scaled_V[matrix_size][matrix_size];

    gen_identity_matrix(scaled_U, 1 << 15);
    gen_identity_matrix(scaled_V, 1 << 15);
    scale_matrix(M, scaled_M, scaleFactor);
    //The main loop. This is the implementation of the Cyclical Jacobi Method.
    while (1) // 5 sweeps
    {

        for (i ^= i; i < 3; i++) // 4 rows
        {
            for (j = i + 1; j < matrix_size; j++) // each column in the row
            {
                sweep(i, j, scaled_U, scaled_V, scaled_M);
            }
        }
        int done = 1;
        for (i ^= i; !(i & matrix_size); i++) // 4 rows
        {
            for (j ^= j; !(j & matrix_size); j++) // each column in the row
            {
                if (i == j)
                    continue;

                if (abs(scaled_M[i][j]) >= (scaleFactor))
                {
                    done = 0;
                }
            }
        }
        if (done)
        {
            break;
        }
    }

    Transpose_4x4(scaled_V);

    un_scale_matrix(M, scaled_M, 8);  // SF = 2^8
    un_scale_matrix(U, scaled_U, 15); // SF = 2^15
    un_scale_matrix(V, scaled_V, 15); // SF = 2^15

    printf("\n\nFinal M:\n");

    print_matrix(M);
    printf("\n\nFinal U:\n");

    print_matrix(U);
    printf("\n\nFinal V:\n");
    print_matrix(V);
}
