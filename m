From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] parisc: Remove FIXME line in signal.c
Date: Sat,  5 Jul 2014 00:14:42 -0400
Message-ID: <1404533682-6747-1-git-send-email-xerofoify@gmail.com>
Cc: deller@gmx.de, joe@perches.com, dave.anglin@bell.net,
	jkosina@suse.cz, tiwai@suse.de, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: jejb@parisc-linux.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This frame removes a fix me line in signal.c that is no longer
needed as function call is correct.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/parisc/kernel/signal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 1cba8f2..1d550b5 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -240,7 +240,6 @@ setup_rt_frame(int sig, struct k_sigaction *ka, siginfo_t *info,
 #endif
 	
 	usp = (regs->gr[30] & ~(0x01UL));
-	/*FIXME: frame_size parameter is unused, remove it. */
 	frame = get_sigframe(ka, usp, sizeof(*frame));
 
 	DBG(1,"SETUP_RT_FRAME: START\n");
-- 
1.9.1
