Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7262C4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 15:12:45 -0700 (MST)
Sender: marteaut@esiee.fr
Message-ID: <3A8076D8.CF5E8CCD@esiee.fr>
Date: Tue, 06 Feb 2001 23:12:40 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: "M. Grabert" <xam@deathsdoor.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Generic Parisc Linux Kernel Questions & 9000/730
 success report
References: <Pine.LNX.4.21.0102061808500.2465-100000@sgate.charlysworld.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Max,

	Here is the ESIEE Team answer! (Exactly what our experince told us :))
smb is one of the most famous questions of LWE Paris. So someone will
have to port it.
We do not think that it has been done yet

> smb won't compile
do not know> netware won't compile
do not know> ppp_sync won't compile

> fbcon-sti won't compile (at least when I don't compile STI-console)
The matter of frame buffer is quite complex. When we look at the code,
the fb-sti init is the first then came up the sti-console init. This
explained the snow you have on the screeen when you compile a kernel
with fbcon-sti and sti-console. This info can be out of date! If someone
has a better news , speak :)

> hwclock doesn't work (can't use /dev/rtc), 'though I seems the
>    time and date is read correctly (but hwclock can't set them).
>    Is this a known problem ?
We think also about /dev/rtc as Grant told you

> Is the well known problem of the missing termcap fixed in the new nfsroot?
Do not think so
> 
> Is is enough to copy nfsroot onto the scsi disc and adopt /etc/fstab,
>    or should I use base.tgz ? what's the difference ?
As we use the network for nfs and ftp, you have to configure the
following files:
/etc/hostname
/etc/network/interfaces
/etc/fstab
also you have to check
/dev/console for sti it should be linked to /dev/tty0
	     for serial it should be linked to /dev/ttyS0
It seems interesting to lokk into /etc/inittab 

> Mhhh. missing ftp and (open)ssh, strace in (old) nfstools. Are they in the
>    new one?
ftp packages (client/server) are available: http://www.esiee.fr/puffin
> 
> Does the new xc fix major problems or is it just a a little update ?
>    IMHO there was a lot done for parisc64, but also for parisc(32) ?
We agree but it is our reason to work, isn't it? 

Here ends what we could answer. Good Luck to all :)

ESIEE Team
