Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32820482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Oct 2001 11:15:03 -0600 (MDT)
To: tsbogend@alpha.franken.de,
	Thomas Bogendoerfer <tsbogend@elvis.franken.de>
Subject: Re: [parisc-linux] Xfree86 failled with -pa57
Message-ID: <1003166094.3bcb198edae10@webmail.tiscalinet.be>
Date: Mon, 15 Oct 2001 19:14:54 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Richard Hirst <rhirst@linuxcare.com>, joel.soete@freebel.net,
	parisc-linux@lists.parisc-linux.org
References: <1003154375.3bcaebc713db3@webmail.tiscalinet.be> <20011015164903.X11105@linuxcare.com> <20011015180923.A14160@elvis.franken.de>
In-Reply-To: <20011015180923.A14160@elvis.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hi Thomas,

Quoting Thomas Bogendoerfer <tsbogend@elvis.franken.de>:

> On Mon, Oct 15, 2001 at 04:49:03PM +0100, Richard Hirst wrote:
> > > (EE) No OS PCI support available
> > 
> > Do you have PCI support enabled in your kernel?
> 
> shouldn't matter. I bet the framebuffer runs in a different resolution
> than
> it's configured in XF86Config. Since the current stifb doesn't support
> mode switching, I've made the check very strict to not allow it. So
> the boot time resolution and bpp must match that from XF86Config.
> 
> Thomas.
> 
Sorry for NEWBIES (as I am in term of X configuration) what means bpp?

Well I found what I have to change in my config file to make xdm works.
Just a problem:
After the xdm start everything seems to works fine (right colors, mouse 
working,...). Then I login: ok the pointer still work, I can work in the default 
xterm,...
But when I exit mouse does not move any more and I had to restart xdm.

(Um.., on my B180 I thing have to update Xfree 4.0 to 4.1 the mouse does not 
work at all but gpm well)

Any idea?

Thanks for all great job and in advance for additional help,
        Joel



-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
