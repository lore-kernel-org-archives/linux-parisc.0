From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] BUG 2.6.11-rc4-pa1 (plus) sym2 panic
Date: Wed, 16 Feb 2005 00:41:46 -0700
Message-ID: <20050216074146.GA6020@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: willy@parisc-linux.org
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
I just tried to boot top of branch kernel on gsyprf11
and it data page faulted in sym2 at boot time.
I thought this bug got fixed already...*sigh*

You are welcome to use gsyprf11 for debugging if
jda doesn't need it urgently for anything. Please
arrange a time with him offlist.

The "Press Q..." stuff is from "CL" command from GSP.
Please ignore that bit.

thanks,
grant


Firmware Version  42.00

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2001, Hewlett-Packard Company, All rights reserved

Press Q/q to quit, Enter to continue: 

------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      650  MHz   Active                 Functional         750 KB 1.5 MB
      1      650  MHz   Idle                   Functional         750 KB 1.5 MB

  Central Bus Speed (in MHz)  :        120  
  Available Memory            :    8388608  KB
  Good Memory Required        :      25820  KB

   Primary boot path:    0/0/1/1.15          
   Alternate boot path:  0/0/2/1.15          
   Console path:         0/0/4/1.643         
   Keyboard path:        0/0/4/1.0           


---- Main Menu ---------------------------------------------------------------


Press Q/q to quit, Enter to continue: 

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


Press Q/q to quit, Enter to continue: 


HARD Booted.
palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004

Partition Start(MB) End(MB) Id Type
1               1     513   82 swap
2             514     524   f0 Palo
3             525    2051   83 ext2
4            2052    8682   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 6673841 bytes @ 0x20140000
Current command line:
3/boot/vmlinux-2.6.10-pa6-64SMP root=/dev/sda3 HOME=/ console=ttyS0 TERM=linux
 0: 3/boot/vmlinux-2.6.10-pa6-64SMP


Press Q/q to quit, Enter to continue: 
 1: root=/dev/sda3
 2: HOME=/
 3: console=ttyS0
 4: TERM=linux

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0
3/boot/vmlinux-2.6.11-rc4-pa1  
Current command line:
3/boot/vmlinux-2.6.11-rc4-pa1 root=/dev/sda3 HOME=/ console=ttyS0 TERM=linux
 0: 3/boot/vmlinux-2.6.11-rc4-pa1
 1: root=/dev/sda3
 2: HOME=/
 3: console=ttyS0
 4: TERM=linux

<#>    edit the numbered field


Press Q/q to quit, Enter to continue: 
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? b

Command line for kernel: 'root=/dev/sda3 HOME=/ console=ttyS0 TERM=linux palo_kernel=3/boot/vmlinux-2.6.11-rc4-pa1'
Selected kernel: /boot/vmlinux-2.6.11-rc4-pa1 from partition 3
ELF64 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 4513520 mediaptr 0x1000
Segment 1 load 00550000 size 290792 mediaptr 0x44f000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.11-rc4-pa1 (grundler@gsyprf11.external.hp.com) (gcc version 3.4.4 20041218 (prerelease) (Debian 3.4.3-6)) #1 SMP Tue Feb 15 23:18:42 PST 2005
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005e20 00000491 00000000 00000001 73a33d02 100000f0 00000008 000000b2 000000b2

Press Q/q to quit, Enter to continue: 

vers  00000203
CPUID vers 19 rev 8 (0x00000268)
capabilities 0x5
model 9000/800/A500-6X
Memory Ranges:
 0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 Mb
 1) Start 0x0000000100000000 End 0x00000001ffffffff Size   4096 Mb
 2) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 Mb
Total Memory: 8192 Mb
SMP: bootstrap CPU ID is 0
Built 3 zonelists
Kernel command line: root=/dev/sda3 HOME=/ console=ttyS0 TERM=linux palo_kernel=3/boot/vmlinux-2.6.11-rc4-pa1
PID hash table entries: 4096 (order: 12, 131072 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Memory: 8388608k available
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
Brought up 1 CPUs
NET: Registered protocol family 16

Press Q/q to quit, Enter to continue: 

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
Releasing cpu 1 now, hpa=fffffffffffa2000
FP[1] enabled: Rev 1 Model 19
CPU(s): 2 x PA8700 (PCX-W2) at 650.000000 MHz
Setting cache flush threshold to 485700 (2 CPUs online)
SBA found Astro 2.1 at 0xfffffffffed00000
LBA version TR4.0 (0x5) found at 0xfffffffffed30000
iosapic: no IRTE for 0000:00:04.0 (IRQ not connected?)
LBA version TR4.0 (0x5) found at 0xfffffffffed34000
LBA version TR4.0 (0x5) found at 0xfffffffffed38000

Press Q/q to quit, Enter to continue: 

LBA version TR4.0 (0x5) found at 0xfffffffffed3c000
SCSI subsystem initialized
unwind_init: start = 0x103ee400, end = 0x10409ec0, entries = 7084
Performance monitoring counters enabled for Crescendo 650 W2
Initializing Cryptographic API
PDC Stable Storage facility v0.09
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 17 ports, IRQ sharing enabled
ttyS0 at MMIO 0xfffffffff8000000 (irq = 22) is a 16550A
ttyS1 at MMIO 0xfffffffff8000008 (irq = 22) is a 16550A
ttyS2 at MMIO 0xfffffffff8000010 (irq = 22) is a 16550A
ttyS3 at MMIO 0xfffffffff8000038 (irq = 22) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
sym0: <896> rev 0x7 at pci 0000:00:01.0 irq 19


Press Q/q to quit, Enter to continue: 
sym0: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18n
sym1: <896> rev 0x7 at pci 0000:00:01.1 irq 20
sym1: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18n
sym1: SCSI BUS mode change from SE to SE.
sym1: SCSI BUS has been reset.
  Vendor: SEAGATE   Model: ST39173LC         Rev: 6381
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym1:15:0: tagged command queuing enabled, command queue depth 16.
 target1:0:15: Beginning Domain Validation
 target1:0:15: wide asynchronous.
 target1:0:15: Domain Validation skipping write tests
 target1:0:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
 target1:0:15: Ending Domain Validation
sym2: <875> rev 0x37 at pci 0000:00:02.0 irq 20
sym2: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
sym2: SCSI BUS has been reset.


Press Q/q to quit, Enter to continue: 
scsi2 : sym-2.1.18n
sym3: <875> rev 0x37 at pci 0000:00:02.1 irq 21
sym3: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
sym3: SCSI BUS has been reset.
scsi3 : sym-2.1.18n
  Vendor: HP 73.4G  Model: ST373405LC        Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym3:15:0: tagged command queuing enabled, command queue depth 16.
 target3:0:15: Beginning Domain Validation
 target3:0:15: wide asynchronous.
 target3:0:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
 target3:0:15: Ending Domain Validation
sym4: <896> rev 0x1 at pci 0000:30:02.0 irq 26
sym4: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym4: SCSI BUS has been reset.
scsi4 : sym-2.1.18n
  Vendor: HP        Model: D5989C            Rev: 1.03
  Type:   Processor                          ANSI SCSI revision: 02
 target4:0:5: Beginning Domain Validation
 target4:0:5: Ending Domain Validation


Press Q/q to quit, Enter to continue: 
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym4:10:0: tagged command queuing enabled, command queue depth 16.
 target4:0:10: Beginning Domain Validation
 target4:0:10: wide asynchronous.
 target4:0:10: Domain Validation skipping write tests
 target4:0:10: FAST-40 WIDE SCSI 80.0 MB/s ST (25.0 ns, offset 15)
 target4:0:10: Ending Domain Validation
Backtrace:
 [<00000000102e4f00>] sym_setsync+0xa0/0xc0
 [<00000000102e8138>] sym_int_sir+0xe40/0x1780
 [<00000000102e93c4>] sym_interrupt+0x94c/0xc50
 [<00000000102dfd14>] sym53c8xx_intr+0x54/0x138
 [<000000001017ce1c>] handle_IRQ_event+0x74/0xf8
 [<000000001017d050>] __do_IRQ+0x1b0/0x2b8
 [<0000000010116350>] do_cpu_irq_mask+0xc0/0x120
 [<0000000010107074>] intr_return+0x0/0x24
 [<000000001011d4dc>] cpu_idle+0x2c/0x48
 [<0000000010111620>] rest_init+0x48/0x58
 [<00000000105509e4>] start_kernel+0x3e4/0x440


Press Q/q to quit, Enter to continue: 
 [<000000001010d078>] __udivdi3+0x0/0x888


Kernel Fault: Code=26 regs=0000000010504c00 (Addr=00000000000001e0)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000001000001110 Not tainted
r00-03  0000000000000000 ffffffffffffff83 00000000102eb7b8 00000000103c8a10
r04-07  0000000000000000 0000000014a1e000 000000000000000b 000000000000000a
r08-11  000000000000000f 0000000000000000 0000000000000001 000000001045a908
r12-15  00000000000000f2 00000000000000fa 00000000000000f0 00000000000000ff
r16-19  00000000105042c0 00000000f000022c 00000000f0002a7c 0000000000030d40
r20-23  0000000000000000 0000000000000320 000000000000000a 00000000000000fa
r24-27  0000000008000000 00000000000000fa 0000000000030dbd 000000001053e640
r28-31  0000000014a1e508 00061b7a00000320 0000000010504c00 0000000000000001
sr0-3   0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000102eb5cc 00000000102eb5d0
 IIR: 529303c0    ISR: 0000000000000000  IOR: 00000000000001e0


Press Q/q to quit, Enter to continue: 
 CPU:        0   CR30: 0000000010504000 CR31: 0000000010508000
 ORIG_R28: 000000001053e640
 IAOQ[0]: sym_announce_transfer_rate+0xd4/0x360
 IAOQ[1]: sym_announce_transfer_rate+0xd8/0x360
 RP(r2): sym_announce_transfer_rate+0x2c0/0x360
Kernel panic - not syncing: Kernel Fault


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
