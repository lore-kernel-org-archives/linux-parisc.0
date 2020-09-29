Return-Path: <SRS0=x+in=DG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4050BC2D0A8
	for <linux-parisc@archiver.kernel.org>; Tue, 29 Sep 2020 01:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05DE12075A
	for <linux-parisc@archiver.kernel.org>; Tue, 29 Sep 2020 01:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601343239;
	bh=omDmb/EHkfaofnfyWtsh79Yx1RS9yvzCCe9Y5cUMIIs=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=MUA3vns8x8fWNnDo8KEhY7OVBz0ErHEYKN+/RFAlrEYkIipK87ZCathuyCLVNi22h
	 lE8dEFFKabkb2ePKO5F6Loc8689Schk108tixmNX9unUTtUZ3AVGaGcKx1sarDj4Lc
	 dXpmTybhIDf2/rHzQx6Mes7EXUCekG6YTUKTMTzU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbgI2Bd3 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 28 Sep 2020 21:33:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:41822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727763AbgI2BcH (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 28 Sep 2020 21:32:07 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEEDA22204;
        Tue, 29 Sep 2020 01:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601343119;
        bh=omDmb/EHkfaofnfyWtsh79Yx1RS9yvzCCe9Y5cUMIIs=;
        h=From:To:Cc:Subject:Date:From;
        b=hr7N6wSzJ4VjjGCK8H0/jiAvFF32k0WzYLmQaqkqV4ahPMcpSb8zofFjtK0DTURcx
         cjygfLNkeDr/GoNd+8tO4Ssry8XGK2L4aEB6n3nA7uVqWJSOdSfuK6m+i03ODQQe1e
         COnVunG549U2FmOosOWguYzbfAdncAErjotg/6mI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Lucy Yan <lucyyan@google.com>, Moritz Fischer <mdf@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 1/5] net: dec: de2104x: Increase receive ring size for Tulip
Date:   Mon, 28 Sep 2020 21:31:53 -0400
Message-Id: <20200929013157.2407108-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Lucy Yan <lucyyan@google.com>

[ Upstream commit ee460417d254d941dfea5fb7cff841f589643992 ]

Increase Rx ring size to address issue where hardware is reaching
the receive work limit.

Before:

[  102.223342] de2104x 0000:17:00.0 eth0: rx work limit reached
[  102.245695] de2104x 0000:17:00.0 eth0: rx work limit reached
[  102.251387] de2104x 0000:17:00.0 eth0: rx work limit reached
[  102.267444] de2104x 0000:17:00.0 eth0: rx work limit reached

Signed-off-by: Lucy Yan <lucyyan@google.com>
Reviewed-by: Moritz Fischer <mdf@kernel.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/dec/tulip/de2104x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index cadcee645f74e..11ce50a057998 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -91,7 +91,7 @@ MODULE_PARM_DESC (rx_copybreak, "de2104x Breakpoint at which Rx packets are copi
 #define DSL			CONFIG_DE2104X_DSL
 #endif
 
-#define DE_RX_RING_SIZE		64
+#define DE_RX_RING_SIZE		128
 #define DE_TX_RING_SIZE		64
 #define DE_RING_BYTES		\
 		((sizeof(struct de_desc) * DE_RX_RING_SIZE) +	\
-- 
2.25.1

