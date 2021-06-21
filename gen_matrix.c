#include "tests.h"

int min_range, max_range;

float M[matrix_size][matrix_size] = {31, 77, -11, 26, -42, 14, 79, -53, -68, -10, 45, 90, 34, 16, 38, -19};

void gen_test_matrix()
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

void gen_identity_matrix(float identity[4][4])
{

    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            if (j == i)
            {
                identity[j][i] = 1;
            }
            else
            {
                identity[j][i] = 0;
            }
        }
    }
}

float get_max()
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

float get_min()
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

void print_matrix()
{
    printf("Two Dimensional array elements:\n");

    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
        {
            printf("%f ", M[i][j]);
            if (j == matrix_size - 1)
            {
                printf("\n");
            }
        }
    }
}
