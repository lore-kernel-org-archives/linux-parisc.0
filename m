Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C559488D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 30 Aug 2003 10:39:01 -0600 (MDT)
Date: Sat, 30 Aug 2003 12:37:33 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca,
	Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Re: [glibc] fixing delayed exceptions in hppa
Message-ID: <20030830163732.GG5194@systemhalted>
References: <20030823055506.GA9821@systemhalted> <200308231612.MAA21233@hiauly3.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308231612.MAA21233@hiauly3.hia.nrc.ca>
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

> 
> Yes.  If you follow the thread that I sent you, Jim Hull comments on
> this and offers a rewrite of the sentence that you quoted.  I believe
> that referencing memory is important as this makes the operation visible
> to another processor.  A register->register operation doesn't do this.
> 

I implemented and tested 3 versions, fcpy doesn't work on my c3k, but
the fstd and fldd does. Any recommendations on which to take. I'm
tempted to leave all this in and send the patch like this upstream, so I
don't forget what the other versions looked like :)

Comments welcome.

c.


diff -u -p -r1.4 fraiseexcpt.c
--- libc/sysdeps/hppa/fpu/fraiseexcpt.c	10 Sep 2002 01:26:37 -0000	1.4
+++ libc/sysdeps/hppa/fpu/fraiseexcpt.c	30 Aug 2003 16:35:48 -0000
@@ -22,9 +22,27 @@
 #include <float.h>
 #include <math.h>
 
+/* We implement three methods for flushing delayed exceptions. The first
+   is an interlocked register copy with the destination register of the 
+   trapping insn. This method is not recommended, and may not work in all
+   situations. The last two, either loading or storing a value from memory
+   into the destination register of the trapping insn will work, here we
+   choose to store the value to memory.
+  
+   Please see section 10, 
+   page 10-5 "Delayed Trapping" in the PA-RISC 2.0 Architecture manual */
+
+#undef BARRIER_FCPY
+#define BARRIER_FSTD
+#undef BARRIER_FLDD
+
 int
 feraiseexcept (int excepts)
 {
+  /* Provides a place to fake our write for flushing the delayed trap */
+   double dmem = 0;
+   double * pmem = &dmem;
+	
   /* Raise exceptions represented by EXCEPTS.  But we must raise only one
      signal at a time.  It is important that if the overflow/underflow
      exception and the divide by zero exception are given at the same
@@ -33,26 +51,49 @@ feraiseexcept (int excepts)
 
   /* We do these bits in assembly to be certain GCC doesn't optimize
      away something important, and so we can force delayed traps to
-     occur.  */
-
-  /* FIXME: These all need verification! */
+     occur. */
 
   /* First: invalid exception.  */
   if (excepts & FE_INVALID)
     {
       /* One example of a invalid operation is 0 * Infinity.  */
       double d = HUGE_VAL;
-      __asm__ __volatile__ ("fmpy,dbl %1,%%fr0,%0\n\t"
-			    /* FIXME: is this a proper trap barrier? */
-			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d));
+      __asm__ __volatile__ (
+		"	fmpy,dbl %0,%%fr0,%0\n"
+#ifdef BARRIER_FCPY
+		"	fcpy,dbl %0,%1"
+		: "+f" (d), "=f" (dmem)
+#endif
+#ifdef BARRIER_FSTD
+		"	fstd,dbl %0,%1"
+		: "+f" (d), "=m" (*pmem)
+#endif
+#ifdef BARRIER_FLDD
+		"	fldd,dbl 0(%%sr0,%%sp),%0"
+		: "+f" (d)
+#endif
+	);
     }
 
   /* Next: division by zero.  */
   if (excepts & FE_DIVBYZERO)
     {
       double d = 1.0;
-      __asm__ __volatile__ ("fdiv,dbl %1,%%fr0,%0\n\t"
-			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d));
+      __asm__ __volatile__ (
+		"	fdiv,dbl %0,%%fr0,%0\n"
+#ifdef BARRIER_FCPY		
+		"	fcpy,dbl %0,%1"
+		: "+f" (d), "=f" (dmem)
+#endif
+#ifdef BARRIER_FSTD
+		"	fstd,dbl %0,%1"
+		: "+f" (d), "=m" (*pmem)
+#endif
+#ifdef BARRIER_FLDD
+		"	fldd,dbl 0(%%sr0,%%sp),%0"
+		: "+f" (d)
+#endif		
+	);
     }
 
   /* Next: overflow.  */
@@ -61,8 +102,21 @@ feraiseexcept (int excepts)
     {
       double d = DBL_MAX;
 
-      __asm__ __volatile__ ("fmpy,dbl %1,%1,%0\n\t"
-			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d));
+      __asm__ __volatile__ (
+		"	fmpy,dbl %0,%0,%0\n"
+#ifdef BARRIER_FCPY		
+		"	fcpy,dbl %0,%1"
+		: "+f" (d), "=f" (dmem)
+#endif
+#ifdef BARRIER_FSTD
+		"	fstd,dbl %0,%1"
+		: "+f" (d), "=m" (*pmem)
+#endif
+#ifdef BARRIER_FLDD
+		"	fldd,dbl 0(%%sr0,%%sp),%0"
+		: "+f" (d)
+#endif		
+	);
     }
 
   /* Next: underflow.  */
@@ -71,8 +125,23 @@ feraiseexcept (int excepts)
       double d = DBL_MIN;
       double e = 69.69;
 
-      __asm__ __volatile__ ("fdiv,dbl %1,%2,%0\n\t"
-			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d), "f" (e));
+      __asm__ __volatile__ (
+#ifdef BARRIER_FCPY		
+		"	fdiv,dbl %0,%2,%0\n"
+		"	fcpy,dbl %0,%1"
+		: "+f" (d), "=f" (dmem) : "f" (e)
+#endif
+#ifdef BARRIER_FSTD
+		"	fdiv,dbl %0,%2,%0\n"
+		"	fstd,dbl %0,%1"
+		: "+f" (d), "=m" (*pmem) : "f" (e)
+#endif
+#ifdef BARRIER_FLDD
+		"	fdiv,dbl %0,%1,%0\n"
+		"	fldd,dbl 0(%%sr0,%%sp),%0"
+		: "+f" (d) : "f" (e)
+#endif		
+	);
     }
 
   /* Last: inexact.  */
@@ -81,8 +150,23 @@ feraiseexcept (int excepts)
       double d = 1.0;
       double e = M_PI;
 
-      __asm__ __volatile__ ("fdiv,dbl %1,%2,%0\n\t"
-			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d), "f" (e));
+      __asm__ __volatile__ (
+#ifdef BARRIER_FCPY		
+		"	fdiv,dbl %0,%2,%0\n"
+		"	fcpy,dbl %0,%1"
+		: "+f" (d), "=f" (dmem) : "f" (e)
+#endif
+#ifdef BARRIER_FSTD
+		"	fdiv,dbl %0,%2,%0\n"
+		"	fstd,dbl %0,%1"
+		: "+f" (d), "=m" (*pmem) : "f" (e)
+#endif
+#ifdef BARRIER_FLDD
+		"	fdiv,dbl %0,%1,%0\n"
+		"	fldd,dbl 0(%%sr0,%%sp),%0"
+		: "+f" (d) : "f" (e)
+#endif		
+	);
     }
 
   /* Success.  */
