From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Hacking SuperDome
Date: Wed, 11 Feb 2009 12:29:24 -0700
Message-ID: <20090211192924.GB4644@colo.lackof.org>
References: <20090207142906.GA8553@alpha.franken.de> <20090211072312.GA19531@colo.lackof.org> <20090211181425.GA27133@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090211181425.GA27133@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Feb 11, 2009 at 01:14:25PM -0500, Kyle McMartin wrote:
> On Wed, Feb 11, 2009 at 12:23:12AM -0700, Grant Grundler wrote:
> > Look for HPMC's. The console can't keep up with the kernel in general.
> > When an HPMC occurs, some of the output can get stranded.
> > 
> > I would add "initcall_debug=1" to boot parameters. See kernel/main.c.
> > Possible add a mdelay(100) after each initcall.
> > 
> > Since Tulip configured properly, I'm going to assume PCI resources
> > were properly assigned and all PCI Busses enumerated. PCI support
> > shouldn't be any different than for other PAT PDC machines.
> > 
> 
> The interrupt assignment looks a little wonky, don't you think?

Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
serial 0000:00:00.0: enabling device (0146 -> 0147)
0000:00:00.0: ttyS0 at MMIO 0xfffffff000000000 (irq = 65) is a 16550A
console handover: boot [ttyB0] -> real [ttyS0]
0000:00:00.0: ttyS1 at MMIO 0xfffffff000000008 (irq = 65) is a 16550A
0000:00:00.0: ttyS2 at MMIO 0xfffffff000000010 (irq = 65) is a 16550A
brd: module loaded
loop: module loaded
Linux Tulip driver version 1.1.15 (Feb 27, 2007)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21142/43 Tulip rev 65 at Port 0x80, 00:30:6e:0e:b2:5f,
IRQ 65.


"IRQ 65" on it's own could be ok.
The fact the serial port and tulip share the IRQ seems odd.

Your suggestion to enable iosapic debug code is a good one.

hth,
grant
