From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] bits of PREEMPT support
Date: Sun, 26 Feb 2006 02:31:18 -0500
Message-ID: <20060226073118.GA12426@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

Linux duet 2.6.16-rc4-ga0124d78-dirty #32 SMP PREEMPT Sun Feb 26 01:42:36 EST 2006 parisc64 GNU/Linux

My hope is that PREEMPT will expose some bugs for us...
Seems to be self-hosting, at least, a make -j8 on the kernel succeeded.

For this to be unbuggy, someone probably needs to do the legwork to
forward port the previous work in ftp.p-l.org/patches.

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index eca33cf..cf79639 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -169,14 +169,10 @@ config ARCH_DISCONTIGMEM_DEFAULT
 	def_bool y
 	depends on ARCH_DISCONTIGMEM_ENABLE
 
+source "kernel/Kconfig.preempt"
 source "kernel/Kconfig.hz"
 source "mm/Kconfig"
 
-config PREEMPT
-	bool
-#	bool "Preemptible Kernel"
-	default n
-
 config COMPAT
 	def_bool y
 	depends on 64BIT
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 9af4b22..920fb9c 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1014,14 +1014,23 @@ intr_restore:
 	nop
 	nop
 
+#ifndef CONFIG_PREEMPT
+# define intr_do_preempt	intr_restore
+#endif /* !CONFIG_PREEMPT */
+
 	.import schedule,code
 intr_do_resched:
-	/* Only do reschedule if we are returning to user space */
+	/* Only call schedule on return to userspace, if we're returning
+	 * to kernel space, we may schedule if CONFIG_PREEMPT...
+	 *
+	 * NOTE: Conditional nullification because of branch direction
+	 * doesn't matter, since both are NULL.
+	 */
 	LDREG	PT_IASQ0(%r16), %r20
-	CMPIB= 0,%r20,intr_restore /* backward */
+	CMPIB= 0,%r20,intr_do_preempt
 	nop
 	LDREG	PT_IASQ1(%r16), %r20
-	CMPIB= 0,%r20,intr_restore /* backward */
+	CMPIB= 0,%r20,intr_do_preempt
 	nop
 
 #ifdef CONFIG_64BIT
@@ -1037,7 +1046,37 @@ intr_do_resched:
 #endif
 	ldo	R%intr_check_sig(%r2), %r2
 
+	/* preempt the current task on returning to kernel
+	 * mode from an interrupt, iff need_resched is set,
+	 * and preempt_count is 0. otherwise, we continue on
+	 * our merry way back to the current running task.
+	 */
+#ifdef CONFIG_PREEMPT
+	.import preempt_schedule_irq,code
+intr_do_preempt:
+	/* current_thread_info()->preempt_count */
+	mfctl	%cr30, %r1
+	LDREG	TI_PRE_COUNT(%r1), %r19
+	CMPIB<>	0, %r19, intr_check_sig	/* if preempt_count > 0 */
+	nop				/* prev insn branched backwards */
+
+	/* this block looks redundant... we wouldn't be here if
+	 * TIF_NEED_RESCHED wasn't set */
+	LDREG	TI_FLAGS(%r1), %r20
+	bb,>=,n	%r20, 31 - TIF_NEED_RESCHED, intr_check_sig
+	nop				/* backward */
+	
+	ssm	0, %r20			/* are interrupts disabled? */
+	bb,<,n	%r20, 31 - PSW_I, intr_check_sig
+	nop				/* backward */
+
+1:	BL	preempt_schedule_irq, %r2
+	nop
 
+	mfctl	%cr30, %r1
+	LDREG	TI_FLAGS(%r1), %r20
+	bb,<,n	%r20, 31 - TIF_NEED_RESCHED, 1b
+#endif /* CONFIG_PREEMPT */
 	.import do_signal,code
 intr_do_signal:
 	/* 
diff --git a/include/asm-parisc/spinlock.h b/include/asm-parisc/spinlock.h
index 16c2ac0..bfa8125 100644
--- a/include/asm-parisc/spinlock.h
+++ b/include/asm-parisc/spinlock.h
@@ -134,14 +134,22 @@ static  __inline__ int __raw_write_trylo
 	return 1;
 }
 
-static __inline__ int __raw_is_read_locked(raw_rwlock_t *rw)
+/*
+ * read_can_lock - would read_trylock() succeed?
+ * @lock: the rwlock in question.
+ */
+static __inline__ int __raw_read_can_lock(raw_rwlock_t *rw)
 {
-	return rw->counter > 0;
+	return rw->counter >= 0;
 }
 
-static __inline__ int __raw_is_write_locked(raw_rwlock_t *rw)
+/*
+ * write_can_lock - would write_trylock() succeed?
+ * @lock: the rwlock in question.
+ */
+static __inline int __raw_write_can_lock(raw_rwlock_t *rw)
 {
-	return rw->counter < 0;
+	return !rw->counter;
 }
 
 #endif /* __ASM_SPINLOCK_H */
diff --git a/include/asm-parisc/thread_info.h b/include/asm-parisc/thread_info.h
index ac32f14..f2f83b0 100644
--- a/include/asm-parisc/thread_info.h
+++ b/include/asm-parisc/thread_info.h
@@ -49,7 +49,8 @@ struct thread_info {
 
 #endif /* !__ASSEMBLY */
 
-#define PREEMPT_ACTIVE          0x10000000
+#define PREEMPT_ACTIVE_BIT	28
+#define PREEMPT_ACTIVE		(1 << PREEMPT_ACTIVE_BIT)
 
 /*
  * thread information flags
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
