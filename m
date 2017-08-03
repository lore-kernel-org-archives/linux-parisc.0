From: John David Anglin <dave.anglin@bell.net>
Subject: Re: PCI resource problem on C360
Date: Thu, 3 Aug 2017 11:58:30 -0400
Message-ID: <89A4641B-DE37-41B1-9F9C-B6312F8F0C84@bell.net>
References: <20170803140717.GA7380@alpha.franken.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170803140717.GA7380@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-08-03, at 10:07 AM, Tom Bogendoerfer wrote:

> Is this a known problem ? Source tree is current parisc git.

I don't think so.  Doesn't happen on rp3440:

[    1.820224] LBA 0:0: PCI host bridge to bus 0000:00
[    1.820365] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    1.820528] pci_bus 0000:00: root bus resource [mem 0xffffffff80000000-0xffff
ffff8fffffff] (bus address [0x80000000-0x8fffffff])[    1.821090] pci_bus 0000:00: root bus resource [bus 00-07]
[    1.828085] pci 0000:00:01.0: [1033:0035] type 00 class 0x0c0310[    1.828130] pci 0000:00:01.0: reg 0x10: [mem 0xffffffff80002000-0xffffffff800
02fff]
[    1.828267] pci 0000:00:01.0: supports D1 D2
[    1.828273] pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
[    1.830081] pci 0000:00:01.1: [1033:0035] type 00 class 0x0c0310[    1.830120] pci 0000:00:01.1: reg 0x10: [mem 0xffffffff80001000-0xffffffff800
01fff][    1.830247] pci 0000:00:01.1: supports D1 D2
[    1.830253] pci 0000:00:01.1: PME# supported from D0 D1 D2 D3hot
[    1.830371] pci 0000:00:01.2: [1033:00e0] type 00 class 0x0c0320
[    1.830409] pci 0000:00:01.2: reg 0x10: [mem 0xffffffff80000000-0xffffffff800000ff]
[    1.830534] pci 0000:00:01.2: supports D1 D2
[    1.830540] pci 0000:00:01.2: PME# supported from D0 D1 D2 D3hot
[    1.830666] pci 0000:00:02.0: [1095:0649] type 00 class 0x01018f
[    1.830703] pci 0000:00:02.0: reg 0x10: [io  0x0d18-0x0d1f]
[    1.830723] pci 0000:00:02.0: reg 0x14: [io  0x0d24-0x0d27]
[    1.830743] pci 0000:00:02.0: reg 0x18: [io  0x0d10-0x0d17]
[    1.830762] pci 0000:00:02.0: reg 0x1c: [io  0x0d20-0x0d23]
[    1.830782] pci 0000:00:02.0: reg 0x20: [io  0x0d00-0x0d0f]
[    1.830855] pci 0000:00:02.0: supports D1 D2
[    1.850047] Mercury version TR3.2 (0x32) found at 0xfffffffffed22000
[    1.910206] LBA 0:1: PCI host bridge to bus 0000:20
[    1.910349] pci_bus 0000:20: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    1.910808] pci_bus 0000:20: root bus resource [mem 0xffffffff90000000-0xffffffff9fffffff] (bus address [0x90000000-0x9fffffff])
[    1.918145] pci_bus 0000:20: root bus resource [bus 20-27]
[    1.918320] pci 0000:20:01.0: [1000:0021] type 00 class 0x010000
[    1.918356] pci 0000:20:01.0: reg 0x10: [io  0x12100-0x121ff]
[    1.918378] pci 0000:20:01.0: reg 0x14: [mem 0xffffffff90015000-0xffffffff900153ff 64bit]
[    1.918400] pci 0000:20:01.0: reg 0x1c: [mem 0xffffffff90012000-0xffffffff90013fff 64bit]
[    1.918464] pci 0000:20:01.0: supports D1 D2
[    1.918595] pci 0000:20:01.1: [1000:0021] type 00 class 0x010000
[    1.918623] pci 0000:20:01.1: reg 0x10: [io  0x12000-0x120ff]
[    1.918645] pci 0000:20:01.1: reg 0x14: [mem 0xffffffff90014000-0xffffffff900143ff 64bit]
[    1.918667] pci 0000:20:01.1: reg 0x1c: [mem 0xffffffff90010000-0xffffffff90011fff 64bit]
[    1.918721] pci 0000:20:01.1: supports D1 D2
[    1.918839] pci 0000:20:02.0: [14e4:1645] type 00 class 0x020000
[    1.918876] pci 0000:20:02.0: reg 0x10: [mem 0xffffffff90000000-0xffffffff9000ffff 64bit]
[    1.918981] pci 0000:20:02.0: PME# supported from D3hot D3cold
[    1.940046] Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
[    1.998842] LBA 0:2: PCI host bridge to bus 0000:40
[    1.998985] pci_bus 0000:40: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0xffff])
[    1.999459] pci_bus 0000:40: root bus resource [mem 0xffffffffa0000000-0xffffffffafffffff] (bus address [0xa0000000-0xafffffff])
[    2.000039] pci_bus 0000:40: root bus resource [bus 40-47]
[    2.028845] Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
[    2.080237] LBA 0:3: PCI host bridge to bus 0000:60
[    2.080561] pci_bus 0000:60: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0xffff])
[    2.081116] pci_bus 0000:60: root bus resource [mem 0xffffffffb0000000-0xffffffffbfffffff] (bus address [0xb0000000-0xbfffffff])
[    2.090055] pci_bus 0000:60: root bus resource [bus 60-67]
[    2.116809] Mercury version TR3.2 (0x32) found at 0xfffffffffed28000
[    2.150026] LBA: lmmio_space [0xffffffffc0000000-0xffffffffdfffffff] - new
[    2.170228] LBA 0:4: PCI host bridge to bus 0000:80
[    2.170371] pci_bus 0000:80: root bus resource [io  0x40000-0x4ffff] (bus address [0x0000-0xffff])
[    2.170826] pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffdfffffff] (bus address [0xc0000000-0xdfffffff])
[    2.180021] pci_bus 0000:80: root bus resource [bus 80-87]
[    2.200044] Mercury version TR3.2 (0x32) found at 0xfffffffffed2c000
[    2.260215] LBA 0:6: PCI host bridge to bus 0000:c0
[    2.260357] pci_bus 0000:c0: root bus resource [io  0x50000-0x5ffff] (bus address [0x0000-0xffff])
[    2.260806] pci_bus 0000:c0: root bus resource [mem 0xffffffffe0000000-0xffffffffefffffff] (bus address [0xe0000000-0xefffffff])
[    2.270021] pci_bus 0000:c0: root bus resource [bus c0-c7]
[    2.290047] Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
[    2.320027] LBA: lmmio_space [0xfffffffff0000000-0xfffffffffe77ffff] - new
[    2.350182] LBA 0:7: PCI host bridge to bus 0000:e0
[    2.350325] pci_bus 0000:e0: root bus resource [io  0x60000-0x6ffff] (bus address [0x0000-0xffff])
[    2.350789] pci_bus 0000:e0: root bus resource [mem 0xfffffffff0000000-0xfffffffffe77ffff] (bus address [0xf0000000-0xfe77ffff])
[    2.358052] pci_bus 0000:e0: root bus resource [bus e0-e7]
[    2.358246] pci 0000:e0:01.0: [103c:1290] type 00 class 0x078000
[    2.358329] pci 0000:e0:01.0: reg 0x18: [mem 0xfffffffff4051000-0xfffffffff405100f]
[    2.358589] pci 0000:e0:01.1: [103c:1048] type 00 class 0x070002
[    2.358634] pci 0000:e0:01.1: reg 0x10: [mem 0xfffffffff4050000-0xfffffffff4050fff]
[    2.358674] pci 0000:e0:01.1: reg 0x18: [mem 0xfffffffff4020000-0xfffffffff403ffff pref]
[    2.358921] pci 0000:e0:02.0: [1002:5159] type 00 class 0x030000
[    2.358965] pci 0000:e0:02.0: reg 0x10: [mem 0xfffffffff0000000-0xfffffffff3ffffff pref]
[    2.358987] pci 0000:e0:02.0: reg 0x14: [io  0x6e000-0x6e0ff]
[    2.359010] pci 0000:e0:02.0: reg 0x18: [mem 0xfffffffff4040000-0xfffffffff404ffff]
[    2.359080] pci 0000:e0:02.0: reg 0x30: [mem 0xfffffffff4000000-0xfffffffff401ffff pref]
[    2.359134] pci 0000:e0:02.0: supports D1 D2
[    2.360013] powersw: Soft power switch support not available.
[    2.370516] WARNING: workqueue cpumask: online intersect > possible intersect
[    2.391187] pci 0000:e0:02.0: vgaarb: setting as boot VGA device
[    2.391359] pci 0000:e0:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    2.391805] pci 0000:e0:02.0: vgaarb: bridge control possible
[    2.391954] vgaarb: loaded

Dave
--
John David Anglin	dave.anglin@bell.net



