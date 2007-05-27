From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] fix section mismatch in ccio-dma
Date: Sun, 27 May 2007 18:20:47 +0200
Message-ID: <200705271820.48016.deller__25467.0396484018$1416624368$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
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

Hi Kyle,

this fixes section mismatches in ccio-dma.
Additionally, mark parisc_device_id table const.

Please apply, Helge

    Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index 1459ca8..b3c4dbf 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1227,7 +1227,7 @@ ccio_get_iotlb_size(struct parisc_device
 #endif /* 0 */
 
 /* We *can't* support JAVA (T600). Venture there at your own risk. */
-static struct parisc_device_id ccio_tbl[] = {
+static const struct parisc_device_id ccio_tbl[] = {
 	{ HPHW_IOA, HVERSION_REV_ANY_ID, U2_IOA_RUNWAY, 0xb }, /* U2 */
 	{ HPHW_IOA, HVERSION_REV_ANY_ID, UTURN_IOA_RUNWAY, 0xb }, /* UTurn */
 	{ 0, }
@@ -1370,7 +1370,7 @@ ccio_ioc_init(struct ioc *ioc)
 	}
 }
 
-static void
+static void __init
 ccio_init_resource(struct resource *res, char *name, void __iomem *ioaddr)
 {
 	int result;
@@ -1537,7 +1537,7 @@ int ccio_request_resource(const struct p
  * If so, initialize the chip and tell other partners in crime they
  * have work to do.
  */
-static int ccio_probe(struct parisc_device *dev)
+static int __init ccio_probe(struct parisc_device *dev)
 {
 	int i;
 	struct ioc *ioc, **ioc_p = &ioc_list;
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
