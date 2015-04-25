#### Booting a Machine

source: http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf

Bios
1. The BIOS loads when the system turns on.  It is loaded from ROM non-volatile/read-only chip on the motherboard.
2. the bios is a handful of 'routines' that check the system's essential resources and that the memory is properly functioning.
3. Then it looks at the first 512 mb of each physically attached disk and checks if the last two bytes are 0xaa55 (data vs code is not a distinction that is made at the BIOS level). If so, it begins executing those instructions, and the OS loads. 
