Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gaz.sfgoth.com (unknown [63.205.85.133])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D13A483E
	for <parisc-linux@parisc-linux.org>; Mon, 22 Sep 2003 00:02:00 -0600 (MDT)
Received: from gaz.sfgoth.com (localhost.sfgoth.com [127.0.0.1])
	by gaz.sfgoth.com (8.12.9/8.12.6) with ESMTP id h8M6BPOv078337
	for <parisc-linux@parisc-linux.org>; Sun, 21 Sep 2003 23:11:25 -0700 (PDT)
	(envelope-from mitch@gaz.sfgoth.com)
Received: (from mitch@localhost)
	by gaz.sfgoth.com (8.12.9/8.12.6/Submit) id h8M6BPdr078336
	for parisc-linux@parisc-linux.org; Sun, 21 Sep 2003 23:11:25 -0700 (PDT)
	(envelope-from mitch)
Date: Sun, 21 Sep 2003 23:11:25 -0700
From: Mitchell Blank Jr <mitch@sfgoth.com>
To: parisc-linux@parisc-linux.org
Message-ID: <20030922061125.GL50734@gaz.sfgoth.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [2.6 PATCH][PARISC] atomic_read()
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

A patch was recently accepted into the main 2.6 tree that makes skb_cloned()
and skb_shared() take a "const" pointer.  These functions call atomic_read()
so it needs to take a const pointer too.  After some discussion on netdev
davem said that this should be safe (even in the pessimal case of a
spinlock-implemented atomic_t we should be able to read its value outside
the lock safely)

PA-RISC uses an inline fucntion for atomic_read() but it doesn't mark its
argument as const, so without this patch you'll start seeing lots of new
compile warnings.

Please apply.  The patch is versus a week ago but the file hasn't changed so
it should apply fine.  It isn't compile tested but it shouldn't cause any
problems.

-Mitch

--- linux-2.6.0-test5-bk3-mnb2/include/asm-parisc/atomic.h	2003-09-12 15:46:35.000000000 -0700
+++ linux-2.6.0-test5-bk3-mnb3/include/asm-parisc/atomic.h	2003-09-21 16:07:11.782837264 -0700
@@ -154,7 +154,7 @@
 	SPIN_UNLOCK_IRQRESTORE(ATOMIC_HASH(v), flags);
 }
 
-static __inline__ int __atomic_read(atomic_t *v)
+static __inline__ int __atomic_read(const atomic_t *v)
 {
 	return v->counter;
 }
