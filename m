Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BAD14840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 01:33:21 -0600 (MDT)
Date: Sun, 26 Oct 2003 00:37:51 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031026073751.GH24406@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030812060244.GE21328@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030812060244.GE21328@tausq.org>
Subject: [parisc-linux] Re: how to handle ERESTART_RESTARTBLOCK ?
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Our signal handling code was not handling ERESTART_RESTARTBLOCK
> correctly. as far as I can tell, the semantics of this is that if a
> syscall function returns with that error code, we are supposed to
> restart the syscall, but with a new syscall number
> (__NR_restart_syscall -- which we don't define at the moment)

ok, answering another one of my own emails :-)

here's a patch that implements the required logic. probably can be
improved some.... comments appreciated.

About __NR_restart_syscall, some archs use syscall #0 (unused for pa
afaict), others define a new syscall number. Any preferences? If it's
zero then i think i will remove the reassemble_14 logic.

thx
randolph

Index: arch/parisc/kernel/signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/signal.c,v
retrieving revision 1.11
diff -u -p -r1.11 signal.c
--- arch/parisc/kernel/signal.c	24 Sep 2003 17:54:31 -0000	1.11
+++ arch/parisc/kernel/signal.c	26 Oct 2003 07:17:08 -0000
@@ -451,6 +451,12 @@ handle_signal(unsigned long sig, siginfo
 	return 1;
 }
 
+static inline int reassemble_14(int as14)
+{
+	return (((as14 & 0x1fff) << 1) |
+		((as14 & 0x2000) >> 13));
+}
+
 /*
  * Note that 'init' is a special process: it doesn't get signals it doesn't
  * want to handle. Thus you cannot kill init even with a SIGKILL even by
@@ -530,10 +537,48 @@ do_signal(sigset_t *oldset, struct pt_re
 	/* Did we come from a system call? */
 	if (in_syscall) {
 		/* Restart the system call - no handlers present */
-		if (regs->gr[28] == -ERESTART_RESTARTBLOCK ||
-		    regs->gr[28] == -ERESTARTNOHAND ||
-		    regs->gr[28] == -ERESTARTSYS ||
-		    regs->gr[28] == -ERESTARTNOINTR) {
+		if (regs->gr[28] == -ERESTART_RESTARTBLOCK) {
+			unsigned int *usp = (unsigned int *)regs->gr[30];
+
+			/* Setup a trampoline to restart the syscall
+			 * with __NR_restart_syscall
+			 *
+			 *  0: ble 0x100(%%sr2, %%r0)
+			 *  4: ldi __NR_restart_syscall, %r20
+			 *  8: b,l .+8, %r21
+			 * 12: depi 0,31,2,%r21
+			 * 16: ldw 16(%r21), %rp
+			 * 20: bv %r0(%rp)
+			 * 24: ldo -64(%sp), %sp
+			 * 28: nop
+			 * 32: <return address> (2 slots for 64-bit)
+			 */
+			put_user(0xe4008200, &usp[0]);
+			put_user(0x34140000 | reassemble_14(__NR_restart_syscall), &usp[1]);
+			put_user(0xeaa00000, &usp[2]);
+  			put_user(0xd6a01c1e, &usp[3]);
+#ifndef __LP64__
+			put_user(0x4ab40020, &usp[4]);
+#else
+			put_user(0x52b40020, &usp[4]);
+#endif
+			put_user(0xea80c000, &usp[5]);
+			put_user(0x37de3f81, &usp[6]);
+			put_user(0x08000240, &usp[7]);
+			put_user(regs->gr[31] & ~3, &usp[8]); 
+
+			flush_user_dcache_range((unsigned long)usp,
+				                (unsigned long)(usp + 10));
+			flush_user_icache_range((unsigned long)usp,
+				                (unsigned long)(usp + 10));
+
+			regs->gr[31] = regs->gr[30];
+			regs->gr[30] += 64;
+			/* Preserve original r28. */
+			regs->gr[28] = regs->orig_r28;
+		} else if (regs->gr[28] == -ERESTARTNOHAND ||
+		           regs->gr[28] == -ERESTARTSYS ||
+		           regs->gr[28] == -ERESTARTNOINTR) {
 			/* Hooray for delayed branching.  We don't
                            have to restore %r20 (the system call
                            number) because it gets loaded in the delay


-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
