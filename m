From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [RESEND] [PATCH] convert sticore.c to PCI ROM API
Date: Sat, 07 Jun 2008 12:25:02 -0500
Message-ID: <1212859502.16182.84.camel@localhost.localdomain>
References: <159459.29885.qm@web32505.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Krzysztof Helt <krzysztof.h1@poczta.fm>
To: Jon Smirl <jonsmirl@yahoo.com>,
	Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <159459.29885.qm@web32505.mail.mud.yahoo.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2008-06-07 at 05:12 -0700, Jon Smirl wrote:
> > > What is you advise for this patch James?
> > 
> > The more I look at this the more I doubt that it's a good thing.  STI is
> > really a platform driver; it has to function for both GSC and PCI
> > busses.  pci_map_rom() seems to be a bit of a minefield designed for x86
> > centric video cards, which STI definitely isn't.  The sticore driver is
> > also designed to operate on unmapped ranges ... at least this is the way
> > it's designed for the GSC, so the PCI part has to follow suit.
> 
> The PCI ROM API was made for three main reasons:
> 
> 1) Drivers, including X, were mapping the ROMs without declaring the
> resource. If you map a ROM without declaring the resource the kernel
> doesn't know it is there and may map something else into the same
> addresses. It's been a while but I believe the virtualization people
> were the ones complaining.

This one doesn't really apply to us.  The parisc gsc drivers are
designed to operate without remapping.  The PA architecture has load and
store absolute instructions, so we can access the physical locations of
the bus (this is PCI or GSC or runway or any of the other parisc busses)
without needing it to be mapped anywhere (it's actually helpful on 32
bits not to waste pieces of the virtual address space).  the
gsc_readX/gsc_writeX that the sti driver uses are really just wrappers
around load and store absolutes.  The problem is that if the location
does get mapped, you can't use the gsc_readX instructions on it (you
have to use ordinary readX)

The driver could be conceivably be updated to do an ioremap on the GSC
regions, but right at the moment that's not the way it works ... it's
also not clear to me that there'd be any benefit to changing it.

> 2) Error checking was not robust in the code that was directly
> mapping. This was causing drivers to hang when they used ROMs they
> thought were there and really weren't. This can definitely happen and
> it has happened on my own boxes while doing video driver work.
> Occasionally hardware doesn't initialize right and the ROMs won't
> enable.

The error checking in the STI driver seems fine ... it's checking for a
specific rom signature which won't be found if the rom isn't there.

> 3) It is the ground work for supporting multiple video cards in a box.
> When there are multiple cards the API keeps them from mapping on top
> of each other.

The bus inventory on PA does this one automatically because we're using
the bus physical addresses (you can't configure two devices to respond
on the same address).

> This code was not intended to be x86 specific. The PCI ROM format is
> cross platform and this code is used on the PowerPC. 

Well comments in the routine say things like:

	/*
	 * IORESOURCE_ROM_SHADOW set on x86, x86_64 and IA64 supports legacy
	 * memory map if the VGA enable bit of the Bridge Control register is
	 * set for embedded VGA.

Plus in order not to get ioremap'd we need IORESOURCE_ROM_COPY or
IORESOURCE_ROM_BIOS_COPY set in the flags, which I'm not sure we
have ... I need someone with a PCI version of one of these cards to
check (I only have the GSC version).

James


