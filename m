Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bender.bawue.de (bender.bawue.de [193.197.13.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 55B2C482A
	for <parisc-linux@parisc-linux.org>; Wed, 25 Apr 2001 14:18:33 -0600 (MDT)
Received: from gate.ixs.com (p3E9ED94F.dip.t-dialin.net [62.158.217.79])
	by bender.bawue.de (Postfix) with ESMTP id 521504863D
	for <parisc-linux@parisc-linux.org>; Wed, 25 Apr 2001 22:18:08 +0200 (CEST)
Received: from localhost (andreas@localhost)
	by gate.ixs.com (8.9.3/8.9.3) with ESMTP id WAA25808
	for <parisc-linux@parisc-linux.org>; Wed, 25 Apr 2001 22:18:05 +0200
Date: Wed, 25 Apr 2001 22:18:04 +0200 (CEST)
From: Andreas Thienemann <andreas@thienemann.net>
To: parisc-linux@parisc-linux.org
Message-ID: <Pine.LNX.4.10.10104252215090.25358-100000@gate.ixs.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Even more glibc problems...
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I just can't seem to get a glibc to compile on a hppa box.
The sources are the current CVS checkouts, the build box is booted with
the debian nfsroot 20010404.

The glibc compile fails with the debian compiler and only succeeds with
the CVS compiler 'gcc version 3.0 20010416 (prerelease)'.

Now, doing a make check after building the glibc fails with the following
remark:

make[2]: *** [/mnt/lfs/usr/src/glibc-build/math/test-float.out] Error 1
make[2]: Leaving directory `/mnt/lfs/usr/src/glibc/math'
make[1]: *** [math/tests] Error 2
make[1]: Leaving directory `/mnt/lfs/usr/src/glibc'
make: *** [check] Error 2

Are there some problems with the floating point calculations?

bye,
 andreas
