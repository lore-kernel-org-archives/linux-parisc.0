From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Subject: Re: Hacking SuperDome
Date: Fri, 13 Feb 2009 21:46:21 +0100
Message-ID: <20090213204621.GA5226@alpha.franken.de>
References: <20090207142906.GA8553@alpha.franken.de> <20090212003628.GA9042@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090212003628.GA9042@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Feb 11, 2009 at 07:36:28PM -0500, Kyle McMartin wrote:
> [...]

I've disabled GSC and applied the iosapic debug patch. Below
are the boot logs of both partitions.

28 CPU partition:

Linux version 2.6.29-rc3-00000-g33bfad5-dirty (tsbogend@login) (gcc
version 4.2.1) #59 Fri Feb 13 21:31:17 CET 2009
unwind_init: start = 0x404718c0, end = 0x4049da80, entries = 11292
WARNING: Out of order unwind entry! 00000000404733d0 and
00000000404733e0
WARNING: Out of order unwind entry! 00000000404733e0 and
00000000404733f0
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005e70 00000491 00000000 00000002 3e0f97abec371bc2 00000000
00000008 000000b2 000000b2
vers  00000202
CPUID vers 19 rev 1 (0x00000261)
capabilities 0x3d
model 9000/800/SD32000
parisc_cache_init: Only equivalent aliasing supported!
Memory Ranges:
 0) Start 0x0000000000000000 End 0x00000007ffffffff Size  32768 MB
 1) Start 0x0000000800000000 End 0x00000009ffffffff Size   8192 MB
 2) Start 0x0000000a00000000 End 0x0000000bffffffff Size   8192 MB
 3) Start 0x0000000c00000000 End 0x0000000df7ffffff Size   8064 MB
Total Memory: 57216 MB
Built 4 zonelists in Zone order, mobility grouping on.  Total pages:
14447040
Kernel command line: HOME=/ ip=dhcp console=ttyS0 TERM=vt102
palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 12, 32768 bytes)
Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes)
Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes)
Memory: 57567828k/58589184k available (2850k kernel code, 1019292k
reserved, 1413k data, 164k init)
virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x0000000e38000000   (57216 MB)
      .init : 0x00000000405cc000 - 0x00000000405f5000   ( 164 kB)
      .data : 0x00000000403c8828 - 0x000000004052a000   (1413 kB)
      .text : 0x0000000040100000 - 0x00000000403c8828   (2850 kB)
Calibrating delay loop... 1495.04 BogoMIPS (lpj=2990080)
Security Framework initialized
Mount-cache hash table entries: 256
net_namespace: 544 bytes
NET: Registered protocol family 16
Searching for devices...
Two devices have hardware path [255].  IODC data for second device:
00404e0000abRearranging GSC cards sometimes helps
Two devices have hardware path [255].  IODC data for second device:
00404e0000abRearranging GSC cards sometimes helps
Found devices:
1. Caribe DNA Central Agent at 0xfffffffffc000000 [255] { 14, 0x0,
0x007, 0x000aa }
2. Caribe W2 800 at 0xfffffffffc078000 [10] { 0, 0x0, 0x5e7, 0x00004 }
3. Caribe W2 800 at 0xfffffffffc07a000 [11] { 0, 0x0, 0x5e7, 0x00004 }
4. Caribe W2 800 at 0xfffffffffc07c000 [12] { 0, 0x0, 0x5e7, 0x00004 }
5. Caribe W2 800 at 0xfffffffffc07e000 [13] { 0, 0x0, 0x5e7, 0x00004 }
6. Memory at 0xfffffffffc005000 [5] { 1, 0x0, 0x0a8, 0x00009 }
7. REO I/O BC Merced Port at 0xfffffff808000000 [0] { 7, 0x0, 0x804,
0x0000c }
8. Elroy PCI Bridge at 0xfffffff804000000 [0/0] { 13, 0x0, 0x782,
0x0000a }
9. Elroy PCI Bridge at 0xfffffff804002000 [0/1] { 13, 0x0, 0x782,
0x0000a }
10. Elroy PCI Bridge at 0xfffffff804004000 [0/2] { 13, 0x0, 0x782,
0x0000a }
11. Elroy PCI Bridge at 0xfffffff804006000 [0/3] { 13, 0x0, 0x782,
0x0000a }
12. Elroy PCI Bridge at 0xfffffff804008000 [0/4] { 13, 0x0, 0x782,
0x0000a }
13. Elroy PCI Bridge at 0xfffffff80400c000 [0/6] { 13, 0x0, 0x782,
0x0000a }
14. Elroy PCI Bridge at 0xfffffff804010000 [0/8] { 13, 0x0, 0x782,
0x0000a }
15. Elroy PCI Bridge at 0xfffffff804012000 [0/9] { 13, 0x0, 0x782,
0x0000a }
16. Elroy PCI Bridge at 0xfffffff804014000 [0/10] { 13, 0x0, 0x782,
0x0000a }
17. Elroy PCI Bridge at 0xfffffff804016000 [0/11] { 13, 0x0, 0x782,
0x0000a }
18. Elroy PCI Bridge at 0xfffffff804018000 [0/12] { 13, 0x0, 0x782,
0x0000a }
19. Elroy PCI Bridge at 0xfffffff80401c000 [0/14] { 13, 0x0, 0x782,
0x0000a }
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 11 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 12 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 13 failed with error 1
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Setting cache flush threshold to 180000 (1 CPUs online)
iosapic_init()
calling get_irt_size (cell 0)
get_irt_size: 0
pdc_pat_get_irt: 0
iosapic Interrupt Routing Table (cell 0)
iosapic start = 0x000000083fc8c800 num_entries 46 entry_size 16
iosapic 8b 10 00 0f 00 00 00 00 fffffff804000800
iosapic 8b 10 00 0f 04 00 00 00 fffffff804000800
iosapic 8b 10 00 0f 00 08 00 00 fffffff804002800
iosapic 8b 10 00 0f 01 08 00 01 fffffff804002800
iosapic 8b 10 00 0f 02 08 00 02 fffffff804002800
iosapic 8b 10 00 0f 03 08 00 03 fffffff804002800
iosapic 8b 10 00 0f 00 10 00 00 fffffff804004800
iosapic 8b 10 00 0f 01 10 00 01 fffffff804004800
iosapic 8b 10 00 0f 02 10 00 02 fffffff804004800
iosapic 8b 10 00 0f 03 10 00 03 fffffff804004800
iosapic 8b 10 00 0f 00 18 00 00 fffffff804006800
iosapic 8b 10 00 0f 01 18 00 01 fffffff804006800
iosapic 8b 10 00 0f 02 18 00 02 fffffff804006800
iosapic 8b 10 00 0f 03 18 00 03 fffffff804006800
iosapic 8b 10 00 0f 00 20 00 00 fffffff804008800
iosapic 8b 10 00 0f 01 20 00 01 fffffff804008800
iosapic 8b 10 00 0f 02 20 00 02 fffffff804008800
iosapic 8b 10 00 0f 03 20 00 03 fffffff804008800
iosapic 8b 10 00 0f 00 30 00 00 fffffff80400c800
iosapic 8b 10 00 0f 01 30 00 01 fffffff80400c800
iosapic 8b 10 00 0f 02 30 00 02 fffffff80400c800
iosapic 8b 10 00 0f 03 30 00 03 fffffff80400c800
iosapic 8b 10 00 0f 00 40 00 00 fffffff804010800
iosapic 8b 10 00 0f 01 40 00 01 fffffff804010800
iosapic 8b 10 00 0f 02 40 00 02 fffffff804010800
iosapic 8b 10 00 0f 03 40 00 03 fffffff804010800
iosapic 8b 10 00 0f 00 48 00 00 fffffff804012800
iosapic 8b 10 00 0f 01 48 00 01 fffffff804012800
iosapic 8b 10 00 0f 02 48 00 02 fffffff804012800
iosapic 8b 10 00 0f 03 48 00 03 fffffff804012800
iosapic 8b 10 00 0f 00 50 00 00 fffffff804014800
iosapic 8b 10 00 0f 01 50 00 01 fffffff804014800
iosapic 8b 10 00 0f 02 50 00 02 fffffff804014800
iosapic 8b 10 00 0f 03 50 00 03 fffffff804014800
iosapic 8b 10 00 0f 00 58 00 00 fffffff804016800
iosapic 8b 10 00 0f 01 58 00 01 fffffff804016800
iosapic 8b 10 00 0f 02 58 00 02 fffffff804016800
iosapic 8b 10 00 0f 03 58 00 03 fffffff804016800
iosapic 8b 10 00 0f 00 60 00 00 fffffff804018800
iosapic 8b 10 00 0f 01 60 00 01 fffffff804018800
iosapic 8b 10 00 0f 02 60 00 02 fffffff804018800
iosapic 8b 10 00 0f 03 60 00 03 fffffff804018800
iosapic 8b 10 00 0f 00 70 00 00 fffffff80401c800
iosapic 8b 10 00 0f 01 70 00 01 fffffff80401c800
iosapic 8b 10 00 0f 02 70 00 02 fffffff80401c800
iosapic 8b 10 00 0f 03 70 00 03 fffffff80401c800
SBA found REO rev 2 at 0xfffffff808000000
Elroy version TR4.0 (0x5) found at 0xfffffff804000000
Backtrace:
 [<00000000402b406c>] lba_fixup_bus+0x36c/0x3d8
 [<00000000401208dc>] pcibios_fixup_bus+0x2c/0x50
 [<000000004010d45c>] pci_scan_child_bus+0x64/0xf0
 [<000000004010d518>] pci_scan_bus_parented+0x30/0x48
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40


Kernel Fault: Code=26 regs=000000083fc42cf0 (Addr=0000000000000028)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  000000ff0804ff0f 00000000405c7f00 00000000402b154c
000000083fc1b188
r04-07  00000000405b9700 000000083fc1c400 000000083fc1b000
0000000000000007
r08-11  000000083fc8c028 000000083fc088c0 0000000000000000
000000083fc1c558
r12-15  000000083fc1c568 000000083fc1c578 0000000040510f10
000000083fc1c548
r16-19  000000083fc1c490 00000000405bcf00 000000083fc1c4c8
0000000000000000
r20-23  0000000000044048 0000000000000040 0000000000000003
0000000000000001
r24-27  0000000000000000 0000000000000010 00000000405606f4
00000000405b9700
r28-31  0000000000000000 000000083fc1c400 000000083fc42cf0
0000000000000001
sr00-03  0000000000000000 0000000000000000 0000000000000000
0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000
0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000402b155c
00000000402b1560
 IIR: 53990050    ISR: 0000000000000000  IOR: 0000000000000028
 CPU:        0   CR30: 000000083fc40000 CR31: f7fc7fe9ffe3ffe7
 ORIG_R28: 000000004013d598
 IAOQ[0]: iosapic_fixup_irq+0xd4/0x448
 IAOQ[1]: iosapic_fixup_irq+0xd8/0x448
 RP(r2): iosapic_fixup_irq+0xc4/0x448
Backtrace:
 [<00000000402b406c>] lba_fixup_bus+0x36c/0x3d8
 [<00000000401208dc>] pcibios_fixup_bus+0x2c/0x50
 [<000000004010d45c>] pci_scan_child_bus+0x64/0xf0
 [<000000004010d518>] pci_scan_bus_parented+0x30/0x48
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40
 [<00000000405e1f50>] lba_driver_probe+0x950/0xa40

Kernel panic - not syncing: Kernel Fault


4 CPU partition (one CPU is faulty and disabled):

Linux version 2.6.29-rc3-00000-g33bfad5-dirty (tsbogend@login) (gcc
version 4.2.1) #59 Fri Feb 13 21:31:17 CET 2009
unwind_init: start = 0x404718c0, end = 0x4049da80, entries = 11292
WARNING: Out of order unwind entry! 00000000404733d0 and
00000000404733e0
WARNING: Out of order unwind entry! 00000000404733e0 and
00000000404733f0
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005e70 00000491 00000000 00000002 3e0f97abec371bc2 00000000
00000008 000000b2 000000b2
vers  00000202
CPUID vers 19 rev 1 (0x00000261)
capabilities 0x3d
model 9000/800/SD32000
parisc_cache_init: Only equivalent aliasing supported!
Total Memory: 8184 MB
Built 1 zonelists in Zone order, mobility grouping on.  Total pages:
2066460
Kernel command line: HOME=/ ip=dhcp console=ttyS0 TERM=vt102
palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 12, 32768 bytes)
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
Memory: 8231424k/8380416k available (2850k kernel code, 148464k
reserved, 1413k data, 164k init)
virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x000000023f800000   (8184 MB)
      .init : 0x00000000405cc000 - 0x00000000405f5000   ( 164 kB)
      .data : 0x00000000403c8828 - 0x000000004052a000   (1413 kB)
      .text : 0x0000000040100000 - 0x00000000403c8828   (2850 kB)
Calibrating delay loop... 1495.04 BogoMIPS (lpj=2990080)
Security Framework initialized
Mount-cache hash table entries: 256
net_namespace: 544 bytes
NET: Registered protocol family 16
Searching for devices...
Two devices have hardware path [255].  IODC data for second device:
00404e0000abRearranging GSC cards sometimes helps
Two devices have hardware path [255].  IODC data for second device:
00404e0000abRearranging GSC cards sometimes helps
Found devices:
1. Caribe DNA Central Agent at 0xfffffffffc400000 [255] { 14, 0x0,
0x007, 0x000aa }
2. Caribe W2 800 at 0xfffffffffc47a000 [11] { 0, 0x0, 0x5e7, 0x00004 }
3. Caribe W2 800 at 0xfffffffffc47c000 [12] { 0, 0x0, 0x5e7, 0x00004 }
4. Caribe W2 800 at 0xfffffffffc47e000 [13] { 0, 0x0, 0x5e7, 0x00004 }
5. Memory at 0xfffffffffc405000 [5] { 1, 0x0, 0x0a8, 0x00009 }
6. REO I/O BC Merced Port at 0xfffffff888000000 [0] { 7, 0x0, 0x804,
0x0000c }
7. Elroy PCI Bridge at 0xfffffff884000000 [0/0] { 13, 0x0, 0x782,
0x0000a }
8. Elroy PCI Bridge at 0xfffffff884002000 [0/1] { 13, 0x0, 0x782,
0x0000a }
9. Elroy PCI Bridge at 0xfffffff884004000 [0/2] { 13, 0x0, 0x782,
0x0000a }
10. Elroy PCI Bridge at 0xfffffff884006000 [0/3] { 13, 0x0, 0x782,
0x0000a }
11. Elroy PCI Bridge at 0xfffffff884008000 [0/4] { 13, 0x0, 0x782,
0x0000a }
12. Elroy PCI Bridge at 0xfffffff88400c000 [0/6] { 13, 0x0, 0x782,
0x0000a }
13. Elroy PCI Bridge at 0xfffffff884010000 [0/8] { 13, 0x0, 0x782,
0x0000a }
14. Elroy PCI Bridge at 0xfffffff884012000 [0/9] { 13, 0x0, 0x782,
0x0000a }
15. Elroy PCI Bridge at 0xfffffff884014000 [0/10] { 13, 0x0, 0x782,
0x0000a }
16. Elroy PCI Bridge at 0xfffffff884016000 [0/11] { 13, 0x0, 0x782,
0x0000a }
17. Elroy PCI Bridge at 0xfffffff884018000 [0/12] { 13, 0x0, 0x782,
0x0000a }
18. Elroy PCI Bridge at 0xfffffff88401c000 [0/14] { 13, 0x0, 0x782,
0x0000a }
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 12 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 13 failed with error 1
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Setting cache flush threshold to 180000 (1 CPUs online)
iosapic_init()
calling get_irt_size (cell 4)
get_irt_size: 0
pdc_pat_get_irt: 0
iosapic Interrupt Routing Table (cell 4)
iosapic start = 0x000000023f090c00 num_entries 46 entry_size 16
iosapic 8b 10 00 0f 00 00 04 00 fffffff884000800
iosapic 8b 10 00 0f 04 00 04 00 fffffff884000800
iosapic 8b 10 00 0f 00 08 04 00 fffffff884002800
iosapic 8b 10 00 0f 01 08 04 01 fffffff884002800
iosapic 8b 10 00 0f 02 08 04 02 fffffff884002800
iosapic 8b 10 00 0f 03 08 04 03 fffffff884002800
iosapic 8b 10 00 0f 00 10 04 00 fffffff884004800
iosapic 8b 10 00 0f 01 10 04 01 fffffff884004800
iosapic 8b 10 00 0f 02 10 04 02 fffffff884004800
iosapic 8b 10 00 0f 03 10 04 03 fffffff884004800
iosapic 8b 10 00 0f 00 18 04 00 fffffff884006800
iosapic 8b 10 00 0f 01 18 04 01 fffffff884006800
iosapic 8b 10 00 0f 02 18 04 02 fffffff884006800
iosapic 8b 10 00 0f 03 18 04 03 fffffff884006800
iosapic 8b 10 00 0f 00 20 04 00 fffffff884008800
iosapic 8b 10 00 0f 01 20 04 01 fffffff884

ser pim:

HPMC Information

  HPMC Chassis Codes:      Extension:
  ------------------       -----------------
  0xb80008000000620f       0x0000000000000000
  0xb80008000000621c       0x0000000000000000
  0xb800082011016c2c       0x0000000000000000
  0xb80008000000626c       0x0000000000000000
  0x180008000000633c       0x0000000000000000
  0xb80008000000624c       0x00000000000000ea
  0xb8000800000062fc       0x00000000000000eb
  0xb8000800000062fc       0x00000000000000ec


Timestamp = 02:27:05 GMT    Feb 14 2009

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  00000081ff8a9cb0
00000081ffc40000
04-07  00000081ffc40330  00000081ffc407b0  00000081ffc407b0
00000081ffc40680
08-11  000000023f022a20  0000000000000040  0000000000000002
00000000005412c0
12-15  00ffff04ffffff94  0000000000000008  0000000000000001
000000000053f1c0
16-19  603c9b9103f774b0  00000081ffc407b8  603c9b9103f774b0
603c9b9103f774b0
20-23  000000000053f1c0  0000000000000001  0000000000000008
00ffff04ffffff94
24-27  00000000005412c0  0000000000000002  0000000000000040
00000081ff9d76f0
28-31  00000081ffc40000  0000000000541810  00000000005417d0
00000081ffc40690

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000
0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000
0000000000000000
08-11  0000000000000000  0000000000000000  00000000000000c0
0000000000000031
12-15  0000000000000000  0000000000000000  0000000000103000
8000000000000000
16-19  00000020f70a0b02  0000000000000081  00000081ff8a9d64
000000000e6010df
20-23  000000000436440f  40000000ddf774b0  0000000008000108
8000000000000000
24-27  000000000052c000  000000000052c000  13f8e363a2f7c22b
13f8e343a2f7c22b
28-31  13f8e363a2f7c22b  9358f363a2b78323  000000023f020000
93b8f363a2b5c32b

Space Registers 0 - 7
00-03  0000000000000000  0000000000000000  0000000000000000
0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000
0000000000000000

Floating Point Registers 0 - 32
00-03  3b530fb761871637  f8be7beddfd0c244  d33fe1b257d77169
9944bc7fcf9b9221
04-07  1d906672bdc4223c  706fa77cab85706c  39fc0b5cdecc65cc
f467c37df74ee338
08-11  58e5a620d50cc070  b3f94d7ed58db410  d8948e47b7d0520a
fa0d021e579d246e
12-15  b8efd63f36764318  d17f0642fd85bc68  96ad979ebfd0640c
9edd22a7bf87a038
16-19  bbb5f63b0b84602b  63be400edfc16009  ba3c061dbed926f0
3c3596fff61c520c
20-23  1a2547ef7b460028  f859cd6e93a14a60  000000000000006f
00000000000000de
24-27  0000000000000000  ffcf1b1f5994e41c  db24613fc40c04e8
9a55837ebb4070ec
28-31  5ecd789fcacc7244  0000000200c08110  1a30a004d78a36ac
0000800010000000

IIA Space                    = 0x0000000000000081
IIA Offset                   = 0x00000081ff8a9d68
Check Type                   = 0x0000000020000000
CPU State                    = 0x000000009e000004
Cache Check                  = 0x0000000000000000
TLB Check                    = 0x0000000000000000
Bus Check                    = 0x000000000030000d
Assists Check                = 0x0000000000000000
Assist State                 = 0x0000000000000000
Path Info                    = 0x0000000000000000
System Responder Address     = 0xfffffffffc47a000
System Requestor Address     = 0x0000000000000000
Summary                      = 0xcb83000000000000
Available Memory             = 0x00000001ff800000
CPU DR2                      = 0x020211a10c002004
CPU Status 0                 = 0x3240c30000000000
CPU Status 1                 = 0x8000000000000000
CPU S Address Log            = 0x483ffffffffc0000
CPU RS Log                   = 0xc1bff0ffff417238
Time Stamp                   = 0x2009021400022705
System Firmware Revision     = 0x00000ac600002401
PDC Relocation Address       = 0x00000081ff800000


Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                                [ RFC1925, 2.3 ]
