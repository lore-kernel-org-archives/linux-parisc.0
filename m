Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2486F4840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 13:57:07 -0700 (MST)
Date: Sun, 26 Oct 2003 13:02:01 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: how to handle ERESTART_RESTARTBLOCK ?
Message-ID: <20031026210201.GO24406@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20031026191804.GM24406@tausq.org> <200310261953.h9QJrgex028823@hiauly1.hia.nrc.ca> <20031026205931.GN24406@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031026205931.GN24406@tausq.org>
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

In reference to a message from Randolph Chung, dated Oct 26:
> > You probably have to be careful here with respect to signals, etc.
> > Technically, the frame marker is supposed to move when a dynamic
> > stack allocation is done.
> 
> ok, how about if i do it like this?

hrm, oops, that's the magical disappearance act... :)

Index: arch/parisc/kernel/signal.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/signal.c,v
retrieving revision 1.11
diff -u -p -r1.11 signal.c
--- arch/parisc/kernel/signal.c	24 Sep 2003 17:54:31 -0000	1.11
+++ arch/parisc/kernel/signal.c	26 Oct 2003 20:53:14 -0000
@@ -530,10 +531,68 @@ do_signal(sigset_t *oldset, struct pt_re
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
+			 */
+#ifndef __LP64__
+			/* 32-bit version:
+			 *  0: <frame marker>
+			 *  4: <return address>
+			 *  8: ble 0x100(%%sr2, %%r0)
+			 * 12: ldi __NR_restart_syscall, %r20
+			 * 16: ldw -60(%sp), %r20
+			 * 20: bv %r0(%r20)
+			 * 24: ldwm -64(%sp), %r3
+			 */
+			put_user(regs->gr[3], &usp[0]); 
+			put_user(regs->gr[31], &usp[1]); 
+			put_user(0xe4008200, &usp[2]);
+			put_user(0x34140000, &usp[3]);
+			put_user(0x4bd43f89, &usp[4]);
+			put_user(0xea80c000, &usp[5]);
+			put_user(0x4fc33f81, &usp[6]);
+
+			regs->gr[31] = regs->gr[30] + 8;
+#else
+			/* 64-bit version:
+			 *  0: <frame marker>
+			 *  8: <return address>
+			 * 16: ble 0x100(%%sr2, %%r0)
+			 * 20: ldi __NR_restart_syscall, %r20
+			 * 24: ldd -56(%sp), %r20
+			 * 28: bv %r0(%r20)
+			 * 32: ldd,mb -64(%sp), %r3
+			 */
+			put_user(regs->gr[3] >> 32, &usp[0]); 
+			put_user(regs->gr[3] & 0xffffffff, &usp[1]); 
+			put_user(regs->gr[31] >> 32, &usp[2]); 
+			put_user(regs->gr[31] & 0xffffffff, &usp[3]); 
+			put_user(0xe4008200, &usp[4]);
+			put_user(0x34140000, &usp[5]);
+			put_user(0x53d43f91, &usp[6]);
+			put_user(0xea80c000, &usp[7]);
+			put_user(0x53c33f8d, &usp[8]);
+
+			regs->gr[31] = regs->gr[30] + 16;
+#endif
+			
+			/* Stack is 64-byte aligned, and we only 
+			 * need to flush 1 cache line */
+			asm("fdc 0(%%sr3, %0)\n"
+			    "fic 0(%%sr3, %0)\n"
+			    "sync\n"
+			    : : "r"(regs->gr[30]));
+
+			regs->gr[3] = regs->gr[30];
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
