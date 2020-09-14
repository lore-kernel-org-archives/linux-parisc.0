Return-Path: <SRS0=UiOX=CX=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC44C433E2
	for <linux-parisc@archiver.kernel.org>; Mon, 14 Sep 2020 00:11:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00E7D20796
	for <linux-parisc@archiver.kernel.org>; Mon, 14 Sep 2020 00:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600042275;
	bh=mXEIkAeWmof5ugfFnfVi6Fzy744+20FKyxI+6m3Vng8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=eiEf9yJiUUe19FcsEVHLUzb2Ri1Nu8HaLEVWE1TEMpo5Xa43oeLXi3A+CO0cmPQL0
	 PxzRQbLpQj+U04+nnPlkFPZ4/SFsSQYxIwcMtT8Yfq4ujELACxrVLb9/k+Xz08OT7w
	 VNC8cKbF8VaEdjaH7NNxyreCPoqA35DqFJtSLvZQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgINALE (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 13 Sep 2020 20:11:04 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37867 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgINAKW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 13 Sep 2020 20:10:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id w7so11070089pfi.4;
        Sun, 13 Sep 2020 17:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=deF/Fb8nYOYqTWT29+DXa40R35LsuxAmpivI4tm7Tbc=;
        b=W1LzuLgJeZW9Yedi1drsymptTLwJ23GrqDvMI/e1s7vtaeGzcHGdY7P8Q/hJk7KaR+
         cHXHoSIWCeg2SLlJWXw0yAAE9EuG+3MEgXqx4aBg0D7CC70+8d2diznIsbjTZ4BWhJiS
         oJir4+i6LGy+edpFXIBKRyNlRbUsbqxjqsx4lc+nl8JxaBTkenpuqKxLNrn1hUOAABLq
         KZ80oJVxzeTRiDnxXKke4PwkSDZqWS8DX3aqe42fA9w272oANB6S2In0e5LMeQq3kmuW
         YOK4wKzT83pOc4tApxmnvvwloxf8Fb+N3FR+zMEVD13Kg+SYRJzCLB4sVgZRBs3SuIa1
         xE5Q==
X-Gm-Message-State: AOAM531jFnbbBvEQAbgqKDcBXzuPklJqYj9t7oE6faQqiCXEatm82GnS
        +kaY6nvUXPT+vjUYkcILu9Y=
X-Google-Smtp-Source: ABdhPJwL1J8pgl2Sj5df6lSXoxywXpJD5J+4RXUVVEu3/fUT2ghEKo9cyyWvPsn8Cyi4SKeN/AOg1g==
X-Received: by 2002:a62:5a42:: with SMTP id o63mr11020997pfb.50.1600042221845;
        Sun, 13 Sep 2020 17:10:21 -0700 (PDT)
Received: from localhost ([2601:647:5b00:1162:1ac0:17a6:4cc6:d1ef])
        by smtp.gmail.com with ESMTPSA id w19sm8482455pfq.60.2020.09.13.17.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 17:10:21 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     davem@davemloft.net
Cc:     snelson@pensando.io, mst@redhat.com, hkallweit1@gmail.com,
        netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, moritzf@google.com,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH net-next 1/3] net: dec: tulip: de2104x: Replace alloc_etherdev by devm_alloc_etherdev
Date:   Sun, 13 Sep 2020 17:10:00 -0700
Message-Id: <20200914001002.8623-2-mdf@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914001002.8623-1-mdf@kernel.org>
References: <20200914001002.8623-1-mdf@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Replace devm_alloc_etherdev() with its devres version.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 drivers/net/ethernet/dec/tulip/de2104x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index 42b798a3fad4..9bcfc82b71d1 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -1986,7 +1986,7 @@ static int de_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 #endif
 
 	/* allocate a new ethernet device structure, and fill in defaults */
-	dev = alloc_etherdev(sizeof(struct de_private));
+	dev = devm_alloc_etherdev(&pdev->dev, sizeof(struct de_private));
 	if (!dev)
 		return -ENOMEM;
 
@@ -2011,7 +2011,7 @@ static int de_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* wake up device, assign resources */
 	rc = pci_enable_device(pdev);
 	if (rc)
-		goto err_out_free;
+		return rc;
 
 	/* reserve PCI resources to ensure driver atomicity */
 	rc = pci_request_regions(pdev, DRV_NAME);
@@ -2098,8 +2098,6 @@ static int de_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_release_regions(pdev);
 err_out_disable:
 	pci_disable_device(pdev);
-err_out_free:
-	free_netdev(dev);
 	return rc;
 }
 
@@ -2114,7 +2112,6 @@ static void de_remove_one(struct pci_dev *pdev)
 	iounmap(de->regs);
 	pci_release_regions(pdev);
 	pci_disable_device(pdev);
-	free_netdev(dev);
 }
 
 #ifdef CONFIG_PM
-- 
2.28.0

