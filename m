From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Avoid stalled CPU warnings after system shutdown
Date: Wed, 29 Mar 2017 08:25:30 +0200
Message-ID: <20170329062530.GA2960@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 73580dac7618 ("parisc: Fix system shutdown halt") introduced an endless
loop for systems which don't provide a software power off function.  But the
soft lockup detector will detect this and report stalled CPUs after some time.
Avoid those unwanted warnings by disabling the soft lockup detector.

Fixes: 73580dac7618 ("parisc: Fix system shutdown halt")
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # 4.9+

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index b76f503..4516a5b 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -143,6 +143,8 @@ void machine_power_off(void)
 	printk(KERN_EMERG "System shut down completed.\n"
 	       "Please power this system off now.");
 
+	/* prevent soft lockup/stalled CPU messages for endless loop. */
+	rcu_sysrq_start();
 	for (;;);
 }
 
