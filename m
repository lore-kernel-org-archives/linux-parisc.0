Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 2 Jan 2003 22:17:15 -0700
To: Peter 'p2' De Schrijver <p2@mind.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Matrox Millenium II in C240
Message-ID: <20030103051715.GA14565@dsl2.external.hp.com>
References: <20030102123856.GD871@portablue.intern.mind.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030102123856.GD871@portablue.intern.mind.be>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Thu, Jan 02, 2003 at 01:38:56PM +0100, Peter 'p2' De Schrijver wrote:
> I installed a matrox millenium 2 in my C240 box and try to get the
> framebuffer device for it to work under linux. Unfortunately I get a
> kernel panic at the first access to mmio space of the card.

Sounds like a driver problem.

> The card resides in a 32bit PCI slot (it's a 5V only card, so it has to).

Does it? are the 64-bit slots 3.3v only?
I've never had to pay much attention for how the slots are keyed
since I mostly use "universal" PCI cards (both 3.3 and 5v tolerant).

> I get
> the impression there is something wrong with the resource assignment of
> the card.

Doesn't look like it to me based on lspci output.

> Is this somewhere documented ?

hmm...sort of in the ioscan output in the HW DB.
Or look at the hw paths printed at boot time.

> Has anyone before succeeded in accessing mmio space of PCI
> card attached to the 32bit PCI bus of the C240 ?

SCSI is accessed that way. tulip driver can be tweaked to use MMIO
if you don't have any 100BT GSC (card-mode Dino) cards.

> 00:01.0 VGA compatible controller: Matrox Graphics, Inc. MGA 2164W [Millennium II] (prog-if 00 [VGA])
> 	Subsystem: Matrox Graphics, Inc.: Unknown device 2003
> 	Flags: medium devsel, IRQ 97
> 	Memory at f9000000 (32-bit, prefetchable) [size=16M]
> 	Memory at f3ffc000 (32-bit, non-prefetchable) [size=16K]
> 	Memory at f2800000 (32-bit, non-prefetchable) [size=8M]
> 	Expansion ROM at f3f80000 [disabled] [size=64K]

Looks like PDC/IODC did it's thing.
Look at matrox drivers to make sure they are calling
"pci_device_enable()" and ioremap() before attempting to access
the device.

Check /proc/iomem to see which PCI bus controller
this is getting routed through and that the system
has correctly identified the MMIO resources.

It's interesting one device has MMIO at both 0xf2800000
and 0xf9000000 since it would imply one PCI controller is supposed
to forward the entire range of addresses. But Dino only forwards
(any number of) 8MB chunks between 0xf0800000 and 0xff800000 (except
the first and last 8MB chunks).

> 01:04.0 Display controller: Hewlett-Packard Company: Unknown device 1008 (rev 02)
> 	Flags: 66Mhz, medium devsel, IRQ 128
> 	Memory at f6000000 (64-bit, non-prefetchable) [size=32M]
> 	Expansion ROM at f1c00000 [disabled] [size=2M]

similar scenario but this device forces both PCI bus controllers
to "interleave" MMIO ranges they respond to. Looks ok though.

grant
