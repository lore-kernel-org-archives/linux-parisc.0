From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Thu, 8 Apr 2010 17:54:54 -0400
Message-ID: <20100408215453.GA18445@hiauly1.hia.nrc.ca>
References: <4BA43CE5.4020807@fsij.org> <87hbo4ek8l.fsf@thialfi.karme.de> <4BB18B46.2070203@fsij.org> <4BB53D26.60601@fsij.org> <4BB5594C.8050505@fsij.org> <1270179025.18981.19.camel@mulgrave.site> <4BB568FB.1090908@fsij.org> <4BB5A557.2000405@fsij.org> <20100402193514.GA9860@hiauly1.hia.nrc.ca> <4BBE468D.5060609@gmx.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	NIIBE Yutaka <gniibe@fsij.org>, linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BBE468D.5060609@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 08 Apr 2010, Helge Deller wrote:

> On 04/02/2010 09:35 PM, John David Anglin wrote:
> > On Fri, 02 Apr 2010, NIIBE Yutaka wrote:
> > 
> >> NIIBE Yutaka wrote:
> >>> To have same semantics as other archs, I think that VIPT-WB cache
> >>> machine should have cache flush at ptep_set_wrprotect, so that memory
> >>> of the page has up-to-date data.  Yes, it will be huge performance
> >>> impact for fork.  But I don't find any good solution other than this
> >>> yet.
> >>
> >> I think we could do something like (only for VIPT-WB cache machine):
> >>
> >> -	static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long 
> >> address, pte_t *ptep)
> >>
> >> +	static inline void ptep_set_wrprotect(struct vm_area_struct *vma, struct 
> >> mm_struct *mm, unsigned long addr, pte_t *ptep)
> >> 	{
> >> 		pte_t old_pte = *ptep;
> >> +		if (atomic_read(&mm->mm_users) > 1)
> >> +			flush_cache_page(vma, addr, pte_pfn(old_pte));
> >> 		set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
> >> 	}
> > 
> > I tested the hack below on two machines currently running 2.6.33.2
> > UP kernels.  The change seems to fix Debian #561203 (minifail bug)!
> > Thus, I definitely think you are on the right track.  I'll continue
> > to test.
> > 
> > I suspect the same issue is present for SMP kernels.
> 
> Hi Dave,
> 
> I tested your patch today on one of my machines with plain kernel 2.6.33 (32bit, SMP, B2000 I think).
> Sadly I still did see the minifail bug.
> 
> Are you sure, that the patch fixed this bug for you?

Seemed to, but I have a bunch of other changes installed.  Possibly,
the change to cacheflush.h is important.  It affects all PA8000.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/hpux/wrappers.S b/arch/parisc/hpux/wrappers.S
index 58c53c8..bdcea33 100644
--- a/arch/parisc/hpux/wrappers.S
+++ b/arch/parisc/hpux/wrappers.S
@@ -88,7 +88,7 @@ ENTRY(hpux_fork_wrapper)
 
 	STREG	%r2,-20(%r30)
 	ldo	64(%r30),%r30
-	STREG	%r2,PT_GR19(%r1)	;! save for child
+	STREG	%r2,PT_SYSCALL_RP(%r1)	;! save for child
 	STREG	%r30,PT_GR21(%r1)	;! save for child
 
 	LDREG	PT_GR30(%r1),%r25
@@ -132,7 +132,7 @@ ENTRY(hpux_child_return)
 	bl,n	schedule_tail, %r2
 #endif
 
-	LDREG	TASK_PT_GR19-TASK_SZ_ALGN-128(%r30),%r2
+	LDREG	TASK_PT_SYSCALL_RP-TASK_SZ_ALGN-128(%r30),%r2
 	b fork_return
 	copy %r0,%r28
 ENDPROC(hpux_child_return)
diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
index 716634d..d7fabc4 100644
--- a/arch/parisc/include/asm/atomic.h
+++ b/arch/parisc/include/asm/atomic.h
@@ -24,29 +24,46 @@
  * Hash function to index into a different SPINLOCK.
  * Since "a" is usually an address, use one spinlock per cacheline.
  */
-#  define ATOMIC_HASH_SIZE 4
-#  define ATOMIC_HASH(a) (&(__atomic_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
+#  define ATOMIC_HASH_SIZE (4096/L1_CACHE_BYTES)  /* 4 */
+#  define ATOMIC_HASH(a)      (&(__atomic_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
+#  define ATOMIC_USER_HASH(a) (&(__atomic_user_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
 
 extern arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned;
+extern arch_spinlock_t __atomic_user_hash[ATOMIC_HASH_SIZE] __lock_aligned;
 
 /* Can't use raw_spin_lock_irq because of #include problems, so
  * this is the substitute */
-#define _atomic_spin_lock_irqsave(l,f) do {	\
-	arch_spinlock_t *s = ATOMIC_HASH(l);		\
+#define _atomic_spin_lock_irqsave_template(l,f,hash_func) do {	\
+	arch_spinlock_t *s = hash_func;		\
 	local_irq_save(f);			\
 	arch_spin_lock(s);			\
 } while(0)
 
-#define _atomic_spin_unlock_irqrestore(l,f) do {	\
-	arch_spinlock_t *s = ATOMIC_HASH(l);			\
+#define _atomic_spin_unlock_irqrestore_template(l,f,hash_func) do {	\
+	arch_spinlock_t *s = hash_func;			\
 	arch_spin_unlock(s);				\
 	local_irq_restore(f);				\
 } while(0)
 
+/* kernel memory locks */
+#define _atomic_spin_lock_irqsave(l,f)	\
+	_atomic_spin_lock_irqsave_template(l,f,ATOMIC_HASH(l))
+
+#define _atomic_spin_unlock_irqrestore(l,f)	\
+	_atomic_spin_unlock_irqrestore_template(l,f,ATOMIC_HASH(l))
+
+/* userspace memory locks */
+#define _atomic_spin_lock_irqsave_user(l,f)	\
+	_atomic_spin_lock_irqsave_template(l,f,ATOMIC_USER_HASH(l))
+
+#define _atomic_spin_unlock_irqrestore_user(l,f)	\
+	_atomic_spin_unlock_irqrestore_template(l,f,ATOMIC_USER_HASH(l))
 
 #else
 #  define _atomic_spin_lock_irqsave(l,f) do { local_irq_save(f); } while (0)
 #  define _atomic_spin_unlock_irqrestore(l,f) do { local_irq_restore(f); } while (0)
+#  define _atomic_spin_lock_irqsave_user(l,f) _atomic_spin_lock_irqsave(l,f)
+#  define _atomic_spin_unlock_irqrestore_user(l,f) _atomic_spin_lock_irqsave_user(l,f)
 #endif
 
 /* This should get optimized out since it's never called.
diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 7a73b61..ab87176 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -2,6 +2,7 @@
 #define _PARISC_CACHEFLUSH_H
 
 #include <linux/mm.h>
+#include <linux/uaccess.h>
 
 /* The usual comment is "Caches aren't brain-dead on the <architecture>".
  * Unfortunately, that doesn't apply to PA-RISC. */
@@ -113,11 +114,20 @@ static inline void *kmap(struct page *page)
 
 #define kunmap(page)			kunmap_parisc(page_address(page))
 
-#define kmap_atomic(page, idx)		page_address(page)
+static inline void *kmap_atomic(struct page *page, enum km_type idx)
+{
+	pagefault_disable();
+	return page_address(page);
+}
 
-#define kunmap_atomic(addr, idx)	kunmap_parisc(addr)
+static inline void kunmap_atomic(void *addr, enum km_type idx)
+{
+	kunmap_parisc(addr);
+	pagefault_enable();
+}
 
-#define kmap_atomic_pfn(pfn, idx)	page_address(pfn_to_page(pfn))
+#define kmap_atomic_prot(page, idx, prot)	kmap_atomic(page, idx)
+#define kmap_atomic_pfn(pfn, idx)	kmap_atomic(pfn_to_page(pfn), (idx))
 #define kmap_atomic_to_page(ptr)	virt_to_page(ptr)
 #endif
 
diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
index 0c705c3..7bc963e 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -55,6 +55,7 @@ futex_atomic_cmpxchg_inatomic(int __user *uaddr, int oldval, int newval)
 {
 	int err = 0;
 	int uval;
+	unsigned long flags;
 
 	/* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
 	 * our gateway page, and causes no end of trouble...
@@ -65,10 +66,15 @@ futex_atomic_cmpxchg_inatomic(int __user *uaddr, int oldval, int newval)
 	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(int)))
 		return -EFAULT;
 
+	_atomic_spin_lock_irqsave_user(uaddr, flags);
+
 	err = get_user(uval, uaddr);
-	if (err) return -EFAULT;
-	if (uval == oldval)
-		err = put_user(newval, uaddr);
+	if (!err)
+		if (uval == oldval)
+			err = put_user(newval, uaddr);
+
+	_atomic_spin_unlock_irqrestore_user(uaddr, flags);
+
 	if (err) return -EFAULT;
 	return uval;
 }
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index a27d2e2..53ba987 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -14,6 +14,7 @@
 #include <linux/bitops.h>
 #include <asm/processor.h>
 #include <asm/cache.h>
+extern void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long pfn);
 
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
@@ -456,17 +457,22 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	return old_pte;
 }
 
-static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+static inline void ptep_set_wrprotect(struct vm_area_struct *vma, struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 #ifdef CONFIG_SMP
 	unsigned long new, old;
+#endif
+	pte_t old_pte = *ptep;
+
+	if (pte_dirty(old_pte))
+		flush_cache_page(vma, addr, pte_pfn(old_pte));
 
+#ifdef CONFIG_SMP
 	do {
 		old = pte_val(*ptep);
 		new = pte_val(pte_wrprotect(__pte (old)));
 	} while (cmpxchg((unsigned long *) ptep, old, new) != old);
 #else
-	pte_t old_pte = *ptep;
 	set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
 #endif
 }
diff --git a/arch/parisc/include/asm/system.h b/arch/parisc/include/asm/system.h
index d91357b..4653c77 100644
--- a/arch/parisc/include/asm/system.h
+++ b/arch/parisc/include/asm/system.h
@@ -160,7 +160,7 @@ static inline void set_eiem(unsigned long val)
    ldcd). */
 
 #define __PA_LDCW_ALIGNMENT	4
-#define __ldcw_align(a) ((volatile unsigned int *)a)
+#define __ldcw_align(a) (&(a)->slock)
 #define __LDCW	"ldcw,co"
 
 #endif /*!CONFIG_PA20*/
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index ec787b4..b2f35b2 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -137,6 +137,7 @@ int main(void)
 	DEFINE(TASK_PT_IAOQ0, offsetof(struct task_struct, thread.regs.iaoq[0]));
 	DEFINE(TASK_PT_IAOQ1, offsetof(struct task_struct, thread.regs.iaoq[1]));
 	DEFINE(TASK_PT_CR27, offsetof(struct task_struct, thread.regs.cr27));
+	DEFINE(TASK_PT_SYSCALL_RP, offsetof(struct task_struct, thread.regs.pad0));
 	DEFINE(TASK_PT_ORIG_R28, offsetof(struct task_struct, thread.regs.orig_r28));
 	DEFINE(TASK_PT_KSP, offsetof(struct task_struct, thread.regs.ksp));
 	DEFINE(TASK_PT_KPC, offsetof(struct task_struct, thread.regs.kpc));
@@ -225,6 +226,7 @@ int main(void)
 	DEFINE(PT_IAOQ0, offsetof(struct pt_regs, iaoq[0]));
 	DEFINE(PT_IAOQ1, offsetof(struct pt_regs, iaoq[1]));
 	DEFINE(PT_CR27, offsetof(struct pt_regs, cr27));
+	DEFINE(PT_SYSCALL_RP, offsetof(struct pt_regs, pad0));
 	DEFINE(PT_ORIG_R28, offsetof(struct pt_regs, orig_r28));
 	DEFINE(PT_KSP, offsetof(struct pt_regs, ksp));
 	DEFINE(PT_KPC, offsetof(struct pt_regs, kpc));
@@ -290,5 +292,11 @@ int main(void)
 	BLANK();
 	DEFINE(ASM_PDC_RESULT_SIZE, NUM_PDC_RESULT * sizeof(unsigned long));
 	BLANK();
+
+#ifdef CONFIG_SMP
+	DEFINE(ASM_ATOMIC_HASH_SIZE_SHIFT, __builtin_ffs(ATOMIC_HASH_SIZE)-1);
+	DEFINE(ASM_ATOMIC_HASH_ENTRY_SHIFT, __builtin_ffs(sizeof(__atomic_hash[0]))-1);
+#endif
+
 	return 0;
 }
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 3a44f7f..a7e9472 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -364,32 +364,6 @@
 	.align		32
 	.endm
 
-	/* The following are simple 32 vs 64 bit instruction
-	 * abstractions for the macros */
-	.macro		EXTR	reg1,start,length,reg2
-#ifdef CONFIG_64BIT
-	extrd,u		\reg1,32+(\start),\length,\reg2
-#else
-	extrw,u		\reg1,\start,\length,\reg2
-#endif
-	.endm
-
-	.macro		DEP	reg1,start,length,reg2
-#ifdef CONFIG_64BIT
-	depd		\reg1,32+(\start),\length,\reg2
-#else
-	depw		\reg1,\start,\length,\reg2
-#endif
-	.endm
-
-	.macro		DEPI	val,start,length,reg
-#ifdef CONFIG_64BIT
-	depdi		\val,32+(\start),\length,\reg
-#else
-	depwi		\val,\start,\length,\reg
-#endif
-	.endm
-
 	/* In LP64, the space contains part of the upper 32 bits of the
 	 * fault.  We have to extract this and place it in the va,
 	 * zeroing the corresponding bits in the space register */
@@ -442,19 +416,19 @@
 	 */
 	.macro		L2_ptep	pmd,pte,index,va,fault
 #if PT_NLEVELS == 3
-	EXTR		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
+	extru		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
 #else
-	EXTR		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
+	extru		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
 #endif
-	DEP             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
+	dep             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	copy		%r0,\pte
 	ldw,s		\index(\pmd),\pmd
 	bb,>=,n		\pmd,_PxD_PRESENT_BIT,\fault
-	DEP		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
+	dep		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
 	copy		\pmd,%r9
 	SHLREG		%r9,PxD_VALUE_SHIFT,\pmd
-	EXTR		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
-	DEP		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
+	extru		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
+	dep		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd
 	LDREG		%r0(\pmd),\pte		/* pmd is now pte */
 	bb,>=,n		\pte,_PAGE_PRESENT_BIT,\fault
@@ -605,7 +579,7 @@
 	depdi		0,31,32,\tmp
 #endif
 	copy		\va,\tmp1
-	DEPI		0,31,23,\tmp1
+	depi		0,31,23,\tmp1
 	cmpb,COND(<>),n	\tmp,\tmp1,\fault
 	ldi		(_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),\prot
 	depd,z		\prot,8,7,\prot
@@ -758,6 +732,10 @@ ENTRY(__kernel_thread)
 
 	STREG	%r22, PT_GR22(%r1)	/* save r22 (arg5) */
 	copy	%r0, %r22		/* user_tid */
+	copy	%r0, %r21		/* child_tid */
+#else
+	stw	%r0, -52(%r30)	     	/* user_tid */
+	stw	%r0, -56(%r30)	     	/* child_tid */
 #endif
 	STREG	%r26, PT_GR26(%r1)  /* Store function & argument for child */
 	STREG	%r25, PT_GR25(%r1)
@@ -765,7 +743,7 @@ ENTRY(__kernel_thread)
 	ldo	CLONE_VM(%r26), %r26   /* Force CLONE_VM since only init_mm */
 	or	%r26, %r24, %r26      /* will have kernel mappings.	 */
 	ldi	1, %r25			/* stack_start, signals kernel thread */
-	stw	%r0, -52(%r30)	     	/* user_tid */
+	ldi	0, %r23			/* child_stack_size */
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
@@ -972,7 +950,10 @@ intr_check_sig:
 	BL	do_notify_resume,%r2
 	copy	%r16, %r26			/* struct pt_regs *regs */
 
-	b,n	intr_check_sig
+	mfctl   %cr30,%r16		/* Reload */
+	LDREG	TI_TASK(%r16), %r16	/* thread_info -> task_struct */
+	b	intr_check_sig
+	ldo	TASK_REGS(%r16),%r16
 
 intr_restore:
 	copy            %r16,%r29
@@ -997,13 +978,6 @@ intr_restore:
 
 	rfi
 	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
-	nop
 
 #ifndef CONFIG_PREEMPT
 # define intr_do_preempt	intr_restore
@@ -1026,14 +1000,12 @@ intr_do_resched:
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	ldil	L%intr_check_sig, %r2
-#ifndef CONFIG_64BIT
-	b	schedule
-#else
-	load32	schedule, %r20
-	bv	%r0(%r20)
-#endif
-	ldo	R%intr_check_sig(%r2), %r2
+	BL	schedule,%r2
+	nop
+	mfctl   %cr30,%r16		/* Reload */
+	LDREG	TI_TASK(%r16), %r16	/* thread_info -> task_struct */
+	b	intr_check_sig
+	ldo	TASK_REGS(%r16),%r16
 
 	/* preempt the current task on returning to kernel
 	 * mode from an interrupt, iff need_resched is set,
@@ -1772,9 +1744,9 @@ ENTRY(sys_fork_wrapper)
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	/* These are call-clobbered registers and therefore
-	   also syscall-clobbered (we hope). */
-	STREG	%r2,PT_GR19(%r1)	/* save for child */
+	STREG	%r2,PT_SYSCALL_RP(%r1)
+
+	/* WARNING - Clobbers r21, userspace must save! */
 	STREG	%r30,PT_GR21(%r1)
 
 	LDREG	PT_GR30(%r1),%r25
@@ -1804,7 +1776,7 @@ ENTRY(child_return)
 	nop
 
 	LDREG	TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE-FRAME_SIZE(%r30), %r1
-	LDREG	TASK_PT_GR19(%r1),%r2
+	LDREG	TASK_PT_SYSCALL_RP(%r1),%r2
 	b	wrapper_exit
 	copy	%r0,%r28
 ENDPROC(child_return)
@@ -1823,8 +1795,9 @@ ENTRY(sys_clone_wrapper)
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	/* WARNING - Clobbers r19 and r21, userspace must save these! */
-	STREG	%r2,PT_GR19(%r1)	/* save for child */
+	STREG	%r2,PT_SYSCALL_RP(%r1)
+
+	/* WARNING - Clobbers r21, userspace must save! */
 	STREG	%r30,PT_GR21(%r1)
 	BL	sys_clone,%r2
 	copy	%r1,%r24
@@ -1847,7 +1820,9 @@ ENTRY(sys_vfork_wrapper)
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	STREG	%r2,PT_GR19(%r1)	/* save for child */
+	STREG	%r2,PT_SYSCALL_RP(%r1)
+
+	/* WARNING - Clobbers r21, userspace must save! */
 	STREG	%r30,PT_GR21(%r1)
 
 	BL	sys_vfork,%r2
@@ -2076,9 +2051,10 @@ syscall_restore:
 	LDREG	TASK_PT_GR31(%r1),%r31	   /* restore syscall rp */
 
 	/* NOTE: We use rsm/ssm pair to make this operation atomic */
+	LDREG   TASK_PT_GR30(%r1),%r1              /* Get user sp */
 	rsm     PSW_SM_I, %r0
-	LDREG   TASK_PT_GR30(%r1),%r30             /* restore user sp */
-	mfsp	%sr3,%r1			   /* Get users space id */
+	copy    %r1,%r30                           /* Restore user sp */
+	mfsp    %sr3,%r1                           /* Get user space id */
 	mtsp    %r1,%sr7                           /* Restore sr7 */
 	ssm     PSW_SM_I, %r0
 
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index cb71f3d..84b3239 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -128,6 +128,14 @@ void __init setup_arch(char **cmdline_p)
 	printk(KERN_INFO "The 32-bit Kernel has started...\n");
 #endif
 
+	/* Consistency check on the size and alignments of our spinlocks */
+#ifdef CONFIG_SMP
+	BUILD_BUG_ON(sizeof(arch_spinlock_t) != __PA_LDCW_ALIGNMENT);
+	BUG_ON((unsigned long)&__atomic_hash[0] & (__PA_LDCW_ALIGNMENT-1));
+	BUG_ON((unsigned long)&__atomic_hash[1] & (__PA_LDCW_ALIGNMENT-1));
+#endif
+	BUILD_BUG_ON((1<<L1_CACHE_SHIFT) != L1_CACHE_BYTES);
+
 	pdc_console_init();
 
 #ifdef CONFIG_64BIT
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index f5f9602..68e75ce 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -47,18 +47,17 @@ ENTRY(linux_gateway_page)
 	KILL_INSN
 	.endr
 
-	/* ADDRESS 0xb0 to 0xb4, lws uses 1 insns for entry */
+	/* ADDRESS 0xb0 to 0xb8, lws uses two insns for entry */
 	/* Light-weight-syscall entry must always be located at 0xb0 */
 	/* WARNING: Keep this number updated with table size changes */
 #define __NR_lws_entries (2)
 
 lws_entry:
-	/* Unconditional branch to lws_start, located on the 
-	   same gateway page */
-	b,n	lws_start
+	gate	lws_start, %r0		/* increase privilege */
+	depi	3, 31, 2, %r31		/* Ensure we return into user mode. */
 
-	/* Fill from 0xb4 to 0xe0 */
-	.rept 11
+	/* Fill from 0xb8 to 0xe0 */
+	.rept 10
 	KILL_INSN
 	.endr
 
@@ -423,9 +422,6 @@ tracesys_sigexit:
 
 	*********************************************************/
 lws_start:
-	/* Gate and ensure we return to userspace */
-	gate	.+8, %r0
-	depi	3, 31, 2, %r31	/* Ensure we return to userspace */
 
 #ifdef CONFIG_64BIT
 	/* FIXME: If we are a 64-bit kernel just
@@ -442,7 +438,7 @@ lws_start:
 #endif	
 
         /* Is the lws entry number valid? */
-	comiclr,>>=	__NR_lws_entries, %r20, %r0
+	comiclr,>>	__NR_lws_entries, %r20, %r0
 	b,n	lws_exit_nosys
 
 	/* WARNING: Trashing sr2 and sr3 */
@@ -473,7 +469,7 @@ lws_exit:
 	/* now reset the lowest bit of sp if it was set */
 	xor	%r30,%r1,%r30
 #endif
-	be,n	0(%sr3, %r31)
+	be,n	0(%sr7, %r31)
 
 
 	
@@ -529,7 +525,6 @@ lws_compare_and_swap32:
 #endif
 
 lws_compare_and_swap:
-#ifdef CONFIG_SMP
 	/* Load start of lock table */
 	ldil	L%lws_lock_start, %r20
 	ldo	R%lws_lock_start(%r20), %r28
@@ -572,8 +567,6 @@ cas_wouldblock:
 	ldo	2(%r0), %r28				/* 2nd case */
 	b	lws_exit				/* Contended... */
 	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
-#endif
-/* CONFIG_SMP */
 
 	/*
 		prev = *addr;
@@ -601,13 +594,11 @@ cas_action:
 1:	ldw	0(%sr3,%r26), %r28
 	sub,<>	%r28, %r25, %r0
 2:	stw	%r24, 0(%sr3,%r26)
-#ifdef CONFIG_SMP
 	/* Free lock */
 	stw	%r20, 0(%sr2,%r20)
-# if ENABLE_LWS_DEBUG
+#if ENABLE_LWS_DEBUG
 	/* Clear thread register indicator */
 	stw	%r0, 4(%sr2,%r20)
-# endif
 #endif
 	/* Return to userspace, set no error */
 	b	lws_exit
@@ -615,12 +606,10 @@ cas_action:
 
 3:		
 	/* Error occured on load or store */
-#ifdef CONFIG_SMP
 	/* Free lock */
 	stw	%r20, 0(%sr2,%r20)
-# if ENABLE_LWS_DEBUG
+#if ENABLE_LWS_DEBUG
 	stw	%r0, 4(%sr2,%r20)
-# endif
 #endif
 	b	lws_exit
 	ldo	-EFAULT(%r0),%r21	/* set errno */
@@ -672,7 +661,6 @@ ENTRY(sys_call_table64)
 END(sys_call_table64)
 #endif
 
-#ifdef CONFIG_SMP
 	/*
 		All light-weight-syscall atomic operations 
 		will use this set of locks 
@@ -694,8 +682,6 @@ ENTRY(lws_lock_start)
 	.endr
 END(lws_lock_start)
 	.previous
-#endif
-/* CONFIG_SMP for lws_lock_start */
 
 .end
 
diff --git a/arch/parisc/lib/bitops.c b/arch/parisc/lib/bitops.c
index 353963d..bae6a86 100644
--- a/arch/parisc/lib/bitops.c
+++ b/arch/parisc/lib/bitops.c
@@ -15,6 +15,9 @@
 arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
 	[0 ... (ATOMIC_HASH_SIZE-1)]  = __ARCH_SPIN_LOCK_UNLOCKED
 };
+arch_spinlock_t __atomic_user_hash[ATOMIC_HASH_SIZE] __lock_aligned = {
+	[0 ... (ATOMIC_HASH_SIZE-1)]  = __ARCH_SPIN_LOCK_UNLOCKED
+};
 #endif
 
 #ifdef CONFIG_64BIT
diff --git a/kernel/fork.c b/kernel/fork.c
index f88bd98..108b1ed 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -608,7 +608,10 @@ void mm_release(struct task_struct *tsk, struct mm_struct *mm)
 			 * We don't check the error code - if userspace has
 			 * not set up a proper pointer then tough luck.
 			 */
+			unsigned long flags;
+			_atomic_spin_lock_irqsave_user(tsk->clear_child_tid, flags);
 			put_user(0, tsk->clear_child_tid);
+			_atomic_spin_unlock_irqrestore_user(tsk->clear_child_tid, flags);
 			sys_futex(tsk->clear_child_tid, FUTEX_WAKE,
 					1, NULL, NULL, 0);
 		}
@@ -1432,8 +1435,12 @@ long do_fork(unsigned long clone_flags,
 
 		nr = task_pid_vnr(p);
 
-		if (clone_flags & CLONE_PARENT_SETTID)
+		if (clone_flags & CLONE_PARENT_SETTID) {
+			unsigned long flags;
+			_atomic_spin_lock_irqsave_user(parent_tidptr, flags);
 			put_user(nr, parent_tidptr);
+			_atomic_spin_unlock_irqrestore_user(parent_tidptr, flags);
+		}
 
 		if (clone_flags & CLONE_VFORK) {
 			p->vfork_done = &vfork;
diff --git a/mm/memory.c b/mm/memory.c
index 09e4b1b..21c2916 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -616,7 +616,7 @@ copy_one_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	 * in the parent and the child
 	 */
 	if (is_cow_mapping(vm_flags)) {
-		ptep_set_wrprotect(src_mm, addr, src_pte);
+		ptep_set_wrprotect(vma, src_mm, addr, src_pte);
 		pte = pte_wrprotect(pte);
 	}
 
