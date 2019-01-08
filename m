Return-Path: <SRS0=d2uh=PQ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1062DC43387
	for <linux-parisc@archiver.kernel.org>; Tue,  8 Jan 2019 08:53:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D079A2070B
	for <linux-parisc@archiver.kernel.org>; Tue,  8 Jan 2019 08:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbfAHIxP (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 8 Jan 2019 03:53:15 -0500
Received: from smtpq4.mnd.mail.iss.as9143.net ([212.54.34.167]:37458 "EHLO
        smtpq4.mnd.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726333AbfAHIxP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 8 Jan 2019 03:53:15 -0500
X-Greylist: delayed 1104 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Jan 2019 03:53:14 EST
Received: from [212.54.34.115] (helo=smtp7.mnd.mail.iss.as9143.net)
        by smtpq4.mnd.mail.iss.as9143.net with esmtp (Exim 4.86_2)
        (envelope-from <jongk@linux-m68k.org>)
        id 1ggmqX-00006J-7E
        for linux-parisc@vger.kernel.org; Tue, 08 Jan 2019 09:34:49 +0100
Received: from mail-lj1-f169.google.com ([209.85.208.169])
        by smtp7.mnd.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <jongk@linux-m68k.org>)
        id 1ggmqX-0000YR-4v
        for linux-parisc@vger.kernel.org; Tue, 08 Jan 2019 09:34:49 +0100
Received: by mail-lj1-f169.google.com with SMTP id u89-v6so2689984lje.1
        for <linux-parisc@vger.kernel.org>; Tue, 08 Jan 2019 00:34:49 -0800 (PST)
X-Gm-Message-State: AJcUukdHO1LYDot1R4VQLbGpN4x+0voE9/s2jT4S/znVQS2eD0n1xoUI
        GOUpnNDAtjrvEaDlCmjCcXsofb/jmcdJ4V4Aea4=
X-Google-Smtp-Source: ALg8bN72mYWV1BI1KEw7jtnh95gh0jzjxqRRN8FqOEKSIIfD2WiWmjVf2BkDRvnuFIhR5itbmlucMhegy1yLbalw6M0=
X-Received: by 2002:a2e:7f04:: with SMTP id a4-v6mr560879ljd.156.1546936488589;
 Tue, 08 Jan 2019 00:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20181127210107.GA11661@ls3530.dellerweb.de> <alpine.LNX.2.21.1811280815210.28@nippy.intranet>
 <908a3147-1fac-6f38-c61c-b88c81dd23ff@gmx.de> <alpine.LNX.2.21.1901080855180.34@nippy.intranet>
In-Reply-To: <alpine.LNX.2.21.1901080855180.34@nippy.intranet>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Tue, 8 Jan 2019 09:34:37 +0100
X-Gmail-Original-Message-ID: <CACz-3rg0Jp-QO-1aunwWOFZmd4sdcjQ8cq8QwD5HE+r8t_QQ_A@mail.gmail.com>
Message-ID: <CACz-3rg0Jp-QO-1aunwWOFZmd4sdcjQ8cq8QwD5HE+r8t_QQ_A@mail.gmail.com>
Subject: Re: [RFC][PATCH] m68k/parisc: Convert hp_sdc_rtc driver to rtc framework
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Helge Deller <deller@gmx.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.208.169
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=S6mnP7kP c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=3JhidrIBZZsA:10 a=8981fWPbAAAA:8 a=yTy-wk4C7kLxNe33bcsA:9 a=QEXdDO2ut3YA:10 a=o72u2rHnfW5qNJ_4I8LD:22
X-Ziggo-Spam-Status: No
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Op ma 7 jan. 2019 om 22:59 schreef Finn Thain <fthain@telegraphics.com.au>:
>
> On Mon, 7 Jan 2019, Helge Deller wrote:
>
> > On 27.11.18 22:17, Finn Thain wrote:
> > > Adding Kars to Cc.
> >
> > Any chance this can get tested on m68k?
> >
>
> Sorry, I don't have any HP9000/300 hardware. I think that Kars does, which
> is why I Cc'd him...
>

Yes, I do still have the hardware, but I haven't booted Linux on it
for a long time. I planned on doing it during the holidays, but didn't
get around to it. Maybe I can test it this weekend, but don't hold
your breath...

Kind regards,

Kars.
