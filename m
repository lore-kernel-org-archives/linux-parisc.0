Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id D10C7484E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 22:03:32 -0700 (MST)
Date: Sun, 26 Oct 2003 21:06:49 -0800
From: Randolph Chung <randolph@tausq.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: how to handle ERESTART_RESTARTBLOCK ?
Message-ID: <20031027050649.GS24406@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20031026191804.GM24406@tausq.org> <200310261953.h9QJrgex028823@hiauly1.hia.nrc.ca> <20031026205931.GN24406@tausq.org> <20031026210201.GO24406@tausq.org> <20031027043705.GJ26587@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031027043705.GJ26587@systemhalted>
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

> What do you think of:

here's a third try using Carlos' idea... seems cleaner (smaller) and
doesn't muck with the stack pointer.

thanks carlos! :-)
randolph

Index: arch/parisc/kernel/signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/signal.c,v
retrieving revision 1.11
diff -u -p -r1.11 signal.c
--- arch/parisc/kernel/signal.c	24 Sep 2003 17:54:31 -0000	1.11
+++ arch/parisc/kernel/signal.c	27 Oct 2003 05:01:52 -0000
@@ -530,10 +531,42 @@ do_signal(sigset_t *oldset, struct pt_re
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
+			 *  0: <return address (orig r31)>
+			 *  8: <2nd half for 64-bit>
+			 * 12: ldw 0(%sp), %r31
+			 * 16: be 0x100(%sr2, %r0)
+			 * 20: ldi __NR_restart_syscall, %r20
+			 */
+#ifndef __LP64__
+			put_user(regs->gr[31], &usp[0]);
+			put_user(0x0fc0109f, &usp[2]);
+#else
+			put_user(regs->gr[31] >> 32, &usp[0]);
+			put_user(regs->gr[31] & 0xffffffff, &usp[1]);
+			put_user(0x0fc010df, &usp[2]);
+#endif
+			put_user(0xe0008200, &usp[3]);
+			put_user(0x34140000, &usp[4]);
+
+			/* Stack is 64-byte aligned, and we only 
+			 * need to flush 1 cache line */
+			asm("fdc 0(%%sr3, %0)\n"
+			    "fic 0(%%sr3, %0)\n"
+			    "sync\n"
+			    : : "r"(regs->gr[30]));
+
+			regs->gr[31] = regs->gr[30] + 8;
+			/* Preserve original r28. */
+			regs->gr[28] = regs->orig_r28;
+		} else if (regs->gr[28] == -ERESTARTNOHAND ||
+		           regs->gr[28] == -ERESTARTSYS ||
+		           regs->gr[28] == -ERESTARTNOINTR) {
 			/* Hooray for delayed branching.  We don't
                            have to restore %r20 (the system call
                            number) because it gets loaded in the delay
