Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 00FED487A
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  4 Apr 2004 00:23:14 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 6C7E829804B
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  4 Apr 2004 00:23:13 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 02266-10 for <parisc-linux@lists.parisc-linux.org>;
	Sun, 4 Apr 2004 00:23:11 -0700 (MST)
Date: Sun, 4 Apr 2004 00:23:11 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040404072311.GA2650@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Domain Validation or gcc 3.3.3 bug?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I trying to build/boot 64-bit UP kernel on an A500.
But using gcc 3.3.3 tool chain...I'd just blame the toolchain
but this box (intentionally) has a "wide" SCSI disk tray
connected to the "narrow" SE SCSI port on the a500.
Seems the Domain Validation isn't quite working?
Or this remind someone of any gcc 3.3.3 bugs?

I'll try a kernel built using the trust old hppa64-gcc v3.0.4.
later or tomorrow.

Console output is appended.

thanks,
grant

...
Firmware Version  40.50

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      440  MHz   Active                 Functional         512 KB   1 MB
      1      440  MHz   Idle                   Functional         512 KB   1 MB

  Central Bus Speed (in MHz)  :        111  
  Available Memory            :    2097152  KB
  Good Memory Required        :      11468  KB

   Primary boot path:    0/0/1/1.15          
   Alternate boot path:  0/0/2/1.15          
   Console path:         0/0/4/0.0           
   Keyboard path:        0/0/4/0.0           

 WARNING:  The non-destructive test bit was set, so memory was not tested 
            destructively.  Information only, no action required. 


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
palo ipl 1.4 root@c3k Fri Mar 26 16:18:24 MST 2004

Partition Start(MB) End(MB) Id Type
1               1     513   fd RAID
2             514     524   f0 Palo
3             525    2051   fd RAID
4            2052    8682   fd RAID

PALO(F0) partition contains:
    0/vmlinux64 4822102 bytes @ 0x20140000
Current command line:
3/boot/vmlinux-2.6.5-rc3-pa3 HOME=/ TERM=linux root=/dev/md2 console=ttyS0
 0: 3/boot/vmlinux-2.6.5-rc3-pa3
 1: HOME=/
 2: TERM=linux
 3: root=/dev/md2
 4: console=ttyS0

Edit which field?
(or 'b' to boot with this command line, 'r' to restore)? 0
3/boot/vmlinux-2.6.5-rc3-pa3
Current command line:
3/boot/vmlinux-2.6.5-rc3-pa3 HOME=/ TERM=linux root=/dev/md2 console=ttyS0
 0: 3/boot/vmlinux-2.6.5-rc3-pa3
 1: HOME=/
 2: TERM=linux
 3: root=/dev/md2
 4: console=ttyS0

Edit which field?
(or 'b' to boot with this command line, 'r' to restore)? b

Command line for kernel: 'HOME=/ TERM=linux root=/dev/md2 console=ttyS0 palo_kernel=3/boot/vmlinux-2.6.5-rc3-pa3'
Selected kernel: /boot/vmlinux-2.6.5-rc3-pa3 from partition 3
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 3047808 mediaptr 0x1000
Segment 1 load 003ec000 size 263400 mediaptr 0x2ea000
Segment 2 load 00430000 size 233605 mediaptr 0x32b000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.5-rc3-pa3 (grundler@ios) (gcc version 3.3.3 (Debian 20040401)) #1 Sat Apr 3 23:06:14 PST 2004
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005cb0 00000491 00000000 00000001 23355fdc 100000f0 00000008 000000b2 000000b2
vers  00000300
CPUID vers 17 rev 10 (0x0000022a)
capabilities 0x1
model 9000/800/A500-44
Total Memory: 2048 Mb
On node 0 totalpages: 524288
  DMA zone: 524288 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Built 1 zonelists
Kernel command line: HOME=/ TERM=linux root=/dev/md2 console=ttyS0 palo_kernel=3/boot/vmlinux-2.6.5-rc3-pa3
PID hash table entries: 16 (order 4: 256 bytes)
Console: colour dummy device 160x64
Memory: 2048124k available
Calibrating delay loop... 874.49 BogoMIPS
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Crescendo 440 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5cb, 0x00004 }
2. Crescendo 440 at 0xfffffffffffa2000 [162] { 0, 0x0, 0x5cb, 0x00004 }
3. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
4. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
7. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
8. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of parisc-94 failed with error 1
CPU(s): 1 x PA8500 (PCX-W) at 440.000000 MHz
SBA found Astro 2.1 at 0xfffffffffed00000
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
SCSI subsystem initialized
Performance monitoring counters enabled for Crescendo 440
ikconfig 0.7 with /proc/config*
Initializing Cryptographic API
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 17 ports, IRQ sharing enabled
ttyS0 at MMIO 0xfffffffff8000000 (irq = 132) is a 16550A
ttyS1 at MMIO 0xfffffffff8000008 (irq = 132) is a 16550A
ttyS2 at MMIO 0xfffffffff8000010 (irq = 132) is a 16550A
ttyS3 at MMIO 0xfffffffff8005000 (irq = 133) is a 16550A
ttyS4 at MMIO 0xfffffffff8005008 (irq = 133) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
sym0: <896> rev 0x7 at pci 0000:00:01.0 irq 129
sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18f
Using anticipatory io scheduler
sym0:0:0: ABORT operation started.
sym0:0:0: ABORT operation complete.
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:0:0: tagged command queuing enabled, command queue depth 16.
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:1:0: tagged command queuing enabled, command queue depth 16.
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:2:0: tagged command queuing enabled, command queue depth 16.
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:3:0: tagged command queuing enabled, command queue depth 16.
  Vendor: HP        Model: D5989B            Rev: 1.02
  Type:   Processor                          ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:8:0: tagged command queuing enabled, command queue depth 16.
  Vendor: SEAGATE   Model: ST39102LC         Rev: 7C03
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:9:0: tagged command queuing enabled, command queue depth 16.
sym1: <896> rev 0x7 at pci 0000:00:01.1 irq 130
sym1: No NVRAM, ID 7, Fast-40, SE, parity checking
sym1: SCSI BUS has been reset.
sym1: SCSI BUS mode change from SE to SE.
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18f
  Vendor: SEAGATE   Model: ST39173LC         Rev: 5912
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym1:15:0: tagged command queuing enabled, command queue depth 16.
sym2: <875> rev 0x14 at pci 0000:00:02.0 irq 130
sym2: No NVRAM, ID 7, Fast-20, SE, parity checking
sym2: SCSI BUS has been reset.
scsi2 : sym-2.1.18f
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym2:0:0: tagged command queuing enabled, command queue depth 16.
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym2:1:0: tagged command queuing enabled, command queue depth 16.
sym2:2: FAST-10 WIDE SCSI 20.0 MB/s ST (100.0 ns, offset 15)
sym2: SCSI parity error detected: SCR1=1 DBC=11000000 SBCL=29
sym2: SCSI parity error detected: SCR1=1 DBC=1100000e SBCL=ae
sym2: SCSI parity error detected: SCR1=1 DBC=11000000 SBCL=29
sym2: SCSI parity error detected: SCR1=1 DBC=1100000e SBCL=ae
sym2: SCSI parity error detected: SCR1=1 DBC=11000000 SBCL=29
sym2: SCSI parity error detected: SCR1=1 DBC=1100000e SBCL=ae
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym2:3:0: tagged command queuing enabled, command queue depth 16.
  Vendor: HP        Model: D5989B            Rev: 1.02
  Type:   Processor                          ANSI SCSI revision: 02
sym3: <875> rev 0x14 at pci 0000:00:02.1 irq 131
sym3: No NVRAM, ID 7, Fast-20, SE, parity checking
sym3: SCSI BUS has been reset.
scsi3 : sym-2.1.18f
  Vendor: SEAGATE   Model: ST39173LC         Rev: 5912
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym3:15:0: tagged command queuing enabled, command queue depth 16.
st: Version 20040318, fixed bufsize 32768, s/g segs 256
sym0:0: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sda: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sda: drive cache: write through
 sda: unknown partition table
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
sym0:1: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sdb: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sdb: drive cache: write through
 sdb: unknown partition table
Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
sym0:2: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sdc: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sdc: drive cache: write through
 sdc: unknown partition table
Attached scsi disk sdc at scsi0, channel 0, id 2, lun 0
sym0:3: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sdd: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sdd: drive cache: write through
 sdd: unknown partition table
Attached scsi disk sdd at scsi0, channel 0, id 3, lun 0
sym0:8: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sde: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sde: drive cache: write through
 sde: unknown partition table
Attached scsi disk sde at scsi0, channel 0, id 8, lun 0
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sdf: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sdf: drive cache: write through
 sdf: unknown partition table
Attached scsi disk sdf at scsi0, channel 0, id 9, lun 0
sym1:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
SCSI device sdg: 17781521 512-byte hdwr sectors (9104 MB)
SCSI device sdg: drive cache: write back
 sdg: sdg1 sdg2 sdg3 sdg4
Attached scsi disk sdg at scsi1, channel 0, id 15, lun 0
sym2:0: FAST-10 WIDE SCSI 20.0 MB/s ST (100.0 ns, offset 15)
sym2: SCSI parity error detected: SCR1=1 DBC=1100000e SBCL=ae
<EOF>
