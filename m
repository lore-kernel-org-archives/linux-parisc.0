Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vogon.bangor.ac.uk (vogon.bangor.ac.uk [147.143.41.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0596F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Jun 2001 10:23:05 -0600 (MDT)
Received: from sbs.bangor.ac.uk (milliways.bangor.ac.uk [147.143.41.38])
	by vogon.bangor.ac.uk (8.9.3/8.9.3) with ESMTP id RAA24525
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Jun 2001 17:23:03 +0100
Sender: sim@vogon.bangor.ac.uk
Message-ID: <3B28E4E7.A5AD9150@sbs.bangor.ac.uk>
Date: Thu, 14 Jun 2001 17:23:03 +0100
From: Simeon Walker <simeon@sbs.bangor.ac.uk>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Kernel faults on boot
References: <md5:24CD73579DAE676AC9847A2AA7C80BD3> <3B28D51D.79DBF56@sbs.bangor.ac.uk> <20010614165002.B1828@linuxcare.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> 
> On Thu, Jun 14, 2001 at 04:15:41PM +0100, Simeon Walker wrote:
> > Hi,
> >   I have just installed the from 0.9 ISO to a 712/80 (using the
> > sti kernel) and had the same problem. Modify the palo params and
> > going into run level 1 works. I can then run all the services that
> > would have started at run level 2, it's actually the getty's
> > started by init that cause the crash.
> 
> Yes, it is fixed in our latest cvs source.
> 
Great, I've got that.

> > I thought I'd try and compile my own kernel to see if that
> > had the same problem but have been unable to do so. First
> > I tried the apt-get'able kernel source and then I tried the
> > cvs version with the same problem. The error is:
> >    make: hppa-linux-gcc: Command not found
> > Is this because the kernel sources assume I'm cross compiling
> > whereas I'm actually trying to compile on the target machine
> > or am I missing some package? I've compiled kernels on
> > debian x86 machines so I know what's usually required.
> 
> Yes, comes from arch/parisc/Makefile
> 
> CROSS_COMPILE := hppa-linux-
> 
> changing that to
> 
> CROSS_COMPILE :=
> 
Ahhhh!

> is one solution.  You do need to use our cvs kernel source at
> the moment, we don't have parisc kernel patches in the archive
> yet.
> 
> Richard

I'm compiling the kernel now so I'll see how it goes. It
certainly compiles slowly on this 712/80...

Thanks,
Simeon

-- 
Simeon Walker,                      email: simeon@sbs.bangor.ac.uk
School of Biological Sciences,      phone: +44 (0)1248 383702
University of Wales, Bangor,        fax: +44 (0)1248 382569
Gwynedd, LL57 2UW, UK.              www: http://biology.bangor.ac.uk/
