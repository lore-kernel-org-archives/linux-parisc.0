Return-Path: <simmel@anymotion.de>
Received: from mail.3d-boerse.de (port-212-202-156-103.reverse.qsc.de
	[212.202.156.103])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF7824843
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 08:43:33 -0700 (MST)
Message-ID: <00a901c3ecc8$50ef9a00$8100a8c0@punk>
From: "Jens Simmoleit" <simmel@anymotion.de>
To: <parisc-linux@lists.parisc-linux.org>
References: <02d601c3ebef$e3241650$8100a8c0@punk>
	<200402060007.27911.deller@gmx.de>
	<009801c3ecc6$d637d990$8100a8c0@punk>
Date: Fri, 6 Feb 2004 16:45:59 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Subject: [parisc-linux] Additions - Install GNOME on 712/80
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Almost forgot one thing :-)

1. My mouse won't work too *argh*

> Hi List,
>
> Helge, thanks for the tip. I reinstalled from scratch installed the
xserver
> and the gnome packages and it "works now". The gdm started up and said
that
> he couldn't find the font server, the config file said that also local
fonts
> can be used, so I isntalled those too and voila the login page appears.
>
> :-)
>
> But now something strange happens, I type in my user and the password at
the
> gnome desktop login, the screen turns black and after a certain amount of
> time the box comes back with the Gnome login prompt (where I started
from)?
>
> Seems like the system isn't able to log me on, or create a profile, or
> whatever?
>
> What am i missing here????
> Do I need a font server? Is there maybe (an)other missing package(s)....
I'm
> quite sure I have all the gnome packages here, but what about X itself,
> somebody has a clue whats missing or wrong? Maybe a config file for the
> user?
>
> Any idea?
>
> Greets,
> Simmel
>
>
> > Look at the dmesg kernel log and search for a line which starts with
> "stifb:".
> > There you will see the only resolution & bpp color depth which your card
> > currently supports and then verify your /etc/X11/XFree86.config file to
> only
> > have exactly those values enabled. After that change X11 should start
> up....
> >
> > Helge
> >
> >
> > -- 
> > To UNSUBSCRIBE, email to debian-hppa-request@lists.debian.org
> > with a subject of "unsubscribe". Trouble? Contact
> listmaster@lists.debian.org
> >
> >
>
>
> -- 
> To UNSUBSCRIBE, email to debian-hppa-request@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact
listmaster@lists.debian.org
>
>
