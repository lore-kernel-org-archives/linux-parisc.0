From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] 2.6.15-rc5-pa2: "BUG: soft lockup detected on CPU#0!"
Date: Mon, 5 Dec 2005 20:12:25 +0100
Message-ID: <200512052012.25492.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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

Hello,

2.6.15-rc5-pa2 boots on all my machines (715/64, B160L, C3000) with the 32bit kernel, but on the B160L I see the 
BUG: soft lockup detected on CPU#0!
message below.
Any ideas ?

PS: The message seems to be more informational, since the kernel still boots up fine.

Helge
------------------
Linux version 2.6.15-rc5-pa2 (root@p100) (gcc version 3.3.4 (Debian 1:3.3.4-11)) #220 Mon Dec 5 17:39:15 CET 2
005
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005020 00000481 00000000 02020202 7794d7fe 100000f0 00000004 000000ba 000000ba
vers  00000008
CPUID vers 15 rev 8 (0x000001e8)
capabilities 0x2
model 9000/778/B160L
Total Memory: 512 MB
On node 0 totalpages: 131072
  DMA zone: 131072 pages, LIFO batch:31
  DMA32 zone: 0 pages, LIFO batch:0
  Normal zone: 0 pages, LIFO batch:0
  HighMem zone: 0 pages, LIFO batch:0
LED display at f0190001 registered
Built 1 zonelists
Kernel command line: HOME=/ root=/dev/sda3 ip=bootp console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 12, 65536 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 524288k available
Calibrating delay loop... 106.49 BogoMIPS (lpj=532480)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000 }
2. Dino PCI Bridge at 0xfff80000 [8/0] { 13, 0x3, 0x680, 0x0000a }
3. Merlin+ 132 Dino RS-232 at 0xfff83000 [8/0/63] { 10, 0x0, 0x022, 0x0008c }
4. Merlin 160 Core FW-SCSI at 0xfff8c000 [8/12] { 4, 0x0, 0x03d, 0x00089 }
5. Merlin 160 Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x03d, 0x00081 },  additional addresses: 0xffd0c000 0xff
c00000
6. Merlin 160 Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x03d, 0x0008c }
7. Merlin 160 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x03d, 0x00082 }
8. Merlin 160 Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x03d, 0x0008a }
9. Merlin 160 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x03d, 0x00074 },  additional addresses: 0xffd
01000 0xffd03000
10. Merlin 160 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03d, 0x0007b }
11. Merlin 160 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x03d, 0x00084 }
12. Merlin 160 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x03d, 0x00084 }
13. Coral SGC Graphics at 0xfa000000 [8/4] { 10, 0x0, 0x004, 0x00077 }
14. Coral SGC Graphics at 0xf4000000 [8/8] { 10, 0x0, 0x004, 0x00077 }
15. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085 },  additional addresses: 0xf001100
0
16. Merlin L2 160 (9000/778/B160L) at 0xfffbe000 [62] { 0, 0x0, 0x502, 0x00004 }
17. Memory at 0xfffbf000 [63] { 1, 0x0, 0x067, 0x00009 }
18. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096 }
CPU(s): 1 x PA7300LC (PCX-L2) at 160.000000 MHz
BUG: soft lockup detected on CPU#0!

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111 Not tainted
r00-03  00000000 10423810 10127878 0000000f
r04-07  104e5810 fffff4b2 104e5810 104e5810
r08-11  10423810 0000000f 0000003c 10423f3c
r12-15  10423810 104e4810 10425010 f0100000
r16-19  f0000c70 f0000194 1fffffe0 104230b4
r20-23  ffd05800 ffd05800 ffd05800 00000060
r24-27  ffffffff 00000b4e 00000b4e 10413010
r28-31  00000000 00000000 10a242c0 00000000
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000011110000100000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  10a21a1810423894 10423a081017efec 49c5f780104e48c8 10a21a1810423894
fr08-11  fffffff410a09000 0000000000000000 000000001039ec1c 103a771000000001
fr12-15  0000000100000000 104dd0101016a184 10a21a1810a186e0 0000004d00030000
fr16-19  00000000104e5663 104e501000000000 10423b38104e48c8 0000004d49c5f780
fr20-23  104e48c800000002 10a090001016a2a4 00000fd8000007ec 000017c40000000a
fr24-27  00000000104e48c8 0000000210a09000 000000022fd11780 104e48c8104e5658
fr28-31  104e501000000400 10a2409c1017c774 10a2420a00000000 0000004d49c5f780

IASQ: 00000000 00000000 IAOQ: 1012787c 10127880
 IIR: e81f1f97    ISR: 1016a184  IOR: 10a21a18
 CPU:        0   CR30: 10a24000 CR31: 1047c000
 ORIG_R28: 0000004d
 IAOQ[0]: release_console_sem+0x64/0x114
 IAOQ[1]: release_console_sem+0x68/0x114
 RP(r2): release_console_sem+0x60/0x114
Whole cache flush 22670 cycles, flushing 4294896 bytes 606813 cycles
Setting cache flush threshold to 12a0 (1 CPUs online)
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xfff80000
Dino: No PCI devices enabled.
SCSI subsystem initialized
....and it continues....
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
