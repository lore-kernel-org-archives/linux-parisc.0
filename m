Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from portablue.intern.mind.be (pD9E0CFC0.dip.t-dialin.net [217.224.207.192])
	by dsl2.external.hp.com (Postfix) with ESMTP id 607C1482B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Jan 2003 05:39:10 -0700 (MST)
Date: Thu, 2 Jan 2003 13:38:56 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030102123856.GD871@portablue.intern.mind.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
From: p2@mind.be (Peter 'p2' De Schrijver)
Subject: [parisc-linux] Matrox Millenium II in C240
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

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I installed a matrox millenium 2 in my C240 box and try to get the
framebuffer device for it to work under linux. Unfortunately I get a
kernel panic at the first access to mmio space of the card. The card
resides in a 32bit PCI slot (it's a 5V only card, so it has to). I get
the impression there is something wrong with the resource assignment of
the card. Unfortunately I'm stuck at this point, since I don't have a
clear view on how all the busses in this system are interconnected and
which bus address translations are happening. Is this somewhere
documented ? Has anyone before succeeded in accessing mmio space of PCI
card attached to the 32bit PCI bus of the C240 ?

Thanks,

Peter.

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=lspci-output

00:01.0 VGA compatible controller: Matrox Graphics, Inc. MGA 2164W [Millennium II] (prog-if 00 [VGA])
	Subsystem: Matrox Graphics, Inc.: Unknown device 2003
	Flags: medium devsel, IRQ 97
	Memory at f9000000 (32-bit, prefetchable) [size=16M]
	Memory at f3ffc000 (32-bit, non-prefetchable) [size=16K]
	Memory at f2800000 (32-bit, non-prefetchable) [size=8M]
	Expansion ROM at f3f80000 [disabled] [size=64K]

00:13.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly NCR) 53c875 (rev 04)
	Flags: bus master, medium devsel, latency 255, IRQ 99
	I/O ports at fe00 [size=256]
	Memory at f3ff9000 (32-bit, non-prefetchable) [size=256]
	Memory at f3ffa000 (32-bit, non-prefetchable) [size=4K]

00:14.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
	Subsystem: Hewlett-Packard Company: Unknown device 104f
	Flags: bus master, medium devsel, latency 255, IRQ 96
	I/O ports at ff00 [size=128]
	Memory at f3ffb000 (32-bit, non-prefetchable) [size=1K]
	Expansion ROM at f3f80000 [disabled] [size=256K]

01:02.0 Ethernet controller: Netgear GA620 (rev 01)
	Subsystem: Netgear: Unknown device 0001
	Flags: fast Back2Back, 66Mhz, medium devsel, IRQ 130
	Memory at f1ffc000 (32-bit, non-prefetchable) [disabled] [size=16K]

01:04.0 Display controller: Hewlett-Packard Company: Unknown device 1008 (rev 02)
	Flags: 66Mhz, medium devsel, IRQ 128
	Memory at f6000000 (64-bit, non-prefetchable) [size=32M]
	Expansion ROM at f1c00000 [disabled] [size=2M]


--fUYQa+Pmc3FrFX/N--
