Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA15166
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Feb 2000 07:01:23 -0700
Received: from udlkern.fc.hp.com (jsm@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id GAA19339
	for <parisc-linux@thepuffingroup.com>; Tue, 1 Feb 2000 06:02:20 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.1) id GAA21104 for parisc-linux@thepuffingroup.com; Tue, 1 Feb 2000 06:02:19 -0700 (MST)
Date: Tue, 1 Feb 2000 06:02:19 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200002011302.GAA21104@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] init_task.c dependency problem
List-ID: <linux-parisc.vger.kernel.org>


With my most recent commit's, I made a change in a header file that
arch/parisc/kernel/init_task.c depends on. However, due to the makefile
games used to build this file (to properly align the task structure),
the dependencies for init_task.c are not honored (the .depend file
lists dependencies for init_task.o, but we build init_task0.o and
init_task1.o instead).

What this means is that init_task.c will not be rebuilt if you
just cvs update your build area. In that case, the kernel will
halt immediately after the "execve /sbin/init ...." message (i.e.
it will print halted and then print a register dump). If you
are building from a new area, or you make clean, you will not
have this problem. A simple workaround (if you don't want to do
a make clean) is to "touch arch/parisc/kernel/init_task.c" so that
it will be rebuilt. You could also just remove init_task0.o and
init_task1.o to force the rebuild.

Yesterday's commits allowed fork() from userland to work. Today's
commits allow exec() from userland to work.

John Marvin
jsm@fc.hp.com
