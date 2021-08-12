# Matrix Diagonalization Project

SENG 440 Embedded Systems
Summer 2021

Team ID: 16
Nolan Kurylo - V00893175  
Dylan Brown - V00878404

## ARM Virtual Machine
To start the Virtual ARM Machine, execute command:
`qemu-system-arm -m 2G -smp 1 -hda Fedora-Minimal-armhfp-29-1.2-sda.qcow2 -machine virt-2.11 -kernel vmlinuz-4.18.16-300.fc29.armv7hl -initrd initramfs-4.18.16-300.fc29.armv7hl.img  -append "console=ttyAMA0 rw root=LABEL=_/ rootwait ipv6.disable=1" -nographic`
