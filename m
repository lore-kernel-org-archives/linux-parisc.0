Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA08412
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Nov 2000 03:36:36 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by palrel3.hp.com (Postfix) with ESMTP id 56D80187
	for <parisc-linux@thepuffingroup.com>; Wed,  1 Nov 2000 02:38:13 -0800 (PST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id DAA17270 for parisc-linux@thepuffingroup.com; Wed, 1 Nov 2000 03:35:49 -0700 (MST)
Date: Wed, 1 Nov 2000 03:35:49 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011011035.DAA17270@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: space registers
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:

> a small optimisation just occurred to me.
>
> right now, when we switch to kernel space, we set all of sr4-sr7 to 0
> (for the kernel mapping).  we don't need to do that since the kernel is
> entirely in sr7's domain.  this has the added bonus that badly written
> drivers which blindly dereference userspace pointers will work on
> parisc as well as x86.  we can also lazily restore sr4-6 on exit from
> kernel space if we're switching back to the same task which called us.
> this optimisation may not be worthwhile, but i think setting sr4-6
> on entry to the kernel is unnecessary.

True for now.  But it won't always be true.  It is a desired goal to be
able to support large (~3.5 Gb) physical memory for the 32 bit port.  To
do this we will move the kernel down to around virtual address 0, so the
kernel address space will then be controlled by sr4, and depending on the
amount of physical memory in the machine, possibly sr5, sr6, and sr7.  We
could do this based on a test of the amount of physical memory in the
machine, but once you load something from memory to do the test, and then
actually do the test, you wouldn't have any advantage over just writing
zero's to the space registers.

This might be worth considering for the 64 bit port, since both the kernel
and user space will reside entirely within the linear address space
covered by sr4 (We would have to go to a 1 Mb page size to be able to
support greater than a 62 bit address space with three level page tables).
sr5,sr6, and sr7 will only be used when we are running 64 bit HP-UX
processes (with its address space broken up into 4 segments).  Note that
since we just store the users space in sr3 while we are in the kernel, its
not clear that any kind of test with a branch would be a performance gain,
especially if it required that we load something from memory to do that
test.  We may be able cover this by managing sr5, sr6 and sr7 only in the
HP-UX specific parts of the syscall path.

John
