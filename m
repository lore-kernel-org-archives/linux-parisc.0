From: Mikulas Patocka <mpatocka@redhat.com>
Subject: invalid printk time during boot on PA-RISC
Date: Tue, 31 May 2016 07:44:36 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.1605310735130.6341@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi

With the kernel 4.7-rc1, I get corrupted printk times when the machine 
boots. The kernel is compiled with "Show timing information on printks" 
(CONFIG_PRINTK_TIME) enabled. There are no other negative effects.

Bisecting shows that it is caused by the patch 
54b668009076caddbede8fde513ca2c982590bfe ("parisc: Add native 
high-resolution sched_clock() implementation").

Mikulas

[    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=4, Nodes=8
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  Build-time adjustment of leaf fanout to 64.
[    0.000000] NR_IRQS:80
[    0.000000] clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.000000] Console: colour dummy device 160x64
[   90.122205] Calibrating delay loop... 1991.60 BogoMIPS (lpj=3317760)
[   90.224168] pid_max: default: 32768 minimum: 301
[   90.285769] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
[   90.377394] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes)
[   90.476416] Brought up 1 CPUs
[   90.518549] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[   90.648779] NET: Registered protocol family 16
[   90.708239] Searching for devices...
[   90.869035] Found devices:
[   90.904983] 1. Crestone Peak Mako+ Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x89b, 0x00004 }
[   91.019867] 2. Crestone Peak Mako+ Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x89b, 0x00004 }
[   91.134765] 3. Crestone Peak Mako+ Slow at 0xfffffffffe798000 [152] { 0, 0x0, 0x89b, 0x00004 }
[   91.249651] 4. Crestone Peak Mako+ Slow at 0xfffffffffe799000 [153] { 0, 0x0, 0x89b, 0x00004 }
[   91.364550] 5. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0b6, 0x00009 }
[   91.456208] 6. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
[   91.567565] 7. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
[   91.676618] 8. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
[   91.785683] 9. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
[   91.894743] 10. Quicksilver AGP Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x784, 0x0000a }
[   92.009628] 11. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
[   92.118694] 12. Crestone Peak Core RS-232 at 0xfffffff0f05e0000 [17] { 10, 0x0, 0x076, 0x000ad }
[   92.235878] 13. Crestone Peak Core RS-232 at 0xfffffff0f05e2000 [18] { 10, 0x0, 0x076, 0x000ad }
[   92.708000] Releasing cpu 1 now, hpa=fffffffffe781000
[   92.818803] FP[1] enabled: Rev 1 Model 20
[    2.917508] Releasing cpu 2 now, hpa=fffffffffe798000
[    0.196666] FP[2] enabled: Rev 1 Model 20
[    3.116794] Releasing cpu 3 now, hpa=fffffffffe799000
[    0.196666] FP[3] enabled: Rev 1 Model 20
[    3.296942] CPU(s): 4 out of 4 PA8900 (Shortfin) at 1000.000000 MHz online
[    3.447762] Setting cache flush threshold to 65536 kB
[    3.450548] Setting TLB flush threshold to 1020 kB

