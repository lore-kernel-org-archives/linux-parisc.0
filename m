Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA27353
	for <parisc-linux@puffin.external.hp.com>; Fri, 5 Jan 2001 10:29:20 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 5 Jan 2001 17:32:44 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14EajL-0003v0-00
	for parisc-linux@thepuffingroup.com; Fri, 05 Jan 2001 17:32:43 +0000
Date: Fri, 5 Jan 2001 17:32:43 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010105173243.A14195@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] spinlocks
List-ID: <linux-parisc.vger.kernel.org>


I noticed while I was implementing rw semaphores that i'd basically
implemented spinlocks, so I went to look at our spinlock implementation,
just to check my `sentry' was the same as a spinlock.

I think our spinlock implementation is suboptimal.  Here it is:

#define spin_lock(x) \
        do { while(__ldcw(&(x)->lock) == 0); } while(0)

While the spinlock is contended, the processor will be doing `ldcw' insns,
just as fast as it can.  Now imagine we have two processors waiting
for the lock.  The first will load the word (pulling the value across
the bus), clear the word (telling all other cpus to invalidate that
cache line).  Then the second one loads the word, clears the word... in
other words the bus is now fully occupied while these processors spin.
It'll certainly slow down the system and may grind the system to a
complete halt (someone said the Runway bus was't fair, so if the top two
processors are contending for the lock, and the lowest priority processor
has it, it may not be able to make progress and release the lock).

A better design is to repeatedly load the value until it becomes non-zero,
and only then try to ldcw it.  This way, all processors have a read-only
copy of the cache line and checking its value has no effect on the bus.
In C, this could be implemented as:

	while (__ldcw(&(x)->lock) == 0)
		while (((volatile int)(x)->lock) == 0) ;

So here's the code I originally came up with for my sentry, which I'd like
people to consider for the spinlock.

extern inline void __acquire_sentry(struct rw_semaphore *sem)
{
	int sentry;
	__asm__("
	b,n	1f
2:	ldw	0(%1), %0
	comib,<> 0, %0, 2b
	nop
1:	ldcw	0(%1), %0
	comib,<> 0, %0, 2b
	nop"
	: "=r" (sentry) : "r" (sem));
}

I tried rearranging it to take advantage of the delay slot, and it came
out like this:

extern inline void spin_lock(struct spinlock *lock)
{
	int sentry;
	__asm__("
	b	1f
	ldcw	0(%1), %0
2:      comib,<>,N 0, %0, 2b
	ldw	0(%1), %0
	ldcw	0(%1), %0
1:      comib,<>,N 0, %0, 2b
	ldw	0(%1), %0"
	: "=r" (sentry) : "r" (sem));
}

which doesn't seem like an improvement to me.  Still, I'm sure other people
are better at optimising PA-RISC assembler than I am.  How important is using
the delay slot these days with the highly out-of-order CPUs?

On other architectures, ELF sections (.text.lock) are used to out-of-line
the slow case.  But given that we only have a limited range on the comib
insn (+/- 8k), we would need a way to get the out-of-line case positioned
close to the function which was calling it.  BTW, using the C definition,
the compiler does the out-of-lining for us!  Using -O2 on the following
simple program:

struct sl {
        int lock;
};

int z; /* protected by the sl */

struct sl y;

#define spin_lock(x) do { \
        while (__ldcw (&(x)->lock) == 0) \
                while (((volatile int)(x)->lock) == 0) ; } while (0)

#define spin_unlock(x) \
        do { (x)->lock = 1; } while(0)

int main(void)
{
        spin_lock(&y);
        z = 65473659;
        spin_unlock(&y);
        return z;
}

gives:

#APP
        ldcw 0(%r20),%r19
#NO_APP
        comib,= 0,%r19,.L20
        ldil L'65473659,%r28
.L21:
        addil LR'z-$global$,%r27
        ldo R'65473659(%r28),%r28
        stw %r28,RR'z-$global$(%r1)
        ldi 1,%r19
        bv %r0(%r2)
        stw %r19,RR'y-$global$(%r22)
.L20:
        copy %r20,%r21
        ldw 0(%r21),%r20
.L12:
        comib,= 0,%r20,.L12
        nop
#APP
        ldcw 0(%r21),%r19
#NO_APP
        comib,<> 0,%r19,.L21
        ldil L'65473659,%r28
        b,n .L12

Remember that we don't care how inefficient the code is in the case of
a contended spinlock.  The compiler beats me rather handily -- 2 insns for
an uncontended spinlock versus my 4 (3 if you don't count nops or nullified
insns).

-- 
Revolutions do not require corporate support.
