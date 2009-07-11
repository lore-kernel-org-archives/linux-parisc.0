From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Wierd code in Entry.S
Date: Fri, 10 Jul 2009 21:05:12 -0400 (EDT)
Message-ID: <20090711010513.38B824FE2@hiauly1.hia.nrc.ca>
References: <20090711003052.AF4554F19@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, grundler@parisc-linux.org,
	artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090711003052.AF4554F19@hiauly1.hia.nrc.ca> from "John David Anglin" at Jul 10, 2009 08:30:51 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> It looks to me like these macros can be deleted.  For example, the PA 1.x
> depi mneumonic is equivalent to the PA 2.0 depwi mneumonic.  See Table
> J-2 in PA 2.0 arch.  There's no need for the 64-bit versions.  The PA 1.x
> mneumonics are still valid in PA 2.0 assembler.  However, I would suggest
> that the PA 2.0 mneumonics be used in PA 2.0 specific code.

The following still boots (64-bit UP kernel).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index ae3e70c..896791a 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -364,32 +364,6 @@
 	.align		32
 	.endm
 
-	/* The following are simple 32 vs 64 bit instruction
-	 * abstractions for the macros */
-	.macro		EXTR	reg1,start,length,reg2
-#ifdef CONFIG_64BIT
-	extrd,u		\reg1,32+(\start),\length,\reg2
-#else
-	extrw,u		\reg1,\start,\length,\reg2
-#endif
-	.endm
-
-	.macro		DEP	reg1,start,length,reg2
-#ifdef CONFIG_64BIT
-	depd		\reg1,32+(\start),\length,\reg2
-#else
-	depw		\reg1,\start,\length,\reg2
-#endif
-	.endm
-
-	.macro		DEPI	val,start,length,reg
-#ifdef CONFIG_64BIT
-	depdi		\val,32+(\start),\length,\reg
-#else
-	depwi		\val,\start,\length,\reg
-#endif
-	.endm
-
 	/* In LP64, the space contains part of the upper 32 bits of the
 	 * fault.  We have to extract this and place it in the va,
 	 * zeroing the corresponding bits in the space register */
@@ -442,19 +416,19 @@
 	 */
 	.macro		L2_ptep	pmd,pte,index,va,fault
 #if PT_NLEVELS == 3
-	EXTR		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
+	extru		\va,31-ASM_PMD_SHIFT,ASM_BITS_PER_PMD,\index
 #else
-	EXTR		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
+	extru		\va,31-ASM_PGDIR_SHIFT,ASM_BITS_PER_PGD,\index
 #endif
-	DEP             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
+	dep             %r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	copy		%r0,\pte
 	ldw,s		\index(\pmd),\pmd
 	bb,>=,n		\pmd,_PxD_PRESENT_BIT,\fault
-	DEP		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
+	dep		%r0,31,PxD_FLAG_SHIFT,\pmd /* clear flags */
 	copy		\pmd,%r9
 	SHLREG		%r9,PxD_VALUE_SHIFT,\pmd
-	EXTR		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
-	DEP		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
+	extru		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
+	dep		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
 	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd
 	LDREG		%r0(\pmd),\pte		/* pmd is now pte */
 	bb,>=,n		\pte,_PAGE_PRESENT_BIT,\fault
@@ -553,7 +527,7 @@
 	 * on most of those machines only handles cache transactions.
 	 */
 	extrd,u,*=	\pte,_PAGE_NO_CACHE_BIT+32,1,%r0
-	depi		1,12,1,\prot
+	depdi		1,12,1,\prot
 
 	/* Drop prot bits and convert to page addr for iitlbt and idtlbt */
 	convert_for_tlb_insert20 \pte
@@ -605,7 +579,7 @@
 	depdi		0,31,32,\tmp
 #endif
 	copy		\va,\tmp1
-	DEPI		0,31,23,\tmp1
+	depi		0,31,23,\tmp1
 	cmpb,COND(<>),n	\tmp,\tmp1,\fault
 	ldi		(_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),\prot
 	depd,z		\prot,8,7,\prot
