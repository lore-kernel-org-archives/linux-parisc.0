Return-Path: <SRS0=bQ1H=QO=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED45C282C2
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 22:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00FAB21721
	for <linux-parisc@archiver.kernel.org>; Thu,  7 Feb 2019 22:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eF1shcfi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfBGWxl (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 7 Feb 2019 17:53:41 -0500
Received: from mail-it1-f196.google.com ([209.85.166.196]:54355 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfBGWxl (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 7 Feb 2019 17:53:41 -0500
Received: by mail-it1-f196.google.com with SMTP id i145so4256195ita.4
        for <linux-parisc@vger.kernel.org>; Thu, 07 Feb 2019 14:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MYV5RRghKDNDtEgNNj81rn84qUpuDTq5YPvgHRoEwfk=;
        b=eF1shcfiy4erSmDZQwCE6uVHBBgvx6YgJ0Q7Ute2h6Z8Fp/d7jv8+cW2oRDAbergNH
         4R7YuAgMtRtDVqcntUYfzeHpiyMXijD0f2/7EBVlLz7QfYO7Tn3em5B7yY63/WdOPOpK
         4UPsUf4HTfASkI0M8xbxlVtP1b2AOZRmu6QPEx5hP11665c2MVl9mOYJyFHEtD/g1FTb
         CXIrOQenzG2o+D2GJi7i8JVsmeV2KFy02A2H4je2JaNpMGm7V0fK4w9l5ic0EAphxZM5
         s3rM3TTN66Ww8r1ome4iAt9gfpouAc9wtaEYQCZiygTGfRSgpiAUbt95f+Zd0yn2u3bL
         tnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MYV5RRghKDNDtEgNNj81rn84qUpuDTq5YPvgHRoEwfk=;
        b=R+vVoiP98m+VKXFq2MbDsLI+xnz7EO6RDUJlSA3qf9qDz7vVZwoNsUENTRZyTkERXi
         DbjznLclX+hSuO4kbNIPlTbYhDC2GkN0CK71x0RLuXRzTzmduCrr5P7igbuwItmusLfH
         25wGft5kzpP0vp19WdK7+aV6WTZe0AoTSQSh6J3ldG6MSQa9i/UbpmHYgYI7THAt9iph
         rvjA/wyWjOYJiqyCIqw3auhryvnTMkx2ChKW60/7fR3HF7HRMj6NmcyyId0pW4+/peUR
         is+W1+QgLylK/NZmws7o7zkHF9Cm9I3GG5BU118E8+u1Snr5eiHREgBH3RC7cPDbaBtp
         +yfw==
X-Gm-Message-State: AHQUAuZKZ867V+jztk4rn4PNGK/mF0iZSPFYzN2sihApxp5eKkO5YuoH
        oHE2zouh8ItBaf2LyCvmu6o1IbgQDfV/mGjJhi4=
X-Google-Smtp-Source: AHgI3IaaoCQhppa9OWpPOELVwVDQxewG95Iv68f72YiJtewsbCZ5gOJIrpYiESq2XhubAxA6PLAmhakJvw7Jsrs6cS8=
X-Received: by 2002:a02:8561:: with SMTP id g88mr9587608jai.68.1549580020731;
 Thu, 07 Feb 2019 14:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20190206222110.GA19527@ls3530.dellerweb.de> <CAEdQ38Eb4=i6ED-Ndgqu59C8Nmw-6ECVbm3snxSi06LgHn-sCA@mail.gmail.com>
 <a2f5a38f-61bf-ec8a-b855-49f88b59905d@gmx.de>
In-Reply-To: <a2f5a38f-61bf-ec8a-b855-49f88b59905d@gmx.de>
From:   Matt Turner <mattst88@gmail.com>
Date:   Thu, 7 Feb 2019 14:53:29 -0800
Message-ID: <CAEdQ38Fz8knn-vn7BeDGNiddu14ouX-VCGb-F6VphbtExRxnKQ@mail.gmail.com>
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

On Thu, Feb 7, 2019 at 2:22 PM Helge Deller <deller@gmx.de> wrote:
>
>
> On 07.02.19 18:46, Matt Turner wrote:
> > On Wed, Feb 6, 2019 at 2:21 PM Helge Deller <deller@gmx.de> wrote:
> >>
> >> Add performance-optimized versions of the strlen, strcpy, strncpy and
> >> strcat string functions.
> >
> > Can you say anything else about them?
>
> No.
>
> > E.g., are you using some feature that the compiler isn't able to
> > generate?
>
> Some assembler instructions are used which the compiler doesn't
> use by default for such use cases.
>
> > Do you have performance data?
>
> Not yet.
> Maybe someone wants to do that?
>
> > Except for strlen, they look like straightforward translations of the
> > simple C implementations.
>
> The code is much smaller than what the compiler generates and
> the layout of the bytes-stores are targetted the behaviour of
> the parisc 64bit CPUs.

So is that the rationale? I'm not sure how anyone can offer review if
they don't know what you're trying to accomplish.
