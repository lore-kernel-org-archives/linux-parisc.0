From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.9-rc2-pa1: what did I missed?
Date: Tue, 14 Sep 2004 18:33:49 +0000
Message-ID: <4147398D.503@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello pa*,

on my c110, I used to get usefull info during the boot as follow:

Selected kernel: /vmlinux-2.6.8.1-pa7 from partition 3
ELF32 executable
Entry 00100338 first 00100000 n 2
Segment 0 load 00100000 size 3081408 mediaptr 0x1000
Segment 1 load 003f1000 size 946192 mediaptr 0x2f2000
Branching to kernel entry point 0x00100338. If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.8.1-pa7 (root@hpalin) (gcc version 3.3.4 (Debian 1:3.3.4-9)) 4
FP[0] enabled: Rev 1 Model 11
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 000058e0 00000481 00000000 00000002 77e47570 100000f1 00000004 0000008a 0a
vers  0000000d
CPUID vers 11 rev 13 (0x0000016d)
model 9000/777/C110
Total Memory: 512 Mb
LED display at f0190001 registered
SMP: bootstrap CPU ID is 0
Built 1 zonelists
Kernel command line: root=/dev/md2 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=7
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 524288k available
Calibrating delay loop... 119.60 BogoMIPS
Security Scaffold v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Brought up 1 CPUs
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0x7, 0x580, 0x0000b }
2. SkyHawk 100/120 FW-SCSI at 0xf3f8c000 [8/12] { 4, 0x0, 0x01f, 0x00089 }
3. Raven T' Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x032, 0x00081 },  addition
4. Raven T' Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x032, 0x00074 },
5. Raven T' Audio at 0xffd04000 [8/16/1] { 10, 0x0, 0x032, 0x0007b }
[...]
20. Raven 120 T' at 0xfffa0000 [32] { 0, 0x0, 0x58e, 0x00004 }
21. Memory at 0xfffb1000 [49] { 1, 0x0, 0x049, 0x00009 }
CPU(s): 1 x PA7200 (PCX-T') at 120.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM: cannot register misc device.
Enumerating EISA bus
EISA: Probing bus 0 at parisc8:20:5
EISA: Mainboard HWPC0E1 detected.
EISA: Detected 0 cards.
SCSI subsystem initialized
STI GSC/PCI core graphics driver Version 0.9a
id 2b4ded6d-40a00499, conforms to spec rev. 8.04
graphics card name: HPA208LC1024
fb0: stifb 1024x768-8 frame buffer device, HPA208LC1024, id: 2b4ded6d, mmio: 0x0
unwind_init: start = 0x103f2a20, end = 0x10415be0, entries = 8988
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0140000.
Console: switching to colour frame buffer device 128x48
lp: driver loaded but no devices found
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xffe02800 (irq = 121) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
loop: loaded (max 8 devices)
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xffd07000, IRQ 87
eth0: 82596 at 0xffd07000, 00 60 B0 07 1E EA IRQ 87.
zalon_probe: Zalon vers field is 0x1, IRQ 35
ncr53c720-0: rev 0xf irq 35
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3f
[...]

now with 2.6.9-rc2-pa1 + revamping patch I get only and the near same config file (I just copy the old and 'make oldconfig'):

Selected kernel: /vmlinux-2.6.9-rc2-pa1UP32-c110 from partition 3
ELF32 executable
Entry 00100158 first 00100000 n 3
Segment 0 load 00100000 size 2916992 mediaptr 0x1000
Segment 1 load 003c9000 size 541536 mediaptr 0x2ca000
Segment 2 load 00450000 size 413848 mediaptr 0x34f000
Branching to kernel entry point 0x00100158.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org
				<<<<<<<< ??
device: ID = 'ptywd'
lp: driver loaded but no devices found
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xffe02800 (irq = 121) is a 16550A
[...]

I doubt it has any relationship with tausq patch.
Is it a new feature: silent boot (ala hpux :) )?

Thanks in advance for your attention,
	Joel

PS: fwiw nothing more seems to be logged in dmesg, kernel.log, syslog?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
