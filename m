From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] coherent ops and mb() revisited
Date: Sat, 4 Sep 2004 19:38:44 -0600
Message-ID: <20040905013844.GC23842@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi all,
I haven't tested the following patch and just wanted to get
feedback if it is "the right thing" or not.

John Marvin was clear in previous discussion we don't need
to use coherent stores but I've heard we should follow the
arch anyway so it doesn't bite us later. I find it highly
unlikely but see no harm in "doing it right".

The second bit is if adding "memory" reference in the ldcw
and _raw_spin_unlock() could replace the mb() instructions
which James Bottomley added to prevent gcc from re-ordering
instructions outside the critical section.

opinions?

thanks,
grant


Index: include/asm-parisc/spinlock.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/spinlock.h,v
retrieving revision 1.6
diff -u -p -r1.6 spinlock.h
--- include/asm-parisc/spinlock.h	15 Aug 2004 14:17:39 -0000	1.6
+++ include/asm-parisc/spinlock.h	5 Sep 2004 00:58:42 -0000
@@ -29,20 +29,26 @@ static inline void _raw_spin_lock(spinlo
 {
 	volatile unsigned int *a;
 
-	mb();
 	a = __ldcw_align(x);
 	while (__ldcw(a) == 0)
 		while (*a == 0);
-	mb();
 }
 
 static inline void _raw_spin_unlock(spinlock_t *x)
 {
 	volatile unsigned int *a;
-	mb();
+	register unsigned tmp=1;
+
 	a = __ldcw_align(x);
-	*a = 1;
-	mb();
+	/* use a coherent store. PA1.1 is always strongly ordered.
+	 * Even though no PA2.0 implementation is weakly ordered,
+	 * jda would prefer we use coherent stores (",ma" with zero offset
+	 * is the same thing but PA1.1 compatible).
+	 * Key here is "memory" - prevent gcc from re-ordering memory
+	 * accesses below releasing the lock.
+	 */
+	__asm__ __volatile__ ("stw,ma %1,0(%0)"
+			: : "r" (a), "r" (tmp) : "memory");
 }
 
 static inline int _raw_spin_trylock(spinlock_t *x)
Index: include/asm-parisc/system.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/system.h,v
retrieving revision 1.7
diff -u -p -r1.7 system.h
--- include/asm-parisc/system.h	18 Aug 2004 20:21:41 -0000	1.7
+++ include/asm-parisc/system.h	5 Sep 2004 00:58:42 -0000
@@ -141,7 +141,7 @@ static inline void set_eiem(unsigned lon
 /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
 #define __ldcw(a) ({ \
 	unsigned __ret; \
-	__asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a)); \
+	__asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a) : "memory"); \
 	__ret; \
 })
 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
