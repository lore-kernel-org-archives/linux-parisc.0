Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vogon.bangor.ac.uk (vogon.bangor.ac.uk [147.143.41.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id D0144482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Jun 2001 10:24:43 -0600 (MDT)
Received: from sbs.bangor.ac.uk (milliways.bangor.ac.uk [147.143.41.38])
	by vogon.bangor.ac.uk (8.9.3/8.9.3) with ESMTP id RAA24649
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Jun 2001 17:24:42 +0100
Sender: sim@vogon.bangor.ac.uk
Message-ID: <3B28E54A.5BE2C413@sbs.bangor.ac.uk>
Date: Thu, 14 Jun 2001 17:24:42 +0100
From: Simeon Walker <simeon@sbs.bangor.ac.uk>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Kernel faults on boot
References: <md5:24CD73579DAE676AC9847A2AA7C80BD3> <3B28D51D.79DBF56@sbs.bangor.ac.uk> <20010614171602.A3364@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> On Thu, Jun 14, 2001 at 04:15:41PM +0100, Simeon Walker wrote:
> > I thought I'd try and compile my own kernel to see if that
> > had the same problem but have been unable to do so. First
> > I tried the apt-get'able kernel source
> 
> don't do that -- we're not merged upstream.  ditto, don't do it for glibc,
> gcc or gdb.  binutils should be OK, but no promises -- see some of the
> recent breakages we've had.
> 
so I guess an apt-get upgrade is not such a good thing at this 
point in time?

Thanks for the advice,
Simeon

-- 
Simeon Walker,                      email: simeon@sbs.bangor.ac.uk
School of Biological Sciences,      phone: +44 (0)1248 383702
University of Wales, Bangor,        fax: +44 (0)1248 382569
Gwynedd, LL57 2UW, UK.              www: http://biology.bangor.ac.uk/
