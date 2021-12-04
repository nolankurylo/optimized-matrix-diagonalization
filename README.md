# Optimized SVD for Matrix Diagonalization

This project shows how the Singular Value Decomposition algorithm can be optimized for matrix diagonalization on a ARM microcontroller. This optimzation is necessary as it microcontrollers have limited memory and CPU power so it is imperative that every line of code is as optimized as possible. This was a term-long project for the Design Project I course - SENG 440 Embedded Systems.

As this is a development project with the purpose of algorithm implementation, the matrix used to demonstrate the functionality of the algorithm is hard coded into the program.
The 4x4 matrix M used for the SVD is as follows:

M =\
31 77 -11 26 \
-42 14 79 -53 \
-68 -10 45 90 \
34 16 38 -19

The expected output after the SVD matrix diagonalization is:

SIGMA =\
85.570 0 0 0 \
0 126.429 0 0 \
0 0 −110.905 0 \
0 0 0 34.008 

The actual output after the optimized implementation of SVD matrix diagonalization is:

SIGMA =\
85.480469 0.359375 -0.082031 -0.363281 \
-0.207031 126.375000 -0.277344 -0.234375 \
0.183594 -0.136719 -110.894531 0.101562 \
-0.292969 -0.304688 -0.152344 33.980469

## ARM Virtual Machine Setup

Before starting the Virtual Machine, ensure you are in a directory containing the following:

-   Disk image: Fedora-Minimal-armhfp-29-1.2-sda.qcow2
-   Linux kernel: vmlinuz-4.18.16-300.fc29.armv7hl
-   Root file system: initramfs-4.18.16-300.fc29.armv7hl.img

Also ensure the following are installed on the host:

-   QEMU
-   Virtual Manager

To start the Virtual ARM Machine, execute command:\
`qemu-system-arm -m 2G -smp 1 -hda Fedora-Minimal-armhfp-29-1.2-sda.qcow2 -machine virt-2.11 -kernel vmlinuz-4.18.16-300.fc29.armv7hl -initrd initramfs-4.18.16-300.fc29.armv7hl.img -append "console=ttyAMA0 rw root=LABEL=_/ rootwait ipv6.disable=1" -nographic`

Once booted, enter:\
Username: `root`\
Password: `seng440`

### Compilation

To compile the project, execute command:\
`arm-linux-gnu-gcc -static -o project seng440Project.c -lm -O3`

To generate an assembly exececutable, execute command:\
`arm-linux-gnu-gcc -static -o project_asm.s seng440Project.c -lm -S -O3`

### Execution

After compiling, there should be a `project` executable in the current directory of the VM.
To run the application, execute command: \
`./project`

