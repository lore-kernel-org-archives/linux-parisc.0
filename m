From: dann frazier <dannf@hp.com>
Subject: [PATCH 4/9] Use rtc_valid_tm() in parisc_get_time
Date: Thu, 15 Jan 2009 16:46:51 -0700
Message-ID: <9b29163437fb37dc4996b17bcdb41192dbc79e9a.1231983599.git.dannf@hp.com>
References: <cover.1231983598.git.dannf@hp.com>
 <5bda6a81bf9fa4a3b60253bca73ef629a6ccc629.1231983599.git.dannf@hp.com>
 <0c29db565874aae3a60172ad42635fb8f60e8369.1231983599.git.dannf@hp.com>
 <0c2b8df6ecd123038e8458eeb9924b7959a707fa.1231983599.git.dannf@hp.com>
Cc: lkml@vger.kernel.org, kyle@mcmartin.ca, dann frazier <dannf@hp.com>
To: linux-parisc@vger.kernel.org, rtc-linux@googlegroups.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <0c2b8df6ecd123038e8458eeb9924b7959a707fa.1231983599.git.dannf@hp.com>
In-Reply-To: <cover.1231983598.git.dannf@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Use the return value of rtc_valid_tm() instead of just returning 0.

Signed-off-by: dann frazier <dannf@hp.com>
---
 drivers/rtc/rtc-parisc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index ee4e9a3..0477cc1 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -20,7 +20,7 @@ static int parisc_get_time(struct device *dev, struct rtc_time *tm)
 	if (ret & RTC_BATT_BAD)
 		return -EOPNOTSUPP;
 
-	return 0;
+	return rtc_valid_tm(tm);
 }
 
 static int parisc_set_time(struct device *dev, struct rtc_time *tm)
-- 
1.5.6.5

