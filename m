Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8071E4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Feb 2003 19:11:35 -0700 (MST)
Message-Id: <200302090211.h192BWYl012933@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
To: tausq@debian.org
Date: Sat, 8 Feb 2003 21:11:32 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030209005608.GR11363@tausq.org> from "Randolph Chung" at Feb 8, 2003 04:56:08 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > lock(l1)
> > do something
> > unlock(l1)
> > 
> > lock(l2)
> > do something else
> > unlock(l2)
> > 
> > will gcc ever move the lock(l2) before the unlock(l1)? 
> 
> well, bad example, since l1 and l2 are both volatile, but in general,
> nothing will prevent part of "do something else" to happen inside the l1
> lock, right?

Volatile would stop gcc from moving code across either the lock or the unlock.
A blockage is in fact implemented as an UNSPEC_VOLATILE instruction.
The PA 8000 has a large reorder buffer, so there are similar issues.
It's guaranteed that instructions will appear to execute in order on a
processor but the memory updates as viewed from another processor may
occur out of order.  To ensure that other processors have a consistent
view of whats happening, one must use ordered instructions for the lock
and unlock operations.  This will force all stores and loads inside the
lock to complete.  Further, if cache flush operations occur inside
a lock, you must also do a "sync" before unlocking to ensure that these
operations complete.  The ldcw insn is strongly ordered.  A load and
store on PA 2.0 can be made ordered with the correct completer.  Cache
flush operations are weakly ordered.  On PA 1.x, all load and store
instructions are strongly ordered, so ordering isn't an issue.

The current spinlock reset is done in high-level C.  So, gcc can move code
that that isn't dependent across the reset.  PA 2.0 processors can also do
the same.

Appendix G describes ordering in much more detail.  Hopefully, I haven't
butchered what's said there too badly.

The reordering that GCC does is conditional on instruction dependencies.  I
just reworked the handling of the PIC register restore in PIC code
because all the PIC register were not apparent in the initial scheduling
pass.  This is in 3.3 and main, but not 3.2.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
