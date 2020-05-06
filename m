Return-Path: <SRS0=E0Zb=6U=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA1EC4724C
	for <linux-parisc@archiver.kernel.org>; Wed,  6 May 2020 17:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 929B52080D
	for <linux-parisc@archiver.kernel.org>; Wed,  6 May 2020 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588787898;
	bh=0K0aE2bw8O+D2zxuH1nVtjWOjmncOreUUbvjPVB9+3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=cmyzzucrYT3FqkjGclVIyOA+I/Ae+V2ah+674o/ADyDLd5Fm/xkm0PuEFX0FXYYeH
	 rL2k6nTway9LqjBYNOyXIxPRy/9sE7yPhXkSy7ebPl1vLPyvJFaMQiK14AN6wFxOmO
	 HlwyHSANezaYCjzCKdu3Vc6fgVc3Zu19oRDIqzhI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbgEFR6S (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 6 May 2020 13:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728082AbgEFR6S (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 6 May 2020 13:58:18 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47EEC061A41
        for <linux-parisc@vger.kernel.org>; Wed,  6 May 2020 10:58:17 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l19so3338619lje.10
        for <linux-parisc@vger.kernel.org>; Wed, 06 May 2020 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=amhqtC0jx3Soa4PMXxAnnhfkbBJzW3RmXIKW7xjvTm8=;
        b=HgJKLXT1DdNyq51LO7Yajpy+kFP02OcEtgqoKUtFS1yGSN45VqntoJwH+X2ojFI5Yz
         VanVze+sYnLUdhLxZWaCjc0lht8OTs/pF6rfb8vQjJNFuC8VJ1vNt8Biip5j85VsAxzZ
         GcH0M+IVfjrqrmfFOzxxtIOPztNPNJHUO70hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=amhqtC0jx3Soa4PMXxAnnhfkbBJzW3RmXIKW7xjvTm8=;
        b=lQxOly2lVK3ogMIAa1fSU7FpB+u1p797NFfpXyIwJ21PHcD8KotcQ3M7kZ+fz2Sfoq
         ztCfCfjKzbqHJZ4dOwT25o2LUcZYaju7JDg+Wvrg1WWkDpiOjSOEVl9oNuLSlWjq/sFZ
         h5GpyMdtCsugdq3MVZDLe/4ophRZkA8lzBKeSdk/8KZkKnRIr2a9aby6PhYYYzS4B9OW
         IbDqDcB5Lt4eYkZQNea/ch1uZwjGfxVDTAggqCg2i/SfOpN/JnnJ4NQYWbTbfs0m3t3+
         1dlTbFbd6JERkgZ2KAXUYdDrZlAt6UF/VOCifAHgBuB5iCMzv+SzCCL0tJSkWaOsfQr6
         7KWg==
X-Gm-Message-State: AGi0Pual3AnQPS5xGQezwsQrUKA1Djqnd+g8ev45Uez2Hgbh7VJp4YGf
        mmpZHW/gWaW3ExrKXK6y6KrUCJXHiL4=
X-Google-Smtp-Source: APiQypLDAzKvwscfU14cxZYlK1GiKyd8CixvL4KV5OCjsOFTgyJU6zt3BmHSxk5z4/0YuP0h2iu0sw==
X-Received: by 2002:a05:651c:287:: with SMTP id b7mr5979729ljo.82.1588787895437;
        Wed, 06 May 2020 10:58:15 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id v4sm1717960ljj.104.2020.05.06.10.58.14
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 10:58:14 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id t11so2113721lfe.4
        for <linux-parisc@vger.kernel.org>; Wed, 06 May 2020 10:58:14 -0700 (PDT)
X-Received: by 2002:ac2:418b:: with SMTP id z11mr6180281lfh.30.1588787893824;
 Wed, 06 May 2020 10:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200506062223.30032-1-hch@lst.de> <20200506062223.30032-9-hch@lst.de>
 <CAHk-=wj3T6u_kj8r9f3aGXCjuyN210_gJC=AXPFm9=wL-dGALA@mail.gmail.com> <20200506174747.GA7549@lst.de>
In-Reply-To: <20200506174747.GA7549@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 6 May 2020 10:57:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_tQpDnrODW0U1kd3+BzuGtan4353fu9AfWdrpMcv3Jw@mail.gmail.com>
Message-ID: <CAHk-=wh_tQpDnrODW0U1kd3+BzuGtan4353fu9AfWdrpMcv3Jw@mail.gmail.com>
Subject: Re: [PATCH 08/15] maccess: rename strnlen_unsafe_user to strnlen_user_unsafe
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

On Wed, May 6, 2020 at 10:47 AM Christoph Hellwig <hch@lst.de> wrote:
>
> > The fact that we have "probe_kernel_read()" but then
> > "strncpy_from_user_unsafe()" for the _same_ conceptual difference
> > really tells me how inconsistent the naming for these kinds of "we
> > can't take page faults" is. No?
>
> True.  If we wanted to do _nofaul, what would the basic read/write
> versions be?

I think "copy_to/from_kernel_nofault()" might be the most consistent
model, if we are looking to be kind of consistent with the user access
functions..

Unless we want to make "memcpy" be part of the name, but I think that
we really want to have that 'from/to' part anyway, which forces the
"copy_from/to_xyz" kind of naming.

I dunno. I don't want to be too nit-picky, I just would like us to be
more consistent and have the naming say what's up without having
multiple different versions of the same thing.

We've had this same discussion with the nvdimm case, but there the
issues are somewhat different (faulting is ok on user addresses - you
can sleep - but kernel address faults aren't about the _context_ any
more, they are about the data not being safe to access any more)

Anybody else?

             Linus
