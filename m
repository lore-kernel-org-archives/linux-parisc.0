From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] cacheflush: reforamted suggestion
Date: Mon, 29 Nov 2004 09:51:14 +0100
Message-ID: <418A800300008FDB@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

May I suggest this small patch (just a reformat trying to stay into 80 co=
lumns):
--- cacheflush.h.Orig	2004-11-22 18:00:28.449820293 +0100
+++ cacheflush.h	2004-11-22 18:49:06.925429961 +0100
@@ -10,9 +10,9 @@
 /* Cache flush operations */
 
 #ifdef CONFIG_SMP
-#define flush_cache_mm(mm) flush_cache_all()
+#define flush_cache_mm(mm)		flush_cache_all()
 #else
-#define flush_cache_mm(mm) flush_cache_all_local()
+#define flush_cache_mm(mm)		flush_cache_all_local()
 #endif
 
 #define flush_kernel_dcache_range(start,size) \
@@ -20,18 +20,20 @@
 
 extern void flush_cache_all_local(void);
 
-static inline void cacheflush_h_tmp_function(void *dummy)
+static inline void
+cacheflush_h_tmp_function(void *dummy)
 {
 	flush_cache_all_local();
 }
 
-static inline void flush_cache_all(void)
+static inline void
+flush_cache_all(void)
 {
 	on_each_cpu(cacheflush_h_tmp_function, NULL, 1, 1);
 }
 
-#define flush_cache_vmap(start, end)		flush_cache_all()
-#define flush_cache_vunmap(start, end)		flush_cache_all()
+#define flush_cache_vmap(start, end)	flush_cache_all()
+#define flush_cache_vunmap(start, end)	flush_cache_all()
 
 extern int parisc_cache_flush_threshold;
 void parisc_setup_cache_timing(void);
@@ -56,30 +58,40 @@
 
 extern void flush_dcache_page(struct page *page);
 
-#define flush_dcache_mmap_lock(mapping) \
+#define flush_dcache_mmap_lock(mapping)			\
 	spin_lock_irq(&(mapping)->tree_lock)
-#define flush_dcache_mmap_unlock(mapping) \
+#define flush_dcache_mmap_unlock(mapping)		\
 	spin_unlock_irq(&(mapping)->tree_lock)
 
-#define flush_icache_page(vma,page)	do { flush_kernel_dcache_page(page_a=
ddress(page));
flush_kernel_icache_page(page_address(page)); } while (0)
+#define flush_icache_page(vma,page)				\
+do {								\
+	flush_kernel_dcache_page(page_address(page));		\
+	flush_kernel_icache_page(page_address(page));		\
+} while (0)
 
-#define flush_icache_range(s,e)		do { flush_kernel_dcache_range_asm(s,e)=
;
flush_kernel_icache_range_asm(s,e); } while (0)
+#define flush_icache_range(s,e)					\
+do {								\
+	flush_kernel_dcache_range_asm(s,e);			\
+	flush_kernel_icache_range_asm(s,e);			\
+} while (0)
 
-#define copy_to_user_page(vma, page, vaddr, dst, src, len) \
-do { \
-	flush_cache_page(vma, vaddr); \
-	memcpy(dst, src, len); \
-	flush_kernel_dcache_range_asm((unsigned long)dst, (unsigned long)dst +
len); \
+#define copy_to_user_page(vma, page, vaddr, dst, src, len)	\
+do {								\
+	flush_cache_page(vma, vaddr);				\
+	memcpy(dst, src, len);					\
+	flush_kernel_dcache_range_asm((unsigned long)dst,	\
+				 (unsigned long)dst + len); 	\
 } while (0)
 
-#define copy_from_user_page(vma, page, vaddr, dst, src, len) \
-do { \
-	flush_cache_page(vma, vaddr); \
-	memcpy(dst, src, len); \
+#define copy_from_user_page(vma, page, vaddr, dst, src, len)	\
+do {								\
+	flush_cache_page(vma, vaddr);				\
+	memcpy(dst, src, len);					\
 } while (0)
 
-static inline void flush_cache_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end)
+static inline void
+flush_cache_range(struct vm_area_struct *vma, unsigned long start,
+		unsigned long end)
 {
 	int sr3;
 
@@ -99,8 +111,8 @@
 
 /* Simple function to work out if we have an existing address translatio=
n
  * for a user space vma. */
-static inline pte_t *__translation_exists(struct mm_struct *mm,
-					  unsigned long addr)
+static inline pte_t *
+__translation_exists(struct mm_struct *mm, unsigned long addr)
 {
 	pgd_t *pgd =3D pgd_offset(mm, addr);
 	pmd_t *pmd;
@@ -136,7 +148,8 @@
 				  unsigned long vmaddr)
 {
 	/* save the current process space and pgd */
-	unsigned long space =3D mfsp(3), pgd =3D mfctl(25);
+	unsigned long space =3D mfsp(3);
+	unsigned long pgd =3D mfctl(25);
 
 	/* we don't mind taking interrups since they may not
 	 * do anything with user space, but we can't
@@ -178,5 +191,5 @@
 		__flush_cache_page(vma, vmaddr);
 
 }
-#endif
+#endif	/* _PARISC_CACHEFLUSH_H */
=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D

Cheers,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL GO & Light, 2 mois gratuits, profitez-en...
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
