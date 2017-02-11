From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix random faults caused by inequivalent aliases
Date: Sat, 11 Feb 2017 15:33:41 -0500
Message-ID: <C371FD1B-0A52-4280-A017-2188E58CC866@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-62--415602971
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-62--415602971
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The attached patch fixes various random faults mainly observed doing gcc =
compilations.  These faults
are not reproducible.  They are only seen on machines with PA8800 and =
PA8900 processors.  This
strongly suggests the faults are caused by inequivalent aliases.

The kernel sets up vmap non-equivalent memory regions to do I/O.  These =
regions are not equivalently
mapped to the offset pages.  Thus, they might be the cause of the random =
memory corruption.

There are two routines, flush_kernel_vmap_range() and =
invalidate_kernel_vmap_range(), that flush and
invalidate kernel vmap ranges.  After a lot of testing, I found the =
following:

1) PG_dcache_dirty is never set on the offset map pages used by =
invalidate_kernel_vmap_range.  So,
    the for loop never flushes pages in the offset map.  PG_dcache_dirty =
doesn't really indicate a dirty page.
    It indicates that flush for the page is deferred.
2) vmalloc_to_page() can return NULL but it never happens.
3) We need to flush the offset map in both flush_kernel_vmap_range() and =
invalidate_kernel_vmap_range().

I moved the routines from cacheflush.h to cache.c.  This provides access =
to parisc_cache_flush_threshold
and flush_data_cache().  The routines now flush the entire data cache if =
the size of the vmap region exceeds
an appropriate threshold.  This should speed up these routines on small =
cache machines.

Signed-off-by: John David Anglin <dave.anglin@bell.net>


--Apple-Mail-62--415602971
Content-Disposition: attachment;
	filename=kernel_vmap_range.d.txt
Content-Type: text/plain;
	name="kernel_vmap_range.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/include/asm/cacheflush.h =
b/arch/parisc/include/asm/cacheflush.h
index 7bd69bd43a01..1d8c24dc04d4 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -45,28 +45,9 @@ static inline void flush_kernel_dcache_page(struct =
page *page)
=20
 #define flush_kernel_dcache_range(start,size) \
 	flush_kernel_dcache_range_asm((start), (start)+(size));
-/* vmap range flushes and invalidates.  Architecturally, we don't need
- * the invalidate, because the CPU should refuse to speculate once an
- * area has been flushed, so invalidate is left empty */
-static inline void flush_kernel_vmap_range(void *vaddr, int size)
-{
-	unsigned long start =3D (unsigned long)vaddr;
-
-	flush_kernel_dcache_range_asm(start, start + size);
-}
-static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
-{
-	unsigned long start =3D (unsigned long)vaddr;
-	void *cursor =3D vaddr;
=20
-	for ( ; cursor < vaddr + size; cursor +=3D PAGE_SIZE) {
-		struct page *page =3D vmalloc_to_page(cursor);
-
-		if (test_and_clear_bit(PG_dcache_dirty, &page->flags))
-			flush_kernel_dcache_page(page);
-	}
-	flush_kernel_dcache_range_asm(start, start + size);
-}
+void flush_kernel_vmap_range(void *vaddr, int size);
+void invalidate_kernel_vmap_range(void *vaddr, int size);
=20
 #define flush_cache_vmap(start, end)		flush_cache_all()
 #define flush_cache_vunmap(start, end)		flush_cache_all()
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 977f0a4f5ecf..91e594492d19 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -633,3 +633,54 @@ flush_cache_page(struct vm_area_struct *vma, =
unsigned long vmaddr, unsigned long
 		__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
 	}
 }
+
+/* Nominally, the caller is responsible for flushing the offset map
+   alias of the vmap area before performing I/O. This is important
+   on PA8800/PA8900 machines that only support equivalent aliases.
+   Failure to flush the offset map leads to random segmentation faults
+   in user space.  Testing has shown that we need to flush the offset
+   map as well as the vmap range. Once an area has been flushed,
+   the CPU will not speculate until there is an explicit access. */
+void flush_kernel_vmap_range(void *vaddr, int size)
+{
+	unsigned long threshold =3D parisc_cache_flush_threshold;
+	unsigned long start =3D (unsigned long)vaddr;
+	void *cursor =3D vaddr;
+
+	if (parisc_requires_coherency())
+		threshold >>=3D 1;
+	if ((unsigned long)size > threshold) {
+		flush_data_cache();
+		return;
+	}
+	if (parisc_requires_coherency()) {
+		for ( ; cursor < vaddr + size; cursor +=3D PAGE_SIZE) {
+			struct page *page =3D vmalloc_to_page(cursor);
+			flush_kernel_dcache_page(page);
+		}
+	}
+	flush_kernel_dcache_range_asm(start, start + size);
+}
+EXPORT_SYMBOL(flush_kernel_vmap_range);
+
+void invalidate_kernel_vmap_range(void *vaddr, int size)
+{
+	unsigned long threshold =3D parisc_cache_flush_threshold;
+	unsigned long start =3D (unsigned long)vaddr;
+	void *cursor =3D vaddr;
+
+	if (parisc_requires_coherency())
+		threshold >>=3D 1;
+	if ((unsigned long)size > threshold) {
+		flush_data_cache();
+		return;
+	}
+	if (parisc_requires_coherency()) {
+		for ( ; cursor < vaddr + size; cursor +=3D PAGE_SIZE) {
+			struct page *page =3D vmalloc_to_page(cursor);
+			flush_kernel_dcache_page(page);
+		}
+	}
+	flush_kernel_dcache_range_asm(start, start + size);
+}
+EXPORT_SYMBOL(invalidate_kernel_vmap_range);

--Apple-Mail-62--415602971
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-62--415602971--
