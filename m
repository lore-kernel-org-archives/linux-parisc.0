Return-Path: <SRS0=noE3=OI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF444C18DF5
	for <linux-parisc@archiver.kernel.org>; Thu, 29 Nov 2018 18:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 904932146F
	for <linux-parisc@archiver.kernel.org>; Thu, 29 Nov 2018 18:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 904932146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbeK3GCC (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 30 Nov 2018 01:02:02 -0500
Received: from verein.lst.de ([213.95.11.211]:45630 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725871AbeK3GCC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 30 Nov 2018 01:02:02 -0500
Received: by newverein.lst.de (Postfix, from userid 2407)
        id C48E168BDF; Thu, 29 Nov 2018 19:55:37 +0100 (CET)
Date:   Thu, 29 Nov 2018 19:55:37 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-parisc@vger.kernel.org, robin.murphy@arm.com,
        the arch/x86 maintainers <x86@kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        David Woodhouse <dwmw2@infradead.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: remove the ->mapping_error method from dma_map_ops V2
Message-ID: <20181129185537.GA30824@lst.de>
References: <20181128074117.GA21126@lst.de> <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com> <20181128174545.GJ30658@n2100.armlinux.org.uk> <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com> <20181128180841.GM30658@n2100.armlinux.org.uk> <CAHk-=whcbiSxSUprsKjVPEdN5-+o8WnTGiKxEV-+HbKNDs=iNA@mail.gmail.com> <20181129162323.GA27068@lst.de> <CAHk-=wi2K7_+dgCbc-sAK9CST5Zh+pOuH7sVT9WW-kqs50HSzQ@mail.gmail.com> <20181129183132.GA30281@lst.de> <CAHk-=wjjmtZAAGvB8c6hyKvABPHNTfE+b+eHu7iktdogDfTgMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjjmtZAAGvB8c6hyKvABPHNTfE+b+eHu7iktdogDfTgMw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Nov 29, 2018 at 10:53:32AM -0800, Linus Torvalds wrote:
> Most of the high-performance IO is already using SG lists anyway, no?
> Disk/networking/whatever.

Networking basically never uses S/G lists.  Block I/O mostly uses it,
and graphics / media seems to have a fair amount of S/G uses, including
very, erm special ones.
