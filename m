From: dann frazier <dannf@hp.com>
Subject: [PATCH 1/9] Add a missing include for linux/rtc.h
Date: Thu, 15 Jan 2009 16:46:48 -0700
Message-ID: <5bda6a81bf9fa4a3b60253bca73ef629a6ccc629.1231983599.git.dannf@hp.com>
References: <cover.1231983598.git.dannf@hp.com>
Cc: lkml@vger.kernel.org, kyle@mcmartin.ca, dann frazier <dannf@hp.com>
To: linux-parisc@vger.kernel.org, rtc-linux@googlegroups.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <cover.1231983598.git.dannf@hp.com>
In-Reply-To: <cover.1231983598.git.dannf@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: dann frazier <dannf@hp.com>
---
 drivers/rtc/rtc-parisc.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index c6bfa6f..319bb5d 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/time.h>
 #include <linux/platform_device.h>
+#include <linux/rtc.h>
 
 #include <asm/rtc.h>
 
-- 
1.5.6.5

