Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amanda.ybsoft.com (lametoby.ybsoft.com [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id A56B9482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jul 2001 21:32:01 -0600 (MDT)
Date: Sun, 15 Jul 2001 21:31:57 -0600
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] help debuging HMPC
Message-ID: <20010715213157.A13729@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <200107140620.AAA28577@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107140620.AAA28577@puffin.external.hp.com>
From: rbrad@beavis.ybsoft.com (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jul 14, 2001 at 12:20:00AM -0600, Grant Grundler wrote:

> > This is the instruction that causes the HPMC (IAOQ address - 8):
> > 	ldwa  r0(r26),r26
> 
> Given the IOAQ data below, I'm pretty sure GR26 is garbage.
> 
> Anyway, the IO port address is most likely still in GR24
> since it's the third arg to dino_inX. The call to gsc_readX
> won't (shouldn't) clobber that.

Just a quick clarification:

I macro expanded dino_in32 into this:
	static u32 dino_in32 (struct pci_hba_data *d, u16 addr);

dino_in32 only takes two arguments, so I should check GR25 and manually
perform the calculations in the dino_in32 to get the proper address
passed to the _gsc_readl function, correct?  


> The stack is just a temporary storage space for code to save registers.
> IOAQ reflects the state of the CPU and has nothing to do with stack.

Doh .. ok.  This makes sense to me now. *sigh*

> > 		running the astk command from the build-tools also does
> > 		not show the dino_in32 or the _gsc_readl addresses in
> > 		the stack trace either.
> 
> right - only time you'll see a function address (which was part
> of the call chain) is when GR02 gets saved.
> gsc_readX is a "leaf" routine and thus doesn't save GR02.
> The last thing on the stack should be the caller to dino_inX().

This also make sense to me.  Thanks for your time and explaination Grant!

- Ryan

> grant
> 
> Grant Grundler
> parisc-linux {PCI|IOMMU|SMP} hacker
> +1.408.447.7253
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 

-- 
