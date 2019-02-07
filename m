Return-Path: <SRS0=bQ1H=QO=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A055C282C2
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 21:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 078912146E
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 21:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfBGVcJ (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 7 Feb 2019 16:32:09 -0500
Received: from mout.gmx.net ([212.227.17.21]:58731 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbfBGVcJ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 7 Feb 2019 16:32:09 -0500
Received: from ls3530.dellerweb.de ([92.116.171.129]) by mail.gmx.com
 (mrgmx101 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LsgvV-1hGEf33g1R-012J9A; Thu, 07 Feb 2019 22:32:00 +0100
Date:   Thu, 7 Feb 2019 22:31:57 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: Add PDC_CRASH_PREP PDC function number
Message-ID: <20190207213157.GA6726@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:aq9M2QeIdvT0iT3EhfbPnlm0Cux6sjnCHo2NYekCqQbh0Pp/Q9D
 YXWKxIJhborT3vP2kZo9KalAn386qEdr6di2cTo5kUZjI1qtxNqUmGQ9RmaIBkd8Bnb/YXo
 MUDvqb+GJbBbctJAeyrQiI7a5blZ6vfBBnEEvi4iaEIT3ZV0byib5st3SS0Fx2FIdzHAG+v
 2j3uGzJ0fwZYCznAXQO7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:c/cnzjqYW9E=:QVqhIIlpXYAgkYsZYIoL8l
 3rp2erLHKdW2nmrZ98eqsA8QMz+Ihb0vxdZM0BAHBiKzLq+yxIxGmMyPqcs+eogCxIN/Sod1W
 WN/t0oRe7QebwU80mG7RW/vYb/AJ4iTy9WcJ16xxKYaDO2mqyYyFQHRG3v0HyjKo3M6kpEuUa
 albECo2nJkhi3XBI/gMs6BCGIq82rtXR5qvjUn8yrHG5991/EpRYjp4Tvn+k+3/bBNj40GFuj
 OM7sEJj0NuRr0UrQQ8hxY5N3ZjhU00Izx6M0F4pacTn5W4+iAljmi8NGooCLJYSltyfG+KKns
 oR2wtwFvAew/MKIIxJnYvXH+/eG4wFbcy8zIVSS57ApNFkbIX6pp2Xgdh2VKl29QxiYpB3dpf
 LNOLVz5BgI6nJFVegsQAj/5R+qMTg9SaVg+sdyG7EiXBx/m4vxHFx19gcBha2qm8J6Cyjdr49
 +976mUpThtu/d3cMRdePYqgu1jCIr+Bez4eOY2XXZd4XcStItOiZnJJFwItclThNVHEkvt+cZ
 y5vq3zKSpBBhHwhHmUbmwCLV1jJeCR3PUf1R54JTlbgIiV2PF6nr/uz0xnM8+k77Be8uVyGcF
 75XO0vxDIZT03cRLk2uqyHY+yZADfkrbzJy5iraGDi96AzGZj0cLZ6uYXzQq3nDOFSLKDO94E
 /48xHzd1gmLNzpqTX2f8WEQc/SMceAwBrtwjmcS9MTpxSLp48qnJRQOJdYTuERA1+52aIPHYy
 DZSpjtoc4C8aprO7grqgRdb3KhhtN5Z24Re4ZBsnkAO9vOId1fMw+YwZ5QaCR+avf74FZ0TPt
 g8pszit5EH18f42aVAxW2SevrdPSKilKxpgt41JeVpYL3UGNhxLa+84jrT5r8tCV8o5d3IF3W
 cSLdZcQ4hM0Rl0Ut5beRAtZkvp21PVJiKWshIQDevmvOba6iYvtpnLUv1rOVv3
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Signed-off-by: Sven Schnelle <svens@stackframe.org>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi/asm/pdc.h
index 593eeb573138..6d68bda2d261 100644
--- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -167,6 +167,7 @@
 #define PDC_SOFT_POWER_INFO	0	/* return info about the soft power switch */
 #define PDC_SOFT_POWER_ENABLE	1	/* enable/disable soft power switch */
 
+#define PDC_CRASH_PREP 25		/* Prepare system for crash dump */
 
 /* HVERSION dependent */
 
