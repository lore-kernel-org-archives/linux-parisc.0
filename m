Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 778FF482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 22:00:53 -0600 (MDT)
Date: Mon, 11 Aug 2003 23:58:11 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, LaMont Jones <lamont@hp.com>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030812035810.GB9325@systemhalted>
References: <20030725070449.GB13017@systemhalted> <20030725114615.GI1485@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030725114615.GI1485@parcelfarce.linux.theplanet.co.uk>
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

On Fri, Jul 25, 2003 at 12:46:15PM +0100, Matthew Wilcox wrote:
> can't do that.  we have three sets of routines -- itlb_miss_common_11,
> itlb_miss_common_20 and itlb_miss_common_20w.  we select between _20w
> or not at compile time (if it's 64-bit, it's PA 2.0 Wide), but select
> between _20 and _11 at boot time (fault_vector_20 vs fault_vector_11).
> 
> shame on you, you didn't even try assembling it ;-)

Assembles, and boots on my C3K, 32-bit kernel. Looking for any takers
who want to try it in 64-bit mode. I'm running lmbench to see if I can
tell the difference between this and the original code. 

I would be most appreciative if anyone would pipe up and say "Run X to
test if Y works better/faster/harder" :}

c.

--- arch/parisc/kernel/entry.S	9 Dec 2002 06:09:08 -0000	1.98
+++ arch/parisc/kernel/entry.S	12 Aug 2003 03:49:04 -0000
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
