Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3RHFoa21287; Tue, 27 Apr 2004 13:15:50 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20040427171140.706074945BD@palinux.hppa>
References: <20040427171140.706074945BD@palinux.hppa>
Content-Type: text/plain
Date: 27 Apr 2004 12:15:48 -0500
Message-Id: <1083086150.2297.32.camel@mulgrave>
Mime-Version: 1.0
Cc: parisc-linux-cvs@lists.parisc-linux.org
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 2004-04-27 at 12:11, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/04/27 11:11:39
> 
> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: entry.S 
> 	include/asm-parisc: page.h 
> 
> Log message:
> More assembler magic entry removal.
> 
> Also macro'ise the tlb miss handlers, making it much easier to
> alter them since all the information is collated in one place

===== arch/parisc/kernel/entry.S 1.15 vs edited =====
--- 1.15/arch/parisc/kernel/entry.S	Sun Apr 25 04:00:10 2004
+++ edited/arch/parisc/kernel/entry.S	Tue Apr 27 11:05:46 2004
@@ -40,11 +40,13 @@
 #ifdef __LP64__
 #define CMPIB           cmpib,*
 #define CMPB            cmpb,*
+#define COND(x)		*x
 
 	.level 2.0w
 #else
 #define CMPIB           cmpib,
 #define CMPB            cmpb,
+#define COND(x)		x
 
 	.level 2.0
 #endif
@@ -389,6 +391,208 @@
 	.align		32
 	.endm
 
+	/* The following are simple 32 vs 64 bit instruction
+	 * abstractions for the macros */
+	.macro		EXTR	reg1,start,length,reg2
+#ifdef __LP64__
+	extrd,u		\reg1,32+\start,\length,\reg2
+#else
+	extrw,u		\reg1,\start,\length,\reg2
+#endif
+	.endm
+
+	.macro		DEP	reg1,start,length,reg2
+#ifdef __LP64__
+	depd		\reg1,32+\start,\length,\reg2
+#else
+	depw		\reg1,\start,\length,\reg2
+#endif
+	.endm
+
+	.macro		DEPI	val,start,length,reg
+#ifdef __LP64__
+	depdi		\val,32+\start,\length,\reg
+#else
+	depwi		\val,\start,\length,\reg
+#endif
+	.endm
+
+	/* In LP64, the space contains part of the upper 32 bits of the
+	 * fault.  We have to extract this and place it in the va,
+	 * zeroing the corresponding bits in the space register */
+	.macro		space_adjust	spc,va,tmp
+#ifdef __LP64__
+	extrd,u		\spc,63,SPACEID_SHIFT,\tmp
+	depd		%r0,63,SPACEID_SHIFT,\spc
+	depd		\tmp,31,SPACEID_SHIFT,\va
+#endif
+	.endm
+
+	.import		swapper_pg_dir,code
+
+	/* Get the pgd.  For faults on space zero (kernel space), this
+	 * is simply swapper_pg_dir.  For user space faults, the
+	 * pgd is stored in %cr25 */
+	.macro		get_pgd		spc,reg
+	ldil		L%PA(swapper_pg_dir),\reg
+	ldo		R%PA(swapper_pg_dir)(\reg),\reg
+	or,COND(=)	%r0,\spc,%r0
+	mfctl		%cr25,\reg
+	.endm
+
+	/* Only allow faults on different spaces from the
+	 * currently active one if we're the kernel */
+	.macro		space_check	spc,tmp,fault
+	mfsp		%sr7,\tmp
+	or,COND(<>)	%r0,\spc,%r0	/* user may execute gateway page
+					 * as kernel, so defeat the space
+					 * check if it is */
+	copy		\spc,\tmp
+	or,COND(=)	%r0,\tmp,%r0	/* nullify if executing as kernel */
+	cmpb,COND(<>),n	\tmp,\spc,\fault
+	.endm
+
+	/* Look up a PTE in a 2-Level scheme (faulting at each
+	 * level if the entry isn't present */
+	.macro		L2_ptep	pmd,pte,index,va,fault
+	EXTR		\va,31-PMD_SHIFT,PAGE_SHIFT-BITS_PER_PMD,\index
+	copy		%r0,\pte
+	DEP		%r0,31,PAGE_SHIFT,\pmd	/* clear offset */
+	LDREG,s		\index(\pmd),\pmd
+	EXTR		\va,31-PAGE_SHIFT,PAGE_SHIFT-BITS_PER_PTE,\index
+	bb,>=,n		\pmd,_PAGE_PRESENT_BIT,\fault
+	DEP		%r0,31,PAGE_SHIFT,\pmd	/* clear offset */
+	shladd		\index,BITS_PER_PTE,\pmd,\pmd
+	LDREG		%r0(\pmd),\pte		/* pmd is now pte */
+	bb,>=,n		\pte,_PAGE_PRESENT_BIT,\fault
+	.endm
+
+	/* Look up PTE in a 3-Level scheme */
+	.macro		L3_ptep pgd,pte,index,va,fault
+	extrd,u		\va,63-PGDIR_SHIFT,PAGE_SHIFT-BITS_PER_PGD,\index
+	copy		%r0,\pte
+	ldd,s		\index(\pgd),\pgd
+	bb,>=,n		\pgd,_PAGE_PRESENT_BIT,\fault
+	L2_ptep		\pgd,\pte,\index,\va,\fault
+	.endm
+
+	/* Set the _PAGE_ACCESSED bit of the PTE.  Be clever and
+	 * don't needlessly dirty the cache line if it was already set */
+	.macro		update_ptep	ptep,pte,tmp,tmp1
+	ldi		_PAGE_ACCESSED,\tmp1
+	or		\tmp1,\pte,\tmp
+	and,COND(<>)	\tmp1,\pte,%r0
+	STREG		\tmp,0(\ptep)
+	.endm
+
+	/* Set the dirty bit (and accessed bit).  No need to be
+	 * clever, this is only used from the dirty fault */
+	.macro		update_dirty	ptep,pte,tmp,tmp1
+	ldi		_PAGE_ACCESSED|_PAGE_DIRTY,\tmp
+	or		\tmp,\pte,\pte
+	STREG		\pte,0(\ptep)
+	.endm
+
+	/* Convert the pte and prot to tlb insertion values.  How
+	 * this happens is quite subtle, read below */
+	.macro		make_insert_tlb	spc,pte,prot
+	space_to_prot   \spc \prot        /* create prot id from space */
+	/* The following is the real subtlety.  This is depositing
+	 * T <-> _PAGE_REFTRAP
+	 * D <-> _PAGE_DIRTY
+	 * B <-> _PAGE_DMB (memory break)
+	 *
+	 * Then incredible subtlety: The access rights are
+	 * _PAGE_GATEWAY _PAGE_EXEC _PAGE_READ
+	 * See 3-14 of the parisc 2.0 manual
+	 *
+	 * Finally, _PAGE_READ goes in the top bit of PL1 (so we
+	 * trigger an access rights trap in user space if the user
+	 * tries to read an unreadable page */
+	depd            \pte,8,7,\prot
+
+	/* PAGE_USER indicates the page can be read with user privileges,
+	 * so deposit X1|11 to PL1|PL2 (remember the upper bit of PL1
+	 * contains _PAGE_READ */
+	extrd,u,*=      \pte,_PAGE_USER_BIT+32,1,%r0
+	depdi		7,11,3,\prot
+	/* If we're a gateway page, drop PL2 back to zero for promotion
+	 * to kernel privilege (so we can execute the page as kernel).
+	 * Any privilege promotion page always denys read and write */
+	extrd,u,*= 	\pte,_PAGE_GATEWAY_BIT+32,1,%r0
+	depd		%r0,11,2,\prot	/* If Gateway, Set PL2 to 0 */
+
+	/* Get rid of prot bits and convert to page addr for iitlbt */
+
+	depd		%r0,63,PAGE_SHIFT,\pte
+	extrd,u		\pte,56,32,\pte
+	.endm
+
+	/* Identical macro to make_insert_tlb above, except it
+	 * makes the tlb entry for the differently formatted pa11
+	 * insertion instructions */
+	.macro		make_insert_tlb_11	spc,pte,prot
+	zdep		\spc,30,15,\prot
+	dep		\pte,8,7,\prot
+	extru,=		\pte,_PAGE_NO_CACHE_BIT,1,%r0
+	depi		1,12,1,\prot
+	extru,=         \pte,_PAGE_USER_BIT,1,%r0
+	depi		7,11,3,\prot   /* Set for user space (1 rsvd for read) */
+	extru,= 	\pte,_PAGE_GATEWAY_BIT,1,%r0
+	depi		0,11,2,\prot	/* If Gateway, Set PL2 to 0 */
+
+	/* Get rid of prot bits and convert to page addr for iitlba */
+
+	depi		0,31,12,\pte
+	extru		\pte,24,25,\pte
+
+	.endm
+
+	/* This is for ILP32 PA2.0 only.  The TLB insertion needs
+	 * to extend into I/O space if the address is 0xfXXXXXXX
+	 * so we extend the f's into the top word of the pte in
+	 * this case */
+	.macro		f_extend	pte,tmp
+	extrd,s		\pte,44,4,\tmp
+	addi,<>		1,\tmp,%r0
+	extrd,s		\pte,63,32,\pte
+	.endm
+
+	/* The alias region is an 8MB aligned 16MB to do clear and
+	 * copy user pages at addresses congruent with the user
+	 * virtual address.
+	 *
+	 * To use the alias page, you set %r26 up with the to TLB
+	 * entry (identifying the physical page) and %r23 up with
+	 * the from tlb entry (or nothing if only a to entry---for
+	 * clear_user_page_asm) */
+	.macro		do_alias	spc,tmp,tmp1,va,pte,prot,fault
+	cmpib,COND(<>),n 0,\spc,\fault
+	ldil		L%(TMPALIAS_MAP_START),\tmp
+#if defined(__LP64__) && (TMPALIAS_MAP_START >= 0x80000000)
+	/* on LP64, ldi will sign extend into the upper 32 bits,
+	 * which is behaviour we don't want */
+	depdi		0,31,32,\tmp
+#endif
+	copy		\va,\tmp1
+	DEPI		0,31,23,\tmp1
+	cmpb,COND(<>),n	\tmp,\tmp1,\fault
+	ldi		(_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),\prot
+	depd,z		\prot,8,7,\prot
+	/*
+	 * OK, it is in the temp alias region, check whether "from" or "to".
+	 * Check "subtle" note in pacache.S re: r23/r26.
+	 */
+#ifdef __LP64__
+	extrd,u,*=	\va,41,1,%r0
+#else
+	extrw,u,=	\va,9,1,%r0
+#endif
+	or,COND(tr)	%r23,%r0,\pte
+	or		%r26,%r0,\pte
+	.endm 
+
+
 	/*
 	 * Align fault_vector_20 on 4K boundary so that both
 	 * fault_vector_11 and fault_vector_20 are on the
@@ -979,85 +1183,23 @@
 #ifdef __LP64__
 
 dtlb_miss_20w:
-	extrd,u         spc,63,7,t1     /* adjust va */
-	depd            t1,31,7,va      /* adjust va */
-	depdi           0,63,7,spc      /* adjust space */
-	mfctl           %cr25,ptp	/* Assume user space miss */
-	or,*<>          %r0,spc,%r0     /* If it is user space, nullify */
-	mfctl           %cr24,ptp	/* Load kernel pgd instead */
-	extrd,u         va,33,9,t1      /* Get pgd index */
-
-	mfsp            %sr7,t0		/* Get current space */
-	or,*=           %r0,t0,%r0      /* If kernel, nullify following test */
-	cmpb,*<>,n       t0,spc,dtlb_fault /* forward */
-
-	/* First level page table lookup */
-
-	ldd,s           t1(ptp),ptp
-	extrd,u         va,42,9,t0     /* get second-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,dtlb_check_alias_20w
-	depdi           0,63,12,ptp     /* clear prot bits */
-
-	/* Second level page table lookup */
-
-	ldd,s           t0(ptp),ptp
-	extrd,u         va,51,9,t0     /* get third-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,dtlb_check_alias_20w
-	depdi           0,63,12,ptp     /* clear prot bits */
-
-	/* Third level page table lookup */
-
-	shladd           t0,3,ptp,ptp
-	ldi		_PAGE_ACCESSED,t1
-	ldd              0(ptp),pte
-	bb,>=,n          pte,_PAGE_PRESENT_BIT,dtlb_check_alias_20w
-
-	/* Check whether the "accessed" bit was set, otherwise do so */
-
-	or		t1,pte,t0	/* t0 has R bit set */
-	and,*<>         t1,pte,%r0      /* test and nullify if already set */
-	std             t0,0(ptp)       /* write back pte */
-
-	space_to_prot   spc prot        /* create prot id from space */
-	depd            pte,8,7,prot    /* add in prot bits from pte */
-
-	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
-	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
-	depdi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
+	space_adjust	spc,va,t0
+	get_pgd		spc,ptp
+	space_check	spc,t0,dtlb_fault
 
-	/* Get rid of prot bits and convert to page addr for idtlbt */
+	L3_ptep		ptp,pte,t0,va,dtlb_check_alias_20w
 
-	depdi		0,63,12,pte
-	extrd,u         pte,56,52,pte
+	update_ptep	ptp,pte,t0,t1
+
+	make_insert_tlb	spc,pte,prot
+	
 	idtlbt          pte,prot
 
 	rfir
 	nop
 
 dtlb_check_alias_20w:
-
-	/* Check to see if fault is in the temporary alias region */
-
-	cmpib,*<>,n     0,spc,dtlb_fault /* forward */
-	ldil            L%(TMPALIAS_MAP_START),t0
-#if (TMPALIAS_MAP_START >= 0x80000000)
-	depdi		0,31,32,t0	/* clear any sign extension */
-#endif
-	copy            va,t1
-	depdi           0,63,23,t1
-	cmpb,*<>,n      t0,t1,dtlb_fault /* forward */
-	ldi             (_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),prot
-	depd,z          prot,8,7,prot
-
-	/*
-	 * OK, it is in the temp alias region, check whether "from" or "to".
-	 * Check "subtle" note in pacache.S re: r23/r26.
-	 */
-
-	extrd,u,*=      va,41,1,r0
-	or,*tr          %r23,%r0,pte    /* If "from" use "from" page */
-	or,*            %r26,%r0,pte    /* else "to", use "to" page  */
+	do_alias	spc,t0,t1,va,pte,prot,dtlb_fault
 
 	idtlbt          pte,prot
 
@@ -1065,51 +1207,16 @@
 	nop
 
 nadtlb_miss_20w:
-	extrd,u         spc,63,7,t1     /* adjust va */
-	depd            t1,31,7,va      /* adjust va */
-	depdi           0,63,7,spc      /* adjust space */
-	mfctl           %cr25,ptp	/* Assume user space miss */
-	or,*<>          %r0,spc,%r0     /* If it is user space, nullify */
-	mfctl           %cr24,ptp	/* Load kernel pgd instead */
-	extrd,u         va,33,9,t1      /* Get pgd index */
-
-	mfsp            %sr7,t0		/* Get current space */
-	or,*=           %r0,t0,%r0      /* If kernel, nullify following test */
-	cmpb,*<>,n       t0,spc,nadtlb_fault /* forward */
-
-	/* First level page table lookup */
-
-	ldd,s           t1(ptp),ptp
-	extrd,u         va,42,9,t0     /* get second-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,nadtlb_emulate
-	depdi           0,63,12,ptp     /* clear prot bits */
-
-	/* Second level page table lookup */
-
-	ldd,s           t0(ptp),ptp
-	extrd,u         va,51,9,t0     /* get third-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,nadtlb_emulate
-	depdi           0,63,12,ptp     /* clear prot bits */
-
-	/* Third level page table lookup */
-
-	shladd           t0,3,ptp,ptp
-	ldi		_PAGE_ACCESSED,t1
-	ldd              0(ptp),pte
-	bb,>=,n          pte,_PAGE_PRESENT_BIT,nadtlb_check_flush_20w
-
-	space_to_prot   spc prot        /* create prot id from space */
-	depd            pte,8,7,prot    /* add in prot bits from pte */
-
-	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
-	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
-	depdi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
+	space_adjust	spc,va,t0
+	get_pgd		spc,ptp
+	space_check	spc,t0,nadtlb_fault
 
-	/* Get rid of prot bits and convert to page addr for idtlbt */
+	L3_ptep		ptp,pte,t0,va,nadtlb_check_flush_20w
+
+	update_ptep	ptp,pte,t0,t1
+
+	make_insert_tlb	spc,pte,prot
 
-	depdi		0,63,12,pte
-	extrd,u         pte,56,52,pte
 	idtlbt          pte,prot
 
 	rfir
@@ -1135,49 +1242,15 @@
 #else
 
 dtlb_miss_11:
-	mfctl           %cr25,ptp	/* Assume user space miss */
-	or,<>           %r0,spc,%r0	/* If it is user space, nullify */
-	mfctl           %cr24,ptp	/* Load kernel pgd instead */
-	extru		va,9,10,t1	/* Get pgd index */
-
-	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,dtlb_fault /* forward */
-
-	/* First level page table lookup */
-
-	ldwx,s		t1(ptp),ptp
-	extru		va,19,10,t0	/* get second-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,dtlb_check_alias_11
-	depi		0,31,12,ptp	/* clear prot bits */
-
-	/* Second level page table lookup */
-
-	sh2addl 	 t0,ptp,ptp
-	ldi		_PAGE_ACCESSED,t1
-	ldw		 0(ptp),pte
-	bb,>=,n          pte,_PAGE_PRESENT_BIT,dtlb_check_alias_11
-
-	/* Check whether the "accessed" bit was set, otherwise do so */
-
-	or		t1,pte,t0	/* t0 has R bit set */
-	and,<>		t1,pte,%r0	/* test and nullify if already set */
-	stw		t0,0(ptp)	/* write back pte */
-
-	zdep            spc,30,15,prot  /* create prot id from space */
-	dep             pte,8,7,prot    /* add in prot bits from pte */
-
-	extru,=		pte,_PAGE_NO_CACHE_BIT,1,r0
-	depi		1,12,1,prot
-	extru,=         pte,_PAGE_USER_BIT,1,r0
-	depi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
-	depi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
+	get_pgd		spc,ptp
 
-	/* Get rid of prot bits and convert to page addr for idtlba */
+	space_check	spc,t0,dtlb_fault
 
-	depi		0,31,12,pte
-	extru		pte,24,25,pte
+	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_11
+
+	update_ptep	ptp,pte,t0,t1
+
+	make_insert_tlb_11	spc,pte,prot
 
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
@@ -1218,43 +1291,16 @@
 	nop
 
 nadtlb_miss_11:
-	mfctl           %cr25,ptp	/* Assume user space miss */
-	or,<>           %r0,spc,%r0	/* If it is user space, nullify */
-	mfctl           %cr24,ptp	/* Load kernel pgd instead */
-	extru		va,9,10,t1	/* Get pgd index */
-
-	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,nadtlb_fault /* forward */
-
-	/* First level page table lookup */
-
-	ldwx,s		t1(ptp),ptp
-	extru		va,19,10,t0	/* get second-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,nadtlb_emulate
-	depi		0,31,12,ptp	/* clear prot bits */
-
-	/* Second level page table lookup */
-
-	sh2addl 	 t0,ptp,ptp
-	ldi		_PAGE_ACCESSED,t1
-	ldw		 0(ptp),pte
-	bb,>=,n          pte,_PAGE_PRESENT_BIT,nadtlb_check_flush_11
-
-	zdep            spc,30,15,prot  /* create prot id from space */
-	dep             pte,8,7,prot    /* add in prot bits from pte */
-
-	extru,=		pte,_PAGE_NO_CACHE_BIT,1,r0
-	depi		1,12,1,prot
-	extru,=         pte,_PAGE_USER_BIT,1,r0
-	depi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
-	depi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
+	get_pgd		spc,ptp
 
-	/* Get rid of prot bits and convert to page addr for idtlba */
+	space_check	spc,t0,nadtlb_fault
+
+	L2_ptep		ptp,pte,t0,va,nadtlb_check_flush_11
+
+	update_ptep	ptp,pte,t0,t1
+
+	make_insert_tlb_11	spc,pte,prot
 
-	depi		0,31,12,pte
-	extru		pte,24,25,pte
 
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
@@ -1292,120 +1338,44 @@
 	nop
 
 dtlb_miss_20:
-	mfctl           %cr25,ptp	/* Assume user space miss */
-	or,<>           %r0,spc,%r0	/* If it is user space, nullify */
-	mfctl           %cr24,ptp	/* Load kernel pgd instead */
-	extru		va,9,10,t1	/* Get pgd index */
-
-	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,dtlb_fault /* forward */
-
-	/* First level page table lookup */
-
-	ldwx,s		t1(ptp),ptp
-	extru		va,19,10,t0	/* get second-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,dtlb_check_alias_20
-	depi		0,31,12,ptp	/* clear prot bits */
-
-	/* Second level page table lookup */
-
-	sh2addl 	 t0,ptp,ptp
-	ldi		_PAGE_ACCESSED,t1
-	ldw		 0(ptp),pte
-	bb,>=,n          pte,_PAGE_PRESENT_BIT,dtlb_check_alias_20
-
-	/* Check whether the "accessed" bit was set, otherwise do so */
-
-	or		t1,pte,t0	/* t0 has R bit set */
-	and,<>		t1,pte,%r0	/* test and nullify if already set */
-	stw		t0,0(ptp)	/* write back pte */
-
-	space_to_prot   spc prot        /* create prot id from space */
-	depd            pte,8,7,prot    /* add in prot bits from pte */
-
-	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
-	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
-	depdi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
+	space_adjust	spc,va,t0
+	get_pgd		spc,ptp
+	space_check	spc,t0,dtlb_fault
 
-	/* Get rid of prot bits and convert to page addr for idtlbt */
+	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_20
+
+	update_ptep	ptp,pte,t0,t1
+
+	make_insert_tlb	spc,pte,prot
+
+	f_extend	pte,t0
 
-	extrd,s         pte,35,4,t0
-	depdi		0,63,12,pte	/* clear lower 12 bits */
-        addi,=          1,t0,0 
-        extrd,u,*tr     pte,56,25,pte 
-	extrd,s		pte,56,25,pte	/* bit 31:8 >> 8  */ 
 	idtlbt          pte,prot
 
 	rfir
 	nop
 
 dtlb_check_alias_20:
-
-	/* Check to see if fault is in the temporary alias region */
-
-	cmpib,<>,n      0,spc,dtlb_fault /* forward */
-	ldil            L%(TMPALIAS_MAP_START),t0
-	copy            va,t1
-	depwi           0,31,23,t1
-	cmpb,<>,n       t0,t1,dtlb_fault /* forward */
-	ldi             (_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),prot
-	depd,z          prot,8,7,prot
-
-	/*
-	 * OK, it is in the temp alias region, check whether "from" or "to".
-	 * Check "subtle" note in pacache.S re: r23/r26.
-	 */
-
-	extrw,u,=       va,9,1,r0
-	or,tr           %r23,%r0,pte    /* If "from" use "from" page */
-	or              %r26,%r0,pte    /* else "to", use "to" page  */
-
+	do_alias	spc,t0,t1,va,pte,prot,dtlb_fault
+	
 	idtlbt          pte,prot
 
 	rfir
 	nop
 
 nadtlb_miss_20:
-	mfctl           %cr25,ptp	/* Assume user space miss */
-	or,<>           %r0,spc,%r0	/* If it is user space, nullify */
-	mfctl           %cr24,ptp	/* Load kernel pgd instead */
-	extru		va,9,10,t1	/* Get pgd index */
-
-	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,nadtlb_fault /* forward */
-
-	/* First level page table lookup */
-
-	ldwx,s		t1(ptp),ptp
-	extru		va,19,10,t0	/* get second-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,nadtlb_emulate
-	depi		0,31,12,ptp	/* clear prot bits */
-
-	/* Second level page table lookup */
-
-	sh2addl 	 t0,ptp,ptp
-	ldi		_PAGE_ACCESSED,t1
-	ldw		 0(ptp),pte
-	bb,>=,n          pte,_PAGE_PRESENT_BIT,nadtlb_check_flush_20
-
-	space_to_prot   spc prot        /* create prot id from space */
-	depd            pte,8,7,prot    /* add in prot bits from pte */
-
-	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
-	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
-	depdi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
+	get_pgd		spc,ptp
 
-	/* Get rid of prot bits and convert to page addr for idtlbt */
+	space_check	spc,t0,nadtlb_fault
+
+	L2_ptep		ptp,pte,t0,va,nadtlb_check_flush_20
 
-        extrd,s         pte,35,4,t0
-        depdi           0,63,12,pte     /* clear lower 12 bits */
-        addi,=          1,t0,0
-        extrd,u,*tr     pte,56,25,pte
-        extrd,s         pte,56,25,pte   /* bit 31:8 >> 8  */
+	update_ptep	ptp,pte,t0,t1
+
+	make_insert_tlb	spc,pte,prot
+
+	f_extend	pte,t0
+	
         idtlbt          pte,prot
 
 	rfir
@@ -1478,119 +1448,33 @@
 	 * on the gateway page which is in the kernel address space.
 	 */
 
-	extrd,u         spc,63,7,t1     /* adjust va */
-	depd            t1,31,7,va      /* adjust va */
-	depdi           0,63,7,spc      /* adjust space */
-	cmpib,*=        0,spc,itlb_miss_kernel_20w
-	extrd,u         va,33,9,t1      /* Get pgd index */
-
-	mfctl           %cr25,ptp	/* load user pgd */
-
-	mfsp            %sr7,t0		/* Get current space */
-	or,*=           %r0,t0,%r0      /* If kernel, nullify following test */
-	cmpb,*<>,n      t0,spc,itlb_fault /* forward */
-
-	/* First level page table lookup */
-
-itlb_miss_common_20w:
-	ldd,s           t1(ptp),ptp
-	extrd,u         va,42,9,t0     /* get second-level index */
-	bb,>=,n 	ptp,_PAGE_PRESENT_BIT,itlb_fault
-	depdi           0,63,12,ptp     /* clear prot bits */
-
-	/* Second level page table lookup */
+	space_adjust	spc,va,t0
+	get_pgd		spc,ptp
+	space_check	spc,t0,itlb_fault
 
-	ldd,s           t0(ptp),ptp
-	extrd,u         va,51,9,t0     /* get third-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,itlb_fault
-	depdi           0,63,12,ptp     /* clear prot bits */
+	L3_ptep		ptp,pte,t0,va,itlb_fault
 
-	/* Third level page table lookup */
+	update_ptep	ptp,pte,t0,t1
 
-	shladd           t0,3,ptp,ptp
-	ldi		_PAGE_ACCESSED,t1
-	ldd              0(ptp),pte
-	bb,>=,n          pte,_PAGE_PRESENT_BIT,itlb_fault
-
-	/* Check whether the "accessed" bit was set, otherwise do so */
-
-	or		t1,pte,t0	/* t0 has R bit set */
-	and,*<>         t1,pte,%r0      /* test and nullify if already set */
-	std             t0,0(ptp)       /* write back pte */
-
-	space_to_prot   spc prot        /* create prot id from space */
-	depd            pte,8,7,prot    /* add in prot bits from pte */
-
-	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
-	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
-	depdi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
-
-	/* Get rid of prot bits and convert to page addr for iitlbt */
-
-	depdi		0,63,12,pte
-	extrd,u         pte,56,32,pte
+	make_insert_tlb	spc,pte,prot
+	
 	iitlbt          pte,prot
 
 	rfir
 	nop
 
-itlb_miss_kernel_20w:
-	b               itlb_miss_common_20w
-	mfctl           %cr24,ptp	/* Load kernel pgd */
 #else
 
 itlb_miss_11:
+	get_pgd		spc,ptp
 
-	/*
-	 * I miss is a little different, since we allow users to fault
-	 * on the gateway page which is in the kernel address space.
-	 */
-
-	cmpib,=         0,spc,itlb_miss_kernel_11
-	extru		va,9,10,t1	/* Get pgd index */
-
-	mfctl           %cr25,ptp	/* load user pgd */
-
-	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,itlb_fault /* forward */
+	space_check	spc,t0,itlb_fault
 
-	/* First level page table lookup */
+	L2_ptep		ptp,pte,t0,va,itlb_fault
 
-itlb_miss_common_11:
-	ldwx,s		t1(ptp),ptp
-	extru		va,19,10,t0	/* get second-level index */
-	bb,>=,n 	ptp,_PAGE_PRESENT_BIT,itlb_fault
-	depi		0,31,12,ptp	/* clear prot bits */
+	update_ptep	ptp,pte,t0,t1
 
-	/* Second level page table lookup */
-
-	sh2addl 	 t0,ptp,ptp
-	ldi		_PAGE_ACCESSED,t1
-	ldw		 0(ptp),pte
-	bb,>=,n 	 pte,_PAGE_PRESENT_BIT,itlb_fault
-
-	/* Check whether the "accessed" bit was set, otherwise do so */
-
-	or		t1,pte,t0	/* t0 has R bit set */
-	and,<>		t1,pte,%r0	/* test and nullify if already set */
-	stw		t0,0(ptp)	/* write back pte */
-
-	zdep            spc,30,15,prot  /* create prot id from space */
-	dep             pte,8,7,prot    /* add in prot bits from pte */
-
-	extru,=		pte,_PAGE_NO_CACHE_BIT,1,r0
-	depi		1,12,1,prot
-	extru,=         pte,_PAGE_USER_BIT,1,r0
-	depi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
-	depi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
-
-	/* Get rid of prot bits and convert to page addr for iitlba */
-
-	depi		0,31,12,pte
-	extru		pte,24,25,pte
+	make_insert_tlb_11	spc,pte,prot
 
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
@@ -1603,106 +1487,35 @@
 	rfir
 	nop
 
-itlb_miss_kernel_11:
-	b               itlb_miss_common_11
-	mfctl           %cr24,ptp	/* Load kernel pgd */
-
 itlb_miss_20:
+	get_pgd		spc,ptp
 
-	/*
-	 * I miss is a little different, since we allow users to fault
-	 * on the gateway page which is in the kernel address space.
-	 */
-
-	cmpib,=         0,spc,itlb_miss_kernel_20
-	extru		va,9,10,t1	/* Get pgd index */
-
-	mfctl           %cr25,ptp	/* load user pgd */
+	space_check	spc,t0,itlb_fault
 
-	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,itlb_fault /* forward */
+	L2_ptep		ptp,pte,t0,va,itlb_fault
 
-	/* First level page table lookup */
+	update_ptep	ptp,pte,t0,t1
 
-itlb_miss_common_20:
-	ldwx,s		t1(ptp),ptp
-	extru		va,19,10,t0	/* get second-level index */
-	bb,>=,n 	ptp,_PAGE_PRESENT_BIT,itlb_fault
-	depi		0,31,12,ptp	/* clear prot bits */
+	make_insert_tlb	spc,pte,prot
 
-	/* Second level page table lookup */
+	f_extend	pte,t0	
 
-	sh2addl 	 t0,ptp,ptp
-	ldi		_PAGE_ACCESSED,t1
-	ldw		 0(ptp),pte
-	bb,>=,n 	 pte,_PAGE_PRESENT_BIT,itlb_fault
-
-	/* Check whether the "accessed" bit was set, otherwise do so */
-
-	or		t1,pte,t0	/* t0 has R bit set */
-	and,<>		t1,pte,%r0	/* test and nullify if already set */
-	stw		t0,0(ptp)	/* write back pte */
-
-	space_to_prot   spc prot        /* create prot id from space */
-	depd            pte,8,7,prot    /* add in prot bits from pte */
-
-	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
-	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
-	depdi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
-
-	/* Get rid of prot bits and convert to page addr for iitlbt */
-
-        extrd,s         pte,35,4,t0 
-        depdi           0,63,12,pte     /* clear lower 12 bits */
-        addi,=          1,t0,0
-        extrd,u,*tr     pte,56,25,pte 
-        extrd,s         pte,56,25,pte   /* bit 31:8 >> 8  */
 	iitlbt          pte,prot
 
 	rfir
 	nop
 
-
-itlb_miss_kernel_20:
-	b               itlb_miss_common_20
-	mfctl           %cr24,ptp	/* Load kernel pgd */
 #endif
 
 #ifdef __LP64__
 
 dbit_trap_20w:
-	extrd,u         spc,63,7,t1     /* adjust va */
-	depd            t1,31,7,va      /* adjust va */
-	depdi           0,1,2,va        /* adjust va */
-	depdi           0,63,7,spc      /* adjust space */
-	mfctl           %cr25,ptp	/* Assume user space miss */
-	or,*<>          %r0,spc,%r0     /* If it is user space, nullify */
-	mfctl           %cr24,ptp	/* Load kernel pgd instead */
-	extrd,u         va,33,9,t1      /* Get pgd index */
-
-	mfsp            %sr7,t0		/* Get current space */
-	or,*=           %r0,t0,%r0      /* If kernel, nullify following test */
-	cmpb,*<>,n       t0,spc,dbit_fault /* forward */
-
-	/* First level page table lookup */
-
-	ldd,s           t1(ptp),ptp
-	extrd,u         va,42,9,t0     /* get second-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,dbit_fault
-	depdi           0,63,12,ptp     /* clear prot bits */
-
-	/* Second level page table lookup */
-
-	ldd,s           t0(ptp),ptp
-	extrd,u         va,51,9,t0     /* get third-level index */
-	bb,>=,n         ptp,_PAGE_PRESENT_BIT,dbit_fault
-	depdi           0,63,12,ptp     /* clear prot bits */
+	space_adjust	spc,va,t0
+	get_pgd		spc,ptp
+	space_check	spc,t0,dbit_fault
 
-	/* Third level page table lookup */
+	L3_ptep		ptp,pte,t0,va,dbit_fault
 
-	shladd           t0,3,ptp,ptp
 #ifdef CONFIG_SMP
 	CMPIB=,n        0,spc,dbit_nolock_20w
 	ldil            L%PA(pa_dbit_lock),t0
@@ -1715,27 +1528,10 @@
 
 dbit_nolock_20w:
 #endif
-	ldi		(_PAGE_ACCESSED|_PAGE_DIRTY),t1
-	ldd              0(ptp),pte
-	bb,>=,n          pte,_PAGE_PRESENT_BIT,dbit_fault
-
-	/* Set Accessed and Dirty bits in the pte */
-
-	or		t1,pte,pte
-	std             pte,0(ptp)      /* write back pte */
-
-	space_to_prot   spc prot        /* create prot id from space */
-	depd            pte,8,7,prot    /* add in prot bits from pte */
-
-	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
-	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
-	depdi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
+	update_dirty	ptp,pte,t0,t1
 
-	/* Get rid of prot bits and convert to page addr for idtlbt */
-
-	depdi		0,63,12,pte
-	extrd,u         pte,56,52,pte
+	make_insert_tlb	spc,pte,prot
+		
 	idtlbt          pte,prot
 #ifdef CONFIG_SMP
 	CMPIB=,n        0,spc,dbit_nounlock_20w
@@ -1750,25 +1546,13 @@
 #else
 
 dbit_trap_11:
-	mfctl           %cr25,ptp	/* Assume user space trap */
-	or,<>           %r0,spc,%r0	/* If it is user space, nullify */
-	mfctl           %cr24,ptp	/* Load kernel pgd instead */
-	extru		va,9,10,t1	/* Get pgd index */
-
-	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,dbit_fault /* forward */
 
-	/* First level page table lookup */
+	get_pgd		spc,ptp
 
-	ldwx,s		t1(ptp),ptp
-	extru		va,19,10,t0	/* get second-level index */
-	bb,>=,n 	ptp,_PAGE_PRESENT_BIT,dbit_fault
-	depi		0,31,12,ptp	/* clear prot bits */
+	space_check	spc,t0,dbit_fault
 
-	/* Second level page table lookup */
+	L2_ptep		ptp,pte,t0,va,dbit_fault
 
-	sh2addl 	 t0,ptp,ptp
 #ifdef CONFIG_SMP
 	CMPIB=,n        0,spc,dbit_nolock_11
 	ldil            L%PA(pa_dbit_lock),t0
@@ -1781,29 +1565,9 @@
 
 dbit_nolock_11:
 #endif
-	ldi		(_PAGE_ACCESSED|_PAGE_DIRTY),t1
-	ldw		 0(ptp),pte
-	bb,>=,n 	 pte,_PAGE_PRESENT_BIT,dbit_fault
-
-	/* Set Accessed and Dirty bits in the pte */
-
-	or		t1,pte,pte
-	stw		pte,0(ptp)	/* write back pte */
-
-	zdep            spc,30,15,prot  /* create prot id from space */
-	dep             pte,8,7,prot    /* add in prot bits from pte */
-
-	extru,=		pte,_PAGE_NO_CACHE_BIT,1,r0
-	depi		1,12,1,prot
-	extru,=         pte,_PAGE_USER_BIT,1,r0
-	depi		7,11,3,prot /* Set for user space (1 rsvd for read) */
-	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
-	depi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
-
-	/* Get rid of prot bits and convert to page addr for idtlba */
+	update_dirty	ptp,pte,t0,t1
 
-	depi		0,31,12,pte
-	extru		pte,24,25,pte
+	make_insert_tlb_11	spc,pte,prot
 
 	mfsp            %sr1,t1  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
@@ -1824,25 +1588,12 @@
 	nop
 
 dbit_trap_20:
-	mfctl           %cr25,ptp	/* Assume user space trap */
-	or,<>           %r0,spc,%r0	/* If it is user space, nullify */
-	mfctl           %cr24,ptp	/* Load kernel pgd instead */
-	extru		va,9,10,t1	/* Get pgd index */
+	get_pgd		spc,ptp
 
-	mfsp            %sr7,t0		/* Get current space */
-	or,=            %r0,t0,%r0	/* If kernel, nullify following test */
-	cmpb,<>,n       t0,spc,dbit_fault /* forward */
+	space_check	spc,t0,dbit_fault
 
-	/* First level page table lookup */
+	L2_ptep		ptp,pte,t0,va,dbit_fault
 
-	ldwx,s		t1(ptp),ptp
-	extru		va,19,10,t0	/* get second-level index */
-	bb,>=,n 	ptp,_PAGE_PRESENT_BIT,dbit_fault
-	depi		0,31,12,ptp	/* clear prot bits */
-
-	/* Second level page table lookup */
-
-	sh2addl 	 t0,ptp,ptp
 #ifdef CONFIG_SMP
 	CMPIB=,n        0,spc,dbit_nolock_20
 	ldil            L%PA(pa_dbit_lock),t0
@@ -1855,28 +1606,12 @@
 
 dbit_nolock_20:
 #endif
-	ldi		(_PAGE_ACCESSED|_PAGE_DIRTY),t1
-	ldw		 0(ptp),pte
-	bb,>=,n 	 pte,_PAGE_PRESENT_BIT,dbit_fault
-
-	/* Set Accessed and Dirty bits in the pte */
-
-	or		t1,pte,pte
-	stw		pte,0(ptp)	/* write back pte */
-
-	space_to_prot   spc prot        /* create prot id from space */
-	depd            pte,8,7,prot    /* add in prot bits from pte */
-
-	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
-	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
-	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
-	depdi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
-
-        extrd,s         pte,35,4,t0 
-        depdi           0,63,12,pte     /* clear lower 12 bits */
-        addi,=          1,t0,0
-        extrd,u,*tr     pte,56,25,pte 
-        extrd,s         pte,56,25,pte   /* bit 31:8 >> 8  */
+	update_dirty	ptp,pte,t0,t1
+
+	make_insert_tlb	spc,pte,prot
+
+	f_extend	pte,t0
+	
         idtlbt          pte,prot
 
 #ifdef CONFIG_SMP
===== include/asm-parisc/page.h 1.6 vs edited =====
--- 1.6/include/asm-parisc/page.h	Sun Apr 25 04:00:21 2004
+++ edited/include/asm-parisc/page.h	Tue Apr 27 11:02:42 2004
@@ -84,6 +84,15 @@
 
 #endif /* !__ASSEMBLY__ */
 
+#ifdef __LP64__
+#define BITS_PER_PTE	3
+#define BITS_PER_PMD	3
+#define BITS_PER_PGD	3
+#else
+#define BITS_PER_PTE	2
+#define BITS_PER_PMD	2
+#endif
+
 /* to align the pointer to the (next) page boundary */
 #define PAGE_ALIGN(addr)	(((addr)+PAGE_SIZE-1)&PAGE_MASK)
 
