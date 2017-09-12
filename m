From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch V2 03/29] lockup_detector: Provide interface to stop from
 poweroff()
Date: Tue, 12 Sep 2017 21:36:57 +0200
Message-ID: <20170912194146.327343752@linutronix.de>
References: <20170912193654.321505854@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Cc: Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Borislav Petkov <bp@alien8.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Don Zickus <dzickus@redhat.com>,
        Chris Metcalf <cmetcalf@mellanox.com>,
        Ulrich Obergfell <uobergfe@redhat.com>,
        linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
To: LKML <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

PARISC has a a busy looping power off routine. If the watchdog is enabled
the watchdog timer will still fire, but the thread is not running, which
causes the softlockup watchdog to trigger.

Provide a interface which allows to turn the watchdog off.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Don Zickus <dzickus@redhat.com>
Cc: Chris Metcalf <cmetcalf@mellanox.com>
Cc: linux-parisc@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Siewior <bigeasy@linutronix.de>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Ulrich Obergfell <uobergfe@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Helge Deller <deller@gmx.de>
Link: http://lkml.kernel.org/r/20170831073053.202164272@linutronix.de

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
