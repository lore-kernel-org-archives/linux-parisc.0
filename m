Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF5C3482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 18:00:36 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Wo6s-00012v-00; Wed, 15 Aug 2001 01:00:34 +0100
Date: Wed, 15 Aug 2001 01:00:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Users staying up to date.
Message-ID: <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk>
References: <20010814154037.I25258@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010814154037.I25258@megatonmonkey.net>; from carlos@baldric.uwo.ca on Tue, Aug 14, 2001 at 03:40:37PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 14, 2001 at 03:40:37PM -0400, Carlos O'Donell Jr. wrote:
> Obviously the latest kernel/glibc/gcc... will reside in the
> CVS. It's a matter of slurping/building and testing on one
> of our boxen.

Actually, the debian glibc package has more uptodate bits than our CVS tree.

> The packages are a slightly different matter. Is the 0.9.2
> iso the latest collection of packages? Is anyone in debain-hppa
> compiling/testing packages?

we're compiling packages constantly.  we have a lack of testing though,
which is what we rely on people like you for :-)

> Instead we have used the baseplus tar from sid to install the nodes.
> The only extra packages we required were NIS(yp*) and MPICH(1.2.1).

We seem to have those compiled already in debian...

> I recently found though, that when compiling more complicated
> MPI programs, cc and ld start dropping SIG11's like there was
> no tommorow (more on this after I do some testing).

OK, I'd be interested to see more detail once we're sure you're on
an uptodate system.

> We were doing:
> 1- Unpack sid baseplus root tarball
> 2- x-compiled and installed NIS(yp*) and MPICH
> 3- Use this as my new root tarball for the rest of the cluster
> 
> Should I be doing:
> 
> 1- Unpack sid baseplus and export via nfs
> 2- Download latest debs and export via nfs
> 3- Boot "clone" box with nfs root
> 4- Point apt to the debs on the nfs share
> 5- Update packages like mad
> 6- Use "clone" as my new root tarball for the rest of the cluster

You should be doing:

Run debian installer to completion on one machine
apt-get dist-upgrade
apt-get install nis mpich
tar up / and copy it to all other machines

If the latest debian installer (never mind what's on the CDs) doesn't
work, then please report the problems.

-- 
Revolutions do not require corporate support.
