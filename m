Return-Path: <jbglaw@dvmwest.gt.owl.de>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12130489B
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Jan 2004 04:59:41 -0700 (MST)
Date: Fri, 16 Jan 2004 12:59:40 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Non-HP PCI cards & x86 BOOT-ROMS
Message-ID: <20040116115940.GN14285@lug-owl.de>
References: <Pine.GSO.4.58.0401161155280.15789@vier.idi.ntnu.no>
	<20040116115517.GM14285@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NdlhywBBVma7OLA/"
In-Reply-To: <20040116115517.GM14285@lug-owl.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--NdlhywBBVma7OLA/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-01-16 12:55:17 +0100, Jan-Benedict Glaw <jbglaw@lug-owl.de>
wrote in message <20040116115517.GM14285@lug-owl.de>:
> On Fri, 2004-01-16 12:04:22 +0100, Ivar Orskaug <Ivar.Olav.Harstad.Orskau=
g@idi.ntnu.no>
> wrote in message <Pine.GSO.4.58.0401161155280.15789@vier.idi.ntnu.no>:

> Maybe it would be a nice idea to hack bochs to initialize those cards,
> but that's a lot of work, though...

Thinking again about that, it maybe isn't all *that* hard. Bochs already
does know about the concept of shared DRAM and ROM BIOSes etc. Maybe
it's really just enough to hack it's memory class (yup, it's written in
C++) to not back the memory by RAM or on-disk storage, but to redirect
all accesses to physical RAM.

The same is to be done with I/O ports too, of course... For complex card
(SCSI RAID host adaptors), you may need to service interrupts, too:-(

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--NdlhywBBVma7OLA/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAB9IsHb1edYOZ4bsRAjgPAKCET6nJWjE8u1Qn4lwxrPTPxM7cIgCeJ0LE
5Kjuk6465FaE+r7afitvJ1k=
=pLVv
-----END PGP SIGNATURE-----

--NdlhywBBVma7OLA/--
