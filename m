Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53BD3482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 07:25:11 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id 4B3271F62A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 09:22:43 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id HAA21981
	for parisc-linux@lists.parisc-linux.org; Thu, 25 Oct 2001 07:25:10 -0600 (MDT)
Date: Thu, 25 Oct 2001 07:25:10 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200110251325.HAA21981@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] re: new cd-images any time soon?
List-ID: <linux-parisc.vger.kernel.org>

>
> Albert & group,
>
> I have not given up on the "loop on LDCW" problem you have found, but...
>
> It is not likely that I will have the changes ready in time for the next iso.
>
> I do have the LDCW target word being put into .o files with proper alignment,
> with or without initialization.
> I DO NOT have the change cleanly intigrated into the source.
>
> Mike

Mike,

We already use an align attribute for the lock word, so the lock word is
automatically aligned properly for global and static storage.  So the
proper alignment for global and static values should already be the case
for .o files.  The problem is that the compiler ignores the align
attribute for automatic storage (i.e. values on the stack). The only
time I saw problems after the kernel was fixed is when a ldcw was done
on a non properly aligned lockword on the stack.

Alan Modra has produced a gcc patch that should fix the problem for
automatic storage.  I'm not sure what the status of getting that patch
into the distribution is.  I sent the patch to Randolph Chung with the
hope that he could at least test the patch to make sure that it didn't
break glibc.  Once gcc is patched, a new glibc needs to be built with it,
and we have only recently made significant progress towards that goal
due to a variety of recent bug fixes.

So anyway, it is possible that the fix will be in the 0.9.3 iso, but it
is not guaranteed. The good news is that we do have a known fix, and
it is the most desirable solution of the various ones I proposed.

John Marvin
jsm@fc.hp.com
