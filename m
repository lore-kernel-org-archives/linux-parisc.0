Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA31667
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 12:14:54 -0700
Received: from gate.ixs.bb.bawue.de (p3E9D2999.dip.t-dialin.net [62.157.41.153])
	by bender.bawue.de (Postfix) with ESMTP id 1B114817
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 20:16:54 +0100 (CET)
Received: from bawue.de (ixs.ixs.com [192.168.1.2])
	by gate.ixs.bb.bawue.de (8.9.3/8.9.3) with ESMTP id UAA19792
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 20:16:52 +0100
Message-ID: <3A143389.CA59F143@bawue.de>
Date: Thu, 16 Nov 2000 20:20:41 +0100
From: Andreas Thienemann <andreas@bawue.de>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: multipart/mixed;
 boundary="------------F7EF1B69F0A7C4C7DD54E27D"
Subject: [parisc-linux] 250/1 doesn't boot but dumps stack
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------F7EF1B69F0A7C4C7DD54E27D
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I recently got a D-Class HP900 250/1 (at least it says that on the label) and
tried to get the pa-risc port running on it.

So I got a CVS checkout and build the whole toolchain without any major
hassles.

The kernel, including NFS-ROOT, built also without any glitches.

But when I try to boot up this kernel it dumps stack right after initialising
the pty interfaces. (I already left out everything unnecessary, such as
parallel port support)

After that it complains about "Data acces rights fault in kernel: Code=26
regs=c7f98780 (Addr=000000004)" and some more data...

For the curious, the boot sequence is attached.

I hope someone can give me a clue what might be wrong...
Thanks,
 Andreas
--------------F7EF1B69F0A7C4C7DD54E27D
Content-Type: text/plain; charset=us-ascii;
 name="hp9000-capture"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="hp9000-capture"


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
Main Menu: Enter command > bo 8/16/6.0
Interact with IPL (Y or N)?> n

Booting... 
Network Station Address 0060b0-3c08d4

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl root@gate.ixs.com Wed Nov 15 14:08:22 CET 2000
0/vmlinux 2143238 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.168.1.1 '
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100120 first 00100000 n 4
Segment 0 load 00100000 size 1467884 mediaptr 0x1000
Segment 1 load 00268000 size 174520 mediaptr 0x168000
Segment 2 load 00294000 size 103180 mediaptr 0x193000
Segment 3 load 002b0000 size 8192 mediaptr 0x1ad000
branching to kernel entry point 0x00100120
Set default PSW W bit to 0
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02dc000
start_parisc(0x504d6c,0x504d6c,0x0,0x0)
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.168.1.1 '
PALO initrd 0-0
model   00005890 00000481 00000000 00000002 778314c3 100000f0 00000004 0000008a 0000008a
vers    0000000d
cpuid   0000016d
CPUID vers 11 rev 13
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
Linux version 2.4.0-test10 (root@gate.ixs.com) (gcc version 2.96 20000925 (experimental)) #4 Wed Nov 15 19:06:49 CET 2000
free_bootmem(0x2dd000, 0x7d23000)
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX root=/dev/nfs nfsroot=192.168.1.1 
trap_init
Calibrating delay loop... 100.76 BogoMIPS
Memory: 125568k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
Found i82596 at 0xffd07000, IRQ 87
early initialization of device eth0 is deferred
Initializing Lasi PS/2-keyboard port at 0xffd08000...
Support for Lasi PS/2-psaux not yet available !
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
lp0: using parport0 (interrupt-driven).

Dumping Stack from c7f98000 to c7f989c0:
8000 00000000 00000040 00000000 00000000 c027c32c 00000000 00000000 ffffffff
8020 00000001 00000000 00000000 00000000 00000000 00000000 ffffffff c027c244
8040 c027c244 00000031 c7f90000 c02b0000 c028160c 00000000 00000000 00000000
8060 00000000 00000000 00000000 00000001 00000000 00000000 00000000 00000000
8080 00000000 c02b0000 c02b0000 c7f84000 00000000 00000000 c7f84098 c02b0098
80a0 00000000 c02cba18 00000000 c7f980ac c7f980ac c7f980b4 c01177f4 c7f98908
80c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
80e0 00000000 00000000 c7f98000 c011a5e4 00000000 0000000f 00000000 00000000
8100 00000024 00000000 00000033 00000000 00000000 00000000 00000000 00000000
8120 00000000 80000000 00000000 00000000 00000000 00000000 00000000 00000000
8140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
8160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
8180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
81a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
81c0 00000000 00000000 00000000 fffffeff 00000000 ffffffff 00000000 c027ceb8
81e0 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 00800000 05000000
8200 00000000 ffffffff ffffffff ffffffff 00000800 00000800 00000400 00000400
8220 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 00007377 61707065
8240 72000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
8260 00008000 c0269000 c0269000 c013de10 00010000 c7ffeba0 c022248c c0234898
8280 000000f0 c02db000 00000000 c0118cf0 c0269054 00008000 c0269000 c0269054
82a0 f0000068 f0000070 c027c000 c027c368 0000000b 00000024 0000003c 0000003e
82c0 c027c000 00000000 c01001dc 00000004 00000000 00000023 c02b61ef 00000000
82e0 c027c000 f0000070 f0000068 000000ff ffd05800 ffd05800 ffd05800 00000060
8300 ffffffff ffd05800 002b50c0 c0268000 00000000 00000000 c02b08c0 00000000
8320 000b0800 00000000 0000001f 00000000 0000001f 00000000 0000001f 00000000
8340 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
8360 00000010 00000020 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000
8380 45e69c6a 25b7ea20 41800000 00000000 00000010 00000010 00000000 00000000
83a0 00000040 00000080 00000100 00000200 00000400 00000800 7fffffff 7fffffff
83c0 41000000 00000000 7fffffff 7fffffff 40800000 00000000 41000000 00000000
83e0 40300000 00000000 40200000 00000000 40200000 00000000 41800000 7fffffff
8400 40000000 00000000 40000000 00000000 40800000 00000000 41000000 00000000
8420 00000000 00000000 c7f98800 c0103cf4 00000000 00000000 00000000 00000000
8440 00000000 00000000 c0118ce0 c0118ce4 40800000 00000000 00282000 00000000
8460 c0281040 c0281064 00000000 c0281204 00000000 00000000 00000000 c7f98478
8480 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
84a0 00000000 00000000 71894dcb e3642ec4 c6c85d89 8d90bb13 1b217627 3634591c
84c0 6c1e076a d84abb86 b095770d 612aee1b c2236964 8446d2c9 088da593 116dfe74
84e0 22ad49ba 452c2626 8a2ef91e c0103c48 28cd5128 51ec1702 a3ae9b56 475d36ad
8500 c7f98000 c028160c 00000000 76fd1fb2 ed8c8a36 db19146d b63228db 6c6451b7
8520 d8be163c b17c2c79 62f858f3 c01001f0 8b0c0969 161812d3 2c4690f4 58fb94ba
8540 b1819c26 6303384d c670c5c8 8ce18b91 19c31723 33f09b14 6797837a cf59b3a6
8560 9eb3674d 3d66ce9b 7abb2864 c0294ef4 ea01cb35 d403966b a8072cd7 500e59af
8580 00000000 c02b0000 81dead60 03bd5ac1 00000060 c027c35c c027c35c c025920c
85a0 7234ad2e e41fef0e c83fde1d c0294ea0 20ff7877 418845bc 83663e2a 06cc7c55
85c0 c02ad30c c02ad2cc 00000000 00000000 00000000 c7f985d4 c7f985d4 c7f985dc
85e0 c7f985dc c7f985e4 00000000 c0298ca0 00000000 c7f985d4 c7f985d4 c7f985dc
8600 c027e800 00000000 00000000 00000000 000000fa 000000f2 000000ff c0295514
8620 000000f0 c02cb800 c02b06c0 c0299814 c028160c c02ad30c c02ad2bc c028160c
8640 c02b06c0 c7f98000 c028160c c02ad30c c02ad2d0 c7f94800 c0230add 0000003e
8660 c027c000 00000001 c02b6206 c0299744 c02b61ce 00000037 c02b6206 00000000
8680 c02ad30c c02ad2d0 00000040 c02cb800 000000fa 000000f2 000000ff c0295514
86a0 000000f0 c02cb800 c02b06c0 c02a4af4 c028160c c02ad30c c02ad2d0 c7f98000
86c0 c028b800 c01e2468 ffffffff c028b1e4 c7ffc400 c028160c c024256c c0186688
86e0 c028160c c02c6104 c01e2468 c029c4e0 c028b310 c028b1b4 c7f988c0 00000000
8700 ffffffff 0000ffe0 0060b03c 08d4bcfc 00000000 00000008 c0295514 000000f0
8720 c02cb800 c028b800 c01e2468 ffffffff c028b1e4 c7ffc400 c02bfc1c c02bfe50
8740 00000063 00000008 c7f98718 c024256c 00000000 c0285038 c028b1b9 c0242340
8760 45e69c6a 25b7ea20 41800000 c029c248 00000010 00000010 00000000 00000000
8780 0004000b c02ca800 c029c248 00000000 c7ffc400 ffffffff c01e2468 c028b800
87a0 c02cb800 000000f0 00000000 000000ff 000000f2 000000fa 000000fd f0100000
87c0 f0001180 f0000070 f0000068 00000000 c7f9870e 00000002 c029c4d0 ffd07000
87e0 c7f98710 00000f20 00000000 c0268000 00000001 00000000 c7f989c0 002b31b8
8800 000b0800 00000000 0000001f 00000000 0000001f 00000000 0000001f 00000000
8820 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
8840 00000010 00000020 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000
8860 45e69c6a 25b7ea20 41800000 00000000 00000010 00000010 00000000 00000000
8880 00000040 00000080 00000100 00000200 00000400 00000800 7fffffff 7fffffff
88a0 41000000 00000000 7fffffff 7fffffff 40800000 00000000 41000000 00000000
88c0 40300000 00000000 40200000 00000000 40200000 00000000 41800000 7fffffff
88e0 40000000 00000000 40000000 00000000 40800000 00000000 41000000 00000000
8900 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
8920 00000000 00000000 c029c264 c029c268 00000000 00000000 c7f98b00 00000000
8940 00000000 00000000 0000001f 00000000 0000001f 0e681096 00000000 00000004
8960 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
8980 00000010 00000020 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000
89a0 45e69c6a 25b7ea20 41800000 c01046e0 00000010 00000010 00000000 00000000

Data access rights fault in kernel: Code=26 regs=c7f98780 (Addr=00000004)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001011
r0-3     00000000 c02ca800 c029c248 00000000
r4-7     c7ffc400 ffffffff c01e2468 c028b800
r8-11    c02cb800 000000f0 00000000 000000ff
r12-15   000000f2 000000fa 000000fd f0100000
r16-19   f0001180 f0000070 f0000068 00000000
r20-23   c7f9870e 00000002 c029c4d0 ffd07000
r24-27   c7f98710 00000f20 00000000 c0268000
r28-31   00000001 00000000 c7f989c0 002b31b8
sr0-4    00000000 00000000 00000000 00000000
sr4-8    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c029c264 c029c268
 IIR: 0e681096    ISR: 00000000  IOR: 00000004
ORIG_R28: 00000000

--------------F7EF1B69F0A7C4C7DD54E27D--
