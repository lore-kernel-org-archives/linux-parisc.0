Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C70B484B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 18:40:13 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15qkwE-0001x7-00; Tue, 09 Oct 2001 01:40:02 +0100
Date: Tue, 9 Oct 2001 01:40:02 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matt.VanDeWerken@csiro.au
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New scsi driver for 53c700 and 53c710 committe d
Message-ID: <20011009014002.B25819@parcelfarce.linux.theplanet.co.uk>
References: <A8566E157F5FD411BCFB00D0B7816D51C72B8E@ntexchange.cat.csiro.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <A8566E157F5FD411BCFB00D0B7816D51C72B8E@ntexchange.cat.csiro.au>; from Matt.VanDeWerken@csiro.au on Tue, Oct 09, 2001 at 09:06:33AM +1000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 09, 2001 at 09:06:33AM +1000, Matt.VanDeWerken@csiro.au wrote:
> So will this new driver work on the 735-series? Please tell me it's so...

I presume you're talking about the fast-wide-differential scsi port?
That's a ncr720, not 700 or 710 chip.  The basic driver for that is fine,
but it doesn't recognise the chip as being something it should drive.

-- 
Revolutions do not require corporate support.
