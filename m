Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amanda.ybsoft.com (lametoby.ybsoft.com [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 698E5482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 20:09:24 -0600 (MDT)
Date: Thu, 12 Jul 2001 20:09:21 -0600
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Problem installing .9 iso image on C240
Message-ID: <20010712200921.A29444@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <200107120523.XAA09209@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107120523.XAA09209@puffin.external.hp.com>
From: rbrad@beavis.ybsoft.com (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 11, 2001 at 11:23:34PM -0600, Grant Grundler wrote:
> Richard Hirst wrote:
> > Installing a 64 bit kernel with narrow PDC
> > calls later would be an option (once it works).  Do we leave building
> > that kernel as an exercise for the user, or or do we have one packaged
> > in the archive?
> 
> I was under the impression the "CONFIG_PDC_NARROW" option would only
> "activate" itself in one boxes that needed it. Ie it does grow the kernel
> and AFAIK is really only useful for Cxxx models.
> Ryan, do I have it right?

Not quite.  Let me try to clarify (This is the help text for the 
CONFIG_PDC_NARROW option)....

CONFIG_PDC_NARROW
  Saying Y here will allow developers with a C180, C200, C240, C360,
  J200, J210, and/or a J2240 to test 64-bit kernels by providing 
  a wrapper for the 32-bit PDC calls.  Since the machines which 
  which require this option do not support over 4G of RAM, this
  option is targeted for developers of these machines wishing to
  test changes on both 32-bit and 64-bit configurations.

  If unsure, say N.

At one time I had run-time detection to detect if the machine was 
booted into wide mode it could detect if the pdc wrappers were needed.
After some discussion, we decided to make it a compiler option since
it added overhead to every pdc call and would rarely be used.

If the help text for this option needs to be clarified, please send
me your comments and I'll update the help text. :)

Thanks,

- Ryan

> I am pretty sure K/D/R-class boxes have a different source base for PDC
> which "properly" support wide-mode PDC calls.
> 
> thanks,
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
