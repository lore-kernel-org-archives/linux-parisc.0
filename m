Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53E404A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Feb 2001 09:41:39 -0700 (MST)
Date: Wed, 28 Feb 2001 10:41:32 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] include/asm/semaphore-helper.h
In-Reply-To: <20010228162201.D2686@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0102281026300.2449-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 28 Feb 2001, Richard Hirst wrote:

> On Wed, Feb 28, 2001 at 09:32:14AM -0600, Greg Ingram wrote:
> > 
> > Howdy,
> > 
> > I can't build the current CVS bits.  I get this message:
> > 
> > 	make[1]: *** No rule to make target \
> > 	`/usr/src/parisc/linux/include/asm/semaphore-helper.h', needed by \
> > 	`semaphore.o'.  Stop.                                     
> > 
> > Is this file supposed to be created in the build process?  Or is the file
> > simply missing from my tree?
> 
> 
> Have you tried a make distclean; make dep; sequence?

Argh!  No.  I did make palo.  When that didn't work I tried again with
make clean; make palo.  Okay, I've got an image now.

- Greg
