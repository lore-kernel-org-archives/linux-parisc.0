Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5845B482D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 08:45:52 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 15sQ2v-00008X-00
	for parisc-linux@lists.parisc-linux.org; Sat, 13 Oct 2001 16:45:50 +0200
Date: Sat, 13 Oct 2001 16:45:48 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] disks not recognized by new 53c700/53c710 driver (was [parisc-linux-cvs] linux rhirst)
Message-ID: <20011013164548.B4317@dogbert.localdomain>
References: <20011013162103.A3604@dogbert.localdomain> <20011013162718.B3604@dogbert.localdomain> <20011013144315.768285B124@optical.cyberhost.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
In-Reply-To: <20011013144315.768285B124@optical.cyberhost.co.za>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Okay, I'll check this out and report back. Someone should probably fix
up make oldconfig so that it produces a working config again?

Cheerio,

Albert

On Sat, 13 Oct 2001, Helge Deller wrote:

> > No disks?
> >
> > In my .config (obtained with make oldconfig) I have:
> >
> > CONFIG_SCSI=3Dy
> > CONFIG_BLK_DEV_SD=3Dy
> > CONFIG_SD_EXTRA_DEVS=3D40
> > CONFIG_CHR_DEV_ST=3Dy
> > CONFIG_SR_EXTRA_DEVS=3D2
> > CONFIG_CHR_DEV_SG=3Dy
> > CONFIG_SCSI_ZALON=3Dy
> > CONFIG_SCSI_SYM53C8XX=3Dy
> > CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS=3D8
> > CONFIG_SCSI_NCR53C8XX_MAX_TAGS=3D32
> > CONFIG_SCSI_NCR53C8XX_SYNC=3D20
> >
> > Did I miss anything or is there something amiss with the driver? :-)
>=20
> I think you missed:
>=20
> CONFIG_SCSI_LASI700=3Dy
> CONFIG_53C700_MEM_MAPPED=3Dy
> CONFIG_53C700_LE_ON_BE=3Dy
> CONFIG_53C700_USE_CONSISTENT=3Dy
>=20
> You should prefer "make menuconfig". That way you won't
> miss such things.
>=20
> Greetings,
> Helge
>=20

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7yFObDg+hOeRZtkMRApqjAKCBBr646/GPbBuleHi6kPBXl90rbwCcDzCm
NMr/XYdG4UdhjQLpB0jUOzU=
=xgpI
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
