LPI EXAM 101
============
+ [ibm src](http://www.ibm.com/developerworks/linux/tutorials/l-lpic1101/section2.html)

System/Bios

CPU
RAM
HDD
display
keyboard
mouse
NIC
Optical Drive
Printer

Booting

BIOS
loads operating system
Basic Input Output System
	Bios stored in nonvolatile memory (Read Only Memory, ROM)
	EEPROM - electrically erasable programmable read only memory

Bus, Port, IRQ, DMA

Bus
physical connections (cables, printed circuits) that allow the CPU to communicate with peripherals.  
Bus standards: 
ISA - Industry Standard Architecture
AGP - Accelerated Graphics Port
PCI - Peripheral Component Interconnect
	PCI-E
Linux files:
	/proc/pci
	/sbin/lspci

I/O Port
Serial port
	sent via single wire
asynchronous, 
no clock required, each character has a start and stop bit (10 bits total, 2 start, 8 character, 2 stop)  
generally have 9 pins (DB9) or 25 pins (DB25)
	Parallel Port
		sent via several wires

		
