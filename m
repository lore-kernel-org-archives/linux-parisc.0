From: wzt.wzt@gmail.com
Subject: [PATCH] Parisc: Check kmalloc return value before use the buffer in ccio-dma.c
Date: Thu, 6 May 2010 10:42:08 +0800
Message-ID: <20100506024208.GB15956@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de,
	jejb@parisc-linux.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Check kmalloc return value before use the buffer.

Signed-off-by: Zhitong Wang <zhitong.wangzt@alibaba-inc.com>

---
 drivers/parisc/ccio-dma.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index f511e70..f465417 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1407,6 +1407,11 @@ static void __init ccio_init_resources(struct ioc *ioc)
 	struct resource *res = ioc->mmio_region;
 	char *name = kmalloc(14, GFP_KERNEL);
 
+	if (!name) {
+		printk(KERN_ERR "%s() failed to get enough memory\n", __func__);
+		return ;
+	}
+
 	snprintf(name, 14, "GSC Bus [%d/]", ioc->hw_path);
 
 	ccio_init_resource(res, name, &ioc->ioc_regs->io_io_low);
-- 
1.6.5.3

