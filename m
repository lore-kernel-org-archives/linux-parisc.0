From: dann frazier <dannf@hp.com>
Subject: [PATCH 8/9] remove a couple unnecessary variables
Date: Thu, 15 Jan 2009 16:46:55 -0700
Message-ID: <628cabc357f25364e5c77e13c60b4c89b6f674a7.1231983599.git.dannf@hp.com>
References: <cover.1231983598.git.dannf@hp.com>
 <5bda6a81bf9fa4a3b60253bca73ef629a6ccc629.1231983599.git.dannf@hp.com>
 <0c29db565874aae3a60172ad42635fb8f60e8369.1231983599.git.dannf@hp.com>
 <0c2b8df6ecd123038e8458eeb9924b7959a707fa.1231983599.git.dannf@hp.com>
 <9b29163437fb37dc4996b17bcdb41192dbc79e9a.1231983599.git.dannf@hp.com>
 <a1d5a8a954f9c5e9f014bb0ff3285b04d9aa96e4.1231983599.git.dannf@hp.com>
 <8c4b31bbd7552995774e6b94db365d1f4b04f226.1231983599.git.dannf@hp.com>
 <55691aea931c081791b3daa370e1eb961748cf78.1231983599.git.dannf@hp.com>
Cc: lkml@vger.kernel.org, kyle@mcmartin.ca, dann frazier <dannf@hp.com>
To: linux-parisc@vger.kernel.org, rtc-linux@googlegroups.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <55691aea931c081791b3daa370e1eb961748cf78.1231983599.git.dannf@hp.com>
In-Reply-To: <cover.1231983598.git.dannf@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Signed-off-by: dann frazier <dannf@hp.com>
---
 drivers/rtc/rtc-parisc.c |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index a2ca07a..c29e918 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -25,11 +25,7 @@ static int parisc_get_time(struct device *dev, struct rtc_time *tm)
 
 static int parisc_set_time(struct device *dev, struct rtc_time *tm)
 {
-	int ret;
-
-	ret = set_rtc_time(tm);
