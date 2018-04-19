From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH] parisc: time: Convert read_persistent_clock() to read_persistent_clock64()
Date: Thu, 19 Apr 2018 14:51:03 +0800
Message-ID: <4914b33abd8969906d2db0ae5c3da4f205f0bfe9.1524120572.git.baolin.wang@linaro.org>
Cc: alexandre.belloni@bootlin.com, kstewart@linuxfoundation.org,
        gregkh@linuxfoundation.org, tglx@linutronix.de,
        linux-parisc@vger.kernel.org, arnd@arndb.de, broonie@kernel.org,
        linux-kernel@vger.kernel.org, baolin.wang@linaro.org
To: jejb@parisc-linux.org, deller@gmx.de
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The read_persistent_clock() uses a timespec, which is not year 2038 safe
on 32bit systems. On parisc architecture, we have implemented generic RTC
drivers that can be used to compensate the system suspend time, but the
RTC time can not represent the nanosecond resolution, so this patch just
converts to read_persistent_clock64() with timespec64.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/parisc/kernel/time.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index c383040..a1e772f 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -205,7 +205,7 @@ static int __init rtc_init(void)
 device_initcall(rtc_init);
 #endif
 
-void read_persistent_clock(struct timespec *ts)
+void read_persistent_clock64(struct timespec64 *ts)
 {
 	static struct pdc_tod tod_data;
 	if (pdc_tod_read(&tod_data) == 0) {
-- 
1.7.9.5
