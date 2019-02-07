Return-Path: <SRS0=bQ1H=QO=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A73C282C4
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 17:47:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 895DB2083B
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 17:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOO7NXAR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfBGRrG (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 7 Feb 2019 12:47:06 -0500
Received: from mail-it1-f193.google.com ([209.85.166.193]:55308 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfBGRrF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 7 Feb 2019 12:47:05 -0500
Received: by mail-it1-f193.google.com with SMTP id m62so1799355ith.5
        for <linux-parisc@vger.kernel.org>; Thu, 07 Feb 2019 09:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aPWuwBB0VUOO0R1ynWa8AdaMVsS5eM2ju9tPwUBkNLY=;
        b=QOO7NXARBpmCTlliJnxUk6UqLVW6eIw/VgBLelR1WmRwtK/IT9cXhf7/Hq6TqLGjkK
         Iq2yfsZM1l9yO6FwjsBLYe5a129GYLMTjGWIPWmryBMpjdS493HsbDp4SbssGKdRHLe7
         BanMZvZHD9gzDsmXl++U5pS/6Fit4MrYwDdT8V3hzhshu5sLDy8V9v28X4KSrRVX1Szc
         zSQbLDvYv665WXOe8pJdRMgeN335VMUyc3XLV8MFrMkwC54OtF//WaM+bsCsskZWwWuw
         nxXsU9QDILFRPfryqsgMfrATXZd0VI/pv/+VtwyXgJvPzeZiCCX7wJQUPY806Yc71VnH
         rjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aPWuwBB0VUOO0R1ynWa8AdaMVsS5eM2ju9tPwUBkNLY=;
        b=JiwrXhkC/jAU96g1QpEXpBY1HbfUKuf35u/mi8xeKx4HpOYADtnilpuwUCCCejJBtt
         GCUVMSWiXEiGaUDJ3zhJUsjIJuDTqBmxwCycR0Sn5TZIWyCeLu609yxfZV/TT6Ia6imK
         1SO24wfgrYUVr8rp7fwCOvxR7Kr11WM82X4367f3qV2VcCbYb6m+9deA7iheAg+iO7pt
         Wfm9XOQVkO+Dc2eW8/xsh1PyMF9zZnpsFVeWXFeHnIH4g21lklMN4BerPyJVuyB7MRik
         w3RoXbpeQ2LhaT8C48hHuy55K0JUkdJsKQaTx2gX1p/I+T131lpqzBupkkHG+XeJdUkL
         8oGw==
X-Gm-Message-State: AHQUAubE93WrIWqirtrWehkGfZWg2ER2T3JMUkCPywtZDQx+VOG/l2/a
        J+plhDtpnsQ94qyxT7e8DcTNkm2KMs6D8A24O10r9A==
X-Google-Smtp-Source: AHgI3IZVURz+QEZn969QvikELvFu8nBV+kMfCIPqTgFcyR4lDNUxI4ua61l04c3loZgUyjOk75aEhBq/R08MFUB2Zhg=
X-Received: by 2002:a5e:9318:: with SMTP id k24mr8871173iom.70.1549561625081;
 Thu, 07 Feb 2019 09:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20190206222110.GA19527@ls3530.dellerweb.de>
In-Reply-To: <20190206222110.GA19527@ls3530.dellerweb.de>
From:   Matt Turner <mattst88@gmail.com>
Date:   Thu, 7 Feb 2019 09:46:53 -0800
Message-ID: <CAEdQ38Eb4=i6ED-Ndgqu59C8Nmw-6ECVbm3snxSi06LgHn-sCA@mail.gmail.com>
Subject: Re: [PATCH] parisc: Add assembly implementations for strlen, strcpy,
 strncpy and strcat
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Feb 6, 2019 at 2:21 PM Helge Deller <deller@gmx.de> wrote:
>
> Add performance-optimized versions of the strlen, strcpy, strncpy and
> strcat string functions.

Can you say anything else about them? E.g., are you using some feature
that the compiler isn't able to generate? Do you have performance
data?

Except for strlen, they look like straightforward translations of the
simple C implementations.
