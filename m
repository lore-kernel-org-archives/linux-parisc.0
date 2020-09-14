Return-Path: <SRS0=UiOX=CX=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5BAC433E2
	for <linux-parisc@archiver.kernel.org>; Mon, 14 Sep 2020 00:10:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 230A0221E7
	for <linux-parisc@archiver.kernel.org>; Mon, 14 Sep 2020 00:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600042224;
	bh=TA+MXMLRb5cCWNKjIr+v/ilNC868VuI0Vn55BkifVqk=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=WjLbARzmgRIEag7oTtaixjiXSCDwqRGttjJaxGffjCx09Vm1rzOQABwCkPFTV5diF
	 9QKCcH5AVdtCbXIyw8y0Cxno7914v1TUVxkSOjeA9sJSpdi1qWU4IMD4AE4PWmDOdJ
	 R2rhob3vwXFmq8Z9lwfeXwIW3Fx9BtT7VXKsZ4Fw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgINAKW (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 13 Sep 2020 20:10:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36779 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgINAKV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 13 Sep 2020 20:10:21 -0400
Received: by mail-pf1-f195.google.com with SMTP id d9so11065820pfd.3;
        Sun, 13 Sep 2020 17:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2020vfOHleSMQ3jNTKteIb40lgQ8OD0M2UcF4a1cpLM=;
        b=NVvy3+3IDjEy5PsRTcxZFAmYjuJsbPFQtnQgG94FSpF+F2h2joy20D7GxLnVRM35cu
         eFga+Mi5BPi7BTHaO87fQZg/xv83G+JieBuQ4N0cPU5LdmEyyZtFW6Rnnv4pkIjK0Vlm
         DP+fIE7xk5SN7VPO+yi3wmThDE7yRJu64OPshaHK79GWxTr2WFgKFMyhJoBvJCdsMxBk
         MAd3Fgs2TOxLWMyWrGdY4UVqS1VEsL/QAQErTa7IXiM7LKzzVvyJkmO5WXKEJ3OfP082
         TvYAkvkbdqGbc9JXVLO38ZMwufwXPyZ58VVn3sZUdjebcAt7rRYUzrdXiRGSndjXN4w4
         lLaA==
X-Gm-Message-State: AOAM532HzL3xVfLG6VUKmp+VmqQGJ4dPxBpKphebec31aT3XRE30c2Je
        L+OwrfbRLfAr80SriIQw1T0=
X-Google-Smtp-Source: ABdhPJwYmUoHSk6yFuRytkiZU8vE8XqmEgZT0AUfa2O03802SdSttyg6JSnd5b49hy2fAlJw/iZtIg==
X-Received: by 2002:a17:902:b703:: with SMTP id d3mr11661654pls.148.1600042220533;
        Sun, 13 Sep 2020 17:10:20 -0700 (PDT)
Received: from localhost ([2601:647:5b00:1162:1ac0:17a6:4cc6:d1ef])
        by smtp.gmail.com with ESMTPSA id i30sm6725093pgn.49.2020.09.13.17.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 17:10:19 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     davem@davemloft.net
Cc:     snelson@pensando.io, mst@redhat.com, hkallweit1@gmail.com,
        netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, moritzf@google.com,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH net-next 0/3] First bunch of cleanups
Date:   Sun, 13 Sep 2020 17:09:59 -0700
Message-Id: <20200914001002.8623-1-mdf@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This series is the first bunch of minor cleanups for the de2104x driver
to make it look and behave more like a modern driver.

These changes replace some of the non-devres versions with devres
versions of functions to simplify the error paths.

Next up after this will be the ioremap part.

Moritz Fischer (3):
  net: dec: tulip: de2104x: Replace alloc_etherdev by
    devm_alloc_etherdev
  net: dec: tulip: de2104x: Replace pci_enable_device with devres
    version
  net: dec: tulip: de2104x: Replace kmemdup() with devm_kmempdup()

 drivers/net/ethernet/dec/tulip/de2104x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

-- 
2.28.0

