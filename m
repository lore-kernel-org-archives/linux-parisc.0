Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 80863482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 23:58:37 -0600 (MDT)
Date: Mon, 11 Aug 2003 23:02:44 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030812060244.GE21328@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] how to handle ERESTART_RESTARTBLOCK ?
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

I commited some broken code into 2.6 cvs just now, so now i need some
help to fix it ;-) sorry for the verbose explanation below, but i need
to write this down to make sure i understand it myself :-)

Our signal handling code was not handling ERESTART_RESTARTBLOCK
correctly. as far as I can tell, the semantics of this is that if a
syscall function returns with that error code, we are supposed to
restart the syscall, but with a new syscall number
(__NR_restart_syscall -- which we don't define at the moment)

The problem is that our syscall mechanism doesn't really allow this
(afaict). Our syscall sequence looks like this:

    ble <address of gateway page>
    ldi <syscall number>, %r20
    [ we enter the kernel at this point ]

and the way we handle restarting other syscalls is to set the iaoq back
by two insns, so we do the ble again. there's a comment about this in
the code (signal.c)

                        /* Hooray for delayed branching.  We don't
                           have to restore %r20 (the system call
                           number) because it gets loaded in the delay
                           slot of the branch external instruction. */
                        regs->gr[31] -= 8;

which is all well and good, except i don't see how we can change the
syscall number to restart it for the ERESTART_RESTARTBLOCK case.

why is it bad to just call sys_restart_syscall directly from
do_signal()?

any suggestions on how to handle this properly?

thanks
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
