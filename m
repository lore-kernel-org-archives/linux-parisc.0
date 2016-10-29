From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Use LINUX_GATEWAY_ADDR define instead of hardcoded
 value value
Date: Sat, 29 Oct 2016 23:52:43 +0200
Message-ID: <20161029215243.GA24444@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

LINUX_GATEWAY_ADDR is defined in unistd.h. Let's use it.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index d03422e..d3407cf 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -100,7 +100,7 @@ set_thread_pointer:
 	.endr
 
 /* This address must remain fixed at 0x100 for glibc's syscalls to work */
-	.align 256
+	.align LINUX_GATEWAY_ADDR
 linux_gateway_entry:
 	gate	.+8, %r0			/* become privileged */
 	mtsp	%r0,%sr4			/* get kernel space into sr4 */
