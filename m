From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop per-CPU exception_data struct dropped.
Date: Sun, 2 Apr 2017 16:51:58 +0200
Message-ID: <20170402145158.GA31702@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The only users have been migrated off by commits d19f5e41b344 ("parisc:
Clean up fixup routines for get_user()/put_user()") and 554bfeceb8a2
("parisc: Fix access fault handling in pa_memcpy()").

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 8442727..04cb974 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -74,17 +74,6 @@ struct exception_table_entry {
 	ASM_EXCEPTIONTABLE_ENTRY( fault_addr, except_addr + 1)
 
 /*
- * The page fault handler stores, in a per-cpu area, the following information
- * if a fixup routine is available.
- */
-struct exception_data {
-	unsigned long fault_ip;
-	unsigned long fault_gp;
-	unsigned long fault_space;
-	unsigned long fault_addr;
-};
-
-/*
  * load_sr2() preloads the space register %%sr2 - based on the value of
  * get_fs() - with either a value of 0 to access kernel space (KERNEL_DS which
  * is 0), or with the current value of %%sr3 to access user space (USER_DS)
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index 1c4fe61..dfff8a0 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -298,11 +298,6 @@ int main(void)
 	DEFINE(HUGEPAGE_SIZE, PAGE_SIZE);
 #endif
 	BLANK();
-	DEFINE(EXCDATA_IP, offsetof(struct exception_data, fault_ip));
-	DEFINE(EXCDATA_GP, offsetof(struct exception_data, fault_gp));
-	DEFINE(EXCDATA_SPACE, offsetof(struct exception_data, fault_space));
-	DEFINE(EXCDATA_ADDR, offsetof(struct exception_data, fault_addr));
-	BLANK();
 	DEFINE(ASM_PDC_RESULT_SIZE, NUM_PDC_RESULT * sizeof(unsigned long));
 	BLANK();
 	return 0;
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 32ec221..fdc34cf 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -29,8 +29,6 @@
 #define BITSSET		0x1c0	/* for identifying LDCW */
 
 
-DEFINE_PER_CPU(struct exception_data, exception_data);
-
 int show_unhandled_signals = 1;
 
 /*
@@ -143,13 +141,6 @@ int fixup_exception(struct pt_regs *regs)
 
 	fix = search_exception_tables(regs->iaoq[0]);
 	if (fix) {
-		struct exception_data *d;
-		d = this_cpu_ptr(&exception_data);
-		d->fault_ip = regs->iaoq[0];
-		d->fault_gp = regs->gr[27];
-		d->fault_space = regs->isr;
-		d->fault_addr = regs->ior;
