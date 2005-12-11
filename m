From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 11 Dec 2005 20:48:04 +0100
Message-ID: <20051211194804.GA31384@isilmar.linta.de>
References: <1133818340.3395.11.camel@mulgrave> <20051205220344.GJ15201@flint.arm.linux.org.uk> <1133829923.3262.1.camel@mulgrave> <20051206093643.GA1706@flint.arm.linux.org.uk> <1133876209.3267.2.camel@mulgrave> <20051207122129.GA31601@isilmar.linta.de> <20051211065023.GA7987@colo.lackof.org> <1134314073.3367.5.camel@mulgrave> <20051211175004.GA22449@colo.lackof.org> <1134324062.3367.9.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
 Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <linux@dominikbrodowski.net>
In-Reply-To: <1134324062.3367.9.camel@mulgrave>
List-ID: <linux-parisc.vger.kernel.org>

Hi,

On Sun, Dec 11, 2005 at 12:01:02PM -0600, James Bottomley wrote:
> On Sun, 2005-12-11 at 10:50 -0700, Grant Grundler wrote:
> > On Sun, Dec 11, 2005 at 09:14:33AM -0600, James Bottomley wrote:
> > >  The question is would it without the pcmcia hack?
> > 
> > *nod*.  If PCMCIA code is accessing IO Port space looking for legacy
> > ISA devices, then a parisc box will definitely HPMC.
> 
> Well, I pulled out the mem probe and left in the PCMCIA_PROBE config
> setting based on !PARISC.
> 
> Everything seems to work.  Here's the relevant dmesg output 
> 
> Yenta: CardBus bridge found at 0000:00:02.0 [0000:0000]
> PCI: Bus 1, cardbus bridge: 0000:00:02.0
>   IO window: 00000400-000005ff
>   IO window: 00000800-000009ff
>   PREFETCH window: f0c00000-f0ffffff
>   MEM window: f0900000-f09fffff
> Yenta: Enabling burst memory read transactions
> Yenta: Using CSCINT to route CSC interrupts to PCI
> Yenta: Routing CardBus interrupts to PCI
> Yenta TI: socket 0000:00:02.0, mfunc 0x00000000, devctl 0x66
> Yenta TI: socket 0000:00:02.0 probing PCI interrupt failed, trying to
> fix
> Yenta TI: socket 0000:00:02.0 falling back to parallel PCI interrupts
> Yenta TI: socket 0000:00:02.0 parallel PCI interrupts ok
> Yenta: ISA IRQ mask 0x0000, PCI irq 23
> Socket status: 30000010
> pcmcia: parent PCI bridge I/O window: 0x0 - 0xffff
> pcmcia: parent PCI bridge Memory window: 0xf0800000 - 0xf0ffffff
> pccard: PCMCIA card inserted into slot 0
> [...]
> cs: memory probe 0xf0800000-0xf0ffffff: excluding 0xf0800000-0xf087ffff
> 0xf0900000-0xf09fffff 0xf0c00000-0xf0ffffff

> As you can see, we do get the cis memory probe occuring within the
> correct boundaries now.

Excellent. So is this patch OK? If yes, I'll try to get it into 2.6.16-rc1.

Thanks,
	Dominik


diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index 309eb55..d07b01f 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -200,7 +200,7 @@ config PCMCIA_PXA2XX
 
 config PCMCIA_PROBE
 	bool
-	default y if ISA && !ARCH_SA1100 && !ARCH_CLPS711X
+	default y if ISA && !ARCH_SA1100 && !ARCH_CLPS711X && !PARISC
 
 config M32R_PCC
 	bool "M32R PCMCIA I/F"
