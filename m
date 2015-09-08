From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Use platform_device_register_simple("rtc-generic")
Date: Tue, 8 Sep 2015 17:50:03 +0200
Message-ID: <20150908155003.GB31927@ls3530.dhcp.wdf.sap.corp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 70e105d..400acac 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -231,20 +224,14 @@ void __init start_cpu_itimer(void)
 	per_cpu(cpu_data, cpu).it_value = next_tick;
 }
 
-static struct platform_device rtc_generic_dev = {
-	.name = "rtc-generic",
-	.id = -1,
-};
