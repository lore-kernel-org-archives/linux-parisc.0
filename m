Return-Path: <SRS0=iCLC=RZ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC91C43381
	for <linux-parisc@archiver.kernel.org>; Fri, 22 Mar 2019 17:08:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BF2D21900
	for <linux-parisc@archiver.kernel.org>; Fri, 22 Mar 2019 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553274529;
	bh=NPONG8wAWdU8frpkBP04ZDC1Cm0k8bBvTC60p9VG0bk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=dIDrVsoil0l7yKTu2AHaQ8xkdYrg4VeTnNT+RRhaf6krIOVQl0o21YYG9lRAjKZdX
	 CEXtGYYILn3LrigjPJUldA3ZJ61F4/AXY0HCISpgZ9etYUA44KiqrZyzaVkHZB+Glm
	 TSj035Fs5H6USVphUNrN99s0d0afzch/o3LkyfGw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbfCVRIt (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 22 Mar 2019 13:08:49 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37253 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbfCVRIs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 22 Mar 2019 13:08:48 -0400
Received: by mail-lj1-f196.google.com with SMTP id v13so2680211ljk.4
        for <linux-parisc@vger.kernel.org>; Fri, 22 Mar 2019 10:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=syf5FC/PD4cN6FgIJM2ms3RJG343jtrhSP64Oe75Sac=;
        b=IuhoI3hZaIxE4YvOC0/zFIRPXbZPqr4mch9fB87bJI50v/CesoGw5jPm0Ymj36S+8D
         SIzDojt4m/q1uwaK9P5Is2rLt7NY0cQwo3oRCrDKYwFF22+ZwEkj5rWc3XCpMkx/lh21
         i/oyaRFuahvewUzvmGuDcKpmqMK2Pff6AsG6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=syf5FC/PD4cN6FgIJM2ms3RJG343jtrhSP64Oe75Sac=;
        b=pYxkLLMtrc3FCa7HhULX2iUk5xlys965j3VZ5PMHz8FibsOoITMY1E/jQecGtdl22m
         nEspEhXuPxOOPeOZjWrtMSfasaNgI87nTwlLh9DHQK+Mn3GCgomgJnbwc4zgPBv2NrFd
         uwUdROkYYMj4+ai1qBB+a8+C9lr7XucIfG50MNwNMymnZt+eqr9qe3ok42vkKFldcmls
         CeVqRTlNRbZEsD9TgQ6sDC8qbJSnsQItui1V25ZaCNve9UJaZOc2G7GlgDBXkCrS2StG
         OY0KOuHxp1SbelN/09a3i7zfA4potJVDenNVCmqsfXSZQZ+RM9UKys0zm+2Sbfl8DYjm
         m4pg==
X-Gm-Message-State: APjAAAXm6iyzJEUWB0ACOytnV5FYTLJXReX7LJakFw02pOPXFnBreFn2
        Brsm42ewr7k1032zY844R+GxFWIxJMM=
X-Google-Smtp-Source: APXvYqyy9vtuBswinSM3gA+CkvqhWVQn0bJ1HHUZOThgrZvAVwnkJ1TqZG5TZ+OXu7b9UzMunwNKCg==
X-Received: by 2002:a2e:84ce:: with SMTP id q14mr111128ljh.104.1553274526308;
        Fri, 22 Mar 2019 10:08:46 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id f1sm1815161lfc.48.2019.03.22.10.08.45
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Mar 2019 10:08:45 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id l7so2668168ljg.6
        for <linux-parisc@vger.kernel.org>; Fri, 22 Mar 2019 10:08:45 -0700 (PDT)
X-Received: by 2002:a2e:86ca:: with SMTP id n10mr5880284ljj.135.1553274524897;
 Fri, 22 Mar 2019 10:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190322143008.21313-1-longman@redhat.com> <20190322143008.21313-4-longman@redhat.com>
In-Reply-To: <20190322143008.21313-4-longman@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 22 Mar 2019 10:08:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi0wwmY-waC1-2SmBz4-XK-Eru2RTx6PrGzUK=P1nwexQ@mail.gmail.com>
Message-ID: <CAHk-=wi0wwmY-waC1-2SmBz4-XK-Eru2RTx6PrGzUK=P1nwexQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] locking/rwsem: Optimize down_read_trylock()
To:     Waiman Long <longman@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will.deacon@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-alpha@vger.kernel.org" <linux-arm-kernel@lists.infradead.org>,
        linux-c6x-dev@linux-c6x.org, uclinux-h8-devel@lists.sourceforge.jp,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, nios2-dev@lists.rocketboards.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-xtensa@linux-xtensa.org,
        linux-arch <linux-arch@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tim Chen <tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Mar 22, 2019 at 7:30 AM Waiman Long <longman@redhat.com> wrote:
>
> Modify __down_read_trylock() to optimize for an unlocked rwsem and make
> it generate slightly better code.

Oh, that should teach me to read all patches in the series before
starting to comment on them.

So ignore my comment on #1.

                Linus
