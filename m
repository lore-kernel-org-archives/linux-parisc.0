Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id E28184829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 22:55:05 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel9.hp.com (Postfix) with ESMTP id 99D7CE00547
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Oct 2002 00:55:02 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id WAA12774
	for parisc-linux@lists.parisc-linux.org; Mon, 28 Oct 2002 22:55:02 -0700 (MST)
Date: Mon, 28 Oct 2002 22:55:02 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200210290555.WAA12774@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19-pa24 (uaccess.h patch)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Well.. if you're interested in working on PA again, I have 3 ideas which
> kind of overlap (you seem to have confused two of them, so it's worth
> talking about them all):

I didn't get them confused in the way you think.  I knew that you were
proposing using kmap/kunmap to solve the flushing/aliasing issues,
especially on stretch.  But I saw your todo message suggesting the use of
zone_highmem for getting back the 256Mb.  My 2.4 based understanding is
that the kernel kmaps memory in that zone in order to use it.  That may no
longer be true on 2.5 (or may not ever have been true in the first place).
I'll be looking at that immediately, since I have to either merge the
virtual mem map stuff into 2.5, or see if the vm changes with respect to
zones will solve the problem as you suggest. Whatever works for ia64
will probably also work for parisc, since the problem is similar (although
a little more extreme on ia64).

On another note, I am still looking at the I bit issue with respect to
handle_interruption. What I forgot was that we always turn the I bit
off when we switch to virtual mode before calling handle_interruption.
So, the I bit needs to be on for user faults at the very least. That is
why I put that code in there.

However, Grant is right in that there is a hole if the kernel faults with
the I bit off.  Normally that would be a bug, i.e. there are few valid
reasons for the kernel to fault with the I bit off (what I mean by fault
in this case is something that makes it to handle_interruption, not
something that gets handled at a lower level, like a tlb miss).  But, I
can think of a few possible scenarios where it might be happen
legitimately, although I don't know if any actually occur.

The right solution is to restore the I bit to whatever it was at the time
of the fault.  That is probably more appropriately handled at virt_map
time (add a register argument to the macro holding the desired I bit
state, call with r0 for intr_extint, call with previous masked value from
ipsw for intr_save).  I believe if done right, we can also set things up
properly in hpmc.S so that when it calls intr_save, the I bit won't be
turned on, and we can remove the special case code from handle_interruption.

I'm also looking at a potential problem in parisc's return from
syscall/faults.  I'll hopefully fix all the above soon.  And yes, I'll
merge it into 2.5 also.

John
