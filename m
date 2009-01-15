From: dann frazier <dannf@hp.com>
Subject: [PATCH 5/9] Use platform_driver_probe
Date: Thu, 15 Jan 2009 16:46:52 -0700
Message-ID: <a1d5a8a954f9c5e9f014bb0ff3285b04d9aa96e4.1231983599.git.dannf@hp.com>
References: <cover.1231983598.git.dannf@hp.com>
 <5bda6a81bf9fa4a3b60253bca73ef629a6ccc629.1231983599.git.dannf@hp.com>
 <0c29db565874aae3a60172ad42635fb8f60e8369.1231983599.git.dannf@hp.com>
 <0c2b8df6ecd123038e8458eeb9924b7959a707fa.1231983599.git.dannf@hp.com>
 <9b29163437fb37dc4996b17bcdb41192dbc79e9a.1231983599.git.dannf@hp.com>
Cc: lkml@vger.kernel.org, kyle@mcmartin.ca, dann frazier <dannf@hp.com>
To: linux-parisc@vger.kernel.org, rtc-linux@googlegroups.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <9b29163437fb37dc4996b17bcdb41192dbc79e9a.1231983599.git.dannf@hp.com>
In-Reply-To: <cover.1231983598.git.dannf@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This isn't a hotpluggable device, so call platform_driver_probe
directly in parisc_rtc_init

Signed-off-by: dann frazier <dannf@hp.com>
---
 drivers/rtc/rtc-parisc.c |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index 0477cc1..a2ca07a 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -40,19 +40,14 @@ static const struct rtc_class_ops parisc_rtc_ops = {
 	.set_time = parisc_set_time,
 };
 
-static int __devinit parisc_rtc_probe(struct platform_device *dev)
+static int __init parisc_rtc_probe(struct platform_device *dev)
 {
 	struct rtc_device *p;
 
-	p = kzalloc(sizeof (*p), GFP_KERNEL);
-	if (!p)
-		return -ENOMEM;
-
 	p = rtc_device_register("rtc-parisc", &dev->dev, &parisc_rtc_ops,
 				THIS_MODULE);
 	if (IS_ERR(p)) {
 		int err = PTR_ERR(p);
-		kfree(p);
 		return err;
 	}
 
@@ -61,12 +56,11 @@ static int __devinit parisc_rtc_probe(struct platform_device *dev)
 	return 0;
 }
 
-static int __devexit parisc_rtc_remove(struct platform_device *dev)
+static int __exit parisc_rtc_remove(struct platform_device *dev)
 {
 	struct rtc_device *p = platform_get_drvdata(dev);
 
 	rtc_device_unregister(p);
-	kfree(p);
 
 	return 0;
 }
@@ -82,7 +76,7 @@ static struct platform_driver parisc_rtc_driver = {
 
 static int __init parisc_rtc_init(void)
 {
-	return platform_driver_register(&parisc_rtc_driver);
+	return platform_driver_probe(&parisc_rtc_driver, parisc_rtc_probe);
 }
 
 static void __exit parisc_rtc_fini(void)
-- 
1.5.6.5

