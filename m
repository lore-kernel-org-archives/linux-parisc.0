Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0721482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Apr 2001 02:11:09 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C6AFFB007; Wed, 25 Apr 2001 09:12:04 +0100 (BST)
Date: Wed, 25 Apr 2001 09:12:04 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew van de Werken <mvdw73@one.net.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: FW: [parisc-linux] How do I use the FW scsi on 735?
Message-ID: <20010425091204.J985@linuxcare.com>
References: <A8566E157F5FD411BCFB00D0B7816D51C7294A@ntexchange.cat.csiro.au> <20010423220846.O985@linuxcare.com> <002301c0cd1d$a6d3add0$1401a8c0@peewee>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <002301c0cd1d$a6d3add0$1401a8c0@peewee>; from mvdw73@one.net.au on Wed, Apr 25, 2001 at 10:21:17AM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Apr 25, 2001 at 10:21:17AM +1000, Matthew van de Werken wrote:
> Hi Richard:
> 
> I added the patch (I assume I added it correctly - the resulting vmlinux was
> different), and ran the new kernel, with no change. The FW scsi is still not
> recognised.

Shame :(  The Zalon driver is the one you are interested in.  My B180
with a Bluefish (Zalon based) FWD card runs the sim700, zalon, and
sym53c8xx drivers all at the same time, no problem.

It's possible I got the parameters wrong in my patch; the aim is to
cause drivers/scsi/zalon7xx.c:zalon_scsi_callback() to get called
for your interface.  It could be that is getting called but failing
for some reason.  If it is called, you should at least be getting
a line

        ......: Zalon vers field is ......

output on boot.

If you don't see that, perhaps you can investigate by adding a few
printk()'s to see what I got wrong.

zalon7xx_detect() is surely getting called, and that uses register_driver()
in arch/parisc/kernel/drivers.c to try and match your cards parameters
against one of the entries in zalon_scsi_drivers[].  Try and figure out
why that match is not succeeding for your scsi interface.

Richard
