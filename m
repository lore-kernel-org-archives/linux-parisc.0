From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] PARISC: Replace deprecated SPIN_LOCK_UNLOCKED macro in
 semaphore.h.
Date: Sat, 15 Mar 2008 09:41:28 -0400 (EDT)
Message-ID: <alpine.LFD.1.00.0803150939590.22947@localhost.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  whoops, ignore that earlier patch.  the actual standard is to
incorporate the structure member in the lock name, thusly:

diff --git a/include/asm-parisc/semaphore.h b/include/asm-parisc/semaphore.h
index a16271c..e4eba1e 100644
--- a/include/asm-parisc/semaphore.h
+++ b/include/asm-parisc/semaphore.h
@@ -44,7 +44,7 @@ struct semaphore {

 #define __SEMAPHORE_INITIALIZER(name, n)				\
 {									\
-	.sentry		= SPIN_LOCK_UNLOCKED,				\
+	.sentry		= __SPIN_LOCK_UNLOCKED((name).sentry),		\
 	.count		= n,						\
 	.wait		= __WAIT_QUEUE_HEAD_INITIALIZER((name).wait)	\
 }
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
