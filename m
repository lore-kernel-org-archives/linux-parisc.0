From: Pierre Habouzit <madcoder@debian.org>
Subject: Re: hppa release status
Date: Fri, 13 Jun 2008 10:44:10 +0200
Message-ID: <20080613084410.GB12988@artemis.madism.org>
References: <20080608194617.GT10194@mails.so.argh.org> <484EF5D7.5000209@gmx.de> <1213285147.3426.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="5I6of5zJg18YgZEa";
	protocol="application/pgp-signature"; micalg=SHA1
Cc: Helge Deller <deller@gmx.de>, Andreas Barth <aba@not.so.argh.org>,
	debian-hppa@lists.debian.org, debian-release@lists.debian.org,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1213285147.3426.23.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<answer with my glibc hat on>

On Thu, Jun 12, 2008 at 03:39:07PM +0000, James Bottomley wrote:
> On Tue, 2008-06-10 at 23:44 +0200, Helge Deller wrote:
> > My personal feeling is, that a switch to NPTL is probably the best=20
> > solution. Even if this involves a abi change.
> > Maybe experts on NPTL could comment here?
>=20
> Well ... we asked for a switch to NPTL over a year ago, raising the ABI
> change issue (and requesting glibc6.1 or something similar).  At that
> time there was a resounding lack of interest from Debian.  Ordinary
> release logic does say that you shouldn't rev an ABI just before a
> release.  However debian release logic seems to require some type of
> crisis before we can get nptl in, so if this is it ...

  This is totally unfair, at the time Carlos said that it was probable
that the ABI bump wasn't necessary but that he needed some time to
figure it out and. I've seen absolutely no hard push for NPTL at the
time, and except python2.5 (and again it's still remain to be proven
it's LT related) we've seen no issue on hppa with linuxthreads so far.
So I remain convinced that it's better to see if the ABI bump can be
avoided or not, and if it can't, we can do it in lenny+1 OK.

> Actually, I can't reproduce this on ion, which is my debian testing
> build box.  The only difference from a normal testing system is that
> it's running 2.6.26-rc1 (it's also a pa8800 which makes its coherency a
> bit more stringent).  Building python 2.5.2-6 and running all the built
> in tests except the two parisc exceptions runs.  Ryan Murray stated that
> the failing test was test_sys, so this is what I get running it alone:
>=20
> jejb@ion> pwd
> /home/jejb/sources/python2.5-2.5.2/build-shared
> jejb@ion> ./python  -E -tt ../Lib/test/regrtest.py -w -l -uall -s
> test_sys
> test_sys
> 1 test OK.
>=20
> So I think more investigation of the actual alleged failure is
> warranted.  At this time, if it is a real failure, I'm not sure it's
> necessarily threads related.

  This is really coherent with our observations: LT is almost pure C,
and kfreebsd uses LT and python works really well. So either it's a bug
in the LT hppa specific code, or a kernel issue. Your tests tends to
show the latter.

> > > So, with respect to the python2.5 issue, what now?
> > >
> > > At the technical side, best of course would be if linuxthreads would
> > > continue to work at least enough for lenny, this was the case for a f=
ew
> > > years already, it should be able to survive a few months more, and
> > > python2.5 can build with the test-suite on hppa.  Of course not break=
ing
> > > the API during a linuxthreads -> NPTL switch would be even better.
> >=20
> > I can't comment on that.
>=20
> I'll see if I can fix it whatever it is, but right now I need a
> reproducible test case.  It looks like the current failure might be tied
> to whatever the buildd system was doing or some weird installation
> dependency it happens to have that I don't.


--=20
=C2=B7O=C2=B7  Pierre Habouzit
=C2=B7=C2=B7O                                                madcoder@debia=
n.org
OOO                                                http://www.madism.org

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkhSM1oACgkQvGr7W6Hudhyj9ACfaJNcHKhoAr8uUQ0AbcEPeNKV
6g4An3d55XCdv9jd4vxNg+P3Z/tWbcF4
=ERYD
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
