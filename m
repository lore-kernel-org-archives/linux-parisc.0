Return-Path: <SRS0=z5Pf=PW=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C75C43387
	for <linux-parisc@archiver.kernel.org>; Mon, 14 Jan 2019 08:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1D3920659
	for <linux-parisc@archiver.kernel.org>; Mon, 14 Jan 2019 08:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="hsyXdMOA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfANIC2 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 14 Jan 2019 03:02:28 -0500
Received: from mail-it1-f194.google.com ([209.85.166.194]:34448 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbfANIC2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 14 Jan 2019 03:02:28 -0500
Received: by mail-it1-f194.google.com with SMTP id x124so7645053itd.1
        for <linux-parisc@vger.kernel.org>; Mon, 14 Jan 2019 00:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dEboZRdLTNytSPSyCPuAL7ECIvxQrUyQEZxLRQJ/l1I=;
        b=hsyXdMOATrf3YkwriLlfoS/SvEGj9y5Mijt8q3JplLH167C6/e6OC5WAEuzrg0KMIf
         TGgnZuR3qGMTGHwXkzGpyPgqNfRewjasQA2gvxFjdn+mw2q6jaZNHViUVLjCQ1TxXEk2
         BXJDzoeuz1F88ZnJrxX9LB4a0g8CBFv6rlimQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dEboZRdLTNytSPSyCPuAL7ECIvxQrUyQEZxLRQJ/l1I=;
        b=NLNeApTeySUxTzibiqKfIkIyjxNgBgDeNqRLMcvM5RPf6aftTYErfY46XcoxR/XQ7k
         tzSF/MTNRKERBs36Cm/c262Sseip4LH1lUmYSDlWRLkxjxmHwV6Gu57S03bdezAOIEM9
         4pFP4c2eVE5f6kX8Pa2TfZ60TNAhOiIGl019h1SA8i0ymLFU9Nlx+y/HhpfTbzz9MimG
         dm+uv/y3j2uIWcHZshDIoqXpPlyqGeJAuQLtvTnBjCqke+urDsiHVHH7sM7aJyOcXHTh
         +rXZMZc2W8DI9ETWN38IHviAPTNy0kIHMRTraE1MTDVzh5IFMP1mrOFExLiyLERqGk3C
         uFQg==
X-Gm-Message-State: AJcUukfA7GWvOkrlwMy0J8ucQklyn4nYhGVXjdI3+58NoEJTIeflg+MU
        lcMP85jYA+pGTct3R0Z9xxYJSpRK7afar2SWOI9Z/g==
X-Google-Smtp-Source: ALg8bN7rEozmI6vmToSsut+T4/jGKUsAWDJKaiVPtTpsljNdv6HIW/xT9v4tz/qiS45CHJQlEc2XL+dS7i5jnhqsqO0=
X-Received: by 2002:a02:5618:: with SMTP id o24mr17598905jab.111.1547452947502;
 Mon, 14 Jan 2019 00:02:27 -0800 (PST)
MIME-Version: 1.0
References: <1546444953-21630-1-git-send-email-firoz.khan@linaro.org> <d2b9fb1a-15b3-b2f9-9380-8ce9098c787a@gmx.de>
In-Reply-To: <d2b9fb1a-15b3-b2f9-9380-8ce9098c787a@gmx.de>
From:   Firoz Khan <firoz.khan@linaro.org>
Date:   Mon, 14 Jan 2019 13:32:16 +0530
Message-ID: <CALxhOnhFD-KKErY1C4=0MVmcR9hJ59VkSoxJNCdBcPeojdoMnw@mail.gmail.com>
Subject: Re: [PATCH 0/2] parisc: Unify the system call scripts
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        y2038 Mailman List <y2038@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Sun, 6 Jan 2019 at 14:37, Helge Deller <deller@gmx.de> wrote:
>
> Both patches seem OK, and I can then take them through the parisc
> git tree when the patch above has reached upstream.

Thanks for the mail. Sorry for the late response as I was on a vacation.

FYI, I'm going to abandon this patch series (for other 9 architecture
also) and planning to come up with asm-generic support along with
this one. That can be single patch series and everything can be landed
in the same time.

Firoz
