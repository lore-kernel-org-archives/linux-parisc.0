Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 17 Mar 2003 23:22:33 -0700
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030318062233.GA21487@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] FWD: PCI Patches update
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

I got email from Ivan Kokshaysky describing recent changes in 2.5 PCI
support and realized I should document one of the outstanding
"bugs" with PCI resource management under PARISC.

enjoy!
grant

---- Forwarded message from Grant Grundler <grundler@dsl2.external.hp.com> -----
On Mon, Mar 17, 2003 at 11:33:12PM +0300, Ivan Kokshaysky wrote:
> - windows overlapping with something else.

On parisc, this is one of the problems I've dodged.
I'm not looking for a solution right now - but if you know the
obvious answer, please tell me.  I just want to outline the problem.

The PCI controller (lba_pci.c) on newer PARISC machines can support
two MMIO ranges. The "Distributed" range is a "fixed" size and base
(1/8th of whatever the parent IO Controller (SBA) has).  The second
"Directed" Range can use any address otherwise not assigned to PCI
devices and directed to any PCI controller under the same SBA.

PARISC lba_pci.c currently only advertises Distributed ranges
and pretends Directed ranges don't exist. Things still work,
but the resource accounting in /proc/iomem is inaccurate.

Since Directed Ranges have precedence in the MMIO address routing, they
can overlap with Distributed ranges. Worse, The SBA can assign "duplicate"
MMIO address ranges by routing "unused" address space to a Directed range
under a different PCI controller.  I think both are very ugly scenarios
and will need alot of code to detect/handle properly.

Each Distributed Range is typically only 16MB in size.
Consumers of Directed Ranges are things like graphics cards or X.25
cards which want 16MB or greater in a single BAR.
Eg /proc/iomem on a C3000 running 2.4.20 says:
f0000000-f0ffffff : LBA PCI LMMIO
  f05d0000-f05d0000 : lcd_data
  f05d0008-f05d0008 : lcd_cmd
f1000000-f1ffffff : LBA PCI LMMIO
f4000000-f4ffffff : LBA PCI LMMIO
  f4007000-f4007fff : usb-ohci
  f4008000-f40083ff : tulip
  f4900000-f490007f : tulip
  f4901000-f490107f : tulip
  f4902000-f490207f : tulip
  f4903000-f490307f : tulip
f6000000-f6ffffff : LBA PCI LMMIO
  f6000000-f600ffff : tg3
fa100000-fa4fffff : stifb mmio
fb000000-fbffffff : stifb
...

In the same machine (C3000) as the above, lspci says:
...
01:04.0 PCI bridge: Digital Equipment Corporation DECchip 21152 (rev 03)
(prog-if 00 [Normal decode])
        Flags: bus master, medium devsel, latency 255
	Bus: primary=01, secondary=02, subordinate=02, sec-latency=255
	I/O behind bridge: 00003000-00003fff
	Memory behind bridge: f4900000-f49fffff
	Prefetchable memory behind bridge: 00000000f0100000-00000000f0100000
	Capabilities: <available only to root>
...
03:01.1 SCSI storage controller: LSI Logic / Symbios Logic 53c1010 66MHz Ultra3 SCSI Adapter (rev 01)
	Subsystem: Hewlett-Packard Company: Unknown device 1340
	Flags: bus master, 66Mhz, medium devsel, latency 255, IRQ 163
	I/O ports at 28000 [size=256]
	Memory at f6014000 (64-bit, non-prefetchable) [size=1K]
	Memory at f6010000 (64-bit, non-prefetchable) [size=8K]
	Expansion ROM at f6020000 [disabled] [size=128K]
	Capabilities: <available only to root>

03:03.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5703 Gigabit Ethernet (rev 02)
        Subsystem: Broadcom Corporation NetXtreme BCM5703 1000Base-T
	Flags: bus master, 66Mhz, medium devsel, latency 248, IRQ 160
	Memory at f6000000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <available only to root>

04:02.0 Display controller: Hewlett-Packard Company A4977A Visualize EG
(rev 03)
        Flags: 66Mhz, medium devsel
	Memory at fa000000 (32-bit, non-prefetchable) [size=32M]
	Expansion ROM at f7000000 [disabled] [size=64K]

[ I now see one additional bugs *sigh*: PCI-PCI bridge resources are
not properly accounted (4-port Tulip) card. I'll have to fix that. ]

sym53c8xx_2 driver is using IO port space and thus won't get reported
in /proc/iomem.

The "stifb" driver claims the upper 16MB of the 32MB BAR and it's all
routed to PCI Controller for slot 2 (PCI Bus 4). Since no other devices
share that PCI controller, I'm pretty sure the same PCI Controller also
gets 0xf100000 range. Add a second gfx card and it's gets uglier.
I watched Thomas Boegendorf have fun at LinuxTag by putting 4
similar "Vis-EG" cards in one B2600 and run xinerama. I now
wish I had captured the /proc/iomem and lspci -v output for
that one!

Anyway, I hope that was an interesting diversion.

cheers,
grant

----- End forwarded message -----
