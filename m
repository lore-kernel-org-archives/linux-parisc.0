From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 03/29] lockup_detector: Provide interface to stop from
 poweroff()
Date: Thu, 31 Aug 2017 09:16:01 +0200
Message-ID: <20170831073053.202164272@linutronix.de>
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

PARISC has a a busy looping power off routine. If the watchdog is enabled
the watchdog timer will still fire, but the thread is not running, which
causes the softlockup watchdog to trigger.

Provide a interface which allows to turn the watchdog off.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 include/linux/nmi.h |    6 +++---
 kernel/watchdog.c   |   14 +++++++++++++-
 2 files changed, 16 insertions(+), 4 deletions(-)

--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -12,10 +12,10 @@
 
 #ifdef CONFIG_LOCKUP_DETECTOR
 void lockup_detector_init(void);
+void lockup_detector_soft_poweroff(void);
 #else
-static inline void lockup_detector_init(void)
-{
-}
+static inline void lockup_detector_init(void) { }
+static inline void lockup_detector_soft_poweroff(void) { }
 #endif
 
 #ifdef CONFIG_SOFTLOCKUP_DETECTOR
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -333,7 +333,8 @@ static enum hrtimer_restart watchdog_tim
 	int duration;
 	int softlockup_all_cpu_backtrace = sysctl_softlockup_all_cpu_backtrace;
 
-	if (atomic_read(&watchdog_park_in_progress) != 0)
+	if (!watchdog_enabled ||
+	    atomic_read(&watchdog_park_in_progress) != 0)
 		return HRTIMER_NORESTART;
 
 	/* kick the hardlockup detector */
@@ -660,6 +661,17 @@ static void set_sample_period(void)
 }
 #endif /* SOFTLOCKUP */
 
+/**
+ * lockup_detector_soft_poweroff - Interface to stop lockup detector(s)
+ *
+ * Special interface for parisc. It prevents lockup detector warnings from
+ * the default pm_poweroff() function which busy loops forever.
+ */
+void lockup_detector_soft_poweroff(void)
+{
+	watchdog_enabled = 0;
+}
+
 /*
  * Suspend the hard and soft lockup detector by parking the watchdog threads.
  */
