From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Sat, 24 Feb 2007 08:51:29 -0600
Message-ID: <1172328689.3401.3.camel__16349.359896458$1416624312$gmane$org@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <parisc-linux@lists.parisc-linux.org>
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

Since we're now changing the %sr3 from an IPI, we have to be careful
about other places in the kernel where we're using temporary values in %
sr3.  As far as I can tell, this is pretty much only non local cache
flushing.  The following patch fixes the IPI to work (by not saving %sr3
across an interruption) and patches up temporary %sr3 usage.

The sharp eyed will also notice I've corrected a Protection ID bug with
the non current flushes.

Signed-off-by: James Bottomley <James.Bottomley@SteelEye.com>

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 00b1641..cb1dd17 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -303,25 +303,28 @@ flush_user_cache_page_non_current(struct vm_area_struct *vma,
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
 
 
diff --git a/include/asm-parisc/assembly.h b/include/asm-parisc/assembly.h
index 5587f00..efe9ebc 100644
--- a/include/asm-parisc/assembly.h
+++ b/include/asm-parisc/assembly.h
@@ -435,7 +435,8 @@
 	SAVE_SP  (%sr0, PT_SR0 (\regs))
 	SAVE_SP  (%sr1, PT_SR1 (\regs))
 	SAVE_SP  (%sr2, PT_SR2 (\regs))
-	SAVE_SP  (%sr3, PT_SR3 (\regs))
+; Can't save and restore %sr3, it may be update from IPI
+;	SAVE_SP  (%sr3, PT_SR3 (\regs))
 	SAVE_SP  (%sr4, PT_SR4 (\regs))
 	SAVE_SP  (%sr5, PT_SR5 (\regs))
 	SAVE_SP  (%sr6, PT_SR6 (\regs))
@@ -475,7 +476,8 @@
 	REST_SP  (%sr0, PT_SR0 (\regs))
 	REST_SP  (%sr1, PT_SR1 (\regs))
 	REST_SP  (%sr2, PT_SR2 (\regs))
-	REST_SP  (%sr3, PT_SR3 (\regs))
+; Can't save and restore %sr3, it may be updated from IPI
+;	REST_SP  (%sr3, PT_SR3 (\regs))
 	REST_SP  (%sr4, PT_SR4 (\regs))
 	REST_SP  (%sr5, PT_SR5 (\regs))
 	REST_SP  (%sr6, PT_SR6 (\regs))


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
