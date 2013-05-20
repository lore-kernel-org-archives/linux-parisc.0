From: Peter Huewe <peterhuewe@gmx.de>
Subject: [PATCH] parisc/superio: Use module_pci_driver to register driver
Date: Mon, 20 May 2013 22:56:45 +0200
Message-ID: <1369083405-30157-1-git-send-email-peterhuewe@gmx.de>
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Removing some boilerplate by using module_pci_driver instead of calling
register and unregister in the otherwise empty init/exit functions.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/parisc/superio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index ac6e8e7..a042d06 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -494,15 +494,4 @@ static struct pci_driver superio_driver = {
 	.probe =        superio_probe,
 };
 
-static int __init superio_modinit(void)
-{
-	return pci_register_driver(&superio_driver);
-}
-
-static void __exit superio_exit(void)
-{
-	pci_unregister_driver(&superio_driver);
-}
