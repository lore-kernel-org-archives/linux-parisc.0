Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B0E3482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Aug 2001 20:13:19 -0600 (MDT)
Date: Fri, 31 Aug 2001 20:13:17 -0600
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010831201317.A601@beavis.ybsoft.com>
References: <20010830131409.A22097@middle.of.nowhere> <200108312358.RAA24830@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200108312358.RAA24830@puffin.external.hp.com>
From: rbradetich@uswest.net (Ryan Bradetich)
Subject: [parisc-linux] Re: parisc-linux / C200 / power-down
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 31, 2001 at 05:58:43PM -0600, Grant Grundler wrote:
> thunder7@xs4all.nl wrote:
> > I would like to know if your C200 also has the following:
> > 
> > If I issue a 'shutdown -h now', after a while the screen says 'Power
> > down.' - but it doesn't react to the power-button, I have to yank out
> > the power-cord to get it to shut down.
> > 
> > You too?

I just tested this (I usually use the reboot option) and confirmed it 
does not shutdown after the Power down.  Simpling hitting the power
button turned it off for me, but I do have to pull the power cord
a lot on this machine.

> First, I don't have a C200 - only C3000 and A500.
> I gave my C200 to a developer in Canada.
> 
> Second, the soft power control is slightly different for different
> machines. Info for Soft power control hasn't be published AFAIK.
> I've bundled some of it together and passed it on to someone once
> already but they haven't had time to work on it.
> 
> Ryan, does it work for you?
> (and assuming it doesn't, want more info to try to fix it?)
> grant

Yes, I would be interested in fixing this.

Thanks,

- Ryan

> Grant Grundler
> parisc-linux {PCI|IOMMU|SMP} hacker
> +1.408.447.7253
> 

-- 
