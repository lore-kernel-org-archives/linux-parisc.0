Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id D60C648EF
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Oct 2001 15:49:40 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [patch] /proc interface for LED/LCD
Date: Sat, 6 Oct 2001 23:49:14 +0200
References: <20011006134250.I17735@tausq.org>
In-Reply-To: <20011006134250.I17735@tausq.org>
MIME-Version: 1.0
Message-Id: <20011006214940.D60C648EF@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Saturday 06 October 2001 22:42, Randolph Chung wrote:
> hi all,
>
> the attached patch creates a /proc interface for boxes with LED/LCD
> support. For example:
> ......
> I've only tested it on a c3000 (only machine i have with led/lcd
> support). Would appreciate if folks can try it on other machines and let
> me know if it works :)

Hi Randolph,

Nice patch !

I've tested it on my 715/64 (with LEDs) and on the c3k (w/ LCD).
On the 715/64 your patch works as expected, but on my c3k I neither
get anything on the LCD nor the /proc/pdc/lcd file.
I know that this doesn't happen due to your patch because I 
didn't got the LCD to work before applying your patch too.
As far as I debugged it until now the pdc_chassis_info() call in
led_init() now returns -10 (PDC_INVALID_ARG) as result code, so maybe
something other is busted here.
Maybe you have any idea ?
All tests were done with the same 32bit kernel binary on both machines
and with your patch to inventory.c applied. I never tested a 64bit kernel
in case this should be relevant.

Helge
