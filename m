From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: kernel 2.6.32-5-parisc64 doesn't boot
Date: Mon, 28 Jun 2010 23:22:57 -0600
Message-ID: <20100629052257.GB20908@lackof.org>
References: <4C219FF7.7030601@logix.net.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org
To: Michal Ludvig <mludvig@logix.net.nz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4C219FF7.7030601@logix.net.nz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

+linux-parisc (seems like a known kernel issue)

On Wed, Jun 23, 2010 at 05:47:35PM +1200, Michal Ludvig wrote:
> Hi all,
> 
> After recent dist-upgrade in Squeeze my HP9000 RP3410 no longer boots. I
> can still boot the previous linux-image 2.6.32-3-parisc64 but the new
> 2.6.32-5-parisc64 never finished booting. It looks like it reboots
> during USB enumeration or somewhere there:

Hi Michal,
I strongly suspect it's the same problem we saw on the C3xxx workstations.
Here's the comment in drivers/parisc/sba_iommu.c:

        if (!is_pdc_pat()) {
                /* Shutdown the USB controller on Astro-based workstations.
                ** Once we reprogram the IOMMU, the next DMA performed by
                ** USB will HPMC the box. USB is only enabled if a
                ** keyboard is present and found.
                **
                ** With serial console, j6k v5.0 firmware says:
                **   mem_kbd hpa 0xfee003f8 sba 0x0 pad 0x0 cl_class 0x7
                **
                ** FIXME: Using GFX+USB console at power up but direct
                **      linux to serial console is still broken.
                **      USB could generate DMA so we must reset USB.
                **      The proper sequence would be:
                **      o block console output
                **      o reset USB device
                **      o reprogram serial port
                **      o unblock console output
                */
                if (PAGE0->mem_kbd.cl_class == CL_KEYBD) {
                        pdc_io_reset_devices();
                }

        }


Could you try to make this code "unconditional"?
(remove !is_pdc_pat() test)

If someone have better ideas on how to handle this...
I can build kernels and test on a J6000.

thanks,
grant

> 
> ------------------------------------
> 
> Booting...
> Boot IO Dependent Code (IODC) revision 1
> 
> 
> HARD Booted.
> palo ipl 1.14 root@penalosa Wed Oct  8 15:04:37 UTC 2008
> Skipping extended partition 6 - beyond reach of IPL
> 
> Partition Start(MB) End(MB) Id Type
> 1               1      31   f0 Palo
> 2              32     156   83 ext2
> 5             157   33408   83 ext2
> 
> PALO(F0) partition contains:
>     0/vmlinux64 6833698 bytes @ 0x48000
> 
> 
> Command line for kernel: 'root=/dev/sdb5 HOME=/ console=ttyS1
> palo_kernel=2/vmlinux'
> Selected kernel: /vmlinux from partition 2
> Selected ramdisk: /initrd.img from partition 2
> ELF64 executable
> Entry 00100000 first 00100000 n 2
> Segment 0 load 00100000 size 4673536 mediaptr 0x1000
> Segment 1 load 005ea730 size 743376 mediaptr 0x476730
> Loading ramdisk 11788317 bytes @ 3f4b0000...
> Branching to kernel entry point 0x00100000.  If this is the last
> message you see, you may need to switch your console.  This is
> a common symptom -- search the FAQ and mailing list at parisc-linux.org
> 
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 2.6.32-5-parisc64 (Debian 2.6.32-15)
> (ben@decadent.org.uk) (gcc version 4.3.5 (GCC) ) #1 Tue Jun 1 12:13:09
> UTC 2010
> [    0.000000] unwind_init: start = 0x40494000, end = 0x404c1e60,
> entries = 11750
> [    0.000000] WARNING: Out of order unwind entry! 0000000040495990 and
> 00000000404959a0
> [    0.000000] WARNING: Out of order unwind entry! 00000000404959a0 and
> 00000000404959b0
> [    0.000000] FP[0] enabled: Rev 1 Model 20
> [    0.000000] The 64-bit Kernel has started...
> [    0.000000] bootconsole [ttyB0] enabled
> [    0.000000] Initialized PDC Console for debugging.
> [    0.000000] Determining PDC firmware type: 64 bit PAT.
> [    0.000000] model 00008860 00000491 00000000 00000002
> 3e3ffb8ecde69d7c 100000f0 00000008 000000b2 000000b2
> [    0.000000] vers  00000302
> [    0.000000] CPUID vers 20 rev 5 (0x00000285)
> [    0.000000] capabilities 0x35
> [    0.000000] model 9000/800/rp3410
> [    0.000000] parisc_cache_init: Only equivalent aliasing supported!
> [    0.000000] Memory Ranges:
> [    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size
>   1024 MB
> [    0.000000]  1) Start 0x0000004040000000 End 0x00000040ffdfffff Size
>   3070 MB
> [    0.000000] Total Memory: 4094 MB
> [    0.000000] initrd: 7f4b0000-7ffee01d
> [    0.000000] initrd: reserving 3f4b0000-3ffee01d (mem_max ffe00000)
> [    0.000000] Built 2 zonelists in Zone order, mobility grouping on.
> Total pages: 1033735
> [    0.000000] Kernel command line: root=/dev/sdb5 HOME=/ console=ttyS1
> palo_kernel=2/vmlinux
> [    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
> [    0.000000] Dentry cache hash table entries: 524288 (order: 10,
> 4194304 bytes)
> [    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152
> bytes)
> [    0.000000] Memory: 4102144k/4192256k available (2996k kernel code,
> 89144k reserved, 1519k data, 272k init)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000
> (1007 MB)
> [    0.000000]     memory  : 0x0000000040000000 - 0x000000413fe00000
> (266238 MB)
> [    0.000000]       .init : 0x000000004065c000 - 0x00000000406a0000   (
> 272 kB)
> [    0.000000]       .data : 0x00000000403ed080 - 0x0000000040568de0
> (1519 kB)
> [    0.000000]       .text : 0x0000000040100000 - 0x00000000403ed080
> (2996 kB)
> [    0.000000] SLUB: Genslabs=13, HWalign=64, Order=0-3, MinObjects=0,
> CPUs=1, Nodes=8
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] NR_IRQS:128
> [    0.000000] Console: colour dummy device 160x64
> [    0.012000] Calibrating delay loop... 1597.44 BogoMIPS (lpj=3194880)
> [    0.108000] Security Framework initialized
> [    0.108000] SELinux:  Disabled at boot.
> [    0.108000] Mount-cache hash table entries: 256
> [    0.108000] Initializing cgroup subsys ns
> [    0.108000] Initializing cgroup subsys cpuacct
> [    0.112000] Initializing cgroup subsys devices
> [    0.116000] Initializing cgroup subsys freezer
> [    0.120000] Initializing cgroup subsys net_cls
> [    0.120000] devtmpfs: initialized
> [    0.128000] regulator: core version 0.5
> [    0.128000] NET: Registered protocol family 16
> [    0.132000] EISA bus registered
> [    0.136000] Searching for devices...
> [    0.356000] Found devices:
> [    0.356000] 1. Storm Peak Slow DC- at 0xfffffffffe780000 [128] { 0,
> 0x0, 0x886, 0x00004 }
> [    0.356000] 2. Everest Mako Memory at 0xfffffffffed08000 [8] { 1,
> 0x0, 0x0af, 0x00009 }
> [    0.356000] 3. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12,
> 0x0, 0x880, 0x0000c }
> [    0.364000] 4. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13,
> 0x0, 0x783, 0x0000a }
> [    0.372000] 5. Mercury PCI Bridge at 0xfffffffffed22000 [0/1] { 13,
> 0x0, 0x783, 0x0000a }
> [    0.376000] 6. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13,
> 0x0, 0x783, 0x0000a }
> [    0.384000] 7. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13,
> 0x0, 0x783, 0x0000a }
> [    0.392000] 8. Mercury PCI Bridge at 0xfffffffffed28000 [0/4] { 13,
> 0x0, 0x783, 0x0000a }
> [    0.392000] 9. Mercury PCI Bridge at 0xfffffffffed2c000 [0/6] { 13,
> 0x0, 0x783, 0x0000a }
> [    0.400000] 10. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13,
> 0x0, 0x783, 0x0000a }
> [    0.408000] 11. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15,
> 0x0, 0x004, 0x000c0 }
> [    0.412000] Enabling PDC_PAT chassis codes support v0.05
> [    1.268000] CPU(s): 1 x PA8800 (Mako) at 800.024500 MHz
> [    1.272000] Setting cache flush threshold to 135cec0 (1 CPUs online)
> [    1.324000] SBA found Pluto 2.3 at 0xfffffffffed00000
> [    1.384000] Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
> [    1.420000] pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
> [    1.420000] pci 0000:00:01.0: PME# disabled
> [    1.420000] pci 0000:00:01.1: PME# supported from D0 D1 D2 D3hot
> [    1.420000] pci 0000:00:01.1: PME# disabled
> [    1.432000] pci 0000:00:01.2: PME# supported from D0 D1 D2 D3hot
> [    1.432000] pci 0000:00:01.2: PME# disabled
> [    1.448000] Mercury version TR3.2 (0x32) found at 0xfffffffffed22000
> [    1.484000] pci 0000:20:02.0: PME# supported from D3hot D3cold
> [    1.488000] pci 0000:20:02.0: PME# disabled
> [    1.492000] Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
> [    1.536000] Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
> [    1.584000] Mercury version TR3.2 (0x32) found at 0xfffffffffed28000
> [    1.632000] Mercury version TR3.2 (0x32) found at 0xfffffffffed2c000
> [    1.680000] Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
> [    1.720000] LBA: Truncating lmmio_space
> [fffffffff0000000/fffffffffecffffe] to [fffffffff0000000,fffffffffe77ffff]
> [    1.724000] powersw: Soft power switch support not available.
> [    1.728000] bio: create slab <bio-0> at 0
> [    1.728000] vgaarb: device added:
> PCI:0000:e0:02.0,decodes=io+mem,owns=io+mem,locks=none
> [    1.728000] vgaarb: loaded
> [    1.736000] Switching to clocksource cr16
> [    1.736000] NET: Registered protocol family 2
> [    1.736000] IP route cache hash table entries: 131072 (order: 8,
> 1048576 bytes)
> [    1.744000] TCP established hash table entries: 262144 (order: 10,
> 4194304 bytes)
> [    1.756000] TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
> [    1.760000] TCP: Hash tables configured (established 262144 bind 65536)
> [    1.760000] TCP reno registered
> [    1.764000] NET: Registered protocol family 1
> [    1.788000] Unpacking initramfs...
> [    2.532000] Freeing initrd memory: 11512k freed
> [    2.536000] Chassis warnings not supported.
> [    2.536000] Performance monitoring counters enabled for Storm Peak
> Slow DC-
> [    2.536000] audit: initializing netlink socket (disabled)
> [    2.540000] type=2000 audit(1277259537.537:1): initialized
> [    2.552000] VFS: Disk quotas dquot_6.5.2
> [    2.552000] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    2.560000] msgmni has been set to 8036
> [    2.560000] alg: No test for stdrng (krng)
> [    2.560000] Block layer SCSI generic (bsg) driver version 0.4 loaded
> (major 253)
> [    2.564000] io scheduler noop registered
> [    2.564000] io scheduler anticipatory registered
> [    2.572000] io scheduler deadline registered
> [    2.572000] io scheduler cfq registered (default)
> [    2.584000] PDC Stable Storage facility v0.30
> [    2.672000] STI GSC/PCI core graphics driver Version 0.9a
> [    2.676000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    2.684000] 0000:e0:01.0: ttyS0 at MMIO 0xfffffffff4051000 (irq = 74)
> is a 16450
> [    2.692000] 0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050000 (irq = 74)
> is a 16550A
> [    2.692000] console [ttyS1] enabled, bootconsole disabled
> [    2.692000] console [ttyS1] enabled, bootconsole disabled
> [    2.696000] 0000:e0:01.1: ttyS2 at MMIO 0xfffffffff4050010 (irq = 74)
> is a 16550A
> [    2.704000] 0000:e0:01.1: ttyS3 at MMIO 0xfffffffff4050038 (irq = 74)
> is a 16550A
> [    2.712000] mice: PS/2 mouse device common for all mice
> [    2.712000] rtc-generic rtc-generic: rtc core: registered rtc-generic
> as rtc0
> [    2.720000] TCP cubic registered
> [    2.720000] NET: Registered protocol family 17
> [    2.724000] registered taskstats version 1
> [    2.740000] rtc-generic rtc-generic: setting system clock to
> 2010-06-23 02:18:58 UTC (1277259538)
> [    2.916000] Freeing unused kernel memory: 272k freed
> Loading, please wait...
> [    3.580000] udev: starting version 157
> [    4.492000] SCSI subsystem initialized
> [    4.692000] usbcore: registered new interface driver usbfs
> [    4.692000] usbcore: registered new interface driver hub
> [    4.692000] usbcore: registered new device driver usb
> [    4.940000] tg3.c:v3.102 (September 1, 2009)
> [    5.016000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    5.044000] ehci_hcd 0000:00:01.2: EHCI Host Controller
> [    5.064000] ehci_hcd 0000:00:01.2: new USB bus registered, assigned
> bus number 1
> [    5.088000] ehci_hcd 0000:00:01.2: Enabling legacy PCI PM
> [    5.112000] ehci_hcd 0000:00:01.2: irq 67, io mem 0xffffffff80000000
> [    5.128000] ehci_hcd 0000:00:01.2: USB 2.0 started, EHCI 0.95
> [    5.128000] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
> [    5.128000] usb usb1: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [    5.136000] usb usb1: Product: EHCI Host Controller
> [    5.136000] usb usb1: Manufacturer: Linux 2.6.32-5-parisc64 ehci_hcd
> [    5.144000] usb usb1: SerialNumber: 0000:00:01.2
> [    5.196000] usb usb1: configuration #1 chosen from 1 choice
> [    5.196000] hub 1-0:1.0: USB hub found
> [    5.196000] hub 1-0:1.0: 5 ports detected
> 
> 
> 
> Firmware Version  46.34
> 
> Duplex Console IO Dependent Code (IODC) revision 1
> 
> 
> 
> Firmware Version  46.34
> 
> Duplex Console IO Dependent Code (IODC) revision 1
> ------------------------------------------------------------------------------
>    (c) Copyright 1995-2004, Hewlett-Packard Company, All rights reserved
> ------------------------------------------------------------------------------
> 
>   Processor   Speed            State           CoProcessor State  Cache Size
>   Number                                       State              Inst
>   Data
>   ---------  --------   ---------------------  -----------------
> ------------
>       0      800  MHz   Active                 Functional
> 33554432 33554432
>       1      800  MHz   Stopped:Deconfigured   Unknown            0 0
> 
>   Central Bus Speed (in MHz)  :        200
>   Available Memory            :    4194304  KB
>   Good Memory Required        : Not initialized. Defaults to 32 MB.
> 
>    Primary boot path:    0/1/1/0.1
>    Alternate boot path:  0/1/1/0.0
>    Console path:         0/7/1/1.0
>    Keyboard path:        0/0/4/0.0
> 
> 
> Processor is booting from the first available device.
> 
> To discontinue, press any key within 10 seconds.
> 
> Boot terminated.
> 
> ------------------------------------
> 
> It kept trying and failing/rebooting at the same point a couple of times.
> 
> Do you need any other information? I'm now back on 2.6.32-3 but am keen
> to run any test kernels.
> 
> Michal
> 
> 
> -- 
> To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
> Archive: http://lists.debian.org/4C219FF7.7030601@logix.net.nz
