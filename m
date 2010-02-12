From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [PATCH] parisc: fix tracing of signals
Date: Fri, 12 Feb 2010 10:53:08 -0500
Message-ID: <20100212155306.GI24051@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: vapier@gentoo.org, linux-parisc@vger.kernel.org, roland@redhat.com
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Kyle McMartin <kyle@redhat.com>

Mike Frysinger pointed out that calling tracehook_signal_handler with
stepping=0 missed testing the thread flags, resulting in not calling
ptrace_notify. Fix this by testing if we're single stepping or branch
stepping and setting the flag accordingly.

Tested, seems to work.

Reported-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
 arch/parisc/kernel/signal.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index e8467e4..07b3dac 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -469,7 +469,9 @@ handle_signal(unsigned long sig, siginfo_t *info, struct k_sigaction *ka,
 	recalc_sigpending();
 	spin_unlock_irq(&current->sighand->siglock);
 
-	tracehook_signal_handler(sig, info, ka, regs, 0);
+	tracehook_signal_handler(sig, info, ka, regs, 
+		test_thread_flag(TIF_SINGLESTEP) ||
+		test_thread_flag(TIF_BLOCKSTEP));
 
 	return 1;
 }
-- 
1.6.6

