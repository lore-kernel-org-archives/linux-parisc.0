Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26CAD482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 03:05:24 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A0FA5B007; Tue,  3 Apr 2001 10:05:02 +0100 (BST)
Date: Tue, 3 Apr 2001 10:05:02 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] request_region()
Message-ID: <20010403100502.K9198@linuxcare.com>
References: <20010403001114.F9198@linuxcare.com> <200104030306.VAA10572@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200104030306.VAA10572@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Mon, Apr 02, 2001 at 09:06:10PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 02, 2001 at 09:06:10PM -0600, Grant Grundler wrote:
> The plan was EISA devices under ASP should use request_region()
> and inb/outb. I have no clue how EISA "bus walk" works or how EISA
> drivers will find/claim their devices.
> 
> The EISA HBA needs to register it's "pci_ops".
> See arch/parisc/kernel/pci.c:PCI_PORT_OUT macro.

Yep, that make sense.  Does mean sim700.c will have to make runtime
decisions whether to use raw_read (for the on-board 53c700) or inb
(for one on an EISA card), on my 715, but that is no big deal.
EISA allocates 0x1000 bytes per slot, with a four (?) byte signature
at offset 0xc80 (IIRC) to identify the cards.  At least, that is
how my old Compaq works, with first slot at 0x1000.  Seems to tie
up address-wise, at least:

10. Scorpio Sr. EISA BA (11) at 0xfc000000, versions 0x19, 0x0, 0x76, 0x0, 0x0
11. Unknown device (10) at 0xfc001000, versions 0x0, 0x0, 0xfff, 0x0, 0x0

Again, IIRC, last time I played with the EISA slot on my 715 I
found the EISA 53c700 couldn't access main memory, and EISA interrupts
were not routed to the CPU.  The driver could access the chip registers
though.  But that was all a long time ago, so things may be different
now.

Richard
