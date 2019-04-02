Return-Path: <SRS0=b8iV=SE=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C640DC4360F
	for <linux-parisc@archiver.kernel.org>; Tue,  2 Apr 2019 10:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 932B02082C
	for <linux-parisc@archiver.kernel.org>; Tue,  2 Apr 2019 10:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="TKRLxxt4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730095AbfDBKVX (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 2 Apr 2019 06:21:23 -0400
Received: from mout.gmx.net ([212.227.17.20]:51009 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbfDBKVX (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 2 Apr 2019 06:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554200476;
        bh=Z4LmsfTCRiuCvNTx/ShbtwFlNW23ROvA9PcLu3rVsyo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=TKRLxxt4c9p66D7mWJ9zTAu4efqZK2Wk9WT/KFahkfKqeA+ejz9THEcYH8mKMeS1s
         tEggJiRAe+PlO1MH/MC6MoEeoXLNinQw9mAt8q1i+TQ1OW24TyPSFp2bCmhvoyBYpK
         mdfrCfHgPXpbPZLZUmrsuWEwmOCkWOM7c5c3gu00=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.133.0]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LtEtL-1gmQ4N0rTH-012rzg; Tue, 02
 Apr 2019 12:21:16 +0200
Date:   Tue, 2 Apr 2019 12:21:13 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Improve LASI LAN for QEMU
Message-ID: <20190402102113.GA16193@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:NVW7BkfFeCTZtS08XU94MM7H5qDlqk1OEaD41xvYPOdpjyqaaD0
 K2wND/8mU4/xSTzYPkcyVPTt5LvlQ4xneI9KKf5lzDcfH8R7fjhwvidGubo8+X8oyblZafW
 DyCUkqEcBbMQ0NC5G5z9sYMMhzZyQzPnirQBZ/QdQcjFBqKeyK+p9zK0eg2oIwKfIXVq+2e
 Mqj9S4gw43TdyZAU+k9Tw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:syo6OeEuRnQ=:NzVIxv1lEEi2Hrpy9PLWgz
 GNBiFL0OdMDQrGm39/XlARdWdGlTQvh6RLPy0ruN3ymVD7UP5ssE4qIzCUaplqUWCyGSyb4a0
 JFQ0NK7pnlU/tl+/mNtf/TKo1G48Cdg2ZNFzWrB/X9SuE+8pTq30NfGoriLtPiMAvIeZyyfX+
 KTN+WH+JAHNREdAOsgVHUsiPcRiZ6VCbcHsHMY7KvGuqx3h0I/Id7J4S2c1OIMQIACcxMkEJ3
 nN8PB4hm2T8ABEbDQk1NdwHIKRjZA8UtJsTKLXeSDJb/niGV3B2VCEM/icdFkNFEF7sMaTPf/
 2DWRkaGe8rQZrLjbK2ndpQgvj9wV25b6oPW5PfNQMb4LBaYOnKxOmrqXVXJDxxczoafy5LCdA
 ylYUMRQsZ4nD+d5uwVDRjs0VEHYXzjOPkFeWfcip3xK01bodQfSYxyfg/Ys1Jsjw/dh1BsqYK
 ksWUSGgLiag42FxadlvPYNVcRElHPnjFqE16apKHMkOP6eLhkolWNr/hdJAStTOoV81/jxdd5
 HEBxC5KvFvgSZCwXf0c+lzIFWxYTI4qRPLs5DI5bp5RciSbh8ber5l/WyoDiwAj2jOWLsVhMz
 DXe9DrdJxPtS83J4iB+I5TOnc5hUFUdxHp4nPYn8OkGxYAVBtJSRMPNNfACy4bLH8CzxMuPJo
 dsJ5sgrLLfRnLJ9AYRtoSFOQ+lJP5ob12PgCVk8VMiIQ1eNv3vsr7mLthaXNEW7BXctzFqqN+
 n5/QZqeQyRuiADRBpnap1WNbHv2zywJ31pPzMuFFsYcMnWFigHIK4x/4DaUhBTeTtP+T1L+Ip
 LRyBWrDE7UoVjVkxRpuYbgvLH4Ie1/+3f3fcaah712bf8SH5ORu8y+gySpCTY/Kw2usTVAGgk
 c2B5YRcjNBYRAz/+KaB7T50D2Etp6reykvQbIxRXD0DbmHSWognjSPUTFVsz8S
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Don't loose cycles when we run on QEMU, and fix one trivial typo.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/net/ethernet/i825xx/lasi_82596.c b/drivers/net/ethern=
et/i825xx/lasi_82596.c
index b69c622ba8b2..211c5f74b4c8 100644
=2D-- a/drivers/net/ethernet/i825xx/lasi_82596.c
+++ b/drivers/net/ethernet/i825xx/lasi_82596.c
@@ -105,7 +105,7 @@
 #define DMA_WBACK_INV(ndev, addr, len) \
 	do { dma_cache_sync((ndev)->dev.parent, (void *)addr, len, DMA_BIDIRECTI=
ONAL); } while (0)

-#define SYSBUS      0x0000006c;
+#define SYSBUS      0x0000006c

 /* big endian CPU, 82596 "big" endian mode */
 #define SWAP32(x)   (((u32)(x)<<16) | ((((u32)(x)))>>16))
@@ -141,7 +141,8 @@ static void mpu_port(struct net_device *dev, int c, dm=
a_addr_t x)
 	}

 	gsc_writel(a, dev->base_addr + PA_CPU_PORT_L_ACCESS);
-	udelay(1);
+	if (!running_on_qemu)
+		udelay(1);
 	gsc_writel(b, dev->base_addr + PA_CPU_PORT_L_ACCESS);
 }

