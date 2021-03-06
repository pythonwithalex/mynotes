#### Booting a Machine

source: http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf

Bios
+ The BIOS loads when the system turns on.  It is loaded from ROM non-volatile/read-only chip on the motherboard.
+ The BIOS is a handful of 'routines' that check the system's essential resources and that the memory is properly functioning.
+ The BIOS reads in 512byte blocks. there is no filesystem at this level.  
+ Then it looks at the first 512 mb of each physically attached disk and checks if the last two bytes are 0xaa55 (data vs code is not a distinction that is made at the BIOS level).  If they are, that disk's first 512mb make up a boot sector, which contains executable code to boot the Operating System.  The BIOS looks for a valid boot sector and then begins executing those instructions, and the OS loads. 
+ The first 3 bytes of the boot sector are an 'endless jump' instruction particular the CPU. The bytes in between these instructions and the final 2 magic bytes are just padded with zeros.
