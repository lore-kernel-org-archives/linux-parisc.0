Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 587D24A04
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 16:33:04 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15n6Bo-0008I0-00
	for parisc-linux@lists.parisc-linux.org; Sat, 29 Sep 2001 00:33:00 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15n6B2-0006Jm-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 00:32:12 +0200
Date: Sat, 29 Sep 2001 00:32:12 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Where to get recent parisc kernels w/o building?
Message-ID: <20010929003212.B23750@dogbert.localdomain>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F4@umr-mail03.cc.umr.edu> <20010928232355.A23750@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
In-Reply-To: <20010928232355.A23750@dogbert.localdomain>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I just spotted a note on my parisc-linux.org archive mentioning:

ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/
or
http://puffin.external.hp.com/pub/parisc/binaries/kernels/

Enjoy!

On Fri, 28 Sep 2001, Albert Strasheim wrote:

> Hello,
>=20
> On Fri, 28 Sep 2001, Neulinger, Nathan wrote:
>=20
> > Is there any convenient place to grab a 2.4.9 (or more recent) vmlinux =
for
> > parisc-linux other than getting it myself out of cvs? (Don't have a
> > functional build environment at the moment.)
>=20
> I suggest grabbing palo-latest, linux-latest and xc-latest from
> ftp://puffin.external.hp.com (I can't get to it at the moment, but maybe
> you can). Unless you are very lucky, you're going to at least need to
> change the boot parameters, for which you need palo anyway. So grab 'em
> and set up a build environment if you're REALLY serious about your HP.
> :-)
> =20
> > Also, what about a working gcc? I've apt-get upgrade'd everything, and =
gcc
> > complains about lots of header file goofiness when compiling even a sim=
ple
> > hello world program.
>=20
> As far as I know, we're still missing a kernel-headers package for hppa.
> I could be wrong. Perhaps you should find the right person and complain
> about this. :-) I think a suggested solution was to force-install the
> sparc headers or something...
> =20
> > Also, does the kernel build have to be done cross-compile, or can it be
> > built on the parisc-linux machine itself?
>=20
> You can build it either way. I don't have a 2nd HP machine, so I have to
> cross-compile. It's actually pretty nice considering that I have access
> to a SMP p3-600 box. :-)
>=20
> Regards,
>=20
> Albert



--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tPpsDg+hOeRZtkMRAmGpAJ9uvrM/4VVe/OwHUT0MFV85tzt/0gCgjczj
wK+kR4gwa+A1/JPsODzO9ww=
=U6xa
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
