Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id B061A4840
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Dec 2003 13:54:27 -0700 (MST)
Date: Tue, 2 Dec 2003 21:54:26 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031202205426.GA16507@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sG624X+5B8xHI10M"
Subject: [parisc-linux] Booting a 735
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

--sG624X+5B8xHI10M
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I just got a 735/99, but I can't boot it. It came along with two HDDs
(on the narrow SCSI bus), a FDDI interface on the CPU/RAM board and a
"normal" ethernet interface (Intel chip) in the EISA slot:


BOOT_ADMIN> lan_addr
LAN Station Address:  080009-836dca
BOOT_ADMIN> fddi_addr
FDDI Station Address:  080009-836dcb
BOOT_ADMIN> boot lan

Trying lan.000000-000000.0.0
Cannot find ENTRY_INIT.

Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.6.0                 HP      C3323-300
P1                    scsi.1.0                 CONNER  CFP2105S  2.14GB



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: a
BOOT_ADMIN> boot lan.080009-836dca

Trying lan.080009-836dca.0.0
Cannot find ENTRY_INIT.

Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.6.0                 HP      C3323-300
P1                    scsi.1.0                 CONNER  CFP2105S  2.14GB



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu:=20


I don't have a FDDI network at home, only RJ45 ethernet is available.
Additionally, I don't have an external CD-ROM drive handy atm. Should I
just wait until I get my drives back?

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--sG624X+5B8xHI10M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/zPwCHb1edYOZ4bsRAqWNAJ9NZyDflSLJoW2ck0XFS38HfpNBsQCffZg/
Bj9tDQ0NOWnh+1WL77+d8Fs=
=nkO3
-----END PGP SIGNATURE-----

--sG624X+5B8xHI10M--
