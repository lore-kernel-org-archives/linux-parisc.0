Return-Path: <SRS0=O7vF=P5=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762EEC282DB
	for <linux-parisc@archiver.kernel.org>; Mon, 21 Jan 2019 08:45:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CE0D20861
	for <linux-parisc@archiver.kernel.org>; Mon, 21 Jan 2019 08:45:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbfAUIpR (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 21 Jan 2019 03:45:17 -0500
Received: from smtpq3.mnd.mail.iss.as9143.net ([212.54.34.166]:49886 "EHLO
        smtpq3.mnd.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727993AbfAUIpR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Jan 2019 03:45:17 -0500
Received: from [212.54.34.115] (helo=smtp7.mnd.mail.iss.as9143.net)
        by smtpq3.mnd.mail.iss.as9143.net with esmtp (Exim 4.86_2)
        (envelope-from <jongk@linux-m68k.org>)
        id 1glVCl-0005Pl-Fu
        for linux-parisc@vger.kernel.org; Mon, 21 Jan 2019 09:45:15 +0100
Received: from mail-lj1-f178.google.com ([209.85.208.178])
        by smtp7.mnd.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <jongk@linux-m68k.org>)
        id 1glVCl-00084L-DM
        for linux-parisc@vger.kernel.org; Mon, 21 Jan 2019 09:45:15 +0100
Received: by mail-lj1-f178.google.com with SMTP id v15-v6so16732861ljh.13
        for <linux-parisc@vger.kernel.org>; Mon, 21 Jan 2019 00:45:15 -0800 (PST)
X-Gm-Message-State: AJcUukfgy4zdHsMUQdaS9DRinm5QUH9YGjc3M6/vwW+MwHAn89Y7r6bU
        kQaia/9IY8ot9sIe+Pvkh/IIOeUvja0sBr1YBm0=
X-Google-Smtp-Source: ALg8bN4pgO7qA4pD3xpJIWMiPf7hVZx7balWxTJ2QZjP6FunTNWo5JoN1MA2qeYP+SrBSUHzaDo6N3mtAZ0gW2q8dX8=
X-Received: by 2002:a2e:7f04:: with SMTP id a4-v6mr18708351ljd.156.1548060314842;
 Mon, 21 Jan 2019 00:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20181127210107.GA11661@ls3530.dellerweb.de> <alpine.LNX.2.21.1811280815210.28@nippy.intranet>
 <908a3147-1fac-6f38-c61c-b88c81dd23ff@gmx.de> <alpine.LNX.2.21.1901080855180.34@nippy.intranet>
 <CACz-3rg0Jp-QO-1aunwWOFZmd4sdcjQ8cq8QwD5HE+r8t_QQ_A@mail.gmail.com>
In-Reply-To: <CACz-3rg0Jp-QO-1aunwWOFZmd4sdcjQ8cq8QwD5HE+r8t_QQ_A@mail.gmail.com>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Mon, 21 Jan 2019 09:45:03 +0100
X-Gmail-Original-Message-ID: <CACz-3rjx=bcn7qK8qM_mYrW70d-OCpqO1iXS6DZVFb+G_dhvKg@mail.gmail.com>
Message-ID: <CACz-3rjx=bcn7qK8qM_mYrW70d-OCpqO1iXS6DZVFb+G_dhvKg@mail.gmail.com>
Subject: Re: [RFC][PATCH] m68k/parisc: Convert hp_sdc_rtc driver to rtc framework
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Helge Deller <deller@gmx.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.208.178
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=S6mnP7kP c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=3JhidrIBZZsA:10 a=tBb2bbeoAAAA:8 a=8981fWPbAAAA:8 a=f_8He4JNwzOeKrkuQTkA:9 a=QEXdDO2ut3YA:10 a=Oj-tNtZlA1e06AYgeCfH:22 a=o72u2rHnfW5qNJ_4I8LD:22
X-Ziggo-Spam-Status: No
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Op di 8 jan. 2019 om 09:34 schreef Kars de Jong <jongk@linux-m68k.org>:
> Op ma 7 jan. 2019 om 22:59 schreef Finn Thain <fthain@telegraphics.com.au>:
> >
> > On Mon, 7 Jan 2019, Helge Deller wrote:
> >
> > > On 27.11.18 22:17, Finn Thain wrote:
> > > > Adding Kars to Cc.
> > >
> > > Any chance this can get tested on m68k?
> > >
> >
> > Sorry, I don't have any HP9000/300 hardware. I think that Kars does, which
> > is why I Cc'd him...
> >
>
> Yes, I do still have the hardware, but I haven't booted Linux on it
> for a long time. I planned on doing it during the holidays, but didn't
> get around to it. Maybe I can test it this weekend, but don't hold
> your breath...

I tried to test the patch this weekend. I first started with an
unpatched kernel. Unfortunately, there are hardware issues:

1. The battery of the RTC is dead.
2. There seems to be a problem which causes autovector interrupt 1 to
fire spuriously, which is the keyboard and DMA interrupt. At least,
that's what the OpenBSD kernel reports. It seems to cause the Linux
kernel to freeze.
3. The harddisk (original 200 MB Rodime RO3000T) is failing, so I
can't fully boot OpenBSD to further verify this problem.

Anyway, I don't think your patch it will work.

When running on m68k, you're passing a NULL device pointer to
devm_rtc_device_register(), which eventually gets passed to
devres.c:add_dr() and that is definitely not OK.

I think this calls for a proper platform device on the m68k side.

Kind regards,

Kars.
