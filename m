From: Scott Wood <scottwood@freescale.com>
Subject: [PATCH v2 14/22] parisc: %pf is only for function pointers
Date: Thu, 12 Mar 2015 16:46:00 -0500
Message-ID: <1426196761-4891-2-git-send-email-scottwood@freescale.com>
References: <1426196761-4891-1-git-send-email-scottwood@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Scott Wood <scottwood@freescale.com>,
	<linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: <trivial@kernel.org>, <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426196761-4891-1-git-send-email-scottwood@freescale.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Use %ps for actual addresses, otherwise you'll get bad output
on arches like parisc64 where %pf expects a function descriptor.

This wasn't normally seen on parisc64 because the code is not built
unless DEBUG_SUPERIO_INIT is manually defined.

Signed-off-by: Scott Wood <scottwood@freescale.com>
Cc: linux-parisc@vger.kernel.org
cc: James Bottomley <James.Bottomley@HansenPartnership.com>
---
v2: Commit message updates

 drivers/parisc/superio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index 8be2096..38c5440 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -348,7 +348,7 @@ int superio_fixup_irq(struct pci_dev *pcidev)
 		BUG();
 		return -1;
 	}
-	printk("superio_fixup_irq(%s) ven 0x%x dev 0x%x from %pf\n",
+	printk("superio_fixup_irq(%s) ven 0x%x dev 0x%x from %ps\n",
 		pci_name(pcidev),
 		pcidev->vendor, pcidev->device,
 		__builtin_return_address(0));
-- 
2.1.0
