Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id E5A77482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Oct 2001 12:12:16 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: joel.soete@freebel.net
Subject: Re: [parisc-linux] Xfree86 failled with -pa57
Date: Mon, 15 Oct 2001 20:11:12 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <1003154375.3bcaebc713db3@webmail.tiscalinet.be> <20011015180923.A14160@elvis.franken.de> <1003166094.3bcb198edae10@webmail.tiscalinet.be>
In-Reply-To: <1003166094.3bcb198edae10@webmail.tiscalinet.be>
MIME-Version: 1.0
Message-Id: <20011015181216.E5A77482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Monday 15 October 2001 19:14, joel.soete@freebel.net wrote:
> Sorry for NEWBIES (as I am in term of X configuration) what means bpp?

bpp = bits per pixel. 
You should enter "8" here, which defaults to 2^8 = 256 colors.

> Well I found what I have to change in my config file to make xdm works.
> Just a problem:
> After the xdm start everything seems to works fine (right colors, mouse
> working,...). Then I login: ok the pointer still work, I can work in the
> default xterm,...
> But when I exit mouse does not move any more and I had to restart xdm.
>
> (Um.., on my B180 I thing have to update Xfree 4.0 to 4.1 the mouse does
> not work at all but gpm well)

I assume you have a PS/2 mouse.
If so, disable gpm before starting xdm ("/etc/init.d/gpm stop").

Greetings,
Helge
