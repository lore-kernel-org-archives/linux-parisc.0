Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E55A4831
	for <parisc-linux@parisc-linux.org>; Wed, 18 Jul 2001 16:41:38 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3B560DAC.2BE6D4A2@esiee.fr>
Date: Thu, 19 Jul 2001 00:29:00 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: =?iso-8859-1?Q?Jo=EBl?= Soete <jso@europay.com>,
	parisc-linux@parisc-linux.org <parisc-linux@parisc-linux.org>
References: <OF9ED32FBA.01646964-ONC1256A8D.0059C095@LocalDomain>
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Re: 2.4.6-pa20 question about modules
List-ID: <linux-parisc.vger.kernel.org>

Hi Joël and all,
> 
> With your tips
> (http://lists.parisc-linux.org/pipermail/parisc-linux/2001-July/013081.html)
> 
> the cvs 20010717 seems to works fine.
> (for b180 still have to unplug re-plug kdb)
Nice to know that. But, I think I will deliver a big patch for the
keyboard story. Then, I will need some testers. Thanks to be one of them
:)
> 
> I also try to recompile it with the .config file supply with palinux-0.9.2.
> It also seems to works well but modules are not install naturally.
> Can you explain me how to compile it and install it?
> 
First, you must know that some of the drivers are not modularized yet. I
think that it looks like pc modules. But since I am not a guru in this
stuff, I think someone else will tell you
> Thanks in advance for help,
>      Joel
> 
> PS: How is it possible to cvs co a previous kernel release now (f.e.
> 2.4.0-pa30)?
I would like to know. I think, if you read at Paul Bame litterature, he
said that it is broken for 2.4.0.
I can grab old versions with cvs co -r 1.83 linux, for example.
To know the release you want, use this:
http://puffin.external.hp.com/cgi-bin/cvsview/

Thanks again for reporting, Thomas.
ESIEE Team

PS: I also hope an explanation of modules on hppa. I will have to write
all the cleanup stuff for the mouse.
