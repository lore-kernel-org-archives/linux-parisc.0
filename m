Return-Path: <SRS0=SeGT=QE=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA1AC282C8
	for <linux-parisc@archiver.kernel.org>; Mon, 28 Jan 2019 08:54:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C844120880
	for <linux-parisc@archiver.kernel.org>; Mon, 28 Jan 2019 08:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfA1IyE (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 28 Jan 2019 03:54:04 -0500
Received: from smtpq3.tb.mail.iss.as9143.net ([212.54.42.166]:47166 "EHLO
        smtpq3.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726611AbfA1IyE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 28 Jan 2019 03:54:04 -0500
X-Greylist: delayed 1102 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Jan 2019 03:54:03 EST
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
        by smtpq3.tb.mail.iss.as9143.net with esmtp (Exim 4.86_2)
        (envelope-from <jongk@linux-m68k.org>)
        id 1go2OK-0004ai-Ni
        for linux-parisc@vger.kernel.org; Mon, 28 Jan 2019 09:35:40 +0100
Received: from mail-lf1-f52.google.com ([209.85.167.52])
        by smtp7.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <jongk@linux-m68k.org>)
        id 1go2O9-0001I2-NW
        for linux-parisc@vger.kernel.org; Mon, 28 Jan 2019 09:35:29 +0100
Received: by mail-lf1-f52.google.com with SMTP id i26so11217638lfc.0
        for <linux-parisc@vger.kernel.org>; Mon, 28 Jan 2019 00:35:29 -0800 (PST)
X-Gm-Message-State: AJcUukceDqFlaiFzxw5ITeuaGjnoAvlTlCvizpc6A/Ftnk1whi1KaCA7
        2MhgsJvlc812QtE6EDMOy3/U6WeFkodXSM6Allg=
X-Google-Smtp-Source: ALg8bN4a5DYwSg+c496+R5ACk7/y8MD/L52zmSaNdqDJWsxbHkzKLRGTAjiMOE9BdnnaN+wTMwdkCVnhC3BJZDZ036E=
X-Received: by 2002:a19:9781:: with SMTP id z123mr16786109lfd.80.1548664529082;
 Mon, 28 Jan 2019 00:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20181127210107.GA11661@ls3530.dellerweb.de> <alpine.LNX.2.21.1811280815210.28@nippy.intranet>
 <908a3147-1fac-6f38-c61c-b88c81dd23ff@gmx.de> <alpine.LNX.2.21.1901080855180.34@nippy.intranet>
 <CACz-3rg0Jp-QO-1aunwWOFZmd4sdcjQ8cq8QwD5HE+r8t_QQ_A@mail.gmail.com>
 <CACz-3rjx=bcn7qK8qM_mYrW70d-OCpqO1iXS6DZVFb+G_dhvKg@mail.gmail.com> <df8a7f49-920f-c57f-cb3c-4f775e0fbaca@gmx.de>
In-Reply-To: <df8a7f49-920f-c57f-cb3c-4f775e0fbaca@gmx.de>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Mon, 28 Jan 2019 09:35:17 +0100
X-Gmail-Original-Message-ID: <CACz-3rgc4gcbpdCDCFrWPCasZ57KBNu9CyejTxqZrk76mP1Bgw@mail.gmail.com>
Message-ID: <CACz-3rgc4gcbpdCDCFrWPCasZ57KBNu9CyejTxqZrk76mP1Bgw@mail.gmail.com>
Subject: Re: [RFC][PATCH] m68k/parisc: Convert hp_sdc_rtc driver to rtc framework
To:     Helge Deller <deller@gmx.de>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.167.52
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=YLjhNiOx c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=3JhidrIBZZsA:10 a=pUNw9UQrZxlDqcxJZqcA:9 a=QEXdDO2ut3YA:10
X-Ziggo-Spam-Status: No
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Op za 26 jan. 2019 om 14:47 schreef Helge Deller <deller@gmx.de>:
>
> Hello Kars,
>
> On 21.01.19 09:45, Kars de Jong wrote:
> > I tried to test the patch this weekend. I first started with an
> > unpatched kernel. Unfortunately, there are hardware issues:
> >
> > 1. The battery of the RTC is dead.
> > 2. There seems to be a problem which causes autovector interrupt 1 to
> > fire spuriously, which is the keyboard and DMA interrupt. At least,
> > that's what the OpenBSD kernel reports. It seems to cause the Linux
> > kernel to freeze.
> > 3. The harddisk (original 200 MB Rodime RO3000T) is failing, so I
> > can't fully boot OpenBSD to further verify this problem.
>
> Thanks for the willingness to test, and sorry to hear about that issues!
> I hope you get them fixed at some point.
> Testing on real hardware is always useful.

The issues seem to be less severe than I thought. A new battery is on
its way, the interrupt problem was caused by an issue when using the
keyboard in the OpenBSD boot loader and I don't need the harddisk for
testing Linux.
My netboot environment is back up and running.
The last kernel I ever ran on the box (a patched Linux 2.6.20) booted
to multi user. That one was built in March 2007, which according to my
NFS root file system was also the last time the box actually ran
Linux...

There's now also a working HP9000/360 emulation in MAME (it's capable
of running HP-UX 9 including HP VUE so it's pretty complete) so that
may also become a viable option for testing.

> > Anyway, I don't think your patch it will work.
> >
> > When running on m68k, you're passing a NULL device pointer to
> > devm_rtc_device_register(), which eventually gets passed to
> > devres.c:add_dr() and that is definitely not OK.
>
> I was aware of the NULL pointer, which is why I wanted real
> feedback about my patch. Ideally someone with platform knowhow
> could add the missing pieces to fix this NULL pointer code.
>
> > I think this calls for a proper platform device on the m68k side.
>
> Yes. Who could add that?

I can. I would first like to have a more recent kernel that actually
boots though. It looks like the hp300_defconfig (which is what I used)
isn't quite set up correctly.

Kind regards,

Kars.
