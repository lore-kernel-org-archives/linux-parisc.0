Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63B9B482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 18:04:26 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15kaHO-0003pK-00
	for parisc-linux@lists.parisc-linux.org; Sat, 22 Sep 2001 02:04:22 +0200
Date: Sat, 22 Sep 2001 01:56:10 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nfsroot login problems on 720/50
Message-ID: <20010922015609.A14166@dogbert.localdomain>
References: <20010921193553.A11874@dogbert.localdomain> <20010921180529.C32145@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
In-Reply-To: <20010921180529.C32145@megatonmonkey.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, 21 Sep 2001, Carlos O'Donell Jr. wrote:

> The rbootd is good.
> The lifimage is good.
> The bootp server is good.
>=20
> The baseplus root tarball is bad.

Should I try the base tarball (same date... :-( ) or is that known to be
bad too?
=20
> Coming from a similar situation, I had to manually change the
> permissions on the baseplus tarball to get it to work.=20
> Though I clearly can't remember what else I had to do... it was
> quite some time ago. I'm now using apt-get and the latest ISO to
> install machines.
>=20
> Questions:
>=20
> - Are you using devfs?

I have not modified anything in the nfsroot to use devfs, and I don't
think it's in the make oldconfig kernel I'm using, so I'd guess not.

> - Tried just letting the login prompt sit for a while after attempting
>   to login? (Usually the error might come after a _long_ time).

Yes, it's been sitting for many hours without any luck.

> On another note, you should try the cdrom installer, since it's
> much better and people have put a lot of work into it.

I have tried the CD-ROM installer (0.9.2), but kernel on there wouldn't
let me get past where init starts (more of this unaligned trap
goodness, according to the debian-hppa folks); init was running in some
kind of loop or something.

Should I perhaps try to boot 2.4.9-pa22, and modify the PALO arguments
to boot from this CD-ROM?

Regards,

Albert

P.S. Are there any 720/50's out there that actually work? :-)

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7q9OZDg+hOeRZtkMRArJNAJ9nVP40lDf50I29envY8coCgpI2LgCfadvS
Tz4iEfeoKsMnflpL+yJsXbs=
=bb4R
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
