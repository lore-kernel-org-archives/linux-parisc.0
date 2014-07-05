From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] parisc: Remove sizeof(frame) from call to get_sigframe
Date: Fri,  4 Jul 2014 23:20:57 -0400
Message-ID: <1404530457-4739-1-git-send-email-xerofoify@gmail.com>
Cc: deller@gmx.de, tiwai@suse.de, jkosina@suse.cz,
	dave.anglin@bell.net, joe@perches.com,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: jejb@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This removes the sizeof(frame) from the call to get_sigframe on line
243 in order to fix the call to this function as the sizeof in not
needed to call this function.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/parisc/kernel/signal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 1cba8f2..3b7caac 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -240,8 +240,7 @@ setup_rt_frame(int sig, struct k_sigaction *ka, siginfo_t *info,
 #endif
 	
 	usp = (regs->gr[30] & ~(0x01UL));
-	/*FIXME: frame_size parameter is unused, remove it. */
-	frame = get_sigframe(ka, usp, sizeof(*frame));
+	frame = get_sigframe(ka, usp)
 
 	DBG(1,"SETUP_RT_FRAME: START\n");
 	DBG(1,"setup_rt_frame: frame %p info %p\n", frame, info);
-- 
1.9.1

