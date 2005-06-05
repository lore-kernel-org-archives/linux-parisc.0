From: Joel Soete <soete.joel@tiscali.be>
Subject: Some other cleanup [Was: [parisc-linux] c3k panics]
Date: Sun, 05 Jun 2005 19:15:56 +0000
Message-ID: <42A34F6C.7030903@tiscali.be>
References: <4282FEEE0000724C@mail-5-bnl.tiscali.it>
	<20050531062619.GI3050@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050531062619.GI3050@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Randolph,


Randolph Chung wrote:
>>Ok clear but still confused why 32bit branch doesn't nullify the insn
>>in delay slot like did 64bit?
> 
> 
> it's a bug, but fortunately that copy of the fixup_branch macro (in
> syscall.S) isn't actually used ;-) I'll remove it.
> 
> 
Just in the hope of help here are some cleanup:
	o at a place there was 2 enbraced #ifdef CONFIG_PA20,
	o in #else /* !CONFIG_PA20 */ ... #endif , afaik there are few chance that __LP64__ (aka CONFIG_64BIT)?
	o the (micro)-optimization we spoke previoulsy
	o here above syscall.S
--- arch/parisc/kernel/unaligned.c.Orig	2005-06-05 19:18:19.000000000 +0200
+++ arch/parisc/kernel/unaligned.c	2005-06-05 20:17:47.000000000 +0200
@@ -39,10 +39,15 @@
  #define RFMT "%08lx"
  #endif

+#ifndef	CONFIG_64BIT
+#define FIXUP_BRANCH(lbl) \
+	"\tb,n " #lbl "\n"
+#else
  #define FIXUP_BRANCH(lbl) \
  	"\tldil L%%" #lbl ", %%r1\n"			\
  	"\tldo R%%" #lbl "(%%r1), %%r1\n"		\
  	"\tbv,n %%r0(%%r1)\n"
+#endif

  /* 1111 1100 0000 0000 0001 0011 1100 0000 */
  #define OPCODE1(a,b,c)	((a)<<26|(b)<<12|(c)<<6)
@@ -213,6 +218,7 @@

  	return ret;
  }
+
  static int emulate_ldd(struct pt_regs *regs, int toreg, int flop)
  {
  	unsigned long saddr = regs->ior;
@@ -254,7 +260,7 @@
  	: "=r" (val), "=r" (ret)
  	: "0" (val), "r" (saddr), "r" (regs->isr)
  	: "r19", "r20" );
-#else
+#else	/* !CONFIG_PA20 */
      {
  	unsigned long valh=0,vall=0;
  	__asm__ __volatile__  (
@@ -275,22 +281,16 @@
  	FIXUP_BRANCH(4b)
  "	.previous\n"
  "	.section __ex_table,\"aw\"\n"
-#ifdef __LP64__
-"	.dword	1b,5b\n"
-"	.dword  2b,5b\n"
-"	.dword	3b,5b\n"
-#else
  "	.word	1b,5b\n"
  "	.word	2b,5b\n"
  "	.word	3b,5b\n"
-#endif
  "	.previous\n"
  	: "=r" (valh), "=r" (vall), "=r" (ret)
  	: "0" (valh), "1" (vall), "r" (saddr), "r" (regs->isr)
  	: "r19", "r20" );
  	val=((__u64)valh<<32)|(__u64)vall;
      }
-#endif
+#endif	/* !CONFIG_PA20 */

  	DPRINTF("val = 0x%llx\n", val);

@@ -393,6 +393,7 @@

  	return 0;
  }
+
  static int emulate_std(struct pt_regs *regs, int frreg, int flop)
  {
  	__u64 val;
@@ -451,7 +452,7 @@
  	: "=r" (ret)
  	: "r" (val), "r" (regs->ior), "r" (regs->isr)
  	: "r19", "r20", "r21", "r22", "r1" );
-#else
+#else	/* !CONFIG_PA20 */
      {
  	unsigned long valh=(val>>32),vall=(val&0xffffffffl);
  	__asm__ __volatile__ (
@@ -479,25 +480,17 @@
  	FIXUP_BRANCH(6b)
  "	.previous\n"
  "	.section __ex_table,\"aw\"\n"
-#ifdef __LP64__
-"	.dword	1b,7b\n"
-"	.dword  2b,7b\n"
-"	.dword	3b,7b\n"
-"	.dword  4b,7b\n"
-"	.dword  5b,7b\n"
-#else
  "	.word	1b,7b\n"
  "	.word	2b,7b\n"
  "	.word	3b,7b\n"
  "	.word	4b,7b\n"
  "	.word  	5b,7b\n"
-#endif
  "	.previous\n"
  	: "=r" (ret)
  	: "r" (valh), "r" (vall), "r" (regs->ior), "r" (regs->isr)
  	: "r19", "r20", "r21", "r1" );
      }
-#endif
+#endif	/* !CONFIG_PA20 */

  	return ret;
  }
@@ -683,14 +676,12 @@
  		ret = emulate_std(regs, R2(regs->iir),1);
  		break;

-#ifdef CONFIG_PA20
  	case OPCODE_LDD_L:
  		ret = emulate_ldd(regs, R2(regs->iir),0);
  		break;
  	case OPCODE_STD_L:
  		ret = emulate_std(regs, R2(regs->iir),0);
  		break;
-#endif
  	}
  #endif
  	switch (regs->iir & OPCODE3_MASK)
@@ -774,8 +765,7 @@
   * now, so we only check for PA1.1 encodings at this point.
   */

-int
-check_unaligned(struct pt_regs *regs)
+int check_unaligned(struct pt_regs *regs)
  {
  	unsigned long align_mask;

--- arch/parisc/kernel/syscall.S.Orig	2005-06-05 19:52:36.000000000 +0200
+++ arch/parisc/kernel/syscall.S	2005-06-05 19:57:15.000000000 +0200
@@ -23,23 +23,7 @@
  	 */
  #define KILL_INSN	break	0,0

-#ifdef CONFIG_64BIT
-	.level          2.0w
-#else
-	.level		1.1
-#endif
-
-#ifndef CONFIG_64BIT
-	.macro fixup_branch,lbl
-	b	    \lbl
-	.endm
-#else
-	.macro fixup_branch,lbl
-	ldil	    L%\lbl, %r1
-	ldo	    R%\lbl(%r1), %r1
-	bv,n        %r0(%r1)
-	.endm
-#endif
+	.level		LEVEL

  	.text

--- arch/parisc/lib/lusercopy.S.Orig	2005-06-05 19:36:55.000000000 +0200
+++ arch/parisc/lib/lusercopy.S	2005-06-05 20:02:51.000000000 +0200
@@ -54,9 +54,13 @@
  	.endm

  	.macro fixup_branch lbl
-	ldil	    L%\lbl, %r1
-	ldo	    R%\lbl(%r1), %r1
-	bv          %r0(%r1)
+#ifndef CONFIG_64BIT
+	b		\lbl
+#else
+	ldil		L%\lbl, %r1
+	ldo		R%\lbl(%r1), %r1
+	bv		%r0(%r1)
+#endif
  	.endm

  	/*
====<>====

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
