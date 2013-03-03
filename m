From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] parisc: fixes and cleanups in page cache flushing (1/4)
Date: Sun, 3 Mar 2013 06:38:46 -0500
Message-ID: <201303030638.48139.vapier@gentoo.org>
References: <20130203225909.GA14573@p100.box> <20130204163743.248510@gmx.net> <510FEBBD.9000207@bell.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart7382436.PEgfhiaOuI";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Helge Deller <deller@gmx.de>, eike-kernel@sf-tec.de,
	linux-parisc@vger.kernel.org, James.Bottomley@hansenpartnership.com
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <510FEBBD.9000207@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart7382436.PEgfhiaOuI
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 04 February 2013 12:11:25 John David Anglin wrote:
> On 2/4/2013 11:37 AM, Helge Deller wrote:
> >>> Von: Rolf Eike Beer <eike-kernel@sf-tec.de>
> >>>=20
> >>> Helge Deller wrote:
> >>>> This is the first patch in a series of 4, with which the page cache
> >>>> flushing of
> >>>> parisc will gets fixed and enhanced. This even fixes the nasty
> >>>> "minifail" bug
> >>>> (http://wiki.parisc-linux.org/TestCases?highlight=3D%28minifail%29)
> >>>> which
> >>>> prevented parisc to stay an official debian port.  Basically the
> >>>> flush in
> >>>> copy_user_page together with the TLB patch from commit
> >>>> 7139bc1579901b53db7e898789e916ee2fb52d78 is what fixes the minifail
> >>>> bug.
> >>>=20
> >>> Is this series expected to fix the thread related problems I see in t=
he
> >>> git testsuite?
> >>=20
> >> I expect so, if not, please let us know!
> >=20
> > Ahem... actually:
> > MAYBE!!!
> >=20
> > The problem is, that you probably will need an updated glibc (and maybe
> > compiler) as well. Dave has done a lot of work to fix stuff. We have
> > copied the most important update-packages to ftp.parisc-linux.org. To
> > update, just make sure the following lines are in your
> > /etc/apt/source.list file: deb ftp://ftp.de.debian.org/debian-ports
> > unstable main
> > deb ftp://ftp.parisc-linux.org/debian-ports/unstable unstable main
> > deb-src ftp://ftp.de.debian.org/debian unstable main
> >=20
> > Do *not* just update to the packages of debian-ports.org. If you do that
> > it will render your system unbootable, since the udev-package is broken
> > and it will not find your discs at startup.
> >=20
> > It's on my todo-list to upload further packages, update the website on
> > how to update your system, and of course to get a buildd working...
>=20
> Just a note, these packages are for debian systems.  I believe that Eike =
is
> running gentoo.  With respect to glibc, Carlos had a set of changes which=
 I
> submitted to Debian.  The full set was accepted around the -30 unstable
> release.
> I think most of these are in gentoo but the matter needs review.

afaik, Gentoo's glibc-2.17 should have all relevant fixes
=2Dmike

--nextPart7382436.PEgfhiaOuI
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRMzZIAAoJEEFjO5/oN/WB25IQAMgHryUzLbcF3LrbWcnanLI8
/fVsyxuQnbKQ3Wtn19p8Rs1uJmZjIHK/pcu1thbuUbY7TxpXbZNuGT5lU1mIkZpG
PC8WTomP5ZKH4cL8hIaw1LyyledZgSwiu9wRVfP08oTzNwgWARMK+lop7FGnHFQ8
p3Q9BQ8Cb9ZmZIeBYcAfQ7nrewU1vapuy2Ic10rk6hus3pF4F5B8IvBJ0hcwpkMt
0DkOCN4uwrFJLALpqtisrcqf/BfAu8I3Q1/TFcuoXPEZvcRBkd1qURlcPX9Cekzx
1lWD5TOLHpSYzk8avgGZdu/TiQTyg4PZzyuaQfrJynAMLCArCiVQl6f+wWIJoJM6
K4NmSJX2vx5k5/RVuubrfF5fZ+IRcZCD/tqiIhYtaBrWrVhoAhXPd+hCZ6lKmncf
WDk0Ky5P9ackbum0s2kDs37dpkHPMxxlmOxgWuZ54uzs+r8uME2YoESijFpXAVBN
sP0wEJl0yUbFyIvoITLhFd1i+7AC8UpgcJ5YYnO5paGMb++lRQmx/CCI+9bxpNEG
EwUyaNp7fy382Y4VunQLKaL0/hcomwT/hQKIUloRpFRrPDoehkCAVMrIokdpquxe
DwmohLS4Sq+JyZu8ModeYuqMLiOAuYlJvBXakltpZksKWKGmJAV62eIvHfWC03Bl
dEr/Q/lZXMxppBA+pAzM
=gyKJ
-----END PGP SIGNATURE-----

--nextPart7382436.PEgfhiaOuI--
