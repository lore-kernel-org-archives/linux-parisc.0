From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 08 Sep 2008 10:53:25 -0500
Message-ID: <1220889205.8074.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	David Brownell <david-b@pacbell.net>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

As of 2.6.26, most distribution kernels for PARISC are coming with the
wrong RTC infrastructure enabled, meaning that userland can no longer
get at the RTC, so all our parisc clocks are drifting.

The fault is this patch:

commit c750090085f260503d8beec1c73c4d2e4fe93628
Author: David Brownell <david-b@pacbell.net>
Date:   Mon Apr 28 02:11:52 2008 -0700

    rtc: avoid legacy drivers with generic framework

Which makes drivers/rtc take precedence over the generic rtc.  However,
for parisc we only have the generic rtc, so in essence this turns off
our ability to access the rtc.  Put it back again by making RTC_CLASS
unselectable if the architecture is parisc.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

---

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 9a9755c..472fb19 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -8,7 +8,7 @@ config RTC_LIB
 menuconfig RTC_CLASS
 	tristate "Real Time Clock"
 	default n
-	depends on !S390
+	depends on !(S390 || PARISC)
 	select RTC_LIB
 	help
 	  Generic RTC class support. If you say yes here, you will


