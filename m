From: Scott Wood <scottwood@freescale.com>
Subject: [PATCH 14/22] parisc: %pF is only for function pointers
Date: Wed, 11 Mar 2015 22:13:49 -0500
Message-ID: <1426130037-17956-14-git-send-email-scottwood@freescale.com>
References: <1426130037-17956-1-git-send-email-scottwood@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Scott Wood <scottwood@freescale.com>,
	<linux-parisc@vger.kernel.org>
To: <trivial@kernel.org>, <linux-kernel@vger.kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426130037-17956-1-git-send-email-scottwood@freescale.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Use %pS for actual addresses, otherwise you'll get bad output
on arches like ppc64 where %pF expects a function descriptor.  Even on
other architectures, refrain from setting a bad example that people
copy.

Signed-off-by: Scott Wood <scottwood@freescale.com>
Cc: linux-parisc@vger.kernel.org
---
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
