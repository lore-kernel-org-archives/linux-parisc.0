From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [parisc-linux] [PATCH] parisc: fix module_param iommu permission
Date: Mon, 23 Oct 2006 20:01:25 -0700
Message-ID: <20061023200125.6f05e0f3.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: akpm <akpm@osdl.org>,
 kyle@parisc-linux.org,
 matthew@wil.cx
To: parisc-linux@parisc-linux.org
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

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix/change module_param permissions parameter from an init value
to a permission value.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/parisc/sba_iommu.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.19-rc2-git8.orig/drivers/parisc/sba_iommu.c
+++ linux-2.6.19-rc2-git8/drivers/parisc/sba_iommu.c
@@ -109,7 +109,7 @@ static unsigned long piranha_bad_128k = 
 
 #ifdef SBA_AGP_SUPPORT
 static int sba_reserve_agpgart = 1;
-module_param(sba_reserve_agpgart, int, 1);
+module_param(sba_reserve_agpgart, int, 0444);
 MODULE_PARM_DESC(sba_reserve_agpgart, "Reserve half of IO pdir as AGPGART");
 #endif
 


---
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
