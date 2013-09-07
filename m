From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Sat, 7 Sep 2013 17:08:38 -0400
Message-ID: <BLU0-SMTP524BC4BA31EE9E1B30875F973D0@phx.gbl>
References: <108451378018002@web28j.yandex.ru> <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl> <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk> <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl> <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk> <52278FBD.2010304@bell.net> <BLU0-SMTP36B9C5CB7AF69063DE0EBD97320@phx.gbl> <5228F071.4040000@gmx.de> <20130906085203.GA15333@alpha.franken.de> <1378479057.2063.6.camel@dabdike.int.hansenpartnership.com> <20130906161158.GA19991@alpha.franken.de> <1378487651.2063.20.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>, Alex Ivanov <gnidorah@p0n4ik.tk>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1378487651.2063.20.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

With the new modules, I sometimes encounter the following warning at  
boot on rp3440:

[drm] radeon: 8M of VRAM memory ready
[drm] radeon: 512M of GTT memory ready.
[drm] GART: num cpu pages 131072, num gpu pages 131072
[drm] PCI GART of 512M enabled (table at 0x0000000042540000).
radeon 0000:e0:02.0: WB disabled
radeon 0000:e0:02.0: fence driver on ring 0 use gpu addr  
0xffffffffd0000000 and cpu addr 0x000000007c716000
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] Driver supports precise vblank timestamp query.
------------[ cut here ]------------
WARNING: at kernel/workqueue.c:1378
Modules linked in: radeon(+) cfbfillrect cfbimgblt cfbcopyarea  
i2c_algo_bit drm_kms_helper ttm drm i2c_core backlight ohci_pci  
ohci_hcd xfs exportfs btrfs xor lzo_compress zlib_deflate raid6_pq  
crc32c libcrc32c dm_mod zalon7xx lasi700 53c700 hilkbd sd_mod  
crc_t10dif usb_storage sg sr_mod cdrom ehci_pci tg3 ehci_hcd  
pata_cmd64x ptp sym53c8xx libata pps_core scsi_transport_spi usbcore  
scsi_mod usb_common
CPU: 0 PID: 1220 Comm: modprobe Not tainted 3.11.0+ #1
task: 000000007f054808 ti: 000000007f0c8000 task.ti: 000000007f0c8000

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000000000001110 Not tainted
r00-03  000000000804000e 000000007f0c92b0 000000004015edb8  
000000007f0c92b0
r04-07  0000000040768900 0000000042536d00 000000007c809f20  
000000007c809f28
r08-11  000000007f0c9350 000000007fc40600 0000000000000020  
0000000000000020
r12-15  0000000000000000 0000000000000001 000000004078c100  
000000007f0c8288
r16-19  0000000000000050 0000000000000000 000000007f0c8410  
0000000000000000
r20-23  000000000800000e 000000007c808006 0000000000000000  
000000001e071628
r24-27  000000007c809f20 0000000000000000 0000000042533600  
0000000040768900
r28-31  0000000000000001 000000007f0c9350 000000007f0c9380  
0000000000000000
sr00-03  0000000000162800 0000000000000000 0000000000000000  
0000000000113000
sr04-07  0000000000000000 0000000000000000 0000000000000000  
0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004015ee5c  
000000004015ee60
  IIR: 03ffe01f    ISR: 0000000010240000  IOR: 000000094cd33600
  CPU:        0   CR30: 000000007f0c8000 CR31: a001019408140000
  ORIG_R28: 0000000000000001
  IAOQ[0]: __queue_work+0x2dc/0x360
  IAOQ[1]: __queue_work+0x2e0/0x360
  RP(r2): __queue_work+0x238/0x360
Backtrace:
  [<000000004015ef64>] queue_work_on+0x84/0xa8
  [<000000001df55dfc>] r100_irq_process+0x2ec/0x5d8 [radeon]
  [<000000001df48cc4>] radeon_driver_irq_preinstall_kms+0x16c/0x1a0  
[radeon]
  [<000000001cdbd024>] drm_irq_install+0x11c/0x3c0 [drm]
  [<000000001df48f8c>] radeon_irq_kms_init+0x8c/0x168 [radeon]
  [<000000001df5aeac>] r100_startup+0x22c/0x3c8 [radeon]
  [<000000001df5b880>] r100_init+0x348/0x5c0 [radeon]
  [<000000001defbff4>] radeon_device_init+0x79c/0x9d0 [radeon]
  [<000000001deff588>] radeon_driver_load_kms+0xb8/0x1a8 [radeon]
  [<000000001cdc682c>] drm_get_pci_dev+0x28c/0x390 [drm]
  [<000000001def96e4>] radeon_pci_probe+0xcc/0x120 [radeon]
  [<000000004035fd74>] pci_device_probe+0xc4/0xf8
  [<00000000403d0fd8>] really_probe+0xd0/0x328
  [<00000000403d13e8>] __driver_attach+0x100/0x108
  [<00000000403ce290>] bus_for_each_dev+0xa0/0x100
  [<00000000403d08cc>] driver_attach+0x34/0x48

---[ end trace 9a90037d977025eb ]---
[drm] radeon: irq initialized.
[drm] Loading R100 Microcode

Dave
--
John David Anglin	dave.anglin@bell.net



