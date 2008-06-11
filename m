From: Pierre Habouzit <madcoder@debian.org>
Subject: Re: hppa release status
Date: Wed, 11 Jun 2008 09:55:05 +0200
Message-ID: <20080611075505.GD28629@artemis.madism.org>
References: <20080608194617.GT10194@mails.so.argh.org> <484EF5D7.5000209@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="rz+pwK2yUstbofK6";
	protocol="application/pgp-signature"; micalg=SHA1
Cc: Andreas Barth <aba@not.so.argh.org>, debian-hppa@lists.debian.org,
	debian-release@lists.debian.org, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <bounce-debian-release=debian-release=m.gmane.org@lists.debian.org>
In-Reply-To: <484EF5D7.5000209@gmx.de>
Resent-Message-ID: <pgbO78F40PB.A.lkB.nT4TIB@liszt>
List-Post: <mailto:debian-release@lists.debian.org>
List-Help: <mailto:debian-release-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-release-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-release-request@lists.debian.org?subject=unsubscribe>
List-ID: <linux-parisc.vger.kernel.org>


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2008 at 09:44:55PM +0000, Helge Deller wrote:
> CC'ed: parisc-linux kernel development list
>=20
> Andreas Barth wrote:
> >during the upload of python2.5, the build failed on hppa due to stalls
> >in the test suite, see http://bugs.debian.org/483042 and
> >http://buildd.debian.org/fetch.cgi?&pkg=3Dpython2.5&ver=3D2.5.2-5&arch=
=3Dhppa&stamp=3D1211583145&file=3Dlog
> >(Matthias "fixed" that bug by disabling the testsuite, not something=20
> >that makes
> >us happy.)
> >After that happened, we asked on #parisc if someone could take a look,
> >and we were told that linuxthreads is currently unmaintained for hppa,
> >and the issue could only be fixed by moving to nptl and we need to do an
> >(incompatible) abi change in glibc. Such a change would be really
> >unfortunate, and we hope that every other roads have been evaluated
> >first (like trying to understand why python on linuxthreads fails on
> >hppa but not on e.g. kfreebsd). We also would like to be sure that ntpl
> >is really better than linuxthreads for python2.5 before a transition.
>=20
> My personal feeling is, that a switch to NPTL is probably the best
> solution. Even if this involves a abi change.
> Maybe experts on NPTL could comment here?

  The NPTL in glibc works well afaict, the downside is the ABI bump,
because doing the archive-wide rebuild as a 66% chance to hurt the port
so bad that it will not be ready in time for lenny. This is a last
resort measure, and everything _must_ be tried before, because even
"losing" a week trying to fix linuxthreads is way faster than rebuilding
the whole archive which is rather a matter of months and risking no HPPA
at all in the end.

--=20
=C2=B7O=C2=B7  Pierre Habouzit
=C2=B7=C2=B7O                                                madcoder@debia=
n.org
OOO                                                http://www.madism.org

--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkhPhNkACgkQvGr7W6Hudhya3wCggJvmwUEqd5fQ7onOM9M+CmeU
jLIAn27NnHlR0eEgKk3fl/TvmLyp627x
=uRgc
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--
