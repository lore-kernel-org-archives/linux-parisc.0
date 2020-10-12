Return-Path: <SRS0=gxf5=DT=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C55DC43457
	for <linux-parisc@archiver.kernel.org>; Mon, 12 Oct 2020 22:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E2752078E
	for <linux-parisc@archiver.kernel.org>; Mon, 12 Oct 2020 22:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OfDqbVxF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388308AbgJLWTL (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 12 Oct 2020 18:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387733AbgJLWSk (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 12 Oct 2020 18:18:40 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD2EC0613D0
        for <linux-parisc@vger.kernel.org>; Mon, 12 Oct 2020 15:18:40 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j30so17525327lfp.4
        for <linux-parisc@vger.kernel.org>; Mon, 12 Oct 2020 15:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J4SqumeB1YgQv0x1Jm7d/tqmvbX1crmxlaZ1m5MG3oA=;
        b=OfDqbVxFOqGLzYnhHrZ0IFyNDqkjxi9b8KIlZlFxr/y3V6zSeWSlSYMumsdSf/3aBM
         KG/sz0uoSJ9IEizz8W76tcT7yk+69T2nOaH4rGM0h3lHJpvLvEeV9oteYD6I/xqMrofs
         YAoIa1BArYx2BLuriJf0imGLucEJRG0jzPab3AMNRPUuMXfmlpI1ISFgtDJt298I5Saf
         8PKLt5Jmeo3QFN/eNaVBJLjjlaYcBcZsNOmmJ+TvKABqJXKREhTjI2zSbTedNMG8Ui/j
         2f7wzuhie2UTjVgyWRTGTH33aoTPrifydj9FF8cGeiuHDGze1SnrtjS7o8N32zgiICAw
         wl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J4SqumeB1YgQv0x1Jm7d/tqmvbX1crmxlaZ1m5MG3oA=;
        b=fDdDiWSc+O1mH10ChDFfND5HbcWf8mT3FMAmR7ISSJIYFDZU7iXssmDfjxMdVBWyH7
         +sqSYm/XssUpizXyhViW68Iro+DHtyl8OAdfz6VbPdM8Di4Onejme8kQaNdPMKdkGJSZ
         TRuZF67C9SQlNkNCI5u/68Xw+TC+9/8JVAiJ0MEOgOTPEgaF9dL7LejhvK+F4g1SKymm
         hVpW/IA6kcz8HDWeVgC8397mZmzNLzRKTAYMX43wQ7hxiwqxKH56Fe1AnH/EiwLa3V41
         Xbob9na5kJePUdu7lV0Dzh9sMg7T0oxDdDFoKbA5N3ASmJl54hOCMe87qYplkSfxQnNo
         yc/g==
X-Gm-Message-State: AOAM530Nay0qUuWyuYAm+kaO9ML/+EAcsWDbZzcCyKV6wRmKcakospGJ
        gqHB9zL57K0DZDQvRXCoFaLKpdQs28CMaYaVxw346Q==
X-Google-Smtp-Source: ABdhPJy3+DdWNCOxYnTCuxD+CbYa27ZxKc8awp524OmaGufVr9hHFU278C/4/xCTFQ3hOhGY2sSdeEN1qo0B7oUZ8LQ=
X-Received: by 2002:a19:8191:: with SMTP id c139mr8154062lfd.333.1602541118637;
 Mon, 12 Oct 2020 15:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de>
In-Reply-To: <20201008154651.1901126-1-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Oct 2020 00:18:27 +0200
Message-ID: <CACRpkdZedudw5VTSaQk3TRiROi87a_=ioqJGxN7Dxq7Qab34-w@mail.gmail.com>
Subject: Re: [PATCH 00/13] Clean up legacy clock tick users
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-ia64@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Oct 8, 2020 at 5:47 PM Arnd Bergmann <arnd@arndb.de> wrote:

> When I created the patch removing CONFIG_ARCH_GETTIMEOFFSET,
> I also had a look at CONFIG_GENERIC_CLOCKEVENTS, which is
> selected by most, but not all, platforms today, each of the
> ones that lack it doing the timer tick slightly differently.
>
> The cleanups here make the old platforms a bit more
> consistent, in multiple ways:
>
> - rather than selecting GENERIC_CLOCKEVENTS on modern
>   platforms, select LEGACY_TIMER_TICK on the old ones.
>
> - Hide some more of the internal implementation and only
>   provide a single common entry point for the timer tick,
>   which also makes the behavior more consistent.
>
> - Remove the m68k and arm specific infrastructure pieces
>   and call the common helper directly from each timer
>   interrupt function.
>
> I tested the series on m68k with the qemu q800 target
> platform, both with the legacy_timer_tick() implementation
> and after converting that to a periodic clockevent driver.

I am a big fan of this patch series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Maybe the RFC patch can be kept in the sidelines but the
rest should be merged ASAP in my opinion, the kernel just
looks so much better after this.

Yours,
Linus Walleij
