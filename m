Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B1DA4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Feb 2001 19:48:53 -0700 (MST)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel1.hp.com (Postfix) with ESMTP id 4A12B2A3
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Feb 2001 21:48:49 -0500 (EST)
Date: Wed, 7 Feb 2001 19:44:30 -0700
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010207194430.C620@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: willy@ldl.fc.hp.com (Matthew Wilcox)
Subject: [parisc-linux] rwsems
List-ID: <linux-parisc.vger.kernel.org>

Currently, our read/write semaphores are NOPs.  This is not so good :-)

Here's a scheme i've devised for doing rwsems moderately efficiently;
if anyone can think of a better scheme, please shout.

(removed debugging code for clarity)

semaphore.h:

#define RWSEM_WRITER	-1
#define RWSEM_MASK	0xC0000000
#define RWSEM_BIAS_WRITE	0xC0000000
#define RWSEM_BIAS_READ		0x80000000

struct rw_semaphore {
	spinlock_t		sentry;
	signed int		rw_count;
	wait_queue_head_t	readers;
	wait_queue_head_t	writers;
};

extern inline void down_read(struct rw_semaphore *sem)
{
	spin_lock(&sem->sentry);
	if (sem->rw_count < 0)
		__down_read_failed(sem);
	sem->rw_count++;
	spin_unlock(&sem->sentry);
}

extern inline void down_write(struct rw_semaphore *sem)
{
	spin_lock(&sem->sentry);
	if (sem->rw_count != 0)
		__down_write_failed(sem);
	sem->rw_count += RWSEM_WRITER;
	spin_unlock(&sem->sentry);
}

extern inline void up_read(struct rw_semaphore *sem)
{
	spin_lock(&sem->sentry);
	if (sem->rw_count-- < 0)
		__up_read_wakeup(sem);
	spin_unlock(&sem->sentry);
}

extern inline void up_write(struct rw_semaphore *sem)
{
	spin_lock(&sem->sentry);
	sem->rw_count -= RWSEM_WRITER;
	if (sem->rw_count != 0)
		__up_write_wakeup(sem);
	spin_unlock(&sem->sentry);
}

semaphore.c:

/* We must wait for a writer to up the semaphore */
void down_read_failed(struct rw_semaphore *sem)
{
	DECLARE_WAITQUEUE(wait, current);

	/* If we're the first waiter, indicate that we exist */
	if ((sem->rw_count & RWSEM_MASK) == 0)
		sem->rw_count |= RWSEM_READ;

	__add_wait_queue(&sem->readers, &wait);
	spin_unlock(&sem->sentry);

	while (sem->rw_count < 0) {
		set_task_state(current, TASK_UNINTERRUPTIBLE);
		if (sem->rw_count >= 0)
			break;	/* We get the lock */
		schedule();
	}

	spin_lock(&sem->sentry);
	__remove_wait_queue(&sem->readers, &wait);
	current->state = TASK_RUNNING;
}

/* Wait for all previous readers to up the sempahore.
 * Since we're a writer, we'll make ourselves exclusive.
 */
void down_write_failed(struct rw_semaphore *sem)
{
	DECLARE_WAITQUEUE(wait, current);

	/* If we're the first waiter, indicate that we exist */
	if ((sem->rw_count & RWSEM_MASK) == 0)
		sem->rw_count |= RWSEM_WRITE;

	wait.flags = WQ_FLAG_EXCLUSIVE;
	__add_wait_queue_tail(&sem->writers, &wait);
	spin_unlock(&sem->sentry);

	while (sem->rw_count != 0) {
		set_task_state(current, TASK_UNINTERRUPTIBLE);
		if (sem->rw_count == 0)
			break;	/* We get the lock */
		schedule();
	}

	spin_lock(&sem->sentry);
	__remove_wait_queue(&sem->writers, &wait);
	current->state = TASK_RUNNING;
}

/* up_read_wakeup gets called spuriously when a writer is waiting
 * for the lock.  That's OK, this is slowpath now anyway.
 */
void up_read_wakeup(struct rw_semaphore *sem)
{
	/* Check to see if other readers need to up the semaphore */
	if ((sem->rw_count &~ RWSEM_MASK) != 0)
		return;

	up_write_wakeup(sem);
}

void up_write_wakeup(struct rw_semaphore *sem)
{
	/* Figure out what state to go to next. */
	if ((sem->rw_count & RWSEM_MASK) == RWSEM_WRITE) {
		int more_writers = (sem->writers.task_list.next != sem->writers.task_list.prev);
		int more_readers = list_empty(&sem->readers.task_list);
		if (more_writers) {
			if (more_readers) {
				sem->rw_count = RWSEM_READ;
			} else {
				sem->rw_count = RWSEM_WRITE;
			}
		} else {
			if (!more_readers) {
				sem->rw_count = 0;
			} else {
				sem->rw_count = RWSEM_READ;
			}
		}
		wake_up(&sem->writers);
	} else {
		int more_writers = list_empty(&sem->writers.task_list);
		if (more_writers) {
			sem->rw_count = RWSEM_WRITE;
		} else {
			sem->rw_count = 0;
		}
		wake_up(&sem->readers);
	}
}

I suspect I could encode more information in the rwcount that might
make it unnecessary to check the waitqueues explicitly.
