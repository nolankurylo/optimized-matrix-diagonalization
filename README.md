# Matrix Diagonalization Project

SENG 440 Embedded Systems\
Summer 2021 \
\
Team ID: 16 \
Nolan Kurylo - V00893175 \
Dylan Brown - V00878404

## ARM Virtual Machine

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

After compiling, there should be a `project` executable in the current directory of the VM.\ 
To run the application, execute command:\
`./project`

As this is a development project with the purpose of algorithm implementation, the matrix used to demonstrate the functionality of the algorithm is hard coded into the program.
The 4x4 matrix M used is as follows:

31 77 -11 26 \
-42 14 79 -53 \
-68 -10 45 90 \
34 16 38 -19

U =\
0.84200 0.29140 0.44223 −0.10274 \
−0.03818 0.79467 −0.52228 −0.30702 \
−0.51265 0.48769 0.69007 0.15214 \
0.16361 0.21387 −0.23549 0.9338 

V =\
0.35563 −0.46831 0.14108 0.79592 \
0.82536 0.51211 −0.23642 −0.02501 \
−0.35889 0.71939 0.24820 0.54044 \
−0.25199 −0.00938 −0.92876 0.27169 

M =\
100.529 −15.789 8.876 29.798 \
−24.869 104.453 2.662 9.100 \
−11.624 −0.992 −110.708 0 \
2.764 −0.250 0 37.710 

The expected output after the SVD matrix diagonalization is:
