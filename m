From: Joe Perches <joe@perches.com>
Subject: [PATCH trivial next 6/9] parisc: Use vsprintf extention %pf with builtin_return_address
Date: Tue, 28 Feb 2012 10:49:35 -0800
Message-ID: <3aaf784d1f3b62a6ede3de47db5921b037c73423.1330454853.git.joe@perches.com>
References: <cover.1330454853.git.joe@perches.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, Jiri Kosina <trivial@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1330454853.git.joe@perches.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Emit the function name not the address when possible.

builtin_return_address() gives an address.  When building
a kernel with CONFIG_KALLSYMS, emit the actual function
name not the address.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/parisc/superio.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index e3b76d4..5003458 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -348,7 +348,7 @@ int superio_fixup_irq(struct pci_dev *pcidev)
 		BUG();
 		return -1;
 	}
-	printk("superio_fixup_irq(%s) ven 0x%x dev 0x%x from %p\n",
+	printk("superio_fixup_irq(%s) ven 0x%x dev 0x%x from %pf\n",
 		pci_name(pcidev),
 		pcidev->vendor, pcidev->device,
 		__builtin_return_address(0));
-- 
1.7.8.111.gad25c.dirty
