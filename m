Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC144485F
	for <parisc-linux@parisc-linux.org>; Tue, 12 Mar 2002 19:32:46 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16kyYz-0003tE-00; Wed, 13 Mar 2002 02:32:25 +0000
Date: Wed, 13 Mar 2002 02:32:25 +0000
From: Matthew Wilcox <willy@debian.org>
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Switch console error.
Message-ID: <20020313023225.M30538@parcelfarce.linux.theplanet.co.uk>
References: <3C8E5DCD.942E6278@cup.hp.com> <20020312201309.H30538@parcelfarce.linux.theplanet.co.uk> <3C8E6704.81F14945@cup.hp.com> <20020312204919.I30538@parcelfarce.linux.theplanet.co.uk> <3C8E8520.EC6877E3@cup.hp.com> <20020312225858.A979E38556@carmen.fc.hp.com> <3C8E8A6F.2AD5761C@cup.hp.com> <20020312234838.K30538@parcelfarce.linux.theplanet.co.uk> <3C8E976F.68EEFE04@cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C8E976F.68EEFE04@cup.hp.com>; from gururaj@cup.hp.com on Tue, Mar 12, 2002 at 04:03:59PM -0800
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

On Tue, Mar 12, 2002 at 04:03:59PM -0800, Gururaj Ananthateerta wrote:
> well, this whole exercise was to contribute to parisc linux developement.
> well I got something to work on then.  Can u help me with sime jumpstarters.

sure.  here's the plan i had.  you may disagree...

The architecture guarantees us that pages which are mapped at the same
address, modulo 4MB, will be cache coherent.  We already take advantage
of this (see get_shared_area in arch/parisc/kernel/sys_parisc.c, called
via arch_get_unmapped_area from the mmap path).  So all user mappings of a
page are coherent.  What isn't coherent is the kernel's view of the page.

Before the kernel accesses a page which is in the page cache (all pages
which can be mmaped live in the page cache), it calls kmap() and after
it has finished accessing this page, it calls kunmap().  This scheme was
invented for the benefit of architectures which support more physical
memory then it has address lines for (eg PAE36 on x86).

So if we reserve a large chunk of the kernel's address space to map
page cache pages into temporarily with kmap, we can provide the kernel
with a coherent view of the page.  Superdome only supports 128GB ram,
so by reserving a 128TB chunk of address space (hey, we have plenty of
address space..)  we give each 4k page a 4MB space to be mapped in.

The obvious way to do it, which I've described to everyone up until
now is to do something like:

void *kmap(struct *page) {
	struct vm_area_struct *vma = page->mapping->i_mmap_shared;
	if (!vma)
		return page->virtual;
	return (void *) ((unsigned long) page->virtual << 10 | vma->vm_pgoff);
}

But I wonder whether it might not be feasible to simply adjust
page->virtual when changing the mapping of a page into userspace.
Something to investigate further.

This is the easy part of the solution.  The part I haven't even attempted
to describe is, what if we get a TLB miss?  See the assembly code for the
TLB miss handler in arch/parisc/kernel/entry.S, starting at dtlb_miss_20w:
You'd probably want to modify dtlb_check_alias_20w to check for this case
rather than insert a huge number of TLB entries.

-- 
Revolutions do not require corporate support.
