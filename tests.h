#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define matrix_size 4

// Prototype functions
void gen_test_matrix(float[4][4]);

void scale_matrix(float[4][4], int[4][4], int);

void un_scale_matrix(float[4][4], int[4][4], int);

void gen_identity_matrix(int[4][4], int);

void gen_M_matrix(float[4][4]);

void print_matrix(float[4][4]);

float get_min(float[4][4]);

float get_max(float[4][4]);

int get_min_int(int[4][4]);

int get_max_int(int[4][4]);

void print_matrix_int(int[4][4]);