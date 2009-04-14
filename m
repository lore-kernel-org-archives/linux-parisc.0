From: Wei Yongjun <yjwei@cn.fujitsu.com>
Subject: [PATCH] parisc: fix the parameters of call to parport_pc_probe_port()
Date: Tue, 14 Apr 2009 14:01:37 +0800
Message-ID: <49E426C1.50706@cn.fujitsu.com>
References: <aea82416ed6c6805412a2631fe8a8be6420c5c9d.1239687192.git.tony@bakeyournoodle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Cc: Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org, Wei Yongjun <yjwei@cn.fujitsu.com>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <aea82416ed6c6805412a2631fe8a8be6420c5c9d.1239687192.git.tony@bakeyournoodle.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

commit 51dcdfec6a274afc1c6fce180d582add9ff512c0 (parport: Use the PCI
IRQ if offered) parport_pc_probe_port() gained an irqflags arg. This
break parisc. This patch make parisc fallback to the old behaviour,
that is using "0" for irqflags.

No test.

Signed-off-by: Wei Yongjun <yjwei@cn.fujitsu.com>
---
 drivers/parisc/superio.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index 4fa3bb2..f6727e2 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -434,7 +434,8 @@ static void __init superio_parport_init(void)
 			0 /*base_hi*/,
 			PAR_IRQ, 
 			PARPORT_DMA_NONE /* dma */,
-			NULL /*struct pci_dev* */) )
+			NULL /*struct pci_dev* */,
+			0))
 
 		printk(KERN_WARNING PFX "Probing parallel port failed.\n");
 #endif	/* CONFIG_PARPORT_PC */
-- 
1.5.3.8




