Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD5584829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Oct 2002 06:51:05 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 186Wlo-0007Z1-00; Tue, 29 Oct 2002 13:51:00 +0000
Date: Tue, 29 Oct 2002 13:51:00 +0000
From: Matthew Wilcox <willy@debian.org>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19-pa24 (uaccess.h patch)
Message-ID: <20021029135100.X27461@parcelfarce.linux.theplanet.co.uk>
References: <200210290555.WAA12774@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200210290555.WAA12774@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Mon, Oct 28, 2002 at 10:55:02PM -0700
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

On Mon, Oct 28, 2002 at 10:55:02PM -0700, John Marvin wrote:
> I didn't get them confused in the way you think.  I knew that you were
> proposing using kmap/kunmap to solve the flushing/aliasing issues,
> especially on stretch.  But I saw your todo message suggesting the use of
> zone_highmem for getting back the 256Mb.  My 2.4 based understanding is
> that the kernel kmaps memory in that zone in order to use it.  That may no
> longer be true on 2.5 (or may not ever have been true in the first place).

That's true.  It's only available for allocation to requests that have
__GFP_HIGHMEM set, ie those that specify GFP_HIGHUSER.  And all those
users kmap it to ensure that it's addressable.  But that includes almost
all the allocations done to give ram to userspace, so I suspect this zone
will be exhausted long before the othr zones.

As an existance proof, people really do run x86 boxes with 15GB of
ZONE_HIGHMEM and 800MB of ZONE_NORMAL, and it works for most workloads.
The exceptions are things like 1000 oracle processes mmaping 2GB each.
They run out of ZONE_NORMAL because ptes are still allocated from there.

> I'll be looking at that immediately, since I have to either merge the
> virtual mem map stuff into 2.5, or see if the vm changes with respect to
> zones will solve the problem as you suggest. Whatever works for ia64
> will probably also work for parisc, since the problem is similar (although
> a little more extreme on ia64).

Yep.  The worst case is 1GB of ZONE_DMA and 3GB of ZONE_HIGHMEM, which
is still not as bad as x86 gets.  Of course, kmap is still a nop since
we can still address the "highmem".  I do think the zones need to be
redesigned a bit; they're still too x86-centric.  There might still be
time for that before 2.6...

> I'm also looking at a potential problem in parisc's return from
> syscall/faults.  I'll hopefully fix all the above soon.  And yes, I'll
> merge it into 2.5 also.

Great, thanks!

-- 
Revolutions do not require corporate support.
