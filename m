Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A9D3482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Jun 2001 09:54:30 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 01D9CB007; Thu, 14 Jun 2001 16:50:02 +0100 (BST)
Date: Thu, 14 Jun 2001 16:50:02 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Simeon Walker <sim@sbs.bangor.ac.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Kernel faults on boot
Message-ID: <20010614165002.B1828@linuxcare.com>
References: <md5:24CD73579DAE676AC9847A2AA7C80BD3> <3B28D51D.79DBF56@sbs.bangor.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B28D51D.79DBF56@sbs.bangor.ac.uk>; from sim@sbs.bangor.ac.uk on Thu, Jun 14, 2001 at 04:15:41PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jun 14, 2001 at 04:15:41PM +0100, Simeon Walker wrote:
> Hi,
>   I have just installed the from 0.9 ISO to a 712/80 (using the
> sti kernel) and had the same problem. Modify the palo params and 
> going into run level 1 works. I can then run all the services that
> would have started at run level 2, it's actually the getty's
> started by init that cause the crash.

Yes, it is fixed in our latest cvs source.

> I thought I'd try and compile my own kernel to see if that
> had the same problem but have been unable to do so. First
> I tried the apt-get'able kernel source and then I tried the
> cvs version with the same problem. The error is:
>    make: hppa-linux-gcc: Command not found
> Is this because the kernel sources assume I'm cross compiling
> whereas I'm actually trying to compile on the target machine
> or am I missing some package? I've compiled kernels on 
> debian x86 machines so I know what's usually required.

Yes, comes from arch/parisc/Makefile

CROSS_COMPILE := hppa-linux-

changing that to

CROSS_COMPILE :=

is one solution.  You do need to use our cvs kernel source at
the moment, we don't have parisc kernel patches in the archive
yet.

Richard
