From: Gustavo Zacarias <gustavoz@gentoo.org>
Subject: [parisc-linux] [PATCH] e100_probe using ioremap
Date: Wed, 05 Apr 2006 14:50:36 -0300
Message-ID: <4434036C.9060700@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------040300050500040606080403"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------040300050500040606080403
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


e100_probe in drivers/net/e100.c is using ioremap instead of 
ioremap_nocache.
Fix attached.

-- 
Gustavo Zacarias
Gentoo/SPARC monkey

--------------040300050500040606080403
Content-Type: text/x-patch;
 name="e100_ioremap.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="e100_ioremap.diff"

diff -Nura linux-2.6.16-pa11/drivers/net/e100.c linux-2.6.16-pa11-e100/drivers/net/e100.c
--- linux-2.6.16-pa11/drivers/net/e100.c	2006-03-20 02:53:29.000000000 -0300
+++ linux-2.6.16-pa11-e100/drivers/net/e100.c	2006-04-05 14:48:09.000000000 -0300
@@ -2607,7 +2607,7 @@
 	SET_MODULE_OWNER(netdev);
 	SET_NETDEV_DEV(netdev, &pdev->dev);
 
-	nic->csr = ioremap(pci_resource_start(pdev, 0), sizeof(struct csr));
+	nic->csr = ioremap_nocache(pci_resource_start(pdev, 0), sizeof(struct csr));
 	if(!nic->csr) {
 		DPRINTK(PROBE, ERR, "Cannot map device registers, aborting.\n");
 		err = -ENOMEM;

--------------040300050500040606080403
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------040300050500040606080403--
