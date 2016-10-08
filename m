From: Meelis Roos <mroos@linux.ee>
Subject: parisc crash on boot with 4.8+git
Date: Sun, 9 Oct 2016 00:52:41 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1610090042580.12761@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: Linux Kernel list <linux-kernel@vger.kernel.org>,
        linux-parisc@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Just tried 4.8.0-11288-gb66484c on three of my parsic machines (enabled 
strict usercopy checking or somethinng like that in make oldconfig).

rp3440 worked fine. a500 and rp3410 cras on boot.

rp3410 crashed on boot with the following:

Linux version 4.8.0-11288-gb66484c (mroos@rp3410) (gcc version 5.4.0 (Gentoo 5.4.0 p1.0) ) #81 Sat Oct 8 20:40:24 EEST 2016
unwind_init: start = 0x4076e980, end = 0x407a7060, entries = 14446
The 64-bit Kernel has started...
Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical and 2 MB virtual size.
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00008860 00000491 00000000 00000002 3e45475d0860fe3d 100000f0 00000008 000000b2 000000b2
vers  00000302
CPUID vers 20 rev 5 (0x00000285)
capabilities 0x35
model 9000/800/rp3410
parisc_cache_init: Only equivalent aliasing supported!
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
 1) Start 0x0000004040000000 End 0x000000407fdfffff Size   1022 MB
Total Memory: 2046 MB
Backtrace:
 [<0000000040102d40>] paging_init+0x5e0/0x740
 [<0000000040103744>] setup_arch+0x16c/0x1b0
 [<0000000040100ce0>] start_kernel+0xb8/0x668

Bad Address (null pointer deref?): Code=15 regs=00000000408034c0 (Addr=000000099cf94000)
CPU: 0 PID: 0 Comm: swapper Not tainted 4.8.0-11288-gb66484c #81
task: 000000004087ea20 task.stack: 0000000040803000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Not tainted
r00-03  000000ff0804ff0e 0000000000900000 00000000401024c4 00000000408033b0 
r04-07  000000004074a3c0 0000000040af0000 0000004040000000 000000004088e104 
r08-11  0000000040803490 000000407fe00000 0000004040000000 0000000000200000 
r12-15  000000004076e3c0 0000000040122928 0000000040000000 0000000000000323 
r16-19  0000004080000000 0000000000000400 0000000000000000 000000099cf94000 
r20-23  0000000000001000 00000000009f2000 0000000000000001 0000000000000001 
r24-27  00000000095cf940 00000000408e1c90 0000004080000000 000000004074a3c0 
r28-31  0000004040000323 0000000040803510 00000000408034c0 000000099cf94000 
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004010251c 0000000040102520
 IIR: 0ffc12c0    ISR: 0000000000000000  IOR: 000000099cf94000
 CPU:        0   CR30: 0000000040803000 CR31: fffffff0f0e05ee0
 ORIG_R28: 00000000408036d0
 IAOQ[0]: map_pages+0x234/0x320
 IAOQ[1]: map_pages+0x238/0x320
 RP(r2): map_pages+0x1dc/0x320
Backtrace:
 [<0000000040102d40>] paging_init+0x5e0/0x740
 [<0000000040103744>] setup_arch+0x16c/0x1b0
 [<0000000040100ce0>] start_kernel+0xb8/0x668

Kernel panic - not syncing: Bad Address (null pointer deref?)
---[ end Kernel panic - not syncing: Bad Address (null pointer deref?)


A500 dies differently on boot:

Linux version 4.8.0-11288-gb66484c (mroos@a500) (gcc version 5.4.0 (Gentoo 5.4.0 p1.0) ) #100 Sat Oct 8 22:11:04 EEST 2016
unwind_init: start = 0x4074ee10, end = 0x40787d90, entries = 14584
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical 
and 2 MB virtual size.
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005cb0 00000491 00000000 00000001 5c5f29fa 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 17 rev 11 (0x0000022b)
capabilities 0x1
model 9000/800/A500-44
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
Total Memory: 1024 MB
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 258560
Kernel command line: root=/dev/sda3 console=ttyS0 palo_kernel=2/vmlinux
PID hash table entries: 4096 (order: 3, 32768 bytes)
Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
Memory: 1022352K/1048576K available (4328K kernel code, 1812K rwdata, 576K rodata, 1024K init, 424K bss, 26224K reserved, 0K cma-reserved)
virtual kernel memory layout:
   vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
   memory  : 0x0000000040000000 - 0x0000000080000000   (1024 MB)
     .init : 0x0000000040100000 - 0x0000000040200000   (1024 kB)
     .data : 0x000000004063a000 - 0x000000004088f370   (2388 kB)
     .text : 0x0000000040200000 - 0x000000004063a000   (4328 kB)
SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
NR_IRQS:80
clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0x657a3c2da0, 
max_idle_ns: 440795224593 ns
Console: colour dummy device 160x64
Calibrating delay loop... 872.44 BogoMIPS (lpj=1744896)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, 
max_idle_ns: 7645041785100000 ns
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Crescendo 440 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5cb, 0x00004 }
2. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
3. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
4. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
6. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
7. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
Enabling PDC_PAT chassis codes support v0.05

********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         FLASH     ON         ON
LED State: Unexpected Reboot. Running non-OS code. Non-critical error 
detected.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
 [<00000000402050c0>] _switch_to_ret+0x0/0xf40

CPU: 0 PID: 1 Comm: swapper Not tainted 4.8.0-11288-gb66484c #100
Backtrace:
 [<00000000402152f4>] show_stack+0x14/0x20
 [<000000004043a848>] dump_stack+0x30/0x40
 [<0000000040215488>] die_if_kernel+0x180/0x298
 [<0000000040216304>] handle_interruption+0x99c/0x9c0

---[ end trace 61bce946a86921df ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b


-- 
Meelis Roos (mroos@linux.ee)
