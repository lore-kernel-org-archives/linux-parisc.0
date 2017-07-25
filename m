From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Suspend lockup detectors before system halt
Date: Tue, 25 Jul 2017 21:41:41 +0200
Message-ID: <20170725194141.GA14760@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Some machines can't power off the machine, so disable the lockup detectors to
avoid this watchdog BUG to show up every few seconds:
watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [systemd-shutdow:1]

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # 4.9+

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index b64d7d2..a45a67d 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -53,6 +53,7 @@
 #include <linux/uaccess.h>
 #include <linux/rcupdate.h>
 #include <linux/random.h>
+#include <linux/nmi.h>
 
 #include <asm/io.h>
 #include <asm/asm-offsets.h>
@@ -145,6 +146,7 @@ void machine_power_off(void)
 
 	/* prevent soft lockup/stalled CPU messages for endless loop. */
 	rcu_sysrq_start();
+	lockup_detector_suspend();
 	for (;;);
 }
 
