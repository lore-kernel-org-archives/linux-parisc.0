Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA17402
	for <parisc-linux@puffin.external.hp.com>; Sat, 13 Jan 2001 01:15:06 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 13 Jan 2001 08:18:37 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14HLtT-0005f3-00; Sat, 13 Jan 2001 08:18:35 +0000
Date: Sat, 13 Jan 2001 08:18:35 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] semaphores
Message-ID: <20010113081835.C16185@parcelfarce.linux.theplanet.co.uk>
References: <20010105173422.B14195@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010105173422.B14195@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Fri, Jan 05, 2001 at 05:34:22PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>


ok, bug found: i wasn't reenabling irqs if it had to sleep.  this patch
should fix that bug, but obviously there may be more.  Please someone
test this, I don't have access to any PA-RISC machines here in Sydney.
It's chockablock with debugging printk's, obviously i'll take those
out before committing this.

Index: arch/parisc/kernel/process.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/process.c,v
retrieving revision 1.26
diff -u -p -r1.26 process.c
--- process.c	2000/12/21 12:27:28	1.26
+++ process.c	2001/01/13 08:07:04
@@ -40,8 +40,6 @@
 #include <asm/gsc.h>
 #include <asm/processor.h>
 
-spinlock_t semaphore_wake_lock = SPIN_LOCK_UNLOCKED;
-
 #ifdef __LP64__
 /* The 64-bit code should work equally well in 32-bit land but I didn't
  * want to take the time to confirm that.  -PB
Index: arch/parisc/kernel/semaphore.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/semaphore.c,v
retrieving revision 1.3
diff -u -p -r1.3 semaphore.c
--- semaphore.c	2000/12/31 01:42:06	1.3
+++ semaphore.c	2001/01/13 08:07:05
@@ -1,15 +1,9 @@
 /*
- * Just taken from alpha implementation.
- * This can't work well, perhaps.
+ * Semaphore implementation Copyright (c) 2001 Matthew Wilcox
  */
-/*
- *  Generic semaphore code. Buyer beware. Do your own
- * specific changes in <asm/semaphore-helper.h>
- */
 
 #include <linux/sched.h>
-#include <asm/semaphore-helper.h>
-#include <asm/atomic.h>	/* for xchg() definitions */
+#include <linux/spinlock.h>
 
 /*
  * Semaphores are implemented using a two-way counter:
@@ -43,198 +37,124 @@
  */
 void __up(struct semaphore *sem)
 {
-	wake_one_more(sem);
 	wake_up(&sem->wait);
 }
-
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
 
-void __down(struct semaphore * sem)
+void __down(struct semaphore * sem, int *irq_flags)
 {
+	int flags = *irq_flags;
 	DECLARE_WAITQUEUE(wait, current);
 
-	DOWN_HEAD(TASK_UNINTERRUPTIBLE)
-	if (waking_non_zero(sem))
-		break;
-	schedule();
-	DOWN_TAIL(TASK_UNINTERRUPTIBLE)
-}
+	/* protected by the sentry still -- use unlocked version */
+	__add_wait_queue_tail(&sem->wait, &wait);
+	spin_unlock_irqrestore(&sem->sentry, flags);
 
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
+	for(;;) {
+		set_task_state(current, TASK_INTERRUPTIBLE | TASK_EXCLUSIVE);
+		/* we can _read_ this without the sentry */
+		if (sem->count > 0)
 			break;
 		schedule();
 	}
 
-	remove_wait_queue(&sem->wait, &wait);
+	spin_lock_irqsave(&sem->sentry, flags);
+	__remove_wait_queue(&sem->wait, &wait);
 	current->state = TASK_RUNNING;
+
+	*irq_flags = flags;
 }
 
-void down_read_failed_biased(struct rw_semaphore *sem)
+int __down_interruptible(struct semaphore * sem, int *irq_flags)
 {
+	int flags = *irq_flags;
+	int ret = 0;
 	DECLARE_WAITQUEUE(wait, current);
 
-	add_wait_queue(&sem->wait, &wait);	/* put ourselves at the head of the list */
-
-	for (;;) {
-		if (sem->read_bias_granted && xchg(&sem->read_bias_granted, 0))
+	/* protected by the sentry still -- use unlocked version */
+	__add_wait_queue_tail(&sem->wait, &wait);
+	spin_unlock_irqrestore(&sem->sentry, flags);
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
 
-	remove_wait_queue(&sem->wait, &wait);
+	spin_lock_irqsave(&sem->sentry, flags);
+	__remove_wait_queue(&sem->wait, &wait);
 	current->state = TASK_RUNNING;
+
+	*irq_flags = flags;
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
-
-	__up_write(sem);	/* this takes care of granting the lock */
 
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
Index: include/asm-parisc/semaphore.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/semaphore.h,v
retrieving revision 1.5
diff -u -p -r1.5 semaphore.h
--- semaphore.h	2000/08/11 23:40:13	1.5
+++ semaphore.h	2001/01/13 07:58:02
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
@@ -38,7 +32,7 @@ struct semaphore {
 #endif
 
 #define __SEMAPHORE_INITIALIZER(name,count) \
-{ ATOMIC_INIT(count), 0, __WAIT_QUEUE_HEAD_INITIALIZER((name).wait) \
+{ SPIN_LOCK_UNLOCKED, count, __WAIT_QUEUE_HEAD_INITIALIZER((name).wait) \
 	__SEM_DEBUG_INIT(name) }
 
 #define __MUTEX_INITIALIZER(name) \
@@ -52,18 +46,7 @@ struct semaphore {
 
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
@@ -76,50 +59,59 @@ static inline void init_MUTEX_LOCKED (st
 	sema_init(sem, 0);
 }
 
-asmlinkage void __down_failed(void /* special register calling convention */);
-asmlinkage int  __down_failed_interruptible(void  /* params in registers */);
-asmlinkage int  __down_failed_trylock(void  /* params in registers */);
-asmlinkage void __up_wakeup(void /* special register calling convention */);
-
-asmlinkage void __down(struct semaphore * sem);
-asmlinkage int  __down_interruptible(struct semaphore * sem);
-asmlinkage int  __down_trylock(struct semaphore * sem);
+asmlinkage void __down(struct semaphore * sem, int *irqflags);
+asmlinkage int  __down_interruptible(struct semaphore * sem, int *irqflags);
 asmlinkage void __up(struct semaphore * sem);
 
-extern spinlock_t semaphore_wake_lock;
+/* Sempahores can be `tried' from irq context.  So we have to disable
+ * interrupts while we're messing with the semaphore.  Sorry.
+ */
 
 extern __inline__ void down(struct semaphore * sem)
 {
+	int flags;
+	printk("down     %p\n", sem);
 #if WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
 
-	if (atomic_dec_return(&sem->count) < 0)
-		__down(sem);
+	spin_lock_irqsave(&sem->sentry, flags);
+	if (--sem->count < 0)
+		__down(sem, &flags);
+	spin_unlock_irqrestore(&sem->sentry, flags);
 }
 
 extern __inline__ int down_interruptible(struct semaphore * sem)
 {
+	int flags;
 	int ret = 0;
+	printk("down_int %p\n", sem);
 #if WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
 
-	if (atomic_dec_return(&sem->count) < 0)
-		ret = __down_interruptible(sem);
+	spin_lock_irqsave(&sem->sentry, flags);
+	if (--sem->count < 0)
+		ret = __down_interruptible(sem, &flags);
+	spin_unlock_irqrestore(&sem->sentry, flags);
 	return ret;
 }
 
+/* May not sleep. */
 extern __inline__ int down_trylock(struct semaphore * sem)
 {
-	int ret = 0;
+	int flags, count;
+	printk("down_try %p\n", sem);
 #if WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
 
-	if (atomic_dec_return(&sem->count) < 0)
-		ret = __down_trylock(sem);
-	return ret;
+	spin_lock_irqsave(&sem->sentry, flags);
+	count = sem->count - 1;
+	if (count >= 0)
+		sem->count = count;
+	spin_unlock_irqrestore(&sem->sentry, flags);
+	return (count >= 0);
 }
 
 /*
@@ -128,11 +120,16 @@ extern __inline__ int down_trylock(struc
  */
 extern __inline__ void up(struct semaphore * sem)
 {
+	int flags;
+	printk("up       %p\n", sem);
 #if WAITQUEUE_DEBUG
 	CHECK_MAGIC(sem->__magic);
 #endif
-	if (atomic_inc_return(&sem->count) <= 0)
+	spin_lock_irqsave(&sem->sentry, flags);
+	if (++sem->count <= 0)
 		__up(sem);
+	spin_unlock_irqrestore(&sem->sentry, flags);
+	printk("end_up   %p\n", sem);
 }
 
 /* rw mutexes (should that be mutices? =) -- throw rw
@@ -146,9 +143,8 @@ extern __inline__ void up(struct semapho
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
@@ -156,18 +152,19 @@ extern __inline__ void up(struct semapho
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
 
@@ -180,8 +177,8 @@ struct rw_semaphore {
 #define RW_LOCK_BIAS 0x01000000
 
 #define __RWSEM_INITIALIZER(name,count) \
-{ ATOMIC_INIT(count), 0, 0, 0, 0, __WAIT_QUEUE_HEAD_INITIALIZER((name).wait), \
-        __WAIT_QUEUE_HEAD_INITIALIZER((name).write_bias_wait) \
+{ SPIN_LOCK_UNLOCKED, count, __WAIT_QUEUE_HEAD_INITIALIZER((name).writers), \
+        __WAIT_QUEUE_HEAD_INITIALIZER((name).readers) \
         __SEM_DEBUG_INIT(name) __RWSEM_DEBUG_INIT }
 
 #define __DECLARE_RWSEM_GENERIC(name,count) \
@@ -193,109 +190,92 @@ struct rw_semaphore {
 
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
+	printk("down_read %p\n", sem);
+	spin_lock(&sem->sentry);
 #if WAITQUEUE_DEBUG
         if (sem->__magic != (long)&sem->__magic)
                 BUG();
-#endif
-#ifdef FIXME_WILLY_FIXME_FOR_REAL_THIS_TIME
-        __build_read_lock(sem, "__down_read_failed");
 #endif
+	count = sem->rw_count - 1;
+	if (count < 0)
+		__down_read_failed(sem);
+	sem->rw_count = count;
 #if WAITQUEUE_DEBUG
-        if (sem->write_bias_granted)
+        if (sem->n_writers)
                 BUG();
-        if (atomic_read(&sem->writers))
-                BUG();
-        atomic_inc(&sem->readers);
+        sem->n_readers++;
 #endif
+	spin_unlock(&sem->sentry);
 }
 
 extern inline void down_write(struct rw_semaphore *sem)
 {
+	int count;
+	printk("down_write %p\n", sem);
+	spin_lock(&sem->sentry);
 #if WAITQUEUE_DEBUG
         if (sem->__magic != (long)&sem->__magic)
                 BUG();
-#endif
-#ifdef FIXME_WILLY_FIXME_FOR_REAL_THIS_TIME
-        __build_write_lock(sem, "__down_write_failed");
 #endif
+	count = sem->rw_count - RW_LOCK_BIAS;
+	if (count != 0)
+		__down_write_failed(sem);
 #if WAITQUEUE_DEBUG
-        if (atomic_read(&sem->writers))
+        if (sem->n_writers)
                 BUG();
-        if (atomic_read(&sem->readers))
+        if (sem->n_readers)
                 BUG();
-        if (sem->read_bias_granted)
-                BUG();
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
-#if WAITQUEUE_DEBUG
-        if (sem->write_bias_granted)
-                BUG();
-        if (atomic_read(&sem->writers))
-                BUG();
-        atomic_dec(&sem->readers);
-#endif
-        __up_read(sem);
+	int count;
+	printk("up_read %p\n", sem);
+	spin_lock(&sem->sentry);
+#if WAITQUEUE_DEBUG
+        if (sem->n_writers)
+                BUG();
+        sem->n_readers--;
+#endif
+	count = sem->rw_count++;
+	if (count == 0)
+		rwsem_wake_writer(sem);
+	spin_unlock(&sem->sentry);
 }
 
 extern inline void up_write(struct rw_semaphore *sem)
 {
-#if WAITQUEUE_DEBUG
-        if (sem->read_bias_granted)
-                BUG();
-        if (sem->write_bias_granted)
-                BUG();
-        if (atomic_read(&sem->readers))
-                BUG();
-        if (atomic_read(&sem->writers) != 1)
-                BUG();
-        atomic_dec(&sem->writers);
-#endif
-        __up_write(sem);
+	int count;
+	printk("up_write %p\n", sem);
+	spin_lock(&sem->sentry);
+#if WAITQUEUE_DEBUG
+        if (sem->n_readers)
+                BUG();
+        if (sem->n_writers != 1)
+                BUG();
+        sem->n_writers = 0;
+#endif
+	count = sem->rw_count;
+	if (count < 0)
+		rwsem_wake_readers(sem);
+	else
+		sem->rw_count = RW_LOCK_BIAS;
+	spin_unlock(&sem->sentry);
 }
 
 #endif /* _ASM_PARISC_SEMAPHORE_H */
Index: include/asm-parisc/spinlock.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/spinlock.h,v
retrieving revision 1.5
diff -u -p -r1.5 spinlock.h
--- spinlock.h	2000/11/08 20:36:55	1.5
+++ spinlock.h	2001/01/13 07:58:02
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
Index: kernel/ksyms.c
===================================================================
RCS file: /home/cvs/parisc/linux/kernel/ksyms.c,v
retrieving revision 1.6
diff -u -p -r1.6 ksyms.c
--- ksyms.c	2000/11/10 21:45:04	1.6
+++ ksyms.c	2001/01/13 07:58:03
@@ -496,7 +496,9 @@ EXPORT_SYMBOL(is_bad_inode);
 EXPORT_SYMBOL(event);
 EXPORT_SYMBOL(__down);
 EXPORT_SYMBOL(__down_interruptible);
+#ifndef CONFIG_PARISC
 EXPORT_SYMBOL(__down_trylock);
+#endif
 EXPORT_SYMBOL(__up);
 EXPORT_SYMBOL(brw_page);
 

-- 
Revolutions do not require corporate support.
