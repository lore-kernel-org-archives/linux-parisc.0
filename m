Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 821244A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Feb 2001 09:21:12 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 661A5B007; Wed, 28 Feb 2001 16:22:01 +0000 (GMT)
Date: Wed, 28 Feb 2001 16:22:01 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] include/asm/semaphore-helper.h
Message-ID: <20010228162201.D2686@linuxcare.com>
References: <002901c0a17f$d0933240$0801a8c0@esiee.fr> <Pine.LNX.4.21.0102280929070.2282-100000@maestro.symsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102280929070.2282-100000@maestro.symsys.com>; from ingram@symsys.com on Wed, Feb 28, 2001 at 09:32:14AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Feb 28, 2001 at 09:32:14AM -0600, Greg Ingram wrote:
> 
> Howdy,
> 
> I can't build the current CVS bits.  I get this message:
> 
> 	make[1]: *** No rule to make target \
> 	`/usr/src/parisc/linux/include/asm/semaphore-helper.h', needed by \
> 	`semaphore.o'.  Stop.                                     
> 
> Is this file supposed to be created in the build process?  Or is the file
> simply missing from my tree?


Have you tried a make distclean; make dep; sequence?

Richard
