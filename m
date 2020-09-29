Return-Path: <SRS0=x+in=DG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88D1C4727C
	for <linux-parisc@archiver.kernel.org>; Tue, 29 Sep 2020 15:33:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A9D120773
	for <linux-parisc@archiver.kernel.org>; Tue, 29 Sep 2020 15:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a1wR2tdy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgI2PdS (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 29 Sep 2020 11:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgI2PdS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 29 Sep 2020 11:33:18 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4216C061755
        for <linux-parisc@vger.kernel.org>; Tue, 29 Sep 2020 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=n4BRRpUc7wK1i30tAN98D0lez3CjxiwNxG8MmasIhYI=; b=a1wR2tdy4aiNSYsZbIczL/zsGy
        SrfMqiIjn0tXK8QJI+c/aIe5+sucHqNG+TpgxybN3UknmXOE+GkerdVxfoLzXm8rB35g9L6GY2X/w
        WpjFZ8TsCvoj462d85BVILV1iyhBhJN+uiN1bUUv8og7BqTq1sGGff3STy/BDDDbZenllXg/R3RWi
        TROA+XypmoJ56Vy8vmL8xThN7VvPgCOwYbO/pWHhkeAVDk8e0L/I+Q7pBoAogKZNlza+ws8YlmRHj
        +FFihBQQDULB0AWMQWGP6m02NI1Nl+/AoO63ZG9XxujzK543sX7onqaWsf2oGoRn1RRP0C5Wob3wH
        uwqUPL5A==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNHcy-00011A-Fa
        for linux-parisc@vger.kernel.org; Tue, 29 Sep 2020 15:33:16 +0000
Date:   Tue, 29 Sep 2020 16:33:16 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-parisc@vger.kernel.org
Subject: Page tables on machines with >2GB RAM
Message-ID: <20200929153316.GG20115@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


I think we can end up truncating a PMD or PGD entry (I get confused
easily about levels of the page tables; bear with me)

/* NOTE: even on 64 bits, these entries are __u32 because we allocate
 * the pmd and pgd in ZONE_DMA (i.e. under 4GB) */
typedef struct { __u32 pgd; } pgd_t;
...
typedef struct { __u32 pmd; } pmd_t;

...

        pgd_t *pgd = (pgd_t *)__get_free_pages(GFP_KERNEL,
                                               PGD_ALLOC_ORDER);
...
        return (pmd_t *)__get_free_pages(GFP_PGTABLE_KERNEL, PMD_ORDER);

so if we have more than 2GB of RAM, we can allocate a page with the top
bit set, which we interpret to mean PAGE_PRESENT in the TLB miss handler
and mask it off, causing us to load the wrong page for the next level
of the page table walk.

Have I missed something?

Oh and I think this bug was introduced in 2004 ...
