Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61B134A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 03:51:48 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id DD7D6B007; Fri, 16 Mar 2001 10:50:56 +0000 (GMT)
Date: Fri, 16 Mar 2001 10:50:56 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010316105056.U31505@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] tracing through sig handlers
List-ID: <linux-parisc.vger.kernel.org>

Hi Alan,

If I do this:


Index: arch/parisc/kernel/signal.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/signal.c,v
retrieving revision 1.37
diff -u -r1.37 signal.c
--- signal.c	2001/02/09 14:39:08	1.37
+++ signal.c	2001/03/16 10:29:48
@@ -260,6 +260,8 @@
 		/* regs->iaoq is undefined in the syscall return path */
 		err |= __put_user(regs->gr[31], &sc->sc_iaoq[0]);
 		err |= __put_user(regs->gr[31]+4, &sc->sc_iaoq[1]);
+		err |= __put_user(regs->sr[3], &sc->sc_iasq[0]);
+		err |= __put_user(regs->sr[3], &sc->sc_iasq[1]);
 #if DEBUG_SIG
 		printk("setup_sigcontext: iaoq %#lx/%#lx\n", regs->gr[31], regs->gr[31]);
 #endif


Then I can strace my little test prog. that sends itself a signal
while the signal is blocked, and then unblocks the signal.

I havn't worked out why this is only apparently necessary when a process
is being traced.

It makes things better with gdb also, but not perfect.  The problem
now is that when you try to step out of the signal handler the program
under test just runs on without stopping.  Previously it would have
crashed with an invalid iasq[].

Richard
