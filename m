Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA16113
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Aug 2000 17:05:23 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 14 Aug 2000 17:05:43 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 14 Aug 2000 17:05:19 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id MAA32101
	for parisc-linux@thepuffingroup.com; Mon, 14 Aug 2000 12:00:46 -0400
Date: Mon, 14 Aug 2000 12:00:46 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000814120046.M27691@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] semaphores
List-ID: <linux-parisc.vger.kernel.org>


i've been messing about trying to get the most efficient semaphore
implementation that I can.  Linux semaphores are theoretically n-way
exclusion, but I can't actually see any non-mutex (1-way) exclusion.
Linux also has read-write mutexes, read-write spinlocks and ordinary
spinlocks, but i'm not going to deal with those for the moment.

The design of the semaphore is to optimise _heavily_ for the uncontended
case.  ``If you have contention, redesign your subsystem so you don't
have contention.''  So here's my go at it.  I haven't even tested that
this compiles, because I'm sure that someone else is going to come up
with a better design than I will.

struct semaphore {
        int exclusive;
        int sleepers;
        wait_queue_head_t wait;
#if WAITQUEUE_DEBUG
        long __magic;
#endif
} __attribute__((aligned (16))); /* Align to 16 bytes for the sake of ldcw */

#define __SEMAPHORE_INITIALIZER(name,count)                     \
{                                                               \
        exclusive: 0,                                           \
        sleepers: -count,                                       \
        wait: __WAIT_QUEUE_HEAD_INITIALIZER((name).wait),       \
        __SEM_DEBUG_INIT(name)                                  \
}

extern __inline__ void down(struct semaphore * sem)
{
        register int _r26 asm ("r26") = sem;
        register int tmp;
#if WAITQUEUE_DEBUG
        CHECK_MAGIC(sem->__magic);
#endif

        __volatile__ asm(
"1:     ldcw    0(%0), %1\n"            /* exclusive access to this */
"       movb,=  %1, %%r0, 1b\n"         /* section of code */
"       ldw     4(%0), %1\n"            /* get number of sleepers */
"       addi,>  1, %1, %1\n"            /* increment */
"       b,l     __down_failed, %%r2\n"  /* if this is > 0, we're contending */
"       stw     %1, 4(%0)\n"            /* always write back sleepers */
"       stw     %0, 0(%0)\n"            /* we're done with our access */
                : : "r" (_r26) : "r" (tmp)
        );
}

i haven't written down_failed yet, but to my mind, it looks rather like:

__down_failed:
	stw	%gr26, 0(%gr26)
	... set up stack frame ...
	... call __down() which is written in C and sleeps.

see arch/i386/kernel/semaphore.c for how __down() does its stuff.
Only I'm trying to avoid using atomic_t variables, cos they're not
exactly fast on parisc right now.

Better suggestions appreciated.

p.s.

my original scheme was less ugly:

"1:     ldcw    0(%0), %1\n"            /* exclusive access to this */
"       movb,=  %1, %%r0, 1b\n"         /* section of code */
"       ldw     4(%0), %1\n"            /* get number of sleepers */
"       addi    1, %1, %1\n"            /* increment */
"       stw     %1, 4(%0)\n"            /* always write back sleepers */
"       movb,>  %1, %%r0, __down_failed\n" /* if this is > 0, we're contending */
"       stw     %0, 0(%0)\n"            /* we're done with our access */

but this can't branch far enough to get to __down_failed.  now, we could do
some cunning stuff with stubs perhaps, but that seems bad too.

-- 
Revolutions do not require corporate support.
