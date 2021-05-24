.phony all:
all: project

project: gen_matrix.c
        gcc gen_matrix.c -o gen_matrix

.PHONY clean:
clean:
        -rm -rf *.o *.exe

# gcc -o project seng440Project.c gen_matrix.c