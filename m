Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA10482
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 03:56:18 -0700
Date: Thu, 30 Nov 2000 08:58:22 -0200 (BRST)
From: "Jorge L. deLyra" <delyra@latt.if.usp.br>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com, assirati@socrates.if.usp.br
Subject: Re: [parisc-linux] HP 9000/735-125 
In-Reply-To: <200011292319.PAA28547@milano.cup.hp.com>
Message-ID: <Pine.LNX.3.96.1001130085232.14082B-100000@latt.if.usp.br>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > information. Question: would it do anyone any good if I tried to get
> > everything the kernel said before the hang into a message in this list?
> 
> Certainly. I won't be able to debug the problems since I (a) don't have
> the time too (unless it's obvious) and (b) don't have a 735 setup
> for testing.

OK, here goes. I want to congratulate you all on this effort. We have five
of these HP-9000 stations here, quite old by now. They used to be our main
number crunching force. They are wonderfully built hardware in bad need of
a wonderful system on them!  |:-)

----------------------------------------------------------------
        Jorge L. deLyra,  Associate Professor of Physics
            The University of Sao Paulo,  IFUSP-DFMA
       For more information: finger delyra@latt.if.usp.br
----------------------------------------------------------------

Seyon Copyright (c) 1992-1993 Muhammad M. Saggaf. All rights reserved.
Version 2 rev. 20c i586-Linux steve@hammer 05/23/99 20:19:22.

Locating Modems...
Modem `/dev/ttyS0' is Available.




(c) Copyright.  Hewlett-Packard Company.  1992.
All rights reserved.

PDC ROM rev. 2.7
IODC ROM rev. 1.1
80 MB of memory configured and tested.


Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.6.0                 HP      C3725S
P1                    scsi.4.0                 TOSHIBA CD-ROM XM-3301TA



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: b p1

Trying scsi.4.0
Boot path initialized.
Attempting to load IPL.


Soft booted.
palo ipl bame@noam Tue Oct 31 14:18:02 MST 2000
0/vmlinux 2140145 bytes @ 0x6f9800
0/palo-cmdline '0/vmlinux ROOT=/ TERM=LINUX root=/dev/scd0'
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100150 first 00100000 n 4
Segment 0 load 00100000 size 1460344 mediaptr 0x1000
Segment 1 load 00266000 size 179048 mediaptr 0x166000
Segment 2 load 00294000 size 109876 mediaptr 0x192000
Segment 3 load 002b0000 size 8192 mediaptr 0x1ad000
branching to kernel entry point 0x00100150
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02da000
(0x504d6c,0x504d6c,0x0,0x0)
PALO command line: 'ROOT=/ TERM=LINUX root=/dev/scd0'
PALO initrd 0-0
model   00002060 00000481 00000000 00000000 77f451b0 ffffffff 00000004 0000000a 0000000a
vers    00000015
CPUID vers 0 rev 0
Searching for devices in PDC firmware... processor hpa 0xfffbe000
 an older box...
Found devices:
1. Outfield Core BA (11) at 0xf082f000, versions 0x9, 0x0, 0x70, 0x0, 0x0
2. Outfield Core SCSI (10) at 0xf0825000, versions 0x9, 0x0, 0x71, 0x0, 0x0
3. Outfield Core LAN (802.3) (10) at 0xf0826000, versions 0x9, 0x0, 0x72, 0x0, 0x0
4. Outfield Core HIL (10) at 0xf0821000, versions 0x9, 0x0, 0x73, 0x0, 0x0
5. Outfield Core RS-232 (10) at 0xf0823000, versions 0x9, 0x0, 0x75, 0x0, 0x0
6. Outfield Core RS-232 (10) at 0xf0822000, versions 0x9, 0x0, 0x75, 0x0, 0x0
7. Outfield Core Centronics (10) at 0xf0824000, versions 0x9, 0x0, 0x74, 0x0, 0x0
8. Outfield FW SCSI (10) at 0xf0830000, versions 0x9, 0x0, 0x7c, 0x0, 0x0
9. Outfield Audio (10) at 0xf1000000, versions 0x9, 0x0, 0x7f, 0x0, 0x0
10. Cobra EISA BA (11) at 0xfc000000, versions 0x4, 0x0, 0x76, 0x0, 0x0
11. Snake Cheetah (735/130) (0) at 0xfffbe000, versions 0x206, 0x0, 0x4, 0x0, 0x81
12. Snake Cheetah (1) at 0xfffbf000, versions 0x37, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
CPU(s): 1 x PA7100 (PCX-T) at 125.000000 MHz
Linux version 2.4.0-test6 (pjlahaie@elenuial.thepuffingroup.com) (gcc version 2.96 20000925 (experimental)) #32 Mon Nov 6 10:20:58 EST 2000
free_bootmem(0x2daa00, 0x4d25600)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 20480
zone(0): 10240 pages.
zone(1): 10240 pages.
zone(2): 0 pages.
Kernel command line: ROOT=/ TERM=LINUX root=/dev/scd0
trap_init
Calibrating delay loop... 124.52 BogoMIPS
Memory: 77468k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
ASP version 20 at 0xf0800000 found.
Found i82596 at 0xf0826000, IRQ 87
early initialization of device eth0 is deferred
Found HIL at 0xf0821000, IRQ 94
HIL: no keyboard present.
Warning : device (10, 0x9, 0x0, 0x73, 0x0) NOT claimed by HIL 712, 715 or similiar
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
Starting kswapd v1.7
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
sim700: Couldn't get consistent shared memory
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86
scsi0: Revision 0x0
Post test1, istat 05, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: WARNING: target data areas are not dma coherent!
scsi0: test 1 completed ok.
scsi0: sim700_intr_handle() called with no interrupt
scsi0 : LASI/Simple 53c7xx
scsi : 1 host.
  Vendor: TOSHIBA   Model: CD-ROM XM-3301TA  Rev: 1651
  Type:   CD-ROM                             ANSI SCSI revision: 02
Detected scsi CD-ROM sr0 at scsi0, channel 0, id 4, lun 0
  Vendor: HP        Model: C3725S            Rev: 6019
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 6, lun 0
scsi : detected 1 SCSI cdrom 1 SCSI disk total.
Uniform CD-ROM driver Revision: 3.11
SCSI device sda: hdwr sector= 512 bytes. Sectors= 4194058 [2047 MB] [2.0 GB]
Partition check:
 sda: unknown partition table
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 0B DB EB IRQ 87.
82596.c $Revision: 1.14 $
Serial driver version 5.01 (2000-05-29) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled

Dumping Stack from c4f9c000 to c4f9cbc0:
c000 00000000 00000140 00000000 00000000 c027a46c 00000001 00000000 ffffffff
c020 00000000 00000000 00000000 00000000 00000000 00000000 ffffffff c027a384
c040 c027a384 c4f90000 c02b0000 c028060c 00000000 00000000 00000000 00000000
c060 00000000 00000000 00000001 00000000 00000000 00000000 00000000 c02b0000
c080 c02b0000 c4f50000 00000000 00000000 00000000 c02c9ab8 00000000 c4f9c09c
c0a0 c4f9c09c c4f9c0a4 c011a6e4 c4f9cac8 00000000 00000000 00000000 00000000
c0c0 00000000 00000000 00000000 00000000 00000000 00000000 c4f9c000 c011d4a8
c0e0 00000000 00000037 00000000 00000000 00000024 00000000 0000005b 00000000
c100 00000000 00000000 00000000 00000000 00000000 80000000 00000000 00000000
c120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 fffffeff
c1c0 00000000 ffffffff 00000000 c027afb4 ffffffff ffffffff ffffffff ffffffff
c1e0 ffffffff ffffffff 00800000 05000000 00000000 ffffffff ffffffff ffffffff
c200 00000500 00000500 00000400 00000400 ffffffff ffffffff ffffffff ffffffff
c220 00007377 61707065 72000000 00000000 00000000 00000000 00000000 00000000
c240 00000000 00000000 00005000 c0267054 c0267054 c013d1e8 00010000 c4ffeba0
c260 c02238c4 c0236708 c02d9800 00504d6c 00000000 c011bb88 c0267000 00005000
c280 c0267054 c0267000 0000003e c027a000 00000001 c02b61eb 00000004 c02b61c7
c2a0 00000023 c02b61eb 00000000 00000000 c0100290 0000003e 00000000 00000024
c2c0 0000000b c027a4ac c027a000 08000059 00000000 000000ff 00000060 00000000
c2e0 00000060 00000002 002b2080 00000008 002b50c0 c0266000 00000000 023c3460
c300 c02b08c0 00000001 08000000 00000000 00000000 00000000 00856606 00000000
c320 00000000 00000000 42780000 00000000 431c0000 00000000 4471cccc 00000000
c340 000003c7 00000000 fffffde0 fffffde0 7f7fffff ffffffff 7f7fffff ffffffff
c360 00000000 00000000 00000000 00000000 41800000 00000000 00000010 00000010
c380 00000000 00000000 fffffde0 fffffde0 41000000 00000000 40800000 00000000
c3a0 fffffde0 fffffde0 41000000 00000000 fffffde0 fffffde0 40800000 00000000
c3c0 41000000 00000000 40300000 00000000 40200000 00000000 40200000 00000000
c3e0 41800000 fffffde0 40000000 00000000 40000000 00000000 40800000 00000000
c400 41000000 00000000 00000000 00000000 c4f9cb80 c0103cf4 00000000 00000000
c420 00000000 00000000 00000000 00000000 c011bb78 c011bb7c 40800000 00000000
c440 00281000 00000000 c0280040 c0280064 00000000 c0280204 00000000 00000000
c460 00000000 00000000 00000000 c4f9c468 00000000 00000000 00000000 00000000
c480 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c4a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c4c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c4e0 00000000 00000000 00000000 c0103c48 00000000 00000000 00000000 00000000
c500 c4f9c000 c028060c 00000000 00000000 00000000 00000000 00000000 00000000
c520 00000000 00000000 00000000 c01002a4 00000000 00000000 00000000 00000000
c540 00000000 00000000 00000000 00000000 c02b06c0 c4f9c000 c028060c 00000000
c560 c02b0000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c580 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c5a0 00000000 00000000 00000000 c02950a4 00000000 00000000 00000000 00000000
c5c0 00000001 c0284000 00000000 00000000 00000002 c027a4a0 c027a4a0 c0258bbc
c5e0 00000000 00000000 00000000 c0294fe8 00000000 00000000 00000000 00000000
c600 00000000 08000059 00000000 00000000 f00012a0 000ff000 000a5a59 000a5a59
c620 c0295794 c02d9800 00504d6c c02cc000 c0266000 c02c8000 c02aed34 c02aed24
c640 c02aed34 c02aed20 00000000 00000000 000ff000 000a5a59 000a5a59 c0295794
c660 c02d9800 00504d6c c02cc000 c029bc3c c02c8000 c02aed34 c02aed04 c02c8000
c680 c02c5fe8 c02c60a4 c028758c 00000040 c0244ed8 c0244a0c c0244b80 c0244edc
c6a0 01234567 c4f9c000 00000000 c02a6e64 c4f9c698 00000000 c02cc000 c0266000
c6c0 10000080 c02c5fe8 c02c60a4 c028758c 00000040 c4ffeea0 f00012a0 000ff000
c6e0 000a5a59 000a5a59 c0295794 c0155890 00504d6c c02cc000 c0266000 c02c8000
c700 c02c6164 00000100 c0244c38 00000000 c0245000 00000000 c02c5fe8 c02c5fe8
c720 c01e55ec c028be04 c02c9a20 c0109e74 c4ffc200 c028b474 c4f4a000 c028bf60
c740 00000004 c02aeab4 c02c8d20 c02b621f 00000004 c02b61ca 00000054 c02b621f
c760 00000000 00000001 c027a000 c02a6de4 0000003c 00000058 0000000b c027a4ac
c780 0000005a c4ff74a0 00000000 000000ff 00000060 00000000 00000060 00000002
c7a0 002b2080 00000008 002b50c0 c019324c 00000000 023c3460 c4f9c980 00000001
c7c0 08000000 00000000 00005301 f0823800 00856606 00000000 00000000 c028478c
c7e0 42780000 00000000 431c0000 00000000 4471cccc 00000000 000003c7 00000000
c800 fffffde0 fffffde0 7f7fffff ffffffff 7f7fffff ffffffff 00000000 00000000
c820 00000000 00000000 41800000 00000000 00000010 00000010 f0823800 00000000
c840 00000003 fffffde0 41000000 00000000 40800000 00000000 fffffde0 fffffde0
c860 41000000 00000000 fffffde0 fffffde0 40800000 00000000 41000000 00000000
c880 40300000 00000000 40200000 00000000 40200000 00000000 c018ffb8 c02846d8
c8a0 c02c8800 c026c000 c02c8d20 0000000b c028478c 00000000 41000000 00000000
c8c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c8e0 00000000 00000000 c011bb78 c0192bd4 4471cccc 00000000 000003c7 00000000
c900 0000000a c028478c c4f9c7c8 00000090 00000006 2b6a0000 00000000 00000000
c920 00000000 00000000 41800000 00000000 00000010 00000010 00000000 00000000
c940 fffffde0 fffffde0 41000000 00000000 40800000 00000000 fffffde0 fffffde0
c960 41000000 00000000 fffffde0 c011e9bc 40800000 00000000 41000000 00000000
c980 0004000a c0221800 c011e9f8 c4ff6520 c4ff6200 c0244f10 00000008 f0823800
c9a0 00000003 00000007 c0191568 c02c60a4 fffffffc c0245000 c0245000 c02d72b8
c9c0 c0245000 c0245000 c02c6028 00000000 c4ff6234 f0823807 f0823800 0000000a
c9e0 ffffffff c4ff6520 c4ff6200 c0266000 ffffffff 00000340 c4f9cbc0 c012dfc0
ca00 08000000 00000000 00000000 00000000 00856606 00000000 00000000 00000000
ca20 42780000 00000000 431c0000 00000000 4471cccc 00000000 000003c7 00000000
ca40 fffffde0 fffffde0 7f7fffff ffffffff 7f7fffff ffffffff 00000000 00000000
ca60 00000000 00000000 41800000 00000000 00000010 00000010 00000000 00000000
ca80 fffffde0 fffffde0 41000000 00000000 40800000 00000000 fffffde0 fffffde0
caa0 41000000 00000000 fffffde0 fffffde0 40800000 00000000 41000000 00000000
cac0 40300000 00000000 40200000 00000000 40200000 00000000 41800000 fffffde0
cae0 40000000 00000000 40000000 00000000 40800000 00000000 41000000 00000000
cb00 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
cb20 00000000 00000000 c011e710 c011e714 00000000 00000000 00000000 00000000
cb40 00000000 00000058 c4f9c740 c02caac8 00000007 0f881093 00000000 00000003
cb60 c02c9800 c02c9a60 c02c9a20 00000000 00000000 00000400 c4f9cd40 c01d1c98
cb80 0000003c 0000003e c027a000 00000001 c02b61e0 00000004 c02b61c7 00000018
cba0 c02b61e0 00000000 431c0000 c01046e0 4471cccc 00000000 000003c7 00000000

Data access rights fault in kernel: Code=26 regs=c4f9c980 (Addr=00000003)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001010
r0-3     00000000 c0221800 c011e9f8 c4ff6520
r4-7     c4ff6200 c0244f10 00000008 f0823800
r8-11    00000003 00000007 c0191568 c02c60a4
r12-15   fffffffc c0245000 c0245000 c02d72b8
r16-19   c0245000 c0245000 c02c6028 00000000
r20-23   c4ff6234 f0823807 f0823800 0000000a
r24-27   ffffffff c4ff6520 c4ff6200 c0266000
r28-31   ffffffff 00000340 c4f9cbc0 c012dfc0
sr0-4    00000000 00000000 00000000 00000000
sr4-8    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c011e710 c011e714
 IIR: 0f881093    ISR: 00000000  IOR: 00000003
ORIG_R28: 00000058
