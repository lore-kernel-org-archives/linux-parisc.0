From: Kyle McMartin <kyle@infradead.org>
Subject: Re: Hacking SuperDome
Date: Wed, 11 Feb 2009 19:36:28 -0500
Message-ID: <20090212003628.GA9042@bombadil.infradead.org>
References: <20090207142906.GA8553@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090207142906.GA8553@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> serial 0000:00:00.0: enabling device (0146 -> 0147)
> 0000:00:00.0: ttyS0 at MMIO 0xfffffff000000000 (irq = 65) is a 16550A
> console handover: boot [ttyB0] -> real [ttyS0]
> 0000:00:00.0: ttyS1 at MMIO 0xfffffff000000008 (irq = 65) is a 16550A
> 0000:00:00.0: ttyS2 at MMIO 0xfffffff000000010 (irq = 65) is a 16550A
> brd: module loaded
> loop: module loaded
> Linux Tulip driver version 1.1.15 (Feb 27, 2007)
> tulip0: no phy info, aborting mtable build
> tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
> eth0: Digital DS21142/43 Tulip rev 65 at Port 0x80, 00:30:6e:0e:b2:5f,

Can you try with CONFIG_GSC turned off? irq 65 *shouldn't* be occuring
there, nor should it be occuring period since with CONFIG_GSC set it's
the IPI irq...
