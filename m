Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viemta04.chello.at (viemta04.chello.at [195.34.133.54])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39230482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Apr 2001 14:31:03 -0600 (MDT)
Sender: chris@dsl2.external.hp.com
Message-ID: <3ACB8484.71DE5601@dot.at>
Date: Wed, 04 Apr 2001 22:31:00 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
Cc: Christoph Plattner <christoph.plattner@alcatel.at>,
	Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New kernel on 720 + Pa-Linux-0.5: Breakpoint ?
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com> <3AC973D3.F1453A4C@alcatel.at> <20010403223441.A11435@parcelfarce.linux.theplanet.co.uk> <3ACAC867.25327463@alcatel.at> <20010404180518.C11435@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> On Wed, Apr 04, 2001 at 09:08:23AM +0200, Christoph Plattner wrote:
> > > have you looked at all the followups to the esiee announcement noting
> > > the problems with it?  i suspect it's switching to STI console.
> >
> > Although I definitely write
> >
> >       console=ttyS0
> >
> > as kernel parameter ?
> 
> yes.  they symlinked /dev/console to tty0 instead of leaving it as a
> char device.  the kernel can't help you out here, you have to change
> that symlink :-(
> 
> --
> Revolutions do not require corporate support.

No, No !

This problem have I fixed in my tree !
I tried it with both, the correct one
	/dev/console = 5,1
and the hack !
	/dev/console -> /dev/ttyS0

Further I hacked in a test in the kernel. Before it starts `init' or
any other process, it tries to open the console (You know, the warning,
if this fail). After the open I write out a string using `write (1, )'
as check the return value. I see the string on the serial console !!
and return value is ok.

So the device `/dev/console' IS WORKING in my setup, but the rest is 
not !!!....

Cheers
	Christoph P.

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
