Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84758482A
	for <parisc-linux@parisc-linux.org>; Mon, 20 Aug 2001 23:46:53 -0600 (MDT)
Message-Id: <200108210544.XAA20603@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] iotree thoughts 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Tue, 14 Aug 2001 17:02:12 BST." <20010814170212.A22144@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 20 Aug 2001 23:44:20 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> On Thu, Aug 09, 2001 at 09:06:43AM -0600, Grant Grundler wrote:
> > Yes. AFAIK, LASI sub-devices are listed by PDC. For Dino HPUX makes
> > a special hvers PDC call. Need to look at the HPUX code or Raven PDC ERS.
> 
> If you could dig those out for me, that'd be great.  I'm not familiar with
> the layout of the HPUX source tree yet.

That sounds too much like work. ;^)
Raven PDC ERS is available from HP's firmware team website. (internal only).

> > My long term goal is to be able to build a kernel w/o CONFIG_PCI defined.
> > And renaming gsc_init to native_bus_init() sounds like a good idea.
> 
> That's a good point.  A good step towards that would be..

I disagree. I want the kernel to NOT link if CONFIG_PCI and
CONFIG_ISA are not enabled when inx/outx functions are used.

> +#else
> +#define inb(a) BUG()
> +#define inw(a) BUG()
> +#define inl(a) BUG()
> +#define outb(a) BUG()
> +#define outw(a) BUG()
> +#define outl(a) BUG()
>  #endif

This will allow the kernel to link and then fail after rebooting.
That seems like a step backwards to me.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
