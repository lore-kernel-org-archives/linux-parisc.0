From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Disable further stack checks when panic occurs
 during stack check
Date: Sat, 8 Jul 2017 23:25:14 +0200
Message-ID: <20170708212514.GA2560@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Before the irq handler detects a low stack and then panics the kernel, disable
further stack checks to avoid recursive panics.

Reported-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index ba5e1c7..5404e40 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -413,6 +413,10 @@ static inline void stack_overflow_check(struct pt_regs *regs)
 	if (regs->sr[7])
 		return;
 
+	/* exit if already in panic */
+	if (sysctl_panic_on_stackoverflow < 0)
+		return;
+
 	/* calculate kernel stack usage */
 	stack_usage = sp - stack_start;
 #ifdef CONFIG_IRQSTACKS
@@ -454,8 +458,10 @@ static inline void stack_overflow_check(struct pt_regs *regs)
 #ifdef CONFIG_IRQSTACKS
 panic_check:
 #endif
-	if (sysctl_panic_on_stackoverflow)
+	if (sysctl_panic_on_stackoverflow) {
+		sysctl_panic_on_stackoverflow = -1; /* disable further checks */
 		panic("low stack detected by irq handler - check messages\n");
+	}
 #endif
 }
 
