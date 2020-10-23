Return-Path: <SRS0=k+cI=D6=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BA3C388F9
	for <linux-parisc@archiver.kernel.org>; Fri, 23 Oct 2020 20:30:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A655920FC3
	for <linux-parisc@archiver.kernel.org>; Fri, 23 Oct 2020 20:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603485046;
	bh=7gyCT5hBx+86D6/qHTXvebn2exDw156QtpiTQGAlCN8=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=QgBBxddpvP0WavqcqxBMpXcLbt5OW8gKv2fzS6ClTRmNS3qr9NgINfDlJFAGof5vJ
	 bbtalvYs467gcyHRlNU6YAhUfZhv3eFxlxlohJR5i/YsAp7j1KZwZjhH8JpGiYm18C
	 kNRqA/IeW+9buIKm2u8ikVLLLgS9Wk3B6+BrI43E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756091AbgJWUaq (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 23 Oct 2020 16:30:46 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45601 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756089AbgJWUaq (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 23 Oct 2020 16:30:46 -0400
Received: by mail-pg1-f194.google.com with SMTP id 19so2171830pge.12;
        Fri, 23 Oct 2020 13:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MKY2uUU7e614hoiweINhwcRyaCwzzO8pKsLTU7KZm9c=;
        b=asY8A7o4L9JaJAkUbQDUak4SQElh7yQ9kdo6DODz1qZHluN6L/I9HPFPCeau7yHbw3
         akocQKwq7jYpNG2IG1HrwL7iEr7Z+2wuv0h4i+ufrfBfIxf9fCF6pW8UjvGp1I09DNfB
         zncLf+e3jG8H1ljRBSND6CSrq9eNrdWKNKuTQsxzA9dGIsvmKtcvfZl9nTw9mK9x/iC/
         lPN1kLC7r6ssjKo8DBBLVd6zMc/UpQi3WGqegu5JQ4Ppizusg5wKjVmYmoJcRPw8NPlE
         C+KOz0fFqgGlDKcGfQl52vJ3RB3KcLblRY9RRipzmn6e5cQecFw52qiY7X4SrYgtO72P
         /QQQ==
X-Gm-Message-State: AOAM532xx779lKMKhyhZNkCpT1SNXvsS8FBOnNN65YqhyxUki2FfNrAo
        nA5d4QJsUCggt4r/tyJqh5xI9HZTTTY=
X-Google-Smtp-Source: ABdhPJw7vBg/2DYX50TXenouXLeq9Xi/Lyxur1tOBaf4pYqMSaJMzF6WZGy5a3NNcpZZekr+PH5whg==
X-Received: by 2002:a62:e104:0:b029:152:4f37:99da with SMTP id q4-20020a62e1040000b02901524f3799damr841514pfh.17.1603485044953;
        Fri, 23 Oct 2020 13:30:44 -0700 (PDT)
Received: from localhost ([2601:647:5b00:1161:a4cc:eef9:fbc0:2781])
        by smtp.gmail.com with ESMTPSA id g1sm3757346pjj.3.2020.10.23.13.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 13:30:44 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     netdev@vger.kernel.org
Cc:     davem@davemloft.net, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, lucyyan@google.com,
        moritzf@google.com, James.Bottomley@hansenpartnership.com,
        kuba@kernel.org, Moritz Fischer <mdf@kernel.org>
Subject: [PATCH/RFC net-next v3] net: dec: tulip: de2104x: Add shutdown handler to stop NIC
Date:   Fri, 23 Oct 2020 13:28:34 -0700
Message-Id: <20201023202834.660091-1-mdf@kernel.org>
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

I'd consider it a bug-fix but Jakub said it's a feature,
so net-next it is. I don't have a strong preference either way.

Changes from v2:
- Changed to net-next
- Removed extra whitespace

Changes from v1:
- Replace call to de_remove_one with de_shutdown() function
  as suggested by James.

---
 drivers/net/ethernet/dec/tulip/de2104x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index d9f6c19940ef..ea7442cc8e75 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -2175,11 +2175,19 @@ static int __maybe_unused de_resume(struct device *dev_d)
 
 static SIMPLE_DEV_PM_OPS(de_pm_ops, de_suspend, de_resume);
 
+static void de_shutdown(struct pci_dev *pdev)
+{
+	struct net_device *dev = pci_get_drvdata(pdev);
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
 	.driver.pm	= &de_pm_ops,
 };
 
-- 
2.28.0

