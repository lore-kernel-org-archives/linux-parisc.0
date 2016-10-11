From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Show trap name in kernel crash
Date: Tue, 11 Oct 2016 20:49:42 +0200
Message-ID: <20161011184942.GA4645@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Show the real trap name when the kernel crashes.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/traps.h b/arch/parisc/include/asm/traps.h
index 5e953ab..6367023 100644
--- a/arch/parisc/include/asm/traps.h
+++ b/arch/parisc/include/asm/traps.h
@@ -11,6 +11,7 @@ void parisc_terminate(char *msg, struct pt_regs *regs,
 void die_if_kernel(char *str, struct pt_regs *regs, long err);
 
 /* mm/fault.c */
+const char *trap_name(unsigned long code);
 void do_page_fault(struct pt_regs *regs, unsigned long code,
 		unsigned long address);
 #endif
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 97d6b20..378df92 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -458,8 +458,8 @@ void parisc_terminate(char *msg, struct pt_regs *regs, int code, unsigned long o
 	}
 
 	printk("\n");
-	printk(KERN_CRIT "%s: Code=%d regs=%p (Addr=" RFMT ")\n",
-			msg, code, regs, offset);
+	pr_crit("%s: Code=%d (%s) regs=%p (Addr=" RFMT ")\n",
+		msg, code, trap_name(code), regs, offset);
 	show_regs(regs);
 
 	spin_unlock(&terminate_lock);
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index d64f1c8..8ff9253 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -204,6 +204,16 @@ static const char * const trap_description[] = {
 	[28] "Unaligned data reference trap",
 };
 
+const char *trap_name(unsigned long code)
+{
+	const char *t = NULL;
+
+	if (code < ARRAY_SIZE(trap_description))
+		t = trap_description[code];
+
+	return t ? t : "Unknown trap";
+}
+
 /*
  * Print out info about fatal segfaults, if the show_unhandled_signals
  * sysctl is set:
@@ -213,8 +223,6 @@ show_signal_msg(struct pt_regs *regs, unsigned long code,
 		unsigned long address, struct task_struct *tsk,
 		struct vm_area_struct *vma)
 {
-	const char *trap_name = NULL;
