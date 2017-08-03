From: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Subject: PCI resource problem on C360
Date: Thu, 3 Aug 2017 16:07:17 +0200
Message-ID: <20170803140717.GA7380@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

while trying to make progress with supporting VGA cards, I stumbled
over following problem on a C360:

pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0xfffffffff2800000-0xfffffffff3ffffff]
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: scanning bus
pci 0000:00:03.0: [1002:5654] type 00 class 0x030000
pci 0000:00:03.0: reg 0x10: [mem 0xf3000000-0xf3ffffff]
pci 0000:00:03.0: reg 0x14: [io  0xfd00-0xfdff]
pci 0000:00:03.0: reg 0x30: [mem 0xf2f80000-0xf2f8ffff pref]
pci 0000:00:03.0: calling quirk_no_pm_reset+0x0/0x30
pci 0000:00:13.0: [1000:000f] type 00 class 0x010000
pci 0000:00:13.0: reg 0x10: [io  0xfe00-0xfeff]
pci 0000:00:13.0: reg 0x14: [mem 0xf2ffd000-0xf2ffd0ff]
pci 0000:00:13.0: reg 0x18: [mem 0xf2ffe000-0xf2ffefff]
pci 0000:00:14.0: [1011:0019] type 00 class 0x020000
pci 0000:00:14.0: reg 0x10: [io  0xff00-0xff7f]
pci 0000:00:14.0: reg 0x14: [mem 0xf2fff000-0xf2fff07f]
pci 0000:00:14.0: reg 0x30: [mem 0xf2f80000-0xf2fbffff pref]
pci_bus 0000:00: fixups for bus
pci_bus 0000:00: bus scan returning with max=00
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
pci 0000:00:03.0: BAR 0: no space for [mem size 0x01000000]
pci 0000:00:03.0: BAR 0: failed to assign [mem size 0x01000000]
pci 0000:00:13.0: BAR 2: no space for [mem size 0x00001000]
pci 0000:00:13.0: BAR 2: failed to assign [mem size 0x00001000]
pci 0000:00:03.0: BAR 1: assigned [io  0x0100-0x01ff]
pci 0000:00:13.0: BAR 0: assigned [io  0x0200-0x02ff]
pci 0000:00:13.0: BAR 1: no space for [mem size 0x00000100]
pci 0000:00:13.0: BAR 1: failed to assign [mem size 0x00000100]
pci 0000:00:14.0: BAR 0: assigned [io  0x0080-0x00ff]
pci 0000:00:14.0: BAR 1: no space for [mem size 0x00000080]
pci 0000:00:14.0: BAR 1: failed to assign [mem size 0x0000008

Is this a known problem ? Source tree is current parisc git.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
