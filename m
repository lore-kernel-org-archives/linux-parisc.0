From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [PARISC] fix signal trampoline cache flushing
Date: Tue, 15 Apr 2008 18:36:38 -0400
Message-ID: <20080415223638.GD17646@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, stable@kernel.org
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The signal trampolines were accidently flushing the kernel I$ instead
of the users. Fix that up, and also add a missing user D$ flush
while we're at it.

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
Sorry, I thought I submitted this for 2.6.25 ages ago.

 arch/parisc/kernel/signal.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 58fccc9..06213d1 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -534,7 +534,8 @@ insert_restart_trampoline(struct pt_regs *regs)
 		 * Flushing one cacheline is cheap.
 		 * "sync" on bigger (> 4 way) boxes is not.
 		 */
-		flush_icache_range(regs->gr[30], regs->gr[30] + 4);
+		flush_user_dcache_range(regs->gr[30], regs->gr[30] + 4);
+		flush_user_icache_range(regs->gr[30], regs->gr[30] + 4);
 
 		regs->gr[31] = regs->gr[30] + 8;
 		/* Preserve original r28. */
-- 
1.5.5

