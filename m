Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA28809
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 13:52:38 -0700
Received: from athena.louisville.edu (athena.louisville.edu [136.165.1.37])
	by erouter1.it-datacntr.louisville.edu (Postfix) with ESMTP id 8A9DA22E6B
	for <parisc-linux@thepuffingroup.com>; Wed, 17 Jan 2001 15:56:20 -0500 (EST)
Date: Wed, 17 Jan 2001 15:55:47 -0500
From: "Phillip D. Beal" <pdbeal@louisville.edu>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100
Message-ID: <20010117155547.B145024@athena.louisville.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 17, 2001 at 05:40:57AM +0100, Aleksandr Konstantinov wrote:
> > > Do You mean CONFIG_STI_CONSOLE ? I have it, and CONFIG_SERIAL_CONSOLE
> > > too.
> > > Palo also sets console=tty0 .  Booting goes till "Switching from PDC
> > > console"
> > > and then welcome message from palinux cdrom appears on serial link.
> >
> > Try to enable just one of both: CONFIG_STI_CONSOLE _or_ CONFIG_SERIAL_CONSOLE
> 
>  I tried it and got following behavior:
> 
>   While kernel starts/initializes screen stays black. When it suddenly fills with
> scattered characters (I could
> read few words on screen: TCP, UDP RARP, Init and even something, that looks like
> Welcome).
On the 735 and 755 that I've been wrking with, it appears to be all the
Capitol letters come through and the numbers, but the lower case letters
either don't show up or show up as weird ascii charcters...

-- 
Phillip Beal                           ___           _               _   
Electrical and Computer Engineering   | _ ) ___ __ _| |___  _ _  ___| |_ 
pdbeal@louisville.edu                 | _ \/ -_) _` | |_ /_| ' \/ -_)  _|
http://www.bealz.net/                 |___/\___\__,_|_/__(_)_||_\___|\__|
