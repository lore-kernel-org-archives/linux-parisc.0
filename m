Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DE2B484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  8 Feb 2004 20:56:24 -0700 (MST)
Date: Sun, 8 Feb 2004 20:56:21 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: willy@debian.org
Message-ID: <20040209035621.GD21692@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] 2.6.3-rc1 sym2 hangs on a500-65
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Matthew,
a500 (ion) hangs with /boot/vmlinux-2.6.3-rc1-pa2.
Having problems with bus reset code path.
I'll collect TOC info and make that available.

thanks,
grant


Firmware Version  42.19

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2001, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      650  MHz   Active                 Functional         750 KB 1.5 MB

  Central Bus Speed (in MHz)  :        120  
  Available Memory            :    1048576  KB
  Good Memory Required        :      25820  KB

   Primary boot path:    0/0/2/1.15          
   Alternate boot path:  0/0/1/1.15          
   Console path:         0/0/4/1.643         
   Keyboard path:        0/0/4/0.0           


---- Main Menu ---------------------------------------------------------------

     Command                           Description
     -------                           -----------
     BOot [PRI|ALT|<path>]             Boot from specified path
     PAth [PRI|ALT] [<path>]           Display or modify a path
     SEArch [DIsplay|IPL] [<path>]     Search for boot devices

     COnfiguration menu                Displays or sets boot values
     INformation menu                  Displays hardware information
     SERvice menu                      Displays service commands

     DIsplay                           Redisplay the current menu
     HElp [<menu>|<command>]           Display help for menu or command
     RESET                             Restart the system
----
Main Menu: Enter command or menu > bo
Interact with IPL (Y, N, or Cancel)?> y

Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.2 root@b2000 Tue Jan 14 13:13:07 MST 2003

Partition Start(MB) End(MB) Id Type
1               1     512   82 swap
2             513     532   f0 Palo
3             533    2048   83 ext2
4            2049    8682   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 5382306 bytes @ 0x20040000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).Current command line:
3/boot/vmlinux initrd=3/boot/initrd.img root=/dev/sdb3 HOME=/ console=ttyS0 TERM=vt102
 0: 3/boot/vmlinux
 1: initrd=3/boot/initrd.img
 2: root=/dev/sdb3
 3: HOME=/
 4: console=ttyS0
 5: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? 0
3/boot/vmlinux-2.6.3-rc1-pa2
Current command line:
3/boot/vmlinux-2.6.3-rc1-pa2 initrd=3/boot/initrd.img root=/dev/sdb3 HOME=/ console=ttyS0 TERM=vt102
 0: 3/boot/vmlinux-2.6.3-rc1-pa2
 1: initrd=3/boot/initrd.img
 2: root=/dev/sdb3
 3: HOME=/
 4: console=ttyS0
 5: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: ' root=/dev/sdb3 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=3/boot/vmlinux-2.6.3-rc1-pa2'
Selected kernel: /boot/vmlinux-2.6.3-rc1-pa2 from partition 3
Selected ramdisk: /boot/initrd.img from partition 3
ELF64 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 3581040 mediaptr 0x1000
Segment 1 load 0046c000 size 237701 mediaptr 0x36c000
Loading ramdisk 3256320 bytes @ 3fcd2000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.3-rc1-pa2 (grundler@gsyprf11.external.hp.com) (gcc version 3.0.4) #3 Sun Feb 8 15:40:17 PST 2004
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005e20 00000491 00000000 00000001 6df6c82e 100000f0 00000008 000000b2 000000b2
vers  00000203
CPUID vers 19 rev 8 (0x00000268)
capabilities 0x5
model 9000/800/A500-6X
Total Memory: 1024 Mb
initrd: 4fcd2000-4ffed000
initrd: reserving 3fcd2000-3ffed000 (mem_max 40000000)
On node 0 totalpages: 262144
  DMA zone: 262144 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Built 1 zonelists
Kernel command line:  root=/dev/sdb3 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=3/boot/vmlinux-2.6.3-rc1-pa2
PID hash table entries: 16 (order 4: 256 bytes)
Console: colour dummy device 160x64
Memory: 1018752k available
Calibrating delay loop... 1294.33 BogoMIPS
Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
checking if image is initramfs...it isn't (ungzip failed); looks like an initrd
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Crescendo 650 W2 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5e2, 0x00004 }
2. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
3. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
7. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
CPU(s): 1 x PA8700 (PCX-W2) at 650.000000 MHz
SBA found Astro 2.1 at 0xfffffffffed00000
lba version TR4.0 (0x5) found at 0xfffffffffed30000
iosapic: no IRTE for 0000:00:04.0 (IRQ not connected?)
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
SCSI subsystem initialized
Performance monitoring counters enabled for Crescendo 650 W2
ikconfig 0.7 with /proc/config*
Initializing Cryptographic API
Soft power switch support not available.
pty: 256 Unix98 ptys configured
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 17 ports, IRQ sharing enabled
ttyS0 at MMIO 0xfffffffff8000000 (irq = 132) is a 16550A
ttyS1 at MMIO 0xfffffffff8000008 (irq = 132) is a 16450
ttyS2 at MMIO 0xfffffffff8000010 (irq = 132) is a 16550A
ttyS3 at MMIO 0xfffffffff8000030 (irq = 132) is a 16550A
ttyS4 at MMIO 0xfffffffff8000038 (irq = 132) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 1.1.13-NAPI (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth0: Digital DS21143 Tulip rev 65 at 0xfffffffff8006000, 00:30:6E:48:F6:40, IRQ 128.
sym0: <896> rev 0x7 at pci 0000:00:01.0 irq 129
sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18i
Using anticipatory io scheduler
sym0:0:0: ABORT operation started.
sym0:0:0: ABORT operation complete.
sym0:0:0: DEVICE RESET operation started.
sym0:0:0: DEVICE RESET operation failed.
sym0:0:0: BUS RESET operation started.
sym0:0:0: BUS RESET operation failed.
sym0:0:0: HOST RESET operation started.
sym0:0:0: HOST RESET operation failed.
scsi: Device offlined - not ready after error recovery: host 0 channel 0 id 0 lun 0
sym1: <896> rev 0x7 at pci 0000:00:01.1 irq 130
sym1: No NVRAM, ID 7, Fast-40, SE, parity checking
sym1: SCSI BUS has been reset.
sym1: SCSI BUS mode change from SE to SE.
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18i
  Vendor: SEAGATE   Model: ST39102LC         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym1:15:0: tagged command queuing enabled, command queue depth 16.
sym2: <875> rev 0x37 at pci 0000:00:02.0 irq 130
sym2: No NVRAM, ID 7, Fast-20, SE, parity checking
sym2: SCSI BUS has been reset.
scsi2 : sym-2.1.18i
sym3: <875> rev 0x37 at pci 0000:00:02.1 irq 131
sym3: No NVRAM, ID 7, Fast-20, SE, parity checking
sym3: SCSI BUS has been reset.
scsi3 : sym-2.1.18i
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym3:15:0: tagged command queuing enabled, command queue depth 16.
sym4: <1010-66> rev 0x1 at pci 0000:30:02.0 irq 322
sym4: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym4: SCSI BUS has been reset.
scsi4 : sym-2.1.18i
  Vendor: HP        Model: D5989C            Rev: 1.03
  Type:   Processor                          ANSI SCSI revision: 02
  Vendor: HP 18.2G  Model: ST318452LC        Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:10:0: tagged command queuing enabled, command queue depth 16.
  Vendor: HP        Model: 18.2GB C 80-F612  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:11:0: tagged command queuing enabled, command queue depth 16.
  Vendor: HP 18.2G  Model: ST318452LC        Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:12:0: tagged command queuing enabled, command queue depth 16.
  Vendor: HP        Model: 9.10GB C 80-BX01  Rev: BX01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:13:0: tagged command queuing enabled, command queue depth 16.
  Vendor: HP        Model: 9.10GB C 80-BX01  Rev: BX01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:14:0: tagged command queuing enabled, command queue depth 16.
  Vendor: FUJITSU   Model: MAJ3091MC         Rev: 0111
  Type:   Direct-Access                      ANSI SCSI revision: 04
sym4:15:0: tagged command queuing enabled, command queue depth 16.
sym4:15: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
sym5: <1010-66> rev 0x1 at pci 0000:30:02.1 irq 323
sym5: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym5: SCSI BUS has been reset.
scsi5 : sym-2.1.18i
  Vendor: HP        Model: 18.2GB C 80-H008  Rev: H008
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym5:0:0: tagged command queuing enabled, command queue depth 16.
  Vendor: HP        Model: 18.2GB C 80-H008  Rev: H008
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym5:1:0: tagged command queuing enabled, command queue depth 16.
  Vendor: HP 18.2G  Model: ST318452LC        Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym5:2:0: tagged command queuing enabled, command queue depth 16.
sym5:3:0: ABORT operation started.
sym5:3:0: ABORT operation timed-out.
sym5:3:0: DEVICE RESET operation started.
sym5:3:0: DEVICE RESET operation timed-out.
sym5:3:0: BUS RESET operation started.
sym5: SCSI BUS reset detected.
sym5: SCSI BUS has been reset.
sym5:3:0: BUS RESET operation complete.
sym5:3:0: ABORT operation started.
sym5:3:0: ABORT operation timed-out.
sym5:3:0: HOST RESET operation started.
sym5: SCSI BUS has been reset.
<hang>
