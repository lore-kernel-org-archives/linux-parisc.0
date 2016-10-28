From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: use KERN_CONT for printing device inventory
Date: Fri, 28 Oct 2016 20:56:07 +0200
Message-ID: <20161028185607.GA3466@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Recent changes to printk require KERN_CONT uses to continue logging messages.
So add KERN_CONT to output of device inventory.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index f815066..700e2d2 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -873,11 +873,11 @@ static void print_parisc_device(struct parisc_device *dev)
 
 	if (dev->num_addrs) {
 		int k;
-		printk(", additional addresses: ");
+		pr_cont(", additional addresses: ");
 		for (k = 0; k < dev->num_addrs; k++)
-			printk("0x%lx ", dev->addr[k]);
+			pr_cont("0x%lx ", dev->addr[k]);
 	}
-	printk("\n");
+	pr_cont("\n");
 }
 
 /**
