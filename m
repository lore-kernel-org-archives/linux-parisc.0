Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id XAA16896
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 23:49:00 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id BAF9711E
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 01:51:15 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id XAA13575 for parisc-linux@puffin.external.hp.com; Tue, 21 Nov 2000 23:50:03 -0700 (MST)
Date: Tue, 21 Nov 2000 23:50:03 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011220650.XAA13575@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


> Better to get our house in order before we patchbomb Linus, I think.
> Renames are hard enough in CVS; renames in diff -u format are a real
> stinker :-)

In that case, we need to do some cleanup first.  I've been lobbying for
the removal of the almost empty arch/parisc/real directory, and its few
remaining valid files moved to the kernel directory.  There are also a
fair number of dead files.  Every file that is not currently involved in
the build should be removed, unless a good case for it remaining can be
made.  If the reason to keep it is not a long term reason, then that file
should not be sent to Linus (It sounds like it is a lot easier to add
files rather than remove/rename them).

If there are any files that are currently in use, but which we know
will eventually be removed, perhaps we should consider what to do with
that file (although I don't know of any files in this category at the
moment).

John Marvin
jsm@fc.hp.com
