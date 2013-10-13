From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: provide macro to create exception table entries
Date: Sun, 13 Oct 2013 21:11:30 +0200
Message-ID: <20131013191130.GA1437@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Provide a macro ASM_EXCEPTIONTABLE_ENTRY() to create exception table
entries and convert all open-coded places to use that macro.

This patch is a first step toward creating a exception table which only
holds 32bit pointers even on a 64bit kernel. That way in my own kernel
I was able to reduce the in-kernel exception table from 44kB to 22kB.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
index 0da8482..b3069fd 100644
--- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -515,5 +515,17 @@
 	nop	/* 7 */
 	.endm
 
+	/*
+	 * ASM_EXCEPTIONTABLE_ENTRY
+	 *
+	 * Creates an exception table entry.
+	 * Do not convert to a assembler macro. This won't work.
+	 */
+#define ASM_EXCEPTIONTABLE_ENTRY(fault_addr, except_addr)	\
+	.section __ex_table,"aw"			!	\
+	ASM_ULONG_INSN	fault_addr, except_addr		!	\
+	.previous
+
+
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index e0a8235..4006964 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -59,12 +59,13 @@ static inline long access_ok(int type, const void __user * addr,
 /*
  * The exception table contains two values: the first is an address
  * for an instruction that is allowed to fault, and the second is
- * the address to the fixup routine. 
+ * the address to the fixup routine. Even on a 64bit kernel we could
+ * use a 32bit (unsigned int) address here.
  */
 
 struct exception_table_entry {
-	unsigned long insn;  /* address of insn that is allowed to fault.   */
-	long fixup;          /* fixup routine */
+	unsigned long insn;	/* address of insn that is allowed to fault. */
+	unsigned long fixup;	/* fixup routine */
 };
 
 #define ASM_EXCEPTIONTABLE_ENTRY( fault_addr, except_addr )\
diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index e767ab7..a63bb179 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -649,10 +649,8 @@ cas_action:
 	/* Two exception table entries, one for the load,
 	   the other for the store. Either return -EFAULT.
 	   Each of the entries must be relocated. */
-	.section __ex_table,"aw"
-	ASM_ULONG_INSN (1b - linux_gateway_page), (3b - linux_gateway_page)
-	ASM_ULONG_INSN (2b - linux_gateway_page), (3b - linux_gateway_page)
-	.previous
+	ASM_EXCEPTIONTABLE_ENTRY(1b-linux_gateway_page, 3b-linux_gateway_page)
+	ASM_EXCEPTIONTABLE_ENTRY(2b-linux_gateway_page, 3b-linux_gateway_page)
 
 
 	/* Make sure nothing else is placed on this page */
diff --git a/arch/parisc/lib/lusercopy.S b/arch/parisc/lib/lusercopy.S
index 6f2d935..a512f07 100644
--- a/arch/parisc/lib/lusercopy.S
+++ b/arch/parisc/lib/lusercopy.S
@@ -88,9 +88,7 @@ ENDPROC(lclear_user)
 	ldo        1(%r25),%r25
 	.previous
 
-	.section __ex_table,"aw"
-	ASM_ULONG_INSN 1b,2b
-	.previous
+	ASM_EXCEPTIONTABLE_ENTRY(1b,2b)
 
 	.procend
 
@@ -129,10 +127,8 @@ ENDPROC(lstrnlen_user)
 	copy        %r24,%r26    /* reset r26 so 0 is returned on fault */
 	.previous
 
-	.section __ex_table,"aw"
-	ASM_ULONG_INSN 1b,3b
-	ASM_ULONG_INSN 2b,3b
-	.previous
+	ASM_EXCEPTIONTABLE_ENTRY(1b,3b)
+	ASM_EXCEPTIONTABLE_ENTRY(2b,3b)
 
 	.procend
 
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 0293588..d7aea72 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -142,6 +142,11 @@ int fixup_exception(struct pt_regs *regs)
 {
 	const struct exception_table_entry *fix;
 
+	/* If we only stored 32bit addresses in the exception table we can drop
+	 * out if we faulted on a 64bit address. */
+	if (sizeof(fix->insn) == 4 && regs->iaoq[0] >> 32)
+		return 0;
+
 	fix = search_exception_tables(regs->iaoq[0]);
 	if (fix) {
 		struct exception_data *d;
