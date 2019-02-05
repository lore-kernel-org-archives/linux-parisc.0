Return-Path: <SRS0=AZHF=QM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA3BC282CB
	for <linux-parisc@archiver.kernel.org>; Tue,  5 Feb 2019 16:04:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DE662080F
	for <linux-parisc@archiver.kernel.org>; Tue,  5 Feb 2019 16:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bvzH2BCn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbfBEQEC (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 5 Feb 2019 11:04:02 -0500
Received: from m12-11.163.com ([220.181.12.11]:32882 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727250AbfBEQEC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 5 Feb 2019 11:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=PbiksNVUy6d9Ohk7Ly
        aggvBbSuScXKXUQPacO5mUQR0=; b=bvzH2BCnnUwqm3HWQwNEaU6gWEEvfH04xQ
        NC4PvBi9hJOgZI8po/GjRS/585XxU8VOIGovS/kVLmucTtYTlQ45v/qUm2V7RwmX
        TC128le6Yrhi2JtcawNmn/2Ol3fa4gEsjR2K4kUjyaq9AKIG19zKyXQYHL+dlf4C
        JiX7WsOJQ=
Received: from localhost.localdomain (unknown [171.210.152.198])
        by smtp7 (Coremail) with SMTP id C8CowADHpnbps1lcSlEvEQ--.44068S3;
        Wed, 06 Feb 2019 00:03:54 +0800 (CST)
From:   Yang Wei <albin_yang@163.com>
To:     netdev@vger.kernel.org, linux-parisc@vger.kernel.org
Cc:     davem@davemloft.net, yang.wei9@zte.com.cn, albin_yang@163.com
Subject: [PATCH net] net: tulip: de2104x: replace dev_kfree_skb_irq by dev_consume_skb_irq for drop profiles
Date:   Wed,  6 Feb 2019 00:03:51 +0800
Message-Id: <1549382631-5211-1-git-send-email-albin_yang@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: C8CowADHpnbps1lcSlEvEQ--.44068S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWDKF1DZF4UCF1UJFyftFb_yoW3CrX_Ww
        10v3Wftw45Ar90k3sxKFsY9FyS9r1kWF4rAFySqrW3X342yr1jvrWkZr9xGr98Gw4rXFnr
        Gry2qr4fZ345AjkaLaAFLSUrUUUUnb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnDfHUUUUUU==
X-Originating-IP: [171.210.152.198]
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/1tbiqwpSolUMOAmQOAAAsR
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Yang Wei <yang.wei9@zte.com.cn>

dev_consume_skb_irq() should be called in de_tx() when skb xmit
done. It makes drop profiles(dropwatch, perf) more friendly.

Signed-off-by: Yang Wei <yang.wei9@zte.com.cn>
---
 drivers/net/ethernet/dec/tulip/de2104x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index 13430f7..f1a2da1 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -585,7 +585,7 @@ static void de_tx (struct de_private *de)
 				netif_dbg(de, tx_done, de->dev,
 					  "tx done, slot %d\n", tx_tail);
 			}
-			dev_kfree_skb_irq(skb);
+			dev_consume_skb_irq(skb);
 		}
 
 next:
-- 
2.7.4


