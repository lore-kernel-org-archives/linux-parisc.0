Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB907483C
	for <parisc-linux@parisc-linux.org>; Thu, 13 Sep 2001 04:28:44 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 000D8B00C; Thu, 13 Sep 2001 11:28:35 +0100 (BST)
Date: Thu, 13 Sep 2001 11:28:35 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Further serial changes -- PLEASE TEST
Message-ID: <20010913112835.R19441@linuxcare.com>
References: <20010912234208.G2618@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010912234208.G2618@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Sep 12, 2001 at 11:42:08PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 12, 2001 at 11:42:08PM +0100, Matthew Wilcox wrote:
> 
> Richard reports the serial ports on his B180 are still swapped.  I
> think I understand why and the following patch should fix it as well
> as several other B/C/J `hundred' class machines.  It might also fix
> the A180 (is this broken without the patch?  I haven't seen reports).

B180 is now ok.
C360 was ok anyway, and still is.


715/old orders its serial ports correctly, but as they are

6. Scorpio Sr. Core RS-232 (10) at 0xf0823000, versions 0x19, 0x0, 0x75
7. Scorpio Sr. Core RS-232 (10) at 0xf0822000, versions 0x19, 0x0, 0x75

I guess we are just lucky.  0xf0823000 is ttyS0, btw.


My 712 has
5. Gecko 100 Core RS-232 (10) at 0xf0105000, versions 0x1d, 0x0, 0x8c, 0x0, 0x0
13. Gecko Optional RS-232 (10) at 0xf0505000, versions 0x18, 0x0, 0x8c, 0x0, 0x0

It does put 0xf0105000 as ttyS0 as it should, but I guess there
should be an entry for 0x1d, 0x8c in serial1_tbl[] really?

Richard
