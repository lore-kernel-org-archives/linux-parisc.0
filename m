From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Optimize flush_kernel_vmap_range and invalidate_kernel_vmap_range
Date: Sat, 11 Mar 2017 18:03:34 -0500
Message-ID: <66AE6B29-0375-48C1-9698-179E1562AE11@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-32--134893245
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-32--134893245
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The previously submitted patch did not resolve the random segmentation =
faults observed on the phantom buildd system.
There are still unresolved problems with the Debian 4.8 and 4.9 kernels =
on C8000.

The attached patch removes the flush of the offset map pages and does a =
whole data cache flush for large ranges.  No
other arch flushes the offset map in these routines as far as I can =
tell.

I have not observed any random segmentation faults on rp3440 in two =
weeks of testing with 4.10.0 and 4.10.1.  I know
as soon as I send this mail, something will break...

Signed-off-by: John David Anglin <dave.anglin@bell.net>


--Apple-Mail-32--134893245
Content-Disposition: attachment;
	filename=kernel_vmap_range.d.1.txt
Content-Type: text/plain;
	name="kernel_vmap_range.d.1.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/include/asm/cacheflush.h =
b/arch/parisc/include/asm/cacheflush.h
index 7bd69bd43a01..c7e15cc5c668 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -45,28 +43,9 @@ static inline void flush_kernel_dcache_page(struct =
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
index 977f0a4f5ecf..8935d350ede5 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -633,3 +615,25 @@ flush_cache_page(struct vm_area_struct *vma, =
unsigned long vmaddr, unsigned long
 		__flush_cache_page(vma, vmaddr, PFN_PHYS(pfn));
 	}
 }
+
+void flush_kernel_vmap_range(void *vaddr, int size)
+{
+	unsigned long start =3D (unsigned long)vaddr;
+
+	if ((unsigned long)size > parisc_cache_flush_threshold)
+		flush_data_cache();
+	else
+		flush_kernel_dcache_range_asm(start, start + size);
+}
+EXPORT_SYMBOL(flush_kernel_vmap_range);
+
+void invalidate_kernel_vmap_range(void *vaddr, int size)
+{
+	unsigned long start =3D (unsigned long)vaddr;
+
+	if ((unsigned long)size > parisc_cache_flush_threshold)
+		flush_data_cache();
+	else
+		flush_kernel_dcache_range_asm(start, start + size);
+}
+EXPORT_SYMBOL(invalidate_kernel_vmap_range);

--Apple-Mail-32--134893245
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-32--134893245--
