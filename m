Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amanda.ybsoft.com (lametoby.ybsoft.com [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53370482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 21:14:20 -0600 (MDT)
Date: Thu, 19 Jul 2001 21:14:12 -0600
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installation success on C200
Message-ID: <20010719211412.B23181@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <200107191929.NAA18096@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107191929.NAA18096@puffin.external.hp.com>
From: rbrad@beavis.ybsoft.com (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

Jacob and Grant,

The Slots are numbers as follows (according to the Owners Guide):

0A
4A
0B
4B
2A
5A
2B
5B
<space>
<space>
3A
1A
3B
1B

Rear of Main Tray


The C200 takes 16MB, 32MB, 64MB, or 128MB and must be intalled 
in pairs.  Always install the largest capacity memory modules 
in the lowest numbered memory slots.

Hope this helps.

- Ryan


On Thu, Jul 19, 2001 at 01:29:15PM -0600, Grant Grundler wrote:
> Jakob Sandgren wrote:
> > A question;
> > during boot the firmware complains about that the memory is not
> > installed for "optimal performance". Do anyone know what to do about
> > this?
> 
> The owners guide or install guide will tell exactly how to do that.
> Anyone have such a guide for C200?
> 
> Typically one should install the biggest SIMMs in the lowest numbered
> slots. Some models want them installed in pairs of the same size.
> 
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
