Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC4524829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Mar 2003 07:31:50 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18qwPV-00076F-00; Thu, 06 Mar 2003 14:31:49 +0000
Date: Thu, 6 Mar 2003 14:31:49 +0000
From: Matthew Wilcox <willy@debian.org>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, davem@redhat.com
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030306143149.B1549@parcelfarce.linux.theplanet.co.uk>
References: <200303061414.HAA26321@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200303061414.HAA26321@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Thu, Mar 06, 2003 at 07:14:53AM -0700
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

On Thu, Mar 06, 2003 at 07:14:53AM -0700, John Marvin wrote:
> In my opinion this patch is a hack workaround for a real bug. parisc is
> not the only architecture that has virtual tagged caches.  Some mips
> machines, sparc and ultrasparc machines have virtual tagged caches,
> although none of them have virtual tagged caches as large as parisc (the
> other architectures typically have a larger physical cache at a higher
> level in the cache hierarchy).
> 
> Dave Miller designed the cache flushing strategy to have hooks in the
> machine independent code to support virtual tagged caches.  Probably there
> is simply a cache flush that is missing that doesn't show itself as a bug
> as easily on the smaller virtually tagged caches of the other
> architectures. At most this particular scenario wasn't considered
> for virtual tagged caches (maintaining coherence between fd writes and
> mmap'ed regions) and will require a design change to fix.
> 
> The fix for this bug should be made in machine independent code, not in
> our machine dependent code.

Unfortunately, the flush is in the right place according to the
definition.  Here's how it looks in 2.4 (2.5 is more complex but has
essentially the same flush in it):

generic_file_write(struct file *file,const char *buf,size_t count, loff_t *ppos)
{
[...]
                kaddr = kmap(page);
                status = mapping->a_ops->prepare_write(file, page, offset, offse
t+bytes);
                if (status)
                        goto sync_failure;
                page_fault = __copy_from_user(kaddr+offset, buf, bytes);
                flush_dcache_page(page);
                status = mapping->a_ops->commit_write(file, page, offset, offset
+bytes);

So our flush_dcache_page() flushes the kernel's view of that page,
no problem.  Memory now has the right contents.  But the dcache still
has the stale data in it for the user's mapping of the same page.

There's a few ways to fix it.

1) This patch tausq did.  Now we flush both user & kernel mappings for the
data.

2) Split flush_dcache_page into flush_dcache_page_user_mapping() and
flush_dcache_page_kernel_mapping().  Hopefully with better names.

3) (ab)use kmap to hand back an address which virtually aliases the user
mapping.  flush_dcache_page() would only have to writeback to memory if
the page was not mapped.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
