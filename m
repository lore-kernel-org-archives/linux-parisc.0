From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Use relative addresses in exception tables
Date: Mon, 4 Jan 2016 22:12:47 +0100
Message-ID: <20160104211247.GA25146@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Change exception tables to use relative instead of absolute addresses.
This saves quite some memory in the vmlinux binary with the 64bit
kernel.

This patch depends on the patch series "generic relative extable
support" by Ard Biesheuvel <ard.biesheuvel@linaro.org>

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
index b3069fd..d6a2458 100644
--- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -523,7 +523,7 @@
 	 */
 #define ASM_EXCEPTIONTABLE_ENTRY(fault_addr, except_addr)	\
 	.section __ex_table,"aw"			!	\
-	ASM_ULONG_INSN	fault_addr, except_addr		!	\
+	.word 	(fault_addr - .), (except_addr - .)	!	\
 	.previous
 
 
diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 0abdd4c..d4dd6e5 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -60,14 +60,15 @@ static inline long access_ok(int type, const void __user * addr,
  * use a 32bit (unsigned int) address here.
  */
 
+#define ARCH_HAS_RELATIVE_EXTABLE
 struct exception_table_entry {
-	unsigned long insn;	/* address of insn that is allowed to fault. */
-	unsigned long fixup;	/* fixup routine */
+	int insn;	/* relative address of insn that is allowed to fault. */
+	int fixup;	/* relative address of fixup routine */
 };
 
 #define ASM_EXCEPTIONTABLE_ENTRY( fault_addr, except_addr )\
 	".section __ex_table,\"aw\"\n"			   \
-	ASM_WORD_INSN #fault_addr ", " #except_addr "\n\t" \
+	".word (" #fault_addr " - .), (" #except_addr " - .)\n\t" \
 	".previous\n"
 
 /*
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index a762864..26fac9c 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -140,12 +140,6 @@ int fixup_exception(struct pt_regs *regs)
 {
 	const struct exception_table_entry *fix;
 
-	/* If we only stored 32bit addresses in the exception table we can drop
-	 * out if we faulted on a 64bit address. */
-	if ((sizeof(regs->iaoq[0]) > sizeof(fix->insn))
-		&& (regs->iaoq[0] >> 32))
-			return 0;
-
 	fix = search_exception_tables(regs->iaoq[0]);
 	if (fix) {
 		struct exception_data *d;
@@ -154,7 +148,8 @@ int fixup_exception(struct pt_regs *regs)
 		d->fault_space = regs->isr;
 		d->fault_addr = regs->ior;
 
-		regs->iaoq[0] = ((fix->fixup) & ~3);
+		regs->iaoq[0] = (unsigned long)&fix->fixup + fix->fixup;
+		regs->iaoq[0] &= ~3;
 		/*
 		 * NOTE: In some cases the faulting instruction
 		 * may be in the delay slot of a branch. We
diff --git a/scripts/sortextable.c b/scripts/sortextable.c
index af247c7..2944391 100644
--- a/scripts/sortextable.c
+++ b/scripts/sortextable.c
@@ -283,6 +283,7 @@ do_file(char const *const fname)
 	case EM_X86_64:
 	case EM_S390:
 	case EM_AARCH64:
+	case EM_PARISC:
 		custom_sort = sort_relative_table;
 		break;
 	case EM_ARCOMPACT:
