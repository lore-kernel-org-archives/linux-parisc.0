Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94E8A48F3
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Sep 2001 00:38:09 -0600 (MDT)
Date: Sun, 30 Sep 2001 00:38:08 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200109300638.AAA13665@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: tsbogend@alpha.franken.de
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] shm cache flush bug?
List-ID: <linux-parisc.vger.kernel.org>

Thomas,

> PS: If someone wants a testcase, which shows the shm cache flush bug,
> either use mm_test from libmm or mail me, I've written a small one.

I would be interested in this test case. I had to back out your fix.
It is definitely not the right way of fixing whatever problem you are
encountering. Your fix killed performance, particularly on large
cache machines, essentially returning us to a "flush everything at
all times" mode of operation.

Here are the reasons that your fix is incorrect:

1) There is an "old" way of handling cache flushing, and a "new" way.
flush_page_to_ram() is part of the "old" way, and is deprecated (see
Documentation/cachetlb.txt).  We've implemented the "new" way for the
parisc port, so any fix should be consistant with that design.

2) You made flush_page_to_ram() call flush_data_cache(), which flushes the
entire cache, rather than flushing the specified page. flush_page_to_ram()
is called in a variety of places, and your change caused the entire cache
to be flushed every time, so this kills performance.

I will note that the new method of flushing was primarily tested on the
sparc architecture, and since they have either a write-through cache, or a
very small write-back cache, they missed some things, some of which I have
already found and fixed on the parisc port.

The workaround fix for your problem will probably involve flushing a
specific page.  Since the problem you are seeing is related to System V
shared memory, the missing flush is probably missing from mm/shmem.c.
Possibly a call to flush_dcache_page() in shmem_nopage() in the two
locations where flush_page_to_ram() is called might fix the problem,
although I don't see a problem with that code.  Adding a flush there might
at least workaround the problem until the bug can be tracked to a real
root cause.  Let me know if you try that and whether or not it does fix
the problem.

The correct fix may be the same as the workaround, but could be due to
some other problem.  Your report seems to indicate a problem upon first
allocation of a shared memory page, but if it is instead a problem when
the second program attaches the shared memory, the problem could be due to
a bug in the address allocation code, perhaps creating a bad user alias
between processes.

John Marvin
jsm@fc.hp.com
