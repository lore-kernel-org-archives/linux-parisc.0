Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70531484D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 08:17:13 -0600 (MDT)
From: Michael S.Zick <mszick@pflash.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mike Werneke <mikewerneke@hotmail.com>
Subject: Re: [parisc-linux] Apollo 735/99 hangs after booting from CDROM
Date: Fri, 8 Jun 2001 09:15:02 -0500
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
References: <20010607232003.B2308@solo.franken.de>
MIME-Version: 1.0
Message-Id: <01060809163401.00472@wolf01.my.home>
List-ID: <linux-parisc.vger.kernel.org>

Note to all -

The problem exists (on my 720) WITHOUT the frame buffer code
in the image.

Mike

On Thu, 07 Jun 2001, Thomas Bogendoerfer wrote:
> On Thu, Jun 07, 2001 at 03:51:22AM -0000, Mike Werneke wrote:
> > --snip
> > CPU(s): 1 x PA7100 (PCX-T) at 99.000000 MHz
> > Kernel command line: HOME=3D/ TERM=3Dlinux root=3D/dev/ram console=3D=
tty0 sti=3D0=20
> > sti_font=3DVGA8x16
> > Console: colour dummy device 80x25
> > snip--
> >=20
> > and then hangs.  Could this be a bad iso image? Or is this a known is=
sue?=20
>=20
> no, you are running the sti console kernel on a not supported frame buf=
fer.
> Use the 32serial image.
>=20
> Thomas.
>=20
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessar=
y a
> good idea.                                 [ Alexander Viro on linux-ke=
rnel ]
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
