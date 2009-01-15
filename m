From: dann frazier <dannf@hp.com>
Subject: [PATCH 3/9] remove struct parisc_rtc
Date: Thu, 15 Jan 2009 16:46:50 -0700
Message-ID: <0c2b8df6ecd123038e8458eeb9924b7959a707fa.1231983599.git.dannf@hp.com>
References: <cover.1231983598.git.dannf@hp.com>
 <5bda6a81bf9fa4a3b60253bca73ef629a6ccc629.1231983599.git.dannf@hp.com>
 <0c29db565874aae3a60172ad42635fb8f60e8369.1231983599.git.dannf@hp.com>
Cc: lkml@vger.kernel.org, kyle@mcmartin.ca, dann frazier <dannf@hp.com>
To: linux-parisc@vger.kernel.org, rtc-linux@googlegroups.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <0c29db565874aae3a60172ad42635fb8f60e8369.1231983599.git.dannf@hp.com>
In-Reply-To: <cover.1231983598.git.dannf@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

parisc_rtc now only includes an rtc_device pointer, so let's
just use the rtc_device type directly.

Signed-off-by: dann frazier <dannf@hp.com>
---
 drivers/rtc/rtc-parisc.c |   19 +++++++------------
 1 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index cb087ad..ee4e9a3 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -11,11 +11,6 @@
 
 #include <asm/rtc.h>
 
-/* as simple as can be, and no simpler. */
-struct parisc_rtc {
-	struct rtc_device *rtc;
-};
-
 static int parisc_get_time(struct device *dev, struct rtc_time *tm)
 {
 	unsigned long ret;
@@ -47,16 +42,16 @@ static const struct rtc_class_ops parisc_rtc_ops = {
 
 static int __devinit parisc_rtc_probe(struct platform_device *dev)
 {
-	struct parisc_rtc *p;
+	struct rtc_device *p;
 
 	p = kzalloc(sizeof (*p), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
-	p->rtc = rtc_device_register("rtc-parisc", &dev->dev, &parisc_rtc_ops,
-					THIS_MODULE);
-	if (IS_ERR(p->rtc)) {
-		int err = PTR_ERR(p->rtc);
+	p = rtc_device_register("rtc-parisc", &dev->dev, &parisc_rtc_ops,
+				THIS_MODULE);
+	if (IS_ERR(p)) {
+		int err = PTR_ERR(p);
 		kfree(p);
 		return err;
 	}
@@ -68,9 +63,9 @@ static int __devinit parisc_rtc_probe(struct platform_device *dev)
 
 static int __devexit parisc_rtc_remove(struct platform_device *dev)
 {
-	struct parisc_rtc *p = platform_get_drvdata(dev);
+	struct rtc_device *p = platform_get_drvdata(dev);
 
-	rtc_device_unregister(p->rtc);
+	rtc_device_unregister(p);
 	kfree(p);
 
 	return 0;
-- 
1.5.6.5

