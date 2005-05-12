From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] NFS problems : kernel panic
Date: Thu, 12 May 2005 17:14:04 +0200
Message-ID: <20050512171404.002d5de6.gmsoft@gentoo.org>
References: <20050512144617.5b3569d9.gmsoft@gentoo.org>
	<20050512150535.GB15173@colo.lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1334385626=="
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050512150535.GB15173@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1334385626==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__12_May_2005_17_14_04_+0200_Z14UVkLhr3fHwF9p"

--Signature=_Thu__12_May_2005_17_14_04_+0200_Z14UVkLhr3fHwF9p
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 12 May 2005 09:05:35 -0600
Grant Grundler <grundler@parisc-linux.org> wrote:

> Just to make sure I understand: 2.6.10-pa11 works fine?
> And this NFS problem is with any 2.6.11 kernels?

Yes, 2.6.10-pa11 works fine but kernels after this one breaks, up to the
latest 2.6.12-rc4-pa2 with which I just tried.

> I ask because 2.6.10-pa11 was the last parisc specific version
> and was committed to CVS exactly 4 monthes ago: 2005/01/12
>=20
> > Is this a know problem ? Is there a workaround (don't tell me samba
> > :) ?
>=20
> Sorry, I don't.
> My advice is to troll for 2.6.11 bug reports on netdev or linux-kernel
> mailing lists. Ie. abuse google for "linux 2.6.11 NFS bug" searches
> and variants of those (or additional) keywords.

Ok I'll do. Btw I don't have this problem on my x86 boxes. I may also
not be a NFS bug but maybe a network driver related problem or else.
However it works fine using samba but samba is slower than NFS tho.

I should do some test using netcat or any other way to generate a high
traffic load on the interface. But right now, I only had reports of
users complaining about NFS.

Are you able to reproduce the problem ?

Thanks

--=20
Guy Martin
Gentoo Linux - HPPA port Lead / IPv6 team

--Signature=_Thu__12_May_2005_17_14_04_+0200_Z14UVkLhr3fHwF9p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCg3K/rpShrnoH4YYRAnUaAJ9wpbNaDwL4dC9i/aOviY9cTCttXQCgtTIj
CqjTOlUVlzKRjXliYwCy8Z0=
=mjp9
-----END PGP SIGNATURE-----

--Signature=_Thu__12_May_2005_17_14_04_+0200_Z14UVkLhr3fHwF9p--

--===============1334385626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1334385626==--
