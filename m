Return-Path: <jbglaw@dvmwest.gt.owl.de>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 365CD4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 02:31:49 -0700 (MST)
Date: Sat, 21 Feb 2004 10:31:47 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Install from DDS Tape
Message-ID: <20040221093146.GB13827@lug-owl.de>
References: <5818350927.20040221031917@go.ro>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sZvnRN25x3w09J/6"
In-Reply-To: <5818350927.20040221031917@go.ro>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--sZvnRN25x3w09J/6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-02-21 03:19:17 +0200, Razvan Popescu <tomcatsniper@go.ro>
wrote in message <5818350927.20040221031917@go.ro>:
> Hi,
>   I have an old HP 9000 model 715 at my work with HP-UX 10.2 and
>   I want to install Debian 3.0 for PA-RISC on it but it has ONLY
>   a dds tape drive (no cdrom, no floppy). My question is: Can I
>   install from tape? How can I put the Debian ISO file on a dds
>   and boot/install from that?

Booting off a tape should work (most probably with the lifimages), but
you'd also try booting off the network. This is what I prefer - if
you've set up the daemons once, you can boot off all machines with
that :)

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--sZvnRN25x3w09J/6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFANyWCHb1edYOZ4bsRAmk+AJ0SqK3WzKkFQ8oVbxYSQwdzpKmQMwCgjQRn
ZmORehbSvFFadUt48ZluLJk=
=eH5r
-----END PGP SIGNATURE-----

--sZvnRN25x3w09J/6--
