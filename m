From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] [randolph@tausq.org: Re: DIFF 2.6.7-pa13 SMP fixes]
Date: Sun, 11 Jul 2004 15:27:45 -0600
Message-ID: <20040711212745.GA15160@colo.lackof.org>
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

Folks,
Here's another good example of
	"Just because it boots doesn't mean it's right"

Someone was asserting SMP is stable (based on their experience).
But it was clearly corrupting the lock pointer.

Kudos to Thibaut Varene on the spinlock debug code.

thanks,
grant

----- Forwarded message from Randolph Chung <randolph@tausq.org> -----

From: Randolph Chung <randolph@tausq.org>
To: parisc-linux-cvs@lists.parisc-linux.org
Subject: Re: [parisc-linux-cvs] linux-2.6 tausq

> 	.              : Makefile 
> 	arch/parisc/kernel: entry.S smp.c traps.c 
> 	include/asm-parisc: pgtable.h 
> 
> Log message:
> 2.6.7-pa13
> Fix a bug in entry.S where pa_dbit_lock was being trashed
> Fix debug spinlock warnings in pgtable.h

<ggg> T-Bone deserves a big cookie :^)

Index: Makefile
===================================================================
RCS file: /var/cvs/linux-2.6/Makefile,v
retrieving revision 1.219
diff -u -p -r1.219 Makefile
--- Makefile	11 Jul 2004 04:26:04 -0000	1.219
+++ Makefile	11 Jul 2004 17:29:32 -0000
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 6
 SUBLEVEL = 7
-EXTRAVERSION = -pa12
+EXTRAVERSION = -pa13
 NAME=Zonked Quokka
 
 # *DOCUMENTATION*
Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/entry.S,v
retrieving revision 1.15
diff -u -p -r1.15 entry.S
--- arch/parisc/kernel/entry.S	9 Jul 2004 19:04:20 -0000	1.15
+++ arch/parisc/kernel/entry.S	11 Jul 2004 17:29:33 -0000
@@ -518,7 +518,7 @@
 
 	/* Set the dirty bit (and accessed bit).  No need to be
 	 * clever, this is only used from the dirty fault */
-	.macro		update_dirty	ptep,pte,tmp,tmp1
+	.macro		update_dirty	ptep,pte,tmp
 	ldi		_PAGE_ACCESSED|_PAGE_DIRTY,\tmp
 	or		\tmp,\pte,\pte
 	STREG		\pte,0(\ptep)
@@ -1559,7 +1559,7 @@ dbit_spin_20w:
 
 dbit_nolock_20w:
 #endif
-	update_dirty	ptp,pte,t0,t1
+	update_dirty	ptp,pte,t1
 
 	make_insert_tlb	spc,pte,prot
 		
@@ -1596,7 +1596,7 @@ dbit_spin_11:
 
 dbit_nolock_11:
 #endif
-	update_dirty	ptp,pte,t0,t1
+	update_dirty	ptp,pte,t1
 
 	make_insert_tlb_11	spc,pte,prot
 
@@ -1637,11 +1637,11 @@ dbit_spin_20:
 
 dbit_nolock_20:
 #endif
-	update_dirty	ptp,pte,t0,t1
+	update_dirty	ptp,pte,t1
 
 	make_insert_tlb	spc,pte,prot
 
-	f_extend	pte,t0
+	f_extend	pte,t1
 	
         idtlbt          pte,prot
 
Index: arch/parisc/kernel/smp.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/smp.c,v
retrieving revision 1.8
diff -u -p -r1.8 smp.c
--- arch/parisc/kernel/smp.c	23 May 2004 23:51:52 -0000	1.8
+++ arch/parisc/kernel/smp.c	11 Jul 2004 17:29:33 -0000
@@ -54,8 +54,6 @@
 
 #define kDEBUG 0
 
-spinlock_t pa_dbit_lock = SPIN_LOCK_UNLOCKED;
-
 spinlock_t smp_lock = SPIN_LOCK_UNLOCKED;
 
 volatile struct task_struct *smp_init_current_idle_task;
Index: arch/parisc/kernel/traps.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/traps.c,v
retrieving revision 1.13
diff -u -p -r1.13 traps.c
--- arch/parisc/kernel/traps.c	28 Apr 2004 19:12:10 -0000	1.13
+++ arch/parisc/kernel/traps.c	11 Jul 2004 17:29:34 -0000
@@ -44,6 +44,10 @@
 #define PRINT_USER_FAULTS /* (turn this on if you want user faults to be */
 			  /*  dumped to the console via printk)          */
 
+#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
+spinlock_t pa_dbit_lock = SPIN_LOCK_UNLOCKED;
+#endif
+
 int printbinary(char *buf, unsigned long x, int nbits)
 {
 	unsigned long mask = 1UL << (nbits - 1);
Index: include/asm-parisc/pgtable.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/pgtable.h,v
retrieving revision 1.15
diff -u -p -r1.15 pgtable.h
--- include/asm-parisc/pgtable.h	10 Jul 2004 07:51:15 -0000	1.15
+++ include/asm-parisc/pgtable.h	11 Jul 2004 17:29:37 -0000
@@ -455,11 +455,7 @@ static inline int ptep_test_and_clear_di
 #endif
 }
 
-#ifdef CONFIG_SMP
 extern spinlock_t pa_dbit_lock;
-#else
-static spinlock_t pa_dbit_lock; /* dummy to keep the compilers happy */
-#endif
 
 static inline pte_t ptep_get_and_clear(pte_t *ptep)
 {
_______________________________________________
parisc-linux-cvs mailing list
parisc-linux-cvs@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux-cvs

----- End forwarded message -----
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
