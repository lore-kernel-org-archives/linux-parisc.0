Return-Path: <SRS0=e9EU=OB=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2DEC43441
	for <linux-parisc@archiver.kernel.org>; Thu, 22 Nov 2018 17:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A45920838
	for <linux-parisc@archiver.kernel.org>; Thu, 22 Nov 2018 17:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Lb2fFz3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A45920838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404590AbeKWDu1 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 22 Nov 2018 22:50:27 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44412 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406220AbeKWDuZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Nov 2018 22:50:25 -0500
Received: by mail-lj1-f195.google.com with SMTP id k19-v6so8518467lji.11
        for <linux-parisc@vger.kernel.org>; Thu, 22 Nov 2018 09:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BYDiCn4mNgKeBgCg8HVgmKexqx+tdckvx/rsj11k3pI=;
        b=Lb2fFz3gCklF0kZwM7nPIoqxdu02kc9pZ4cClaJtCmpIsXS3GRG+rNT0XpMk46ng6v
         sfoaZruYdNinptlOoOnXgYzSQ/5zAp1Sgv6cPCYm/18vdv01j4Pd5EbQimpHJBDzILyd
         eRMKziO9vBVOcF8ZjSg1ClJifqAgY4ZX4Avpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BYDiCn4mNgKeBgCg8HVgmKexqx+tdckvx/rsj11k3pI=;
        b=VirrO/MaH1av/WxCwN82F4dUrNMw2zR/nCn5GFCkd4XyC7i6xUUMtKIG4SII/HKItq
         rRrtvE2arXivmetBq2TzGbknDEX9NI/0iUaTdfbSDCcA/wL/xB4qGicwBFezy3rv2A1F
         S2dejSPH1Rl823iIvDh8Mm7DuOtSIUlT3A6l+A6x7Tix72E5T/bGjSWKgQ6NNMWpXKSu
         Pg9a/M6KsoQsHPS3mo3SkB/mqcOh/M5vWOR1zaMWs8HRp31Ho2Ku7OEnNNk8M9QDCrd3
         gYBJgpmO9wlspQlbWCLLMVM75h3WywKFCir6V72ezhHme1mmEC7uk4tOhRweFt4uMomb
         JeQA==
X-Gm-Message-State: AA+aEWYEZbPjo3rKZr9MSiKVjWowaFw1EI5tY/S5mD1BWjHnbLKvh1CV
        KNiP51byq5ZmzZsXPUcNn+81aG+OJLDIfA==
X-Google-Smtp-Source: AFSGD/UPTkYgmq+HLY0Cu24x8NEePOI2+vQv8LUpu7duAop47mcCWBC2OJ7gn2lAkrOer/ldsuSYMw==
X-Received: by 2002:a2e:9256:: with SMTP id v22-v6mr8277211ljg.178.1542906605312;
        Thu, 22 Nov 2018 09:10:05 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id d75sm2503186lfe.0.2018.11.22.09.10.04
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Nov 2018 09:10:04 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id b20so6958966lfa.12
        for <linux-parisc@vger.kernel.org>; Thu, 22 Nov 2018 09:10:04 -0800 (PST)
X-Received: by 2002:a19:cb94:: with SMTP id b142mr7310636lfg.117.1542906603412;
 Thu, 22 Nov 2018 09:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20181122140320.24080-1-hch@lst.de> <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
In-Reply-To: <20181122170715.GI30658@n2100.armlinux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 22 Nov 2018 09:09:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
Message-ID: <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
Subject: Re: remove the ->mapping_error method from dma_map_ops V2
To:     linux@armlinux.org.uk
Cc:     Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        David Woodhouse <dwmw2@infradead.org>, joro@8bytes.org,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org, jdmason@kudzu.us,
        xen-devel@lists.xenproject.org, robin.murphy@arm.com,
        linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Nov 22, 2018 at 9:07 AM Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
>
> I'm afraid that won't work very well - 32 bit platforms with 64-bit
> addresses (LPAE) would have dma_addr_t as a 64-bit value, which
> wouldn't fit into an unsigned long.

Good point. So we'd have to have a special IS_DMA_ERR() function that
takes a dma_addr_t and checks the same "is it the top 4095 values".

Because I'd still prefer to allow people to return the _actual_ error,
and to have "return -Exyz" as the error case. That part still DTRT
even with dma_addr_t.

              Linus
