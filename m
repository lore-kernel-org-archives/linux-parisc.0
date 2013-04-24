From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Gentoo boot on C8000 (was: Re: PARISC Linux website and status update)
Date: Wed, 24 Apr 2013 21:44:52 +0200 (MEST)
Message-ID: <201304241944.r3OJirJv009740@arbas.nms.ulrich-teichert.org>
References: <20130420155518.0de6df62@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: jer@gentoo.org (Jeroen Roovers)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130420155518.0de6df62@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

[del]
>have been kept up to date quite well. That said, we recently released a
>new set of boot images (CD[2] and netboot[3]) with support for
>recent hardware, filesystems and (yes!) SMP.
>
>
>     jer
>
>
>[1] http://distfiles.gentoo.org/releases/hppa/autobuilds/current-stage3/
>[2] http://distfiles.gentoo.org/experimental/hppa/livecd/
>[3] http://distfiles.gentoo.org/experimental/hppa/netboot/

Tried [2] on my C8000 dual CPU, on a serial line just now:

...
HARD Booted.
<Cpu0> 0000109800e00000  0000000000000000  CC_BOOT_LAUNCH_IPL_OTHR
<Cpu0> 0100142900e00000  fffffff0f0e0ac00  CC_CPU_INTRIGUE_LDB
<Cpu0> 3400082100e00000  0000000000000001  CC_BOOT_BOOT_COMPLETE
palo ipl 1.5 root@hope Sat Apr 23 18:06:47 CEST 2005
...

[    0.000000] Linux version 3.6.11-livecd64 (root@terminator) (gcc version 4.6.3 (Gentoo 4.6.3 p1.9) ) #1 SMP Thu Jan 24 16:09:18 UTC 2013
[    0.000000] unwind_init: start = 0x406ad000, end = 0x406e85e0, entries = 15198
[    0.000000] FP[0] enabled: Rev 1 Model 20
[    0.000000] The 64-bit Kernel has started...
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 000089b0 00000491 00000000 00000002 56fa29f07c511780 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000401
[    0.000000] CPUID vers 20 rev 10 (0x0000028a)
[    0.000000] capabilities 0x35
[    0.000000] model 9000/785/C8000
[    0.000000] parisc_cache_init: Only equivalent aliasing supported!
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
[    0.000000]  1) Start 0x0000000100000000 End 0x00000001ffdfffff Size   4094 MB
[    0.000000]  2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
[    0.000000] Total Memory: 8190 MB
[    0.000000] initrd: 7fda6000-7ffee9d0
[    0.000000] initrd: reserving 3fda6000-3ffee9d0 (mem_max 1ffe00000)
[    0.000000] PERCPU: Embedded 10 pages/cpu @000000004266e000 s9728 r8192 d23040 u40960
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2067975
[    0.000000] Kernel command line:  root=/dev/ram0 init=/linuxrc cdroot dokeymap looptype=squashfs loop=/image.squashfs console=ttyB0 palo_kernel=0/livecd
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Memory: 8230968k/8386560k available (4846k kernel code, 155592k reserved, 1929k data, 376k init)
[    0.000000] SLUB: Genslabs=11, HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=8
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:128
[    0.000000] Console: colour dummy device 160x64
[    0.056000] Calibrating delay loop... 1988.60 BogoMIPS (lpj=3977216)
[    0.156000] pid_max: default: 32768 minimum: 301
[    0.216000] Mount-cache hash table entries: 256
[    0.276000] Brought up 1 CPUs
[    0.316000] xor: measuring software checksum speed
[    0.420000]    8regs     :  4697.000 MB/sec
[    0.512000]    8regs_prefetch:  3504.000 MB/sec
[    0.608000]    32regs    :  3852.000 MB/sec
[    0.700000]    32regs_prefetch:  3552.000 MB/sec
[    0.760000] xor: using function: 8regs (4697.000 MB/sec)
[    0.828000] NET: Registered protocol family 16
[    0.888000] EISA bus registered
[    0.928000] Searching for devices...
[    1.080000] Found devices:
[    1.116000] 1. Crestone Peak Mako+ Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x89b, 0x00004 }
[    1.232000] 2. Crestone Peak Mako+ Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x89b, 0x00004 }
[    1.344000] 3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0b6, 0x00009 }
[    1.436000] 4. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
[    1.544000] 5. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
[    1.652000] 6. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
[    1.760000] 7. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
[    1.868000] 8. Quicksilver AGP Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x784, 0x0000a }
[    1.980000] 9. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
[    2.088000] 10. unknown device at 0xfffffff0f05e0000 [17] { 10, 0x0, 0x076, 0x000ad }
[    2.192000] 11. unknown device at 0xfffffff0f05e2000 [18] { 10, 0x0, 0x076, 0x000ad }
[    2.296000] Enabling PDC_PAT chassis codes support v0.05
<Cpu0> 38000c6400e00000  a0e008101100c000  CC_PAT_ENCODED_FIELD_MAJOR_FWD_PROG
<Cpu0> 36000c6a00e00000  0000000000000420  CC_PAT_DATA_FIELD_MAJOR_FWD_PROG
[    3.228000] Releasing cpu 1 now, hpa=fffffffffe781000
<Cpu1> 0000099101e00000  0000000000000000  CC_BOOT_OS_RENDEZVOUS
<Cpu1> 0100142901e00000  fffffff0f0e0ac00  CC_CPU_INTRIGUE_LDB
[    3.664000] FP[1] enabled: Rev 1 Model 20
[    3.668000] genirq: Flags mismatch irq 64. 00015620 (timer) vs. 00015620 (timer)
[    3.816000] genirq: Flags mismatch irq 65. 00000420 (IPI) vs. 00000420 (IPI)
[    3.924000] CPU(s): 2 x PA8900 (Shortfin) at 1000.000000 MHz
[    4.008000] Setting cache flush threshold to 4000000 (2 CPUs online)
[    4.256000] SBA found Pluto 2.3 at 0xfffffffffed00000
[    4.472000] Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
[    4.616000] LBA 0:0: PCI host bridge to bus 0000:00
[    4.680000] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    4.760000] pci_bus 0000:00: root bus resource [mem 0xffffffff80000000-0
fffff8fffffff] (bus address [0x80000000-0x8fffffff])
[    4.912000] pci_bus 0000:00: root bus resource [mem 0xffffff0000000000-0xffffff0fffffffff]
[    5.024000] pci_bus 0000:00: root bus resource [bus 00-07]
[    5.120000] Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
[    5.264000] LBA 0:2: PCI host bridge to bus 0000:40
[    5.328000] pci_bus 0000:40: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    5.448000] pci_bus 0000:40: root bus resource [mem 0xffffffffa0000000-0xffffffffafffffff] (bus address [0xa0000000-0xafffffff])
[    5.600000] pci_bus 0000:40: root bus resource [mem 0xffffff2000000000-0xffffff2fffffffff]
[    5.708000] pci_bus 0000:40: root bus resource [bus 40-47]
[    5.804000] Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
[    5.948000] LBA 0:3: PCI host bridge to bus 0000:60
[    6.016000] pci_bus 0000:60: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0xffff])
[    6.132000] pci_bus 0000:60: root bus resource [mem 0xffffffffb0000000-0xffffffffbfffffff] (bus address [0xb0000000-0xbfffffff])
[    6.284000] pci_bus 0000:60: root bus resource [mem 0xffffff3000000000-0xffffff3fffffffff]
[    6.396000] pci_bus 0000:60: root bus resource [bus 60-67]
[    6.492000] Quicksilver version TR1.0 (0x10) found at 0xfffffffffed28000
[    6.640000] LBA 0:4: PCI host bridge to bus 0000:80
[    6.708000] pci_bus 0000:80: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0xffff])
[    6.824000] pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffcfffffff] (bus address [0xc0000000-0xcfffffff])
[    6.976000] pci_bus 0000:80: root bus resource [mem 0xffffff4000000000-0xffffff4fffffffff]
[    7.084000] pci_bus 0000:80: root bus resource [bus 80-87]
[    7.160000] pci 0000:80:00.0: no compatible bridge window for [mem 0xd0030000-0xd003ffff]
[    7.268000] pci 0000:80:00.0: no compatible bridge window for [mem 0xd0000000-0xd001ffff pref]
[    7.380000] pci 0000:80:00.1: no compatible bridge window for [mem 0xd0020000-0xd002ffff]
[    7.488000] iosapic: no IRTE for 0000:80:00.1 (IRQ not connected?)
[    7.568000] pci 0000:80:00.0: BAR 6: assigned [mem 0xffffff4000000000-0xffffff400001ffff pref]
[    7.684000] pci 0000:80:00.0: BAR 2: assigned [mem 0xffffff4000020000-0xffffff400002ffff]
[    7.792000] pci 0000:80:00.1: BAR 1: assigned [mem 0xffffff4000030000-0xffffff400003ffff]
<Cpu0> 0300108200e00000  0000000000000000  CC_PROCS_ENTRY_IN
<Cpu0> 0300030700e00000  0000000000000000  CC_SYSTEM_STATE_RUNNING_OK
[    8.304000] powersw: Soft power switch at 0xfffffff0f042e278 enabled.
[    8.400000] bio: create slab <bio-0> at 0
[    8.520000] raid6: int64x1    988 MB/s
[    8.636000] raid6: int64x2   1207 MB/s
[    8.752000] raid6: int64x4   1342 MB/s
[    8.868000] raid6: int64x8   1270 MB/s
[    8.916000] raid6: using algorithm int64x4 (1342 MB/s)
[    8.984000] raid6: using intx1 recovery algorithm
[    9.044000] vgaarb: device added: PCI:0000:80:00.0,decodes=io+mem,owns=io+mem,locks=none
[    9.152000] vgaarb: loaded
[    9.188000] vgaarb: bridge control possible 0000:80:00.0
[    9.260000] SCSI subsystem initialized
[    9.308000] usbcore: registered new interface driver usbfs
[    9.380000] usbcore: registered new interface driver hub
[    9.452000] usbcore: registered new device driver usb
[    9.524000] NET: Registered protocol family 2
[    9.584000] TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
[    9.684000] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    9.776000] TCP: Hash tables configured (established 262144 bind 65536)
[    9.860000] TCP: reno registered
[    9.684000] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    9.776000] TCP: Hash tables configured (established 262144 bind 65536)
[    9.860000] TCP: reno registered
[    9.904000] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    9.984000] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[   10.072000] NET: Registered protocol family 1
[   10.204000] Unpacking initramfs...
[   11.540000] Freeing initrd memory: 2338k freed
[   11.600000] The PDC console driver is still registered, removing CON_BOOT flag
[   11.696000] Chassis warnings not supported.
[   11.752000] Performance monitoring counters enabled for Crestone Peak Mako+ Slow
[   11.860000] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[   11.960000] msgmni has been set to 16080
[   12.012000] io scheduler noop registered
[   12.064000] io scheduler deadline registered
[   12.120000] io scheduler cfq registered (default)
[   12.184000] STI GSC/PCI core graphics driver Version 0.9a
[   12.256000] radeonfb 0000:80:00.0: enabling SERR and PARITY (0107 -> 0147)
<Cpu1> e800009801e00000  00000000401173e8  CC_ERR_CHECK_HPMC
<Cpu1> 37000f7301e00000  8040004000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu1> f600105e01e00000  fffffff0f0c00000  CC_MC_HPMC_MONARCH_SELECTED
<Cpu1> 140003b201e00000  000000000000000b  CC_ERR_HPMC_STATE_ENTRY
<Cpu1> 5600100b01e00000  0000000000000194  CC_MC_OS_HPMC_LEN_ERR
<Cpu1> 5600106401e00000  fffffff0f0436fc0  CC_MC_BR_TO_OS_HPMC_FAILED
<Cpu1> e800009801e00000  00000000401173e8  CC_ERR_CHECK_HPMC
<Cpu0> ec000c9600e00000  0000000000000000  CC_ERR_CHECK_FALL_THROUGH
<Cpu1> 37000f7301e00000  8040004000000000  CC_ERR_CPU_CHECK_SUMMARY
<Cpu1> 4000109f01e00000  0000000000000000  CC_MC_HPMC_INITIATED
<Cpu1> 4000101901e00000  0000000000000000  CC_MC_MULTIPLE_HPMCS
<Cpu1> 030010d501e00000  0000000000000000  CC_CPU_STOP
[   72.356000] INFO: rcu_sched detected stalls on CPUs/tasks: { 1} (detected by 0, t=15002 jiffies)
[   72.356000] Backtrace:
[   72.356000]  [<0000000040136238>] dump_stack+0x18/0x28
[   72.356000]  [<00000000401badec>] rcu_check_callbacks+0x824/0x840
[   72.356000]  [<000000004016c6fc>] update_process_times+0x64/0xb0
[   72.356000]  [<00000000401378c8>] timer_interrupt+0x198/0x1f8
[   72.356000]  [<00000000401b1c4c>] handle_irq_event_percpu+0xbc/0x2f8
[   72.356000]  [<00000000401b62ec>] handle_percpu_irq+0x9c/0xd0
[   72.356000]  [<00000000401b10b4>] generic_handle_irq+0x44/0x58
[   72.356000]  [<000000004013839c>] do_cpu_irq_mask+0x1ac/0x290
[   72.356000]  [<0000000040105074>] intr_return+0x0/0x4
[   72.356000]  [<000000004013f428>] cpu_idle+0x80/0xb0

And that's it. Well, the ISO *is* an experimental one ;-) Any idea what
to try?

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Pale Bride (The Von Bondies), Slip Away (Sedatives)
24539 Neumuenster, Germany|Sacred Decay (The Estranged), She's Lost Control
