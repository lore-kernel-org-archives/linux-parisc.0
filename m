Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 435EB482B
	for <parisc-linux@parisc-linux.org>; Sun, 13 Jan 2002 14:15:11 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16Pry8-0003rc-00
	for parisc-linux@parisc-linux.org; Sun, 13 Jan 2002 21:15:08 +0000
Date: Sun, 13 Jan 2002 21:15:08 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020113211508.V9193@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] atomic_t
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Just thinking about atomic_set taking the spinlock to assure
exclusivity...  I thought we could eliminate it.

Here's the current code:

static __inline__ void __atomic_set(atomic_t *v, int i) 
{
        unsigned long flags;
        SPIN_LOCK_IRQSAVE(ATOMIC_HASH(v), flags);

        v->counter = i;

        SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(v), flags);
}

static __inline__ int __atomic_add_return(int i, atomic_t *v)
{
        int ret;
        unsigned long flags;
        SPIN_LOCK_IRQSAVE(ATOMIC_HASH(v), flags);

        ret = (v->counter += i);

        SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(v), flags);
        return ret;
}

The legitimate effect of having two processors do this at the same time
are:

atomic_t v = 3

case 1:

atomic_add_return(1, &v)
atomic_set(&v, 1)
result: v = 1, a_a_r returns 4.

or case 2:

atomic_set(&v, 1)
atomic_add_return(1, &v)
result: v = 2, a_a_r returns 2.

The spinlocks guarantee this behaviour, but let's look at what happens
if we remove the spinlock from atomic_set.  Now atomic_set is just an
assignment, and can occur at any point during atomic_add_ret.  We'll have
to drop to psuedo-assembler for this.

atomic_add_ret becomes:

a) lock
b) load v into register r
c) add 1 to r
d) store r to v
e) unlock
f) return r

atomic_set (store 1 to v) can appear to occur at any point -- the CPU
ref manual guarantees it won't cause any problems.

Before step b leads to case 2.  after step d leads to case 1.  between
steps b and d, it's as if the atomic_set _never_happened_.  It results
in v=4, a_a_r returns 4.

The question is whether any code relies on this behaviour.  It probably
does in some of the messier bits of networking :-(

-- 
Revolutions do not require corporate support.
