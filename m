Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id B02634A24
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 10:34:42 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15nN4Y-0004Ij-00
	for parisc-linux@lists.parisc-linux.org; Sat, 29 Sep 2001 18:34:38 +0200
Date: Sat, 29 Sep 2001 18:33:49 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: nick@snowman.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: Betr.: [parisc-linux] HP C180
Message-ID: <20010929183349.B25897@dogbert.localdomain>
References: <20010929142418.N5051@linuxcare.com> <Pine.LNX.4.21.0109291117210.11237-100000@ns>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
In-Reply-To: <Pine.LNX.4.21.0109291117210.11237-100000@ns>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Make your own:

 palo -f /dev/null -k vmlinux -r root.bin -s lifimage [-b iplboot] \
        -c "0/linux HOME=3D/ root=3D/dev/ram initrd=3D0/ramdisk"

where vmlinux is the a kernel you've compiled from CVS (possibly using
the cross-compiler) and root.bin is the latest Debian hppa bootdisk.
Netboot the resulting lifimage and off you go! :-)

Regards,

Albert

On Sat, 29 Sep 2001, nick@snowman.net wrote:

> Ok, can you point me to a totally current root image?
> 	Nick
>=20
> On Sat, 29 Sep 2001, Richard Hirst wrote:
>=20
> > On Wed, Sep 26, 2001 at 08:56:08AM +0200, Jurriaan Kalkman wrote:
> > > >My c180 is now happily booting (current CVS kernel), however wheneve=
r I
> > > >try to ls some dirs (no all, this example is from /usr/bin) I get er=
rors
> > > >along these lines
> > > >ls: memory exhausted
> >=20
> > I had this with 2.4.9, turned out I'd booted a root fs with old libc6
> > installed.  When I rebooted using a current libc6 the problem went away.
> >=20
> > Richard
> >=20
>=20
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tffsDg+hOeRZtkMRAi4qAKCLj2FPHXt9xQdJB56qVo94XXvRYQCeIoAM
f9fZ6b7mu5xupZj2Cm8Jwg0=
=shWW
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
