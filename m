Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18663482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 13:40:07 -0600 (MDT)
Received: from sh.od.inet (IDENT:root@systemhalted [192.168.1.1])
	by megatonmonkey.net (8.11.0/8.11.0) with ESMTP id f7EJp9X30667
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 15:51:09 -0400
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id f7EJebu26035
	for parisc-linux@lists.parisc-linux.org; Tue, 14 Aug 2001 15:40:37 -0400
Date: Tue, 14 Aug 2001 15:40:37 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010814154037.I25258@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Users staying up to date.
List-ID: <linux-parisc.vger.kernel.org>

parisc,

I would like to say that you guys have done a great job
with this port!

I was just looking to bounce some ideas off the list members.
As an avid user, I was just musing to myself, how can I keep
everything up to date (kernel/glibc/packages)?

Obviously the latest kernel/glibc/gcc... will reside in the
CVS. It's a matter of slurping/building and testing on one
of our boxen.

The packages are a slightly different matter. Is the 0.9.2
iso the latest collection of packages? Is anyone in debain-hppa
compiling/testing packages?

We have a cluster of 30x 715/50's running.
And for one reason or another have not quite gotten the debian
installer to run to completetion (nor can I spend the time to
install on each node... that's what scripts and root tarballs
are for).

Instead we have used the baseplus tar from sid to install the nodes.
The only extra packages we required were NIS(yp*) and MPICH(1.2.1).

I recently found though, that when compiling more complicated
MPI programs, cc and ld start dropping SIG11's like there was
no tommorow (more on this after I do some testing).

Is there a fundamental flaw in using sid's baseplus tarball for
the 715/50 systems?

We were doing:
1- Unpack sid baseplus root tarball
2- x-compiled and installed NIS(yp*) and MPICH
3- Use this as my new root tarball for the rest of the cluster

Should I be doing:

1- Unpack sid baseplus and export via nfs
2- Download latest debs and export via nfs
3- Boot "clone" box with nfs root
4- Point apt to the debs on the nfs share
5- Update packages like mad
6- Use "clone" as my new root tarball for the rest of the cluster

Really, I'm just looking for a simple way to stay up to date
with all the latest packages and kernel changes :)

Cheers,
Carlos O'Donell Jr.
-------------------------
Baldric Project
http://www.baldric.uwo.ca
-------------------------
