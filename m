Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE9A5482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Jun 2001 10:16:03 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15AZms-0003EX-00; Thu, 14 Jun 2001 17:16:02 +0100
Date: Thu, 14 Jun 2001 17:16:02 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Simeon Walker <sim@sbs.bangor.ac.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Kernel faults on boot
Message-ID: <20010614171602.A3364@parcelfarce.linux.theplanet.co.uk>
References: <md5:24CD73579DAE676AC9847A2AA7C80BD3> <3B28D51D.79DBF56@sbs.bangor.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B28D51D.79DBF56@sbs.bangor.ac.uk>; from sim@sbs.bangor.ac.uk on Thu, Jun 14, 2001 at 04:15:41PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jun 14, 2001 at 04:15:41PM +0100, Simeon Walker wrote:
> I thought I'd try and compile my own kernel to see if that
> had the same problem but have been unable to do so. First
> I tried the apt-get'able kernel source

don't do that -- we're not merged upstream.  ditto, don't do it for glibc,
gcc or gdb.  binutils should be OK, but no promises -- see some of the
recent breakages we've had.

> and then I tried the
> cvs version with the same problem. The error is:
>    make: hppa-linux-gcc: Command not found
> Is this because the kernel sources assume I'm cross compiling

that's right.  we're considering changing this.  it's a one-line
change in any case -- edit arch/parisc/Makefile and change
`CROSS_COMPILE=hppa-linux-' to `CROSS_COMPILE='

-- 
Revolutions do not require corporate support.
