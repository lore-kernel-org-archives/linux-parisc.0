From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Start processors from a known state and fix races in parisc_setup_cache_timing
Date: Sun, 20 Nov 2016 21:12:36 -0500
Message-ID: <763DCD56-C1AF-4564-8911-8B3847B08611@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-55-1023466952
Cc: Helge Deller <helge.deller@steuerkanzlei-deller.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-55-1023466952
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Helge reported to me the following startup crash:

[    0.000000] Linux version 4.8.0-1-parisc64-smp =
(debian-kernel@lists.debian.org) (gcc version 5.4.1 20161019 (GCC) ) #1 =
SMP Debian 4.8.7-1 (2016-11-13)
[    0.000000] unwind_init: start =3D 0x40d5b5a0, end =3D 0x40db0740, =
entries =3D 21786
[    0.000000] FP[0] enabled: Rev 1 Model 16
[    0.000000] The 64-bit Kernel has started...
[    0.000000] Kernel default page size is 4 KB. Huge pages enabled with =
1 MB physical and 2 MB virtual size.
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: System Map.
[    0.000000] model 00005bd0 00000491 00000000 00000002 782482ee =
100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000203
[    0.000000] CPUID vers 17 rev 7 (0x00000227)
[    0.000000] capabilities 0x3
[    0.000000] model 9000/785/J5000
[    0.000000] Total Memory: 2048 MB
[    0.000000] initrd: 7eace000-7ffeda26
[    0.000000] initrd: reserving 3eace000-3ffeda26 (mem_max 80000000)
[    0.000000] LCD display at fffffff0f05d0008,fffffff0f05d0000 =
registered
[    0.000000] percpu: Embedded 19 pages/cpu @0000000043417000 s39216 =
r8192 d30416 u77824
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  =
Total pages: 516096
[    0.000000] Kernel command line: root=3D/dev/sda3 rootfstype=3Dext4 =
HOME=3D/ panic=3D-1 console=3DttyS0 TERM=3Dvt102 palo_kernel=3D2/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, =
2097152 bytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 =
bytes)
[    0.000000] Memory: 2018528K/2097152K available (9272K kernel code, =
3053K rwdata, 1319K rodata, 1024K init, 840K bss, 78624K reserved, 0K =
cma-reserved)
[    0.000000] virtual kernel memory layout:
   0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   =
(1007 MB)
   0.000000]     memory  : 0x0000000040000000 - 0x00000000c0000000   =
(2048 MB)
   0.000000]       .init : 0x0000000040100000 - 0x0000000040200000   =
(1024 kB)
   0.000000]       .data : 0x0000000040b0e000 - 0x0000000040f533e0   =
(4372 kB)
   0.000000]       .text : 0x0000000040200000 - 0x0000000040b0e000   =
(9272 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  Build-time adjustment of leaf fanout to 64.
[    0.000000] NR_IRQS:128
[    0.000000] clocksource: cr16: mask: 0xffffffffffffffff max_cycles: =
0x657a3c2da0, max_idle_ns: 440795224593 ns
[    0.000000] Console: colour dummy device 160x64
[    0.196000] Calibrating delay loop... 872.44 BogoMIPS (lpj=3D1744896)
[    0.264032] pid_max: default: 32768 minimum: 301
[    0.297351] Security Framework initialized
[    0.360039] Yama: disabled by default; enable with sysctl =
kernel.yama.*
[    0.412087] AppArmor: AppArmor disabled by boot time parameter
[    0.500468] Mount-cache hash table entries: 4096 (order: 3, 32768 =
bytes)
[    0.576040] Mountpoint-cache hash table entries: 4096 (order: 3, =
32768 bytes)
[    0.768910] Brought up 1 CPUs
[    0.811305] devtmpfs: initialized
[    0.861977] clocksource: jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.992465] NET: Registered protocol family 16
[    1.052962 <tel:1052962>] EISA bus registered
[    1.056311 <tel:1056311>] Searching for devices...
[    1.388031 <tel:1388031>] Found devices:
[    1.392053] 1 <tel:13920531>. Astro BC Runway Port at =
0xfffffffffed00000 [10] { 12, 0x0, 0x582, 0x0000b }
[    1.532048] 2 <tel:15320482>. Elroy PCI Bridge at 0xfffffffffed30000 =
[10/0] { 13, 0x0, 0x782, 0x0000a }
[    1.538406] 3 <tel:15384063>. Elroy PCI Bridge at 0xfffffffffed32000 =
[10/1] { 13, 0x0, 0x782, 0x0000a }
[    1.744052] 4 <tel:17440524>. Elroy PCI Bridge at 0xfffffffffed34000 =
[10/2] { 13, 0x0, 0x782, 0x0000a }
[    1.852052] 5 <tel:18520525>. Elroy PCI Bridge at 0xfffffffffed38000 =
[10/4] { 13, 0x0, 0x782, 0x0000a }
[    1.858406] 6 <tel:18584066>. Elroy PCI Bridge at 0xfffffffffed3c000 =
[10/6] { 13, 0x0, 0x782, 0x0000a }
[    2.064047] 7. Forte W 2-way at 0xfffffffffffa0000 [32] { 0, 0x0, =
0x5bd, 0x00004 }
[    2.164047] 8. Forte W 2-way at 0xfffffffffffa2000 [34] { 0, 0x0, =
0x5bd, 0x00004 }
[    2.264046] 9. Memory at 0xfffffffffed10200 [49] { 1, 0x0, 0x088, =
0x00009 }
[    2.356040] Enabling regular chassis codes support v0.05
[    2.429981] Releasing cpu 1 now, hpa=3Dfffffffffffa2000
[    2.635751] CPU(s): 2 out of 2 PA8500 (PCX-W) at 440.000000 MHz =
online
[    2.726692] Setting cache flush threshold to 1024 kB
[    2.729932] Not-handled unaligned insn 0x43ffff80
[    2.798114] Setting TLB flush threshold to 140 kB
[    2.928039] Unaligned handler failed, ret =3D -1
[    3.000419]       _______________________________=20
   3.000419]      < Your System ate a SPARC! Gah! >
   3.000419]       -------------------------------=20
   3.000419]              \   ^__^
   3.000419]                  (__)\       )\/\
   3.000419]                   U  ||----w |
   3.000419]                      ||     ||
[    3.000000] SBA found Astro 2.1 at 0xfffffffffed00000
[    3.408041] random: fast init done
[    3.457713] Elroy version TR2.1 (0x2) found at 0xfffffffffed30000
[    3.584425] swapper/1 (pid 0): Unaligned data reference (code 28)
[    3.583874] LBA 10:0: PCI host bridge to bus 0000:00
[    3.583907] pci_bus 0000:00: root bus resource [io  0x0000-0x1fff]
[    3.583939] pci_bus 0000:00: root bus resource [mem =
0xfffffffff4000000-0xfffffffff47fffff] (bus address =
[0xf4000000-0xf47fffff])
[    3.583967] pci_bus 0000:00: root bus resource [bus 00]
[    3.584316] pci 0000:00:0c.0: [1011:0019] type 00 class 0x020000
[    3.584466] pci 0000:00:0c.0: reg 0x10: [io  0x1000-0x107f]
[    3.584558] pci 0000:00:0c.0: reg 0x14: [mem =
0xfffffffff4008000-0xfffffffff40083ff]
[    3.584924] pci 0000:00:0c.0: reg 0x30: [mem =
0xfffffffff4040000-0xfffffffff407ffff pref]
[    3.585597] pci 0000:00:0d.0: [11d4:1889] type 00 class 0x040100
[    3.585752] pci 0000:00:0d.0: reg 0x10: [mem =
0xfffffffff400c000-0xfffffffff400c1ff pref]
[    3.585844] pci 0000:00:0d.0: reg 0x14: [mem =
0xfffffffff400b000-0xfffffffff400b00f pref]
[    3.585936] pci 0000:00:0d.0: reg 0x18: [mem =
0xfffffffff400a000-0xfffffffff400a00f pref]
[    3.586027] pci 0000:00:0d.0: reg 0x1c: [mem =
0xfffffffff4009000-0xfffffffff400900f pref]
[    3.586525] pci 0000:00:0d.0: supports D2
[    3.587048] pci 0000:00:0e.0: [100b:0002] type 00 class 0x01018a
[    3.587099] PCI: Enabled native mode for NS87415 (pif=3D0x8f)
[    3.587205] pci 0000:00:0e.0: reg 0x10: [io  0x0f00-0x0f07]
[    3.587299] pci 0000:00:0e.0: reg 0x14: [io  0x0e00-0x0e03]
[    3.587391] pci 0000:00:0e.0: reg 0x18: [io  0x0d00-0x0d07]
[    3.587484] pci 0000:00:0e.0: reg 0x1c: [io  0x0b00-0x0b03]
[    3.587577] pci 0000:00:0e.0: reg 0x20: [io  0x0a00-0x0a0f]
[    3.588427] pci 0000:00:0e.1: [100b:000e] type 00 class 0x068000
[    3.589556] pci 0000:00:0e.2: [100b:0012] type 00 class 0x0c0310
[    3.589689] pci 0000:00:0e.2: reg 0x10: [mem =
0xfffffffff4007000-0xfffffffff4007fff]
[    3.589782] pci 0000:00:0e.2: reg 0x14: [mem =
0xfffffffff4006000-0xfffffffff4006fff]
[    3.590826] pci 0000:00:0f.0: [1000:000b] type 00 class 0x010000
[    3.590982] pci 0000:00:0f.0: reg 0x10: [io  0x0900-0x09ff]
[    3.591116] pci 0000:00:0f.0: reg 0x14: [mem =
0xfffffffff4005000-0xfffffffff40053ff 64bit]
[    3.591247] pci 0000:00:0f.0: reg 0x1c: [mem =
0xfffffffff4002000-0xfffffffff4003fff 64bit]
[    3.591672] pci 0000:00:0f.0: supports D1 D2
[    3.592344] pci 0000:00:0f.1: [1000:000b] type 00 class 0x010000
[    3.592499] pci 0000:00:0f.1: reg 0x10: [io  0x0800-0x08ff]
[    3.592632] pci 0000:00:0f.1: reg 0x14: [mem =
0xfffffffff4004000-0xfffffffff40043ff 64bit]
[    3.592762] pci 0000:00:0f.1: reg 0x1c: [mem =
0xfffffffff4000000-0xfffffffff4001fff 64bit]
[    3.593189] pci 0000:00:0f.1: supports D1 D2
[    3.663990] Elroy version TR2.1 (0x2) found at 0xfffffffffed32000
[    3.664613] LBA 10:1: PCI host bridge to bus 0000:01
[    3.664650] pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] =
(bus address [0x2000-0x3fff])
[    3.664680] pci_bus 0000:01: root bus resource [mem =
0xfffffffff4800000-0xfffffffff4ffffff] (bus address =
[0xf4800000-0xf4ffffff])
[    3.664707] pci_bus 0000:01: root bus resource [bus 01]
[    3.729673] Elroy version TR2.1 (0x2) found at 0xfffffffffed34000
[    3.730152] LBA 10:2: PCI host bridge to bus 0000:02
[    3.730189] pci_bus 0000:02: root bus resource [io  0x24000-0x25fff] =
(bus address [0x4000-0x5fff])
[    3.730219] pci_bus 0000:02: root bus resource [mem =
0xfffffffff5000000-0xfffffffff57fffff] (bus address =
[0xf5000000-0xf57fffff])
[    3.730247] pci_bus 0000:02: root bus resource [bus 02]
[    3.811431] Elroy version TR2.1 (0x2) found at 0xfffffffffed38000
[    3.811912] LBA 10:4: PCI host bridge to bus 0000:03
[    3.811949] pci_bus 0000:03: root bus resource [io  0x38000-0x39fff] =
(bus address [0x8000-0x9fff])
[    3.811979] pci_bus 0000:03: root bus resource [mem =
0xfffffffff6000000-0xfffffffff67fffff] (bus address =
[0xf6000000-0xf67fffff])
[    3.812083] pci_bus 0000:03: root bus resource [bus 03]
[    3.964113] Elroy version TR2.1 (0x2) found at 0xfffffffffed3c000
[    3.964644] LBA 10:6: PCI host bridge to bus 0000:04
[    3.964681] pci_bus 0000:04: root bus resource [io  0x4c000-0x4dfff] =
(bus address [0xc000-0xdfff])
[    3.964711] pci_bus 0000:04: root bus resource [mem =
0xfffffffffa000000-0xfffffffffbffffff] (bus address =
[0xfa000000-0xfbffffff])
[    3.964740] pci_bus 0000:04: root bus resource [mem =
0xfffffffff7000000-0xfffffffff77fffff] (bus address =
[0xf7000000-0xf77fffff])
[    3.964769] pci_bus 0000:04: root bus resource [bus 04]
[    3.964963] pci 0000:04:07.0: [103c:1005] type 00 class 0x038000
[    3.965090] pci 0000:04:07.0: reg 0x10: [mem =
0xfffffffffa000000-0xfffffffffbffffff]
[    3.965475] pci 0000:04:07.0: reg 0x30: [mem =
0xfffffffff7000000-0xfffffffff700ffff pref]
[    3.966316] iosapic: hpa not registered for 0000:04:07.0
[    4.116034] powersw: Soft power switch at 0xfffffff0f0400804 enabled.
[    4.329553] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    4.907795] vgaarb: loaded
[    9.340055] CPU: 1 PID: 0 Comm: swapper/1 Not tainted =
4.8.0-1-parisc64-smp #1 Debian 4.8.7-1
[    9.448082] task: 00000000bfd48060 task.stack: 00000000bfd50000
[    9.528040]=20
[    9.548022]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[    9.608027] PSW: 00001000000001001111111100000000 Not tainted
[    9.684066] r00-03  000000ff0804ff00 0000000040bbc4c0 =
000000004025d178 00000000bfd50160
[    9.788086] r04-07  0000000040b9ecc0 00000000bfd50210 =
0000000040e1f248 0000000000000002
[    9.896052] r08-11  0000000000000000 0000000000000001 =
0000000040f533d0 0000000040e1f248
[   10.000034] r12-15  0000000040e1f2dc 0000000000000001 =
0000000000000001 0000000040eaa682
[   10.104053] r16-19  00000000bfd50580 0000000000000002 =
fffffff0f000016c 00000000bfd50000
[   10.212034] r20-23  000000004342e440 000000000800000e =
0000000000000009 0000000000000032
[   10.316078] r24-27  0000000000000000 000000000f9f009c =
00000000402fe8a8 0000000000000000
[   10.420052] r28-31  0000000000000000 00000000bfd50550 =
00000000bfd50580 0000000040f533d0
[   10.528034] sr00-03  0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
[   10.632083] sr04-07  0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
[   10.740042]=20
[   10.760029] IASQ: 0000000000000000 0000000000000000 IAOQ: =
000000004025d154 000000004025d158
[   10.868052]  IIR: 43ffff80    ISR: 0000000000340000  IOR: =
000001ff54150960
[   10.960029]  CPU:        1   CR30: 00000000bfd50000 CR31: =
0000000011111111
[   11.052057]  ORIG_R28: 000000004021e3b4
[   11.100045]  IAOQ[0]: irq_exit+0x94/0x120
[   11.152062]  IAOQ[1]: irq_exit+0x98/0x120
[   11.208031]  RP(r2): irq_exit+0xb8/0x120
[   11.256074] Backtrace:
[   11.288067]  [<00000000402cd944>] cpu_startup_entry+0x1e4/0x598
[   11.368058]  [<0000000040109528>] smp_callin+0x2c0/0x2f0
[   11.436308]  [<00000000402b53fc>] update_curr+0x18c/0x2d0
[   11.508055]  [<00000000402b73b8>] dequeue_entity+0x2c0/0x1030
[   11.584040]  [<00000000402b3cc0>] set_next_entity+0x80/0xd30
[   11.660069]  [<00000000402c1594>] pick_next_task_fair+0x614/0x720
[   11.740085]  [<000000004020dd34>] __schedule+0x394/0xa60
[   11.808054]  [<000000004020e488>] schedule+0x88/0x118
[   11.876039]  [<0000000040283d3c>] rescuer_thread+0x4d4/0x5b0
[   11.948090]  [<000000004028fc4c>] kthread+0x1ec/0x248
[   12.016053]  [<0000000040205020>] end_fault_vector+0x20/0xc0
[   12.092239]  [<00000000402050c0>] _switch_to_ret+0x0/0xf40
[   12.164044]=20
[   12.184036] CPU: 1 PID: 0 Comm: swapper/1 Not tainted =
4.8.0-1-parisc64-smp #1 Debian 4.8.7-1
[   12.244040] Backtrace:
[   12.244040]  [<000000004021c480>] show_stack+0x68/0x80
[   12.244040]  [<00000000406f332c>] dump_stack+0xec/0x168
[   12.244040]  [<000000004021c74c>] die_if_kernel+0x25c/0x430
[   12.244040]  [<000000004022d320>] handle_unaligned+0xb48/0xb50
[   12.244040]=20
[   12.632066] ---[ end trace 9ca05a7215c7bbb2 ]---
[   12.692036] Kernel panic - not syncing: Attempted to kill the idle =
task!

We have the insn 0x43ffff80 in IIR but from IAOQ we should have:
   4025d150:   0f f3 20 df     ldd,s r19(r31),r31
   4025d154:   0f 9f 00 9c     ldw r31(ret0),ret0
   4025d158:   bf 80 20 58     cmpb,*<> r0,ret0,4025d18c <irq_exit+0xcc>

Cpu0 has just completed running parisc_setup_cache_timing:

[    2.429981] Releasing cpu 1 now, hpa=3Dfffffffffffa2000
[    2.635751] CPU(s): 2 out of 2 PA8500 (PCX-W) at 440.000000 MHz =
online
[    2.726692] Setting cache flush threshold to 1024 kB
[    2.729932] Not-handled unaligned insn 0x43ffff80
[    2.798114] Setting TLB flush threshold to 140 kB
[    2.928039] Unaligned handler failed, ret =3D -1

=46rom the backtrace, cpu1 is in smp_callin:

void __init smp_callin(void)
{
       int slave_id =3D cpu_now_booting;

       smp_cpu_init(slave_id);
       preempt_disable();

       flush_cache_all_local(); /* start with known state */
       flush_tlb_all_local(NULL);

       local_irq_enable();  /* Interrupts have been off until now */

       cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);

So, it has just flushed its caches and the TLB.   It would seem either =
the flushes in parisc_setup_cache_timing
or smp_callin have corrupted kernel memory.

The attached patch reworks parisc_setup_cache_timing to remove the races =
in setting the cache and TLB
flush thresholds.  It also corrects the number of bytes flushed in the =
TLB calculation.

The patch flushes the cache and TLB on cpu0 before starting the =
secondary processors so that they are
are started from a known state.

Tested with a few reboots on c8000.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>



--Apple-Mail-55-1023466952
Content-Disposition: attachment;
	filename=startup.d.txt
Content-Type: text/plain;
	name="startup.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 6700127..bf669a2 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -369,6 +369,7 @@ void __init parisc_setup_cache_timing(void)
 {
 	unsigned long rangetime, alltime;
 	unsigned long size, start;
+	unsigned long threshold;
=20
 	alltime =3D mfctl(16);
 	flush_data_cache();
@@ -382,17 +383,12 @@ void __init parisc_setup_cache_timing(void)
 	printk(KERN_DEBUG "Whole cache flush %lu cycles, flushing %lu =
bytes %lu cycles\n",
 		alltime, size, rangetime);
=20
-	/* Racy, but if we see an intermediate value, it's ok too... */
-	parisc_cache_flush_threshold =3D size * alltime / rangetime;
-
-	parisc_cache_flush_threshold =3D =
L1_CACHE_ALIGN(parisc_cache_flush_threshold);
-	if (!parisc_cache_flush_threshold)
-		parisc_cache_flush_threshold =3D FLUSH_THRESHOLD;
-
-	if (parisc_cache_flush_threshold > cache_info.dc_size)
-		parisc_cache_flush_threshold =3D cache_info.dc_size;
-
-	printk(KERN_INFO "Setting cache flush threshold to %lu kB\n",
+	threshold =3D L1_CACHE_ALIGN(size * alltime / rangetime);
+	if (threshold > cache_info.dc_size)
+		threshold =3D cache_info.dc_size;
+	if (threshold)
+		parisc_cache_flush_threshold =3D threshold;
+	printk(KERN_INFO "Cache flush threshold set to %lu kB\n",
 		parisc_cache_flush_threshold/1024);
=20
 	/* calculate TLB flush threshold */
@@ -401,7 +397,7 @@ void __init parisc_setup_cache_timing(void)
 	flush_tlb_all();
 	alltime =3D mfctl(16) - alltime;
=20
-	size =3D PAGE_SIZE;
+	size =3D 0;
 	start =3D (unsigned long) _text;
 	rangetime =3D mfctl(16);
 	while (start < (unsigned long) _end) {
@@ -414,13 +410,10 @@ void __init parisc_setup_cache_timing(void)
 	printk(KERN_DEBUG "Whole TLB flush %lu cycles, flushing %lu =
bytes %lu cycles\n",
 		alltime, size, rangetime);
=20
-	parisc_tlb_flush_threshold =3D size * alltime / rangetime;
-	parisc_tlb_flush_threshold *=3D num_online_cpus();
-	parisc_tlb_flush_threshold =3D =
PAGE_ALIGN(parisc_tlb_flush_threshold);
-	if (!parisc_tlb_flush_threshold)
-		parisc_tlb_flush_threshold =3D FLUSH_TLB_THRESHOLD;
-
-	printk(KERN_INFO "Setting TLB flush threshold to %lu kB\n",
+	threshold =3D PAGE_ALIGN(num_online_cpus() * size * alltime / =
rangetime);
+	if (threshold)
+		parisc_tlb_flush_threshold =3D threshold;
+	printk(KERN_INFO "TLB flush threshold set to %lu kB\n",
 		parisc_tlb_flush_threshold/1024);
 }
=20
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 81d6f63..2e66a88 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -334,6 +334,10 @@ static int __init parisc_init(void)
 	/* tell PDC we're Linux. Nevermind failure. */
 	pdc_stable_write(0x40, &osid, sizeof(osid));
 =09
+	/* start with known state */
+	flush_cache_all_local();
+	flush_tlb_all_local(NULL);
+
 	processor_init();
 #ifdef CONFIG_SMP
 	pr_info("CPU(s): %d out of %d %s at %d.%06d MHz online\n",

--Apple-Mail-55-1023466952
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-55-1023466952--
