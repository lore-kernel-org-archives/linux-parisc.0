Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62B504832
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 05:50:53 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1B6B7B00C; Fri,  6 Jul 2001 12:50:07 +0100 (BST)
Date: Fri, 6 Jul 2001 12:50:07 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Rafael Herrera <raffo@neuronet.pitt.edu>
Cc: marteau <marteaut@esiee.fr>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem in palinux-0.9.1 image with directory "debian" !!
Message-ID: <20010706125007.V23509@linuxcare.com>
References: <20010705131056.EF90CD15A6@mail.esiee.fr> <3B448B40.E94BCCE8@neuronet.pitt.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B448B40.E94BCCE8@neuronet.pitt.edu>; from raffo@neuronet.pitt.edu on Thu, Jul 05, 2001 at 11:44:00AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 05, 2001 at 11:44:00AM -0400, Rafael Herrera wrote:
> The is something wrong with the new iso. I get:
> 
> Trying scsi.2.0
> Boot path initialized.
> Attempting to load IPL.
> 
> IPL error: bad LIF magic.
> 
> I verified the md5sum value from that of the website
> (473c029b513472cccab1a4d6e2156619) and burnt the CD a 2x speed. The
> image I got last night booted normally. This a 715/75 machine.

Yep, the new image has a problem.  Expect another update in
a few days.

Alternatively, set up rbootd and netboot the lifimage from the
CD.  Once in the installer, you can install from CD as normal.
I assume you are on serial console?  My 715/75 didn't work with
graphical console last time I tried.

Yet another alternative, if the cd you got "last night" was the
earler 0.9.1 ISO, and you still have it, then boot from that
and switch to the new one before installing anything.

These 0.9.1 ISOs all have the same basic filesystem content, they just
have problems with the palo or mkisofs stage of the mastering.

Richard
