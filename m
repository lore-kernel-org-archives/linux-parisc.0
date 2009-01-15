From: dann frazier <dannf@hp.com>
Subject: [PATCH 9/9] rename p pointer to rtc
Date: Thu, 15 Jan 2009 16:46:56 -0700
Message-ID: <c95f7e73216f9e8f9a312c1e4ef04985a525f827.1231983599.git.dannf@hp.com>
References: <cover.1231983598.git.dannf@hp.com>
 <5bda6a81bf9fa4a3b60253bca73ef629a6ccc629.1231983599.git.dannf@hp.com>
 <0c29db565874aae3a60172ad42635fb8f60e8369.1231983599.git.dannf@hp.com>
 <0c2b8df6ecd123038e8458eeb9924b7959a707fa.1231983599.git.dannf@hp.com>
 <9b29163437fb37dc4996b17bcdb41192dbc79e9a.1231983599.git.dannf@hp.com>
 <a1d5a8a954f9c5e9f014bb0ff3285b04d9aa96e4.1231983599.git.dannf@hp.com>
 <8c4b31bbd7552995774e6b94db365d1f4b04f226.1231983599.git.dannf@hp.com>
 <55691aea931c081791b3daa370e1eb961748cf78.1231983599.git.dannf@hp.com>
 <628cabc357f25364e5c77e13c60b4c89b6f674a7.1231983599.git.dannf@hp.com>
Cc: lkml@vger.kernel.org, kyle@mcmartin.ca, dann frazier <dannf@hp.com>
To: linux-parisc@vger.kernel.org, rtc-linux@googlegroups.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <628cabc357f25364e5c77e13c60b4c89b6f674a7.1231983599.git.dannf@hp.com>
In-Reply-To: <cover.1231983598.git.dannf@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Signed-off-by: dann frazier <dannf@hp.com>
---
 drivers/rtc/rtc-parisc.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index c29e918..b966f56 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -38,23 +38,23 @@ static const struct rtc_class_ops parisc_rtc_ops = {
 
 static int __init parisc_rtc_probe(struct platform_device *dev)
 {
-	struct rtc_device *p;
+	struct rtc_device *rtc;
 
-	p = rtc_device_register("rtc-parisc", &dev->dev, &parisc_rtc_ops,
-				THIS_MODULE);
-	if (IS_ERR(p))
-		return PTR_ERR(p);
+	rtc = rtc_device_register("rtc-parisc", &dev->dev, &parisc_rtc_ops,
+				  THIS_MODULE);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	platform_set_drvdata(dev, p);
+	platform_set_drvdata(dev, rtc);
 
 	return 0;
 }
 
 static int __exit parisc_rtc_remove(struct platform_device *dev)
 {
-	struct rtc_device *p = platform_get_drvdata(dev);
+	struct rtc_device *rtc = platform_get_drvdata(dev);
 
-	rtc_device_unregister(p);
+	rtc_device_unregister(rtc);
 
 	return 0;
 }
-- 
1.5.6.5

