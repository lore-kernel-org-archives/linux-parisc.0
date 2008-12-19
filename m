From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
	compiling ruby1.9
Date: Fri, 19 Dec 2008 16:29:06 -0500
Message-ID: <20081219212906.GG8945@bombadil.infradead.org>
References: <4949812D.7080608@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4949812D.7080608@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 17, 2008 at 11:46:05PM +0100, Helge Deller wrote:
>

Honestly, I can't decide whether to apply this. It really should never
happen in the kernel, since the kernel can guarantee it won't get the
access rights failure (highest privilege level, and can set %sr and
%protid to whatever it wants.)

It really genuinely is a bug that probably should panic the kernel. The
only precedent I can easily see is x86 fixing up a bad iret with a
general protection fault, which is more or less analogous to code 27
here.

On the other hand, taking the exception on a userspace access really
isn't all that critical, and there's fundamentally little reason for the
kernel not to SIGSEGV the process, and continue...

Argh.

(btw, I've instrumented my do_sys_poll with a pile of assertions that
 %cr8 << 1 == %sr3 == current->mm.context... let's see if where we're
 getting corrupted is deterministic, though, I would guess that it won't
 be.)

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 4878b95..1c6dbb6 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -241,4 +241,6 @@ unsigned long copy_in_user(void __user *dst, const void __user *src, unsigned lo
 #define __copy_to_user_inatomic __copy_to_user
 #define __copy_from_user_inatomic __copy_from_user
 
+int fixup_exception(struct pt_regs *regs);
+
 #endif /* __PARISC_UACCESS_H */
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 4c771cd..548ba0c 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -745,6 +745,10 @@ void handle_interruption(int code, struct pt_regs *regs)
 		/* Fall Through */
 	case 27: 
 		/* Data memory protection ID trap */
+		if (code == 27 && !user_mode(regs) &&
+			fixup_exception(regs))
+			return;
+
 		die_if_kernel("Protection id trap", regs, code);
 		si.si_code = SEGV_MAPERR;
 		si.si_signo = SIGSEGV;
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index b2e3e9a..92c7fa4 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -139,13 +139,41 @@ parisc_acctyp(unsigned long code, unsigned int inst)
 			}
 #endif
 
+int fixup_exception(struct pt_regs *regs)
+{
+	const struct exception_table_entry *fix;
+
+	fix = search_exception_tables(regs->iaoq[0]);
+	if (fix) {
+		struct exception_data *d;
+		d = &__get_cpu_var(exception_data);
+		d->fault_ip = regs->iaoq[0];
+		d->fault_space = regs->isr;
+		d->fault_addr = regs->ior;
+
+		regs->iaoq[0] = ((fix->fixup) & ~3);
+		/*
+		 * NOTE: In some cases the faulting instruction
+		 * may be in the delay slot of a branch. We
+		 * don't want to take the branch, so we don't
+		 * increment iaoq[1], instead we set it to be
+		 * iaoq[0]+4, and clear the B bit in the PSW
+		 */
+		regs->iaoq[1] = regs->iaoq[0] + 4;
+		regs->gr[0] &= ~PSW_B; /* IPSW in gr[0] */
+
+		return 1;
+	}
+
+	return 0;
+}
+
 void do_page_fault(struct pt_regs *regs, unsigned long code,
 			      unsigned long address)
 {
 	struct vm_area_struct *vma, *prev_vma;
 	struct task_struct *tsk = current;
 	struct mm_struct *mm = tsk->mm;
-	const struct exception_table_entry *fix;
 	unsigned long acc_type;
 	int fault;
 
@@ -229,32 +257,8 @@ bad_area:
 
 no_context:
 
-	if (!user_mode(regs)) {
-		fix = search_exception_tables(regs->iaoq[0]);
-
-		if (fix) {
-			struct exception_data *d;
-
-			d = &__get_cpu_var(exception_data);
-			d->fault_ip = regs->iaoq[0];
-			d->fault_space = regs->isr;
-			d->fault_addr = regs->ior;
-
-			regs->iaoq[0] = ((fix->fixup) & ~3);
-
-			/*
-			 * NOTE: In some cases the faulting instruction
-			 * may be in the delay slot of a branch. We
-			 * don't want to take the branch, so we don't
-			 * increment iaoq[1], instead we set it to be
-			 * iaoq[0]+4, and clear the B bit in the PSW
-			 */
-
-			regs->iaoq[1] = regs->iaoq[0] + 4;
-			regs->gr[0] &= ~PSW_B; /* IPSW in gr[0] */
