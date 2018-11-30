Return-Path: <SRS0=fqjw=OJ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F77C04EB8
	for <linux-parisc@archiver.kernel.org>; Fri, 30 Nov 2018 19:43:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65F742145D
	for <linux-parisc@archiver.kernel.org>; Fri, 30 Nov 2018 19:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PYYzwo0t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65F742145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbeLAGx7 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 1 Dec 2018 01:53:59 -0500
Received: from mail-lj1-f176.google.com ([209.85.208.176]:46034 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbeLAGx7 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 1 Dec 2018 01:53:59 -0500
Received: by mail-lj1-f176.google.com with SMTP id s5-v6so5990791ljd.12
        for <linux-parisc@vger.kernel.org>; Fri, 30 Nov 2018 11:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0fFziNXyQiaQ1gvrUPztS5FG34FXTL1N9RRdX0cNN0I=;
        b=PYYzwo0tMsYcbfvIwf5RJHUWXOgcVNaoJMWTqvQHUXo6niteO0eX+YGc9YbavQQZ4o
         A3xhEHVVs3h8icNVlNAfkkD18bgt6X8F/+ZxJmD6Dohzfq+w2vLdqOs3NbA9JWYuqqhV
         ggiiYzO4IlKiR7LYTtwCRapGsYtr1FAz+wjs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fFziNXyQiaQ1gvrUPztS5FG34FXTL1N9RRdX0cNN0I=;
        b=ibfkPdF3C1ZVfod3bOOpV2hd5XlnFWQU3Ng8wX/wgyctEdrfbrI+UMQn051+rpP0N8
         TzHMtB5RPaNcEGSW0P8kDyAmgligv9ZbUikMrkQktxyJoFHcbLec65dpztaTzCMVU8f8
         JpAnSpks1gtVFp8jjACFP5v8DVuOvsbJy9iA/0TVc9WeLUR/thuYkfrvTX3bEErBevor
         luECEHXcsj4QQs/1aEypuwJNhHJfP6Vm/MOnMpjD8Y/9SK27S7OESYSWBgiYovA6jVlB
         bY+yGjeMLyv1LeZ7uf0xVrJV0BUwHxbE+aGN3T02ynEsEuwnRZRHBGvnc2fyrlqN8FFN
         rwwg==
X-Gm-Message-State: AA+aEWZke/eMK1M19FBZdkL+kqEdCxk6J/oEcUfpJOq7R9wFyTiHSGSw
        uXPDnDlqk9yviLX1gDKJYyk/Ev9fAbk=
X-Google-Smtp-Source: AFSGD/Vxr3RKyqROmqMQypA700kRuefhfNeso5Zt9xhtahM2rxGho6hwFXnsYi3WqX7rr+jTLvfZ5w==
X-Received: by 2002:a2e:4942:: with SMTP id b2-v6mr4599110ljd.168.1543607016059;
        Fri, 30 Nov 2018 11:43:36 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id p91sm988524lfg.4.2018.11.30.11.43.34
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Nov 2018 11:43:35 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id p86so4946891lfg.5
        for <linux-parisc@vger.kernel.org>; Fri, 30 Nov 2018 11:43:34 -0800 (PST)
X-Received: by 2002:a19:cb94:: with SMTP id b142mr4584103lfg.117.1543607014101;
 Fri, 30 Nov 2018 11:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20181130132231.16512-1-hch@lst.de>
In-Reply-To: <20181130132231.16512-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 30 Nov 2018 11:43:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wia7wykuDu-mzbhF+rL1M9FnJfnoidsvkz5TPMPHUep7g@mail.gmail.com>
Message-ID: <CAHk-=wia7wykuDu-mzbhF+rL1M9FnJfnoidsvkz5TPMPHUep7g@mail.gmail.com>
Subject: Re: remove the ->mapping_error method from dma_map_ops V3
To:     Christoph Hellwig <hch@lst.de>
Cc:     iommu@lists.linux-foundation.org, jdmason@kudzu.us,
        joro@8bytes.org, David Woodhouse <dwmw2@infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        robin.murphy@arm.com, "the arch/x86 maintainers" <x86@kernel.org>,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Nov 30, 2018 at 5:23 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Error reporting for the dma_map_single and dma_map_page operations is
> currently a mess. [..]

I don't see anything objectionable there, but it's not like I checked
any of the context of the patches. For all I know there are odd corner
cases where some zero vs DMA_MAPPING_ERROR confusion lurks, but I
guess we'll find out..

So you can add my acked-by, fwiw.

                Linus
