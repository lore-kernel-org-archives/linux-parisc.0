Return-Path: <SRS0=t4zI=7D=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8360DC433E1
	for <linux-parisc@archiver.kernel.org>; Thu, 21 May 2020 18:04:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B4B820872
	for <linux-parisc@archiver.kernel.org>; Thu, 21 May 2020 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590084246;
	bh=niEMPau5fW33ciK7opyh8p6Qii22izrIZJYhauAi/0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=QROZjqM/dsp24FAiEQpdcjfD7DRtrtqr5Q2Eg03NoqJDwwmxJIDggCFbsLpUHyRz1
	 65TgppK59JBs92Ej9BR7HKOFVCLOt2sQXkt67Re1qEQen3xpC01aUN6lHHC76rSfla
	 2Lt0Bkuxi7wLrkgJR8KGtHmy53HpwAPDKkSlxG/s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgEUSEF (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 21 May 2020 14:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728911AbgEUSEF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 21 May 2020 14:04:05 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AD3C061A0F
        for <linux-parisc@vger.kernel.org>; Thu, 21 May 2020 11:04:05 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q2so9368131ljm.10
        for <linux-parisc@vger.kernel.org>; Thu, 21 May 2020 11:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Gg4b4CDCsETMIm4Edj1Xv31p6ZdZ0NWSz903G/X2Po=;
        b=C+6xQYv405ppXq81KjYUQtltgLKHhtWFV7DfKyUQgnD/o5JsMIaX3ld48tDI1ZlD7K
         U7kuhQvl7mdKFxmVsF/c3fYz37gu4oWx14U5jtAODWIsK4FqzsUCdodSWDq8PJADqJQN
         fxp/doyT7dYvEricBmr9oFTSOXixPbh/BPwNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Gg4b4CDCsETMIm4Edj1Xv31p6ZdZ0NWSz903G/X2Po=;
        b=VhEDpu1uLLqdx1gkXZAMPSP2WyFudfU4hV5TOWxJpaK0HCp4x4k+6gOId5Ed8xATWu
         8oj72pcMYxP5AnrDSoB1X0GeuUYWPToCOG4kgmOByND0YFAikaRa3y6b2hNt6zV8Li7A
         0S1jjRmrgDYZNG4MfOmXtV3pNmZACMfSQm8opjqW4v3WBfm9nl3zDX5s2zliaoR2lTWp
         yfW1eb8/K/vuHrPvFuEEbZqsWOjbtIfEg9K2jbffCKiz9YsUAQdfLGkJggSUHQzCQZjV
         gqc6F/+Va2p3igr3BJetFx7kcwhrp7ZXEMghtsdxw8qSLucY80Q56kxljZG1NBN5GcAM
         CLaQ==
X-Gm-Message-State: AOAM533IARIVYed/KB8LDskk+YLidPkTfOsFDiTeBWYa9ps9QAg5atOp
        E7Agt5rcRTQr+KY5HOaCItF0kH6UG6A=
X-Google-Smtp-Source: ABdhPJxgX3OD3fNkbsNL6pN0TT8tFsLrj75Ep40BTsQgOdyqWByWIqZlNLmEmpMFo4Y1asCZ/3iCqw==
X-Received: by 2002:a2e:b0e6:: with SMTP id h6mr4328305ljl.178.1590084242494;
        Thu, 21 May 2020 11:04:02 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id b144sm1919003lfg.82.2020.05.21.11.04.01
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 11:04:01 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id l15so9042700lje.9
        for <linux-parisc@vger.kernel.org>; Thu, 21 May 2020 11:04:01 -0700 (PDT)
X-Received: by 2002:a2e:9891:: with SMTP id b17mr3748342ljj.312.1590084240602;
 Thu, 21 May 2020 11:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200521152301.2587579-1-hch@lst.de>
In-Reply-To: <20200521152301.2587579-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 21 May 2020 11:03:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiQa3GNytJDdN=RKzSKfGQdPBvso+2Lmi+BpOP=BA_n6A@mail.gmail.com>
Message-ID: <CAHk-=wiQa3GNytJDdN=RKzSKfGQdPBvso+2Lmi+BpOP=BA_n6A@mail.gmail.com>
Subject: Re: clean up and streamline probe_kernel_* and friends v4
To:     Christoph Hellwig <hch@lst.de>
Cc:     "the arch/x86 maintainers" <x86@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-parisc@vger.kernel.org,
        linux-um <linux-um@lists.infradead.org>,
        Netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, May 21, 2020 at 8:23 AM Christoph Hellwig <hch@lst.de> wrote:
>
> this series start cleaning up the safe kernel and user memory probing
> helpers in mm/maccess.c, and then allows architectures to implement
> the kernel probing without overriding the address space limit and
> temporarily allowing access to user memory.  It then switches x86
> over to this new mechanism by reusing the unsafe_* uaccess logic.

I could not see anything to object to in this version. So Ack from me,
but obviously I'm hoping others will try to read it through as well.

              Linus
