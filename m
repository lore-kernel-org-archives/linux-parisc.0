From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: correctly wire up mq_* functions for CONFIG_COMPAT
 case
Date: Mon, 11 Feb 2013 21:50:49 +0100
Message-ID: <20130211205049.GA20397@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix mq_open, mq_timedsend, mq_timedreceive, mq_notify and mq_getsetattr
syscalls when running 32bit applications on 64bit kernel.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
index cf7094c..e5fcd4c 100644
--- a/arch/parisc/kernel/syscall_table.S
+++ b/arch/parisc/kernel/syscall_table.S
@@ -327,12 +327,12 @@
 	ENTRY_SAME(epoll_wait)
  	ENTRY_SAME(remap_file_pages)
 	ENTRY_SAME(semtimedop)
-	ENTRY_SAME(mq_open)
+	ENTRY_COMP(mq_open)
 	ENTRY_SAME(mq_unlink)		/* 230 */
-	ENTRY_SAME(mq_timedsend)
-	ENTRY_SAME(mq_timedreceive)
-	ENTRY_SAME(mq_notify)
-	ENTRY_SAME(mq_getsetattr)
+	ENTRY_COMP(mq_timedsend)
+	ENTRY_COMP(mq_timedreceive)
+	ENTRY_COMP(mq_notify)
+	ENTRY_COMP(mq_getsetattr)
 	ENTRY_COMP(waitid)		/* 235 */
 	ENTRY_OURS(fadvise64_64)
 	ENTRY_SAME(set_tid_address)
