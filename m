Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78AF5484D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 08:14:31 -0600 (MDT)
From: Michael S.Zick <mszick@pflash.com>
To: "Mike Werneke" <mikewerneke@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Apollo 735/99 hangs after booting from CDROM
Date: Fri, 8 Jun 2001 09:05:56 -0500
Content-Type: text/plain
References: <F214YiMCIqtQvAauNjV0001bb18@hotmail.com>
MIME-Version: 1.0
Message-Id: <01060809135000.00472@wolf01.my.home>
List-ID: <linux-parisc.vger.kernel.org>

Hi Mike
& Everyone

Try this:

Do a manual boot - so that you: boot xxxxxx IPL

Using the command line editor built into IPLBOOT -
Change the:: console=3Dtty0 entry
To: console=3DttyB
Proceed with boot.

Expect: Boot should proceed normally, until -
you get a message about "unable to open initial terminal"

If such is the case, then your model 735 is affected by a
problem reported for other models. =20
Please post your results - the more model specfic
information availabe for the people working the problem,
the better.

At this point, kernel should be running and responding to
other points of access (such as over the network).

Mike (to Mike)


On Wed, 06 Jun 2001, Mike Werneke wrote:
> Hello.
>=20
> I have an HP Apollo 735/99 workstation with 112MB RAM and a 2GB HD.  Th=
e=20
> external SCSI CDROM is a bit old, but it's Sony from Sun.  I burned the=
=20
> 32-bit graphical iso this afternoon and it booted into the 2.4.0-pa10=20
> kernel.   After it's done searching for devices (it finds 13 of them), =
it=20
> prints out:
>=20
> --snip
> CPU(s): 1 x PA7100 (PCX-T) at 99.000000 MHz
> Kernel command line: HOME=3D/ TERM=3Dlinux root=3D/dev/ram console=3Dtt=
y0 sti=3D0=20
> sti_font=3DVGA8x16
> Console: colour dummy device 80x25
> snip--
>=20
> and then hangs.  Could this be a bad iso image? Or is this a known issu=
e?=20
> Any help would be greatly appreciated (as is all the effort already don=
e by=20
> the developers of the parisc port).
>=20
> Thanks-
>=20
> Mike Werneke
> _________________________________________________________________
> Get your FREE download of MSN Explorer at http://explorer.msn.com
>=20
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
