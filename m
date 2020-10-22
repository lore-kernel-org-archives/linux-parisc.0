Return-Path: <SRS0=DBC2=D5=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CBCC5517A
	for <linux-parisc@archiver.kernel.org>; Thu, 22 Oct 2020 22:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DA4524650
	for <linux-parisc@archiver.kernel.org>; Thu, 22 Oct 2020 22:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603404406;
	bh=SNbi8U3XKzy+9nfyyZZEQn1k29/k5d3PA32YN6RzYdk=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=SnICmo3p4PHKv7/9RiwsJFQVekAeSsPJHP8EFTUo5X4YL8/cc1MVt79+XzHjzHfpK
	 iDWCWXbCnX+Rs5C2Nju6kyVCmcBXFuMbQPkxhYH0pSWgDZShYAhbC8vZ5Gg/NZlZYM
	 zWhkBJFNdnDEuAJkepgPMP3da7GPVLa42T5Obp5c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369748AbgJVWGq (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 22 Oct 2020 18:06:46 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41110 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S368409AbgJVWGp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Oct 2020 18:06:45 -0400
Received: by mail-pl1-f196.google.com with SMTP id w11so1695843pll.8;
        Thu, 22 Oct 2020 15:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+enCxotH+kmc1TrTmn5Bz3JZSiOi3hjf0Ra5CEWhKy8=;
        b=p7blkZjyQEZUxhgYmSpxI2Cx496gT+M/Ot54kAqpeuJ/uDmYnPHIHVm0wUCaiDfffW
         7QSHc59t2evmwd2NZlh07r74BDcGy4ECdKqVgXktpO4oXF0cnkvrLfgHbVnj80D8h4Wy
         YXkbyr7pWJoyJcLWHwzt6omSNfdCeSXfFJ6JxeJFfZwenW6o8mE33xJ/DPU+jo/H03km
         MTuqCXQswoFgQIrhPtEOlLkyOPExTMUFKmgNn3YHCmhExcgbFM8cCW8FAEb5UmTv3RWj
         gui0dFIzq0fIVLc712IQ1N2RbhflaL75yYzazPhVPCNxOe6TLnHyDmTAAgt2qHaSyT8e
         2ijQ==
X-Gm-Message-State: AOAM532ac3rSxVfWDucwbFpIjYcZav6rtLYgKReBmTJyWvE08auiU+Yr
        VvdnCjCDgFL0HLiydYGahah3CH4NP8o=
X-Google-Smtp-Source: ABdhPJyvDbqN8ChzQhos/Cij/9qSB9jFZhTGdwSSUFr4lOxQy2Ag+BpW219QUi4T2tjYGnsrwlBuPA==
X-Received: by 2002:a17:902:6942:b029:d6:18b0:8a with SMTP id k2-20020a1709026942b02900d618b0008amr2867632plt.23.1603404405042;
        Thu, 22 Oct 2020 15:06:45 -0700 (PDT)
Received: from localhost ([2601:647:5b00:1161:a4cc:eef9:fbc0:2781])
        by smtp.gmail.com with ESMTPSA id z73sm3348029pfc.75.2020.10.22.15.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 15:06:44 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     netdev@vger.kernel.org
Cc:     davem@davemloft.net, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, lucyyan@google.com,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH/RFC net] net: dec: tulip: de2104x: Add shutdown handler to stop NIC
Date:   Thu, 22 Oct 2020 15:06:36 -0700
Message-Id: <20201022220636.609956-1-mdf@kernel.org>
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

Hi all,

I'm not sure if this is the proper way for a shutdown handler,
I've tried to look at a bunch of examples and couldn't find a specific
solution, in my tests on hardware this works, though.

Open to suggestions.

Thanks,
Moritz

---
 drivers/net/ethernet/dec/tulip/de2104x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index f1a2da15dd0a..372c62c7e60f 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -2185,6 +2185,7 @@ static struct pci_driver de_driver = {
 	.id_table	= de_pci_tbl,
 	.probe		= de_init_one,
 	.remove		= de_remove_one,
+	.shutdown	= de_remove_one,
 #ifdef CONFIG_PM
 	.suspend	= de_suspend,
 	.resume		= de_resume,
-- 
2.28.0

