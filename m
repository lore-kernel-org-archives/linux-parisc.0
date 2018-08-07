From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH 11/33] net: tulip: de4x5: mark expected switch fall-throughs
Date: Tue, 7 Aug 2018 18:16:07 -0500
Message-ID: <dcb7df430a291a7c1f938abdaa8a1d7a7728b256.1533675546.git.gustavo@embeddedor.com>
References: <cover.1533675546.git.gustavo@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.1533675546.git.gustavo@embeddedor.com>
List-ID: <linux-parisc.vger.kernel.org>

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Addresses-Coverity-ID: 114784 ("Missing break in switch")
Addresses-Coverity-ID: 114785 ("Missing break in switch")
Addresses-Coverity-ID: 114786 ("Missing break in switch")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/ethernet/dec/tulip/de4x5.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/dec/tulip/de4x5.c b/drivers/net/ethernet/dec/tulip/de4x5.c
index a31b4df..66535d1 100644
--- a/drivers/net/ethernet/dec/tulip/de4x5.c
+++ b/drivers/net/ethernet/dec/tulip/de4x5.c
@@ -3204,6 +3204,8 @@ srom_map_media(struct net_device *dev)
       case SROM_10BASETF:
 	if (!lp->params.fdx) return -1;
 	lp->fdx = true;
+	/* fall through */
+
       case SROM_10BASET:
 	if (lp->params.fdx && !lp->fdx) return -1;
 	if ((lp->chipset == DC21140) || ((lp->chipset & ~0x00ff) == DC2114x)) {
@@ -3224,6 +3226,8 @@ srom_map_media(struct net_device *dev)
       case SROM_100BASETF:
         if (!lp->params.fdx) return -1;
 	lp->fdx = true;
+	/* fall through */
+
       case SROM_100BASET:
 	if (lp->params.fdx && !lp->fdx) return -1;
 	lp->media = _100Mb;
@@ -3236,6 +3240,8 @@ srom_map_media(struct net_device *dev)
       case SROM_100BASEFF:
 	if (!lp->params.fdx) return -1;
 	lp->fdx = true;
+	/* fall through */
+
       case SROM_100BASEF:
 	if (lp->params.fdx && !lp->fdx) return -1;
 	lp->media = _100Mb;
-- 
2.7.4
