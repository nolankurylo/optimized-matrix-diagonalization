#include "tests.h"

int min_range, max_range;

void gen_test_matrix(float M[4][4])
{
    float max = 500.0;
    srand((unsigned int)time(NULL));
    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
        {
            float x = max * ((float)rand() / (float)RAND_MAX - 0.5);

            M[i][j] = x;
        }
    }
}

void gen_M_matrix(float M[4][4])
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

void gen_identity_matrix(int identity[4][4], int scaleFactor)
{

    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            if (j == i)
            {
                identity[j][i] = scaleFactor;
            }
            else
            {
                identity[j][i] = 0;
            }
        }
    }
}

void scale_matrix(float float_matrix[4][4], int int_matrix[4][4], int scaleFactor)
{

    int i, j;
    for (i ^= i; !(i & 4); i++)
    {
        for (j ^= j; !(j & 4); j++)
        {
            int_matrix[i][j] = (scaleFactor * float_matrix[i][j]); // should round this
        }
    }
}

void un_scale_matrix(float float_matrix[4][4], int int_matrix[4][4], int scaleFactor)
{
    int i, j;

    float floatScale = 1 / (float)scaleFactor;

    for (i ^= i; !(i & 4); i++)
    {
        for (j ^= j; !(j & 4); j++)
        {
            float_matrix[i][j] = (int_matrix[i][j] * floatScale);
        }
    }
}

float get_max(float M[4][4])
{
    float max = M[0][0];

    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
        {
            if (max < M[i][j])
            {
                max = M[i][j];
            }
        }
    }
    return max;
}

float get_min(float M[4][4])
{
    float min = M[0][0];

    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
        {
            if (min > M[i][j])
            {
                min = M[i][j];
            }
        }
    }
    return min;
}

int get_max_int(int M[4][4])
{
    int max = M[0][0];

    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
        {
            if (max < M[i][j])
            {
                max = M[i][j];
            }
        }
    }
    return max;
}

int get_min_int(int M[4][4])
{
    int min = M[0][0];

    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
        {
            if (min > M[i][j])
            {
                min = M[i][j];
            }
        }
    }
    return min;
}

void print_matrix(float print_M[4][4])
{
    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
        {
            printf("%f ", print_M[i][j]);
            if (j == matrix_size - 1)
            {
                printf("\n");
            }
        }
    }
}

void print_matrix_int(int print_M[4][4])
{
    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
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
