Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA20361
	for <parisc-linux@puffin.external.hp.com>; Tue, 27 Jul 1999 06:44:45 -0600
Received: from grcbd508.grc.hp.com (root@grcbd508.grc.hp.com [15.139.203.207])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id FAA15877
	for <parisc-linux@thepuffingroup.com>; Tue, 27 Jul 1999 05:45:27 -0700 (PDT)
Received: (from imatthae@localhost)
	by grcbd508.grc.hp.com (8.9.3/8.9.3) id OAA26365
	for parisc-linux@thepuffingroup.com; Tue, 27 Jul 1999 14:45:18 +0200
Date: Tue, 27 Jul 1999 14:45:17 +0200
From: Ingo Matthaes <imatthae@grcbd508.grc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] howto boot test kernel
Message-ID: <19990727144517.A26280@grcbd508.grc.hp.com>
References: <379DA5BF.1B620A9E@atos-group.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <379DA5BF.1B620A9E@atos-group.com>; from valery brasseur on Tue, Jul 27, 1999 at 02:27:43PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 27, 1999 at 02:27:43PM +0200, valery brasseur wrote:
> I have on old 712, I would like to make a try to linux kernel.
> What did I need and how to setup things for booting the kernel, and
> maybe giving some help on developpment.( I have other stations/server
> under HPUX 10.20 where I can put a developement env?)

I've tried it successfully on my 715/33 using a bootp server.
Just use the cvs-linux tree, install gcc-2.8.1 or whatever with
binutils and GNU make.
For make menuconfig you have to install ncurses too.
Just type make dep boot and copy linux/arch/parisc/boot/Image to
the path specified in bootptab and thats it.

  Ingo

P.S. dd if=Image of=/dev/rdsk/blafasel works too, but the first
     solution is more useful :-) 

-- 
Ingo Matthaes
HP-UX Net und Linux Support
HP Support Center Ratingen
