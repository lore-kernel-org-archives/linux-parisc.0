From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH 10/33] net: tulip_core: mark expected switch fall-through
Date: Tue, 7 Aug 2018 18:15:35 -0500
Message-ID: <ca0a727e54d399a9784a5315ca3a14e7c7c02cd1.1533675546.git.gustavo@embeddedor.com>
References: <cover.1533675546.git.gustavo@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1533675546.git.gustavo@embeddedor.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Addresses-Coverity-ID: 114782 ("Missing break in switch")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/ethernet/dec/tulip/tulip_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/dec/tulip/tulip_core.c b/drivers/net/ethernet/dec/tulip/tulip_core.c
index 00d02a0..3e3e086 100644
--- a/drivers/net/ethernet/dec/tulip/tulip_core.c
+++ b/drivers/net/ethernet/dec/tulip/tulip_core.c
@@ -923,6 +923,7 @@ static int private_ioctl (struct net_device *dev, struct ifreq *rq, int cmd)
 			data->phy_id = 1;
 		else
 			return -ENODEV;
+		/* Fall through */
 
 	case SIOCGMIIREG:		/* Read MII PHY register. */
 		if (data->phy_id == 32 && (tp->flags & HAS_NWAY)) {
-- 
2.7.4
