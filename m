Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD472482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 23:24:21 -0600 (MDT)
Message-Id: <200107120523.XAA09209@puffin.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Problem installing .9 iso image on C240 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Wed, 11 Jul 2001 09:46:24 BST." <20010711094624.F18375@linuxcare.com>
Date: Wed, 11 Jul 2001 23:23:34 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> Installing a 64 bit kernel with narrow PDC
> calls later would be an option (once it works).  Do we leave building
> that kernel as an exercise for the user, or or do we have one packaged
> in the archive?

I was under the impression the "CONFIG_PDC_NARROW" option would only
"activate" itself in one boxes that needed it. Ie it does grow the kernel
and AFAIK is really only useful for Cxxx models.
Ryan, do I have it right?

I am pretty sure K/D/R-class boxes have a different source base for PDC
which "properly" support wide-mode PDC calls.

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
