Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA09070
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Mar 2000 10:45:10 -0700
Received: from xboibrg1.boi.hp.com (xboibrg1.boi.hp.com [15.56.8.167])
	by atlrel1.hp.com (Postfix) with ESMTP id BEE2CE4E9
	for <parisc-linux@thepuffingroup.com>; Tue, 14 Mar 2000 11:46:20 -0500 (EST)
Message-ID: <56D553C0B61BD311AD2300A0C9F485C2038D103D@xfc02.fc.hp.com>
From: "MEYER,ALAN C. \(HP-FtCollins,ex1\)" <alan_meyer@hp.com>
To: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Date: Tue, 14 Mar 2000 09:46:18 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] FW: Linux-2.3.x cache coherency issues, proposed new architecture
List-ID: <linux-parisc.vger.kernel.org>

Here is a message from David Miller about proposed changes in 2.3 around VM
interfaces & cache coherency.

PA/Linux is not on the list and we should get our input to David.

It would be nice to have a single point of contact to David for the PA/Linux
view.

Matthew, John, Grant - one of y'all?

Alan

-----Original Message-----
From: David S. Miller [mailto:davem@redhat.com] 
Sent: Tuesday, March 14, 2000 2:53 AM
To: davem@redhat.com
Cc: cort@fsmlabs.com; rmk@arm.linux.org.uk; rth@cygnus.com;
paulus@linuxcare.com; anton@progsoc.uts.edu.au; jakub@redhat.com;
Jes.Sorensen@cern.ch; ralf@uni-koblenz.de; davidm@napali.hpl.hp.com;
gniibe@m17n.org; kkojima@rr.iij4u.or.jp
Subject: Linux-2.3.x cache coherency issues, proposed new architecture



Hello port maintainers,

Now that the page cache is really unified in 2.3.x I would
like to properly deal with some cache coherency issues and
kill a lot of old and poorly designed cruft we have in the
architecture-defined VM interfaces.

First, we have to start from what the issues are for
various architectures.  I list what I am decently aware of
below.  If your port is missing or your port is listed
but questions appear in it's section, _please_ fill me
in so I can be more knowledgable about your port for the
purposes of the proposed changes below.

IA64:

	I-cache aparently cannot see DMA activity?
	Or is it blind only to local cpu stores?

Sparc64:

	I-cache cannot see local cpu stores.

	D-cache is virtually indexed, and the most significant
	indexing bit is (1 << PAGE_SHIFT).  This creates a situation
	where illegal aliases can enter the cache if multiple mappings
	of a physical page are not all mapped at virtual addresses
	with bit "(1 << PAGE_SHIFT)" being the same.

Sparc:

	sun4c: Cpu has shared I/D cache which is virtually indexed
	       and virtually tagged (with mmu context info as well).
	       It is 64K (which is > PAGE_SIZE) and thus has the same
	       cache alias issues as sparc64's D-cache.

	       When mmu/tlb mappings are removed, all cache entries
	       referring to that mapping must be removed first.
	       The cpu will take an exception otherwise.  The reason
	       is that in order to perform a write-back properly,
	       the cpu must be able to get a virt->phys translation
	       from the tlb since the cache does not use physical
	       addresses in it's tags.

	sun4m: So many combinations of virtually indexed, physically
	       indexed, split I/D, split I/D + combined L2, coherent
	       with DMA, not coherent with DMA, etc. cache setups that
	       I don't even want to list them all.

MIPS:	Most R4x00 variants have the virtually indexed cache illegal
	alias issue.  In fact, many of the r4x00 chips will actually
	signal an exception if you create an illegal alias situation
	(ie. 2 lines exist in the cache at the same time which refer
	 to the same physical data)

Below I outline the first set of interfaces I'd like to put
into the kernel to definitively catch all kernel side cpu
accesses to page cache pages.  They are designed such that
you can do whatever you want, to deal with whatever problem
you have wrt. user vs. kernel views of physical pages wrt.
cache coherency or whatever.  Also, they are designed such that
ports which have totally coherent caches pay no performance
penalty whatsoever.

All other data transfers not caught by these interfaces below
are assumed to be done via "DMA".  And in such a case you need
to be aware of and deal with two cases:

1) CPU is not coherent with DMA activity, in which case your
   {pci,sbus,zorro,etc}_{map,unmap}_{single,sg}() implementation
   must take care of it.

2) PIO data transfers.  In this case you must make your
   {in,out}s{b,w,l}() implementation do whatever cache flushing
   is needed.

This, along with a proper setting of SHMLBA in asm/shmparam.h
should take care of all cache coherency issues imaginable to
mankind :-)

============================================================

/* Suggested page cache data transfer interfaces. */

/* Copy LEN bytes from kernel address KADDR to
 * kernel address (TO_PAGE + OFFSET).
 */
copy_page_cache_fromkernel(to_page, offset, kaddr, len);

/* Copy LEN bytes from kernel address (FROM_PAGE + OFFSET)
 * to kernel address KADDR.
 */
copy_page_cache_fromkernel(kaddr, from_page, offset, len);

/* Copy LEN bytes of data from user-space address UADDR
 * to kernel address (TO_PAGE + OFFSET).
 */
copy_page_cache_fromuser(to_page, offset, uaddr, len);

/* Copy LEN bytes of data from kernel address (FROM_PAGE + OFFSET)
 * to user-space address UADDR.
 */
copy_page_cache_touser(uaddr, from_page, offset, len);

/* Clear all PAGE_CACHE_SIZE bytes of kernel page PAGE. */
clear_page_cache(page);

/* Clear LEN bytes at kernel address (PAGE + OFFSET). */
clear_page_cache_partial(page, offset, len);

/* If local processor stores into a page cache page have
 * been via some mechanism _other_ than the above copy/clear
 * interfaces, the following must be invoked on PAGE before
 * it is marked "uptodate" by the kernel.
 */
flush_page_cache_page(page);

============================================================

Also, I have just submitted a patch to Linus which adds
a "vaddr" user virtual address argument to clear_page()
and copy_page().  (BTW, this allows a performance optimization
as well as a way to assist in virtual cache alias prevention,
since you know the user space virtual address you can create
a temporary local-cpu mmu mapping of the pages involved such
that the address at which you perform the copy loads and stores
is congruent to the cache lines the user space mapping will reference
them by, and if you have a clever software replacable tlb you
can just load these mappings by hand before the copy, save
away the tlb entries which were there before you started, and
restore the original mappings after the copy.  This allows to
handle page copy and clear operations with zero tlb activity
around the operations.  Sparc64 does just this in
arch/sparc64/lib/blockops.S and I intend to make various flavors
of sparc32 do something similar very soon.)

The above interfaces should allow a complete kill of
flush_page_to_ram() from the set of public interfaces.
I believe with some care it can also allow flush_icache_page()
to die.  The two interfaces mentioned in this paragraph are
very vague, and most people don't know what they even do
anymore or where the proper place is to make use of them.
Furthermore they can lead to inefficient ports, for cases
where one only needs to flush (certain) caches in some cases
but not everywhere flush_page_to_ram or flush_icache_page
are actually invoked.

Please send me commentary and suggestions as soon as possible
so that I can whip up the implementation of these ideas
and submit them to Linus "very soon". :-)

Thanks.

Later,
David S. Miller
davem@redhat.com
