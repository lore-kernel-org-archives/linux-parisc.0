From: Nicholas Leippe <nick.leippe@whitecanyon.com>
Subject: SMP: CPU:1 is stuck. on J6750
Date: Fri, 24 Apr 2009 09:15:44 -0600
Message-ID: <200904240915.44386.nick.leippe@whitecanyon.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

There were some posts about this, the most recent is:

http://marc.info/?l=linux-parisc&m=121009166228271&w=2

I'm still experiencing this issue on a J6750.
I've gotten this w/kernels 2.6.26 thru 2.6.29.
Other than the missing cpu, things seem to function just fine.
Increasing the timeout in smp.c line 410 to 100000 did not help.

Beginning of dmesg:

Linux version 2.6.29-gentoo-r1 (root@hppa32_build) (gcc version 4.2.4 (Gentoo 
4.2.4 p1.0)) #2 SMP Fri Apr 24 08:50:02 MD
T 2009
unwind_init: start = 0x406cdfe4, end = 0x4070a964, entries = 15512
WARNING: Out of order unwind entry! 00000000406d0234 and 00000000406d0244
WARNING: Out of order unwind entry! 00000000406d0244 and 00000000406d0254
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005dd0 00000491 00000000 00000002 77a74184 100000f0 00000008 000000b2 
000000b2
vers  00000301
CPUID vers 19 rev 11 (0x0000026b)
capabilities 0x7
model 9000/785/J6750
Total Memory: 3840 MB
On node 0 totalpages: 983040
free_area_init_node: node 0, pgdat 4073d040, node_mem_map 40faf000
  Normal zone: 13440 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 969600 pages, LIFO batch:31
LCD display at fffffff0f05d0008,fffffff0f05d0000 registered
SMP: bootstrap CPU ID is 0
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 969600
Kernel command line: root=/dev/md1 raid=noautodetect md=1,/dev/sda4 
md=d0,/dev/sda3 console=tty0 sti=10/4/2/0 sti_font=V
GA8x16 palo_kernel=2/vmlinux-2.6.29-r1b
md: Will configure md1 (super-block) from /dev/sda4, below.
md: Will configure md0 (super-block) from /dev/sda3, below.
PID hash table entries: 4096 (order: 12, 32768 bytes)
Console: colour dummy device 160x64
console handover: boot [ttyB0] -> real [tty0]
Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Memory: 3855616k/3932160k available (4971k kernel code, 76080k reserved, 1884k 
data, 236k init)
Calibrating delay loop... 1743.25 BogoMIPS (lpj=8716288)
Security Framework initialized
Mount-cache hash table entries: 256
Brought up 1 CPUs
net_namespace: 560 bytes
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfffffffffed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfffffffffed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfffffffffed34000 [10/2] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfffffffffed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfffffffffed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. Duet W2 at 0xfffffffffffa0000 [32] { 0, 0x0, 0x5dd, 0x00004 }
7. Duet W2 at 0xfffffffffffa2000 [34] { 0, 0x0, 0x5dd, 0x00004 }
8. Memory at 0xfffffffffed10200 [49] { 1, 0x0, 0x00a, 0x00009 }
Enabling regular chassis codes support v0.05
Releasing cpu 1 now, hpa=fffffffffffa2000
SMP: CPU:1 is stuck.
CPU(s): 2 x PA8700 (PCX-W2) at 875.000000 MHz

[cut]


I'm happy to test patches and to provide more information to help.

-- 
Nicholas Leippe

