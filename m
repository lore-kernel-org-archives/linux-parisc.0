Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0F54F482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Oct 2001 03:34:01 -0600 (MDT)
To: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Xfree86 failled with -pa57
Message-ID: <1003224838.3bcbff06c8a4f@webmail.tiscalinet.be>
Date: Tue, 16 Oct 2001 11:33:58 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1003154375.3bcaebc713db3@webmail.tiscalinet.be> <20011015180923.A14160@elvis.franken.de> <1003166094.3bcb198edae10@webmail.tiscalinet.be> <E15tCEK-0003m8-00@spoolm4.tiscalinet.be>
In-Reply-To: <E15tCEK-0003m8-00@spoolm4.tiscalinet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hello Helge,

Quoting Helge Deller <deller@gmx.de>:

> On Monday 15 October 2001 19:14, joel.soete@freebel.net wrote:
> > Sorry for NEWBIES (as I am in term of X configuration) what means
> bpp?
> 
> bpp = bits per pixel. 
> You should enter "8" here, which defaults to 2^8 = 256 colors.

Thanks a lot.

> 
> > Well I found what I have to change in my config file to make xdm
> works.
> > Just a problem:
> > After the xdm start everything seems to works fine (right colors,
> mouse
> > working,...). Then I login: ok the pointer still work, I can work in
> the
> > default xterm,...
> > But when I exit mouse does not move any more and I had to restart
> xdm.
> >
> > (Um.., on my B180 I thing have to update Xfree 4.0 to 4.1 the mouse
> does
> > not work at all but gpm well)
> 
> I assume you have a PS/2 mouse.

You have right,

> If so, disable gpm before starting xdm ("/etc/init.d/gpm stop").
> 

But sorry this as no effect:
on 712 pointer still fix in midle of the screen after an exit,
on b180 pointer still fixed all the time (even after an update to xfree 4.1.0-7)
(just after re-install of gpm: gpm.com contains as default repeat_type=ms3 then 
I have a pointer moving only at the bottum of the screen (same behaviour as the 
712 before I comment repeat_type)?)

Is it possible to config XFree so that it takes mouse input from gpm?

Thanks for help and ideas,
        joel


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
