Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33C384879
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 16:01:02 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15nSAN-00029h-00
	for parisc-linux@lists.parisc-linux.org; Sun, 30 Sep 2001 00:00:59 +0200
Date: Sun, 30 Sep 2001 00:00:09 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: nick@snowman.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: Betr.: [parisc-linux] HP C180
Message-ID: <20010930000009.B26195@dogbert.localdomain>
References: <20010929183349.B25897@dogbert.localdomain> <Pine.LNX.4.21.0109291237460.11237-100000@ns>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
In-Reply-To: <Pine.LNX.4.21.0109291237460.11237-100000@ns>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I generally use http://http.us.debian.org/ or http://ftp.sunet.se/pub/
(great mirror site). Your local mirror probably only mirrors i386. I
can't imagine why "normal" sites would want to keep around 4 GB (?) of
HPPA packages. :-)

I also built a new nfsroot for myself by using debootstrap, and slightly
modifying the "woody" script. My system isn't quite up and running yet
(still struggling with Jurij's patch), but you could do the same if your
HP is misbehaving.

Regards,

Albert

On Sat, 29 Sep 2001, nick@snowman.net wrote:

> I have been rolling my own kernels, however I've been useing nfsroot with
> one of the prebuilt tarballs.  Where can I find the latest debian hppa
> bootdisks?  ftp.debian.org?  (I havn't noticed them in my debian mirror).
> 	Nick
>=20
> On Sat, 29 Sep 2001, Albert Strasheim wrote:
>=20
> > Hello,
> >=20
> > Make your own:
> >=20
> >  palo -f /dev/null -k vmlinux -r root.bin -s lifimage [-b iplboot] \
> >         -c "0/linux HOME=3D/ root=3D/dev/ram initrd=3D0/ramdisk"
> >=20
> > where vmlinux is the a kernel you've compiled from CVS (possibly using
> > the cross-compiler) and root.bin is the latest Debian hppa bootdisk.
> > Netboot the resulting lifimage and off you go! :-)
> >=20
> > Regards,
> >=20
> > Albert
> >=20
> > On Sat, 29 Sep 2001, nick@snowman.net wrote:
> >=20
> > > Ok, can you point me to a totally current root image?
> > > 	Nick
> > >=20
> > > On Sat, 29 Sep 2001, Richard Hirst wrote:
> > >=20
> > > > On Wed, Sep 26, 2001 at 08:56:08AM +0200, Jurriaan Kalkman wrote:
> > > > > >My c180 is now happily booting (current CVS kernel), however whe=
never I
> > > > > >try to ls some dirs (no all, this example is from /usr/bin) I ge=
t errors
> > > > > >along these lines
> > > > > >ls: memory exhausted
> > > >=20
> > > > I had this with 2.4.9, turned out I'd booted a root fs with old lib=
c6
> > > > installed.  When I rebooted using a current libc6 the problem went =
away.
> > > >=20
> > > > Richard
> > > >=20
> > >=20
> > >=20
> > >=20
> > > _______________________________________________
> > > parisc-linux mailing list
> > > parisc-linux@lists.parisc-linux.org
> > > http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> >=20
>=20

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tkRoDg+hOeRZtkMRAopnAJ94gvEiFnMfxtHVBeBA3CjvokuA0wCgjM/e
Lfd4ARkoORQ+EZOWldkF8bk=
=2w7X
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
