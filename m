Return-Path: <SRS0=ZKAb=CY=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFAEC43461
	for <linux-parisc@archiver.kernel.org>; Tue, 15 Sep 2020 04:25:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B054D20771
	for <linux-parisc@archiver.kernel.org>; Tue, 15 Sep 2020 04:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600143952;
	bh=Q2ur7bC///3muwspSIaWfLZzl54PCavMVtlfw6iaBPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=lEZpGP9PK53InRyp9Z+pPOOY/ACzu0WkQ+y+wvrtpWZXP9ydJ/bPkj6LRMbG+p9wZ
	 cq6M5hPGKQhozONcGoQQPb80Zo7kySUx0vxLo5ViEcyJBlacnZy23dZERkThdD0VPT
	 01FkDX+AUFLHR6q31o0ZV6lTpWAbPRjSUT1+casw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgIOEZ3 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 15 Sep 2020 00:25:29 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45793 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgIOEZI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 15 Sep 2020 00:25:08 -0400
Received: by mail-pl1-f193.google.com with SMTP id bh1so665246plb.12;
        Mon, 14 Sep 2020 21:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+J3UCnmg7D+m+RuZsfbFv8LhAw39Q6wjHS6C2zB0jTk=;
        b=Y9qSGvEpBON01XJMvD7wI6HJZ1OU/TjFC7m616ZvOZWCcW5T0DUDdhJBDBYmBnIYxM
         LoYBcY7t+U6+geSPyiZDX68pfKVLlQIgTLTUPqbKc1pq9PdV3yZFFV+Xc73Hh+Hy8z8Q
         NCzYF+h0sKwstm3lgsttr3jpyXkIXOrmzMhERpEZlkpZWZoGXL4f7x/QggQMnp1B6hX3
         CDK+dJfBmQfU1w/MLVfZBnrTfWOeHODVGodEYij4tZpw8YNeYvL2hy0/qcKiDBOZXK8X
         LTFpVY0wNsUqjuK20J0C+oJ8Jt+C5aZMsCt9PlmEX/GrplmUDOJ+quA3Q0myzGbhD8DC
         W/aA==
X-Gm-Message-State: AOAM530XFKMBwmIxxtu7628jdrtZg8r4itSSOBlXL6bixYV7yrAO9roV
        VtC9/pUSeK66SQkVYshTBKsd2OyDhctNlA==
X-Google-Smtp-Source: ABdhPJxIK5c0wk+11dlCt9T2YI8bLtCgH4oCjCK8z8tvXl6nTA1L5yFTZVPKmvaUGUqj49km944ykg==
X-Received: by 2002:a17:90a:5304:: with SMTP id x4mr2348592pjh.16.1600143907578;
        Mon, 14 Sep 2020 21:25:07 -0700 (PDT)
Received: from localhost ([2601:647:5b00:1162:1ac0:17a6:4cc6:d1ef])
        by smtp.gmail.com with ESMTPSA id a2sm11511070pfr.104.2020.09.14.21.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 21:25:07 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     davem@davemloft.net
Cc:     snelson@pensando.io, mst@redhat.com, hkallweit1@gmail.com,
        netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, moritzf@google.com,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH net-next v2 3/3] net: dec: tulip: de2104x: Replace kmemdup() with devm_kmempdup()
Date:   Mon, 14 Sep 2020 21:24:52 -0700
Message-Id: <20200915042452.26155-4-mdf@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915042452.26155-1-mdf@kernel.org>
References: <20200915042452.26155-1-mdf@kernel.org>
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
index 698d79bc4784..a3a002c8e9ac 100644
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

