Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ccd.cargoclaimsdirect.com (unknown [62.6.162.114])
	by dsl2.external.hp.com (Postfix) with ESMTP id ACB47482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Oct 2001 14:21:28 -0600 (MDT)
Date: Tue, 16 Oct 2001 21:15:55 +0100
From: Scott Ashcroft <scott.ashcroft@talk21.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] LED device moves around on B160L
Message-ID: <20011016211555.A3948@cargoclaimsdirect.com>
References: <20011015174630.A3315@cargoclaimsdirect.com> <20011016195138.F15532@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011016195138.F15532@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 16, 2001 at 07:51:38PM +0100, Matthew Wilcox wrote:
> On Mon, Oct 15, 2001 at 05:46:30PM +0100, Scott Ashcroft wrote:
> > Something weird is going on with the address of the LED device on my
> > B160L.
> [...]
> > I think ffd0c000 is the correct address looks like it broke between pa45
> > and pa52.
> 
> Looks like this change was intentional.  Here's what's happening:
> 
> led_init calls pdc_chassis_info to find the address of the LCD display.
> This then calls register_led_driver, passing it that address that you
> have above.  Then the lasi driver calls register_led_driver again, but
> it's already been initialised, so it returns silently.  This all seems
> correct to me.
> 
> If PDC is telling us this address, then it ought to be correct... right?
> I don't know anything about the LED/LCD stuff yet, so I hope someone
> who does can explain why this is correct.

The correct address seems to be f0190001. I've verified this by checking
that the LEDs work when that address gets detected.
The lasi driver tries to register ffd0c000 but as you say it gets ignored.
Don't know why the PDC returns f0190000 every so often.

Thanks for looking,
Scott
