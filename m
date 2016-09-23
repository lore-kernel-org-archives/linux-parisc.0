From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Report trap type as human readable string
Date: Fri, 23 Sep 2016 20:44:57 +0200
Message-ID: <20160923184457.GA14114@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When faulting on some trap, the kernel currently reports in dmesg:

 do_page_fault() command='perl' type=6 address=0xbe400403 in libcrypt-2.24.so[f9086000+9000]
 vm_start = 0x00922000, vm_end = 0x00aed000

With this change the trap type additionally gets reported as human readable
string which makes it simpler to recognize the type of problem:

 do_page_fault() command='perl' type=6 address=0xbe400403 in libcrypt-2.24.so[f9086000+9000]
 Instruction TLB miss fault, vm_start = 0x00922000, vm_end = 0x00aed000

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 16dbe81..bdbd73b 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -168,6 +168,43 @@ int fixup_exception(struct pt_regs *regs)
 }
 
 /*
+ * parisc hardware trap list
+ *
+ * Documented in section 3 "Addressing and Access Control" of the
+ * "PA-RISC 1.1 Architecture and Instruction Set Reference Manual"
+ * https://parisc.wiki.kernel.org/index.php/File:Pa11_acd.pdf
+ *
+ * For implementation see handle_interruption() in traps.c
+ */
+static const char * const trap_description[] = {
+	[1] "High-priority machine check (HPMC)",
+	[2] "Power failure interrupt",
+	[3] "Recovery counter trap",
+	[5] "Low-priority machine check",
+	[6] "Instruction TLB miss fault",
+	[7] "Instruction access rights / protection trap",
+	[8] "Illegal instruction trap",
+	[9] "Break instruction trap",
+	[10] "Privileged operation trap",
+	[11] "Privileged register trap",
+	[12] "Overflow trap",
+	[13] "Conditional trap",
+	[14] "FP Assist Exception trap",
+	[15] "Data TLB miss fault",
+	[16] "Non-access ITLB miss fault",
+	[17] "Non-access DTLB miss fault",
+	[18] "Data memory protection/unaligned access trap",
+	[19] "Data memory break trap",
+	[20] "TLB dirty bit trap",
+	[21] "Page reference trap",
+	[22] "Assist emulation trap",
+	[25] "Taken branch trap",
+	[26] "Data memory access rights trap",
+	[27] "Data memory protection ID trap",
+	[28] "Unaligned data reference trap",
+};
+
+/*
  * Print out info about fatal segfaults, if the show_unhandled_signals
  * sysctl is set:
  */
@@ -176,6 +213,8 @@ show_signal_msg(struct pt_regs *regs, unsigned long code,
 		unsigned long address, struct task_struct *tsk,
 		struct vm_area_struct *vma)
 {
+	const char *trap_name = NULL;
+
 	if (!unhandled_signal(tsk, SIGSEGV))
 		return;
 
@@ -186,6 +225,12 @@ show_signal_msg(struct pt_regs *regs, unsigned long code,
 	pr_warn("do_page_fault() command='%s' type=%lu address=0x%08lx",
 	    tsk->comm, code, address);
 	print_vma_addr(KERN_CONT " in ", regs->iaoq[0]);
+
+	if (code < ARRAY_SIZE(trap_description))
+		trap_name = trap_description[code];
+	if (trap_name)
+		pr_warn(" %s%c", trap_name, vma ? ',':'\n');
+
 	if (vma)
 		pr_warn(" vm_start = 0x%08lx, vm_end = 0x%08lx\n",
 				vma->vm_start, vma->vm_end);
