Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53363482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 May 2001 22:50:47 -0600 (MDT)
Date: Tue, 29 May 2001 22:50:46 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200105300450.WAA08392@udlkern.fc.hp.com>
To: amodra@one.net.au
Cc: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Using r2 for millicode return pointer
List-ID: <linux-parisc.vger.kernel.org>

Alan,

I am cc'ing parisc-linux also, since there are other parisc gcc experts
who may have an opinion on this. For those new to this, I found a
bug where a procedure calls millicode, which on Linux uses r2 as
a return pointer, however, gcc wasn't aware of that.

It looks like the cause of this bug is that we changed the return
pointer for millicode from r31 to r2. Was this a deliberate choice?

On HP-UX, millicode uses r31 for a return pointer.  This allows leaf
routines to call millicode without having to save r2.  I notice that the
code that you patched has a clobber for r31, which is not necessary
(currently) for Linux.  Is this code shared with the HP-UX version of gcc?
If not, we should remove the r31 clobbers, since they are unecessary and
will allow more efficient usage for r31.

If this code is shared, perhaps that would be another motivation for
changing the Linux copy of the millicode to use r31, if possible (I
don't know what the motivation for using r2 was, so I don't know if
this is reasonable).

John

P.S. Thanks for the quick fix!
