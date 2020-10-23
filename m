Return-Path: <SRS0=k+cI=D6=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9EFC4363A
	for <linux-parisc@archiver.kernel.org>; Fri, 23 Oct 2020 02:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62F7B20790
	for <linux-parisc@archiver.kernel.org>; Fri, 23 Oct 2020 02:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603421125;
	bh=0yssn0qSGcB+Lc1xPbYBYkVh8R75x2IJEtE3LvKGViI=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=RiI5VMo+bC6VanizJBMyDegfwPFh04HUkd8bSL1KB1CA/0j6rpzJ99tx7yYf2WAS+
	 JslUwdFC7yCb8GP/2Y/p3K4di9qfRB3m2TxQ+2iutDgfHyzjlzLEQesufh+YW4Cv90
	 E7l2HMoAKxCF36oHFBP7lAHJ5l2lFrxqXq7lzAlo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S460236AbgJWCpY (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 22 Oct 2020 22:45:24 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46021 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S460237AbgJWCpY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Oct 2020 22:45:24 -0400
Received: by mail-pg1-f195.google.com with SMTP id 19so22279pge.12;
        Thu, 22 Oct 2020 19:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YixKmrm30sY9o+7/rbu6eu+lq+X0S/5/adkmWCbKRHI=;
        b=Y3RN0Q3cx95CMxF7vlqgVH60PuXL3VMD6wNa0iKVg4Z3xE6eNug55U8tTrZ8M8NByz
         H3eYN3zPH30lW39XdbKG23KL0z+ihmc20DIhoQaT21VrunWHtw6I/zhPU4eyziMZ/VBk
         Tb73YeEiRhMHBjneliKiGKwYL0Exz8eb4uKcXq0rWlqUFzmcsuIhCysZzI3WCJj0i/2d
         3lvBLT+E56/0Our9v9CtcIDXYRVLG1bDRqWxY9zVVokQ8cQZH5Qm7KUi3FZj5TtAxfJT
         Cbmxh/Y1/so3ZKG5tnqgdGG0wearjAwMidZEhQY063wDOwOCEoHV7P8ODPSwzidXOSQu
         ksUw==
X-Gm-Message-State: AOAM5306V/Lt5ObTomo9ForiQdxQciATKwB0G1cRX4NyTaUjPPstf2EQ
        63XnSMTJMzE8VdI/01eHlKwD7oM4xnc=
X-Google-Smtp-Source: ABdhPJy6oS2urB+1IPOO2f/0Tn5I1UfEaUUP8R6liojrzTu/Y8L1gjA802kf6Yt808rtB6h9iZn2mA==
X-Received: by 2002:a63:7d44:: with SMTP id m4mr293956pgn.223.1603421123595;
        Thu, 22 Oct 2020 19:45:23 -0700 (PDT)
Received: from localhost ([2601:647:5b00:1161:a4cc:eef9:fbc0:2781])
        by smtp.gmail.com with ESMTPSA id g8sm8015pjb.5.2020.10.22.19.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 19:45:22 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     netdev@vger.kernel.org
Cc:     davem@davemloft.net, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, lucyyan@google.com,
        moritzf@google.com, James.Bottomley@hansenpartnership.com,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH/RFC net v2] net: dec: tulip: de2104x: Add shutdown handler to stop NIC
Date:   Thu, 22 Oct 2020 19:45:20 -0700
Message-Id: <20201023024520.626132-1-mdf@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The driver does not implement a shutdown handler which leads to issues
when using kexec in certain scenarios. The NIC keeps on fetching
descriptors which gets flagged by the IOMMU with errors like this:

DMAR: DMAR:[DMA read] Request device [5e:00.0]fault addr fffff000
DMAR: DMAR:[DMA read] Request device [5e:00.0]fault addr fffff000
DMAR: DMAR:[DMA read] Request device [5e:00.0]fault addr fffff000
DMAR: DMAR:[DMA read] Request device [5e:00.0]fault addr fffff000
DMAR: DMAR:[DMA read] Request device [5e:00.0]fault addr fffff000

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---

Changes from v1:
- Replace call to de_remove_one with de_shutdown() function
  as suggested by James.

---
 drivers/net/ethernet/dec/tulip/de2104x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index f1a2da15dd0a..6de0cd6cf4ca 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -2180,11 +2180,19 @@ static int de_resume (struct pci_dev *pdev)
 
 #endif /* CONFIG_PM */
 
+static void de_shutdown(struct pci_dev *pdev)
+{
+	struct net_device *dev = pci_get_drvdata (pdev);
+
+	de_close(dev);
+}
+
 static struct pci_driver de_driver = {
 	.name		= DRV_NAME,
 	.id_table	= de_pci_tbl,
 	.probe		= de_init_one,
 	.remove		= de_remove_one,
+	.shutdown	= de_shutdown,
 #ifdef CONFIG_PM
 	.suspend	= de_suspend,
 	.resume		= de_resume,
-- 
2.28.0

