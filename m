Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA6FA4834
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 11:34:37 -0700 (MST)
Date: Tue, 12 Feb 2002 19:34:36 +0100
Subject: Re: [parisc-linux] kernel-2.4.17-pa22 boot problem B132L+ with serial console 
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v480)
Cc: PA/Linux <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20020210063714.D0367482A@dsl2.external.hp.com>
Message-Id: <2AA372F4-1FE7-11D6-9E5F-0030656F07A2@esiee.fr>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Le dimanche 10 f=E9vrier 2002, =E0 07:37 , Grant Grundler a =E9crit :

>
> IIRC, I've tried TULIP_MMIO and I don't think it worked. I tried this
> out a few monthes back and left it disabled in my .config files.
> I'm very certain CONFIG_TULIP_MWI didn't work. Slightly less
> certain about TULIP_MMIO not working.
>
Well we removed the option from the config, but the symptoms remained:
No output with x86 xc,
and the following output with MacOSX xgcc 3.0.2 (from start sequence to=20=

crash).

BTW, it looks a bit like the 'lp0 kablooie' problem...


Thibaut VARENE
PA/Linux ESIEE Team
http://www.esiee.fr/puffin



Firmware Version  6.1

Duplex Console IO Dependent Code (IODC) revision 1

Memory Test/Initialization Completed

=
--------------------------------------------------------------------------=
----
    (c) Copyright 1995-1998, Hewlett-Packard Company, All rights =
reserved
=
--------------------------------------------------------------------------=
----

   Processor   Speed            State           Coprocessor State  Cache=20=

Size
   ---------  --------   ---------------------  ----------------- =20
----------
       0      132 MHz    Active                 Functional          64 =
KB


   Available memory (bytes)    :  134217728
   Good memory required (bytes):  134217728

   Primary boot path:    FWSCSI.6.0
   Alternate boot path:  SESCSI.6.0
   Console path:         SERIAL_1.9600.8.none
   Keyboard path:        PS2

Processor is starting autoboot process.

To discontinue, press any key within 10 seconds.

10 seconds expired.
Proceeding...

Trying Primary Boot Path
------------------------

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 0.96 root@smallone Sun Nov 11 23:23:30 UTC 2001

Partition Start(MB) End(MB) Id Type
1               1     128   82 swap
2             129     144   f0 Palo
3             145    4094   83 ext2

PALO(F0) partition contains:
     0/vmlinux32 3122078 bytes @ 0x8118000

Information: No console specified on kernel command line. This is =
normal.
PALO will choose the console currently  used by firmware (serial).

Command line for kernel: 'root=3D/dev/sda3 HOME=3D/ console=3DttyS0 =
TERM=3Dvt102'
Selected kernel: /boot/vmlinux from partition 3
Opening /boot/vmlinux
Opening /boot/vmlinux-2.4.17-pa22-b132
ELF32 executable
Entry 001000f0 first 00100000 n 6
Segment 0 load 00100000 size 1150204 mediaptr 0x1000
Segment 1 load 0021a000 size 217016 mediaptr 0x11a000
Segment 2 load 00250000 size 302868 mediaptr 0x14f000
Segment 3 load 0029c000 size 8192 mediaptr 0x199000
Segment 4 load 002a0000 size 32768 mediaptr 0x19b000
Segment 5 load 002c2ddc size 61040 mediaptr 0x1a3ddc
Branching to kernel entry point 0x001000f0.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org



Linux version 2.4.17-pa22 (varenet@npyu.esiee.fr) (gcc version 3.0.2=20
20010829 (p
rerelease)) #4 Sun Feb 10 19:06:21 CET 2002
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005030 00000481 00000000 02020202 781ccde7 100000f0 00000004=20
000000ba 00
0000ba
vers  00000008
CPUID vers 15 rev 8 (0x000001e8)
model 9000/778/B132L+
Total Memory: 128 Mb
pagetable_init
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LED display at f0190001 registered
Kernel command line: root=3D/dev/sda3 HOME=3D/ console=3DttyS0 =
TERM=3Dvt102
Console: colour dummy device 160x64
Calibrating delay loop... 87.85 BogoMIPS
Memory: 127064k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Searching for devices...
Found devices:
1. Merlin+ 132 Dino PS/2 Port (10) at 0xfff81000 [1], versions 0x22,=20
0x0, 0x96
2. Phantom PseudoBC GSC+ Port (7) at 0xffc00000 [8], versions 0x504,=20
0x0, 0x0
3. Dino PCI Bridge (13) at 0xfff80000 [8/0], versions 0x680, 0x3, 0xa, =20=

addition
al addresses: 0xf0800000
4. Merlin+ 132 Dino RS-232 (10) at 0xfff83000 [8/0/63], versions 0x22,=20=

0x0, 0x8c

5. Merlin+ 132 Core BA (11) at 0xffd00000 [8/16], versions 0x3e, 0x0,=20
0x81,  add
itional addresses: 0xffd0c000 0xffc00000
6. Merlin+ 132 Core Centronics (10) at 0xffd02000 [8/16/0], versions=20
0x3e, 0x0,
0x74,  additional addresses: 0xffd01000 0xffd03000
7. Merlin+ 132 Core Audio (10) at 0xffd04000 [8/16/1], versions 0x3e,=20
0x4, 0x7b
8. Merlin+ 132 Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x3e,=20=

0x0, 0x8c

9. Merlin+ 132 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x3e,=20
0x0, 0x82
10. Merlin+ 132 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions=20
0x3e, 0x0,
0x84
11. Merlin+ 132 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions=20
0x3e, 0x0,
0x84
12. Gecko GSC Core Graphics (10) at 0xf8000000 [8/24], versions 0x16,=20
0x0, 0x85,
   additional addresses: 0xf0011000
13. Merlin L2+ 132 (9000/778/B132L) (0) at 0xfffbe000 [62], versions=20
0x503, 0x0,
  0x4
14. Memory (1) at 0xfffbf000 [63], versions 0x61, 0x0, 0x9
CPU(s): 1 x PA7300LC (PCX-L2) at 132.000000 MHz
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xfff80000
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Enabled soft power switch (polling mode, io=3D0xf0140000).
Starting kswapd
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ=20
SERIAL_PCI en
abled
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x204c8000 to 0x204cc740:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x20218000 to 0x2021d4c0:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x20218000 to 0x2021d900:
