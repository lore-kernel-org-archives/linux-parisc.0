Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id B59CC482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 04:18:02 -0700 (MST)
Date: Mon, 17 Mar 2003 12:18:01 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FC driver?
Message-ID: <20030317111801.GF17073@lug-owl.de>
References: <3E68A12A00002910@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GYkYyJI7bObpCn+O"
In-Reply-To: <3E68A12A00002910@ocpmta3.freegates.net>
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

--GYkYyJI7bObpCn+O
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-03-17 12:05:20 +0100, Joel Soete <jsoe0708@tiscali.be>
wrote in message <3E68A12A00002910@ocpmta3.freegates.net>:
> Hi all,
>=20
> On the N4000 which I can test for a short time there are fc cards.
> lspci give me following info about those cards:
>=20
> 20:00.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel Host=
 Adapter (rev 0b)
> d0:00.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel Host=
 Adapter (rev 0b)
> e0:00.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel Host=
 Adapter (rev 0b)

[line break-ups corrected]

> The question is: which driver should I use (cpqfc?)?

I do not have such a card, but:

/usr/share/misc/pci.ids:
103c  Hewlett-Packard Company
	1028  Tach TL Fibre Channel Host Adapter

So it seems your device is 103c:1028. In the kernel, this maps through
=2E/linux/include/linux/pci_ids.h:

#define PCI_DEVICE_ID_HP_TACHYON      0x1028

So your device is called "PCI_DEVICE_ID_HP_TACHYON". Searching for this
string, you'll find it in ./linux/drivers/scsi/cpqfcTSinit.c, so that
card seems to be supported.

See, it's quite easy to see if a PCI card seems to be supported:-)

MfG, JBG



--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--GYkYyJI7bObpCn+O
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+da7oHb1edYOZ4bsRAk5bAJ9QaAIbptMtK4rwdOypSyF5vDrD9QCfR/MB
AxAydvqDs88tPSM0Uno8AJ0=
=vSoc
-----END PGP SIGNATURE-----

--GYkYyJI7bObpCn+O--
