Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9A49482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Oct 2001 12:51:42 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15tZJS-0006nT-00; Tue, 16 Oct 2001 19:51:38 +0100
Date: Tue, 16 Oct 2001 19:51:38 +0100
From: Matthew Wilcox <willy@debian.org>
To: Scott Ashcroft <scott.ashcroft@talk21.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] LED device moves around on B160L
Message-ID: <20011016195138.F15532@parcelfarce.linux.theplanet.co.uk>
References: <20011015174630.A3315@cargoclaimsdirect.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011015174630.A3315@cargoclaimsdirect.com>; from scott.ashcroft@talk21.com on Mon, Oct 15, 2001 at 05:46:30PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 15, 2001 at 05:46:30PM +0100, Scott Ashcroft wrote:
> Something weird is going on with the address of the LED device on my
> B160L.
[...]
> I think ffd0c000 is the correct address looks like it broke between pa45
> and pa52.

Looks like this change was intentional.  Here's what's happening:

led_init calls pdc_chassis_info to find the address of the LCD display.
This then calls register_led_driver, passing it that address that you
have above.  Then the lasi driver calls register_led_driver again, but
it's already been initialised, so it returns silently.  This all seems
correct to me.

If PDC is telling us this address, then it ought to be correct... right?
I don't know anything about the LED/LCD stuff yet, so I hope someone
who does can explain why this is correct.

-- 
Revolutions do not require corporate support.
