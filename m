Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA29857
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jul 2000 16:30:43 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by atlrel1.hp.com (Postfix) with ESMTP id 0B728136
	for <parisc-linux@thepuffingroup.com>; Thu,  6 Jul 2000 18:32:07 -0400 (EDT)
Received: from noam.fc.hp.com (noam.fc.hp.com [15.1.52.69])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 50A404FD82
	for <parisc-linux@thepuffingroup.com>; Thu,  6 Jul 2000 18:32:06 -0400 (EDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13AKCq-0006KR-00
	for <parisc-linux@thepuffingroup.com>; Thu, 06 Jul 2000 16:33:16 -0600
To: parisc-linux@thepuffingroup.com
Date: Thu, 06 Jul 2000 16:33:16 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E13AKCq-0006KR-00@noam.fc.hp.com>
Subject: [parisc-linux] userspace
List-ID: <linux-parisc.vger.kernel.org>


Check out ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/
for a bunch of user-space applications including a native compile tool
chain.  The more recent of these tarballs aren't in Matt's NFS roots
so you'll have to add them yourself.

I just fixed a problem in our implementation of the brk() syscall in
glibc, but most of the userspace apps are built with the broken brk()
which amazingly doesn't seem to bother them much.

In misc-utils.tgz are a bunch of handy things like ifconfig, make, and
ash which are placed in /usr/local/bin because some of them were built
using nasty hackery.  If you 'ln /usr/local/bin/ash /bin/sh' quite
a lot of interesting things start to happen in user space.  I've seen
most of a configure script work (core dumps in gcc stopped it) for
example.

OH, and the current cross compiler can be had by unpacking
ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20000705.tgz
followed by
ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-patch-20000706.tgz
to pick up the libc.a with brk() fixed.
This tool chain is prior to any of the brokenness dhd mentioned.

	-Paul Bame
