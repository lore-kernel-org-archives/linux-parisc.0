From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 11 Dec 2005 20:49:47 +0100
Message-ID: <20051211194947.GB31384@isilmar.linta.de>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca> <20051211175004.GA22449@colo.lackof.org> <1134324062.3367.9.camel@mulgrave> <200512111955.09892.deller@gmx.de> <20051211190904.GB9286@parisc-linux.org> <20051204060423.GA12355@quicksilver.road.mcmartin.ca> <20051211175004.GA22449@colo.lackof.org> <1134324062.3367.9.camel@mulgrave> <200512111955.09892.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@lists.parisc-linux.org,
 Grant Grundler <grundler@parisc-linux.org>,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Helge Deller <deller@gmx.de>,
 Matthew Wilcox <matthew@wil.cx>
Return-Path: <linux@dominikbrodowski.net>
In-Reply-To: <20051211190904.GB9286@parisc-linux.org> <200512111955.09892.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Hi,

On Sun, Dec 11, 2005 at 07:55:09PM +0100, Helge Deller wrote:
> Hi James,
> 
> Seems ok, but I still have the "stuck IRQ" problem:
> 
> Dec 11 19:46:11 rdi kernel: Yenta: CardBus bridge found at 0000:00:02.0 [0000:0000]
> Dec 11 19:46:11 rdi kernel: PCI: Bus 1, cardbus bridge: 0000:00:02.0
> Dec 11 19:46:11 rdi kernel:   IO window: 00000400-000005ff
> Dec 11 19:46:11 rdi kernel:   IO window: 00000800-000009ff
> Dec 11 19:46:11 rdi kernel:   PREFETCH window: f0c00000-f0ffffff
> Dec 11 19:46:11 rdi kernel:   MEM window: f0900000-f09fffff
> Dec 11 19:46:12 rdi kernel: Dino 0xfff80000: stuck interrupt 2
> Dec 11 19:46:12 rdi last message repeated 7 times

On Sun, Dec 11, 2005 at 12:09:04PM -0700, Matthew Wilcox wrote:
> On Sun, Dec 11, 2005 at 07:55:09PM +0100, Helge Deller wrote:
> > Seems ok, but I still have the "stuck IRQ" problem:
> 
> We have that problem with cardmode dino too ... may or may not be the
> same root cause.

Does PCMCIA still work? Does it go away with the no-mem-probing hack? I
don't think so. Probably PARISC doesn't like us trying out the ISA interrupt
routing in yenta-socket?

Thanks,
	Dominik
