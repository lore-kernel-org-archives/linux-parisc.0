Return-Path: <jbglaw@dvmwest.gt.owl.de>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id A45D948CC
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Jan 2004 09:27:31 -0700 (MST)
Date: Fri, 16 Jan 2004 17:27:30 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Non-HP PCI cards & x86 BOOT-ROMS
Message-ID: <20040116162730.GP14285@lug-owl.de>
References: <Pine.GSO.4.58.0401161155280.15789@vier.idi.ntnu.no>
	<20040116115517.GM14285@lug-owl.de>
	<20040116115940.GN14285@lug-owl.de>
	<20040116161219.GT5550@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/APWUufBlM5l5MgA"
In-Reply-To: <20040116161219.GT5550@systemhalted>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--/APWUufBlM5l5MgA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-01-16 11:12:19 -0500, Carlos O'Donell <carlos@baldric.uwo.ca>
wrote in message <20040116161219.GT5550@systemhalted>:
> On Fri, Jan 16, 2004 at 12:59:40PM +0100, Jan-Benedict Glaw wrote:
> > Thinking again about that, it maybe isn't all *that* hard. Bochs already
> > does know about the concept of shared DRAM and ROM BIOSes etc. Maybe
> > it's really just enough to hack it's memory class (yup, it's written in
> > C++) to not back the memory by RAM or on-disk storage, but to redirect
> > all accesses to physical RAM.
> >=20
> > The same is to be done with I/O ports too, of course... For complex card
> > (SCSI RAID host adaptors), you may need to service interrupts, too:-(
>=20
> How can you use Bochs? It runs a virtualized machine. The purpose of
> running card firmware is to effect the *current* machine with some
> configuration process.

Boch is vitual. *But* it actually got quite real objects to back all the
physical things (RAM, ROM, etc). If you hack these containers to roll
their changes back into *real* RAM/ROM/whatever, you can affect quite
real hardware.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--/APWUufBlM5l5MgA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFACBDyHb1edYOZ4bsRAstZAJ4nDf9aeVjPHlkQZLct+OQhD03qVACfbol3
3XzaSmlH7uQUOCL04/o11zA=
=H2s3
-----END PGP SIGNATURE-----

--/APWUufBlM5l5MgA--
