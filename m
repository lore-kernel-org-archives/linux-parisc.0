Return-Path: <dave@hiauly1.hia.nrc.ca>
Message-Id: <200401250613.i0P6DAIf010964@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] missing barrier in _raw_spin_lock?
To: grundler@parisc-linux.org (Grant Grundler)
Date: Sun, 25 Jan 2004 01:13:10 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040125013749.GC16272@colo.lackof.org> from "Grant Grundler" at
	Jan 24, 2004 06:37:49 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: arnd@arndb.de, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

>  Anyway, gcc doesn't seem to be that smart:

Right, it not that smart but it does optimize certain memory references.

> The key bit is __ldcw() in asm/system.h:
> 
> /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
> #define __ldcw(a) ({ \
>         unsigned __ret; \
>         __asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a)); \
>         __ret; \
> })

In some version of pthreads, we used

#define __ldcw(a) ({ \
  unsigned int __ret;                                                   \
  __asm__ __volatile__("ldcw 0(%2),%0"                                  \
		      : "=r" (__ret), "=m" (*(a)) : "r" (a));           \
  __ret;                                                                \
})

This tells gcc explicitly what memory is affected by the asm.  However,
it doesn't provide a memory barrier.  I think this isn't necessary in
pthreads because it provides a separate macro define for this.

This is what the gcc documentation says about asms:

If your assembler instructions access memory in an unpredictable
fashion, add `memory' to the list of clobbered registers.  This
will cause GCC to not keep memory values cached in registers across the
assembler instruction and not optimize stores or loads to that memory.
You will also want to add the `volatile' keyword if the memory
affected is not listed in the inputs or outputs of the `asm', as
the `memory' clobber does not count as a side-effect of the
`asm'.  If you know how large the accessed memory is, you can add
it as input or output but if this is not known, you should add
`memory'.  As an example, if you access ten bytes of a string, you
can use a memory input like:

> I suspect (but am not certain) Arnd is right.
> We indicate __ret is getting clobbered (=r) and that 'a' is an input ("r").
> I don't see anything indicating we changed the memory location.

It's not really the memory accessed by the ldcw that's at issue here.
If `x' is a location that can change between the first test and a successful
lock (SMP), then you want a memory barrier in __ldcw so that the memory
value of x is not cached in a register across the lock.

The following revision to the test program demonstrates the problem
of a memory value carried into the lock.

#include <linux/spinlock.h>

static spinlock_t lock = SPIN_LOCK_UNLOCKED;

void test(int *x)
{
  if (*x)
    {
      spin_lock(&lock);
      if (!*x)
	*x = 0x1234;
      spin_unlock(&lock);
    }
}

We need the "memory" clobber in SMP.  I think the macro should be:

#define __ldcw(a) ({ \
  unsigned int __ret;							 \
  __asm__ __volatile__("ldcw 0(%2),%0"					 \
		      : "=r" (__ret), "=m" (*(a)) : "r" (a) : "memory"); \
  __ret;								 \
})

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
