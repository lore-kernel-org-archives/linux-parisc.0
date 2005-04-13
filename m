From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] some other small bitops.h suggestion?
Date: Wed, 13 Apr 2005 11:47:56 -0600
Message-ID: <20050413174756.GA21641@colo.lackof.org>
References: <20050403143246.GE8921@tausq.org>
	<42134E6200012F70@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42134E6200012F70@mail-2-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 05, 2005 at 11:28:26AM +0200, Joel Soete wrote:
> Here is some other change to suggest (even thought it doesn't fix anything
> :-( ):
...

Here is what I'd like to commit for include/parisc/bitops.h.

Summary of changes:
o uses generic_hweight64
o uses CONFIG_64BIT where neccessary
o make our __clear_bit and __set_bit look like ppc64 instead of sparc.
o simplify sched_find_first_bit()

Any comments before I commit this?

(Joel, additional changes can go in another commit please :^)

Beware, touching bitops.h will cause a full recompile.

thanks,
grant


Index: include/asm-parisc/bitops.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/bitops.h,v
retrieving revision 1.18
diff -u -p -r1.18 bitops.h
--- include/asm-parisc/bitops.h	4 Apr 2005 17:54:41 -0000	1.18
+++ include/asm-parisc/bitops.h	13 Apr 2005 17:44:13 -0000
@@ -12,7 +12,7 @@
  * to include/asm-i386/bitops.h or kerneldoc
  */
 
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 #   define SHIFT_PER_LONG 6
 #ifndef BITS_PER_LONG
 #   define BITS_PER_LONG 64
@@ -43,37 +43,29 @@ static __inline__ void set_bit(int nr, v
 	_atomic_spin_unlock_irqrestore(addr, flags);
 }
 
-static __inline__ void __set_bit(int nr, volatile unsigned long * address)
+static __inline__ void __set_bit(unsigned long nr, volatile unsigned long * addr)
 {
-	unsigned long mask;
-	unsigned long *addr = (unsigned long *) address;
+	volatile unsigned long *m = addr + (((unsigned) nr) >> SHIFT_PER_LONG);
 
-	addr += (nr >> SHIFT_PER_LONG);
-	mask = 1UL << CHOP_SHIFTCOUNT(nr);
-	*addr |= mask;
+	*m |= 1UL << CHOP_SHIFTCOUNT(nr);
 }
 
 static __inline__ void clear_bit(int nr, volatile unsigned long * address)
 {
-	unsigned long mask;
-	unsigned long *addr = (unsigned long *) address;
+	unsigned long mask = 1UL << CHOP_SHIFTCOUNT((unsigned int) nr);
+	volatile unsigned long *addr = address + (((unsigned int) nr) >> SHIFT_PER_LONG);
 	unsigned long flags;
 
-	addr += (nr >> SHIFT_PER_LONG);
-	mask = 1UL << CHOP_SHIFTCOUNT(nr);
 	_atomic_spin_lock_irqsave(addr, flags);
 	*addr &= ~mask;
 	_atomic_spin_unlock_irqrestore(addr, flags);
 }
 
-static __inline__ void __clear_bit(unsigned long nr, volatile unsigned long * address)
+static __inline__ void __clear_bit(unsigned long nr, volatile unsigned long * addr)
 {
-	unsigned long mask;
-	unsigned long *addr = (unsigned long *) address;
+	volatile unsigned long *m = addr + (nr >> SHIFT_PER_LONG);
 
-	addr += (nr >> SHIFT_PER_LONG);
-	mask = 1UL << CHOP_SHIFTCOUNT(nr);
-	*addr &= ~mask;
+	*m &= ~(1UL << CHOP_SHIFTCOUNT(nr));
 }
 
 static __inline__ void change_bit(int nr, volatile unsigned long * address)
@@ -89,14 +81,11 @@ static __inline__ void change_bit(int nr
 	_atomic_spin_unlock_irqrestore(addr, flags);
 }
 
-static __inline__ void __change_bit(int nr, volatile unsigned long * address)
+static __inline__ void __change_bit(unsigned long nr, volatile unsigned long * addr)
 {
-	unsigned long mask;
-	unsigned long *addr = (unsigned long *) address;
+	volatile unsigned long *m = addr + (nr >> SHIFT_PER_LONG);
 
-	addr += (nr >> SHIFT_PER_LONG);
-	mask = 1UL << CHOP_SHIFTCOUNT(nr);
-	*addr ^= mask;
+	*m ^= 1UL << CHOP_SHIFTCOUNT(nr);
 }
 
 static __inline__ int test_and_set_bit(int nr, volatile unsigned long * address)
@@ -229,7 +218,7 @@ static __inline__ unsigned long __ffs(un
 	unsigned long ret;
 
 	__asm__(
-#if BITS_PER_LONG > 32
+#ifdef CONFIG_64BIT
 		" ldi       63,%1\n"
 		" extrd,u,*<>  %0,63,32,%%r0\n"
 		" extrd,u,*TR  %0,31,32,%0\n"	/* move top 32-bits down */
@@ -304,14 +293,7 @@ static __inline__ int fls(int x)
  * hweightN: returns the hamming weight (i.e. the number
  * of bits set) of a N-bit word
  */
-#define hweight64(x)						\
-({								\
-	unsigned long __x = (x);				\
-	unsigned int __w;					\
-	__w = generic_hweight32((unsigned int) __x);		\
-	__w += generic_hweight32((unsigned int) (__x>>32));	\
-	__w;							\
-})
+#define hweight64(x) generic_hweight64(x)
 #define hweight32(x) generic_hweight32(x)
 #define hweight16(x) generic_hweight16(x)
 #define hweight8(x) generic_hweight8(x)
@@ -324,7 +306,13 @@ static __inline__ int fls(int x)
  */
 static inline int sched_find_first_bit(const unsigned long *b)
 {
-#ifndef __LP64__
+#ifdef CONFIG_64BIT
+	if (unlikely(b[0]))
+		return __ffs(b[0]);
+	if (unlikely(b[1]))
+		return __ffs(b[1]) + 64;
+	return __ffs(b[2]) + 128;
+#else
 	if (unlikely(b[0]))
 		return __ffs(b[0]);
 	if (unlikely(b[1]))
@@ -334,14 +322,6 @@ static inline int sched_find_first_bit(c
 	if (b[3])
 		return __ffs(b[3]) + 96;
 	return __ffs(b[4]) + 128;
-#else
-	if (unlikely(b[0]))
-		return __ffs(b[0]);
-	if (unlikely(((unsigned int)b[1])))
-		return __ffs(b[1]) + 64;
-	if (b[1] >> 32)
-		return __ffs(b[1] >> 32) + 96;
-	return __ffs(b[2]) + 128;
 #endif
 }
 
@@ -445,7 +425,7 @@ found_middle:
  * test_and_{set,clear}_bit guarantee atomicity without
  * disabling interrupts.
  */
-#ifdef __LP64__
+#ifdef CONFIG_64BIT
 #define ext2_set_bit(nr, addr)		__test_and_set_bit((nr) ^ 0x38, (unsigned long *)addr)
 #define ext2_set_bit_atomic(l,nr,addr)  test_and_set_bit((nr) ^ 0x38, (unsigned long *)addr)
 #define ext2_clear_bit(nr, addr)	__test_and_clear_bit((nr) ^ 0x38, (unsigned long *)addr)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
