Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02C5D482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Jul 2003 01:06:32 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19fwdG-0005rs-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Jul 2003 03:04:50 -0400
Date: Fri, 25 Jul 2003 03:04:50 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030725070449.GB13017@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="mYCpIKhGyMATD0i+"
Subject: [parisc-linux] itlb miss handler optimizations!
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

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


pa,

Lamont and myself were discussing the lightweight syscall
implementations and ran across some interesting itlb optimizations.

We first looked at the itlb_miss_XX functions, where XX is one of 11 or
20 wether your kernel is 32 or 64-bits respectively. And we saw that
there is an interlocked 'or' that nullifies a compare and branch. This
as Lamont argued, isn't as optimal as possible. 

Before:
	mfsp current space
	/* if faulting space is kernel space that's okay */
	or with nullify the current space and 0.
	/* die bad userpace die */
	cmpb if the faulting space <> current space then die.

Which can mean that branch prediction borks _all_ the time since if
userspace was constantly faulting then there wouldn't be much userspace
left.

Now:
	mfsp current space
	/* branch prediciton forward is winning */
	cmpb to itlb_user_fault if faulting space <> current space.
	/* ... else life is good */


	itlb_user_fault:
	/* Was it the kernel? Oh yeah... that's okay then */
	/* branch prediction winning again! */
	cmpb if the faulting space was 0, then go back up.

The nice part seems to be the predicted branches. Since we still have
one interlock between the mfsp and the cmpb, but the processor is
already filled it's queues with coming insn in the next bit of the itlb.
We keep the processor looking forward in the common case. Maybe it's
early in the morning and I'm not thinking well, but maybe it's Lamonts
ability to convince you of something you aren't sure of :)

Patch attached. We also moved a zdep to better the forward path during a
set of insn that weren't doing much waiting around for a memory read.

THE PATCH IS UNTESTED! If you want to give it a shot... please do so and
tell us if your box dies^H^H^H^H runs faster :)

Cheers,
Carlos.


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="entry.S.diff"

Index: entry.S
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/entry.S,v
retrieving revision 1.98
diff -u -p -r1.98 entry.S
--- entry.S	9 Dec 2002 06:09:08 -0000	1.98
+++ entry.S	25 Jul 2003 06:37:58 -0000
@@ -1535,8 +1535,7 @@ itlb_miss_11:
 	mfctl           %cr25,ptp	/* load user pgd */
 
 	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,itlb_fault /* forward */
+	cmpb,<>,n	t0,spc,itlb_user_fault /* forward */
 
 	/* First level page table lookup */
 
@@ -1551,6 +1550,10 @@ itlb_miss_common_11:
 	sh2addl 	 t0,ptp,ptp
 	ldi		_PAGE_ACCESSED,t1
 	ldw		 0(ptp),pte
+
+	/* Running parallel, taken from below 'zdep0' */
+	zdep            spc,30,15,prot  /* create prot id from space */
+
 	bb,>=,n 	 pte,_PAGE_PRESENT_BIT,itlb_fault
 
 	/* Check whether the "accessed" bit was set, otherwise do so */
@@ -1559,7 +1562,7 @@ itlb_miss_common_11:
 	and,<>		t1,pte,%r0	/* test and nullify if already set */
 	stw		t0,0(ptp)	/* write back pte */
 
-	zdep            spc,30,15,prot  /* create prot id from space */
+	/* zdep0 moved back */
 	dep             pte,8,7,prot    /* add in prot bits from pte */
 
 	extru,=		pte,_PAGE_NO_CACHE_BIT,1,r0
@@ -1602,8 +1605,7 @@ itlb_miss_20:
 	mfctl           %cr25,ptp	/* load user pgd */
 
 	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,itlb_fault /* forward */
+	cmpb,<>,n	t0,spc,itlb_user_fault	/* forward */
 
 	/* First level page table lookup */
 
@@ -1882,6 +1884,15 @@ kernel_bad_space:
 dbit_fault:
 	b               intr_save
 	ldi             20,%r8
+
+itlb_user_fault:
+	/* User tlb missed for other than his own space. Optimization. */
+#ifdef __LP64__
+	cmpb,=		%r0,t0,itlb_miss_common20 /* backward */
+#else
+	cmpb,=		%r0,t0,itlb_miss_common11 /* backward */
+#endif
+	nop
 
 itlb_fault:
 	b               intr_save

--mYCpIKhGyMATD0i+--
