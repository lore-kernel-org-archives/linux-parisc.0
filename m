Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 20 Aug 2003 15:41:03 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux-cvs@lists.parisc-linux.org
Message-ID: <20030820194103.GA18688@systemhalted>
References: <20030820192919.0C20349401C@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030820192919.0C20349401C@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
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

On Wed, Aug 20, 2003 at 01:29:19PM -0600, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux
> Changes by:	carlos	03/08/20 13:29:19
> 
> Modified files:
> 	arch/parisc/kernel: entry.S 
> 
> Log message:
> itlb_fault optmizaztion

Lamont made a good catch and we optimized the standard case in the itlb
fault fast path, keeping the CPU's forward branch prediction working in
our favour. As such our numbers for various syscalls (LMBENCH tests)
have become more stable from call to call. The best number is our 'page
fault' which has shown a ~10x speedup :) It used to be 130 microseconds
+/- 100 microseconds, and is now consistently ~13 microseconds.

I ran 30 LMBENCH runs, 10 each for the following configurations:
1- ITLB Optimization
2- ITLB Optimization + Removal of a register interlock on the fast path
3- No ITLB Optimization

I've applied #2 to our CVS. Please tell me if anyone sees any breakage.
This runs fine on my C3K.

Cheers,
Carlos.

Index: entry.S
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/entry.S,v
retrieving revision 1.98
diff -u -p -r1.98 entry.S
--- entry.S	9 Dec 2002 06:09:08 -0000	1.98
+++ entry.S	12 Aug 2003 03:49:04 -0000
@@ -1469,8 +1469,7 @@ itlb_miss_20w:
 	mfctl           %cr25,ptp	/* load user pgd */
 
 	mfsp            %sr7,t0		/* Get current space */
-	or,*=           %r0,t0,%r0      /* If kernel, nullify following test */
-	cmpb,*<>,n      t0,spc,itlb_fault /* forward */
+	cmpb,<>,n	t0,spc,itlb_user_fault_20w /* forward */
 
 	/* First level page table lookup */
 
@@ -1535,8 +1534,7 @@ itlb_miss_11:
 	mfctl           %cr25,ptp	/* load user pgd */
 
 	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,itlb_fault /* forward */
+	cmpb,<>,n	t0,spc,itlb_user_fault_11 /* forward */
 
 	/* First level page table lookup */
 
@@ -1551,6 +1549,10 @@ itlb_miss_common_11:
 	sh2addl 	 t0,ptp,ptp
 	ldi		_PAGE_ACCESSED,t1
 	ldw		 0(ptp),pte
+
+	/* Running parallel, taken from below 'zdep0' */
+	zdep            spc,30,15,prot  /* create prot id from space */
+
 	bb,>=,n 	 pte,_PAGE_PRESENT_BIT,itlb_fault
 
 	/* Check whether the "accessed" bit was set, otherwise do so */
@@ -1559,7 +1561,7 @@ itlb_miss_common_11:
 	and,<>		t1,pte,%r0	/* test and nullify if already set */
 	stw		t0,0(ptp)	/* write back pte */
 
-	zdep            spc,30,15,prot  /* create prot id from space */
+	/* zdep0 moved back */
 	dep             pte,8,7,prot    /* add in prot bits from pte */
 
 	extru,=		pte,_PAGE_NO_CACHE_BIT,1,r0
@@ -1602,8 +1604,7 @@ itlb_miss_20:
 	mfctl           %cr25,ptp	/* load user pgd */
 
 	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,itlb_fault /* forward */
+	cmpb,<>,n	t0,spc,itlb_user_fault_20	/* forward */
 
 	/* First level page table lookup */
 
@@ -1882,6 +1883,37 @@ kernel_bad_space:
 dbit_fault:
 	b               intr_save
 	ldi             20,%r8
+
+/* The following three labels relate to an optimization in the itlb handler.
+   itlb_user_fault_20w:
+   itlb_user_fault_20:
+   itlb_user_fault_11:
+   We keep the CPU jumping fwd/bkwd in the common case, and the uncommon case
+   has the cmpb fail (no jump) and thus branch prediction failing. */
+
+#ifdef __LP64__
+itlb_user_fault_20w:
+	/* User tlb missed for other than his own space. Optimization. */
+	cmpb,=		%r0,t0,itlb_miss_common_20w /* backward */
+	nop
+#else
+itlb_user_fault_20:
+	/* User tlb missed for other than his own space. Optimization. */
+	cmpb,=		%r0,t0,itlb_miss_common_20 /* backward */
+	nop
+
+/* FALL THROUGH - We don't care if we run the test twice. If someone
+                  asks to have the "user is faulting death" path optimal
+                  then they should seek help. */
+
+itlb_user_fault_11:
+	/* User tlb missed for other than his own space. Optimization. */
+	cmpb,=		%r0,t0,itlb_miss_common_11 /* backward */
+	nop
+#endif
+
+/* FALL THROUGH - We have a real itlb_fault from one of the above three
+                  label sequences */
 
 itlb_fault:
 	b               intr_save
