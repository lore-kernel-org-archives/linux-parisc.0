Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78F0B483C
	for <parisc-linux@parisc-linux.org>; Thu, 13 Sep 2001 06:38:45 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15hVlU-0000iI-00; Thu, 13 Sep 2001 13:38:44 +0100
Date: Thu, 13 Sep 2001 13:38:44 +0100
From: Matthew Wilcox <willy@debian.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Further serial changes -- PLEASE TEST
Message-ID: <20010913133844.H2618@parcelfarce.linux.theplanet.co.uk>
References: <20010912234208.G2618@parcelfarce.linux.theplanet.co.uk> <20010913112835.R19441@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010913112835.R19441@linuxcare.com>; from rhirst@linuxcare.com on Thu, Sep 13, 2001 at 11:28:35AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 13, 2001 at 11:28:35AM +0100, Richard Hirst wrote:
> B180 is now ok.
> C360 was ok anyway, and still is.

Excellent!  Thanks for testing.

> 715/old orders its serial ports correctly, but as they are
> 
> 6. Scorpio Sr. Core RS-232 (10) at 0xf0823000, versions 0x19, 0x0, 0x75
> 7. Scorpio Sr. Core RS-232 (10) at 0xf0822000, versions 0x19, 0x0, 0x75
> 
> I guess we are just lucky.  0xf0823000 is ttyS0, btw.
> 
> 
> My 712 has
> 5. Gecko 100 Core RS-232 (10) at 0xf0105000, versions 0x1d, 0x0, 0x8c, 0x0, 0x0
> 13. Gecko Optional RS-232 (10) at 0xf0505000, versions 0x18, 0x0, 0x8c, 0x0, 0x0
> 
> It does put 0xf0105000 as ttyS0 as it should, but I guess there
> should be an entry for 0x1d, 0x8c in serial1_tbl[] really?

The way I look at this is that the serial ports really _ought_ to be
listed in the right order.  This is a table of exceptions to cope with
the few cases where that's not true.

-- 
Revolutions do not require corporate support.
