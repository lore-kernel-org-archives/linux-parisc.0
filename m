From: Philipp Kern <pkern@debian.org>
Subject: Re: HPPA and Squeeze
Date: Fri, 19 Jun 2009 17:43:24 +0200
Message-ID: <20090619154324.GA26579@durotan.0x539.de>
References: <4A3B2AC4.90105@debian.org> <20090619151526.GA30984@roeckx.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Cc: Kurt Roeckx <kurt@roeckx.be>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Debian Release <debian-release@lists.debian.org>
To: "debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>
Return-path: <bounce-debian-release=debian-release=m.gmane.org@lists.debian.org>
In-Reply-To: <20090619151526.GA30984@roeckx.be>
Resent-Message-ID: <mCzfRHVb5II.A.F3G.oI7OKB@liszt>
List-Post: <mailto:debian-release@lists.debian.org>
List-Help: <mailto:debian-release-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-release-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-release-request@lists.debian.org?subject=unsubscribe>
List-ID: <linux-parisc.vger.kernel.org>


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2009 at 05:15:26PM +0200, Kurt Roeckx wrote:
> Here is a list of packages that failed to build because of instability
> on the buildds today:
> package     | buildd   | error
> qgit        | penalosa | make: *** [install] Segmentation fault
> acpica-unix | peri     | make: *** [install] Segmentation fault

I had those random segfaults in make on paer too, until we switched to the
UP kernel, at least from what I saw.

Sadly it looks that I forgot the buildd upgrade process on paer some days
ago.  The buildd will be back building ASAP.

Kind regards,
Philipp Kern
--=20
 .''`.  Philipp Kern                        Debian Developer
: :' :  http://philkern.de                         Stable Release Manager
`. `'   xmpp:phil@0x539.de                         Wanna-Build Admin
  `-    finger pkern/key@db.debian.org

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko7shsACgkQ7Ro5M7LPzdjF7gCeOr0rHqAWSjqTTHPuHYFcoNjJ
NwMAmgKcmA5R0kUcqVXci56UZB+hRCMW
=gGXg
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
