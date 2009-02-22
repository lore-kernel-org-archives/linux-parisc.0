From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Re : lenny / testing : missing USB device files
Date: Sat, 21 Feb 2009 18:23:33 -0700
Message-ID: <20090222012333.GA2567@colo.lackof.org>
References: <200902150055.n1F0ta8X007465@stephenson.dhis.org> <4997F482.6050405@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Jean-Pierre HOFER <jph@stephenson.dhis.org>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4997F482.6050405@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Feb 15, 2009 at 11:54:58AM +0100, Helge Deller wrote:
> Hi Jean-Pierre,
> (added linux-parisc mailing list)
> 
> I just tested the debian kernel on my c3k.

c3k is a totally different chipset and MMIO mapping than
the C360 (original problem report).

> For me a small external USB disk (250GB disk) attached to the USB bus worked fine.
> Just for reference, I've uploaded my dmesg file here: http://userweb.kernel.org/~deller/usbdisk.c3k/dmesg.c3k
> 
> On your system PCI bus handling seems strange, e.g. those kernel messages:
> a) PCI: Unable to handle 64-bit address space for bridge 0000:01:04.0

We make no attempt to handle 64-bit ranges when running 32-bit kernel.
This is completely unrelated to the USB controller in (b).
This is probably the "PREFETCH Memory Range" of this Bridge not
getting allocated. Usually not a problem.


> b) [17179607.932000] ohci_hcd 0000:02:08.0: controller already in use

The ohci drive is really trying to say it could not allocate an MMIO region.
I'll submit a patch to linux-usb to make this clearer and see if they
shove it back at me impaled on a flaming spear. :)  At least 7 different
USB drivers use this same (wrong IMHO) text.

> So, although your ohci_hcd driver was loaded, it was not activated.
> That's why you can't access your USB disks.

ohci_hcd was attempting to load but failed and exited.
Note the reference count is 0 of both ohci and ehci USB drivers.
The driver load should have failed and should have unloaded.
But unloading manually might still work.

...
> > [17179591.388000] PCI: Cannot allocate resource (bogus alignment) 8 [100000:1fffff] (flags 200) of 0000:01:04.0

This looks like a bug in the generic PCI code.

This message is from drivers/pci/setup-res.c:pci_assign_resource():
...
        min = (res->flags & IORESOURCE_IO) ? PCIBIOS_MIN_IO : PCIBIOS_MIN_MEM;

        align = resource_alignment(res);
        if (!align) {
                dev_info(&dev->dev, "BAR %d: can't allocate resource (bogus "
                        "alignment) %pR flags %#lx\n",
                        resno, res, res->flags);
                return -EINVAL;
        }
...

kernel/resource.c:resource_alignment() returns 0 if neither
IORESOURCE_SIZEALIGN nor IORESOURCE_STARTALIGN flags are set.
Given "resource 8" is Bridge range and not a standard BAR, we shouldn't
be using the normal PCI range checking. Bridge ranges do not have the
same constraints on MMIO range allocation as normal BARs do.

I'm sure the PDC is doing the right thing in how it's allocating ranges.
The PCI code needs to handle the "Bridge Ranges" special. Just need
a stack trace of where this is getting called from and figure out
what to do differently. It's possible drivers/parisc/dino.c code
needs to change instead of drivers/pci code.


> > [17179591.392000] PCI: bogus alignment of resource 8 [100000:1fffff] (flags 200) of 0000:01:04.0
> 
> ^^ What's that?

Is this answered above sufficiently?


> > [17179591.392000] PCI: Bridge: 0000:01:04.0
> > [17179591.392000]   IO window: disabled.
> > [17179591.392000]   MEM window: 0x00100000-0x001fffff
> > [17179591.392000]   PREFETCH window: disabled.
> > [17179591.392000] powersw: Soft power switch at 0xf0140000 enabled.
> > [17179591.408000] NET: Registered protocol family 2
> > [17179591.444000] IP route cache hash table entries: 131072 (order: 7, 524288 bytes)
> > [17179591.448000] TCP established hash table entries: 524288 (order: 10, 4194304 bytes)
> > [17179591.492000] TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
> > [17179591.496000] TCP: Hash tables configured (established 524288 bind 65536)
> > [17179591.496000] TCP reno registered
> > [17179591.508000] NET: Registered protocol family 1
> > [17179591.508000] checking if image is initramfs... it is
> > [17179596.108000] Freeing initrd memory: 7005k freed
> > [17179596.112000] Enabling PDC chassis warnings support v0.05
> > [17179596.112000] unwind_init: start = 0x1035de10, end = 0x103850f0, entries = 10030
> > [17179596.116000] audit: initializing netlink socket (disabled)
> > [17179596.116000] type=2000 audit(1234628527.932:1): initialized
> > [17179596.120000] VFS: Disk quotas dquot_6.5.1
> > [17179596.120000] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
> > [17179596.120000] msgmni has been set to 4550
> > [17179596.124000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
> > [17179596.124000] io scheduler noop registered
> > [17179596.124000] io scheduler anticipatory registered
> > [17179596.124000] io scheduler deadline registered
> > [17179596.124000] io scheduler cfq registered (default)
> > [17179596.128000] PDC Stable Storage facility v0.30
> > [17179597.600000] STI GSC/PCI core graphics driver Version 0.9a
> > [17179597.600000] sti 0000:00:01.0: enabling SERR and PARITY (0002 -> 0142)
> > [17179597.600000] STI PCI graphic ROM found at f2f80000 (64 kB), fb at f6000000 (32 MB)
> > [17179597.688000]     id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
> > [17179597.688000]     graphics card name: PCI_GRAFFITIX1280
> > [17179597.688000] sticon: Initializing STI text console.
> > [17179597.692000] Console: switching to colour STI console 160x64
> > [17179598.540000] Console: switching to colour frame buffer device 160x64
> > [17179598.656000] fb0: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIX1280, id: 2d08c0a7, mmio: 0xf6100000
> > [17179598.692000] Generic RTC Driver v1.07
> > [17179598.712000] Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
> > [17179598.736000] 8:16:4: ttyS0 at MMIO 0xffd05800 (irq = 16) is a 16550A
> > [17179598.760000] 8:0:63: ttyS1 at MMIO 0xf2003800 (irq = 21) is a 16550A
> > [17179598.788000] brd: module loaded
> > [17179598.808000] serio: GSC PS/2 keyboard port at 0x00020000 irq 20 @ 8:16:7
> > [17179598.832000] serio: GSC PS/2 mouse port at 0x00022100 irq 20 @ 8:16:8
> > [17179598.848000] mice: PS/2 mouse device common for all mice
> > [17179598.876000] TCP cubic registered
> > [17179598.892000] NET: Registered protocol family 17
> > [17179598.952000] input: AT Raw Set 2 keyboard as /class/input/input0
> > [17179598.968000] registered taskstats version 1
> > [17179598.988000] Freeing unused kernel memory: 224k freed
> > [17179600.620000] SCSI subsystem initialized
> > [17179600.700000] 53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
> > [17179600.720000] scsi0: 53c710 rev 2 
> > [17179601.736000] scsi0 : LASI SCSI 53c700
> > [17179602.400000] scsi 0:0:2:0: CD-ROM            TOSHIBA  CD-ROM XM-5401TA 1036 PQ: 0 ANSI: 2
> > [17179602.424000]  target0:0:2: Beginning Domain Validation
> > [17179602.444000]  target0:0:2: asynchronous
> > [17179602.488000]  target0:0:2: FAST-5 SCSI 4.2 MB/s ST (236 ns, offset 8)
> > [17179602.524000]  target0:0:2: Domain Validation skipping write tests
> > [17179602.544000]  target0:0:2: Ending Domain Validation
> > [17179606.428000] Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
> > [17179606.456000] tulip0: no phy info, aborting mtable build
> > [17179606.476000] tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
> > [17179606.504000] eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xf2801000, 00:10:83:05:83:a5, IRQ 24.
> > [17179606.584000] sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 23
> > [17179606.984000] sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
> > [17179607.004000] sym0: SCSI BUS has been reset.
> > [17179607.032000] scsi1 : sym-2.2.3
> > [17179607.292000] usbcore: registered new interface driver usbfs
> > [17179607.312000] usbcore: registered new interface driver hub
> > [17179607.488000] Driver 'sr' needs updating - please use bus_type methods
> > [17179607.688000] sr0: scsi-1 drive
> > [17179607.708000] Uniform CD-ROM driver Revision: 3.20
> > [17179607.728000] sr 0:0:2:0: Attached scsi CD-ROM sr0
> > [17179607.756000] usbcore: registered new device driver usb
> 
> from here ->
> > [17179607.788000] ohci1394 0000:02:0b.0: enabling device (0150 -> 0152)
> > [17179607.812000] ohci1394: MMIO resource (0x106000 - 0x106800) unavailable
> > [17179607.828000] ohci1394: probe of 0000:02:0b.0 failed with error -12
> > [17179607.912000] ohci_hcd: 2006 August 04 USB 1.1 'Open' Host Controller (OHCI) Driver
> > [17179607.912000] ohci_hcd: block sizes: ed 64 td 64
> > [17179607.912000] ohci_hcd 0000:02:08.0: enabling device (0150 -> 0152)
> > [17179607.932000] ohci_hcd 0000:02:08.0: controller already in use
> > [17179607.932000] ohci_hcd 0000:02:08.0: init 0000:02:08.0 fail, -16
> > [17179607.952000] ohci_hcd: probe of 0000:02:08.0 failed with error -16
> > [17179607.972000] ohci_hcd 0000:02:08.1: enabling device (0150 -> 0152)
> > [17179607.992000] ohci_hcd 0000:02:08.1: controller already in use
> > [17179607.992000] ohci_hcd 0000:02:08.1: init 0000:02:08.1 fail, -16
> > [17179608.012000] ohci_hcd: probe of 0000:02:08.1 failed with error -16
> > [17179608.056000] ehci_hcd: block sizes: qh 128 qtd 96 itd 160 sitd 96
> > [17179608.056000] ehci_hcd 0000:02:08.2: enabling device (0150 -> 0152)
> > [17179608.076000] ehci_hcd 0000:02:08.2: controller already in use
> > [17179608.076000] ehci_hcd 0000:02:08.2: init 0000:02:08.2 fail, -16
> > [17179608.096000] ehci_hcd: probe of 0000:02:08.2 failed with error -16
> to here: This looks strange.

-16 == -EBUSY

This could be caused by 01:04.0 bridge not getting resources allocated
and ranges enabled properly.

hth,
grant

> > [17179608.620000] sr 0:0:2:0: Attached scsi generic sg0 type 5
> > [17179610.020000] scsi 1:0:0:0: Direct-Access     FUJITSU  MAT3073NC        5207 PQ: 0 ANSI: 3
> > [17179610.040000]  target1:0:0: tagged command queuing enabled, command queue depth 16.
> > [17179610.060000]  target1:0:0: Beginning Domain Validation
> > [17179610.084000]  target1:0:0: asynchronous
> > [17179610.116000]  target1:0:0: wide asynchronous
> > [17179610.136000]  target1:0:0: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 16)
> > [17179610.160000]  target1:0:0: Domain Validation skipping write tests
> > [17179610.180000]  target1:0:0: Ending Domain Validation
> > [17179610.200000] scsi 1:0:1:0: Direct-Access     FUJITSU  MAP3735NC        5207 PQ: 0 ANSI: 3
> > [17179610.220000]  target1:0:1: tagged command queuing enabled, command queue depth 16.
> > [17179610.240000]  target1:0:1: Beginning Domain Validation
> > [17179610.264000]  target1:0:1: asynchronous
> > [17179610.296000]  target1:0:1: wide asynchronous
> > [17179610.316000]  target1:0:1: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 16)
> > [17179610.336000]  target1:0:1: Domain Validation skipping write tests
> > [17179610.356000]  target1:0:1: Ending Domain Validation
> > [17179614.200000] scsi 1:0:0:0: Attached scsi generic sg1 type 0
> > [17179614.220000] scsi 1:0:1:0: Attached scsi generic sg2 type 0
> > [17179614.660000] Driver 'sd' needs updating - please use bus_type methods
> > [17179614.736000] sd 1:0:0:0: [sda] 143374744 512-byte hardware sectors (73408 MB)
> > [17179614.760000] sd 1:0:0:0: [sda] Write Protect is off
> > [17179614.776000] sd 1:0:0:0: [sda] Mode Sense: d1 00 00 08
> > [17179614.780000] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> > [17179614.800000] sd 1:0:0:0: [sda] 143374744 512-byte hardware sectors (73408 MB)
> > [17179614.832000] sd 1:0:0:0: [sda] Write Protect is off
> > [17179614.852000] sd 1:0:0:0: [sda] Mode Sense: d1 00 00 08
> > [17179614.852000] sd 1:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> > [17179614.872000]  sda: sda1 sda2 sda3 < sda5 sda6 sda7 sda8 >
> > [17179614.920000] sd 1:0:0:0: [sda] Attached SCSI disk
> > [17179614.988000] sd 1:0:1:0: [sdb] 143571316 512-byte hardware sectors (73509 MB)
> > [17179615.008000] sd 1:0:1:0: [sdb] Write Protect is off
> > [17179615.028000] sd 1:0:1:0: [sdb] Mode Sense: b9 00 00 08
> > [17179615.032000] sd 1:0:1:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> > [17179615.052000] sd 1:0:1:0: [sdb] 143571316 512-byte hardware sectors (73509 MB)
> > [17179615.080000] sd 1:0:1:0: [sdb] Write Protect is off
> > [17179615.100000] sd 1:0:1:0: [sdb] Mode Sense: b9 00 00 08
> > [17179615.100000] sd 1:0:1:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> > [17179615.120000]  sdb: sdb1 < sdb5 >
> > [17179615.148000] sd 1:0:1:0: [sdb] Attached SCSI disk
> > [17179616.948000] kjournald starting.  Commit interval 5 seconds
> > [17179616.964000] EXT3-fs: mounted filesystem with ordered data mode.
> > [17179623.812000] udevd version 125 started
> > [17179640.672000] input: PS/2 Logitech Mouse as /class/input/input1
> > [17179644.828000] Adding 2931820k swap on /dev/sda7.  Priority:-1 extents:1 across:2931820k
> > [17179645.684000] EXT3 FS on sda8, internal journal
> > [17179648.400000] LASI 82596 driver - Revision: 1.30
> > [17179648.580000] loop: module loaded
> > [17179652.020000] kjournald starting.  Commit interval 5 seconds
> > [17179652.052000] EXT3 FS on sda6, internal journal
> > [17179652.072000] EXT3-fs: mounted filesystem with ordered data mode.
> > [17179652.116000] kjournald starting.  Commit interval 5 seconds
> > [17179652.152000] EXT3 FS on sdb5, internal journal
> > [17179652.172000] EXT3-fs: mounted filesystem with ordered data mode.
> > [17179652.212000] kjournald starting.  Commit interval 5 seconds
> > [17179652.236000] EXT3 FS on sda5, internal journal
> > [17179652.260000] EXT3-fs: mounted filesystem with ordered data mode.
> > [17179659.496000] NET: Registered protocol family 10
> > [17179659.520000] lo: Disabled Privacy Extensions
> > [17179659.568000] 0000:00:14.0: tulip_stop_rxtx() failed (CSR5 0xf0660000 CSR6 0xb24e2002)
> > [17179659.568000] eth0: Setting half-duplex based on MII#1 link partner capability of 0021.
> > [17179670.044000] eth0: no IPv6 routers present
> > [17179671.764000] lp: driver loaded but no devices found
> > [17179671.764000] RPC: Registered udp transport module.
> > [17179671.768000] RPC: Registered tcp transport module.
> > 
> 
> 
> -- 
> To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
