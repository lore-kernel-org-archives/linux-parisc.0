Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B8A04A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 18:03:04 -0700 (MST)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel2.hp.com (Postfix) with ESMTP id 2959F5D
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 20:03:03 -0500 (EST)
Received: from daiml (chrysl.fc.hp.com [15.1.54.200])
	by ldl.fc.hp.com (Postfix) with ESMTP id 6A6645A979
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 17:58:36 -0700 (MST)
Received: from willy by daiml with local (Exim 3.12 #1 (Debian))
	id 14R1xm-0000Cw-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 08 Feb 2001 18:03:02 -0700
To: parisc-linux@lists.parisc-linux.org
Message-Id: <E14R1xm-0000Cw-00@daiml>
From: Matthew Wilcox <willy@ldl.fc.hp.com>
Date: Thu, 08 Feb 2001 18:03:02 -0700
Subject: [parisc-linux] another semaphore rewrite
List-ID: <linux-parisc.vger.kernel.org>

Here's another attempt at semaphores.  This one actually boots on a
UP J5k, caveat emptor as always.  I'm rewriting the rwsems right now,
don't look at that bit.

Index: arch/parisc/kernel/process.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/process.c,v
retrieving revision 1.27
diff -u -p -r1.27 process.c
--- process.c	2001/01/24 23:59:51	1.27
+++ process.c	2001/02/09 00:07:55
@@ -36,8 +36,6 @@
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
retrieving revision 1.4
diff -u -p -r1.4 semaphore.c
--- semaphore.c	2001/01/24 23:59:51	1.4
+++ semaphore.c	2001/02/09 00:07:55
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
@@ -23,9 +17,6 @@
  * needs to do something only if count was negative before
  * the increment operation.
  *
- * waking_non_zero() (from asm/semaphore.h) must execute
- * atomically.
- *
  * When __up() is called, the count was negative before
  * incrementing it, and we need to wake up somebody.
  *
@@ -43,198 +34,162 @@
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
+#define DOWN_HEAD						\
+	DECLARE_WAITQUEUE(wait, current);				\
+													\
+	/* Note that someone is waiting */				\
+	if (sem->count == 0)							\
+		sem->count = -1;							\
+													\
+	/* protected by the sentry still -- use unlocked version */	\
+	wait.flags = WQ_FLAG_EXCLUSIVE;					\
+	__add_wait_queue_tail(&sem->wait, &wait);		\
+lost_race:											\
+	spin_unlock_irq(&sem->sentry);					\
+
+#define DOWN_TAIL									\
+	spin_lock_irq(&sem->sentry);			\
+	if (sem->count < 0)					\
+		goto lost_race;						\
+	__remove_wait_queue(&sem->wait, &wait);	\
+	current->state = TASK_RUNNING;			\
+	if (!waitqueue_active(&sem->wait))		\
+		sem->count = 1;
 
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
-	DECLARE_WAITQUEUE(wait, current);
+	DOWN_HEAD
 
-	DOWN_HEAD(TASK_UNINTERRUPTIBLE)
-	if (waking_non_zero(sem))
-		break;
-	schedule();
-	DOWN_TAIL(TASK_UNINTERRUPTIBLE)
+	for(;;) {
+		set_task_state(current, TASK_INTERRUPTIBLE);
+		/* we can _read_ this without the sentry */
+		if (sem->count >= 0)
+			break;
+ 		schedule();
+ 	}
+
+	DOWN_TAIL
 }
 
 int __down_interruptible(struct semaphore * sem)
 {
-	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
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
 
-	__up_read(sem);	/* this takes care of granting the lock */
+	DOWN_HEAD
 
-	add_wait_queue(&sem->wait, &wait);
+	for(;;) {
+		set_task_state(current, TASK_INTERRUPTIBLE);
+		/* we can _read_ this without the sentry */
+		if (sem->count >= 0)
+			break;
 
-	while (atomic_read(&sem->count) < 0) {
-		set_task_state(current, TASK_UNINTERRUPTIBLE);
-		if (atomic_read(&sem->count) >= 0)
+		if (signal_pending(current)) {
+			ret = -EINTR;
 			break;
+		}
 		schedule();
 	}
-
-	remove_wait_queue(&sem->wait, &wait);
-	current->state = TASK_RUNNING;
-}
-
-void down_read_failed_biased(struct rw_semaphore *sem)
-{
-	DECLARE_WAITQUEUE(wait, current);
 
-	add_wait_queue(&sem->wait, &wait);	/* put ourselves at the head of the list */
+	DOWN_TAIL
 
-	for (;;) {
-		if (sem->read_bias_granted && xchg(&sem->read_bias_granted, 0))
-			break;
-		set_task_state(current, TASK_UNINTERRUPTIBLE);
-                if (!sem->read_bias_granted)
-			schedule();
-	}
-
-	remove_wait_queue(&sem->wait, &wait);
-	current->state = TASK_RUNNING;
+	return ret;
 }
 
+/* Read/write semaphores below this point */
 
-/* Wait for the lock to become unbiased. Since we're
- * a writer, we'll make ourselves exclusive.
- */
-void down_write_failed(struct rw_semaphore *sem)
+/* We must wait for a writer to up the semaphore */
+void down_read_failed(struct rw_semaphore *sem)
 {
 	DECLARE_WAITQUEUE(wait, current);
 
-	__up_write(sem);	/* this takes care of granting the lock */
+	/* If we're the first waiter, indicate that we exist */
+	if ((sem->rw_count & RWSEM_MASK) == 0)
+		sem->rw_count |= RWSEM_READ;
 
-	add_wait_queue_exclusive(&sem->wait, &wait);
+	__add_wait_queue(&sem->readers, &wait);
+	spin_unlock(&sem->sentry);
 
-	while (atomic_read(&sem->count) < 0) {
+	while (sem->rw_count < 0) {
 		set_task_state(current, TASK_UNINTERRUPTIBLE);
-		if (atomic_read(&sem->count) >= 0)
-			break;	/* we must attempt to aquire or bias the lock */
+		if (sem->rw_count >= 0)
+			break;	/* We get the lock */
 		schedule();
 	}
 
-	remove_wait_queue(&sem->wait, &wait);
+	spin_lock(&sem->sentry);
+	__remove_wait_queue(&sem->readers, &wait);
 	current->state = TASK_RUNNING;
 }
 
-void down_write_failed_biased(struct rw_semaphore *sem)
+/* Wait for all previous readers to up the sempahore.
+ * Since we're a writer, we'll make ourselves exclusive.
+ */
+void down_write_failed(struct rw_semaphore *sem)
 {
 	DECLARE_WAITQUEUE(wait, current);
 
-	add_wait_queue_exclusive(&sem->write_bias_wait, &wait);	/* put ourselves at the end of the list */
+	/* If we're the first waiter, indicate that we exist */
+	if ((sem->rw_count & RWSEM_MASK) == 0)
+		sem->rw_count |= RWSEM_WRITE;
+
+	wait.flags = WQ_FLAG_EXCLUSIVE;
+	__add_wait_queue_tail(&sem->writers, &wait);
+	spin_unlock(&sem->sentry);
 
-	for (;;) {
-		if (sem->write_bias_granted && xchg(&sem->write_bias_granted, 0))
-			break;
+	while (sem->rw_count != 0) {
 		set_task_state(current, TASK_UNINTERRUPTIBLE);
-		if (!sem->write_bias_granted)
-			schedule();
+		if (sem->rw_count == 0)
+			break;	/* We get the lock */
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
+/* up_read_wakeup gets called spuriously when a writer is waiting
+ * for the lock.  That's OK, this is slowpath now anyway.
  */
-void rwsem_wake_readers(struct rw_semaphore *sem)
+void up_read_wakeup(struct rw_semaphore *sem)
 {
-	if (xchg(&sem->read_bias_granted, 1))
-		BUG();
-	wake_up(&sem->wait);
-}
-
-void rwsem_wake_writer(struct rw_semaphore *sem)
-{
-	if (xchg(&sem->write_bias_granted, 1))
-		BUG();
-	wake_up(&sem->write_bias_wait);
+	/* Check to see if other readers need to up the semaphore */
+	if ((sem->rw_count &~ RWSEM_MASK) != 0)
+		return;
+
+	up_write_wakeup(sem);
+}
+
+void up_write_wakeup(struct rw_semaphore *sem)
+{
+	/* Figure out what state to go to next. */
+	if ((sem->rw_count & RWSEM_MASK) == RWSEM_WRITE) {
+		int more_writers = (sem->writers.task_list.next != sem->writers.task_list.prev);
+		int more_readers = list_empty(&sem->readers.task_list);
+		if (more_writers) {
+			if (more_readers) {
+				sem->rw_count = RWSEM_READ;
+			} else {
+				sem->rw_count = RWSEM_WRITE;
+			}
+		} else {
+			if (!more_readers) {
+				sem->rw_count = 0;
+			} else {
+				sem->rw_count = RWSEM_READ;
+			}
+		}
+		wake_up(&sem->writers);
+	} else {
+		int more_writers = list_empty(&sem->writers.task_list);
+		if (more_writers) {
+			sem->rw_count = RWSEM_WRITE;
+		} else {
+			sem->rw_count = 0;
+		}
+		wake_up(&sem->readers);
+	}
 }
Index: include/asm-parisc/semaphore.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/semaphore.h,v
retrieving revision 1.5
diff -u -p -r1.5 semaphore.h
--- semaphore.h	2000/08/11 23:40:13	1.5
+++ semaphore.h	2001/02/09 00:07:55
@@ -1,29 +1,28 @@
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
+ * PA-RISC version by Matthew Wilcox
  *
  */
 
-/* if you're going to use out-of-line slowpaths, use .section .lock.text,
- * not .text.lock or the -ffunction-sections monster will eat you alive
- */
-
 #include <linux/spinlock.h>
-
+#include <linux/wait.h>
 #include <asm/system.h>
-#include <asm/atomic.h>
 
+/*
+ * The `count' is initialised to the number of people who are allowed to
+ * take the lock.  (Normally we want a mutex, so this is `1').  if
+ * `count' is positive, the lock can be taken.  if it's 0, no-one is
+ * waiting on it.  if it's -1, at least one task is waiting.
+ */
 struct semaphore {
-	atomic_t count;
-	int waking;
+	spinlock_t	sentry;
+	int		count;
 	wait_queue_head_t wait;
 #if WAITQUEUE_DEBUG
 	long __magic;
@@ -38,7 +37,7 @@ struct semaphore {
 #endif
 
 #define __SEMAPHORE_INITIALIZER(name,count) \
-{ ATOMIC_INIT(count), 0, __WAIT_QUEUE_HEAD_INITIALIZER((name).wait) \
+{ SPIN_LOCK_UNLOCKED, count, __WAIT_QUEUE_HEAD_INITIALIZER((name).wait) \
 	__SEM_DEBUG_INIT(name) }
 
 #define __MUTEX_INITIALIZER(name) \
@@ -52,18 +51,7 @@ struct semaphore {
 
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
@@ -76,17 +64,13 @@ static inline void init_MUTEX_LOCKED (st
 	sema_init(sem, 0);
 }
 
-asmlinkage void __down_failed(void /* special register calling convention */);
-asmlinkage int  __down_failed_interruptible(void  /* params in registers */);
-asmlinkage int  __down_failed_trylock(void  /* params in registers */);
-asmlinkage void __up_wakeup(void /* special register calling convention */);
-
 asmlinkage void __down(struct semaphore * sem);
 asmlinkage int  __down_interruptible(struct semaphore * sem);
-asmlinkage int  __down_trylock(struct semaphore * sem);
 asmlinkage void __up(struct semaphore * sem);
 
-extern spinlock_t semaphore_wake_lock;
+/* Sempahores can be `tried' from irq context.  So we have to disable
+ * interrupts while we're messing with the semaphore.  Sorry.
+ */
 
 extern __inline__ void down(struct semaphore * sem)
 {
@@ -94,8 +78,11 @@ extern __inline__ void down(struct semap
 	CHECK_MAGIC(sem->__magic);
 #endif
 
-	if (atomic_dec_return(&sem->count) < 0)
+	spin_lock_irq(&sem->sentry);
+	if (sem->count <= 0)
 		__down(sem);
+	sem->count--;
+	spin_unlock_irq(&sem->sentry);
 }
 
 extern __inline__ int down_interruptible(struct semaphore * sem)
@@ -105,21 +92,32 @@ extern __inline__ int down_interruptible
 	CHECK_MAGIC(sem->__magic);
 #endif
 
-	if (atomic_dec_return(&sem->count) < 0)
+	spin_lock_irq(&sem->sentry);
+	if (sem->count <= 0)
 		ret = __down_interruptible(sem);
+	if (ret == 0)
+		sem->count--;
+	spin_unlock_irq(&sem->sentry);
 	return ret;
 }
 
+/*
+ * down_trylock returns 0 on success, 1 if we failed to get the lock.
+ * May not sleep, but must preserve irq state
+ */
 extern __inline__ int down_trylock(struct semaphore * sem)
 {
-	int ret = 0;
+	int flags, count;
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
+	return (count < 0);
 }
 
 /*
@@ -128,11 +126,14 @@ extern __inline__ int down_trylock(struc
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
@@ -146,9 +147,9 @@ extern __inline__ void up(struct semapho
  * (in which case it goes to sleep).
  *
  * The value 0x01000000 supports up to 128 processors and
- * lots of processes.  BIAS must be chosen such that subl'ing
- * BIAS once per CPU will result in the long remaining
- * negative.
+ * lots of processes.  BIAS must be chosen such that subtracting
+ * BIAS three times will result in the value remaining negative,
+ * and it must be at least the number of processes in the system.
  *
  * In terms of fairness, this should result in the lock
  * flopping back and forth between readers and writers
@@ -156,146 +157,134 @@ extern __inline__ void up(struct semapho
  *
  *              -ben
  */
+/* NOTE: There is currently no provision for attempting to acquire
+ * rw_sems from interrupt context.  These routines will require more
+ * work if this is to be allowed.
+ */
+
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
+	signed int			rw_count;
+	wait_queue_head_t	readers;
+	wait_queue_head_t	writers;
+#if WAITQUEUE_DEBUG
+	long			__magic;
+	volatile int		readers;
+	volatile int		writers;
 #endif
 };
 
 #if WAITQUEUE_DEBUG
-#define __RWSEM_DEBUG_INIT      , ATOMIC_INIT(0), ATOMIC_INIT(0)
+#define __RWSEM_DEBUG_INIT	, 0, 0
 #else
-#define __RWSEM_DEBUG_INIT      /* */
+#define __RWSEM_DEBUG_INIT	/* */
 #endif
 
-#define RW_LOCK_BIAS 0x01000000
+#define RWSEM_MASK	0xC0000000
+#define RWSEM_READ	0x80000000
+#define RWSEM_WRITE	0xC0000000
+#define RWSEM_WRITER	-1
 
 #define __RWSEM_INITIALIZER(name,count) \
-{ ATOMIC_INIT(count), 0, 0, 0, 0, __WAIT_QUEUE_HEAD_INITIALIZER((name).wait), \
-        __WAIT_QUEUE_HEAD_INITIALIZER((name).write_bias_wait) \
-        __SEM_DEBUG_INIT(name) __RWSEM_DEBUG_INIT }
+{ SPIN_LOCK_UNLOCKED, count, __WAIT_QUEUE_HEAD_INITIALIZER((name).writers), \
+	__WAIT_QUEUE_HEAD_INITIALIZER((name).readers) \
+	__SEM_DEBUG_INIT(name) __RWSEM_DEBUG_INIT }
 
 #define __DECLARE_RWSEM_GENERIC(name,count) \
-        struct rw_semaphore name = __RWSEM_INITIALIZER(name,count)
+	struct rw_semaphore name = __RWSEM_INITIALIZER(name,count)
 
-#define DECLARE_RWSEM(name) __DECLARE_RWSEM_GENERIC(name,RW_LOCK_BIAS)
-#define DECLARE_RWSEM_READ_LOCKED(name) __DECLARE_RWSEM_GENERIC(name,RW_LOCK_BIAS-1)
-#define DECLARE_RWSEM_WRITE_LOCKED(name) __DECLARE_RWSEM_GENERIC(name,0)
+#define DECLARE_RWSEM(name) __DECLARE_RWSEM_GENERIC(name,0)
+#define DECLARE_RWSEM_READ_LOCKED(name) __DECLARE_RWSEM_GENERIC(name,1)
+#define DECLARE_RWSEM_WRITE_LOCKED(name) __DECLARE_RWSEM_GENERIC(name,RWSEM_WRITER)
 
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
+	*sem = (struct rw_semaphore) __RWSEM_INITIALIZER(*sem, 0);
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
+extern void FASTCALL(down_read_failed(struct rw_semaphore *sem));
+extern void FASTCALL(down_write_failed(struct rw_semaphore *sem));
+extern void FASTCALL(up_read_wakeup(struct rw_semaphore *sem));
+extern void FASTCALL(up_write_wakeup(struct rw_semaphore *sem));
 
 extern inline void down_read(struct rw_semaphore *sem)
 {
+	spin_lock(&sem->sentry);
+
 #if WAITQUEUE_DEBUG
-        if (sem->__magic != (long)&sem->__magic)
-                BUG();
-#endif
-#ifdef FIXME_WILLY_FIXME_FOR_REAL_THIS_TIME
-        __build_read_lock(sem, "__down_read_failed");
+	if (sem->__magic != (long)&sem->__magic)
+		BUG();
 #endif
+
+	if (sem->rw_count < 0)
+		down_read_failed(sem);
+	sem->rw_count++;
+
 #if WAITQUEUE_DEBUG
-        if (sem->write_bias_granted)
-                BUG();
-        if (atomic_read(&sem->writers))
-                BUG();
-        atomic_inc(&sem->readers);
+	if (sem->n_writers)
+		BUG();
+	sem->n_readers++;
 #endif
+
+	spin_unlock(&sem->sentry);
 }
 
 extern inline void down_write(struct rw_semaphore *sem)
 {
+	spin_lock(&sem->sentry);
+
 #if WAITQUEUE_DEBUG
-        if (sem->__magic != (long)&sem->__magic)
-                BUG();
-#endif
-#ifdef FIXME_WILLY_FIXME_FOR_REAL_THIS_TIME
-        __build_write_lock(sem, "__down_write_failed");
+	if (sem->__magic != (long)&sem->__magic)
+		BUG();
 #endif
+
+	if (sem->rw_count != 0)
+		down_write_failed(sem);
+	sem->rw_count += RWSEM_WRITER;
+
 #if WAITQUEUE_DEBUG
-        if (atomic_read(&sem->writers))
-                BUG();
-        if (atomic_read(&sem->readers))
-                BUG();
-        if (sem->read_bias_granted)
-                BUG();
-        if (sem->write_bias_granted)
-                BUG();
-        atomic_inc(&sem->writers);
+	if (sem->n_writers)
+		BUG();
+	if (sem->n_readers)
+		BUG();
+	sem->n_writers++;
 #endif
-}
 
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
+	spin_lock(&sem->sentry);
+
 #if WAITQUEUE_DEBUG
-        if (sem->write_bias_granted)
-                BUG();
-        if (atomic_read(&sem->writers))
-                BUG();
-        atomic_dec(&sem->readers);
+	if (sem->n_writers)
+		BUG();
+	sem->n_readers++;
 #endif
-        __up_read(sem);
+
+	if (sem->rw_count-- < 0)
+		up_read_wakeup(sem);
+	spin_unlock(&sem->sentry);
 }
 
 extern inline void up_write(struct rw_semaphore *sem)
 {
+	spin_lock(&sem->sentry);
+
 #if WAITQUEUE_DEBUG
-        if (sem->read_bias_granted)
-                BUG();
-        if (sem->write_bias_granted)
-                BUG();
-        if (atomic_read(&sem->readers))
-                BUG();
-        if (atomic_read(&sem->writers) != 1)
-                BUG();
-        atomic_dec(&sem->writers);
+	if (sem->n_readers)
+		BUG();
+	if (sem->n_writers != 1)
+		BUG();
+	sem->n_writers--;
 #endif
-        __up_write(sem);
+
+	sem->rw_count -= RWSEM_WRITER;
+	if (sem->rw_count != 0)
+		up_write_wakeup(sem);
+	spin_unlock(&sem->sentry);
 }
 
 #endif /* _ASM_PARISC_SEMAPHORE_H */
