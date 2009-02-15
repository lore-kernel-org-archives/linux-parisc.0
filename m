From: Helge Deller <deller@gmx.de>
Subject: Re: Re : lenny / testing : missing USB device files
Date: Sun, 15 Feb 2009 11:54:58 +0100
Message-ID: <4997F482.6050405@gmx.de>
References: <200902150055.n1F0ta8X007465@stephenson.dhis.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
 linux-parisc <linux-parisc@vger.kernel.org>
To: Jean-Pierre HOFER <jph@stephenson.dhis.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <200902150055.n1F0ta8X007465@stephenson.dhis.org>
Resent-Message-ID: <xrz4BZ8AkNL.A.DgG.kS_lJB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Hi Jean-Pierre,
(added linux-parisc mailing list)

I just tested the debian kernel on my c3k.
For me a small external USB disk (250GB disk) attached to the USB bus worked fine.
Just for reference, I've uploaded my dmesg file here: http://userweb.kernel.org/~deller/usbdisk.c3k/dmesg.c3k

On your system PCI bus handling seems strange, e.g. those kernel messages:
a) PCI: Unable to handle 64-bit address space for bridge 0000:01:04.0
b) [17179607.932000] ohci_hcd 0000:02:08.0: controller already in use

So, although your ohci_hcd driver was loaded, it was not activated. That's why you can't access your USB disks.

As I'm no PCI bus expert, maybe the other collegues on the parisc mailing list could comment?

The messages of a 64bit kernel would be interesting as well...

Helge

Jean-Pierre HOFER wrote:
>>> I am unable to find any USB device files on my system (HP C360, debian testing
>>> 2.6.26-1) and to plug any USB device.
>>>
>>> lspri -v | grep HCI
>>> 02.08.0 USB Controller: NEC Corporation USB (rev 41) (prog-if 10 [OHCI])
>>> 02:08.1 USB Controller: NEC Corporation USB (rev 41) (prog-if 10 [OHCI])
>>> 02:08.2 USB Controller: NEC Corporation USB 2.0 (rev 02) (prog-if 20 [EHCI])
>>>
>>> It seems that the USB controller was detected at boot time since the drivers
>>> are loaded :
>>> lsmod
>>> [...]
>>> ohci_hcd             38568  0
>>> ehci_hcd             53328  0
>>> [...]
>>>
>>> This problem did not occur under Debian/etch.
>>>
>>> Now, how to mount USB storages ?
>>> Is there a workaround ?
>>
>> What exactly are you missing? The /dev/XXX files?
>> Which ones where there in etch which are not there yet?
> 
> Unfortunately, I don't have an etch system running any more.
> I don't recall this exactly, it was probably /dev/usb[0-4].
> 
> Here is the dmesg file :
> 
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 2.6.26-1-parisc (Debian 2.6.26-13) (waldi@debian.org) (gcc version 4.1.3 20080704 (prerelease) (Debian 4.1.2-24)) #1 Sat Jan 10 17:34:01 UTC 2009
> [    0.000000] FP[0] enabled: Rev 1 Model 16
> [    0.000000] The 32-bit Kernel has started...
> [    0.000000] console [ttyB0] enabled
> [    0.000000] Initialized PDC Console for debugging.
> [    0.000000] Determining PDC firmware type: System Map.
> [    0.000000] model 00005c60 00000481 00000000 00000002 778fcc50 100000f0 00000008 000000b2 000000b2
> [    0.000000] vers  00000100
> [    0.000000] CPUID vers 14 rev 0 (0x000001c0)
> [    0.000000] capabilities 0x2
> [    0.000000] model 9000/785/C360
> [    0.000000] Total Memory: 2304 MB
> [    0.000000] initrd: 4f917000-4ffee6f9
> [    0.000000] initrd: reserving 3f917000-3ffee6f9 (mem_max 90000000)
> [    0.000000] On node 0 totalpages: 589824
> [    0.000000]   Normal zone: 4608 pages used for memmap
> [    0.000000]   Normal zone: 0 pages reserved
> [    0.000000]   Normal zone: 585216 pages, LIFO batch:31
> [    0.000000]   Movable zone: 0 pages used for memmap
> [    0.000000] LED display at f0190001 registered
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 585216
> [    0.000000] Kernel command line: root=/dev/sda8 HOME=/ console=tty0 sti=8/0/1/0 sti_font=VGA8x16 TERM=linux palo_kernel=2/vmlinux
> [    0.000000] PID hash table entries: 4096 (order: 12, 16384 bytes)
> [17179569.184000] Console: colour dummy device 160x64
> [17179569.236000] console handover: boot [ttyB0] -> real [tty0]
> [17179569.304000] Dentry cache hash table entries: 524288 (order: 9, 2097152 bytes)
> [17179569.340000] Inode-cache hash table entries: 262144 (order: 8, 1048576 bytes)
> [17179569.776000] Memory: 2322432k/2359296k available (1961k kernel code, 36624k reserved, 882k data, 224k init)
> [17179569.776000] virtual kernel memory layout:
> [17179569.776000]     vmalloc : 0x00008000 - 0x0f000000   ( 239 MB)
> [17179569.776000]     memory  : 0x10000000 - 0xa0000000   (2304 MB)
> [17179569.776000]       .init : 0x10410000 - 0x10448000   ( 224 kB)
> [17179569.776000]       .data : 0x102ea6c4 - 0x103c7000   ( 882 kB)
> [17179569.776000]       .text : 0x10100000 - 0x102ea6c4   (1961 kB)
> [17179569.780000] Calibrating delay loop... 731.13 BogoMIPS (lpj=1462272)
> [17179569.872000] Security Framework initialized
> [17179569.872000] SELinux:  Disabled at boot.
> [17179569.872000] Capability LSM initialized
> [17179569.872000] Mount-cache hash table entries: 512
> [17179569.872000] Initializing cgroup subsys ns
> [17179569.872000] Initializing cgroup subsys cpuacct
> [17179569.872000] Initializing cgroup subsys devices
> [17179569.872000] net_namespace: 648 bytes
> [17179569.876000] NET: Registered protocol family 16
> [17179569.876000] EISA bus registered
> [17179569.876000] Searching for devices...
> [17179590.676000] Found devices:
> [17179590.676000] 1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 0x0000b }
> [17179590.676000] 2. Dino PCI Bridge at 0xf2000000 [8/0] { 13, 0x3, 0x680, 0x0000a }, additional addresses: 0xf2800000 0xf6000000 
> [17179590.676000] 3. Raven U/L2 Dino RS-232 at 0xf2003000 [8/0/63] { 10, 0x0, 0x006, 0x0008c }
> [17179590.676000] 4. Raven+ w SE FWSCSI Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x056, 0x00081 }, additional addresses: 0xffd0c000 0xffc00000 
> [17179590.676000] 5. Raven+ w SE FWSCSI Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x056, 0x0008c }
> [17179590.676000] 6. Raven+ w SE FWSCSI Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x056, 0x00082 }
> [17179590.676000] 7. Raven+ w SE FWSCSI Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x056, 0x00074 }, additional addresses: 0xffd01000 0xffd03000 
> [17179590.676000] 8. Raven+ w SE FWSCSI Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x056, 0x0007b }
> [17179590.676000] 9. Raven+ w SE FWSCSI Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x056, 0x00084 }
> [17179590.676000] 10. Raven+ w SE FWSCSI Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x056, 0x00084 }
> [17179590.676000] 11. U2-IOA BC GSC+ Port at 0xf203f000 [8/63] { 7, 0x1, 0x501, 0x0000c }
> [17179590.676000] 12. Raven U/L2 Dino PS/2 Port at 0xf2001000 [8/1] { 10, 0x0, 0x006, 0x00096 }
> [17179590.676000] 13. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0xf, 0x580, 0x0000b }
> [17179590.676000] 14. U2-IOA BC GSC+ Port at 0xf103f000 [10/63] { 7, 0x1, 0x501, 0x0000c }
> [17179590.676000] 15. Cujo PCI Bridge at 0xf1000000 [10/0] { 13, 0x1, 0x682, 0x0000a }, additional addresses: 0xf1800000 
> [17179590.676000] 16. Dino RS-232 at 0xf1003000 [10/3] { 10, 0x0, 0x007, 0x0008c }
> [17179590.676000] 17. Raven W 360 (9000/780) at 0xfffa0000 [32] { 0, 0x0, 0x5c6, 0x00004 }
> [17179590.676000] 18. Memory at 0xfffb1000 [49] { 1, 0x0, 0x097, 0x00009 }
> [17179590.676000] Enabling regular chassis codes support v0.05
> [17179591.312000] CPU(s): 1 x PA8500 (PCX-W) at 367.111100 MHz
> [17179591.316000] Whole cache flush 256059 cycles, flushing 3440640 bytes 1382342 cycles
> [17179591.316000] Setting cache flush threshold to 1a0 (1 CPUs online)
> [17179591.316000] Found U2 at 0xfff88000
> [17179591.340000] Found U2 at 0xfff8a000
> [17179591.364000] Lasi version 0 at 0xffd00000 found.
> [17179591.380000] Found GeckoBoa at 0xf203f000
> [17179591.380000] drivers/parisc/hppb.c: failed to claim HP-PB bus space (00000000, ffffffff)
> [17179591.380000] Found GeckoBoa at 0xf103f000
> [17179591.380000] drivers/parisc/hppb.c: failed to claim HP-PB bus space (00000000, ffffffff)
> [17179591.380000] Dino version 3.1 found at 0xf2000000
> [17179591.384000] Cujo version 2.0 found at 0xf1000000
> [17179591.384000] Enabling Cujo 2.0 bug workaround
> [17179591.388000] PCI: Unable to handle 64-bit address space for bridge 0000:01:04.0
> [17179591.388000] PCI: Cannot allocate resource (bogus alignment) 8 [100000:1fffff] (flags 200) of 0000:01:04.0
> [17179591.392000] PCI: bogus alignment of resource 8 [100000:1fffff] (flags 200) of 0000:01:04.0

^^ What's that?

> [17179591.392000] PCI: Bridge: 0000:01:04.0
> [17179591.392000]   IO window: disabled.
> [17179591.392000]   MEM window: 0x00100000-0x001fffff
> [17179591.392000]   PREFETCH window: disabled.
> [17179591.392000] powersw: Soft power switch at 0xf0140000 enabled.
> [17179591.408000] NET: Registered protocol family 2
> [17179591.444000] IP route cache hash table entries: 131072 (order: 7, 524288 bytes)
> [17179591.448000] TCP established hash table entries: 524288 (order: 10, 4194304 bytes)
> [17179591.492000] TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
> [17179591.496000] TCP: Hash tables configured (established 524288 bind 65536)
> [17179591.496000] TCP reno registered
> [17179591.508000] NET: Registered protocol family 1
> [17179591.508000] checking if image is initramfs... it is
> [17179596.108000] Freeing initrd memory: 7005k freed
> [17179596.112000] Enabling PDC chassis warnings support v0.05
> [17179596.112000] unwind_init: start = 0x1035de10, end = 0x103850f0, entries = 10030
> [17179596.116000] audit: initializing netlink socket (disabled)
> [17179596.116000] type=2000 audit(1234628527.932:1): initialized
> [17179596.120000] VFS: Disk quotas dquot_6.5.1
> [17179596.120000] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
> [17179596.120000] msgmni has been set to 4550
> [17179596.124000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
> [17179596.124000] io scheduler noop registered
> [17179596.124000] io scheduler anticipatory registered
> [17179596.124000] io scheduler deadline registered
> [17179596.124000] io scheduler cfq registered (default)
> [17179596.128000] PDC Stable Storage facility v0.30
> [17179597.600000] STI GSC/PCI core graphics driver Version 0.9a
> [17179597.600000] sti 0000:00:01.0: enabling SERR and PARITY (0002 -> 0142)
> [17179597.600000] STI PCI graphic ROM found at f2f80000 (64 kB), fb at f6000000 (32 MB)
> [17179597.688000]     id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
> [17179597.688000]     graphics card name: PCI_GRAFFITIX1280
> [17179597.688000] sticon: Initializing STI text console.
> [17179597.692000] Console: switching to colour STI console 160x64
> [17179598.540000] Console: switching to colour frame buffer device 160x64
> [17179598.656000] fb0: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIX1280, id: 2d08c0a7, mmio: 0xf6100000
> [17179598.692000] Generic RTC Driver v1.07
> [17179598.712000] Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
> [17179598.736000] 8:16:4: ttyS0 at MMIO 0xffd05800 (irq = 16) is a 16550A
> [17179598.760000] 8:0:63: ttyS1 at MMIO 0xf2003800 (irq = 21) is a 16550A
> [17179598.788000] brd: module loaded
> [17179598.808000] serio: GSC PS/2 keyboard port at 0x00020000 irq 20 @ 8:16:7
> [17179598.832000] serio: GSC PS/2 mouse port at 0x00022100 irq 20 @ 8:16:8
> [17179598.848000] mice: PS/2 mouse device common for all mice
> [17179598.876000] TCP cubic registered
> [17179598.892000] NET: Registered protocol family 17
> [17179598.952000] input: AT Raw Set 2 keyboard as /class/input/input0
> [17179598.968000] registered taskstats version 1
> [17179598.988000] Freeing unused kernel memory: 224k freed
> [17179600.620000] SCSI subsystem initialized
> [17179600.700000] 53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
> [17179600.720000] scsi0: 53c710 rev 2 
> [17179601.736000] scsi0 : LASI SCSI 53c700
> [17179602.400000] scsi 0:0:2:0: CD-ROM            TOSHIBA  CD-ROM XM-5401TA 1036 PQ: 0 ANSI: 2
> [17179602.424000]  target0:0:2: Beginning Domain Validation
> [17179602.444000]  target0:0:2: asynchronous
> [17179602.488000]  target0:0:2: FAST-5 SCSI 4.2 MB/s ST (236 ns, offset 8)
> [17179602.524000]  target0:0:2: Domain Validation skipping write tests
> [17179602.544000]  target0:0:2: Ending Domain Validation
> [17179606.428000] Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
> [17179606.456000] tulip0: no phy info, aborting mtable build
> [17179606.476000] tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
> [17179606.504000] eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xf2801000, 00:10:83:05:83:a5, IRQ 24.
> [17179606.584000] sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 23
> [17179606.984000] sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
> [17179607.004000] sym0: SCSI BUS has been reset.
> [17179607.032000] scsi1 : sym-2.2.3
> [17179607.292000] usbcore: registered new interface driver usbfs
> [17179607.312000] usbcore: registered new interface driver hub
> [17179607.488000] Driver 'sr' needs updating - please use bus_type methods
> [17179607.688000] sr0: scsi-1 drive
> [17179607.708000] Uniform CD-ROM driver Revision: 3.20
> [17179607.728000] sr 0:0:2:0: Attached scsi CD-ROM sr0
> [17179607.756000] usbcore: registered new device driver usb

from here ->
> [17179607.788000] ohci1394 0000:02:0b.0: enabling device (0150 -> 0152)
> [17179607.812000] ohci1394: MMIO resource (0x106000 - 0x106800) unavailable
> [17179607.828000] ohci1394: probe of 0000:02:0b.0 failed with error -12
> [17179607.912000] ohci_hcd: 2006 August 04 USB 1.1 'Open' Host Controller (OHCI) Driver
> [17179607.912000] ohci_hcd: block sizes: ed 64 td 64
> [17179607.912000] ohci_hcd 0000:02:08.0: enabling device (0150 -> 0152)
> [17179607.932000] ohci_hcd 0000:02:08.0: controller already in use
> [17179607.932000] ohci_hcd 0000:02:08.0: init 0000:02:08.0 fail, -16
> [17179607.952000] ohci_hcd: probe of 0000:02:08.0 failed with error -16
> [17179607.972000] ohci_hcd 0000:02:08.1: enabling device (0150 -> 0152)
> [17179607.992000] ohci_hcd 0000:02:08.1: controller already in use
> [17179607.992000] ohci_hcd 0000:02:08.1: init 0000:02:08.1 fail, -16
> [17179608.012000] ohci_hcd: probe of 0000:02:08.1 failed with error -16
> [17179608.056000] ehci_hcd: block sizes: qh 128 qtd 96 itd 160 sitd 96
> [17179608.056000] ehci_hcd 0000:02:08.2: enabling device (0150 -> 0152)
> [17179608.076000] ehci_hcd 0000:02:08.2: controller already in use
> [17179608.076000] ehci_hcd 0000:02:08.2: init 0000:02:08.2 fail, -16
> [17179608.096000] ehci_hcd: probe of 0000:02:08.2 failed with error -16
to here: This looks strange.

> [17179608.620000] sr 0:0:2:0: Attached scsi generic sg0 type 5
> [17179610.020000] scsi 1:0:0:0: Direct-Access     FUJITSU  MAT3073NC        5207 PQ: 0 ANSI: 3
> [17179610.040000]  target1:0:0: tagged command queuing enabled, command queue depth 16.
> [17179610.060000]  target1:0:0: Beginning Domain Validation
> [17179610.084000]  target1:0:0: asynchronous
> [17179610.116000]  target1:0:0: wide asynchronous
> [17179610.136000]  target1:0:0: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 16)
> [17179610.160000]  target1:0:0: Domain Validation skipping write tests
> [17179610.180000]  target1:0:0: Ending Domain Validation
> [17179610.200000] scsi 1:0:1:0: Direct-Access     FUJITSU  MAP3735NC        5207 PQ: 0 ANSI: 3
> [17179610.220000]  target1:0:1: tagged command queuing enabled, command queue depth 16.
> [17179610.240000]  target1:0:1: Beginning Domain Validation
> [17179610.264000]  target1:0:1: asynchronous
> [17179610.296000]  target1:0:1: wide asynchronous
> [17179610.316000]  target1:0:1: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 16)
> [17179610.336000]  target1:0:1: Domain Validation skipping write tests
> [17179610.356000]  target1:0:1: Ending Domain Validation
> [17179614.200000] scsi 1:0:0:0: Attached scsi generic sg1 type 0
> [17179614.220000] scsi 1:0:1:0: Attached scsi generic sg2 type 0
> [17179614.660000] Driver 'sd' needs updating - please use bus_type methods
> [17179614.736000] sd 1:0:0:0: [sda] 143374744 512-byte hardware sectors (73408 MB)
> [17179614.760000] sd 1:0:0:0: [sda] Write Protect is off
> [17179614.776000] sd 1:0:0:0: [sda] Mode Sense: d1 00 00 08
> [17179614.780000] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [17179614.800000] sd 1:0:0:0: [sda] 143374744 512-byte hardware sectors (73408 MB)
> [17179614.832000] sd 1:0:0:0: [sda] Write Protect is off
> [17179614.852000] sd 1:0:0:0: [sda] Mode Sense: d1 00 00 08
> [17179614.852000] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [17179614.872000]  sda: sda1 sda2 sda3 < sda5 sda6 sda7 sda8 >
> [17179614.920000] sd 1:0:0:0: [sda] Attached SCSI disk
> [17179614.988000] sd 1:0:1:0: [sdb] 143571316 512-byte hardware sectors (73509 MB)
> [17179615.008000] sd 1:0:1:0: [sdb] Write Protect is off
> [17179615.028000] sd 1:0:1:0: [sdb] Mode Sense: b9 00 00 08
> [17179615.032000] sd 1:0:1:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [17179615.052000] sd 1:0:1:0: [sdb] 143571316 512-byte hardware sectors (73509 MB)
> [17179615.080000] sd 1:0:1:0: [sdb] Write Protect is off
> [17179615.100000] sd 1:0:1:0: [sdb] Mode Sense: b9 00 00 08
> [17179615.100000] sd 1:0:1:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [17179615.120000]  sdb: sdb1 < sdb5 >
> [17179615.148000] sd 1:0:1:0: [sdb] Attached SCSI disk
> [17179616.948000] kjournald starting.  Commit interval 5 seconds
> [17179616.964000] EXT3-fs: mounted filesystem with ordered data mode.
> [17179623.812000] udevd version 125 started
> [17179640.672000] input: PS/2 Logitech Mouse as /class/input/input1
> [17179644.828000] Adding 2931820k swap on /dev/sda7.  Priority:-1 extents:1 across:2931820k
> [17179645.684000] EXT3 FS on sda8, internal journal
> [17179648.400000] LASI 82596 driver - Revision: 1.30
> [17179648.580000] loop: module loaded
> [17179652.020000] kjournald starting.  Commit interval 5 seconds
> [17179652.052000] EXT3 FS on sda6, internal journal
> [17179652.072000] EXT3-fs: mounted filesystem with ordered data mode.
> [17179652.116000] kjournald starting.  Commit interval 5 seconds
> [17179652.152000] EXT3 FS on sdb5, internal journal
> [17179652.172000] EXT3-fs: mounted filesystem with ordered data mode.
> [17179652.212000] kjournald starting.  Commit interval 5 seconds
> [17179652.236000] EXT3 FS on sda5, internal journal
> [17179652.260000] EXT3-fs: mounted filesystem with ordered data mode.
> [17179659.496000] NET: Registered protocol family 10
> [17179659.520000] lo: Disabled Privacy Extensions
> [17179659.568000] 0000:00:14.0: tulip_stop_rxtx() failed (CSR5 0xf0660000 CSR6 0xb24e2002)
> [17179659.568000] eth0: Setting half-duplex based on MII#1 link partner capability of 0021.
> [17179670.044000] eth0: no IPv6 routers present
> [17179671.764000] lp: driver loaded but no devices found
> [17179671.764000] RPC: Registered udp transport module.
> [17179671.768000] RPC: Registered tcp transport module.
> 
