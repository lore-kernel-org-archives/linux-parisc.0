Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 647FB4843
	for <parisc-linux@lists.parisc-linux.org>; Sun,  7 Oct 2001 00:56:56 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [patch] /proc interface for LED/LCD
Date: Sun, 7 Oct 2001 08:56:38 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <20011006134250.I17735@tausq.org> <E15pzKV-0000ZU-00@gandalf.tausq.org> <20011006153445.J17735@tausq.org>
In-Reply-To: <20011006153445.J17735@tausq.org>
MIME-Version: 1.0
Message-Id: <20011007065656.647FB4843@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Sunday 07 October 2001 00:34, Randolph Chung wrote:
> > I know that this doesn't happen due to your patch because I
> > didn't got the LCD to work before applying your patch too.
> > As far as I debugged it until now the pdc_chassis_info() call in
> > led_init() now returns -10 (PDC_INVALID_ARG) as result code, so maybe
> > something other is busted here.
> > Maybe you have any idea ?
>
> In my other post I mentioned you also need a fix to firmware.c .. did
> you pick that up too?
>
> randolph

Yes, I did. Unfortunately I mentioned inventory.c, but originally meant 
firmware.c in my previous mail.

Helge
