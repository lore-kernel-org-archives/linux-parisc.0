Return-Path: <SRS0=noE3=OI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C155C07E85
	for <linux-parisc@archiver.kernel.org>; Thu, 29 Nov 2018 17:44:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E94421104
	for <linux-parisc@archiver.kernel.org>; Thu, 29 Nov 2018 17:44:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KXV66Zrt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E94421104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730663AbeK3Eug (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 29 Nov 2018 23:50:36 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33890 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730621AbeK3Eug (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 29 Nov 2018 23:50:36 -0500
Received: by mail-lj1-f195.google.com with SMTP id u6-v6so2537382ljd.1
        for <linux-parisc@vger.kernel.org>; Thu, 29 Nov 2018 09:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CgaKeOauL30+OcqQ/oF88KtKOMNK435LY3ecISt9KGg=;
        b=KXV66Zrt+LE9OJW9tR0KA0p3jf1gcsN3O0/mok8/I9QbAd8RlRFcNspzwJljeiqB8o
         CKPUJ50mZ3YSjUiMoAib/A5VD2vM8qYiU4IiSVFFusoAlB/YUQe6dC9FqiZ9AgH5vfmB
         C4525bGZNyppxdzgNGN8/NvnQuTOhz26MCSE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CgaKeOauL30+OcqQ/oF88KtKOMNK435LY3ecISt9KGg=;
        b=dX2jFPPeEbceO+Ifs96zLvsnZM8TnvtisgztEVdiCm9FevI8XNa3man9zJ7+Q4h1d1
         DUo98ItNCwc4CQkriBMojWY6ReYJ2FYuBuRYe61lze7DZA1gzC84OnkHKOzgJWEkL8K+
         3XsTjrMRgH1RLsxAalXQnJyXfTmthqWKs/hqbPHzCih5qzp8K/115W//msXNygQZT/e8
         mQf0r1pq+yJOoQjcSsWfBhRgaOf5uEjx3foAdeb18r3QxFmIJS7eeUqMuTykipXArGT+
         mN4rGqb5/xe/QmKuwBED/6RgUNxlzAk607Wn3RuXR3D6YDX/Qb9kYJ1SsR5Cgw/ZqKiA
         oAWg==
X-Gm-Message-State: AA+aEWaNDyAChSq9C4g6OCw2bstUA6fbAXEqBXuKxkYV21fT8EuXLbFQ
        k2lhLL1u0Atziey5Y4eneqGeq12yJ2A=
X-Google-Smtp-Source: AFSGD/WzpUwXJaMqm2ErFNrY7eDrhvRbZyR12O9xxc6MOZTRB0m/NYyIPEYVtjqGjNgKpiUR8xO2xg==
X-Received: by 2002:a2e:197:: with SMTP id f23-v6mr1731928lji.144.1543513464225;
        Thu, 29 Nov 2018 09:44:24 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id b22sm403200lfg.32.2018.11.29.09.44.22
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Nov 2018 09:44:22 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id p6so2109981lfc.1
        for <linux-parisc@vger.kernel.org>; Thu, 29 Nov 2018 09:44:22 -0800 (PST)
X-Received: by 2002:a19:982:: with SMTP id 124mr1600110lfj.138.1543513462064;
 Thu, 29 Nov 2018 09:44:22 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com> <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181123065511.GA17856@lst.de> <20181128074117.GA21126@lst.de>
 <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk> <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
 <20181128180841.GM30658@n2100.armlinux.org.uk> <CAHk-=whcbiSxSUprsKjVPEdN5-+o8WnTGiKxEV-+HbKNDs=iNA@mail.gmail.com>
 <20181129162323.GA27068@lst.de>
In-Reply-To: <20181129162323.GA27068@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 29 Nov 2018 09:44:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi2K7_+dgCbc-sAK9CST5Zh+pOuH7sVT9WW-kqs50HSzQ@mail.gmail.com>
Message-ID: <CAHk-=wi2K7_+dgCbc-sAK9CST5Zh+pOuH7sVT9WW-kqs50HSzQ@mail.gmail.com>
Subject: Re: remove the ->mapping_error method from dma_map_ops V2
To:     Christoph Hellwig <hch@lst.de>
Cc:     Russell King - ARM Linux <linux@armlinux.org.uk>,
        linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-parisc@vger.kernel.org, robin.murphy@arm.com,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        David Woodhouse <dwmw2@infradead.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Nov 29, 2018 at 8:23 AM Christoph Hellwig <hch@lst.de> wrote:
>
> We can.  At least in theory.  The problem is that depending on the
> crazy mapping from physical and kernel virtual address to dma addresses
> these might be pages at pretty random places.  Look at fun like
> arch/x86/pci/sta2x11-fixup.c for how ugly these mappings could look.
>
> It also means that we might have setup swiotlb on just about every
> 32-bit architecture, even if it has no real addressing limit except for
> the one we imposed.

No. Really. If there's no iotlb, then you just mark that one page
reserved. It simply doesn't get used. It doesn't mean you suddenly
need a swiotlb.

If there *is* a iotlb, none of this should matter, because you'd just
never map anything into that page.

But whatever. It's independent from the patch series under discussion.
Make dma_mapping_error() at least return a real error (eg -EINVAL, or
whatever is the common error), and we can maybe do this later.

Or, better yet, plan on removing the single-page dma mappign entirely
at a later date, and make the issue moot.

              Linus
