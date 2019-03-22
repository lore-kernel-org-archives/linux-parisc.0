Return-Path: <SRS0=iCLC=RZ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE81C43381
	for <linux-parisc@archiver.kernel.org>; Fri, 22 Mar 2019 17:07:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A91A2190A
	for <linux-parisc@archiver.kernel.org>; Fri, 22 Mar 2019 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553274447;
	bh=ZAh4cwuJavt2z9KTEO6p7hKKHwYKJaaWgEufMtMOppI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=cvZ/WM4AjmEPp8HpH7/+5vLWOqbhax0a6NlvGcfdOt9h60tP9MdgD4RQqZ2/0HvxQ
	 dXN3Up4l+ZfcnFRaXEnnOGfg6ez7eAwY81hBaIRam0o4LE3YHfzb0uQt+xPhLlf71D
	 HoAtzVl2iH++qLMJT+9JEG72abj5jGQ6WMqen5Hg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbfCVRH0 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 22 Mar 2019 13:07:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33128 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728713AbfCVRHZ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 22 Mar 2019 13:07:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id f23so2692992ljc.0
        for <linux-parisc@vger.kernel.org>; Fri, 22 Mar 2019 10:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K5KpCUavpU6jklxItqvKr4mbyrohs/asqf5NX0BYYpc=;
        b=Xicmuh1ND+AZ9lc/udGkNvWbzi2Lu2j3o6M44sYQ0ZH2WsGeVBgW5f2xPJwNTxlY2d
         JaSMsr2SEVdWRDbZBYCXJ0vB1W1wIN3vVWqOMIiqWhD3oBYZFF9I7ROZZs9bJvkPzu9N
         HN8UN8zBc9zkjew06tZVB45+s5iWpvEon1EZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K5KpCUavpU6jklxItqvKr4mbyrohs/asqf5NX0BYYpc=;
        b=BOzSd71emWslGNaEA6Jgs2k0AWHzwL6bnx+CFOwokK+b1szLhhRoYXbEPT+4C5/qIC
         zAnYR6Kl/WnFdX0ooQe5gv8ehC13nlWQW7fyVox6X4ikq2x+Qxa8Ml5+SSCkzbvWUuyg
         2CBqkvdOyC70XBnwRyzkez6leOC9aEjyPPhZsHJ1TIz7kz2zHm86VwPA5zrbMrB9PwmT
         Jp3t+GreuHyaeLqz41Oq5QviRhb/RddvTnXELSs7rcFv34NSaIe4W1J9m982qV4fMR7A
         krzqbmHOw9Q6hkVGbhgslqtWCjgmfs2H4VpAeLiE7S0w69TED5RViHvE/Jz6ofIRzw0A
         s/ng==
X-Gm-Message-State: APjAAAXk9hzHcRhX1CTLBTnpVKgAs+wy8zDjnpF0jZeKykbUVyWBWjRV
        vF5Rzd8S2xTKOYtb3B5md5iAyY7pUQo=
X-Google-Smtp-Source: APXvYqyL20ykPvALhXIxlJ8vBsXacT9m6coOgdjT5hOkxKwxFBVeBce3aiINYi/mtY0QHo/XFPuJ3g==
X-Received: by 2002:a2e:9f05:: with SMTP id u5mr3851214ljk.183.1553274442704;
        Fri, 22 Mar 2019 10:07:22 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id i190sm1803112lfi.43.2019.03.22.10.07.20
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Mar 2019 10:07:21 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id f18so2652486lja.10
        for <linux-parisc@vger.kernel.org>; Fri, 22 Mar 2019 10:07:20 -0700 (PDT)
X-Received: by 2002:a2e:9786:: with SMTP id y6mr5380150lji.79.1553274440270;
 Fri, 22 Mar 2019 10:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190322143008.21313-1-longman@redhat.com> <20190322143008.21313-3-longman@redhat.com>
In-Reply-To: <20190322143008.21313-3-longman@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 22 Mar 2019 10:07:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjujKK-Ey7DPnMExaEmphicuEDLmVn-9+W9VzFzR-Ts=A@mail.gmail.com>
Message-ID: <CAHk-=wjujKK-Ey7DPnMExaEmphicuEDLmVn-9+W9VzFzR-Ts=A@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] locking/rwsem: Remove rwsem-spinlock.c & use
 rwsem-xadd.c for all archs
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
> For simplication, we are going to remove rwsem-spinlock.c and make all
> architectures use a single implementation of rwsem - rwsem-xadd.c.

Ack.

               Linus
