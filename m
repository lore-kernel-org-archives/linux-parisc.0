Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jumpgate.home.net.au (c16844.fernt1.vic.optusnet.com.au [210.49.203.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 140E14838
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Feb 2003 09:35:34 -0700 (MST)
Received: from localhost (jumpgate.home.net.au [127.0.0.1])
	by jumpgate.home.net.au (Postfix) with ESMTP id 88EBB62E53
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Feb 2003 03:35:31 +1100 (EST)
Received: from optushome.com.au (shadow.home.net.au [192.168.3.130])
	by jumpgate.home.net.au (Postfix) with ESMTP id E533962E52
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Feb 2003 03:35:05 +1100 (EST)
Message-ID: <3E56B2AC.DCC46120@optushome.com.au>
Date: Fri, 21 Feb 2003 23:13:49 +0000
From: Rod Smart <snaketails@optushome.com.au>
MIME-Version: 1.0
To: PARISC Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] boot console wrong.
References: <3E55A3FC.C06BFE43@optushome.com.au> <20030221082726.GH6523@aurinko.ntc.nokia.com> <Pine.LNX.4.53.0302210625170.18642@wolf.alaskatech> <20030221153313.GM6523@aurinko.ntc.nokia.com>
Content-Type: text/plain; charset=us-ascii
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

    Ok, my graphics card is installed in Slot 3, so whats the differance between
3a and 3b ??

> Possible paths are:
>         GRAPHICS(0)
>         GRAPHICS(1a)
>         GRAPHICS(1b)
>         GRAPHICS(2a)
>         GRAPHICS(2b)
>         GRAPHICS(3a)
>         GRAPHICS(3b)
>         GRAPHICS(4a)
>         GRAPHICS(4b)
>         PCI3
>         PCI4
>         SERIAL_1
>         SERIAL_2
>
Nahkola Mikko wrote:

> On Fri, Feb 21, 2003 at 06:26:47AM -0900, ext Tom wrote:
> > > > On Fri, Feb 21, 2003 at 03:58:52AM +0000, ext Rod Smart wrote:
>
> > > > >   Console path:         SERIAL_1.9600.8.none
> > > >     I have installed Debian through this console, and would like to play
> > > > with it the usual way now ;o)
>
> > > Um ... "path console graphics" could be a good starting point. It
> > > probably tells you that "graphics" isn't a good path and shows a list of
> > > what could be, but that's almost as good.
>
> > "path console graphics(0)" sets the console to the built-in video on my
> > C180; graphics(x) (where x is the slot number as printed on the back of
> > the case) sets it to the video card in that slot...
>
> Well ... yes. (I just had to set a B180L to mode 12 on graphics(0)
> manually from the serial console as that seems to be the only way to make
> it work with an A4033A with the usual 3-BNC cable.)
>
> Now that I think about it ... I probably had to use pci(4) or some such
> once on a C360 but then again that one didn't have a built-in adapter.
>
> Oh, and really, my Linux-running C240 still has the console on serial -
> _and_ X and a bunch of virtual terminals also available on the graphics
> card.
>
> --
> Mikko Nahkola   <mikko.nahkola@nokia.com>
> Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
