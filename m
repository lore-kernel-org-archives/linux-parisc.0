Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA12809
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Feb 2000 12:19:32 -0700
Date: Tue, 15 Feb 2000 19:18:58 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux syscall ABI
Message-ID: <20000215191858.P765@abacus.local>
References: <200002150536.WAA04580@udlkern.fc.hp.com> <200002151725.JAA05629@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002151725.JAA05629@milano.cup.hp.com>; from grundler@cup.hp.com on Tue, Feb 15, 2000 at 09:25:12AM -0800
List-ID: <linux-parisc.vger.kernel.org>

> Drivers don't map anything. The assumption for GSC/PCI drivers is the
> address given will work with readl/writel (or inb/outb) routines.

PCI drivers call ioremap(), which is free to do the mapping (but I don't
think it should, for PA-RISC).

> For GSC, the HPA is in the struct hp_device->hpa field and readl/writel
> are aliases for gsc_readl/gsc_writel.

which itself will be aliased to simple volatile accesses soon.

> gsc_readl/writel take a physical address as the address parameter.
> I would like to get away from gsc_read for one simple reason: HPMC.
> If a driver incorrectly accesses something which isn't supposed to
> we get either an HPMC or undefined behavior. Most likely the HPMC.
> If the read/write routines referenced a virtual address, we have
> much better chances of getting a data page fault and some decent
> debugging information to track down the problem.

HPMC is good debugging information - you've got PIM.  Of course, we want
an HPMC handler too, at some point.  The assembly part just tries to
find out if the machine is still usable, and resets it if it's not. 
If it is, we'd like it to be treated as normal interruption, and then
have a CPU-specific fault handler that reads the interesting registers
and prints a nice message.

	Philipp Rumpf
