Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE4D3482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 08:21:11 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 15sPf0-0002qZ-00
	for parisc-linux@lists.parisc-linux.org; Sat, 13 Oct 2001 16:21:06 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15sPex-000115-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 16:21:03 +0200
Date: Sat, 13 Oct 2001 16:21:03 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011013162103.A3604@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Sender: Albert Strasheim <fullung@dogbert.localdomain>
Subject: [parisc-linux] disks not recognized by new 53c700/53c710 driver
List-ID: <linux-parisc.vger.kernel.org>

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

(was [parisc-linux-cvs] linux rhirst)
Reply-To:=20
In-Reply-To: <200110082146.PAA00640@puffin.external.hp.com>

Hello,

I just gave 2.4.9=20

On Mon, 08 Oct 2001, Richard Hirst wrote:

> CVSROOT:	/home/cvs/parisc
> Module name:	linux
> Changes by:	rhirst	01/10/08 15:46:04
>=20
> Modified files:
> 	.              : Makefile=20
> 	drivers/scsi   : Config.in Makefile=20
> 	arch/parisc/debian-configs: 32 64 default=20
> Added files:
> 	drivers/scsi   : 53c700.c 53c700.h 53c700.scr NCR_D700.c=20
> 	                 NCR_D700.h README.53c700 lasi700.c lasi700.h=20
>=20
> Log message:
> New driver from James Bottomley for 53c700 and 53c710.  Much improved
> over sim700.c, and already mostly in Linus' tree.  Major differences
> are support for sync working where the chip supports it, tagged
> commands, and disconnect/reselect works (sim700 had problems on
> 53c700, requiring that people booted with sim700=3Dnodisc:0xff).
> I've left the old driver in the source for now, just commented out its
> Config question.  Will remove it completely if there are no problems.
> Tested on 712, 715/50, 715/75, B180, C360 (32 and 64 bit kernels).
>=20
>=20
>=20
> _______________________________________________
> parisc-linux-cvs mailing list
> parisc-linux-cvs@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux-cvs

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7yE3PDg+hOeRZtkMRAmMtAJ9ZAmKwBByS33EeeQfrPWDCQsq0PgCbBpWt
FJqKznpMSwJGDXf7Y+wk6wM=
=J4b8
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
