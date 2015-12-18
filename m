From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix syscall restarts
Date: Sat, 19 Dec 2015 00:30:34 +0100
Message-ID: <20151218233034.GA24910@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On parisc syscalls which are interrupted by signals sometimes fail to restart
and instead return -ENOSYS which then in the worst case lead to userspace
crashes.
A similiar problem existed on MIPS and was fixed by commit e967ef02 
("MIPS: Fix restart of indirect syscalls").

On parisc the current syscall restart code assumes hat the syscall number is
always loaded in the delay branch of the ble instruction as defined in the
unistd.h header file and as such never restored %r20 before returning to
userspace:
	ble 0x100(%sr2, %r0)
	ldi #syscall_nr, %r20

This assumption is at least not true for code which uses the syscall() glibc
function, which instead uses this syntax:
	ble 0x100(%sr2, %r0)
	copy regX, %r20
where regX depend on how the compiler optimizes the code and register usage.

This patch fixes this problem by adding code to analyze how the syscall number
is loaded in the delay branch and - if needed - copy the syscall number to regX
prior returning to userspace for the syscall restart.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index dc1ea79..b0414ad 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -435,6 +435,48 @@ handle_signal(struct ksignal *ksig, struct pt_regs *regs, int in_syscall)
 		regs->gr[28]);
 }
 
+/*
+ * Check the delay branch in userspace how the syscall number gets loaded into
+ * %r20 and adjust as needed.
+ */
+
+static void check_syscallno_in_delay_branch(struct pt_regs *regs)
+{
+	unsigned int opcode, source_reg;
+	u32 __user *uaddr;
+
+	/* Usually we don't have to restore %r20 (the system call number)
+	 * because it gets loaded in the delay slot of the branch external
+	 * instruction via the ldi instruction.
+	 * In some cases a register-to-register copy instruction might have
+	 * been used instead, in which case we need to copy the syscall
+	 * number into the source register before returning to userspace.
+	 */
+
+	/* A syscall is just a branch, so all
+	 * we have to do is fiddle the return pointer.
+	 */
+	regs->gr[31] -= 8; /* delayed branching */
+
+	/* Get assembler opcode of code in delay branch */
+	uaddr = (unsigned int *) (regs->gr[31] + 1);
+	get_user(opcode, uaddr);
+
+	/* Check if delay branch uses "ldi int,%r20" */
+	if ((opcode & 0xffff0000) == 0x34140000)
+		return;	/* everything ok, just return */
+
+	/* Check if delay branch uses "copy %rX,%r20" */
+	if ((opcode & 0xff00ffff) == 0x08000254) {
+		source_reg = (opcode >> 16) & 31;
+		regs->gr[source_reg] = regs->gr[20];
+		return;
+	}
+
+	pr_warn("syscall restart: %s (pid %d): unexpected opcode 0x%08x\n",
+		current->comm, task_pid_nr(current), opcode);
+}
+
 static inline void
 syscall_restart(struct pt_regs *regs, struct k_sigaction *ka)
 {
@@ -457,10 +499,7 @@ syscall_restart(struct pt_regs *regs, struct k_sigaction *ka)
 		}
 		/* fallthrough */
 	case -ERESTARTNOINTR:
-		/* A syscall is just a branch, so all
-		 * we have to do is fiddle the return pointer.
-		 */
-		regs->gr[31] -= 8; /* delayed branching */
+		check_syscallno_in_delay_branch(regs);
 		break;
 	}
 }
@@ -510,15 +549,9 @@ insert_restart_trampoline(struct pt_regs *regs)
 	}
 	case -ERESTARTNOHAND:
 	case -ERESTARTSYS:
-	case -ERESTARTNOINTR: {
-		/* Hooray for delayed branching.  We don't
-		 * have to restore %r20 (the system call
-		 * number) because it gets loaded in the delay
-		 * slot of the branch external instruction.
-		 */
-		regs->gr[31] -= 8;
+	case -ERESTARTNOINTR:
+		check_syscallno_in_delay_branch(regs);
 		return;
-	}
 	default:
 		break;
 	}
