From: Helge Deller <deller@gmx.de>
Subject: Re: Debian vmlinux-4.14.0-1-parisc64-smp fails to boot on c3750
Date: Sun, 3 Dec 2017 21:21:56 +0100
Message-ID: <5b767291-0b39-b38b-26f6-80bb6f462032@gmx.de>
References: <008A2452-42ED-45E9-8FDE-69757C9D6962@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
To: John David Anglin <dave.anglin@bell.net>,
        linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <008A2452-42ED-45E9-8FDE-69757C9D6962@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03.12.2017 17:54, John David Anglin wrote:
> Fails early, probably in palo.  I don't have a boot log as the machine has a graphics console.
> 
> ii  linux-image-4.13.0-1-parisc64-smp          4.13.13-1     hppa         Linux 4.13 for multiprocessor 64-bit PA-RISC
> ii  linux-image-4.14.0-1-parisc64-smp          4.14.2-1      hppa         Linux 4.14 for multiprocessor 64-bit PA-RISC
> 
> The 4.13.13-1 kernel boots okay.
> 
> root@hiauly6:/var/log# dpkg -l palo
> ii  palo                               1.99                   hppa                   Linux boot loader for HP PA-RISC


Strange.
It works nicely for me on my C3700 machine:


palo ipl 1.99 http://www.parisc-linux.org - Fri, 18 Aug 2017 11:50:44 +0200
Skipping extended partition 6 - beyond reach of IPL

Partition Start(MB) End(MB) Id Type
1               2      33   f0 Palo
2              34     157   83 ext2
5             159   134887   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 18847280(0) bytes @ 0x140000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=LABEL=ROOT rootfstype=ext4 HOME=/ panic_timeout=60 panic=-1 console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
Selected ramdisk: /initrd.img from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 463104 mediaptr 0x1000
Segment 1 load 00172000 size 210976 mediaptr 0x73000
Segment 2 load 00200000 size 10634416 mediaptr 0xa7000
Segment 3 load 00c25000 size 3194732 mediaptr 0xacc000
Segment 4 load 01000000 size 2631320 mediaptr 0xdd8000
Loading ramdisk 21583160 bytes @ 3eb59000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Linux version 4.14.0-1-parisc64-smp (debian-kernel@lists.debian.org) (gcc version 7.2.0 (GCC)) #1 SMP Debian 4.14.2-1 (2017-11-30)
[    0.000000] unwind_init: start = 0x40ed19cc, end = 0x40f30f6c, entries = 24410
[    0.000000] FP[0] enabled: Rev 1 Model 19
[    0.000000] The 64-bit Kernel has started...
[    0.000000] Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical and 2 MB virtual size.
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: System Map.
[    0.000000] model 00005dc0 00000481 00000000 00000002 777c3e84 100000f0 00000008 000000b2 000000b2
[    0.000000] random: fast init done
[    0.000000] vers  00000301
[    0.000000] CPUID vers 19 rev 11 (0x0000026b)
[    0.000000] capabilities 0x7
[    0.000000] model 9000/785/C3700
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000007fffffff Size   2048 MB
[    0.000000] Total Memory: 2048 MB
[    0.000000] initrd: 7eb59000-7ffee538
[    0.000000] initrd: reserving 3eb59000-3ffee538 (mem_max 80000000)
[    0.000000] PDT: type PDT_PDC, size 50, entries 0, status 2, dbe_loc 0xffffffffffffffff, good_mem 30 MB
[    0.000000] PDT: Firmware reports all memory OK.
[    0.000000] LCD display at fffffff0f05d0008,fffffff0f05d0000 registered
[    0.000000] percpu: Embedded 27 pages/cpu @00000000bdf25000 s71712 r8192 d30688 u110592
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 516096
[    0.000000] Kernel command line: root=LABEL=ROOT rootfstype=ext4 HOME=/ panic_timeout=60 panic=-1 console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.000000] Memory: 2016828K/2097152K available (10388K kernel code, 4294K rwdata, 1376K rodata, 1024K init, 848K bss, 80324K reserved, 0K cma-re)
[    0.000000] virtual kernel memory layout:
    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    0.000000]     memory  : 0x0000000040000000 - 0x00000000c0000000   (2048 MB)
    0.000000]       .init : 0x0000000040100000 - 0x0000000040200000   (1024 kB)
    0.000000]       .data : 0x0000000040c25000 - 0x00000000411aeae0   (5670 kB)
    0.000000]       .text : 0x0000000040200000 - 0x0000000040c25000   (10388 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS: 128
[    0.000011] sched_clock: 64 bits at 750MHz, resolution 1ns, wraps every 4398046511103ns
[    0.105387] Console: colour dummy device 160x64
[    0.164070] Calibrating delay loop... 1494.01 BogoMIPS (lpj=2988032)
[    0.268015] pid_max: default: 32768 minimum: 301
[    0.332805] Security Framework initialized
[    0.384023] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.472195] AppArmor: AppArmor initialized
[    0.528261] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.616096] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.714533] Hierarchical SRCU implementation.
[    0.773725] smp: Bringing up secondary CPUs ...
[    0.832023] smp: Brought up 1 node, 1 CPU
[    0.888943] devtmpfs: initialized
[    0.934735] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    1.060069] futex hash table entries: 2048 (order: 4, 65536 bytes)
[    1.146496] NET: Registered protocol family 16
[    1.205279] EISA bus registered
[    1.248220] Searching for devices...
[    1.524013] Found devices:
[    1.560030] 1. Astro BC Runway Port at 0xfffffffffed00000 [10] { 12, 0x0, 0x582, 0x0000b }
[    1.668024] 2. Elroy PCI Bridge at 0xfffffffffed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
[    1.776024] 3. Elroy PCI Bridge at 0xfffffffffed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
[    1.880067] 4. Elroy PCI Bridge at 0xfffffffffed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
[    1.988029] 5. Elroy PCI Bridge at 0xfffffffffed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
[    2.096025] 6. Allegro W2 at 0xfffffffffffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
[    2.192032] 7. Memory at 0xfffffffffed10200 [49] { 1, 0x0, 0x09c, 0x00009 }
[    2.284022] Enabling regular chassis codes support v0.05
[    2.484589] CPU(s): 1 out of 1 PA8700 (PCX-W2) at 750.000000 MHz online
[    2.579703] Cache flush threshold set to 656 KiB
[    2.642776] TLB flush threshold set to 40 KiB
[    2.728384] SBA found Astro 2.1 at 0xfffffffffed00000
[    2.796089] Elroy version TR4.0 (0x5) found at 0xfffffffffed30000
[    2.876889] LBA 10:0: PCI host bridge to bus 0000:00
[    2.940077] pci_bus 0000:00: root bus resource [io  0x0000-0x1fff]
[    3.024025] pci_bus 0000:00: root bus resource [mem 0xfffffffff4000000-0xfffffffff47fffff] (bus address [0xf4000000-0xf47fffff])
[    3.176030] pci_bus 0000:00: root bus resource [bus 00]
[    3.246230] PCI: Enabled native mode for NS87415 (pif=0x8f)
[    3.325864] Elroy version TR4.0 (0x5) found at 0xfffffffffed32000
[    3.404350] LBA 10:1: PCI host bridge to bus 0000:01
[    3.468034] pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] (bus address [0x2000-0x3fff])
[    3.588028] pci_bus 0000:01: root bus resource [mem 0xfffffffffa000000-0xfffffffffbffffff] (bus address [0xfa000000-0xfbffffff])
[    3.740027] pci_bus 0000:01: root bus resource [mem 0xfffffffff4800000-0xfffffffff4ffffff] (bus address [0xf4800000-0xf4ffffff])
[    3.892075] pci_bus 0000:01: root bus resource [bus 01]
[    3.964261] iosapic: hpa not registered for 0000:01:04.0
[    4.032386] Elroy version TR4.0 (0x5) found at 0xfffffffffed38000
[    4.112359] LBA 10:4: PCI host bridge to bus 0000:02
[    4.180035] pci_bus 0000:02: root bus resource [io  0x28000-0x29fff] (bus address [0x8000-0x9fff])
[    4.296037] pci_bus 0000:02: root bus resource [mem 0xfffffffff9000000-0xfffffffff9ffffff] (bus address [0xf9000000-0xf9ffffff])
[    4.448027] pci_bus 0000:02: root bus resource [mem 0xfffffffff6000000-0xfffffffff67fffff] (bus address [0xf6000000-0xf67fffff])
[    4.600028] pci_bus 0000:02: root bus resource [bus 02]
[    4.672818] iosapic: hpa not registered for 0000:02:03.0
[    4.740384] Elroy version TR4.0 (0x5) found at 0xfffffffffed3c000
[    4.820337] LBA 10:6: PCI host bridge to bus 0000:03
[    4.888169] pci_bus 0000:03: root bus resource [io  0x3c000-0x3dfff] (bus address [0xc000-0xdfff])
[    5.004028] pci_bus 0000:03: root bus resource [mem 0xfffffffff7000000-0xfffffffff77fffff] (bus address [0xf7000000-0xf77fffff])
[    5.156028] pci_bus 0000:03: root bus resource [bus 03]
[    5.231823] powersw: Soft power switch at 0xfffffff0f0400804 enabled.
[    5.324572] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    5.414856] vgaarb: loaded
[    5.536173] VFS: Disk quotas dquot_6.6.0
[    5.584191] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    5.677237] AppArmor: AppArmor Filesystem Enabled
[    5.752377] NET: Registered protocol family 2
[    5.809256] TCP established hash table entries: 16384 (order: 5, 131072 bytes)
[    5.904358] TCP bind hash table entries: 16384 (order: 6, 262144 bytes)
[    5.992506] TCP: Hash tables configured (established 16384 bind 16384)
[    6.080017] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    6.156095] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    6.244329] NET: Registered protocol family 1
[    6.300164] SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 68)
[    6.392059] SuperIO: Serial port 1 at 0x3f8
[    6.448033] SuperIO: Serial port 2 at 0x2f8
[    6.504030] SuperIO: Parallel port at 0x378
[    6.560029] SuperIO: Floppy controller at 0x3f0
[    6.620029] SuperIO: ACPI at 0x7e0
[    6.664173] SuperIO: USB regulator enabled
[    6.720535] Unpacking initramfs...
[    8.418641] Freeing initrd memory: 21076K
[    8.468240] clocksource: cr16: mask: 0xffffffffffffffff max_cycles: 0xacf9151134, max_idle_ns: 440795214493 ns
[    8.600118] clocksource: Switched to clocksource cr16
[    8.668487] Enabling PDC chassis warnings support v0.05
[    8.737457] Performance monitoring counters enabled for Allegro W2
[    8.820610] audit: initializing netlink subsys (disabled)
[    8.892858] audit: type=2000 audit(1512332275.887:1): state=initialized audit_enabled=0 res=1
[    9.005130] workingset: timestamp_bits=43 max_order=19 bucket_order=0
[    9.090093] zbud: loaded
[   37.399022] Key type asymmetric registered
[   37.453199] Asymmetric key parser 'x509' registered
[   37.517670] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[   37.615329] io scheduler noop registered
[   37.666936] io scheduler deadline registered
[   37.723196] io scheduler cfq registered (default)
[   37.785042] io scheduler mq-deadline registered
[   37.848242] PDC Stable Storage facility v0.30
[   38.242827] STI GSC/PCI core graphics driver Version 0.9b
[   38.314013] sti 0000:01:04.0: enabling SERR and PARITY (0002 -> 0142)
[   38.398777] STI PCI graphic ROM found at fffffffff4800000 (64 kB), fb at fffffffffa000000 (32 MB)
[   38.589866] STI ROM supports 32 bit firmware functions.
[   38.658624] STI selected 8x16 framebuffer font VGA8x16 for sticon
[   38.738834]     id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
[   38.818440]     graphics card name: PCI_GRAFFITIX1280
[   38.884947] sticon: Initializing STI text console.
[   38.950364] Console: switching to colour STI console 160x64
[   40.143996] Console: switching to colour frame buffer device 160x64
[   40.311231] fb0: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIX1280, id: 2d08c0a7, mmio: 0xfffffffffa100000
[   40.446579] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[   40.529275] serial8250: ttyS0 at I/O 0x3f8 (irq = 3, base_baud = 115200) is a 16550A
[   40.631226] console [ttyS0] enabled
[   40.631226] console [ttyS0] enabled
[   40.718823] bootconsole [ttyB0] disabled
[   40.718823] bootconsole [ttyB0] disabled
[   40.817599] serial8250: ttyS1 at I/O 0x2f8 (irq = 4, base_baud = 115200) is a 16550A
[   40.911496] Linux agpgart interface v0.103
[   40.960513] quicksilver: No Pluto found, so no AGPGART for you.
[   41.032072] mousedev: PS/2 mouse device common for all mice
[   41.100946] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[   41.186564] ledtrig-cpu: registered to indicate activity on CPUs
[   41.259160] NET: Registered protocol family 10
[   41.313938] Segment Routing with IPv6
[   41.357891] mip6: Mobile IPv6
[   41.393475] NET: Registered protocol family 17
[   41.446735] mpls_gso: MPLS GSO support
[   41.492542] registered taskstats version 1
[   41.541680] zswap: loaded using pool lzo/zbud
[   41.594084] AppArmor: AppArmor sha1 policy hashing enabled
[   41.659839] ima: No TPM chip found, activating TPM-bypass! (rc=-19)
[   41.737476] rtc-generic rtc-generic: setting system clock to 2017-12-03 20:18:29 UTC (1512332309)
[   41.847263] Freeing unused kernel memory: 1024K
[   41.901682] Write protecting the kernel read-only data: 1376k
Loading, please wait...
starting version 235
[   42.622004] tulip: Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
[   42.897074] SCSI subsystem initialized
[   42.997992] usbcore: registered new interface driver usbfs
[   43.185917] tulip0: no phy info, aborting mtable build
[   43.248289] tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1
[   43.403892] usbcore: registered new interface driver hub
[   43.468955] usbcore: registered new device driver usb
[   43.545569] net eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xfffffffff4008000, 00:30:6e:48:aa:64, IRQ 66
[   43.662804] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   43.749973] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[   44.058247] sym0: <896> rev 0x7 at pci 0000:00:0f.0 irq 69
[   44.146187] ehci-pci: EHCI PCI platform driver
[   44.207519] ohci-pci: OHCI PCI platform driver
[   44.263747] sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
[   44.345873] sym0: SCSI BUS has been reset.
[   44.398567] sym0: SCSI BUS mode change from SE to SE.
[   44.402517] sym0: SCSI BUS has been reset.
[   44.510541] scsi host0: sym-2.2.3
[   44.558573] scsi host1: pata_ns87415
[   44.602583] scsi host2: pata_ns87415
[   44.646201] ata1: PATA max MWDMA2 cmd 0xf00 ctl 0xe00 bmdma 0xa00 irq 7
[   44.725467] ata2: PATA max MWDMA2 cmd 0xd00 ctl 0xb00 bmdma 0xa08 irq 7
[   44.809407] ohci-pci 0000:00:0e.2: OHCI PCI host controller
[   44.878682] ohci-pci 0000:00:0e.2: new USB bus registered, assigned bus number 1
[   44.974847] ohci-pci 0000:00:0e.2: irq 1, io mem 0xfffffffff4007000
[   45.050734] ata1.00: ATAPI: CD-532E-B, 2.0A, max MWDMA2
[   45.113995] usb usb1: New USB device found, idVendor=1d6b, idProduct=0001
[   45.195337] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   45.281870] usb usb1: Product: OHCI PCI host controller
[   45.344439] usb usb1: Manufacturer: Linux 4.14.0-1-parisc64-smp ohci_hcd
[   45.424731] usb usb1: SerialNumber: 0000:00:0e.2
[   45.482667] hub 1-0:1.0: USB hub found
[   45.528256] ata1.00: configured for MWDMA2
[   45.577541] hub 1-0:1.0: 3 ports detected
[   45.860693] sym1: <896> rev 0x7 at pci 0000:00:0f.1 irq 69
[   45.952012] sym1: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
[   46.035227] sym1: SCSI BUS has been reset.
[   46.087344] scsi host3: sym-2.2.3
[   49.544849] scsi: waiting for bus probes to complete ...
[   50.645610] scsi 3:0:5:0: Direct-Access     COMPAQ   BF14688577       HPB2 PQ: 0 ANSI: 3
[   50.742525] scsi target3:0:5: tagged command queuing enabled, command queue depth 16.
[   50.836430] scsi target3:0:5: Beginning Domain Validation
[   50.908934] scsi target3:0:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
[   51.000937] scsi target3:0:5: Domain Validation skipping write tests
[   51.077043] scsi target3:0:5: Ending Domain Validation
[   51.140476] scsi 3:0:6:0: Direct-Access     HP 36.4G ST336607LC       HPC3 PQ: 0 ANSI: 3
[   51.237417] scsi target3:0:6: tagged command queuing enabled, command queue depth 16.
[   51.331258] scsi target3:0:6: Beginning Domain Validation
[   51.401333] scsi target3:0:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
[   51.491687] scsi target3:0:6: Domain Validation skipping write tests
[   51.567819] scsi target3:0:6: Ending Domain Validation
[   53.986246] scsi 1:0:0:0: CD-ROM            TEAC     CD-532E-B        2.0A PQ: 0 ANSI: 5
[   54.345230] sd 3:0:5:0: [sda] 286749488 512-byte logical blocks: (147 GB/137 GiB)
[   54.435111] sd 3:0:6:0: [sdb] 71132960 512-byte logical blocks: (36.4 GB/33.9 GiB)
[   54.544706] sd 3:0:6:0: [sdb] Write Protect is off
[   54.602514] sd 3:0:5:0: [sda] Write Protect is off
[   54.661805] sd 3:0:5:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   54.764987] sr 1:0:0:0: [sr0] scsi3-mmc drive: 32x/32x cd/rw xa/form2 cdda tray
[   54.852578] cdrom: Uniform CD-ROM driver Revision: 3.20
[   54.915192] sd 3:0:6:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   55.048066]  sda: sda1 sda2 sda3 < sda5 sda6 >
[   55.101515]  sdb: sdb1 sdb2 sdb3 < sdb5 sdb6 >
[   55.181368] sd 3:0:5:0: [sda] Attached SCSI disk
[   55.259224] random: crng init done
[   55.317226] sd 3:0:6:0: [sdb] Attached SCSI disk
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... done.
Begin: Will now check root file system ... fsck from util-linux 2.30.2
[/sbin/fsck.ext4 (1) -- /dev/sda5] fsck.ext4 -a -C0 /dev/sda5 
ROOT: clean, 98931/8626176 files, 3246659/34490624 blocks
done.
[   56.841651] EXT4-fs (sda5): mounted filesystem with ordered data mode. Opts: (null)
done.
Begin: Running /scripts/local-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
INIT: version 2.88 booting
Using makefile-style concurrent boot in runlevel S.
Starting the hotplug events dispatcher: systemd-udevdstarting version 235
.
Synthesizing the initial hotplug events...done.
Waiting for /dev to be fully populated...[   61.084525] sd 3:0:5:0: Attached scsi generic sg0 type 0
[   62.130990] sd 3:0:6:0: Attached scsi generic sg1 type 0
[   62.623219] sr 1:0:0:0: Attached scsi generic sg2 type 5
done.
Activating swap...[   66.411887] Adding 5249020k swap on /dev/sda6.  Priority:-2 extents:1 across:5249020k FS
done.
[   66.781479] net eth0: Setting full-duplex based on MII#1 link partner capability of 05e1
[   66.968703] EXT4-fs (sda5): re-mounted. Opts: errors=remount-ro
Activating lvm and md swap...done.
Checking file systems...fsck from util-linux 2.30.2
BOOT: clean, 23/31744 files, 90532/126976 blocks
done.
Cleaning up temporary files... /tmp.
[   71.094991] EXT4-fs (sda2): mounting ext2 file system using the ext4 subsystem
[   71.188204] EXT4-fs (sda2): mounted filesystem without journal. Opts: (null)
Mounting local filesystems...done.
Activating swapfile swap...done.
Cleaning up temporary files....
Starting AppArmor profiles:Mounting securityfs on /sys/kernel/security...Warning from stdin (line 1): /sbin/apparmor_parser: cannot use or update can
Warning failed to create cache: (null)
.
Setting kernel variables...done.
Configuring network interfaces...ifup: interface eth0 already configured
done.
Starting RPC port mapper daemon: rpcbind.
[   74.873589] RPC: Registered named UNIX socket transport module.
[   74.944511] RPC: Registered udp transport module.
[   75.000885] RPC: Registered tcp transport module.
[   75.057223] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   75.214198] FS-Cache: Loaded
[   75.387633] FS-Cache: Netfs 'nfs' registered for caching
[   75.619736] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Starting NFS common utilities: statd idmapd.
Cleaning up temporary files....
Setting up ALSA...done.
Setting up X socket directories... /tmp/.X11-unix /tmp/.ICE-unix.
INIT: Entering runlevel: 2
Using makefile-style concurrent boot in runlevel 2.
Starting enhanced syslogd: rsyslogd.
Starting system message bus: dbus.
Starting cgroup management daemon: cgmanagerStarting virtual private network daemon:.
Starting anac(h)ronistic cron: anacron.
Starting Apache httpd web server: apache2.
Starting deferred execution scheduler: atd.
Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon.
Starting cgroup management proxy daemon: cgproxy.
Starting periodic command scheduler: cron.
Starting SMP IRQ Balancer: irqbalance.
saned disabled; edit /etc/default/saned.
Starting OpenBSD Secure Shell server: sshd.
Starting MTA: exim4.
ALERT: exim paniclog /var/log/exim4/paniclog has non-zero size, mail system possibly broken

Debian GNU/Linux buster/sid c3000 ttyS0

c3000 login: 
