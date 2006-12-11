From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] [patch] tlbflush "improvement"
Date: Tue, 12 Dec 2006 00:24:41 +0800
Message-ID: <457D8649.8080306__5632.49022602594$1416624230$gmane$org@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

This patch tries to get rid of our current "blow away the tlb on each 
fork()" behavior in SMP builds. Tested lightly on pa8800. Comments welcome.

I say "improvement" in quotes because I did not see a significant perf 
improvement in kernel build times, but theoretically it should be more 
performant :)

I think we need to do some threading testcases to exercise this 
sufficiently.... any volunteers? :)

randolph

diff --git a/include/asm-parisc/tlbflush.h b/include/asm-parisc/tlbflush.h
index f662e83..2e8c2bd 100644
--- a/include/asm-parisc/tlbflush.h
+++ b/include/asm-parisc/tlbflush.h
@@ -39,21 +39,19 @@ extern void flush_tlb_all_local(void *);
   * etc. do not do that).
   */

-static inline void flush_tlb_mm(struct mm_struct *mm)
+static inline void __flush_tlb_mm(void *mmv)
  {
-       BUG_ON(mm == &init_mm); /* Should never happen */
+       struct mm_struct *mm = (struct mm_struct *)mmv;
+       if (mm == current->active_mm)
+               load_context(mm->context);
+}

-#ifdef CONFIG_SMP
-       flush_tlb_all();
-#else
-       if (mm) {
-               if (mm->context != 0)
-                       free_sid(mm->context);
-               mm->context = alloc_sid();
-               if (mm == current->active_mm)
-                       load_context(mm->context);
-       }
-#endif
+static inline void flush_tlb_mm(struct mm_struct *mm)
+{
+       if (mm->context != 0)
+               free_sid(mm->context);
+       mm->context = alloc_sid();
+       on_each_cpu(__flush_tlb_mm, mm, 1, 1);
  }

  extern __inline__ void flush_tlb_pgtables(struct mm_struct *mm, 
unsigned long s
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
