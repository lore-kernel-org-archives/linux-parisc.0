Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA09548
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 16:03:09 -0700
Received: from gate.ixs.bb.bawue.de (pC19F81C8.dip.t-dialin.net [193.159.129.200])
	by bender.bawue.de (Postfix) with ESMTP id 7595C869
	for <parisc-linux@thepuffingroup.com>; Sun,  3 Dec 2000 00:05:36 +0100 (CET)
Received: from bawue.de (ixs.ixs.com [192.168.1.2])
	by gate.ixs.bb.bawue.de (8.9.3/8.9.3) with ESMTP id AAA18566
	for <parisc-linux@thepuffingroup.com>; Sun, 3 Dec 2000 00:04:08 +0100
Message-ID: <3A298032.7CBAEB95@bawue.de>
Date: Sun, 03 Dec 2000 00:05:22 +0100
From: Andreas Thienemann <andreas@bawue.de>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: multipart/mixed;
 boundary="------------22544189CD8A530A463B2CD4"
Subject: [parisc-linux] Again trouble with HP9000/821/D250
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------22544189CD8A530A463B2CD4
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I tried to get parisc booting on a second box after the first box couldn't
finish loading the kernel.

The whole toolchain and the kernel is a recent cvs checkout from today.

Boot log looks great until the ramdisk is initialized and the kernel dumps
stack.
This kernel is already stripped down, no lp0 no nothing. Basically just
ethernet and scsi support plus PCI, without the kernel does not compile at
all.

Any ideas? The bootlog is attached. To me it looks as if the i82596_probe
might be repsonsible. At least that's what a quick check of the IAOQ-address
suggested.

thanks a lot, 
 andreas

-- 
Andreas Thienemann				e-mail:	andreas@bawue.de
System administration
Bawue Net, Germany
--------------22544189CD8A530A463B2CD4
Content-Type: text/plain; charset=us-ascii;
 name="hp9k"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="hp9k"




Firmware Version  36.34

Duplex Console IO Dependent Code (IODC) revision 0

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------
      0       101 MHz   Active                 Functional          256 KB

  Central Bus Speed (in MHz)  :        101 

  Available memory (bytes)    :  134217728 
  Good memory required (bytes):   15245312 

  Primary boot path:    8/16/5.5   (dec)   
  Alternate boot path:  8/16/5.2   (dec)   
  Console path:         8/16/4.0   (dec)   
  Keyboard path:        8/16/7.0   (dec)   

Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

Boot terminated.


------- Main Menu -------------------------------------------------------------

        Command                         Description
        -------                         -----------
        BOot [PRI|ALT|<path>]           Boot from specified path
        PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path
        SEArch [DIsplay|IPL] [<path>]   Search for boot devices

        COnfiguration [<command>]       Access Configuration menu/commands
        INformation [<command>]         Access Information menu/commands
        SERvice [<command>]             Access Service menu/commands

        DIsplay                         Redisplay the current menu
        HElp [<menu>|<command>]         Display help for menu or command
        RESET                           Restart the system
-------
Main Menu: Enter command > pa p3

ERROR:  Unknown path type

Main Menu: Enter command > pa 8saea

Searching for potential boot device(s)...
This may take several minutes.

To discontinue search, press any key (termination may not be immediate).


   Path Number        Device Path (dec)        Device Type
   -----------        -----------------        -----------
   P0                 8/16/5.6                 Random access media       
   P1                 8/16/5.5                 Random access media       
   P2                 8/16/5.2                 Random access media       
   P3                 8/16/6.0                 LAN Module


Main Menu: Enter command > bo 8/16/6.0
Interact with IPL (Y or N)?> n

Booting... 
Network Station Address 0060b0-3c08d4

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl root@gate.ixs.com Sat Dec  2 21:08:27 CET 2000
0/vmlinux 1954061 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.168.1.1 '
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 001000b8 first 00100000 n 3
Segment 0 load 00100000 size 1279328 mediaptr 0x1000
Segment 1 load 0023a000 size 174384 mediaptr 0x13a000
Segment 2 load 00268000 size 73728 mediaptr 0x165000
branching to kernel entry point 0x001000b8
Set default PSW W bit to 0
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02a3000
start_parisc(0x504d6c,0x504d6c,0x0,0x0)
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.168.1.1 '
PALO initrd 0-0
model   00005890 00000481 00000000 00000002 778314c3 100000f0 00000004 0000008a 0000008a
vers    0000000d
cpuid   0000016d
CPUID   vers 11 rev 13
model   9000/821/D250
led_init: CPU_HVERSION 589
Searching for devices in PDC firmware... processor hpa 0xfffa0000
a newer box...
Found devices:
1. UL 350 Lasi Core BA (11) at 0xffd00000, versions 0x2e, 0x0, 0x81, 0x0, 0x0
2. UL 350 Lasi Core RS-232 (10) at 0xffd05000, versions 0x2e, 0x0, 0x8c, 0x0, 0x0
3. UL 350 Core SCSI (10) at 0xffd06000, versions 0x2e, 0x0, 0x82, 0x0, 0x80
4. UL 350 Core LAN (802.3) (10) at 0xffd07000, versions 0x2e, 0x0, 0x8a, 0x0, 0x0
5. UL 350 Core Centronics (10) at 0xffd02000, versions 0x2e, 0x0, 0x74, 0x0, 0x0
6. UL 350 Core PC Keyboard (10) at 0xffd08000, versions 0x2e, 0x0, 0x84, 0x0, 0x0
7. UL 350 Core PC Keyboard (10) at 0xffd08100, versions 0x2e, 0x0, 0x84, 0x0, 0x0
8. UL 350 Core PC Floppy (10) at 0xffd0a000, versions 0x2e, 0x0, 0x83, 0x0, 0x0
9. UL 350 Core Wax BA (11) at 0xffe00000, versions 0x30, 0x0, 0x8e, 0x0, 0x0
10. UL 350 Wax EISA BA (11) at 0xfc000000, versions 0x30, 0x0, 0x90, 0x0, 0x0
11. UL 350 Wax Core RS-232 (10) at 0xffe02000, versions 0x30, 0x0, 0x8c, 0x0, 0x0
That's a total of 11 devices.
No CPUs reported by firmware - probing...
Found CPU at fffa0000
CPU(s): 1 x PA7200 (PCX-T') at 101.000000 MHz
Linux version 2.4.0-test10 (root@gate.ixs.com) (gcc version 2.96 20000925 (experimental)) #4 Sat Dec 2 23:03:22 CET 2000
free_bootmem(0x2a4000, 0x7d5c000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.168.1.1 
trap_init
Calibrating delay loop... 100.76 BogoMIPS
Memory: 126052k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
lasi_led_init: CPU_HVERSION 589
LED display at ffd0c000
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
Found i82596 at 0xffd07000, IRQ 87
early initialization of device eth0 is deferred
Initializing Lasi PS/2-keyboard port at 0xffd08000...
Support for Lasi PS/2-psaux not yet available !
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
Lasi PS/2 transmit buffer timeout
Lasi PS/2 transmit buffer timeout
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize

Dumping Stack from c7f9c000 to c7f9ca00:
c000 00000000 00000040 00000000 00000000 c024e1ec 00000001 00000000 ffffffff
c020 00000000 00000000 00000000 00000000 00000000 00000000 ffffffff c024e104
c040 c024e104 00000030 c7f90000 c0278000 c025360c 00000000 00000000 00000000
c060 00000000 00000000 00000000 00000001 00000000 00000000 00000000 00000000
c080 00000000 c0278000 c0278000 c7f84000 00000000 00000000 c7f84098 c0278098
c0a0 00000000 c0292b38 00000000 c7f9c0ac c7f9c0ac c7f9c908 00000000 00000000
c0c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c0e0 c7f9c000 c011ae08 00000000 0000000f 00000000 00000000 00000024 00000000
c100 00000033 00000000 00000000 00000000 00000000 00000000 00000000 80000000
c120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1c0 00000000 fffffeff 00000000 ffffffff 00000000 c024edec ffffffff ffffffff
c1e0 ffffffff ffffffff ffffffff ffffffff 00800000 05000000 00000000 ffffffff
c200 ffffffff ffffffff 00000800 00000800 00000400 00000400 ffffffff ffffffff
c220 ffffffff ffffffff ffffffff ffffffff 00007377 61707065 72000000 00000000
c240 000000000 00000000 00010000 c7ffeca0 c0204a98 c02143b4 000000f0 00504d6c
c280 00000000 c0117a24 c0291800 00008000 c0292510 c0291800 0000000b 00000024
c2a0 0000003c 0000003e c024e000 00000001 c027de4f 00000004 c027de2b 00000000
c2c0 c01001f8 00000000 00000000 00000024 0000000b c024e220 c024e000 f0000070
c2e0 f0000068 000000ff ffd05800 ffd05800 ffd05800 00000060 ffffffff ffd05800
c300 0027d8c0 c023a000 00000000 00000000 c02788c0 00000000 000b0800 00000000
c320 0000001f 00000000 0000001f 00000000 0000001f 00000000 00000000 00000000
c340 00000000 00000000 00000000 00000000 00000000 00000000 00000010 00000020
c360 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000 45e69c6a 25b7ea20
c380 41800000 00000000 00000010 00000010 00000000 00000000 00000040 00000080
c3a0 00000100 00000200 00000400 00000800 7fffffff 7fffffff 41000000 00000000
c3c0 7fffffff 7fffffff 40800000 00000000 41000000 00000000 40300000 00000000
c3e0 40200000 00000000 40200000 00000000 41800000 7fffffff 40000000 00000000
c400 40000000 00000000 40800000 00000000 41000000 00000000 00000000 00000000
c420 c7f9c800 c0103cf4 00000000 00000000 00000000 00000000 00000000 00000000
c440 c0117a14 c0117a18 40800000 00000000 00254000 00000000 c0253040 c0253064
c460 00000000 c0253204 00000000 00000000 00000000 c7f9c470 00000000 00000000
c480 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c4a0 ff568802 fead1005 fd5a200b fab44017 f568802f ead1005f d5a200bf ab44017f
c4c0 568802ff ad66b0ac 5acd6159 b5ec77e0 6bd8efc1 d7c76ad0 af8ed5a1 5f1dab43
c4e0 be4de3d4 7c9bc7a9 f9413a00 c0103c48 e504e803 ca09d007 9413a00f 2827401f
c500 c7f9c000 c025360c 00000000 806dcb78 00db96f1 01c198b0 03f58432 079dbd36
c520 0f4dcf3e 1eed2b2e 3dace30e c010020c f62853ce ec50a79d d8a14f3b b1429e77
c540 62853cef c57ccc8c 8af99919 15f33233 c02786c0 c7f9c000 c025360c 00000000
c560 c0278000 7629b391 ec25d270 d84ba4e1 b09749c3 612e9387 c22b925c 845724b9
c580 08ae4973 112a27b4 2222fa3a 44334126 8810371e 10206e3d 20366928 401a6702
c5a0 80427b56 0084f6ad 017f5808 c0268f74 0566bfd6 0abbcafe 150120ae 2a74f40e
c5c0 00000001 c0257000 52901f9d a5568a68 00000060 ffffffff 00000021 c022a088
c5e0 a9ff3872 53fe70e5 a78a5498 c0268eb8 9e5fe730 3cbfce61 79092990 f264e672
c600 c02778b4 c027787c 00000000 00000000 00000000 c7f9c614 c7f9c614 c021157c
c620 00000000 00000000 00000000 c026d298 c7f9c614 c0295000 c02778b4 c027785c
c640 c0250800 00000000 00000000 00000000 000000fa 000000f2 000000ff c02696c8
c660 000000f0 c0292800 c0295000 c026de04 c0291000 c02778b4 c027786c c0291000
c680 c0295000 c023a000 c0291000 c02778b4 c0277880 c7ffca00 01234567 c7f9c000
c6a0 00000000 00000000 c0295000 c026ddc8 c0291000 00010800 c7f9c608 c024e220
c6c0 000000f0 c0292800 c0295000 c023a000 c0291000 c02778b4 c0277880 c02696c8
c6e0 000000f0 c0292800 c0295000 c02734cc c0291000 c02778b4 c0277880 c024e220
c700 c025d800 c01c3870 ffffffff c025d18c c7ffc400 00001000 00000010 c021ee78
c720 c028d000 c028d2f8 c01c3870 c0271584 c025d2b8 c025d15c c7f9c900 00000000
c740 ffffffff 0000ffe0 0060b03c 08d40000 00000000 00000008 c02696c8 000000f0
c760 c0292800 c025d800 c01c3870 ffffffff c025d18c c7ffc400 c0287800 c0257000
c780 00000063 00000008 c7f9c758 c02962c4 c0257000 00000000 c025d161 00000000
c7a0 c017e2a0 c017e300 c017e4c4 c02712ec f0100000 f0001180 f0000070 f0000068
c7c0 0004000b c0291800 c02712ec 00000000 c7ffc400 ffffffff c01c3870 c025d800
c7e0 c0292800 000000f0 00000000 000000ff 000000f2 000000fa 000000fd f0100000
c800 f0001180 f0000070 f0000068 00000000 c7f9c74e 00000002 c0271574 ffd07000
c820 c7f9c750 00000f20 00000000 c023a000 00000001 00000000 c7f9ca00 0027b9b8
c840 000b0800 00000000 0000001f 00000000 0000001f 00000000 0000001f 00000000
c860 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c880 00000010 00000020 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000
c8a0 45e69c6a 25b7ea20 41800000 00000000 00000010 00000010 00000000 00000000
c8c0 00000040 00000080 00000100 00000200 00000400 00000800 7fffffff 7fffffff
c8e0 41000000 00000000 7fffffff 7fffffff 40800000 00000000 41000000 00000000
c900 40300000 00000000 40200000 00000000 40200000 00000000 41800000 7fffffff
c920 40000000 00000000 40000000 00000000 40800000 00000000 41000000 00000000
c940 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c960 00000000 00000000 c0271308 c027130c 40800000 00000000 41000000 00000000
c980 00000000 000000fd 000000fa 000000f2 0000001f 0e681096 00000000 00000004
c9a0 00000001 00000000 c024f118 c024f458 c024f258 00000000 41000000 00000000
c9c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c9e0 00000000 00000000 c0117a14 c0104704 c024f258 a0174c55 402e98ab 802b8404

Data access rights fault in kernel: Code=26 regs=c7f9c7c0 (Addr=00000004)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001011
r0-3     00000000 c0291800 c02712ec 00000000
r4-7     c7ffc400 ffffffff c01c3870 c025d800
r8-11    c0292800 000000f0 00000000 000000ff
r12-15   000000f2 000000fa 000000fd f0100000
r16-19   f0001180 f0000070 f0000068 00000000
r20-23   c7f9c74e 00000002 c0271574 ffd07000
r24-27   c7f9c750 00000f20 00000000 c023a000
r28-31   00000001 00000000 c7f9ca00 0027b9b8
sr0-4    00000000 00000000 00000000 00000000
sr4-8    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c0271308 c027130c
 IIR: 0e681096    ISR: 00000000  IOR: 00000004
ORIG_R28: 000000fd

--------------22544189CD8A530A463B2CD4--
