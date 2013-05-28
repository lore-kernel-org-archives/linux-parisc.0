From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: fix race conditions flushing user cache pages
Date: Tue, 28 May 2013 08:09:44 -0400
Message-ID: <BLU0-SMTP84F3DE8CE6D8B9F60C5C2597970@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-8-593760307"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-8-593760307
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

There are two issues addressed by this patch:

1) When we flush user instruction and data pages using the kernel  
tmpalias region, we need to
ensure that the local TLB entry for the tmpalias page is never  
replaced with a different mapping.
Previously, we purged the entry before and after the cache flush  
loop.  Although preemption was
disabled, it seemed possible that the value might change during  
interrupt processing.  The patch
removes the purge and disables interrupts during the initial TLB entry  
purge and cache flush.

2) In a number of places, we flush the TLB for the page and then flush  
the page.  We disabled
preemption around the flush.  This change disables preemption around  
both the TLB and cache
flushes as it seemed the effect of the purge might be lost.

Without this change, I saw four random segmentation faults in about  
1.5 days of intensive package
building last weekend.  With the change, I haven't seen a single  
random segmentation fault in about
one week of building Debian packages on 4-way rp3440.  So, there is a  
significant improvement
in system stability.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---



--Apple-Mail-8-593760307
Content-Disposition: attachment; filename="cache.d.1.txt"
Content-Type: text/plain; x-unix-mode=0644; name="cache.d.1.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index f0e2784..772dc27 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -114,8 +114,8 @@ static inline void
 flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
 {
 	if (PageAnon(page)) {
-		flush_tlb_page(vma, vmaddr);
 		preempt_disable();
+		flush_tlb_page(vma, vmaddr);
 		flush_dcache_page_asm(page_to_phys(page), vmaddr);
 		preempt_enable();
 	}
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 65fb4cb..2bbdada 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -397,10 +397,10 @@ void copy_user_page(void *vto, void *vfrom, unsigned long vaddr,
 	   the kernel mapping. */
 	preempt_disable();
 	flush_dcache_page_asm(__pa(vfrom), vaddr);
-	preempt_enable();
 	copy_page_asm(vto, vfrom);
 	if (!parisc_requires_coherency())
 		flush_kernel_dcache_page_asm(vto);
+	preempt_enable();
 }
 EXPORT_SYMBOL(copy_user_page);
 
@@ -619,11 +619,11 @@ void clear_user_highpage(struct page *page, unsigned long vaddr)
 	   and the write-capable translation removed from the page
 	   table and purged from the TLB."  */
 
+	preempt_disable();
 	purge_kernel_dcache_page_asm((unsigned long)vto);
 	purge_tlb_start(flags);
 	pdtlb_kernel(vto);
 	purge_tlb_end(flags);
-	preempt_disable();
 	clear_user_page_asm(vto, vaddr);
 	preempt_enable();
 
@@ -644,12 +644,12 @@ void copy_user_highpage(struct page *to, struct page *from,
 	vfrom = kmap_atomic(from);
 	vto = kmap_atomic(to);
 
+	preempt_disable();
 	purge_kernel_dcache_page_asm((unsigned long)vto);
 	purge_tlb_start(flags);
 	pdtlb_kernel(vto);
 	pdtlb_kernel(vfrom);
 	purge_tlb_end(flags);
-	preempt_disable();
 	copy_user_page_asm(vto, vfrom, vaddr);
 	flush_dcache_page_asm(__pa(vto), vaddr);
 	preempt_enable();
diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 36d7f40..46a83be 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -331,11 +331,10 @@ ENDPROC(flush_data_cache_local)
 
 /* Macros to serialize TLB purge operations on SMP.  */
 
-	.macro	tlb_lock	la,flags,tmp
+	.macro	tlb_lock	la,tmp
 #ifdef CONFIG_SMP
 	ldil		L%pa_tlb_lock,%r1
 	ldo		R%pa_tlb_lock(%r1),\la
-	rsm		PSW_SM_I,\flags
 1:	LDCW		0(\la),\tmp
 	cmpib,<>,n	0,\tmp,3f
 2:	ldw		0(\la),\tmp
@@ -346,11 +345,10 @@ ENDPROC(flush_data_cache_local)
 #endif
 	.endm
 
-	.macro	tlb_unlock	la,flags,tmp
+	.macro	tlb_unlock	la,tmp
 #ifdef CONFIG_SMP
 	ldi		1,\tmp
 	stw		\tmp,0(\la)
-	mtsm		\flags
 #endif
 	.endm
 
@@ -617,16 +615,22 @@ ENTRY(copy_user_page_asm)
 	depwi		1, 9,1, %r29		/* Form aliased virtual address 'from' */
 #endif
 
+	/* We need to ensure that the TLB entry is not replaced with
+	   a different value while the clear/copy loop executes.
+	   If this results in too much latency, interrupts could
+	   be re-enabled periodically.  */
+	rsm		PSW_SM_I, %r19		/* save I-bit state */
+
 	/* Purge any old translations */
 
 #ifdef CONFIG_PA20
 	pdtlb,l		0(%r28)
 	pdtlb,l		0(%r29)
 #else
-	tlb_lock	%r20,%r21,%r22
+	tlb_lock	%r20,%r22
 	pdtlb		0(%r28)
 	pdtlb		0(%r29)
-	tlb_unlock	%r20,%r21,%r22
+	tlb_unlock	%r20,%r22
 #endif
 
 #ifdef CONFIG_64BIT
@@ -736,7 +740,7 @@ ENTRY(copy_user_page_asm)
 	addib,COND(>)		-1, %r1,1b
 	ldo		64(%r29), %r29
 #endif
-
+	mtsm		%r19
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -765,14 +769,20 @@ ENTRY(clear_user_page_asm)
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
 
+	/* We need to ensure that the TLB entry is not replaced with
+	   a different value while the clear/copy loop executes.
+	   If this results in too much latency, interrupts could
+	   be re-enabled periodically.  */
+	rsm		PSW_SM_I, %r19		/* save I-bit state */
+
 	/* Purge any old translation */
 
 #ifdef CONFIG_PA20
 	pdtlb,l		0(%r28)
 #else
-	tlb_lock	%r20,%r21,%r22
+	tlb_lock	%r20,%r22
 	pdtlb		0(%r28)
-	tlb_unlock	%r20,%r21,%r22
+	tlb_unlock	%r20,%r22
 #endif
 
 #ifdef CONFIG_64BIT
@@ -823,6 +833,7 @@ ENTRY(clear_user_page_asm)
 	ldo		64(%r28), %r28
 #endif	/* CONFIG_64BIT */
 
+	mtsm		%r19
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -849,18 +860,20 @@ ENTRY(flush_dcache_page_asm)
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
 
+	rsm		PSW_SM_I, %r19		/* save I-bit state */
+
 	/* Purge any old translation */
 
 #ifdef CONFIG_PA20
 	pdtlb,l		0(%r28)
 #else
-	tlb_lock	%r20,%r21,%r22
+	tlb_lock	%r20,%r22
 	pdtlb		0(%r28)
-	tlb_unlock	%r20,%r21,%r22
+	tlb_unlock	%r20,%r22
 #endif
 
 	ldil		L%dcache_stride, %r1
-	ldw		R%dcache_stride(%r1), %r1
+	ldw		R%dcache_stride(%r1), %r23
 
 #ifdef CONFIG_64BIT
 	depdi,z		1, 63-PAGE_SHIFT,1, %r25
@@ -868,37 +881,30 @@ ENTRY(flush_dcache_page_asm)
 	depwi,z		1, 31-PAGE_SHIFT,1, %r25
 #endif
 	add		%r28, %r25, %r25
-	sub		%r25, %r1, %r25
-
-
-1:      fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
-	fdc,m		%r1(%r28)
+	sub		%r25, %r23, %r25
+
+
+1:      fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
+	fdc,m		%r23(%r28)
 	cmpb,COND(<<)		%r28, %r25,1b
-	fdc,m		%r1(%r28)
+	fdc,m		%r23(%r28)
 
+	mtsm		%r19
 	sync
 
-#ifdef CONFIG_PA20
-	pdtlb,l		0(%r25)
-#else
-	tlb_lock	%r20,%r21,%r22
-	pdtlb		0(%r25)
-	tlb_unlock	%r20,%r21,%r22
-#endif
-
 	bv		%r0(%r2)
 	nop
 	.exit
@@ -925,18 +931,20 @@ ENTRY(flush_icache_page_asm)
 	depwi		0, 31,PAGE_SHIFT, %r28	/* Clear any offset bits */
 #endif
 
+	rsm		PSW_SM_I, %r19		/* save I-bit state */
+
 	/* Purge any old translation */
 
 #ifdef CONFIG_PA20
 	pitlb,l         %r0(%sr4,%r28)
 #else
-	tlb_lock        %r20,%r21,%r22
+	tlb_lock        %r20,%r22
 	pitlb           (%sr4,%r28)
-	tlb_unlock      %r20,%r21,%r22
+	tlb_unlock      %r20,%r22
 #endif
 
 	ldil		L%icache_stride, %r1
-	ldw		R%icache_stride(%r1), %r1
+	ldw		R%icache_stride(%r1), %r23
 
 #ifdef CONFIG_64BIT
 	depdi,z		1, 63-PAGE_SHIFT,1, %r25
@@ -944,39 +952,32 @@ ENTRY(flush_icache_page_asm)
 	depwi,z		1, 31-PAGE_SHIFT,1, %r25
 #endif
 	add		%r28, %r25, %r25
-	sub		%r25, %r1, %r25
+	sub		%r25, %r23, %r25
 
 
 	/* fic only has the type 26 form on PA1.1, requiring an
 	 * explicit space specification, so use %sr4 */
-1:      fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
-	fic,m		%r1(%sr4,%r28)
+1:      fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
 	cmpb,COND(<<)	%r28, %r25,1b
-	fic,m		%r1(%sr4,%r28)
+	fic,m		%r23(%sr4,%r28)
 
+	mtsm		%r19
 	sync
 
-#ifdef CONFIG_PA20
-	pitlb,l         %r0(%sr4,%r25)
-#else
-	tlb_lock        %r20,%r21,%r22
-	pitlb           (%sr4,%r25)
-	tlb_unlock      %r20,%r21,%r22
-#endif
--Apple-Mail-8-593760307--
