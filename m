Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7E96482A
	for <parisc-linux@parisc-linux.org>; Wed, 17 Oct 2001 01:14:59 -0600 (MDT)
To: Thomas Marteau <marteaut@esiee.fr>
Subject: Re: [parisc-linux] Xfree86 failled with -pa57
Message-ID: <1003302888.3bcd2fe864941@webmail.tiscalinet.be>
Date: Wed, 17 Oct 2001 09:14:48 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hello Thomas,

> Thomas Marteau wrote:
> > 
> > Hi all
> > 
> > > Is it possible to config XFree so that it takes mouse input from gpm?
> > Yes via /dev/gpmdata but I won't advice you to do so.
> 
> Yes, I find it back simply on my i386 (but at home) on which it works
> fine that is why I though to this idea but I will follow your advice.
> 
> >
> I launched X via startx on my B132L. I can launch many xterm but I can't
> exec xedit. I am looking why.
> 
> What's about a window manager the X default is twm (if I do not make
> error) but it depends of menu which is not yet available for hppa? Can
> we already replace it by fvwm to install later Xfce?
> 
> > Perhaps, you are stuck b/c of software and not hardware or kernel
> > problems.
> > 
> > Try to do it via startx, Thomas.
> > ESIEE Team
> 
> I do not yet try, so I will do soon and let you inform.

Sorry Thomas it does not work more successfully (with or without gpm running, 
with or without gpmdata). But what could be the small difference between b132 
and b180 (processor clock excepted)?

(Changing mouse doesn't help)
(There is no more (EE) message in XFree86.0.log (or xdm.log). No message, no 
syslog and no kern.log errors)

What can I do to debug this problem?


Thanks again,
	Joel

-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
