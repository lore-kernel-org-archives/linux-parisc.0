Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.bitmover.com (bitmover.com [192.132.92.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F54F4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Dec 2002 14:56:38 -0700 (MST)
Date: Mon, 2 Dec 2002 13:54:25 -0800
From: Larry McVoy <lm@bitmover.com>
Message-Id: <200212022154.gB2LsPc31908@work.bitmover.com>
To: parisc-linux@lists.parisc-linux.org, phi@hpfrcu81.france.hp.com
Cc: dev@bitmover.com
Subject: [parisc-linux] rlogin: connection closed (SOLUTION)
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

This fixes it.  Looks like a race, I wasn't inclined to dig further, this
got me past the problem.  I suspect that parisc fork() runs parent/child
in the opposite order from every other Unix and that causes a race but
I have not looked.

--lm

diff -Nur netkit-rsh-0.17/rlogind/rlogind.c NEW/netkit-rsh-0.17/rlogind/rlogind.c
--- netkit-rsh-0.17/rlogind/rlogind.c   Mon Dec  2 13:52:37 2002
+++ NEW/netkit-rsh-0.17/rlogind/rlogind.c       Mon Dec  2 13:48:48 2002
@@ -429,6 +429,7 @@
        if (netfd > 2) close(netfd);
        child(hname, termtype, lusername, authenticated);
     }
+    usleep(100000);
     close(slave);
     on = 1;
     ioctl(netfd, FIONBIO, &on);
