# Matrix Diagonalization Project

SENG 440 Embedded Systems
Summer 2021

Team ID: 16
Nolan Kurylo - V00893175  
Dylan Brown - V00878404

## ARM Virtual Machine
Before starting the Virtual Machine, ensure you are in a directory containing the following:

- Disk image: Fedora-Minimal-armhfp-29-1.2-sda.qcow2
- Linux kernel: vmlinuz-4.18.16-300.fc29.armv7hl
- Root file system: initramfs-4.18.16-300.fc29.armv7hl.img

Also ensure the following are installed on the host:
- QEMU
- Virtual Manager

To start the Virtual ARM Machine, execute command:
`qemu-system-arm -m 2G -smp 1 -hda Fedora-Minimal-armhfp-29-1.2-sda.qcow2 -machine virt-2.11 -kernel vmlinuz-4.18.16-300.fc29.armv7hl -initrd initramfs-4.18.16-300.fc29.armv7hl.img  -append "console=ttyAMA0 rw root=LABEL=_/ rootwait ipv6.disable=1" -nographic`

Once booted, enter:
Username: `root`
Password: `seng440`

### Compilation
To compile the project, execute command:
`arm-linux-gnu-gcc -static -o project seng440Project.c -lm -O3`

To generate an assembly exececutable, execute command:
`arm-linux-gnu-gcc -static -o project_asm.s seng440Project.c -lm -S -O3`

### Execution
After compiling, there should be a `project` executable in the current directory of the VM. To run the application, execute command:
`./project`


