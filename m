From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] coherent ops and mb() revisited
Date: Fri, 10 Sep 2004 10:11:18 -0600
Message-ID: <20040910161118.GA3778@colo.lackof.org>
References: <200409050627.i856RWW3027615@hiauly1.hia.nrc.ca>
	<1094395005.1690.1.camel@mulgrave>
	<20040906041952.GA17107@colo.lackof.org>
	<1094480131.2037.6.camel@mulgrave>
	<20040907151722.GC18849@colo.lackof.org>
	<1094571019.2068.101.camel@mulgrave>
	<20040908165210.GA10316@colo.lackof.org>
	<1094663473.7149.136.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1094663473.7149.136.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Sep 08, 2004 at 01:11:12PM -0400, James Bottomley wrote:
> > does not have that info unless it could consume Profile info.
> > (ie "Profile Based Optimization").
> > I was thinking we should favor the contended case to make it
> > less painful. I've changed my mind and will not push this patch.
> 
> Erm, no, optimisation of the pipeline is something different again.  If
> we want to hint to the compiler that the lock will be uncontended, then
> our code should read:
> 
>         while (unlikely(__ldcw(a) == 0))
>                 while (likely(*a == 0));

This is general and applies to all uses of locks.
PBO would determine which is the common path at each usage.
But hints are right most of the time - included in the new patch below.

> > But the _ldcw() is part of a tight "while" loop.
> > What's the penalty for "crossing" the barrier?
> > I don't see one.
> 
> In this case, probably not much ... it would forbid clever optimisations
> of the while loops, but I'm sure the compiler isn't actually optimising
> them very much.  However, the *principle* is that you want your barriers
> where they're effective but do the least damage to the compiler's
> ability to optimise.

ok. That makes sense. I just didn't want an overly clever compiler
doing optimizations which are good for the pipeline but bad for
the algorithm.

> > BTW, do you think we should use coherent loads/stores for locks?
> > That's the other aspect of the patch that I think jda would like
> > to see incorporated.
> 
> I'm not really sure what the coherent hint actually does.

coherent hint is an architecturally (PA 2.0) defined mechanism to
enforce ordering of memory accesses - ie makes memory writes
visible to other CPUs in order. This assumes PA2.0 CPU implements
weakly ordered memory (which is not the case and I'll continue
to assert is unlikely to ever happen). But I'm happy to include
this if people think it's the "right thing".

The patch below:
o removes unneeded mb()
o adds likely/unlikely to spinlock loop as suggest by James Bottomley
o adds coherent hints to unlock "store" instruction as suggested
  by John David Anglin.

(o and drops the "memory" asm directives from the previous version)

thanks,
grant


Index: include/asm-parisc/spinlock.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/spinlock.h,v
retrieving revision 1.6
diff -u -p -r1.6 spinlock.h
--- include/asm-parisc/spinlock.h	15 Aug 2004 14:17:39 -0000	1.6
+++ include/asm-parisc/spinlock.h	10 Sep 2004 15:56:25 -0000
@@ -2,6 +2,7 @@
 #define __ASM_SPINLOCK_H
 
 #include <asm/system.h>
+#include <linux/compiler.h>	/* for likely/unlikely ops */
 
 /* Note that PA-RISC has to use `1' to mean unlocked and `0' to mean locked
  * since it only has load-and-zero. Moreover, at least on some PA processors,
@@ -29,20 +30,28 @@ static inline void _raw_spin_lock(spinlo
 {
 	volatile unsigned int *a;
 
-	mb();
 	a = __ldcw_align(x);
-	while (__ldcw(a) == 0)
-		while (*a == 0);
+	while (unlikely(__ldcw(a) == 0))
+		while (likely(*a == 0));
 	mb();
 }
 
 static inline void _raw_spin_unlock(spinlock_t *x)
 {
 	volatile unsigned int *a;
+
 	mb();
 	a = __ldcw_align(x);
-	*a = 1;
-	mb();
+
+	/* use a coherent store. PA1.1 is always strongly ordered.
+	* The idea here is stores to locks will enforce memory ordering
+	* should any PA20 chip ever implement weakly ordered memory.
+	* To date, no PA2.0 implementation is weakly ordered.
+	* jda would prefer we use coherent stores (",ma" with zero offset
+	* is the same thing but PA1.1 compatible).
+	*/
+	__asm__ __volatile__ ("stw,ma %1,0(%0)"
+			: : "r" (a), "r" (1) );
 }
 
 static inline int _raw_spin_trylock(spinlock_t *x)
@@ -50,7 +59,6 @@ static inline int _raw_spin_trylock(spin
 	volatile unsigned int *a;
 	int ret;
 
-	mb();
 	a = __ldcw_align(x);
         ret = __ldcw(a) != 0;
 	mb();
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
