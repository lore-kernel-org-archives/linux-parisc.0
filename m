Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39A96482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Jun 2001 10:34:32 -0600 (MDT)
To: Simeon Walker <simeon@sbs.bangor.ac.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Kernel faults on boot 
In-Reply-To: Your message of "Thu, 14 Jun 2001 17:24:42 BST."
             <3B28E54A.5BE2C413@sbs.bangor.ac.uk>
References: <md5:24CD73579DAE676AC9847A2AA7C80BD3>
 <3B28D51D.79DBF56@sbs.bangor.ac.uk> <20010614171602.A3364@parcelfarce.linux.theplanet.co.uk>  <3B28E54A.5BE2C413@sbs.bangor.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Jun 2001 10:37:14 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010614163714.26FEF37EFD@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Simeon Walker writes...

> Matthew Wilcox wrote:
> > 
> > On Thu, Jun 14, 2001 at 04:15:41PM +0100, Simeon Walker wrote:
> > > I thought I'd try and compile my own kernel to see if that
> > > had the same problem but have been unable to do so. First
> > > I tried the apt-get'able kernel source
> > 
> > don't do that -- we're not merged upstream.  ditto, don't do it for glibc,
> > gcc or gdb.  binutils should be OK, but no promises -- see some of the
> > recent breakages we've had.
> > 
> so I guess an apt-get upgrade is not such a good thing at this 
> point in time?

No, an apt-get upgrade should be fine. For packages where we differ from 
upstream one of the three cases apply,

1.) the hppa-linux changes have been integrated into the Debian package
2.) a special hppa only deb has been done(which may not be in the archive)
3.) that package doesn't exist in the Debian archive yet

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
