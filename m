Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A9A3489E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 11:52:27 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15lZtz-00025D-00
	for parisc-linux@lists.parisc-linux.org; Mon, 24 Sep 2001 19:52:19 +0200
Date: Mon, 24 Sep 2001 19:44:56 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Debian bootfloppies with -pa22 fails on 720/50
Message-ID: <20010924194456.A9406@dogbert.localdomain>
References: <20010924132145.B8726@dogbert.localdomain> <Pine.NEB.4.33.0109241435300.9317-100000@www2.scram.de> <20010924124931.B10662@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
In-Reply-To: <20010924124931.B10662@megatonmonkey.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, 24 Sep 2001, Carlos O'Donell Jr. wrote:

> > > After your changes (making case 18 fall through to case 28), I get the
> > > following happy-and-warm-and-fuzzy message:
> >=20
> > As i said, the second patch didn't work for me, as well. The first one
> > (fall through to case 26) did.
> >=20
> > Cheers,
> > Jochen
> >
>=20
> There has been a lot of recent work on adding the unaligned=20
> handlers that were missing.  I think that previously, most of=20
> the handlers for the older CPU's hadn't been written... now that
> they are there, the fallthrough case has more support.

I'd be happy to test these whenever possible. :-)
=20
> I'm glad that Albert got his system working.
> (Crosses fingers)

I am currently battling the install process. I'm as far as creating the
f0, swap and root partitions on the drive, fscking and mounting them,
but the installation of the base system (starting with drivers.tgz and
rescue.bin) is giving problems. For some reason I can netboot a kernel
fine (and also use a nfsroot), but when it comes time to do a network
install, the installer can't even find my BOOTP server...

I'm currently trying the CD-ROM install, but my last attempt failed with
the following message during the installation of the rescue disk:

ioctl: LOOP_CLR_FD: No such device or address

So that's where I am now... but it's looking better. I'm going to try
the CD-ROM install again now.

Regards,

Albert

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7r3EXDg+hOeRZtkMRAtYxAJ49NhJ3N4qgon1OX3AsAmdwR2jbRgCfc0sj
arqqjhL7syko6SZSHFd9iuE=
=hA1s
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
