Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB71CDB474
	for <linux-parisc@archiver.kernel.org>; Tue, 17 Oct 2023 18:41:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjJQSlC (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 17 Oct 2023 14:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjJQSlB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 Oct 2023 14:41:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047FD9F
        for <linux-parisc@vger.kernel.org>; Tue, 17 Oct 2023 11:41:00 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAB0C433C7;
        Tue, 17 Oct 2023 18:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697568059;
        bh=3IEw8BMxqwCSrUEO/pE/jEpEgxQAnzsLYyEI7GWBFEE=;
        h=From:To:Cc:Subject:Date:From;
        b=P6ns+uiMEZO+E0uI5a6woCP7kk1dzZjilkTDVffpyboO3880tNB/JmY6g5QxUyiCf
         O3ZWue8hihMZYyl6gXgVpb7V52t0PFhbgm+sZ/PXF4wrDmI3gyjROnLaaGI7cPHEVA
         oV2BfjOQjqh4kuiu1wW5xfG1dFixgF6JtColFypUD/q1r3BMm2EntjiCiITVLmteoo
         YNLy9JYwREqpNzZ6jvAd0oPJePjWKhsb7482xy6A1JvMhKo11VV0udYOfnOqQkgdVy
         Z4ZvBFLUq2sA4bQ49uXsTfVOhcCNMY/NcInqdXAncP7e5rsSXQu7d62JtvUrEwtQ1g
         IYUF+3hgiTkJw==
From:   deller@kernel.org
To:     linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: sba-iommu: Fix comment when calculating IOC number
Date:   Tue, 17 Oct 2023 20:40:45 +0200
Message-ID: <20231017184045.118155-1-deller@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Helge Deller <deller@gmx.de>

Signed-off-by: Helge Deller <deller@gmx.de>
---
 drivers/parisc/sba_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
index 05e7103d1d40..784037837f65 100644
--- a/drivers/parisc/sba_iommu.c
+++ b/drivers/parisc/sba_iommu.c
@@ -2007,7 +2007,7 @@ void * sba_get_iommu(struct parisc_device *pci_hba)
 	struct parisc_device *sba_dev = parisc_parent(pci_hba);
 	struct sba_device *sba = dev_get_drvdata(&sba_dev->dev);
 	char t = sba_dev->id.hw_type;
-	int iocnum = (pci_hba->hw_path >> 3);	/* rope # */
+	int iocnum = (pci_hba->hw_path >> 3);	/* IOC # */
 
 	WARN_ON((t != HPHW_IOA) && (t != HPHW_BCPORT));
 
-- 
2.41.0

