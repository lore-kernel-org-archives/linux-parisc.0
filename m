From: dann frazier <dannf@hp.com>
Subject: [PATCH 2/9] Remove redundant locking
Date: Thu, 15 Jan 2009 16:46:49 -0700
Message-ID: <0c29db565874aae3a60172ad42635fb8f60e8369.1231983599.git.dannf@hp.com>
References: <cover.1231983598.git.dannf@hp.com>
 <5bda6a81bf9fa4a3b60253bca73ef629a6ccc629.1231983599.git.dannf@hp.com>
Cc: lkml@vger.kernel.org, kyle@mcmartin.ca, dann frazier <dannf@hp.com>
To: linux-parisc@vger.kernel.org, rtc-linux@googlegroups.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5bda6a81bf9fa4a3b60253bca73ef629a6ccc629.1231983599.git.dannf@hp.com>
In-Reply-To: <cover.1231983598.git.dannf@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The RTC subsystem proides ops locking, no need to implement our own

Signed-off-by: dann frazier <dannf@hp.com>
---
 drivers/rtc/rtc-parisc.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index 319bb5d..cb087ad 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -14,17 +14,13 @@
 /* as simple as can be, and no simpler. */
 struct parisc_rtc {
 	struct rtc_device *rtc;
-	spinlock_t lock;
 };
 
 static int parisc_get_time(struct device *dev, struct rtc_time *tm)
 {
-	struct parisc_rtc *p = dev_get_drvdata(dev);
-	unsigned long flags, ret;
+	unsigned long ret;
 
-	spin_lock_irqsave(&p->lock, flags);
 	ret = get_rtc_time(tm);
-	spin_unlock_irqrestore(&p->lock, flags);
 
 	if (ret & RTC_BATT_BAD)
 		return -EOPNOTSUPP;
@@ -34,13 +30,9 @@ static int parisc_get_time(struct device *dev, struct rtc_time *tm)
 
 static int parisc_set_time(struct device *dev, struct rtc_time *tm)
 {
-	struct parisc_rtc *p = dev_get_drvdata(dev);
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&p->lock, flags);
 	ret = set_rtc_time(tm);
-	spin_unlock_irqrestore(&p->lock, flags);
 
 	if (ret < 0)
 		return -EOPNOTSUPP;
@@ -61,8 +53,6 @@ static int __devinit parisc_rtc_probe(struct platform_device *dev)
 	if (!p)
 		return -ENOMEM;
 
-	spin_lock_init(&p->lock);
