Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F6DC4332F
	for <linux-parisc@archiver.kernel.org>; Mon, 21 Nov 2022 13:16:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiKUNQi (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 21 Nov 2022 08:16:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiKUNQh (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Nov 2022 08:16:37 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C4A1E3F9
        for <linux-parisc@vger.kernel.org>; Mon, 21 Nov 2022 05:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=8Zxq5hWw3dwWVl94CNuif+2iRYCx3CT0GqUzeTrazVE=; b=SyvjYhlEwRWBlrCStiersLnd80
        451SbV7bHO6K3sGKIMyjTLheYvpbXjkP+wPPiqRea/UswW+hLRRKRCO1Sv8WM+bONXvvZP7nzaDfE
        e8qaAflvcAtkpBOVw/JJycvSFjQsRXS9GB2M4vXwCUx1jgeditQ0iMECKNhg8tM3deIlw2aqREhis
        iRpSQhB/uignjMvCLVA4W1IwHPHOVc2Fj1bhqeXYwSVsw5LX4emHsehSBPNOOQK1sf7m7C8OHPdIX
        TmSEjv27LsOpHPfAWDQcpr0PwyQiHeDfTtPrz48HLOfrmXRnCbe7aIlEvnWGTgxIVJ6hyvB3VYobg
        p2JUoZVQ==;
Received: from [2001:4bb8:199:6d04:9a88:dc19:c657:d17f] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ox6ew-00DwvD-A8; Mon, 21 Nov 2022 13:16:26 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, iommu@lists.linux.dev
Subject: RFC: switch to use the generic remapping dma-allocator
Date:   Mon, 21 Nov 2022 14:16:21 +0100
Message-Id: <20221121131623.228727-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi all,

currently parisc has it's own implementation of the dma-coherent
allocator that sets up PTEs with the uncached bit.  I can't see any
reason why using vmap to do the same kind of setup shouldn't work.
This small series shows how that could work, but due to a lack of
actual parisc hardware it is compile tested only and not only needs
a careful review but also actual testing on hardware.

Diffstat:
 arch/parisc/Kconfig               |    4 
 arch/parisc/include/asm/pgtable.h |    1 
 arch/parisc/kernel/pci-dma.c      |  446 +-------------------------------------
 include/linux/dma-map-ops.h       |    1 
 kernel/dma/Kconfig                |    3 
 kernel/dma/direct.c               |    4 
 6 files changed, 24 insertions(+), 435 deletions(-)
