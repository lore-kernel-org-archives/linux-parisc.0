Return-Path: <SRS0=e9EU=OB=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E101AC43441
	for <linux-parisc@archiver.kernel.org>; Thu, 22 Nov 2018 17:55:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAC07206B2
	for <linux-parisc@archiver.kernel.org>; Thu, 22 Nov 2018 17:55:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="g+uuLfDx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAC07206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730594AbeKWEgL (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 22 Nov 2018 23:36:11 -0500
Received: from mail-lf1-f42.google.com ([209.85.167.42]:42046 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405647AbeKWEgL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Nov 2018 23:36:11 -0500
Received: by mail-lf1-f42.google.com with SMTP id l10so7063131lfh.9
        for <linux-parisc@vger.kernel.org>; Thu, 22 Nov 2018 09:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5llXmL071LkoV9+aZVNLiRsd4DJMg8wkITczzEgG/F0=;
        b=g+uuLfDx2wldsmmD9aQBaFnNOrTxJ8CGiOBWl2x/49BhgGlDHh+7yoIP/SswWyEjJx
         zXr7BvAuf7azuVPMWkGbxXvo+WzqyjAIGq3FgDBNmck3iEaRyOWuorZ10H6kr/k+T2CV
         7mUJ7deyjFqM5w+985my6PEzgY+WBc2lxqorE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5llXmL071LkoV9+aZVNLiRsd4DJMg8wkITczzEgG/F0=;
        b=IPyQAdncHXO44zajUtN7nZzB7ILget0ac6wqi1GRy+4/VefbvKhetrdEEvsaFlC4EH
         KJ1LbHagg94tb/l9KQY+1yXRGRkgjL1Hq6qvapCwwqJSbXW8WPCdSHINc+OnPrxZKCp0
         8S3WG9+CcdXriMFQxNTqDpWqvk0cGmlA8QOWpI2U0q4sa6ZkFNz0ort/InlXD2qHQh1F
         dW+0xsNfK7YuwzMdMtzEih4vLF7JPGZEWNbFi8aFJ7VBB9BZBfQWkrSkGD+wbRNaGws5
         fw1KD5JwmgTOHkfp9rGCRlpHdj2fwLhDY00eBfwfHSU3EEPPfkxP/S8iUpRb0mB+1sBG
         AuKQ==
X-Gm-Message-State: AGRZ1gKRLEf2OyoLesw+YmNVihz1yz7j1z/fD7IP2qkzVR/HH3zZre0y
        IWb19g0YW4IWoWejF/tKBYL2bxyo0WEleQ==
X-Google-Smtp-Source: AJdET5dy8dZjKlNH3oktz12uKOG/S2kf2v26t3SbvBGu/Pznn3obz1wXxgS6EvKdCECd5D1Bqm+39w==
X-Received: by 2002:a19:ae03:: with SMTP id f3mr7422224lfc.86.1542909343921;
        Thu, 22 Nov 2018 09:55:43 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id r7-v6sm7408647ljc.10.2018.11.22.09.55.42
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Nov 2018 09:55:43 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id f23so7041818lfc.13
        for <linux-parisc@vger.kernel.org>; Thu, 22 Nov 2018 09:55:42 -0800 (PST)
X-Received: by 2002:a19:4287:: with SMTP id p129mr7439565lfa.135.1542909341735;
 Thu, 22 Nov 2018 09:55:41 -0800 (PST)
MIME-Version: 1.0
References: <20181122140320.24080-1-hch@lst.de> <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk> <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
In-Reply-To: <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 22 Nov 2018 09:55:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
Message-ID: <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
Subject: Re: remove the ->mapping_error method from dma_map_ops V2
To:     robin.murphy@arm.com
Cc:     linux@armlinux.org.uk, Christoph Hellwig <hch@lst.de>,
        linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        David Woodhouse <dwmw2@infradead.org>, joro@8bytes.org,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org, jdmason@kudzu.us,
        xen-devel@lists.xenproject.org,
        linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Nov 22, 2018 at 9:52 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Unfortunately, with things like the top-down IOVA allocator, and 32-bit
> systems in general, "the top 4095" values may well still be valid
> addresses -

Ugh.

> The only immediate benefit I can see is that we could distinguish cases
> like the first which can never possibly succeed, and thus callers could
> actually give up instead of doing what various subsystems currently do
> and retry the exact same mapping indefinitely on the apparent assumption
> that errors must be transient.

No, the big immediate benefit of allowing "return -EINVAL" etc is
simply legibility and error avoidance.

It's basically how pretty much all the rest of the kernel returns
errors, so not only is it very obvious, it's also what people do
without even thinking.. So it would be good to work.

                       Linus
