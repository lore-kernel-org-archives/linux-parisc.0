From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] BUG sym2 hangs on non-existant Target
Date: Tue, 8 Mar 2005 18:48:56 -0700
Message-ID: <20050309014856.GA26055@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

Willy,
2.6.11-pa2 is hanging after sym2 spews some unusual messages.
console output appended.

This is an a500 (riot) connected to an Ultra2 SC10 (A5273A).
There are only disk devices 0-3 and 8-13. 14 is the enclosure controller.
There is no 15 and apperently sym2 thinks there is.
It aborts, resets the bus, aborts, resets the bus, then hangs.
I let it set there for 5+ minutes.
console is non-responsive - only GSP is still talking.

Let me know which debug options I should hand sym2 and
I can collect those tonight/tomorrow.

grant


Firmware Version  43.50

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2002, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      650  MHz   Active                 Functional         750 KB 1.5 MB
      1      650  MHz   Idle                   Functional         750 KB 1.5 MB

  Central Bus Speed (in MHz)  :        120  
  Available Memory            :    4194304  KB
  Good Memory Required        : Not initialized. Defaults to 32 MB. 

   Primary boot path:    0/0/1/1.15          
   Alternate boot path:  0/0/2/1.15          
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
palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004

Partition Start(MB) End(MB) Id Type
1               1     191   f0 Palo
2             192    1526   82 swap
3            1527   17546   83 ext2

PALO(F0) partition contains:
PALO is formatted EXT2/3Current command line:
1/vmlinux-2.6.11-pa2 noudev root=/dev/sda3 HOME=/ console=ttyS0 TERM=linux
 0: 1/vmlinux-2.6.11-pa2
 1: noudev
 2: root=/dev/sda3
 3: HOME=/
 4: console=ttyS0
 5: TERM=linux

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 2
root=/dev/sdk3
Current command line:
1/vmlinux-2.6.11-pa2 noudev root=/dev/sdk3 HOME=/ console=ttyS0 TERM=linux
 0: 1/vmlinux-2.6.11-pa2
 1: noudev
 2: root=/dev/sdk3
 3: HOME=/
 4: console=ttyS0
 5: TERM=linux

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? b

Command line for kernel: 'noudev root=/dev/sdk3 HOME=/ console=ttyS0 TERM=linux palo_kernel=1/vmlinux-2.6.11-pa2'
Selected kernel: /vmlinux-2.6.11-pa2 from partition 1
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4217472 mediaptr 0x1000
Segment 1 load 00508000 size 302032 mediaptr 0x407000
Segment 2 load 00554000 size 290792 mediaptr 0x451000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.11-pa2 (grundler@riot) (gcc version 3.4.4 20041218 (prerelease) (Debian 3.4.3-6)) #1 SMP Mon Mar 7 22:21:58 PST 2005
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005e20 00000491 00000000 00000001 6de785ee 100000f0 00000008 000000b2 000000b2
vers  00000203
CPUID vers 19 rev 8 (0x00000268)
capabilities 0x5
model 9000/800/A500-6X
Memory Ranges:
 0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 Mb
 1) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 Mb
Total Memory: 4096 Mb
SMP: bootstrap CPU ID is 0
Built 2 zonelists
Kernel command line: noudev root=/dev/sdk3 HOME=/ console=ttyS0 TERM=linux palo_kernel=1/vmlinux-2.6.11-pa2
PID hash table entries: 4096 (order: 12, 131072 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
Memory: 4194304k available
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
Brought up 1 CPUs
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Crescendo 650 W2 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5e2, 0x00004 }
2. Crescendo 650 W2 at 0xfffffffffffa2000 [162] { 0, 0x0, 0x5e2, 0x00004 }
3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
4. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
5. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
7. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
8. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
Enabling PDC_PAT chassis codes support.

********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
 (0x5) found at 0xfffffffffed34000
LBA version TR4.0 (0x5) found at 0xfffffffffed38000
LBA version TR4.0 (0x5) found at 0xfffffffffed3c000
SCSI subsystem initialized
unwind_init: start = 0x103ef480, end = 0x1040ae40, entries = 7068
Performance monitoring counters enabled for Crescendo 650 W2
Initializing Cryptographic API
PDC Stable Storage facility v0.09
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 17 ports, IRQ sharing enabled
ttyS0 at MMIO 0xfffffffff8000000 (irq = 22) is a 16550A
ttyS1 at MMIO 0xfffffffff8000008 (irq = 22) is a 16450
ttyS2 at MMIO 0xfffffffff8000010 (irq = 22) is a 16550A
ttyS3 at MMIO 0xfffffffff8000030 (irq = 22) is a 16550A
ttyS4 at MMIO 0xfffffffff8000038 (irq = 22) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
sym0: <896> rev 0x7 at pci 0000:00:01.0 irq 19
sym0: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.0
  Vendor: SEAGATE   Model: ST318203LC        Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:0: tagged command queuing enabled, command queue depth 16.
 target0:0:0: Beginning Domain Validation
 target0:0:0: asynchronous.
 target0:0:0: wide asynchronous.
 target0:0:0: Domain Validation skipping write tests
 target0:0:0: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:0: Ending Domain Validation
  Vendor: SEAGATE   Model: ST318203LC        Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:1: tagged command queuing enabled, command queue depth 16.
 target0:0:1: Beginning Domain Validation
 target0:0:1: asynchronous.
 target0:0:1: wide asynchronous.
 target0:0:1: Domain Validation skipping write tests
 target0:0:1: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:1: Ending Domain Validation
  Vendor: SEAGATE   Model: ST318203LC        Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:2: tagged command queuing enabled, command queue depth 16.
 target0:0:2: Beginning Domain Validation
 target0:0:2: asynchronous.
 target0:0:2: wide asynchronous.
 target0:0:2: Domain Validation skipping write tests
 target0:0:2: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:2: Ending Domain Validation
  Vendor: SEAGATE   Model: ST318203LC        Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:3: tagged command queuing enabled, command queue depth 16.
 target0:0:3: Beginning Domain Validation
 target0:0:3: asynchronous.
 target0:0:3: wide asynchronous.
 target0:0:3: Domain Validation skipping write tests
 target0:0:3: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:3: Ending Domain Validation
  Vendor: SEAGATE   Model: ST318203LC        Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:8: tagged command queuing enabled, command queue depth 16.
 target0:0:8: Beginning Domain Validation
 target0:0:8: asynchronous.
 target0:0:8: wide asynchronous.
 target0:0:8: Domain Validation skipping write tests
 target0:0:8: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:8: Ending Domain Validation
  Vendor: SEAGATE   Model: ST318203LC        Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:9: tagged command queuing enabled, command queue depth 16.
 target0:0:9: Beginning Domain Validation
 target0:0:9: asynchronous.
 target0:0:9: wide asynchronous.
 target0:0:9: Domain Validation skipping write tests
 target0:0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:9: Ending Domain Validation
  Vendor: SEAGATE   Model: ST318203LC        Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:10: tagged command queuing enabled, command queue depth 16.
 target0:0:10: Beginning Domain Validation
 target0:0:10: asynchronous.
 target0:0:10: wide asynchronous.
 target0:0:10: Domain Validation skipping write tests
 target0:0:10: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:10: Ending Domain Validation
  Vendor: SEAGATE   Model: ST318203LC        Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:11: tagged command queuing enabled, command queue depth 16.
 target0:0:11: Beginning Domain Validation
 target0:0:11: asynchronous.
 target0:0:11: wide asynchronous.
 target0:0:11: Domain Validation skipping write tests
 target0:0:11: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:11: Ending Domain Validation
  Vendor: SEAGATE   Model: ST318203LC        Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:12: tagged command queuing enabled, command queue depth 16.
 target0:0:12: Beginning Domain Validation
 target0:0:12: asynchronous.
 target0:0:12: wide asynchronous.
 target0:0:12: Domain Validation skipping write tests
 target0:0:12: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:12: Ending Domain Validation
  Vendor: SEAGATE   Model: ST318203LC        Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:13: tagged command queuing enabled, command queue depth 16.
 target0:0:13: Beginning Domain Validation
 target0:0:13: asynchronous.
 target0:0:13: wide asynchronous.
 target0:0:13: Domain Validation skipping write tests
 target0:0:13: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
 target0:0:13: Ending Domain Validation
  Vendor: HP        Model: A5272A            Rev: HP05
  Type:   Enclosure                          ANSI SCSI revision: 02
 target0:0:14: Beginning Domain Validation
 target0:0:14: asynchronous.
 target0:0:14: wide asynchronous.
 target0:0:14: Domain Validation skipping write tests
 target0:0:14: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 15)
 target0:0:14: Ending Domain Validation
sym0:15: No MSG OUT phase after selection with ATN.
 0:0:15:0: ABORT operation started.
 0:0:15:0: ABORT operation timed-out.
 0:0:15:0: DEVICE RESET operation started.
 0:0:15:0: DEVICE RESET operation timed-out.
 0:0:15:0: BUS RESET operation started.
sym0: SCSI BUS reset detected.
sym0: SCSI BUS has been reset.
 0:0:15:0: BUS RESET operation complete.
sym0:15: No MSG OUT phase after selection with ATN.
 0:0:15:0: ABORT operation started.
 0:0:15:0: ABORT operation timed-out.
 0:0:15:0: HOST RESET operation started.
sym0: SCSI BUS has been reset.
[hang]
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
