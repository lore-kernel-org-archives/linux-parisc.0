Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3DF5E4829
	for <parisc-linux@parisc-linux.org>; Fri, 21 Mar 2003 18:20:12 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18wXgA-000166-S3
	for parisc-linux@parisc-linux.org; Sat, 22 Mar 2003 01:20:10 +0000
Date: Sat, 22 Mar 2003 01:20:10 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030322012010.GA31008@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [akpm@digeo.com: arch changes for file-offset-in-pte's]
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

FYI.  jsm, any comments?

----- Forwarded message from Andrew Morton <akpm@digeo.com> -----

Envelope-to: willy@ftp.uk.linux.org
Delivery-date: Fri, 21 Mar 2003 23:52:14 +0000
Date: Fri, 21 Mar 2003 17:56:26 -0800
From: Andrew Morton <akpm@digeo.com>
To: "David S. Miller" <davem@redhat.com>, paulus@au.ibm.com,
        benh@kernel.crashing.org, rth@twiddle.net, davidm@hpl.hp.com,
        ralf@linux-mips.org, schwidefsky@de.ibm.com,
        Russell King
 <rmk@arm.linux.org.uk>, bjornw@axis.com,
        geert@linux-m68k.org, Matthew
 Wilcox <willy@debian.org>,
        gniibe@m17n.org, linux-sh@m17n.org, jdike@karaya.com,
        uclinux-v850@lsi.nec.co.jp
Cc: Ingo Molnar <mingo@elte.hu>, linux-mm@kvack.org
Subject: arch changes for file-offset-in-pte's
X-Mailer: Sylpheed version 0.8.10 (GTK+ 1.2.10; i686-pc-linux-gnu)
X-OriginalArrivalTime: 21 Mar 2003 23:51:17.0829 (UTC) FILETIME=[C3FA4750:01C2F004]


hi,

I'd like to submit Ingo's remap_file_pages() enhancements soon.  His patch
allows pages in "nonlinear" mappings to be reestablished by the kernel's
pagefault handler.

It does this by embedding the page's ->index into the pte which wants to map
the page.  This is arch-specific, and I only have ia32, ppc64 and x86_64 done.

So if&when this hits the tree, it will break other architectures.  It's a
five-minute-fix.

Four things need to be provided:

pte_t pgoff_to_pte(unsigned long pgoff)

    Return a pte_t which contains as many of the lower bits of pgoff as
    you can feasibly pack into a pte.

    You'll probably need to reserve at least two bits - one for
    not-present and one to say "this is a pte_file pte".

unsigned long pte_to_pgoff(pte_t pte)

    Extract the unsigned long from a pte.

int pte_file(pte_t)

    Return true if the pte is a "file pte".  This is where you'll need to
    use the magical reserved bit to distinguish this from a swapped out pte.

PTE_FILE_MAX_BITS	(a constant)

    Tells the kernel how many bits of the file offset the architecture is
    capable of placing in the pte, via pgoff_to_pte().  ia32 sets this to 29
    in non-PAE mode, 32 in PAE mode (CONFIG_HIGHMEM64G)


As an example, here is the x86_64 implementation (the comment next to
_PAGE_FILE is wrong, btw.  These are not swapcache pages)
The ia32 version of this code is right at the start of the the main patch, at

http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.5/2.5.65/2.5.65-mm3/broken-out/remap-file-pages-2.5.63-a1.patch


Thanks.


diff -puN include/asm-x86_64/pgtable.h~file-offset-in-pte-x86_64 include/asm-x86_64/pgtable.h
--- 25/include/asm-x86_64/pgtable.h~file-offset-in-pte-x86_64	2003-03-13 04:45:57.000000000 -0800
+++ 25-akpm/include/asm-x86_64/pgtable.h	2003-03-13 04:45:57.000000000 -0800
@@ -151,6 +151,7 @@ static inline void set_pml4(pml4_t *dst,
 #define _PAGE_ACCESSED	0x020
 #define _PAGE_DIRTY	0x040
 #define _PAGE_PSE	0x080	/* 2MB page */
+#define _PAGE_FILE	0x040	/* pagecache or swap */
 #define _PAGE_GLOBAL	0x100	/* Global TLB entry */
 
 #define _PAGE_PROTNONE	0x080	/* If not present */
@@ -245,6 +246,7 @@ extern inline int pte_exec(pte_t pte)		{
 extern inline int pte_dirty(pte_t pte)		{ return pte_val(pte) & _PAGE_DIRTY; }
 extern inline int pte_young(pte_t pte)		{ return pte_val(pte) & _PAGE_ACCESSED; }
 extern inline int pte_write(pte_t pte)		{ return pte_val(pte) & _PAGE_RW; }
+static inline int pte_file(pte_t pte)		{ return pte_val(pte) & _PAGE_FILE; }
 
 extern inline pte_t pte_rdprotect(pte_t pte)	{ set_pte(&pte, __pte(pte_val(pte) & ~_PAGE_USER)); return pte; }
 extern inline pte_t pte_exprotect(pte_t pte)	{ set_pte(&pte, __pte(pte_val(pte) & ~_PAGE_USER)); return pte; }
@@ -330,6 +332,11 @@ static inline pgd_t *current_pgd_offset_
 #define	pmd_bad(x)	((pmd_val(x) & (~PTE_MASK & ~_PAGE_USER)) != _KERNPG_TABLE )
 #define pfn_pmd(nr,prot) (__pmd(((nr) << PAGE_SHIFT) | pgprot_val(prot)))
 
+
+#define pte_to_pgoff(pte) ((pte_val(pte) & PHYSICAL_PAGE_MASK) >> PAGE_SHIFT)
+#define pgoff_to_pte(off) ((pte_t) { ((off) << PAGE_SHIFT) | _PAGE_FILE })
+#define PTE_FILE_MAX_BITS __PHYSICAL_MASK_SHIFT
+
 /* PTE - Level 1 access. */
 
 /* page, protection -> pte */
diff -puN include/asm-x86_64/page.h~file-offset-in-pte-x86_64 include/asm-x86_64/page.h
--- 25/include/asm-x86_64/page.h~file-offset-in-pte-x86_64	2003-03-13 04:45:57.000000000 -0800
+++ 25-akpm/include/asm-x86_64/page.h	2003-03-13 04:48:53.000000000 -0800
@@ -69,8 +69,9 @@ typedef struct { unsigned long pgprot; }
 /* See Documentation/x86_64/mm.txt for a description of the memory map. */
 #define __START_KERNEL		0xffffffff80100000
 #define __START_KERNEL_map	0xffffffff80000000
-#define __PAGE_OFFSET           0x0000010000000000
-#define __PHYSICAL_MASK		0x000000ffffffffff
+#define __PAGE_OFFSET           0x0000010000000000	/* 1 << 40 */
+#define __PHYSICAL_MASK_SHIFT	40
+#define __PHYSICAL_MASK		((1UL << __PHYSICAL_MASK_SHIFT) - 1)
 
 #define KERNEL_TEXT_SIZE  (40UL*1024*1024)
 #define KERNEL_TEXT_START 0xffffffff80000000UL 

_



----- End forwarded message -----

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
