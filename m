From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Fri, 05 Oct 2012 12:07:48 +0100
Message-ID: <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
	 <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I tried out the code at

git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git
experimental-kernel_thread

and it gives me this panic on boot.

James

---

PALO(F0) partition contains:
PALO is formatted EXT2/3
Command line for kernel: ' root=/dev/sda3 panic=5 console=ttyS1 palo_kernel=1/vmlinux-test'
Selected kernel: /vmlinux-test from partition 1
Selected ramdisk: /initrd.img-test from partition 1
ELF64 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 5984256 mediaptr 0x1000
Segment 1 load 00741cf0 size 541128 mediaptr 0x5b6cf0
Segment 2 load 007c8000 size 190432 mediaptr 0x63b000
Segment 3 load 007f7000 size 140928 mediaptr 0x66a000
Loading ramdisk 2849281 bytes @ 3fd36000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.6.0+ (jejb@ion) (gcc version 4.2.4 (Debian 4.2.4-6)) #35 SMP Fri Oct 5 03:42:07 PDT 2012
[    0.000000] unwind_init: start = 0x405b7000, end = 0x405f15a0, entries = 14938
[    0.000000] WARNING: Out of order unwind entry! 00000000405b8590 and 00000000405b85a0
[    0.000000] WARNING: Out of order unwind entry! 00000000405b85a0 and 00000000405b85b0
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9220 and 00000000405b9230
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9230 and 00000000405b9240
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9240 and 00000000405b9250
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9250 and 00000000405b9260
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9260 and 00000000405b9270
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9270 and 00000000405b9280
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9280 and 00000000405b9290
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9290 and 00000000405b92a0
[    0.000000] WARNING: Out of order unwind entry! 00000000405b92c0 and 00000000405b92d0
[    0.000000] WARNING: Out of order unwind entry! 00000000405b92d0 and 00000000405b92e0
[    0.000000] WARNING: Out of order unwind entry! 00000000405b92e0 and 00000000405b92f0
[    0.000000] WARNING: Out of order unwind entry! 00000000405b92f0 and 00000000405b9300
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9300 and 00000000405b9310
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9310 and 00000000405b9320
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9320 and 00000000405b9330
[    0.000000] WARNING: Out of order unwind entry! 00000000405b9330 and 00000000405b9340
[    0.000000] FP[0] enabled: Rev 1 Model 20
[    0.000000] The 64-bit Kernel has started...
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 00008870 00000491 00000000 00000002 3e0505e7352af710 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000301
[    0.000000] CPUID vers 20 rev 4 (0x00000284)
[    0.000000] capabilities 0x35
[    0.000000] model 9000/800/rp3440  
[    0.000000] parisc_cache_init: Only equivalent aliasing supported!
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
[    0.000000]  1) Start 0x0000004040000000 End 0x000000407fdfffff Size   1022 MB
[    0.000000] Total Memory: 2046 MB
[    0.000000] initrd: 7fd36000-7ffeda01
[    0.000000] initrd: reserving 3fd36000-3ffeda01 (mem_max 7fe00000)
[    0.000000] PERCPU: Embedded 10 pages/cpu @0000000041942000 s9856 r8192 d22912 u40960
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 2 zonelists in Zone order, mobility grouping on.  Total pages: 516615
[    0.000000] Kernel command line:  root=/dev/sda3 panic=5 console=ttyS1 palo_kernel=1/vmlinux-test
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.000000] Memory: 2048728k/2095104k available (4030k kernel code, 46376k reserved, 1765k data, 328k init)
[    0.000000] virtual kernel memory layout:
    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    0.000000]     memory  : 0x0000000040000000 - 0x00000040bfe00000   (264190 MB)
    0.000000]       .init : 0x00000000407c8000 - 0x000000004081a000   ( 328 kB)
    0.000000]       .data : 0x00000000404efb10 - 0x00000000406a8f10   (1765 kB)
    0.000000]       .text : 0x0000000040100000 - 0x00000000404efb10   (4030 kB)
[    0.000000] SLUB: Genslabs=11, HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=8
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  CONFIG_RCU_FANOUT set to non-default value of 32
[    0.000000] NR_IRQS:128
[    0.000000] Console: colour dummy device 160x64
[    0.000000] Calibrating delay loop... 1594.36 BogoMIPS (lpj=3188736)
[    0.048000] pid_max: default: 32768 minimum: 301
[    0.048000] Security Framework initialized
[    0.048000] SELinux:  Disabled at boot.
[    0.048000] Mount-cache hash table entries: 256
[    0.056000] Initializing cgroup subsys cpuacct
[    0.056000] Initializing cgroup subsys devices
[    0.056000] Initializing cgroup subsys freezer
[    0.064000] Initializing cgroup subsys net_cls
[    0.064000] Initializing cgroup subsys blkio
[    0.304000] Backtrace:
[    0.304000]  [<00000000401435b8>] copy_process+0x9d8/0x1698
[    0.304000]  [<00000000401151a0>] fork_idle+0x60/0xc8
[    0.304000]  [<00000000407d0c70>] idle_threads_init+0xc0/0x130
[    0.304000]  [<00000000407d2520>] smp_init+0x30/0x158
[    0.304000]  [<00000000407c87c0>] kernel_init+0x158/0x390
[    0.304000]  [<0000000040104020>] end_fault_vector+0x20/0x3c
[    0.304000]  [<000000004011bb00>] _raw_spin_trylock+0x0/0x18
[    0.304000] 
[    0.304000] 
[    0.304000] Kernel Fault: Code=26 regs=000000007f84c850 (Addr=0000000000000018)
[    0.304000] 
[    0.304000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[    0.304000] PSW: 00001000000001001111111100001111 Not tainted
[    0.304000] r00-03  000000ff0804ff0f 00000000407c4a90 0000000040129270 000000007f85d410
[    0.304000] r04-07  00000000407a0290 0000000000000000 000000007f84c348 000000007f8a0000
[    0.304000] r08-11  0000000000000000 0000000000000100 000000004069f088 0000000000000000
[    0.304000] r12-15  0000000000000000 0000000000000000 0000000000000000 000000007f84c348
[    0.304000] r16-19  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.304000] r20-23  0000000000000006 000000007f85da30 0000000000000000 000000007f85d410
[    0.304000] r24-27  0000000000000000 0000000000000000 000000007f85d780 00000000407a0290
[    0.304000] r28-31  0000000040104000 000000007f84c820 000000007f84c850 000000007f8a0100
[    0.304000] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.304000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.304000] 
[    0.304000] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040129288 000000004012928c
[    0.304000]  IIR: 50bf0030    ISR: 0000000000000000  IOR: 0000000000000018
[    0.304000]  CPU:        0   CR30: 000000007f84c000 CR31: fffffff0f0e098e0
[    0.304000]  ORIG_R28: 0000000000000000
[    0.304000]  IAOQ[0]: copy_thread+0xf8/0x110
[    0.304000]  IAOQ[1]: copy_thread+0xfc/0x110
[    0.304000]  RP(r2): copy_thread+0xe0/0x110
[    0.304000] Backtrace:
[    0.304000]  [<00000000401435b8>] copy_process+0x9d8/0x1698
[    0.304000]  [<00000000401151a0>] fork_idle+0x60/0xc8
[    0.304000]  [<00000000407d0c70>] idle_threads_init+0xc0/0x130
[    0.304000]  [<00000000407d2520>] smp_init+0x30/0x158
[    0.304000]  [<00000000407c87c0>] kernel_init+0x158/0x390
[    0.304000]  [<0000000040104020>] end_fault_vector+0x20/0x3c
[    0.304000]  [<000000004011bb00>] _raw_spin_trylock+0x0/0x18
[    0.304000] 
[    0.304000] Kernel panic - not syncing: Kernel Fault
[    0.304000] Rebooting in 5 seconds..


