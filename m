From: Helge Deller <deller@gmx.de>
Subject: [PATCH] drop superfluous .align 16
Date: Tue, 8 Jul 2008 22:06:35 +0200
Message-ID: <200807082206.36288.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: "Carlos O'Donell" <carlos@systemhalted.org>,
	Randolph Chung <tausq@parisc-linux.org>
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This .align 16 is misplaced and should be in front of the ENTRY(lws_lock_start).
Works because of pure luck since we have a .align PAGE_SIZE before it instead.

Signed-off-by: Helge Deller <deller@gmx.de>

--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -640,7 +640,6 @@ END(sys_call_table64)
 	.align	PAGE_SIZE
 ENTRY(lws_lock_start)
 	/* lws locks */
-	.align 16
 	.rept 16
 	/* Keep locks aligned at 16-bytes */
 	.word 1
