Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3C9E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Jun 2001 10:40:29 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15AaAW-0003vc-00; Thu, 14 Jun 2001 17:40:28 +0100
Date: Thu, 14 Jun 2001 17:40:28 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Simeon Walker <simeon@sbs.bangor.ac.uk>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Kernel faults on boot
Message-ID: <20010614174028.B3364@parcelfarce.linux.theplanet.co.uk>
References: <md5:24CD73579DAE676AC9847A2AA7C80BD3> <3B28D51D.79DBF56@sbs.bangor.ac.uk> <20010614171602.A3364@parcelfarce.linux.theplanet.co.uk> <3B28E54A.5BE2C413@sbs.bangor.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B28E54A.5BE2C413@sbs.bangor.ac.uk>; from simeon@sbs.bangor.ac.uk on Thu, Jun 14, 2001 at 05:24:42PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jun 14, 2001 at 05:24:42PM +0100, Simeon Walker wrote:
> so I guess an apt-get upgrade is not such a good thing at this 
> point in time?

Oh, no, that's fine.  Packages don't get uploaded for hppa until they
work.  So, for example, right now, there is no gdb in the debian archive,
only on puffin.external.hp.com until we get it integrated.  glibc 2.2.3-6
has been released, but in't compiled for hppa yet, so you won't get it.

-- 
Revolutions do not require corporate support.
