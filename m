Return-Path: <SRS0=e9EU=OB=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB85FC43441
	for <linux-parisc@archiver.kernel.org>; Thu, 22 Nov 2018 16:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 700AC20818
	for <linux-parisc@archiver.kernel.org>; Thu, 22 Nov 2018 16:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fFLdH/fA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 700AC20818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389316AbeKWDg4 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 22 Nov 2018 22:36:56 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42141 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388150AbeKWDg4 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Nov 2018 22:36:56 -0500
Received: by mail-lf1-f67.google.com with SMTP id l10so6960179lfh.9
        for <linux-parisc@vger.kernel.org>; Thu, 22 Nov 2018 08:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e562HhA2flT6fTyLAvxV3SOYh8Ynz+eq8zTy+B4XCBo=;
        b=fFLdH/fArJodPzBcL/riDZt8I8jJRKO5OTA2wYlDGTSL/IN1W/LlKJCXcPi1UZXmRv
         pk4iVZGuDq14GcO/8fgeKYOsPQw+C+viw101r+YOZQ3OQFF9njL+ZtIucWKEtWpBN+1e
         HeB0H6QQoTAIqrtq8SlsKP2n9UAcAUiaQO2sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e562HhA2flT6fTyLAvxV3SOYh8Ynz+eq8zTy+B4XCBo=;
        b=tLnbaomhQz4VS/2INCmaYr7gZzznRUJotnQ1Pj316bY05INFl8hwWSoNehBlkfYi/+
         YF8DfL8RixHSrwYDtk2p+v+dB/OZgkLlRsE9nGTaUS6pXOwwQgWK89I5fIEJLwHJ+Phk
         m4ohlsULuStiPCHZ+Q5vPa+xsYtXf6HMfawUWzHLp4LGpBA0apASwCUMVsCtSBELxECe
         md7m1eR8E2lbjfwPe6Nr6oWHZhzn89z+3xPqLID2KaRTiHcXpYV5YL5tKsO1goftDAKY
         k4hfTqfPAF0sA4yZ0OibXZ8s+kkhV+BZvpnZhxjVEY2WhaC5F6NuIiWcMR1bANax5szt
         vFaA==
X-Gm-Message-State: AGRZ1gK5bojvFgrGVGF8A4V3UpXKNJ4aTA8VBLXEvonUaVMX10tyFMXd
        RjdhmTQCvb6uCguoRzLMnDQkHQtUItPzyw==
X-Google-Smtp-Source: AJdET5cQjgIewJBX+l8gMwrpx6XPe3DVf4lob4FjsGyJpmcNoqPLgCQiKFBZq1tSYL2H37MvTcdqkg==
X-Received: by 2002:a19:c396:: with SMTP id t144mr6761505lff.110.1542905800329;
        Thu, 22 Nov 2018 08:56:40 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id p67sm7305006lfe.14.2018.11.22.08.56.39
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Nov 2018 08:56:40 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id t9-v6so8514807ljh.6
        for <linux-parisc@vger.kernel.org>; Thu, 22 Nov 2018 08:56:39 -0800 (PST)
X-Received: by 2002:a2e:2416:: with SMTP id k22-v6mr8344339ljk.80.1542905463649;
 Thu, 22 Nov 2018 08:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20181122140320.24080-1-hch@lst.de>
In-Reply-To: <20181122140320.24080-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 22 Nov 2018 08:50:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
Message-ID: <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
Subject: Re: remove the ->mapping_error method from dma_map_ops V2
To:     Christoph Hellwig <hch@lst.de>
Cc:     iommu@lists.linux-foundation.org, jdmason@kudzu.us,
        joro@8bytes.org, David Woodhouse <dwmw2@infradead.org>,
        m.szyprowski@samsung.com, robin.murphy@arm.com,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-arch@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Nov 22, 2018 at 6:03 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The 0 return doesn't work for direct mappings that have ram at address
> zero and a lot of IOMMUs that start allocating bus space from address
> zero, so we can't consolidate on that, but I think we can move everyone
> to all-Fs, which the patch here does.

Hmm. Maybe not limit it to just all ones, but actually use the
(standard, for the kernel) IS_ERR_VALUE()?

That basically reserves the last 4095 values in an unsigned long for
error values.

Then those functions could actually return *what* error they
encountered, using just plain

        return -ENOMEM;

or whatever?

               Linus
