Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA17073
	for <parisc-linux@puffin.external.hp.com>; Thu, 5 Oct 2000 18:32:25 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 357336C
	for <parisc-linux@thepuffingroup.com>; Thu,  5 Oct 2000 17:33:24 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id RAA05141
	for parisc-linux@thepuffingroup.com; Thu, 5 Oct 2000 17:37:34 -0700 (PDT)
Date: Thu, 5 Oct 2000 17:37:34 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010060037.RAA05141@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] udelay() inconsistent
List-ID: <linux-parisc.vger.kernel.org>

Hi PA2.0 guru's,
udelay/mdelay code is broken for wide-mode kernel bits.
It explains why SCSI and LAN complain as well.
I've appended console output which includes my instrumentation.

The symptom is the first mdelay call is correct.  (ie mdelay(1) uses
398729 cycles on 400Mhz machine.) The next calls to the same code result
in nearly *twice* as many cycles (796488).

"ms 174  D_cr16 70238957" are in agreement.  (ie 70238957/400000 = 175)
(CPU_cycles/ (CPU_cycles/msec) -> msec)
The loop which counts "ms" uses mdelay(1). The ms and D_cr16 reported on 
previous console output were NOT in agreement and may not be here
either in every case. My point is not *every* successive call to mdelay
is wrong - perhaps it depends on code alignment.

I tried a few things:
o appended UL to 1000000 in __delay() function (include/asm-parisc/delay.h)
o changed .balign to 16 instead of 64 - only need to guarantee
  loop is in the same cacheline.

and neither changed the behavior.

I was guessing the problem might have something to do with branch
prediction upon entering the loop is different on successive attempts
but haven't studied that yet.


I still need to work on the "CACHE TEST FAILED: script execution failed."
messages. I'm pretty sure those are due to LCI instruction being (mis-)used
in sba_iommu.c.

thanks,
grant

ps. Side note: INW() (ie gsc_readw()) costs 500-600 cycles
    on my C3000 which is running 400Mhz. PIO is expensive!
    reducing PIO in the performance path is "a good thing"(tm).



Firmware Version 4.0

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      400 MHz    Active                 Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:              536870912 bytes
  Good memory required:           10223616 bytes

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  LAN.15.8.80.76.3.254
  Console path:         GRAPHICS(2)
  Keyboard path:        USB

CPU 0
WARNING:  Processor self-tests have been disabled because FASTBOOT is
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
WARNING:  Memory has been initialized but not tested because FASTBOOT is
          enabled.  To test memory, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


----- Main Menu -------------------------------------------------------------

      Command                           Description
      -------                           -----------
      BOot [PRI|ALT|<path>]             Boot from specified path
      PAth [PRI|ALT|CON|KEY [<path>]]   Display or modify a path
      SEArch [DIsplay|[[IPL] [<path>]]] Search for boot devices

      COnfiguration [<command>]         Access Configuration menu/commands
      INformation [<command>]           Access Information menu/commands
      SERvice [<command>]               Access Service menu/commands

      DIsplay                           Redisplay the current menu
      HElp [<menu>|<command>]           Display help for menu or command
      RESET                             Restart the system
-----
Main Menu: Enter command > bo lan
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 001083-360089

System IP Address 15.8.80.77
Server IP Address 15.8.81.247

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@hpisp747 Mon Sep 25 17:09:43 PDT 2000
0/vmlinux 2651949 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 '
Kernel: partition 0 file /vmlinux
ELF64 executable

Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 1683960 mediaptr 0x1000
Segment 1 load 0029c000 size 404064 mediaptr 0x19d000
Segment 2 load 00300000 size 147456 mediaptr 0x200000
branching to kernel entry point 0x00100000
Set default PSW W bit to 1
PDC Console Initialized
The 64-bit Kernel has started...
Enabled FP coprocessor
If this is the LAST MESSAGE YOU SEE, you're probably using
32-bit millicode by mistake.
Free memory starts at: 0xc036d000
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 '
PALO initrd 0-0
model   00005bb0 00000481 00000000 00000002 77cd9463 100000f0 00000008 000000b2 000000b2
vers    00000200
cpuid   00000224
CPUID vers 17 rev 4
CPU might be a PA8500 (PCX-W)
CPU(s): 1 x PA8500 (PCX-W) at 400.000000 MHz
Searching for devices in PDC firmware... processor hpa 0xfffffffffffa0000
a newer box...
Found devices:
1. Astro BC Runway Port (12) at 0xfffffffffed00000, versions 0x582, 0x0, 0xb, 0x0, 0x10
2. Elroy PCI Bridge (13) at 0xfffffffffed30000, versions 0x782, 0x0, 0xa, 0x0, 0x0
3. Elroy PCI Bridge (13) at 0xfffffffffed32000, versions 0x782, 0x0, 0xa, 0x0, 0x0
4. Elroy PCI Bridge (13) at 0xfffffffffed38000, versions 0x782, 0x0, 0xa, 0x0, 0x0
5. Elroy PCI Bridge (13) at 0xfffffffffed3c000, versions 0x782, 0x0, 0xa, 0x0, 0x0
6. AllegroHigh W  (0) at 0xfffffffffffa0000, versions 0x5bb, 0x0, 0x4, 0x0, 0x81
7. AllegroHigh Memory (1) at 0xfffffffffed10200, versions 0x86, 0x0, 0x9, 0x0, 0x0
That's a total of 7 devices.
Linux version 2.4.0-test6 (grundler@hpisp747) (gcc version 2.96 20000822 (experimental)) #28 Thu Oct 5 16:14:41 PDT 2000
free_bootmem(0x36d200, 0xc92e00)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 4096
zone(0): 2048 pages.
zone(1): 2048 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa64 
trap_init
Calibrating delay loop... 797.90 BogoMIPS
Memory: 12268k available
Dentry-cache hash table entries: 2048 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 512 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order: 3, 32768 bytes)
Inode-cache hash table entries: 1024 (order: 2, 16384 bytes)
POSIX conformance testing by UNIFIX
lba_init() called. registering driver.
lba version TR2.1 (0x2) found at 0xfffffffffed30000
lba_fixup_bus(0x00000000c0fd20e0) bus 0 sysdata 0x00000000c0ff81e0
lba version TR2.1 (0x2) found at 0xfffffffffed32000
lba_fixup_bus(0x00000000c0fd21e0) bus 1 sysdata 0x00000000c0ff83a0
lba version TR2.1 (0x2) found at 0xfffffffffed38000
lba_fixup_bus(0x00000000c0fd22e0) bus 2 sysdata 0x00000000c0ff84a0
lba version TR2.1 (0x2) found at 0xfffffffffed3c000
lba: iosapic_register says not used
Warning : device (13, 0x782, 0x0, 0xa, 0x0) NOT claimed by lba TR2.1
SBA found Astro 2.1 at 0xfffffffffed00000
lba_init_iregs() ibase 0x1 imask 0xff000000
lba_init_iregs() base_addr fffffffffed38000
lba_init_iregs() base_addr fffffffffed32000
lba_init_iregs() base_addr fffffffffed30000
lba_init_iregs() done
lba: lba_bios_init
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 256 buckets, 4Kbytes
TCP: Hash tables configured (established 512 bind 512)
Starting kswapd v1.7
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
sym53c8xx: at PCI bus 1, device 5, function 0
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 15, function 0
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 15, function 1
sym53c8xx: 53c896 detected 
sym53c875-0: rev 0x3 on pci bus 1 device 5 function 0 irq 769
ncrgetfreq()  mdelay(1) = 398755  INW(nc_sist) costs cr16 672
ncrgetfreq()  ms 175  D_cr16 70643409
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 571
ncrgetfreq()  ms 156  D_cr16 62972030
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 575
ncrgetfreq()  ms 156  D_cr16 62972370
sym53c875-0: NCR clock is 56976KHz
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-0: on-chip RAM at 0xf4901000
ncrgetfreq()  mdelay(1) = 796489  INW(nc_sist) costs cr16 572
ncrgetfreq()  ms 169  D_cr16 68221690
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 573
ncrgetfreq()  ms 211  D_cr16 85174528
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 573
ncrgetfreq()  ms 211  D_cr16 85174949
CACHE TEST FAILED: script execution failed.
start=00090dd8, pc=00090de0, end=00090df8
CACHE INCORRECTLY CONFIGURED.
sym53c875-0: giving up ...
kernel BUG at sym53c8xx.c:719!
sym53c896-0: rev 0x4 on pci bus 0 device 15 function 0 irq 513
ncrgetfreq()  mdelay(1) = 796483  INW(nc_sist) costs cr16 566
ncrgetfreq()  ms 174  D_cr16 70237558
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 567
ncrgetfreq()  ms 156  D_cr16 62971858
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 567
ncrgetfreq()  ms 156  D_cr16 62971969
sym53c896-0: NCR clock is 56976KHz
sym53c896-0: ID 7, Fast-20, Parity Checking
sym53c896-0: on-chip RAM at 0xf4002000
ncrgetfreq()  mdelay(1) = 796489  INW(nc_sist) costs cr16 574
ncrgetfreq()  ms 169  D_cr16 68220199
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 569
ncrgetfreq()  ms 211  D_cr16 85173788
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 568
ncrgetfreq()  ms 187  D_cr16 75487845
CACHE TEST FAILED: script execution failed.
start=000b0dd8, pc=000b0de0, end=000b0df8
CACHE INCORRECTLY CONFIGURED.
sym53c896-0: giving up ...
kernel BUG at sym53c8xx.c:719!
sym53c896-0: rev 0x4 on pci bus 0 device 15 function 1 irq 513
ncrgetfreq()  mdelay(1) = 796483  INW(nc_sist) costs cr16 566
ncrgetfreq()  ms 174  D_cr16 70238957
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 568
ncrgetfreq()  ms 156  D_cr16 62971505
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 569
ncrgetfreq()  ms 156  D_cr16 62971521
sym53c896-0: NCR clock is 56976KHz
sym53c896-0: ID 7, Fast-20, Parity Checking
sym53c896-0: on-chip RAM at 0xf4000000
ncrgetfreq()  mdelay(1) = 796489  INW(nc_sist) costs cr16 563
ncrgetfreq()  ms 169  D_cr16 68218650
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 569
ncrgetfreq()  ms 211  D_cr16 85172765
ncrgetfreq()  mdelay(1) = 796488  INW(nc_sist) costs cr16 571
ncrgetfreq()  ms 211  D_cr16 85174385
CACHE TEST FAILED: script execution failed.
start=000d0dd8, pc=000d0de0, end=000d0df8
CACHE INCORRECTLY CONFIGURED.
sym53c896-0: giving up ...
kernel BUG at sym53c8xx.c:719!
scsi : 0 hosts.
scsi : detected total.
82596: sizeof(struct i596_rfd) = 64
Serial driver version 5.01 (2000-05-29) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
pcibios_enable_device: Enabling device 01:04.0 (0043 -> 0143)
ttyS00 at port 0x12200 (irq = 770) is a 16550A
Linux Tulip driver version 0.9.8 (July 13, 2000)
pcibios_enable_device: Enabling device 00:0c.0 (0057 -> 0157)
eth0: Digital DS21143 Tulip rev 48 at 0x1000, 00:10:83:36:00:89, IRQ 514.
eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
Sending BOOTP requests...
