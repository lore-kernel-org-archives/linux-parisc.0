From: Russell King <rmk@arm.linux.org.uk>
Subject: [parisc-linux] "vmalloc", friends and GFP flags
Date: Wed, 1 Jan 2003 21:49:33 +0000
Message-ID: <20030101214933.A26434__16167.791610542$1416622062$gmane$org@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-xfs@oss.sgi.com, parisc-linux@parisc-linux.org
To: linux-kernel@vger.kernel.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

This mail is being copied to the XFS and PARISC mailing lists.  You should
probably trim the reply list as appropriate.

I've just been looking over the state of the ARM {dma,pci}_alloc_consistent
wrt interrupts etc in 2.5.53, and decided to have a look around this area
for other users.  I stumbled across the following unsafe areas.

a) parisc.  Looking at pa11_dma_alloc_consistent:

   pa11_dma_alloc_consistent
	-> map_uncached_pages
		-> (eventually) map_pmd_uncached
			-> pte_alloc_kernel
				-> pte_alloc_one_kernel

	static inline pte_t *
	pte_alloc_one_kernel(struct mm_struct *mm, unsigned long addr)
	{
	        pte_t *pte = (pte_t *) __get_free_page(GFP_KERNEL);
        	if (likely(pte != NULL))
	                clear_page(pte);
        	return pte;
	}

   End result is that if pa11_dma_alloc_consistent() is called from
   IRQ context, parisc calls __get_free_page using GFP_KERNEL.
   Calling __get_free_page with GFP_KERNEL from IRQ context appears
   to be unsafe (always has been.)

b) xfs. XFS contains this bit of code:

	static __inline unsigned int flag_convert(int flags)
	{
		...
	        if (flags & KM_NOSLEEP)
        	        return GFP_ATOMIC;
	        /* If we're in a transaction, FS activity is not ok */
        	else if ((current->flags & PF_FSTRANS) || (flags & KM_NOFS))
	                return GFP_NOFS;
        	else
	                return GFP_KERNEL;
	}

	void *kmem_alloc(size_t size, int flags)
	{
		...
                rval = __vmalloc(size, flag_convert(flags), PAGE_KERNEL);
		...
	}

   Ok, so xfs can pass GFP_ATOMIC, GFP_NOFS and GFP_KERNEL to __vmalloc.
   However, do these flags actually ensure what they suggest they do?

   Lets look at __vmalloc:

	void *__vmalloc(unsigned long size, int gfp_mask, pgprot_t prot)
	{
		...
        	area = get_vm_area(size, VM_ALLOC);
		...
	}

   and get_vm_area:

	struct vm_struct *get_vm_area(unsigned long size, unsigned long flags)
	{
		...
        	area = kmalloc(sizeof(*area), GFP_KERNEL);
		...
	}

   Also, look at the PMD and PTE allocation functions, which also use
   GFP_KERNEL.

   Answer to the above question: no.  Is this unsafe?  Probably.

Now, what does this all have to do with ARM and pci_alloc_consistent.
It's the same problem, only I have a BUG_ON() in there to catch uses
from IRQ context, which needs to disappear eventually.  (This is
mainly a requirement for USB to work.)

However, before this can happen, I believe I'd need the following:

1. allocation of vm areas (via get_vm_area and friends) needs to become
   IRQ-safe.

   - vmlist_lock needs to become IRQ safe (but its held during vread/vwrite)
   - kmalloc of vm_structs needs to have gfp flags passed in

2. allocation of page tables (via pmd_alloc_kernel / pte_alloc_kernel)
   needs to become IRQ-safe.

   - pmd_alloc_kernel / pte_alloc_kernel needs to have gfp flags passed in
   - map_vm_area would also need gfp flags

The same solution also fixes the two instances described above.

I suspect, however, that the vmlist_lock change will be unacceptable
to many people however.  This doesn't affect XFS nor parisc, but would
mean that I'd need to completely rewrite the ARM consistent memory
allocation to use none of the above (which I think is the right
approach, but means _all_ of the above becomes S.E.P. 8))

-- 
Russell King (rmk@arm.linux.org.uk)                The developer of ARM Linux
             http://www.arm.linux.org.uk/personal/aboutme.html
