Return-Path: <jbglaw@dvmwest.gt.owl.de>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA42A4843
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 01:44:50 -0700 (MST)
Date: Fri, 6 Feb 2004 09:44:49 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040206084448.GE28571@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uWA6ivsFTdIbDdzo"
Cc: willy@debian.org
Subject: [parisc-linux] EISA network card "INP0500" (aka A4308-66001) in a
	735/99
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--uWA6ivsFTdIbDdzo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I had some time these days and installed my 735/99. Booting off an
external CD-Writer the "first" part was quite easy.

However, it seems neither of the two network cards (FDDI interface on a
slider card and an EISA "INP0500" network card) seems to work :(
Currently, I'm using the box with ppp over a serial cross cable...

I found one posting
(http://lists.parisc-linux.org/pipermail/parisc-linux/2003-April/019647.htm=
l)
of someone who seems to own the same box and a reply
(http://lists.parisc-linux.org/pipermail/parisc-linux/2003-April/019648.htm=
l)
of Matthew who claimed to either have this (or a similar) card working.

Matthew, is there currently a somewhat working driver for this card? I'm
now using current 2.6.x CVS.

Thanks, JBG

PS:
Here are the interesting EISA parts of dmesg's output:

9. Outfield Audio at 0xf1000000 [2/0/8] { 10, 0x0, 0x009, 0x0007f }
10. Outfield FDDI at 0xf0831000 [2/0/9] { 10, 0x0, 0x009, 0x0007d }
11. Cobra EISA BA at 0xfc000000 [4] { 11, 0x0, 0x004, 0x00076 }
12. Hardball (735/99) at 0xfffbe000 [8] { 0, 0x0, 0x203, 0x00004 }
13. Memory at 0xfffbf000 [9] { 1, 0x0, 0x019, 0x00009 }
--
Cutoff version 4 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
Mongoose EISA Adapter found at 0xfc000000
EISA EEPROM at 0xf0810400
Enumerating EISA bus
EISA slot 1: INP0500 EISA IRQ 10=20
EISA: Probing bus 0 at parisc4
EISA: Mainboard HWPC000 detected.
EISA: slot 1 : INP0500 detected.
EISA: Detected 1 card.
SCSI subsystem initialized
STI GSC/PCI core graphics driver Version 0.9a

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--uWA6ivsFTdIbDdzo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAI1QAHb1edYOZ4bsRAkhvAJ0baaMKnIvk8B+Wxn6/7CrDIpXh6QCdGq7B
3YLLtXYVqh7tyxH9lGwoHEI=
=QxPi
-----END PGP SIGNATURE-----

--uWA6ivsFTdIbDdzo--
