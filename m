Return-Path: <SRS0=lox0=Q2=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95650C43381
	for <linux-parisc@archiver.kernel.org>; Tue, 19 Feb 2019 15:16:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B3CA20700
	for <linux-parisc@archiver.kernel.org>; Tue, 19 Feb 2019 15:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfBSPQM (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 19 Feb 2019 10:16:12 -0500
Received: from verein.lst.de ([213.95.11.211]:52488 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727846AbfBSPQM (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 Feb 2019 10:16:12 -0500
Received: by newverein.lst.de (Postfix, from userid 2407)
        id DEF7668CEC; Tue, 19 Feb 2019 16:16:09 +0100 (CET)
Date:   Tue, 19 Feb 2019 16:16:09 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Meelis Roos <mroos@linux.ee>
Cc:     linux-parisc@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        iommu@lists.linux-foundation.org
Subject: Re: zalon scsi WARNINGs at kernel/dma/mapping.c:290
 dma_free_attrs+0x5c/0x84
Message-ID: <20190219151609.GA4121@lst.de>
References: <f7cf6b8f-671b-e01f-fa1f-6ca82c4af819@linux.ee>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7cf6b8f-671b-e01f-fa1f-6ca82c4af819@linux.ee>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Feb 19, 2019 at 12:57:18AM +0200, Meelis Roos wrote:
> I tried latest Linux on HP A180C (32-bit pa-risc). It works but the Zalon SCSI driver barfs warnings for GSC addon differential scsi board.
>
> The warnings seem to be DMA API related. Packaged 4.19 and self-compiled 5.0.0-rc7 exhibit the same problem.

It looks like the driver is trying to free DMA coherent memory with irqs
disabled, which is a big no-go on most non-coherent architectures (which
includes parisc).

The DMA coherent code in this driver is pretty convoluted, but I'll see
what I can do.  The warning has been there for a couple kernel release,
and the issue basically goes back to day 0 of support for non-coherent
architectures.
