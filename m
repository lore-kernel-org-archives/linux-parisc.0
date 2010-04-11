From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [PATCH] Remove unnecessary macros from entry.S
Date: Sun, 11 Apr 2010 13:03:54 -0400
Message-ID: <20100411170353.GA7756@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="TB36FDmn/VVEgNH/"
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 09 Apr 2010, Carlos O'Donell wrote:

> We need to start splitting up your giant "stability" patch into
> manageable chunks.

Here's the second chunk.  It's a cleanup.

The EXTR, DEP and DEPI macros are unnecessary.  There are PA 1.X
pneumonics available with the same functionality, and the DEP and DEPI
macros conflict with assembler pneumonics.

Tested on a variety of 32 and 64-bit systems.

Signed-off-by: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="entry.S.d"

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 3a44f7f..a7e9472 100644
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
@@ -605,7 +579,7 @@
 	depdi		0,31,32,\tmp
 #endif
 	copy		\va,\tmp1
-	DEPI		0,31,23,\tmp1
+	depi		0,31,23,\tmp1
 	cmpb,COND(<>),n	\tmp,\tmp1,\fault
 	ldi		(_PAGE_DIRTY|_PAGE_WRITE|_PAGE_READ),\prot
 	depd,z		\prot,8,7,\prot

--TB36FDmn/VVEgNH/--
