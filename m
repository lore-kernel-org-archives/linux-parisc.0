Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25C6E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 17:27:39 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Users staying up to date. 
In-Reply-To: Message from "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
   of "Tue, 14 Aug 2001 15:40:37 EDT." <20010814154037.I25258@megatonmonkey.net>
References: <20010814154037.I25258@megatonmonkey.net> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Aug 2001 17:27:37 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010814232737.126BF37DD1@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Carlos O'Donell Jr." writes...

> I was just looking to bounce some ideas off the list members.
> As an avid user, I was just musing to myself, how can I keep
> everything up to date (kernel/glibc/packages)?

apt-get upgrade

> Obviously the latest kernel/glibc/gcc... will reside in the
> CVS. It's a matter of slurping/building and testing on one
> of our boxen.

All of the binutils/gcc/glibc/palo changes are in the Debian packages in the 
archive. The kernel-image packages should go in soon, but you'll have to 
upgrade your kernel by hand for now.

> The packages are a slightly different matter. Is the 0.9.2
> iso the latest collection of packages?

No it is a snapshot in time of the Debian unstable archive. After installing 
you should apt-get upgrade to get the latest versions of the things you have 
installed. We'll update the packages on the next iso.

> Is anyone in debain-hppa compiling/testing packages?

Yes, lots of people are building and uploading Debian packages for hppa, 
including the Debian autobuilder that automatically attempts to build new 
debian source packages as they are uploaded. There are currently Debian 5747 
packages available for hppa (including the architecture indepenent ones).

> We have a cluster of 30x 715/50's running.
> And for one reason or another have not quite gotten the debian
> installer to run to completetion (nor can I spend the time to
> install on each node... that's what scripts and root tarballs
> are for).
> 
> Instead we have used the baseplus tar from sid to install the nodes.
> The only extra packages we required were NIS(yp*) and MPICH(1.2.1).

baseplus is really old. You should really use the Debian installer (or at 
least roll a new base tarball).

> I recently found though, that when compiling more complicated
> MPI programs, cc and ld start dropping SIG11's like there was
> no tommorow (more on this after I do some testing).

I wouldn't trust the old base tarball(or any system assembled by hand for that 
matter). Try a fresh install and post the results to the list.

> Is there a fundamental flaw in using sid's baseplus tarball for
> the 715/50 systems?

Yes, the old base tarball probably isn't total clean wrt the alignment needed 
for 715/50.

> Really, I'm just looking for a simple way to stay up to date
> with all the latest packages and kernel changes :)

man apt

Bdale's comments were good too.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
