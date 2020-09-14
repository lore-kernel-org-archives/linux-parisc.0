Return-Path: <SRS0=UiOX=CX=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EABAC43461
	for <linux-parisc@archiver.kernel.org>; Mon, 14 Sep 2020 00:10:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BDC5206F4
	for <linux-parisc@archiver.kernel.org>; Mon, 14 Sep 2020 00:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600042249;
	bh=mI0Z46BeTgrRH8d90eBVCmaNhGN9agKXVbvkJSHAkEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=QE3Be1EHKCKtT4vYoEvLrnDRFO6OIUFTmWkQkQtDCQJgZmZRF0ABV9/jO0K1R5EOZ
	 oq6cWd/zjPznqV3seuRBkXnzvx8Cbdxd8KfyHW0rNQpDbsT8RqZxh1+El51OJHXiF+
	 vwjv7oYqT0TMVHhKCBPzz43i6pCXXhpQqzRSdNKs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgINAKq (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 13 Sep 2020 20:10:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33820 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgINAKZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 13 Sep 2020 20:10:25 -0400
Received: by mail-pf1-f194.google.com with SMTP id v196so11191980pfc.1;
        Sun, 13 Sep 2020 17:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UTwkJhk6Y2vTZoj4Ta3v96czw38a4mqiyM96g/YQmOA=;
        b=Q8t+IUs80r9LF2OoyZnSpBlteb5oR1lUxZpuYvmHRBAgkbKAyk0JxPHEMyQ3VQZQxM
         W1tQSQs0KJIbWfVlCn1rH+bJ7fTwR2wE6BUsHiYbDCgBGv2ClUw1BwjG+Y2SA6LEvaTX
         J6rNUOSmm13aky+TBnrl+dHreSvwLMXzjH8kOOyQ2wuHj70M68l/TEJPPaPohp/e4s4v
         5WJyOyYhwxMefv6f1KpXVNNTxx8CSKCQS8i9WVj3/6nLiI3JClGkNbiXg3JE5lh919tH
         SduU8pIR/hCMTYMxBg1X53HLAUvnZBSzNQdiRqiC4aqi1xY7sTLd9iJgWJ8bXo17hww7
         akhg==
X-Gm-Message-State: AOAM533lQ92swOn4u/f2vgRmL9M28tkxguunqfLjWO9Lp1rfIr/3NvZH
        sL7W41PjjHP/lPioxEgaBio=
X-Google-Smtp-Source: ABdhPJyvquJTdeCghJnglCuGVwoY4Z2M6qO8FPxhhC4znt5g3ikG1wYAeVY6JsfaazFdXN6AwNY7Fg==
X-Received: by 2002:aa7:96b0:: with SMTP id g16mr10905016pfk.46.1600042224437;
        Sun, 13 Sep 2020 17:10:24 -0700 (PDT)
Received: from localhost ([2601:647:5b00:1162:1ac0:17a6:4cc6:d1ef])
        by smtp.gmail.com with ESMTPSA id ca6sm7215530pjb.53.2020.09.13.17.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 17:10:24 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     davem@davemloft.net
Cc:     snelson@pensando.io, mst@redhat.com, hkallweit1@gmail.com,
        netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, moritzf@google.com,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH net-next 3/3] net: dec: tulip: de2104x: Replace kmemdup() with devm_kmempdup()
Date:   Sun, 13 Sep 2020 17:10:02 -0700
Message-Id: <20200914001002.8623-4-mdf@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914001002.8623-1-mdf@kernel.org>
References: <20200914001002.8623-1-mdf@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Replace an instance of kmemdup() with the devres counted version
instead.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 drivers/net/ethernet/dec/tulip/de2104x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index e4189c45c2ba..4933799c6a15 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -1940,7 +1940,8 @@ static void de21041_get_srom_info(struct de_private *de)
 			de->media[i].csr15 = t21041_csr15[i];
 	}
 
-	de->ee_data = kmemdup(&ee_data[0], DE_EEPROM_SIZE, GFP_KERNEL);
+	de->ee_data = devm_kmemdup(&de->pdev->dev, &ee_data[0], DE_EEPROM_SIZE,
+				   GFP_KERNEL);
 
 	return;
 
@@ -2092,7 +2093,6 @@ static int de_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return 0;
 
 err_out_iomap:
-	kfree(de->ee_data);
 	iounmap(regs);
 err_out_res:
 	pci_release_regions(pdev);
@@ -2106,7 +2106,6 @@ static void de_remove_one(struct pci_dev *pdev)
 
 	BUG_ON(!dev);
 	unregister_netdev(dev);
-	kfree(de->ee_data);
 	iounmap(de->regs);
 	pci_release_regions(pdev);
 }
-- 
2.28.0

