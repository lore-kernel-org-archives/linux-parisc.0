Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 16DFF482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Aug 2001 04:33:56 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1EB74B00C; Fri,  3 Aug 2001 11:35:39 +0100 (BST)
Date: Fri, 3 Aug 2001 11:35:39 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] dev-packages
Message-ID: <20010803113539.B1011@linuxcare.com>
References: <20010802221905.C20250@parcelfarce.linux.theplanet.co.uk> <Pine.BSF.4.30.0108030645560.38503-100000@noc.zabbadoz.net> <20010803132528.G9637@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010803132528.G9637@neep.com.au>; from andrew@neep.com.au on Fri, Aug 03, 2001 at 01:25:33PM +0800
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 03, 2001 at 01:25:33PM +0800, Andrew Shugg wrote:
> Quoth Bjoern A. Zeeb:
> > On Thu, 2 Aug 2001, Matthew Wilcox wrote:
> > > They're all available in the debian archive.  I don't think we have
> > > plans to produce any more CDs until the Debian Woody release (probably
> > > December).
> > 
> > Could you point me to some URL (incl. subdir) please ?
> 
> If you've got apt configured (/etc/apt/apt.conf, /etc/apt/sources.list)
> then you don't need to worry about finding things directly.  After doing
> an 'apt-get update' to fetch the current Packages files and rebuild the
> local package database, you can say 'apt-cache search foo' and it will
> show you all the packages called foo or with foo in their description.
> A simple 'apt-get install foo-dev' will download and install the foo-dev
> package and any other package it may require according to its
> dependencies.

If for some reason you do want to find things directly, you should
be aware that pkgs live in a pool now, and you wont find much under
a sid/main/binary-hppa dir on your local mirror.  For example, libc6-dev
would be found under /pub/mirrors/debian/pool/main/g/glibc.  That one
is under 'g' because the source pkg is glibc.  But as Andrew said, apt
is right way to install things normally.

Richard
