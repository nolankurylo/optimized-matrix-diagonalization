#include "tests.h"

int min_range, max_range;

float test_matrix[matrix_size][matrix_size] = {31, 77, -11, 26, -42, 14, 79, -53, -68, -10, 45, 90, 34, 16, 38, -19};

void gen_test_matrix()
{
    float max = 500.0;
    srand((unsigned int)time(NULL));
    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
        {
            float x = max * ((float)rand() / (float)RAND_MAX - 0.5);

            test_matrix[i][j] = x;
        }
    }
}

float get_max()
{
    float max = test_matrix[0][0];

    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
        {
            if (max < test_matrix[i][j])
            {
                max = test_matrix[i][j];
            }
        }
    }
    return max;
}

float get_min()
{
    float min = test_matrix[0][0];

    for (int i = 0; i < matrix_size; i++)
    {
        for (int j = 0; j < matrix_size; j++)
        {
            if (min > test_matrix[i][j])
            {
                min = test_matrix[i][j];
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
            printf("%f ", test_matrix[i][j]);
            if (j == matrix_size - 1)
            {
                printf("\n");
            }
        }
    }
}
