Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm1.tiscalinet.be (spoolm1.tiscalinet.be [212.35.2.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8313482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 08:25:31 -0600 (MDT)
Sender: jso@dsl2.external.hp.com
Message-ID: <3BD18AD9.FA49E5E7@freebel.net>
Date: Sat, 20 Oct 2001 14:31:53 +0000
From: Soete Joel <joel.soete@freebel.net>
MIME-Version: 1.0
To: tsbogend@alpha.franken.de,
	Thomas Bogendoerfer <tsbogend@elvis.franken.de>,
	Richard Hirst <rhirst@linuxcare.com>, joel.soete@freebel.net,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Xfree86 failled with -pa57
References: <1003154375.3bcaebc713db3@webmail.tiscalinet.be> <20011015164903.X11105@linuxcare.com> <20011015180923.A14160@elvis.franken.de> <1003166094.3bcb198edae10@webmail.tiscalinet.be>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello all,

Just a followup:

joel.soete@freebel.net wrote:
> 
> Hi Thomas,
> 
> Quoting Thomas Bogendoerfer <tsbogend@elvis.franken.de>:
> 
> > On Mon, Oct 15, 2001 at 04:49:03PM +0100, Richard Hirst wrote:
> > > > (EE) No OS PCI support available
> > >
> > > Do you have PCI support enabled in your kernel?
> >
> > shouldn't matter. I bet the framebuffer runs in a different resolution
> > than
> > it's configured in XF86Config. Since the current stifb doesn't support
> > mode switching, I've made the check very strict to not allow it. So
> > the boot time resolution and bpp must match that from XF86Config.
> >
> > Thomas.
> >
> Sorry for NEWBIES (as I am in term of X configuration) what means bpp?
> 
> Well I found what I have to change in my config file to make xdm works.
> Just a problem:
> After the xdm start everything seems to works fine (right colors, mouse
> working,...). Then I login: ok the pointer still work, I can work in the default
> xterm,...
> But when I exit mouse does not move any more and I had to restart xdm.

This problem continu but...

> 
> (Um.., on my B180 I thing have to update Xfree 4.0 to 4.1 the mouse does not
> work at all but gpm well)

this one Thomas Marteau kindely help me to find out that in 'Section
pointer' of XFconfig the 'Device "/dev/mouse"'.
And if on the 712 /dev/mouse is well a link to /dev/psaux, on the
contrary on the B180L the /dev/mouse was wrongly a link to /dev/gpmdata.

Thanks again to Thomas and all for help,

	Joel
