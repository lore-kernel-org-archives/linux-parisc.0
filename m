Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64D19486E
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 18 Jan 2004 22:59:57 -0700 (MST)
Date: Sun, 18 Jan 2004 22:59:55 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] 32bit parisc kernel 2.6.1 and pcmcia
Message-ID: <20040119055955.GF25295@colo.lackof.org>
References: <200401182059.34270.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200401182059.34270.deller@gmx.de>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Jan 18, 2004 at 08:59:34PM +0100, Helge Deller wrote:
> Dino fff80000: stuck interrupt 4

The message means the IRQ was asserted and whatever handlers
are registered for that IRQ did not clear the IRQ level.

> Any ideas why I get the above "Dino fff80000: stuck interrupt 4" message ?
> It seems further interrupts are not delivered to serial_cs....

When the PCI IRQ line is asserted, dino will only generate one
interrupt to the CPU. CPU needs to read DINO_ILR and verify the IRQ
has been de-asserted after the interrupt handler has been called.
If PCI IRQ line is still asserted, we first assume several devices
share the line and call the interrupt handlers again (goto ilr_again).
If the PCI IRQ line is still asserted after testing ILR several times,
(well, 100 times to be exact - see ilr_loop) , then we assume a HW defect.
We driver writers don't like to admit something didn't register for
the proper interrupt. But that is likely the case here and explains
the message and only one interrupt.

I'd be curious if both sockets report the same IRQ (4) when
inserting the PCMCIA card.

BTW, since PARISC doesn't tolerate accessing invalid MMIO addresses 
like x86 does, it wouldn't surprise me if you see HPMC's during
PCMCIA device removal/eject operations. I suspect (but don't know
for sure) that card eject on x86 only works becuase x86
returns garbage (-1 or 0 or something) for reads to non-responding
address spaces.

hth,
grant
