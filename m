Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 907924A19
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Feb 2001 08:09:22 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id CA532C9D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Feb 2001 10:09:21 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id IAA08530 for parisc-linux@lists.parisc-linux.org; Fri, 9 Feb 2001 08:09:21 -0700 (MST)
Date: Fri, 9 Feb 2001 08:09:21 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200102091509.IAA08530@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] nscd and new glibc on parisc-linux
List-ID: <linux-parisc.vger.kernel.org>

I checked in changes to fix the clone system call into our local cvs copy
of glibc. HOWEVER, you should not build a new glibc and install it at
this point, unless you move /usr/sbin/nscd out of the way (and a
"make install" of glibc will put another one in its place, so do the
move after the install).

The problem is that nscd uses pthreads. Before the clone system call
was fixed, pthread_create() failed in a way that was not fatal to
nscd. Now pthread_create() core dumps, because the pthread library
routines currently have hard coded assumptions about which direction
the stack grows. I'll be fixing that in the near future.

If you leave nscd in place you will not be able to log in to your
machine. If you are using an nfs root you can fix this, but it will
be a little more difficult to fix if you are booting off of a local
disk.

John
