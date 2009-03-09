From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: [PATCH 3/7] parisc: rtc: Add missing module alias
Date: Mon,  9 Mar 2009 14:26:19 +0100
Message-ID: <1236605183-22718-4-git-send-email-Geert.Uytterhoeven@sonycom.com>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
 <1236605183-22718-2-git-send-email-Geert.Uytterhoeven@sonycom.com>
 <1236605183-22718-3-git-send-email-Geert.Uytterhoeven@sonycom.com>
Cc: rtc-linux@googlegroups.com, linux-parisc@vger.kernel.org,
	linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org,
	linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>,
	Dann Frazier <dannf@dannf.org>,
	Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
To: Alessandro Zummo <alessandro.zummo@towertech.it>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1236605183-22718-3-git-send-email-Geert.Uytterhoeven@sonycom.com>
List-ID: <linux-m68k.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Make udev autoload the driver

Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
---
 drivers/rtc/rtc-parisc.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-parisc.c b/drivers/rtc/rtc-parisc.c
index f4e871c..48ef5b4 100644
--- a/drivers/rtc/rtc-parisc.c
+++ b/drivers/rtc/rtc-parisc.c
@@ -81,3 +81,4 @@ module_exit(parisc_rtc_fini);
 MODULE_AUTHOR("Kyle McMartin <kyle@mcmartin.ca>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("HP PA-RISC RTC driver");
+MODULE_ALIAS("platform:rtc-parisc");
-- 
1.6.0.4

