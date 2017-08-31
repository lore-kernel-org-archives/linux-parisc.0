From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 04/29] parisc: Use lockup_detector_stop()
Date: Thu, 31 Aug 2017 09:16:02 +0200
Message-ID: <20170831073053.281414373@linutronix.de>
References: <20170831071558.995235362@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Cc: Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Don Zickus <dzickus@redhat.com>,
        Chris Metcalf <cmetcalf@mellanox.com>,
        Ulrich Obergfell <uobergfe@redhat.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The broken lockup_detector_suspend/resume() interface is going away. Use
the new lockup_detector_soft_poweroff() interface to stop the watchdog from
the busy looping power off routine.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/process.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -146,7 +146,7 @@ void machine_power_off(void)
 
 	/* prevent soft lockup/stalled CPU messages for endless loop. */
 	rcu_sysrq_start();
-	lockup_detector_suspend();
+	lockup_detector_soft_poweroff();
 	for (;;);
 }
 
