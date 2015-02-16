From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: hpux - Remove hpux gateway page
Date: Mon, 16 Feb 2015 22:21:00 +0100
Message-ID: <20150216212100.GA1807@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Drop code to create HP-UX gateway page and syscall entry code.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 689a8ad..54adb60 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -330,8 +330,6 @@ struct mm_struct;
 /* Free all resources held by a thread. */
 extern void release_thread(struct task_struct *);
 
-extern void map_hpux_gateway_page(struct task_struct *tsk, struct mm_struct *mm);
-
 extern unsigned long get_wchan(struct task_struct *p);
 
 #define KSTK_EIP(tsk)	((tsk)->thread.regs.iaoq[0])
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index e8f07dd..2ab16bb 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1774,10 +1774,6 @@ ENTRY(sys_rt_sigreturn_wrapper)
 ENDPROC(sys_rt_sigreturn_wrapper)
 
 ENTRY(syscall_exit)
-	/* NOTE: HP-UX syscalls also come through here
-	 * after hpux_syscall_exit fixes up return
-	 * values. */
-
 	/* NOTE: Not all syscalls exit this way.  rt_sigreturn will exit
 	 * via syscall_exit_rfi if the signal was received while the process
 	 * was running.
@@ -1789,22 +1785,6 @@ ENTRY(syscall_exit)
 	LDREG     TI_TASK(%r1),%r1
 	STREG     %r28,TASK_PT_GR28(%r1)
 
-#ifdef CONFIG_HPUX
-/* <linux/personality.h> cannot be easily included */
-#define PER_HPUX 0x10
-	ldw	TASK_PERSONALITY(%r1),%r19
-
-	/* We can't use "CMPIB<> PER_HPUX" since "im5" field is sign extended */
-	ldo	  -PER_HPUX(%r19), %r19
-	cmpib,COND(<>),n 0,%r19,1f
-
-	/* Save other hpux returns if personality is PER_HPUX */
-	STREG     %r22,TASK_PT_GR22(%r1)
-	STREG     %r29,TASK_PT_GR29(%r1)
-1:
-
-#endif /* CONFIG_HPUX */
-
 	/* Seems to me that dp could be wrong here, if the syscall involved
 	 * calling a module, and nothing got round to restoring dp on return.
 	 */
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index 0bbbf0d..8a488c2 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -193,9 +193,7 @@ copy_thread(unsigned long clone_flags, unsigned long usp,
 	 * Make them const so the compiler knows they live in .text */
 	extern void * const ret_from_kernel_thread;
 	extern void * const child_return;
-#ifdef CONFIG_HPUX
-	extern void * const hpux_child_return;
-#endif
+
 	if (unlikely(p->flags & PF_KTHREAD)) {
 		memset(cregs, 0, sizeof(struct pt_regs));
 		if (!usp) /* idle thread */
@@ -229,15 +227,8 @@ copy_thread(unsigned long clone_flags, unsigned long usp,
 				cregs->gr[30] = usp;
 		}
 		cregs->ksp = (unsigned long)stack + THREAD_SZ_ALGN + FRAME_SIZE;
-		if (personality(p->personality) == PER_HPUX) {
-#ifdef CONFIG_HPUX
-			cregs->kpc = (unsigned long) &hpux_child_return;
-#else
-			BUG();
-#endif
-		} else {
-			cregs->kpc = (unsigned long) &child_return;
-		}
+		cregs->kpc = (unsigned long) &child_return;
+
 		/* Setup thread TLS area from the 4th parameter in clone */
 		if (clone_flags & CLONE_SETTLS)
 			cregs->cr27 = cregs->gr[23];
diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 9b910a0..81e749f 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -9,8 +9,7 @@
  *
  *  Like the IA-64, we are a recent enough port (we are *starting*
  *  with glibc2.2) that we do not need to support the old non-realtime
- *  Linux signals.  Therefore we don't.  HP/UX signals will go in
- *  arch/parisc/hpux/signal.c when we figure out how to do them.
+ *  Linux signals.  Therefore we don't.
  */
 
 #include <linux/sched.h>
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 0bef864..15dbe81 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -750,78 +750,6 @@ static void __init gateway_init(void)
 		  PAGE_SIZE, PAGE_GATEWAY, 1);
 }
 
-#ifdef CONFIG_HPUX
-void
-map_hpux_gateway_page(struct task_struct *tsk, struct mm_struct *mm)
-{
-	pgd_t *pg_dir;
-	pmd_t *pmd;
-	pte_t *pg_table;
-	unsigned long start_pmd;
-	unsigned long start_pte;
-	unsigned long address;
-	unsigned long hpux_gw_page_addr;
-	/* FIXME: This is 'const' in order to trick the compiler
-	   into not treating it as DP-relative data. */
-	extern void * const hpux_gateway_page;
-
-	hpux_gw_page_addr = HPUX_GATEWAY_ADDR & PAGE_MASK;
-
-	/*
-	 * Setup HP-UX Gateway page.
-	 *
-	 * The HP-UX gateway page resides in the user address space,
-	 * so it needs to be aliased into each process.
-	 */
-
-	pg_dir = pgd_offset(mm,hpux_gw_page_addr);
-
-#if PTRS_PER_PMD == 1
-	start_pmd = 0;
-#else
-	start_pmd = ((hpux_gw_page_addr >> PMD_SHIFT) & (PTRS_PER_PMD - 1));
-#endif
-	start_pte = ((hpux_gw_page_addr >> PAGE_SHIFT) & (PTRS_PER_PTE - 1));
-
-	address = __pa(&hpux_gateway_page);
-#if PTRS_PER_PMD == 1
-	pmd = (pmd_t *)__pa(pg_dir);
-#else
-	pmd = (pmd_t *) pgd_address(*pg_dir);
-
-	/*
-	 * pmd is physical at this point
-	 */
-
-	if (!pmd) {
-		pmd = (pmd_t *) get_zeroed_page(GFP_KERNEL);
-		pmd = (pmd_t *) __pa(pmd);
-	}
-
-	__pgd_val_set(*pg_dir, PxD_FLAG_PRESENT | PxD_FLAG_VALID | (unsigned long) pmd);
-#endif
-	/* now change pmd to kernel virtual addresses */
-
-	pmd = (pmd_t *)__va(pmd) + start_pmd;
-
-	/*
-	 * pg_table is physical at this point
-	 */
-
-	pg_table = (pte_t *) pmd_address(*pmd);
-	if (!pg_table)
-		pg_table = (pte_t *) __pa(get_zeroed_page(GFP_KERNEL));
-
-	__pmd_val_set(*pmd, PxD_FLAG_PRESENT | PxD_FLAG_VALID | (unsigned long) pg_table);
-
-	/* now change pg_table to kernel virtual addresses */
-
-	pg_table = (pte_t *) __va(pg_table) + start_pte;
-	set_pte(pg_table, __mk_pte(address, PAGE_GATEWAY));
-}
-EXPORT_SYMBOL(map_hpux_gateway_page);
-#endif
