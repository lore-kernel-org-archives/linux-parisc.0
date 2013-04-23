From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: increase kernel stack size to 32k
Date: Tue, 23 Apr 2013 22:22:03 +0200
Message-ID: <20130423202203.GA7287@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit e4e1e78facf7565cada909a69c7fb6415b6e7b83
Author: Helge Deller <deller@gmx.de>
Date:   Tue Apr 23 17:19:37 2013 +0200

parisc: increase kernel stack size to 32k

This commit temporarily increases the kernel stack size to 32k to avoid
stack overflows which led to strange and hard-to-debug kernel crashes
all over various kernel components.

The upcoming real fix will implement an own irq stack which should avoid
those crashes without the need for 32k stacks.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index d1fb79a..55335c1 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -40,7 +40,7 @@ struct thread_info {
 
 /* thread information allocation */
 
-#define THREAD_SIZE_ORDER            2
+#define THREAD_SIZE_ORDER            3	/* 32k stack */
 /* Be sure to hunt all references to this down when you change the size of
  * the kernel stack */
 #define THREAD_SIZE             (PAGE_SIZE << THREAD_SIZE_ORDER)
