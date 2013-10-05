From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: optimize variable initialization in do_page_fault
Date: Sat, 5 Oct 2013 10:55:36 -0400
Message-ID: <BLU0-SMTP634D29D9FAECEFE0FCFE9A97110@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-14--1049188799"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-14--1049188799
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

The attached change defers the initialization of the variables tsk, mm  
and flags until they
are needed.  As a result,  the code won't crash if a kernel probe is  
done with a corrupt context
and the code will be better optimized.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---


--Apple-Mail-14--1049188799
Content-Disposition: attachment; filename="fault.c.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="fault.c.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 00c0ed3..0293588 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -171,20 +171,25 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 			      unsigned long address)
 {
 	struct vm_area_struct *vma, *prev_vma;
-	struct task_struct *tsk = current;
-	struct mm_struct *mm = tsk->mm;
+	struct task_struct *tsk;
+	struct mm_struct *mm;
 	unsigned long acc_type;
 	int fault;
-	unsigned int flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
+	unsigned int flags;
 
-	if (in_atomic() || !mm)
+	if (in_atomic())
 		goto no_context;
 
+	tsk = current;
+	mm = tsk->mm;
+	if (!mm)
+		goto no_context;
+
+	flags = FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
 
 	acc_type = parisc_acctyp(code, regs->iir);
--Apple-Mail-14--1049188799--
