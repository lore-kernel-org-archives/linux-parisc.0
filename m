From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Show unhashed hardware inventory
Date: Tue, 2 Jan 2018 20:40:21 +0100
Message-ID: <20180102194021.GA26468@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fixes: ad67b74d2469d9b8 ("printk: hash addresses printed with %p")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index d8f77358e2ba..29b99b8964aa 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -870,7 +870,7 @@ static void print_parisc_device(struct parisc_device *dev)
 	static int count;
 
 	print_pa_hwpath(dev, hw_path);
-	printk(KERN_INFO "%d. %s at 0x%p [%s] { %d, 0x%x, 0x%.3x, 0x%.5x }",
+	printk(KERN_INFO "%d. %s at 0x%px [%s] { %d, 0x%x, 0x%.3x, 0x%.5x }",
 		++count, dev->name, (void*) dev->hpa.start, hw_path, dev->id.hw_type,
 		dev->id.hversion_rev, dev->id.hversion, dev->id.sversion);
 
