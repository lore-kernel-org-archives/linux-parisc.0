Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC625482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Jun 2001 19:13:50 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Bnbw-0005pA-00; Mon, 18 Jun 2001 02:13:48 +0100
Date: Mon, 18 Jun 2001 02:13:48 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Tom <tom@Alaskatech.org>
Cc: buggz <buggz@america.net>,
	PA-RISC Linux list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] PALO/kernel-build change proposal
Message-ID: <20010618021348.H10186@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.33.0106172013490.20079-100000@buggz1.buggz.net> <Pine.LNX.4.33.0106171703250.18884-100000@devnull.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0106171703250.18884-100000@devnull.alaskatech.org>; from tom@Alaskatech.org on Sun, Jun 17, 2001 at 05:05:20PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jun 17, 2001 at 05:05:20PM -0800, Tom wrote:
> > > I don't suppose someone has an updated how-to for actually *using* your
> > > new kernel, do they? Replacing /boot/vmlinux-2.4.0 with the new one
> > > results in an immediate hang on reboot...
> >
> > *shrug*
> > Well, I've made two successful kernels, cp'd to /boot, edited
> > /etc/palo.conf, just like normal to me.
> 
> Hmmm... I tried that - copied lifimage to /boot/vmlinux-240-pa15, edited
> /etc/palo.conf to change the kernel listed, then ran palo to update it and
> rebooted. Same error - can't understand the kernel executable format.

Sounds like you're using the lifimage instead of the vmlinux.

-- 
Revolutions do not require corporate support.
