Return-Path: <SRS0=3seb=N2=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BB7C43441
	for <linux-parisc@archiver.kernel.org>; Thu, 15 Nov 2018 20:06:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 206292086B
	for <linux-parisc@archiver.kernel.org>; Thu, 15 Nov 2018 20:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 206292086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbeKPGP7 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 16 Nov 2018 01:15:59 -0500
Received: from mout.gmx.net ([212.227.17.22]:36673 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbeKPGP7 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 16 Nov 2018 01:15:59 -0500
Received: from ls3530.dellerweb.de ([92.116.174.227]) by mail.gmx.com
 (mrgmx102 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MeMOx-1g75Xu1zIN-00QBpP; Thu, 15 Nov 2018 21:06:37 +0100
Date:   Thu, 15 Nov 2018 21:06:34 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix HP SDC hpa address output
Message-ID: <20181115200634.GA23364@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Provags-ID: V03:K1:UN0gweqsMXg4gn2gdd2S4+C1rvxwRwNhGeFcEidHlRpgfQRvOcP
 S9EWEEoUAE1oJNFvyVnoN9D0S3MMNYgy0LwgkkMclLuryXz/aG0wIxBO/JoT90QU92V9Ihf
 YbranftDAjgCPdfigMDvGlIInzWrfF7EglcEuF4zu8i+jZa3fOxH0dNmNldFK4Wu7gULCWF
 ybyuNpYQxOb2C1XXfoywQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:HYHMJupHQKU=:BTkwlvQPkp76NfiD7Rs7AS
 bjetP0r/ehuwSweSvSsYcqf1eefnrDNj2AgPwAfDu6f5Y3aMdDeczZNn9JlT1nopJZ2RGDFzR
 aPUSDX6WBXVWb6uU/HM+eSmykcBT4xKZYAyspbmh1vIe4EvEq393AM81l0+V5iMUwn5oPYM54
 WSpyWa4NReY1pLvj/AJ3vrt6AUo39Kl0kpadZyEzquUZIhzAxHwtfYgE8PrgDj3+SG0UMXdEI
 EK62lHNaTnw/5GmrqgZY953V/mSzbj3yxicBsSgGH/42KzaHPLjnJwPxjPL5fYPfrjFX7LLxb
 rFKXsFMALjRZDx0eCcMCh+muW6Xh+kAeLFuF9hSaZOAi6aH713DeB6D7/tWI1eAjkzqL1Xs72
 OzYrxpYiMTzrYnvJBNslT3KeSMZuUrQhp/o96hqhtTf4isajQ+KPDbSL4urfohy96phH6+AIC
 gHdqrq/QGqTdnqyO3Y6T+6PR+5DotNVL25bkx5e5jiYBVvPB5zCwJoitYqs4Zm+6vPzkt2g9I
 yfdyi6Yj+u9i08rGOnSL4uClZBf0pgc60AQpaKJMyhzw2YRqnpz9GOl9DheVUAgWgKNV94RUG
 szvGwpVcw9hVlT9Hr41ZFQrgArluzDE3RrXH6fjKkVQtZ6sRoop/pX4Ya3T6bhDwuMyNeYEIc
 aLJgA7D4K+I0mWwvMbSRDAZlvNTVdnfIH0INPeUb7wlG03UVuIJfL9IMMtqiQjDIDKwsQSfun
 WJLgDJWyMYm81mUfao/Rk9VZhS+odtWg4EIQoPew+zL2ojS2KuGumdhN3wzzqO14OlhemOLcJ
 hVgSpkoi7fCe8oH7aGMUl3reW9s8aMdVA4z9dYMFdbH8ainLuyVBzXtkHwzQ0Wh1UIsNU72e8
 pH96FSJPhsO6//JBysQEIL7ki8HJ2ZLcspEmXZzuY=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Show the hpa address of the HP SDC instead of a hashed value, e.g.:
HP SDC: HP SDC at 0xf0201000, IRQ 23 (NMI IRQ 24)

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
index 0b8a25c58d02..5a154fc1886e 100644
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -884,8 +894,8 @@ static int __init hp_sdc_init(void)
 			"HP SDC NMI", &hp_sdc))
 		goto err2;
 
-	printk(KERN_INFO PREFIX "HP SDC at 0x%p, IRQ %d (NMI IRQ %d)\n",
-	       (void *)hp_sdc.base_io, hp_sdc.irq, hp_sdc.nmi);
+	pr_info(PREFIX "HP SDC at 0x%08lx, IRQ %d (NMI IRQ %d)\n",
+	       hp_sdc.base_io, hp_sdc.irq, hp_sdc.nmi);
 
 	hp_sdc_status_in8();
 	hp_sdc_data_in8();
