Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.ehlo.com (mail.ehlo.com [208.185.90.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE221482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 May 2001 11:39:08 -0600 (MDT)
Date: Sat, 26 May 2001 13:38:32 -0400
From: James FitzGibbon <james@ehlo.com>
To: Jonathan Crockett <jcrockett@midco.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Install CD causes reboot on 712/80
Message-ID: <20010526133832.B38860@ehlo.com>
References: <20010526095116.A38860@ehlo.com> <20010526090421.A30815@volta.midco.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010526090421.A30815@volta.midco.net>; from jcrockett@midco.net on Sat, May 26, 2001 at 09:04:21AM -0500
List-ID: <linux-parisc.vger.kernel.org>

* Jonathan Crockett (jcrockett@midco.net) [010526 10:04]:

> I have a 715/80 with both the on board graphic and a expansion graphic card,
> that had very similar symptoms.  I disconnected the addon graphics card and
> the STI image then worked.  Hope that gives you some insight...

Using the 0.6 serial image worked for me (the 0.61 image died the same as
the STI).  I did try removing what is the only addon card in the box, but it
looks more like cache than video.  It didn't help the 0.61 image.

The output regarding ramdisks is different on 0.6:

INIT: Entering runlevel: 2
Setting up /tmp ramdisk4096+0 records in
4096+0 records out

Then it gives me the login prompt.  On 0.61, it would go:

INIT: Entering runlevel: 2
Setting up /tmp and /var/log ramdisks

and reboot.  So something is different regarding ramdisks (or perhaps mkfs)
on 0.61 vs 0.60.

Thanks for the help.

-- 
j.
