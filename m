Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8CDA6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 04:35:58 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id EB75EB00C; Thu, 21 Jun 2001 11:36:52 +0100 (BST)
Date: Thu, 21 Jun 2001 11:36:52 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Gregor Anders <anders@rrz.uni-koeln.de>,
	debian-hppa@lists.debian.org
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010621113652.K11438@linuxcare.com>
References: <20010621024342.I20320@coredump.rrz.uni-koeln.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010621024342.I20320@coredump.rrz.uni-koeln.de>; from anders@rrz.uni-koeln.de on Thu, Jun 21, 2001 at 02:43:42AM +0200
Subject: [parisc-linux] Re: 0.9 and nfsroot-install
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jun 21, 2001 at 02:43:42AM +0200, Gregor Anders wrote:
> Hi everyone,
> 
> now i grabbed 0.9 pa-rias linux and tried to install it on an 712/60 with
> nfsroot. Both, serial and sti fail.... they do not give the option to mount
> root via nfs. When i try to mount it manually, i can see the the request is
> authentificated on my nfsroot-server, but my hp712 crashes and i cannot do
> anything. Does anyone have any idea ? Does anyone have an 0.9 base.tgz with a
> recent lifimage ???

Debian woody release doesn't have base.tgz any more.  Instead dbootstrap,
the installer, invokes debootstrap, which "downloads" the required .debs
from somewhere and uses those debs to build the target system.  "download"
might mean from a cdrom, http, or an nfs mounted file system, for example.

I have done installs where I booted the lifimage over the network, and
then used nfs to access the .debs, while installing to a local disk.

I havn't tried to install on to an nfs mounted root file system; I doubt
that anyone has.  The reason it doesn't offer you the choice is probably
because I didn't define NFSROOT in the boot-floppies build, sorry :(
That might also explain your crash.  I've turned it on for the next release.

The lack of a base.tgz in debian woody has been noted on debian-boot
mail list as a problem, especially for the embedded world, where they
have used it in the past as an easy way to create an nfsroot.  No real
solution has emerged yet though.  If you have a functional parisc
system, then you can run debootstrap manually to create something
similar to base.tgz.

Another option being discussed atm is to add a feature where you can
download a tarball of the required base debs, and then get the debootstrap
to "download" from the tarball - helps some people, but not relevant to
your problem.

Richard
