From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix SMP races when updating PTE and TLB entries in
 entry.S
Date: Thu, 16 May 2013 21:25:28 +0200
Message-ID: <20130516192528.GA357@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: stable@vger.kernel.org, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

please add to stable kernel v3.9
upstream commit f0a18819e261afc5fdbd8c5c6f9943123c5461ba

From: John David Anglin <dave.anglin@bell.net>

Currently, race conditions exist in the handling of TLB interruptions in
entry.S.  In particular, dirty bit updates can be lost if an accessed
interruption occurs just after the dirty bit interruption on a different
cpu.  Lost dirty bit updates result in user pages not being flushed and
general system instability.  This change adds lock and unlock macros to
synchronize all PTE and TLB updates done in entry.S.  As a result,
userspace stability is significantly improved.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 4bb96ad..ae27cb6 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -452,9 +452,41 @@
 	L2_ptep		\pgd,\pte,\index,\va,\fault
 	.endm
 
+	/* Acquire pa_dbit_lock lock. */
+	.macro		dbit_lock	spc,tmp,tmp1
+#ifdef CONFIG_SMP
+	cmpib,COND(=),n	0,\spc,2f
+	load32		PA(pa_dbit_lock),\tmp
+1:	LDCW		0(\tmp),\tmp1
+	cmpib,COND(=)	0,\tmp1,1b
+	nop
+2:
+#endif
+	.endm
+
+	/* Release pa_dbit_lock lock without reloading lock address. */
+	.macro		dbit_unlock0	spc,tmp
+#ifdef CONFIG_SMP
+	or,COND(=)	%r0,\spc,%r0
+	stw             \spc,0(\tmp)
+#endif
+	.endm
+
+	/* Release pa_dbit_lock lock. */
+	.macro		dbit_unlock1	spc,tmp
+#ifdef CONFIG_SMP
+	load32		PA(pa_dbit_lock),\tmp
+	dbit_unlock0	\spc,\tmp
+#endif
+	.endm
+
 	/* Set the _PAGE_ACCESSED bit of the PTE.  Be clever and
 	 * don't needlessly dirty the cache line if it was already set */
-	.macro		update_ptep	ptep,pte,tmp,tmp1
+	.macro		update_ptep	spc,ptep,pte,tmp,tmp1
+#ifdef CONFIG_SMP
+	or,COND(=)	%r0,\spc,%r0
+	LDREG		0(\ptep),\pte
+#endif
 	ldi		_PAGE_ACCESSED,\tmp1
 	or		\tmp1,\pte,\tmp
 	and,COND(<>)	\tmp1,\pte,%r0
@@ -463,7 +495,11 @@
 
 	/* Set the dirty bit (and accessed bit).  No need to be
 	 * clever, this is only used from the dirty fault */
-	.macro		update_dirty	ptep,pte,tmp
+	.macro		update_dirty	spc,ptep,pte,tmp
+#ifdef CONFIG_SMP
+	or,COND(=)	%r0,\spc,%r0
+	LDREG		0(\ptep),\pte
+#endif
 	ldi		_PAGE_ACCESSED|_PAGE_DIRTY,\tmp
 	or		\tmp,\pte,\pte
 	STREG		\pte,0(\ptep)
@@ -1111,11 +1147,13 @@ dtlb_miss_20w:
 
 	L3_ptep		ptp,pte,t0,va,dtlb_check_alias_20w
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 	
 	idtlbt          pte,prot
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1135,11 +1173,13 @@ nadtlb_miss_20w:
 
 	L3_ptep		ptp,pte,t0,va,nadtlb_check_alias_20w
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
 	idtlbt          pte,prot
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1161,7 +1201,8 @@ dtlb_miss_11:
 
 	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_11
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb_11	spc,pte,prot
 
@@ -1172,6 +1213,7 @@ dtlb_miss_11:
 	idtlbp		prot,(%sr1,va)
 
 	mtsp		t0, %sr1	/* Restore sr1 */
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1192,7 +1234,8 @@ nadtlb_miss_11:
 
 	L2_ptep		ptp,pte,t0,va,nadtlb_check_alias_11
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb_11	spc,pte,prot
 
@@ -1204,6 +1247,7 @@ nadtlb_miss_11:
 	idtlbp		prot,(%sr1,va)
 
 	mtsp		t0, %sr1	/* Restore sr1 */
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1224,13 +1268,15 @@ dtlb_miss_20:
 
 	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_20
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
 	f_extend	pte,t0
 
 	idtlbt          pte,prot
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1250,13 +1296,15 @@ nadtlb_miss_20:
 
 	L2_ptep		ptp,pte,t0,va,nadtlb_check_alias_20
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
 	f_extend	pte,t0
 	
         idtlbt          pte,prot
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1357,11 +1405,13 @@ itlb_miss_20w:
 
 	L3_ptep		ptp,pte,t0,va,itlb_fault
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 	
 	iitlbt          pte,prot
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1379,11 +1429,13 @@ naitlb_miss_20w:
 
 	L3_ptep		ptp,pte,t0,va,naitlb_check_alias_20w
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
 	iitlbt          pte,prot
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1405,7 +1457,8 @@ itlb_miss_11:
 
 	L2_ptep		ptp,pte,t0,va,itlb_fault
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb_11	spc,pte,prot
 
@@ -1416,6 +1469,7 @@ itlb_miss_11:
 	iitlbp		prot,(%sr1,va)
 
 	mtsp		t0, %sr1	/* Restore sr1 */
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1427,7 +1481,8 @@ naitlb_miss_11:
 
 	L2_ptep		ptp,pte,t0,va,naitlb_check_alias_11
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb_11	spc,pte,prot
 
@@ -1438,6 +1493,7 @@ naitlb_miss_11:
 	iitlbp		prot,(%sr1,va)
 
 	mtsp		t0, %sr1	/* Restore sr1 */
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1459,13 +1515,15 @@ itlb_miss_20:
 
 	L2_ptep		ptp,pte,t0,va,itlb_fault
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
 	f_extend	pte,t0	
 
 	iitlbt          pte,prot
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1477,13 +1535,15 @@ naitlb_miss_20:
 
 	L2_ptep		ptp,pte,t0,va,naitlb_check_alias_20
 
-	update_ptep	ptp,pte,t0,t1
+	dbit_lock	spc,t0,t1
+	update_ptep	spc,ptp,pte,t0,t1
 
 	make_insert_tlb	spc,pte,prot
 
 	f_extend	pte,t0
 
 	iitlbt          pte,prot
+	dbit_unlock1	spc,t0
 
 	rfir
 	nop
@@ -1507,29 +1567,13 @@ dbit_trap_20w:
 
 	L3_ptep		ptp,pte,t0,va,dbit_fault
 
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nolock_20w
-	load32		PA(pa_dbit_lock),t0
-
-dbit_spin_20w:
-	LDCW		0(t0),t1
-	cmpib,COND(=)         0,t1,dbit_spin_20w
-	nop
-
-dbit_nolock_20w:
-#endif
-	update_dirty	ptp,pte,t1
+	dbit_lock	spc,t0,t1
+	update_dirty	spc,ptp,pte,t1
 
 	make_insert_tlb	spc,pte,prot
 		
 	idtlbt          pte,prot
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nounlock_20w
-	ldi             1,t1
-	stw             t1,0(t0)
-
-dbit_nounlock_20w:
-#endif
+	dbit_unlock0	spc,t0
 
 	rfir
 	nop
@@ -1543,18 +1587,8 @@ dbit_trap_11:
 
 	L2_ptep		ptp,pte,t0,va,dbit_fault
 
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nolock_11
-	load32		PA(pa_dbit_lock),t0
-
-dbit_spin_11:
-	LDCW		0(t0),t1
-	cmpib,=         0,t1,dbit_spin_11
-	nop
-
-dbit_nolock_11:
-#endif
-	update_dirty	ptp,pte,t1
+	dbit_lock	spc,t0,t1
+	update_dirty	spc,ptp,pte,t1
 
 	make_insert_tlb_11	spc,pte,prot
 
@@ -1565,13 +1599,7 @@ dbit_nolock_11:
 	idtlbp		prot,(%sr1,va)
 
 	mtsp            t1, %sr1     /* Restore sr1 */
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nounlock_11
-	ldi             1,t1
-	stw             t1,0(t0)
-
-dbit_nounlock_11:
-#endif
+	dbit_unlock0	spc,t0
 
 	rfir
 	nop
@@ -1583,32 +1611,15 @@ dbit_trap_20:
 
 	L2_ptep		ptp,pte,t0,va,dbit_fault
 
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nolock_20
-	load32		PA(pa_dbit_lock),t0
-
-dbit_spin_20:
-	LDCW		0(t0),t1
-	cmpib,=         0,t1,dbit_spin_20
-	nop
-
-dbit_nolock_20:
-#endif
-	update_dirty	ptp,pte,t1
+	dbit_lock	spc,t0,t1
+	update_dirty	spc,ptp,pte,t1
 
 	make_insert_tlb	spc,pte,prot
 
 	f_extend	pte,t1
 	
         idtlbt          pte,prot
-
-#ifdef CONFIG_SMP
-	cmpib,COND(=),n        0,spc,dbit_nounlock_20
-	ldi             1,t1
-	stw             t1,0(t0)
