Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA16337
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 07:31:38 -0600
Date: Wed, 22 Sep 1999 15:34:00 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Hannu Martikka <martikka@stybba.ntc.nokia.com>
Cc: Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] C360 boot problem
Message-ID: <19990922153400.A5481@suse.de>
References: <199909220426.VAA27105@milano.cup.hp.com> <Pine.HPX.4.05.9909220937120.2148-100000@gamgee.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.HPX.4.05.9909220937120.2148-100000@gamgee.ntc.nokia.com>; from Hannu Martikka on Wed, Sep 22, 1999 at 09:45:51AM +0300
List-ID: <linux-parisc.vger.kernel.org>

> I downloaded the latest kernel(+ramdisk) from CVS and tried it on my C360.
> It does not print anything on screen but just blinks the leds. Here's what
> it looks like:
> 
> Leds:	1234
> 	II
> 	I  I
> 	I I 
> and then from the begining...
> 
> I guess it is trying to tell me something, but what?

Can you try to get the PIM contents and search for the symbols closest to
IAOQ / CR18 in your System.map ?

	Philipp Rumpf
