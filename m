From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 11 Dec 2005 12:01:02 -0600
Message-ID: <1134324062.3367.9.camel@mulgrave>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	 <20051204103338.GA16791@flint.arm.linux.org.uk>
	 <1133818340.3395.11.camel@mulgrave>
	 <20051205220344.GJ15201@flint.arm.linux.org.uk>
	 <1133829923.3262.1.camel@mulgrave>
	 <20051206093643.GA1706@flint.arm.linux.org.uk>
	 <1133876209.3267.2.camel@mulgrave>
	 <20051207122129.GA31601@isilmar.linta.de>
	 <20051211065023.GA7987@colo.lackof.org> <1134314073.3367.5.camel@mulgrave>
	 <20051211175004.GA22449@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Helge Deller <deller@gmx.de>,
 Russell King <rmk+pcmcia@arm.linux.org.uk>,
 linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <James.Bottomley@SteelEye.com>
In-Reply-To: <20051211175004.GA22449@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 2005-12-11 at 10:50 -0700, Grant Grundler wrote:
> On Sun, Dec 11, 2005 at 09:14:33AM -0600, James Bottomley wrote:
> >  The question is would it without the pcmcia hack?
> 
> *nod*.  If PCMCIA code is accessing IO Port space looking for legacy
> ISA devices, then a parisc box will definitely HPMC.

Well, I pulled out the mem probe and left in the PCMCIA_PROBE config
setting based on !PARISC.

Everything seems to work.  Here's the relevant dmesg output 

Yenta: CardBus bridge found at 0000:00:02.0 [0000:0000]
PCI: Bus 1, cardbus bridge: 0000:00:02.0
  IO window: 00000400-000005ff
  IO window: 00000800-000009ff
  PREFETCH window: f0c00000-f0ffffff
  MEM window: f0900000-f09fffff
Yenta: Enabling burst memory read transactions
Yenta: Using CSCINT to route CSC interrupts to PCI
Yenta: Routing CardBus interrupts to PCI
Yenta TI: socket 0000:00:02.0, mfunc 0x00000000, devctl 0x66
Yenta TI: socket 0000:00:02.0 probing PCI interrupt failed, trying to
fix
Yenta TI: socket 0000:00:02.0 falling back to parallel PCI interrupts
Yenta TI: socket 0000:00:02.0 parallel PCI interrupts ok
Yenta: ISA IRQ mask 0x0000, PCI irq 23
Socket status: 30000010
pcmcia: parent PCI bridge I/O window: 0x0 - 0xffff
pcmcia: parent PCI bridge Memory window: 0xf0800000 - 0xf0ffffff
pccard: PCMCIA card inserted into slot 0
[...]
cs: memory probe 0xf0800000-0xf0ffffff: excluding 0xf0800000-0xf087ffff
0xf0900000-0xf09fffff 0xf0c00000-0xf0ffffff
pcmcia: registering new device pcmcia0.0
pcmcia: Detected deprecated PCMCIA ioctl usage.
pcmcia: This interface will soon be removed from the kernel; please
expect breakage unless you upgrade to new tools.
pcmcia: see
http://www.kernel.org/pub/linux/utils/kernel/pcmcia/pcmcia.html for
details.
orinoco 0.15rc3 (David Gibson <hermes@gibson.dropbear.id.au>, Pavel
Roskin <proski@gnu.org>, et al)

As you can see, we do get the cis memory probe occuring within the
correct boundaries now.

Helge, I think the next test is over to you, could you see how CVS tree
head fares on your tadpole?

Thanks,

James
