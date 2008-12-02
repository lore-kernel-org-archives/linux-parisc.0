From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] parisc: set_time() catch errors
Date: Wed, 03 Dec 2008 00:16:04 +0100
Message-ID: <4935C1B4.5030806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

set_rtc_time returns negative on error, ret should be signed to catch those

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index 346d633..c6bfa6f 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -34,7 +34,8 @@ static int parisc_get_time(struct device *dev, struct rtc_time *tm)
 static int parisc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct parisc_rtc *p = dev_get_drvdata(dev);
-	unsigned long flags, ret;
+	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&p->lock, flags);
 	ret = set_rtc_time(tm);
