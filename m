Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3DF764829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Mar 2003 14:51:38 -0700 (MST)
Date: Sun, 09 Mar 2003 13:29:49 -0800 (PST)
Message-Id: <20030309.132949.19248296.davem@redhat.com>
To: jsm@udlkern.fc.hp.com
Cc: parisc-linux@lists.parisc-linux.org
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <200303090342.UAA17294@udlkern.fc.hp.com>
References: <200303090342.UAA17294@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

   From: John Marvin <jsm@udlkern.fc.hp.com>
   Date: Sat, 8 Mar 2003 20:42:04 -0700 (MST)

   The problem is that since we have split I and D caches, the cache would
   need to be flushed anyway so that the instructions could be seen for
   execution.  So it didn't make any sense to set up the temporary
   translation and then flush it anyway; better to just do it through the
   kernel translation and flush.  I believe this isn't a problem on sparc64
   because of the write-through cache.
   
Handled on sparc64, when TIF_BLKCOMMIT flag is set, we use a more
expensive block store instruction in {copy,clear}_user_page() which
while more expensive does keep the instruction cache up to date.

More modent sparc64 chips don't even need this as the store stream
of the cpu is fully snooped by the instruction cache.

   > The PA-RISC mmap/write bug is something entirely different,
   > flush_dcache_page() just isn't doing what it is defined to
   > do :-)
   
   Ok.  But looking at the sparc64 implementation of flush_dcache_page I
   don't see any code to traverse user vma's.  Is there some other
   architecture specific trick that is being used to flush any user mappings
   that are mapped to the same physical address as the kernel address?
   
On sparc64 we can remove an arbitrary "physical" page from the D-cache
in one pass.  It does not matter what virtual address they use.

So it is handled, you just don't understand the hardware :-)

Because the chip has this interface, we need not walk the VMA list.
