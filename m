Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67BF34829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 20:42:10 -0700 (MST)
Date: Sat, 8 Mar 2003 20:42:04 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200303090342.UAA17294@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: davem@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: RFC: mmap patch
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

>
> Yes, the {copy,clear}_user_page() thing is an optimization for
> handling of cache alias issues wrt. anonymous pages.
>
I already implemented that solution on the parisc port. Well actually
only half :-). I implemented both the copy and clear user page optimizations,
but later on disabled the copy_user_page solution. I can't remember the
exact details of the problem. Based on a comment I wrote, it seems that in
some cases copy_user_page was being used for something that was going to
be executed. I can't remember the exact scenario, since copy_user_page
is only called in copy-on-write situations.

The problem is that since we have split I and D caches, the cache would
need to be flushed anyway so that the instructions could be seen for
execution.  So it didn't make any sense to set up the temporary
translation and then flush it anyway; better to just do it through the
kernel translation and flush.  I believe this isn't a problem on sparc64
because of the write-through cache.

> The PA-RISC mmap/write bug is something entirely different,
> flush_dcache_page() just isn't doing what it is defined to
> do :-)

Ok.  But looking at the sparc64 implementation of flush_dcache_page I
don't see any code to traverse user vma's.  Is there some other
architecture specific trick that is being used to flush any user mappings
that are mapped to the same physical address as the kernel address?

John Marvin
jsm@fc.hp.com
