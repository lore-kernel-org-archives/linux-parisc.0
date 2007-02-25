From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Sun, 25 Feb 2007 12:30:58 -0600
Message-ID: <1172428258.3423.22.camel__3865.92838117412$1416624315$gmane$org@mulgrave.il.steeleye.com>
References: <1172328689.3401.3.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1172328689.3401.3.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Make sure we alter the context on the local CPU, but all possible uses
of the deprecated space on the other cpus.

The sharp eyed will also notice I've corrected a Protection ID bug with
the non current flushes.


Signed-off-by: James Bottomley <James.Bottomley@SteelEye.com>

---

Here's take II.  It corrects the problem with the prior one not being
agressive enough .. plus sr3 is the wrong register to alter from
userspace ... we really need to do sr4-7.

James

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 00b1641..f8d4d92 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -18,6 +18,8 @@
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <linux/pagemap.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
 
 #include <asm/pdc.h>
 #include <asm/cache.h>
@@ -303,25 +305,28 @@ flush_user_cache_page_non_current(struct vm_area_struct *vma,
 				  unsigned long vmaddr)
 {
 	/* save the current process space and pgd */
-	unsigned long space = mfsp(3), pgd = mfctl(25);
+	unsigned long space, pgd;
 
-	/* we don't mind taking interrups since they may not
-	 * do anything with user space, but we can't
-	 * be preempted here */
-	preempt_disable();
+	/* Have to disable interrupts here, since now %sr3 changes
+	 * are carried by IPI and we can't have that happen while
+	 * we're using a temporary %sr3 */
+	local_irq_disable();
+
+	space = mfsp(3);
+	pgd = mfctl(25);
 
 	/* make us current */
 	mtctl(__pa(vma->vm_mm->pgd), 25);
-	mtsp(vma->vm_mm->context, 3);
+	load_context(vma->vm_mm->context);
 
 	flush_user_dcache_page(vmaddr);
 	if(vma->vm_flags & VM_EXEC)
 		flush_user_icache_page(vmaddr);
 
 	/* put the old current process back */
-	mtsp(space, 3);
+	load_context(space);
 	mtctl(pgd, 25);
-	preempt_enable();
+	local_irq_enable();
 }
 
 
@@ -574,3 +579,34 @@ flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long
 		__flush_cache_page(vma, vmaddr);
 
 }
+
+void __flush_tlb_mm(void *mmv)
+{
+	struct mm_struct *mm = (struct mm_struct *)mmv;
+	struct pt_regs *regs = get_irq_regs();
+	unsigned long sr3;
+	int i;
+
+	if (mm != current->active_mm)
+		return;
+
+	/* sr3 is alterable by the user, so if we trapped from
+	 * user space, check sr7 instead */
+	if (in_interrupt()) {
+		if (regs->sr[7] != 0)
+			sr3 = regs->sr[7];
+		else
+			sr3 = mfsp(3);
+		/* needed to set up protection ID */
+		load_context(mm->context);
+	} else {
+		/* on_each_cpu makes one non interrupt call,
+		 * this is it */
+		load_context(mm->context);
+		return;
+	}
+
+	for (i = 0; i < 8; i++)
+		if (regs->sr[i] == sr3)
+			regs->sr[i] = mm->context;
+}
diff --git a/include/asm-parisc/assembly.h b/include/asm-parisc/assembly.h
diff --git a/include/asm-parisc/tlbflush.h b/include/asm-parisc/tlbflush.h
index 2e8c2bd..45d04ce 100644
--- a/include/asm-parisc/tlbflush.h
+++ b/include/asm-parisc/tlbflush.h
@@ -39,12 +39,7 @@ extern void flush_tlb_all_local(void *);
  * etc. do not do that).
  */
 
-static inline void __flush_tlb_mm(void *mmv)
-{
-	struct mm_struct *mm = (struct mm_struct *)mmv;
-	if (mm == current->active_mm)
-		load_context(mm->context);
-}
+void __flush_tlb_mm(void *mmv);
 
 static inline void flush_tlb_mm(struct mm_struct *mm)
 {


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
