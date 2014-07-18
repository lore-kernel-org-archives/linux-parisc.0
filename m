From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] parisc: Remove FIXME comment
Date: Fri, 18 Jul 2014 16:37:03 -0400
Message-ID: <1405715823-17492-1-git-send-email-xerofoify@gmail.com>
Cc: deller@gmx.de, tiwai@suse.de, jkosina@suse.cz, joe@perches.com,
	dave.anglin@bell.net, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: jejb@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The comment for size of frame not being needed is incorrect , the
function called needs this parameter.

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

