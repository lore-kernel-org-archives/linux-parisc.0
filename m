Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4111F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 09:48:33 -0600 (MDT)
From: Michael S.Zick <mszick@pflash.com>
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] Apollo 735/99 hangs after booting from CDROM
Date: Fri, 8 Jun 2001 10:41:08 -0500
Content-Type: text/plain
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mike Werneke <mikewerneke@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
References: <20010608155249.T16532@linuxcare.com>
MIME-Version: 1.0
Message-Id: <01060810451304.00472@wolf01.my.home>
List-ID: <linux-parisc.vger.kernel.org>

Richard

Congrat's (early) -

You may have spotted the problem -

There isn't any "CONFIG_FB_STI" in the config file shipped
with V0.9 iso image.

Nor in any of the few CVS-Kernel tar-zips that I have checked.

Mike

On Fri, 08 Jun 2001, Richard Hirst wrote:
> On Fri, Jun 08, 2001 at 09:15:02AM -0500, Michael S . Zick wrote:
> > Note to all -
> >=20
> > The problem exists (on my 720) WITHOUT the frame buffer code
> > in the image.
>=20
> Well, with CONFIG_STI_CONSOLE and CONFIG_FB_STI both unset your kernel
> can't be hanging after "Console: colour dummy device 80x25", can it?
> So at this point I don't think we know it is the same problem on
> 735+sti as it is on your 720+serial.
>=20
> Richard
>=20
> > Mike
> >=20
> > On Thu, 07 Jun 2001, Thomas Bogendoerfer wrote:
> > > On Thu, Jun 07, 2001 at 03:51:22AM -0000, Mike Werneke wrote:
> > > > --snip
> > > > CPU(s): 1 x PA7100 (PCX-T) at 99.000000 MHz
> > > > Kernel command line: HOME=3D/ TERM=3Dlinux root=3D/dev/ram consol=
e=3Dtty0 sti=3D0=20
> > > > sti_font=3DVGA8x16
> > > > Console: colour dummy device 80x25
> > > > snip--
> > > >=20
> > > > and then hangs.  Could this be a bad iso image? Or is this a know=
n issue?=20
> > >=20
> > > no, you are running the sti console kernel on a not supported frame=
 buffer.
> > > Use the 32serial image.
> > >=20
> > > Thomas.
