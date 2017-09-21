From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add HWPOISON page fault handler code
Date: Thu, 21 Sep 2017 21:52:08 +0200
Message-ID: <20170921195208.GA15588@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 24587380f61d ("parisc: Add MADV_HWPOISON and MADV_SOFT_OFFLINE") added
the necessary constants to handle hardware-poisoning. Those were needed to
support the page deallocation feature from firmware.

But I completely missed to add the relevant fault handler code. This now
showed up when I ran the madvise07 testcase from the Linux Test Project,
which failed with a kernel BUG at arch/parisc/mm/fault.c:320.

With this patch the parisc kernel now behaves like other platforms and
gives the same kernel syslog warnings when poisoning pages.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 5b101f6..0d55e23 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/extable.h>
 #include <linux/uaccess.h>
+#include <linux/hugetlb.h>
 
 #include <asm/traps.h>
 
@@ -315,7 +316,8 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 			goto out_of_memory;
 		else if (fault & VM_FAULT_SIGSEGV)
 			goto bad_area;
-		else if (fault & VM_FAULT_SIGBUS)
+		else if (fault & (VM_FAULT_SIGBUS|VM_FAULT_HWPOISON|
+				  VM_FAULT_HWPOISON_LARGE))
 			goto bad_area;
 		BUG();
 	}
@@ -352,8 +354,7 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 
 	if (user_mode(regs)) {
 		struct siginfo si;
-
-		show_signal_msg(regs, code, address, tsk, vma);
+		unsigned int lsb = 0;
 
 		switch (code) {
 		case 15:	/* Data TLB miss fault/Data page fault */
@@ -386,6 +387,30 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 			si.si_code = (code == 26) ? SEGV_ACCERR : SEGV_MAPERR;
 			break;
 		}
+
+#ifdef CONFIG_MEMORY_FAILURE
+		if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
+			printk(KERN_ERR
+	"MCE: Killing %s:%d due to hardware memory corruption fault at %08lx\n",
+			tsk->comm, tsk->pid, address);
+			si.si_signo = SIGBUS;
+			si.si_code = BUS_MCEERR_AR;
+		}
+#endif
+
+		/*
+		 * Either small page or large page may be poisoned.
+		 * In other words, VM_FAULT_HWPOISON_LARGE and
+		 * VM_FAULT_HWPOISON are mutually exclusive.
+		 */
+		if (fault & VM_FAULT_HWPOISON_LARGE)
+			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
+		else if (fault & VM_FAULT_HWPOISON)
+			lsb = PAGE_SHIFT;
+		else
+			show_signal_msg(regs, code, address, tsk, vma);
+		si.si_addr_lsb = lsb;
+
 		si.si_errno = 0;
 		si.si_addr = (void __user *) address;
 		force_sig_info(si.si_signo, &si, current);
