Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id A683F4840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Aug 2003 19:40:04 -0600 (MDT)
Date: Thu, 21 Aug 2003 21:39:31 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Message-ID: <20030822013931.GD31872@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [glibc] fixing delayed exceptions in hppa
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

parisc-linux,

Just a quick RFC on this patch. I've generated a register interlock on
the previous exception raising result register. This _should_ cause delayed
exceptions to be flushed immediately on all processors.

Under my C3K testsetup it fixes the test-fenv failure that was
specifically related to "child raises exception, exception comes in late
and kills parent after child called join."

Comments more than welcome, I'll be submitting this upstream if nobody
has any quibles with my gcc asm :)

c.

--- libc/sysdeps/hppa/fpu/fraiseexcpt.c	10 Sep 2002 01:26:37 -0000	1.4
+++ libc/sysdeps/hppa/fpu/fraiseexcpt.c	19 Aug 2003 18:52:33 -0000
@@ -25,6 +25,8 @@
 int
 feraiseexcept (int excepts)
 {
+  /* Used in the trap barrier */
+	double dummy;
   /* Raise exceptions represented by EXCEPTS.  But we must raise only one
      signal at a time.  It is important that if the overflow/underflow
      exception and the divide by zero exception are given at the same
@@ -42,17 +44,17 @@ feraiseexcept (int excepts)
     {
       /* One example of a invalid operation is 0 * Infinity.  */
       double d = HUGE_VAL;
-      __asm__ __volatile__ ("fmpy,dbl %1,%%fr0,%0\n\t"
+      __asm__ __volatile__ ("fmpy,dbl %2,%%fr0,%0\n\t"
 			    /* FIXME: is this a proper trap barrier? */
-			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d));
+			    "fcpy,dbl %0,%1" : "=f" (d), "=f" (dummy) : "0" (d));
     }
 
   /* Next: division by zero.  */
   if (excepts & FE_DIVBYZERO)
     {
       double d = 1.0;
-      __asm__ __volatile__ ("fdiv,dbl %1,%%fr0,%0\n\t"
-			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d));
+      __asm__ __volatile__ ("fdiv,dbl %2,%%fr0,%0\n\t"
+			    "fcpy,dbl %2,%1" : "=f" (d), "=f" (dummy) : "0" (d));
     }
 
   /* Next: overflow.  */
@@ -61,8 +63,8 @@ feraiseexcept (int excepts)
     {
       double d = DBL_MAX;
 
-      __asm__ __volatile__ ("fmpy,dbl %1,%1,%0\n\t"
-			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d));
+      __asm__ __volatile__ ("fmpy,dbl %2,%2,%0\n\t"
+			    "fcpy,dbl %2,%1" : "=f" (d), "=f" (dummy) : "0" (d));
     }
 
   /* Next: underflow.  */
@@ -71,8 +73,8 @@ feraiseexcept (int excepts)
       double d = DBL_MIN;
       double e = 69.69;
 
-      __asm__ __volatile__ ("fdiv,dbl %1,%2,%0\n\t"
-			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d), "f" (e));
+      __asm__ __volatile__ ("fdiv,dbl %2,%3,%0\n\t"
+			    "fcpy,dbl %2,%1" : "=f" (d), "=f" (dummy) : "0" (d), "f" (e));
     }
 
   /* Last: inexact.  */
@@ -81,8 +83,8 @@ feraiseexcept (int excepts)
       double d = 1.0;
       double e = M_PI;
 
-      __asm__ __volatile__ ("fdiv,dbl %1,%2,%0\n\t"
-			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d), "f" (e));
+      __asm__ __volatile__ ("fdiv,dbl %2,%3,%0\n\t"
+			    "fcpy,dbl %2,%1" : "=f" (d), "=f" (dummy) : "0" (d), "f" (e));
     }
 
   /* Success.  */
