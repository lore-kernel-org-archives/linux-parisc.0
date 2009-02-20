From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: [PATCH/RFC 1/5] rtc-parisc: Add missing module alias
Date: Fri, 20 Feb 2009 16:46:45 +0100
Message-ID: <1235144809-32468-2-git-send-email-Geert.Uytterhoeven@sonycom.com>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
Cc: rtc-linux@googlegroups.com, Kyle McMartin <kyle@mcmartin.ca>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Zidlicky <rz@linux-m68k.org>,
	linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
To: Alessandro Zummo <a.zummo@towertech.it>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Make udev autoload the driver

Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
---
 drivers/rtc/rtc-parisc.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index c6bfa6f..28fb7d3 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -110,3 +110,4 @@ module_exit(parisc_rtc_fini);
 MODULE_AUTHOR("Kyle McMartin <kyle@mcmartin.ca>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("HP PA-RISC RTC driver");
+MODULE_ALIAS("platform:rtc-parisc");
-- 
1.6.0.4

