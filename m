From: Helge Deller <deller@gmx.de>
Subject: [PATCH] drop superfluous .align 16
Date: Sun, 24 Aug 2008 20:51:11 +0200
Message-ID: <200808242051.12202.deller@gmx.de>
References: <200808242026.06295.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Kyle McMartin <kyle@mcmartin.ca>
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200808242026.06295.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This .align 16 is misplaced and should be in front of the ENTRY(lws_lock_start).
Works because of pure luck since we have a .align PAGE_SIZE before it instead.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 69b6eeb..c6ff81f 100644
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
