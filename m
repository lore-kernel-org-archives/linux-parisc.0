From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [parisc-linux] [PATCH] sba_iommu: module_param() takes permissions
Date: Mon, 30 Oct 2006 01:50:17 +0300
Message-ID: <20061029225016.GA9197@martell.zuzino.mipt.ru>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Andrew Morton <akpm@osdl.org>
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

not default value

0 is debatable, 1 is certainly wrong.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/parisc/sba_iommu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -109,7 +109,7 @@ #endif /*CONFIG_AGP_PARISC*/
 
 #ifdef SBA_AGP_SUPPORT
 static int sba_reserve_agpgart = 1;
-module_param(sba_reserve_agpgart, int, 1);
+module_param(sba_reserve_agpgart, int, 0);
 MODULE_PARM_DESC(sba_reserve_agpgart, "Reserve half of IO pdir as AGPGART");
 #endif
 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
