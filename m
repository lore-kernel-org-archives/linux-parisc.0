Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA20951
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 04:43:14 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel2.hp.com (Postfix) with ESMTP id ABE6D3CD
	for <parisc-linux@thepuffingroup.com>; Tue,  3 Oct 2000 04:43:48 -0600 (MDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id EAA22895 for parisc-linux@thepuffingroup.com; Tue, 3 Oct 2000 04:44:05 -0600 (MDT)
Date: Tue, 3 Oct 2000 04:44:05 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200010031044.EAA22895@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] flush_icache_range problem
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> Added a flush of the data cache after copying a module from userland to
> kernel land.  I guess that without this the module code is still in the
> data cache and hasn't been flushed through to memory.  Maybe copy_from_user()
> should flush caches really (as it used to do).

No, copy_from_user should not be doing any cache flushing. EVERY other
call, except for this case, does not need, and would suffer from,
flushing the cache.

The problem here is that data is being brought in from user land to
be executed in the kernel. Since PARISC has separate I&D caches, the
data has to be pushed out from the data cache, and the instruction
cache has to be invalidated so that the instructions will be read
into the I cache.

sys_init_module() calls flush_icache_range() to solve this problem.  The
problem is that the current implementation is only flushing the icache,
where it should be flushing the dcache first (As does other
implementations on other architectures where it is necessary) .  Of
course, other parisc cache routines are using flush_icache_range assuming
it is only flushing the icache. This could be easily hacked, but I am
reluctant to spend any time applying more bandaids.

So, adding the dcache flush is an acceptable workaround for now, and if I
forget to remove it when I fix the cache management code, we will catch it
when we prepare for the upstream merge.

I am well aware that system performance sucks, due to the cache management
code flushing everything all the time, and I intend to fix it.  But,
stability is more important to me than performance right now.  I will work
on proper cache management once I stop finding easily reproducible system
crashes (e.g. simply doing a large cpio from nfs root to a scsi disk on an
A180 HPMC's the machine every time).  I didn't realize that
flush_icache_range was broken, since I thought that everything had been
reverted back to flushing everything and missed the difference.  This
looks like the only case where it matters though, since the other callers
of flush_icache_range are there for aout support.

John Marvin
jsm@fc.hp.com
