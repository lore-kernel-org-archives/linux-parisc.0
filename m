Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA27496
	for <parisc-linux@puffin.external.hp.com>; Fri, 5 Jan 2001 10:32:18 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 5 Jan 2001 17:35:07 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Eakw-0003wp-00
	for parisc-linux@thepuffingroup.com; Fri, 05 Jan 2001 17:34:22 +0000
Date: Fri, 5 Jan 2001 17:34:22 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010105173422.B14195@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] semaphores
List-ID: <linux-parisc.vger.kernel.org>


ok, i've completely rewritten the semaphore code.  please review.

diff -urNX dontdiff linux-cvs/arch/parisc/kernel/semaphore.c linux-mine/arch/parisc/kernel/semaphore.c
--- linux-cvs/arch/parisc/kernel/semaphore.c	Sun Dec 31 01:50:27 2000
+++ linux-mine/arch/parisc/kernel/semaphore.c	Fri Jan  5 17:05:49 2001
@@ -1,15 +1,9 @@
 /*
- * Just taken from alpha implementation.
- * This can't work well, perhaps.
- */
-/*
- *  Generic semaphore code. Buyer beware. Do your own
- * specific changes in <asm/semaphore-helper.h>
+ * Semaphore implementation Copyright (c) 2001 Matthew Wilcox
  */
 
 #include <linux/sched.h>
-#include <asm/semaphore-helper.h>
-#include <asm/atomic.h>	/* for xchg() definitions */
+#include <linux/spinlock.h>
 
 /*
  * Semaphores are implemented using a two-way counter:
@@ -43,198 +37,119 @@
  */
 void __up(struct semaphore *sem)
 {
-	wake_one_more(sem);
 	wake_up(&sem->wait);
 }
 
-/*
- * Perform the "down" function.  Return zero for semaphore acquired,
- * return negative for signalled out of the function.
- *
- * If called from __down, the return is ignored and the wait loop is
- * not interruptible.  This means that a task waiting on a semaphore
- * using "down()" cannot be killed until someone does an "up()" on
- * the semaphore.
- *
- * If called from __down_interruptible, the return value gets checked
- * upon return.  If the return value is negative then the task continues
- * with the negative value in the return register (it can be tested by
- * the caller).
- *
- * Either form may be used in conjunction with "up()".
- *
- */
-
-
-#define DOWN_HEAD(task_state)						\
-									\
-									\
-	current->state = (task_state);					\
-	add_wait_queue(&sem->wait, &wait);				\
-									\
-	/*								\
-	 * Ok, we're set up.  sem->count is known to be less than zero	\
-	 * so we must wait.						\
-	 *								\
-	 * We can let go the lock for purposes of waiting.		\
-	 * We re-acquire it after awaking so as to protect		\
-	 * all semaphore operations.					\
-	 *								\
-	 * If "up()" is called before we call waking_non_zero() then	\
-	 * we will catch it right away.  If it is called later then	\
-	 * we will have to go through a wakeup cycle to catch it.	\
-	 *								\
-	 * Multiple waiters contend for the semaphore lock to see	\
-	 * who gets to gate through and who has to wait some more.	\
-	 */								\
-	for (;;) {
-
-#define DOWN_TAIL(task_state)			\
-		current->state = (task_state);	\
-	}					\
-	current->state = TASK_RUNNING;		\
-	remove_wait_queue(&sem->wait, &wait);
-
 void __down(struct semaphore * sem)
 {
 	DECLARE_WAITQUEUE(wait, current);
 
-	DOWN_HEAD(TASK_UNINTERRUPTIBLE)
-	if (waking_non_zero(sem))
-		break;
-	schedule();
-	DOWN_TAIL(TASK_UNINTERRUPTIBLE)
-}
-
-int __down_interruptible(struct semaphore * sem)
-{
-	DECLARE_WAITQUEUE(wait, current);
-	int ret = 0;
-
-	DOWN_HEAD(TASK_INTERRUPTIBLE)
-
-	ret = waking_non_zero_interruptible(sem, current);
-	if (ret)
-	{
-		if (ret == 1)
-			/* ret != 0 only if we get interrupted -arca */
-			ret = 0;
-		break;
-	}
-	schedule();
-	DOWN_TAIL(TASK_INTERRUPTIBLE)
-	return ret;
-}
-
-int __down_trylock(struct semaphore * sem)
-{
-	return waking_non_zero_trylock(sem);
-}
-
-
-/* Wait for the lock to become unbiased.  Readers
- * are non-exclusive. =)
- */
-void down_read_failed(struct rw_semaphore *sem)
-{
-	DECLARE_WAITQUEUE(wait, current);
-
-	__up_read(sem);	/* this takes care of granting the lock */
-
-	add_wait_queue(&sem->wait, &wait);
-
-	while (atomic_read(&sem->count) < 0) {
-		set_task_state(current, TASK_UNINTERRUPTIBLE);
-		if (atomic_read(&sem->count) >= 0)
+	/* protected by the sentry still -- use unlocked version */
+	__add_wait_queue_tail(&sem->wait, &wait);
+	spin_unlock(&sem->sentry);
+
+	for(;;) {
+		set_task_state(current, TASK_INTERRUPTIBLE | TASK_EXCLUSIVE);
+		/* we can _read_ this without the sentry */
+		if (sem->count > 0)
 			break;
 		schedule();
 	}
 
-	remove_wait_queue(&sem->wait, &wait);
+	spin_lock(&sem->sentry);
+	__remove_wait_queue(&sem->wait, &wait);
 	current->state = TASK_RUNNING;
 }
 
-void down_read_failed_biased(struct rw_semaphore *sem)
+int __down_interruptible(struct semaphore * sem)
 {
+	int ret = 0;
 	DECLARE_WAITQUEUE(wait, current);
 
-	add_wait_queue(&sem->wait, &wait);	/* put ourselves at the head of the list */
-
-	for (;;) {
-		if (sem->read_bias_granted && xchg(&sem->read_bias_granted, 0))
+	/* protected by the sentry still -- use unlocked version */
+	__add_wait_queue_tail(&sem->wait, &wait);
+	spin_unlock(&sem->sentry);
+
+	for(;;) {
+		set_task_state(current, TASK_INTERRUPTIBLE | TASK_EXCLUSIVE);
+		/* we can _read_ this without the sentry */
+		if (sem->count > 0)
 			break;
-		set_task_state(current, TASK_UNINTERRUPTIBLE);
-                if (!sem->read_bias_granted)
-			schedule();
+		if (signal_pending(current)) {
+			ret = -EINTR;
+			break;
+		}
+		schedule();
 	}
+	spin_lock(&sem->sentry);
 
-	remove_wait_queue(&sem->wait, &wait);
+	__remove_wait_queue(&sem->wait, &wait);
 	current->state = TASK_RUNNING;
+
+	return ret;
 }
 
+/* Read/write semaphores below this point */
 
-/* Wait for the lock to become unbiased. Since we're
- * a writer, we'll make ourselves exclusive.
- */
-void down_write_failed(struct rw_semaphore *sem)
+/* A writer already holds this lock, so we have to sleep. */
+void __down_read_failed(struct rw_semaphore *sem)
 {
 	DECLARE_WAITQUEUE(wait, current);
 
-	__up_write(sem);	/* this takes care of granting the lock */
-
-	add_wait_queue_exclusive(&sem->wait, &wait);
+	/* protected by the sentry still -- use unlocked version */
+	__add_wait_queue(&sem->readers, &wait);
+	spin_unlock(&sem->sentry);
 
-	while (atomic_read(&sem->count) < 0) {
-		set_task_state(current, TASK_UNINTERRUPTIBLE | TASK_EXCLUSIVE);
-		if (atomic_read(&sem->count) >= 0)
-			break;	/* we must attempt to aquire or bias the lock */
+	for(;;) {
+		set_task_state(current, TASK_UNINTERRUPTIBLE);
+		/* we can _read_ this without the sentry */
+		if (sem->rw_count > 0)
+			break;
 		schedule();
 	}
+	spin_lock(&sem->sentry);
 
-	remove_wait_queue(&sem->wait, &wait);
+	__remove_wait_queue(&sem->readers, &wait);
 	current->state = TASK_RUNNING;
 }
 
-void down_write_failed_biased(struct rw_semaphore *sem)
+/* Either a writer or some readers already hold this lock. */
+void __down_write_failed(struct rw_semaphore *sem)
 {
 	DECLARE_WAITQUEUE(wait, current);
 
-	add_wait_queue_exclusive(&sem->write_bias_wait, &wait);	/* put ourselves at the end of the list */
+	__add_wait_queue_tail(&sem->writers, &wait);
+	spin_unlock(&sem->sentry);
 
-	for (;;) {
-		if (sem->write_bias_granted && xchg(&sem->write_bias_granted, 0))
-			break;
+	for(;;) {
 		set_task_state(current, TASK_UNINTERRUPTIBLE | TASK_EXCLUSIVE);
-		if (!sem->write_bias_granted)
-			schedule();
+		/* we can _read_ this without the sentry */
+		if (sem->rw_count >= 0)
+			break;
+		schedule();
 	}
 
-	remove_wait_queue(&sem->write_bias_wait, &wait);
+	spin_lock(&sem->sentry);
+	__remove_wait_queue(&sem->writers, &wait);
 	current->state = TASK_RUNNING;
-
-	/* if the lock is currently unbiased, awaken the sleepers
-	 * FIXME: this wakes up the readers early in a bit of a
-	 * stampede -> bad!
-	 */
-	if (atomic_read(&sem->count) >= 0)
-		wake_up(&sem->wait);
 }
 
-
-/* Called when someone has done an up that transitioned from
- * negative to non-negative, meaning that the lock has been
- * granted to whomever owned the bias.
+/* Called when a writer has raised the semaphore.  There may still be
+ * other writers waiting, but the readers have priority now.
  */
 void rwsem_wake_readers(struct rw_semaphore *sem)
 {
-	if (xchg(&sem->read_bias_granted, 1))
-		BUG();
-	wake_up(&sem->wait);
+	/* We only reset the BIAS if no writers are waiting. */
+	if (!waitqueue_active(&sem->writers))
+		sem->rw_count += RW_LOCK_BIAS;
+
+	wake_up(&sem->readers);
 }
 
+/* Called when the last reader has raised the semaphore.  Other readers
+ * may be blocked until this point, but the writer gets priority now.
+ */
 void rwsem_wake_writer(struct rw_semaphore *sem)
 {
-	if (xchg(&sem->write_bias_granted, 1))
-		BUG();
-	wake_up(&sem->write_bias_wait);
+	wake_up(&sem->writers);
 }
diff -urNX dontdiff linux-cvs/include/asm-parisc/semaphore-helper.h linux-mine/include/asm-parisc/semaphore-helper.h
--- linux-cvs/include/asm-parisc/semaphore-helper.h	Fri Dec 24 17:05:04 1999
+++ linux-mine/include/asm-parisc/semaphore-helper.h	Thu Jan  1 01:00:00 1970
@@ -1,89 +0,0 @@
-#ifndef _ASM_PARISC_SEMAPHORE_HELPER_H
-#define _ASM_PARISC_SEMAPHORE_HELPER_H
-
-/*
- * SMP- and interrupt-safe semaphores helper functions.
- *
- * (C) Copyright 1996 Linus Torvalds
- * (C) Copyright 1999 Andrea Arcangeli
- */
-
-/*
- * These two _must_ execute atomically wrt each other.
- *
- * This is trivially done with load_locked/store_cond,
- * which we have.  Let the rest of the losers suck eggs.
- */
-static __inline__ void wake_one_more(struct semaphore * sem)
-{
-	atomic_inc((atomic_t *)&sem->waking);
-}
-
-static __inline__ int waking_non_zero(struct semaphore *sem)
-{
-	unsigned long flags;
-	int ret = 0;
-
-	spin_lock_irqsave(&semaphore_wake_lock, flags);
-	if (sem->waking > 0) {
-		sem->waking--;
-		ret = 1;
-	}
-	spin_unlock_irqrestore(&semaphore_wake_lock, flags);
-	return ret;
-}
-
-/*
- * waking_non_zero_interruptible:
- *	1	got the lock
- *	0	go to sleep
- *	-EINTR	interrupted
- *
- * We must undo the sem->count down_interruptible() increment while we are
- * protected by the spinlock in order to make atomic this atomic_inc() with the
- * atomic_read() in wake_one_more(), otherwise we can race. -arca
- */
-static __inline__ int waking_non_zero_interruptible(struct semaphore *sem,
-						struct task_struct *tsk)
-{
-	unsigned long flags;
-	int ret = 0;
-
-	spin_lock_irqsave(&semaphore_wake_lock, flags);
-	if (sem->waking > 0) {
-		sem->waking--;
-		ret = 1;
-	} else if (signal_pending(tsk)) {
-		atomic_inc(&sem->count);
-		ret = -EINTR;
-	}
-	spin_unlock_irqrestore(&semaphore_wake_lock, flags);
-	return ret;
-}
-
-/*
- * waking_non_zero_trylock:
- *	1	failed to lock
- *	0	got the lock
- *
- * We must undo the sem->count down_trylock() increment while we are
- * protected by the spinlock in order to make atomic this atomic_inc() with the
- * atomic_read() in wake_one_more(), otherwise we can race. -arca
- */
-static __inline__ int waking_non_zero_trylock(struct semaphore *sem)
-{
-	unsigned long flags;
-	int ret = 1;
-
-	spin_lock_irqsave(&semaphore_wake_lock, flags);
-	if (sem->waking <= 0)
-		atomic_inc(&sem->count);
-	else {
-		sem->waking--;
-		ret = 0;
-	}
-	spin_unlock_irqrestore(&semaphore_wake_lock, flags);
-	return ret;
-}
-
-#endif /* _ASM_PARISC_SEMAPHORE_HELPER_H */
diff -urNX dontdiff linux-cvs/include/asm-parisc/semaphore.h linux-mine/include/asm-parisc/semaphore.h
--- linux-cvs/include/asm-parisc/semaphore.h	Sat Aug 12 00:40:13 2000
+++ linux-mine/include/asm-parisc/semaphore.h	Fri Jan  5 16:45:22 2001
@@ -1,34 +1,28 @@
 #ifndef _ASM_PARISC_SEMAPHORE_H
 #define _ASM_PARISC_SEMAPHORE_H
 
-#include <linux/linkage.h>
-
 /*
  * SMP- and interrupt-safe semaphores.
  *
  * (C) Copyright 1996 Linus Torvalds
  *
- * SuperH verison by Niibe Yutaka
+ * PA-RISC version Copyright (c) 2001 Matthew Wilcox
  *
  */
 
-/* if you're going to use out-of-line slowpaths, use .section .lock.text,
- * not .text.lock or the -ffunction-sections monster will eat you alive
- */
-
 #include <linux/spinlock.h>
+#include <linux/wait.h>
 
 #include <asm/system.h>
-#include <asm/atomic.h>
 
 struct semaphore {
-	atomic_t count;
-	int waking;
+	spinlock_t	sentry;
+	int		count;
 	wait_queue_head_t wait;
 #if WAITQUEUE_DEBUG
 	long __magic;
 #endif
-};
+} ;
 
 #if WAITQUEUE_DEBUG
 # define __SEM_DEBUG_INIT(name) \
@@ -38,7 +32,7 @@
 #endif
 
 #define __SEMAPHORE_INITIALIZER(name,count) \
-{ ATOMIC_INIT(count), 0, __WAIT_QUEUE_HEAD_INITIALIZER((name).wait) \
+{ SPIN_LOCK_UNLOCKED, count, __WAIT_QUEUE_HEAD_INITIALIZER((name).wait) \
 	__SEM_DEBUG_INIT(name) }
 
 #define __MUTEX_INITIALIZER(name) \
@@ -52,18 +46,7 @@
 
 extern inline void sema_init (struct semaphore *sem, int val)
 {
-/*
- *	*sem = (struct semaphore)__SEMAPHORE_INITIALIZER((*sem),val);
- *
- * i'd rather use the more flexible initialization above, but sadly
- * GCC 2.7.2.3 emits a bogus warning. EGCS doesnt. Oh well.
- */
-	atomic_set(&sem->count, val);
-	sem->waking = 0;
-	init_waitqueue_head(&sem->wait);
-#if WAITQUEUE_DEBUG
-	sem->__magic = (long)&sem->__magic;
-#endif
+	*sem = (struct semaphore)__SEMAPHORE_INITIALIZER((*sem),val);
 }
 
 static inline void init_MUTEX (struct semaphore *sem)
@@ -76,11 +59,6 @@
 	sema_init(sem, 0);
 }
 
-asmlinkage void __down_failed(void /* special register calling convention */);
-asmlinkage int  __down_failed_interruptible(void  /* params in registers */);
-asmlinkage int  __down_failed_trylock(void  /* params in registers */);
-asmlinkage void __up_wakeup(void /* special register calling convention */);
-
 asmlinkage void __down(struct semaphore * sem);
 asmlinkage int  __down_interruptible(struct semaphore * sem);
 asmlinkage int  __down_trylock(struct semaphore * sem);
@@ -88,37 +66,50 @@
 
 extern spinlock_t semaphore_wake_lock;
 
+/* Sempahores can be `tried' from irq context.  So we have to disable
+ * interrupts while we're messing with the semaphore.  Sorry.
+ */
+
 extern __inline__ void down(struct semaphore * sem)
 {
+	int flags;
 #if WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
 
-	if (atomic_dec_return(&sem->count) < 0)
+	spin_lock_irqsave(&sem->sentry, flags);
+	if (--sem->count < 0)
 		__down(sem);
+	spin_unlock_irqrestore(&sem->sentry, flags);
 }
 
 extern __inline__ int down_interruptible(struct semaphore * sem)
 {
+	int flags;
 	int ret = 0;
 #if WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
 
-	if (atomic_dec_return(&sem->count) < 0)
+	spin_lock_irqsave(&sem->sentry, flags);
+	if (--sem->count < 0)
 		ret = __down_interruptible(sem);
+	spin_unlock_irqrestore(&sem->sentry, flags);
 	return ret;
 }
 
 extern __inline__ int down_trylock(struct semaphore * sem)
 {
+	int flags;
 	int ret = 0;
 #if WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
 
-	if (atomic_dec_return(&sem->count) < 0)
+	spin_lock_irqsave(&sem->sentry, flags);
+	if (--sem->count < 0)
 		ret = __down_trylock(sem);
+	spin_unlock_irqrestore(&sem->sentry, flags);
 	return ret;
 }
 
@@ -128,11 +119,14 @@
  */
 extern __inline__ void up(struct semaphore * sem)
 {
+	int flags;
 #if WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
-	if (atomic_inc_return(&sem->count) <= 0)
+	spin_lock_irqsave(&sem->sentry, flags);
+	if (++sem->count <= 0)
 		__up(sem);
+	spin_unlock_irqrestore(&sem->sentry, flags);
 }
 
 /* rw mutexes (should that be mutices? =) -- throw rw
@@ -146,9 +140,8 @@
  * (in which case it goes to sleep).
  *
  * The value 0x01000000 supports up to 128 processors and
- * lots of processes.  BIAS must be chosen such that subl'ing
- * BIAS once per CPU will result in the long remaining
- * negative.
+ * lots of processes.  BIAS must be chosen such that subtracting
+ * BIAS twice will result in the value remaining negative.
  *
  * In terms of fairness, this should result in the lock
  * flopping back and forth between readers and writers
@@ -156,18 +149,19 @@
  *
  *              -ben
  */
+/* NOTE: There is currently no provision for attempting to acquire
+ * rw_sems from interrupt context.  These routines will require more
+ * work if this is to be allowed.
+ */
 struct rw_semaphore {
-        atomic_t                count;
-        volatile unsigned char  write_bias_granted;
-        volatile unsigned char  read_bias_granted;
-        volatile unsigned char  pad1;
-        volatile unsigned char  pad2;
-        wait_queue_head_t       wait;
-        wait_queue_head_t       write_bias_wait;
-#if WAITQUEUE_DEBUG
-        long                    __magic;
-        atomic_t                readers;
-        atomic_t                writers;
+	spinlock_t		sentry;
+	volatile int		rw_count;
+        wait_queue_head_t       writers;
+        wait_queue_head_t       readers;
+#if WAITQUEUE_DEBUG
+        long			__magic;
+        volatile int		n_readers;
+        volatile int		n_writers;
 #endif
 };
 
@@ -180,8 +174,8 @@
 #define RW_LOCK_BIAS 0x01000000
 
 #define __RWSEM_INITIALIZER(name,count) \
-{ ATOMIC_INIT(count), 0, 0, 0, 0, __WAIT_QUEUE_HEAD_INITIALIZER((name).wait), \
-        __WAIT_QUEUE_HEAD_INITIALIZER((name).write_bias_wait) \
+{ SPIN_LOCK_UNLOCKED, count, __WAIT_QUEUE_HEAD_INITIALIZER((name).writers), \
+        __WAIT_QUEUE_HEAD_INITIALIZER((name).readers) \
         __SEM_DEBUG_INIT(name) __RWSEM_DEBUG_INIT }
 
 #define __DECLARE_RWSEM_GENERIC(name,count) \
@@ -193,109 +187,88 @@
 
 extern inline void init_rwsem(struct rw_semaphore *sem)
 {
-        atomic_set(&sem->count, RW_LOCK_BIAS);
-        sem->read_bias_granted = 0;
-        sem->write_bias_granted = 0;
-        init_waitqueue_head(&sem->wait);
-        init_waitqueue_head(&sem->write_bias_wait);
-#if WAITQUEUE_DEBUG
-        sem->__magic = (long)&sem->__magic;
-        atomic_set(&sem->readers, 0);
-        atomic_set(&sem->writers, 0);
-#endif
+	*sem = (struct rw_semaphore) __RWSEM_INITIALIZER(*sem, RW_LOCK_BIAS);
 }
 
-#ifdef FIXME_WILLY_FIXME_FOR_REAL_THIS_TIME
-extern struct rw_semaphore *__build_read_lock(struct rw_semaphore *sem, const char *what);
-extern struct rw_semaphore *__build_write_lock(struct rw_semaphore *sem, const char *what);
-#endif
-
 /* we use FASTCALL convention for the helpers */
-extern struct rw_semaphore *FASTCALL(__down_read_failed(struct rw_semaphore *sem));
-extern struct rw_semaphore *FASTCALL(__down_write_failed(struct rw_semaphore *sem));
-extern struct rw_semaphore *FASTCALL(__rwsem_wake(struct rw_semaphore *sem));
+extern void FASTCALL(__down_read_failed(struct rw_semaphore *sem));
+extern void FASTCALL(__down_write_failed(struct rw_semaphore *sem));
+extern void FASTCALL(rwsem_wake_readers(struct rw_semaphore *sem));
+extern void FASTCALL(rwsem_wake_writer(struct rw_semaphore *sem));
 
 extern inline void down_read(struct rw_semaphore *sem)
 {
+	int count;
+	spin_lock(&sem->sentry);
 #if WAITQUEUE_DEBUG
         if (sem->__magic != (long)&sem->__magic)
                 BUG();
 #endif
-#ifdef FIXME_WILLY_FIXME_FOR_REAL_THIS_TIME
-        __build_read_lock(sem, "__down_read_failed");
-#endif
+	count = sem->rw_count - 1;
+	if (count < 0)
+		__down_read_failed(sem);
+	sem->rw_count = count;
 #if WAITQUEUE_DEBUG
-        if (sem->write_bias_granted)
-                BUG();
-        if (atomic_read(&sem->writers))
+        if (sem->n_writers)
                 BUG();
-        atomic_inc(&sem->readers);
+        sem->n_readers++;
 #endif
+	spin_unlock(&sem->sentry);
 }
 
 extern inline void down_write(struct rw_semaphore *sem)
 {
+	int count;
+	spin_lock(&sem->sentry);
 #if WAITQUEUE_DEBUG
         if (sem->__magic != (long)&sem->__magic)
                 BUG();
 #endif
-#ifdef FIXME_WILLY_FIXME_FOR_REAL_THIS_TIME
-        __build_write_lock(sem, "__down_write_failed");
-#endif
+	count = sem->rw_count - RW_LOCK_BIAS;
+	if (count != 0)
+		__down_write_failed(sem);
 #if WAITQUEUE_DEBUG
-        if (atomic_read(&sem->writers))
-                BUG();
-        if (atomic_read(&sem->readers))
+        if (sem->n_writers)
                 BUG();
-        if (sem->read_bias_granted)
+        if (sem->n_readers)
                 BUG();
-        if (sem->write_bias_granted)
-                BUG();
-        atomic_inc(&sem->writers);
+        sem->n_writers = 1;
 #endif
-}
-
-/* When a reader does a release, the only significant
- * case is when there was a writer waiting, and we've
- * bumped the count to 0: we must wake the writer up.
- */
-extern inline void __up_read(struct rw_semaphore *sem)
-{
-}
-
-/* releasing the writer is easy -- just release it and
- * wake up any sleepers.
- */
-extern inline void __up_write(struct rw_semaphore *sem)
-{
+	spin_unlock(&sem->sentry);
 }
 
 extern inline void up_read(struct rw_semaphore *sem)
 {
+	int count;
+	spin_lock(&sem->sentry);
 #if WAITQUEUE_DEBUG
-        if (sem->write_bias_granted)
-                BUG();
-        if (atomic_read(&sem->writers))
+        if (sem->n_writers)
                 BUG();
-        atomic_dec(&sem->readers);
+        sem->n_readers--;
 #endif
-        __up_read(sem);
+	count = sem->rw_count++;
+	if (count == 0)
+		rwsem_wake_writer(sem);
+	spin_unlock(&sem->sentry);
 }
 
 extern inline void up_write(struct rw_semaphore *sem)
 {
+	int count;
+	spin_lock(&sem->sentry);
 #if WAITQUEUE_DEBUG
-        if (sem->read_bias_granted)
-                BUG();
-        if (sem->write_bias_granted)
-                BUG();
-        if (atomic_read(&sem->readers))
+        if (sem->n_readers)
                 BUG();
-        if (atomic_read(&sem->writers) != 1)
+        if (sem->n_writers != 1)
                 BUG();
-        atomic_dec(&sem->writers);
+        sem->n_writers = 0;
 #endif
-        __up_write(sem);
+	count = sem->rw_count;
+	if (count < 0)
+		rwsem_wake_readers(sem);
+	else
+		sem->rw_count = RW_LOCK_BIAS;
+	spin_unlock(&sem->sentry);
 }
 
 #endif /* _ASM_PARISC_SEMAPHORE_H */
diff -urNX dontdiff linux-cvs/include/asm-parisc/spinlock.h linux-mine/include/asm-parisc/spinlock.h
--- linux-cvs/include/asm-parisc/spinlock.h	Wed Nov  8 20:36:55 2000
+++ linux-mine/include/asm-parisc/spinlock.h	Fri Jan  5 15:52:18 2001
@@ -3,13 +3,10 @@
 
 #include <asm/system.h>
 
-/* if you're going to use out-of-line slowpaths, use .section .lock.text,
- * not .text.lock or the -ffunction-sections monster will eat you alive
+/* Note that PA-RISC has to use `1' to mean unlocked and `0' to mean locked
+ * since it only has load-and-zero.
  */
 
-/* we seem to be the only architecture that uses 0 to mean locked - but we
- * have to.  prumpf */
-
 #undef SPIN_LOCK_UNLOCKED
 #define SPIN_LOCK_UNLOCKED (spinlock_t) { 1 }
 
@@ -17,8 +14,15 @@
 
 #define spin_unlock_wait(x)	do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 1)
 
+#if 1
+#define spin_lock(x) do { \
+	while (__ldcw (&(x)->lock) == 0) \
+		while (((volatile int)(x)->lock) == 0) ; } while (0)
+
+#else
 #define spin_lock(x) \
 	do { while(__ldcw(&(x)->lock) == 0); } while(0)
+#endif
 	
 #define spin_unlock(x) \
 	do { (x)->lock = 1; } while(0)

-- 
Revolutions do not require corporate support.
