Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA10096
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Oct 2000 16:22:09 -0600
Received: from puffin (IDENT:bame@localhost [127.0.0.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA10091
	for <parisc-linux@thepuffingroup.com>; Wed, 25 Oct 2000 16:22:02 -0600
Message-Id: <200010252222.QAA10091@puffin.external.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Wed, 25 Oct 2000 16:22:02 -0600
From: Paul Bame <bame@puffin.external.hp.com>
Subject: [parisc-linux] 64/32-bit changes coming
List-ID: <linux-parisc.vger.kernel.org>


I'm about to make a bunch of changes in order to support 32-bit user space
(e.g., what we have now) on wide kernels, and wanted to let people know
what's happening.  My goal is to preserve all the current working 32-bit
userland and kernel code.

In round 1 I'm mostly changing data types which are shared by user space
and kernels which use some form of 'long' to use 'int' instead, since
'int' is the same size in both narrow and wide worlds but 'long' isn't.
(It's obvious that 'long' was used many places to mean 32-bit int, which
is untrue in wide mode) Even though these structs are used by glibc, they
glibc and user apps will be unaffected because the data type sizes aren't
changing.

I probably won't tackle the signal-related data types at first.  It's
possible that it will be desirable to make an incompatible change to
libc for signals but I won't do that without discussion.

Round 2 will be wide kernel changes to start turning on the 32-bit
syscall path probably with a lot of consultation with jsm.

Round 3 will be signals.

I am not addressing hpux syscall-related data types at this time.

	-P
