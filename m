From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] Re: NPTL for hppa-linux is not backwards compatible
	with Linuxthreads.
Date: Sun, 18 Feb 2007 20:26:57 -0500
Message-ID: <200702182027.00027.vapier__32718.9681040638$1416624305$gmane$org@gentoo.org>
References: <119aab440702181143h682c78d9ra0d765b06e08a594@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1259371249=="
Cc: debian-glibc@lists.debian.org,
 Aurelien Jarno <aurel32@debian.org>,
 Roland McGrath <roland@redhat.com>,
 libc-ports@sourceware.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702181143h682c78d9ra0d765b06e08a594@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1259371249==
Content-Type: multipart/signed; boundary="nextPart2458057.QiVlsy2Ddz";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2458057.QiVlsy2Ddz
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 18 February 2007, Carlos O'Donell wrote:
> NPTL for hppa-linux is not backwards compatible with Linuxthreads, we
> have broken the pthread ABI.
> <snip>
> It has been recommended that we bump to libc6.1 for NPTL. Is that a
> good idea? Are there any comments about how to make such a transition
> smooth for debian, gentoo, and ubuntu?

if the breakage is just in pthreads, i dont think the libc ABI needs to be=
=20
bumped, just the pthread one ?  libc provides look ahead stub functions for=
=20
pthreads, so it shouldnt be affected by the breakage you've mentioned with=
=20
static lock initializers ...

libpthread.so.0 -> libpthread.so.1
=2Dmike

--nextPart2458057.QiVlsy2Ddz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.2 (GNU/Linux)

iQIVAwUARdj840FjO5/oN/WBAQLA5RAA0+F56yUbiK1Safv3kuEqkgF/1HUl/Ug5
cYnxbeXOSOZ/bWhCxzw4V/ojz7Q2X3TCqcLw6K/Bs02A8SDG4UHwdcyAWVc8Pjws
wcgT90tK1ou4Vdmv/YNBgQwjPoJxEya+AyTK0r6kZfSvJkXaqHpNCakRmu1Os3v+
lEvGfmSuaD1YL7tflim9hyem8txQgfOnHoI+hiD269psrrOANuVp19sDkriiT+7b
jzRPhTz9mugC3jeo3Qd8P51MYA8jo78/jbdg8xl1UFVU185Otdd695QWkOhnPyqc
J/f8ba+x87x1KW53PczdeEVZ4o85BAIhwN54BBJkCWTQNuuOsAjhhIeN54my9OS7
OMGeayb92ijTKZ4SsNQ8h6mF2tcuRY2q4cCngjTl7dUU86+AtFW20OWCOzzo+SsZ
YuX5jzXYcDCILP/2Msmtsp6uYOkdBloDnFbM/0uI8HeK5Me/NIEnbv/2q+YdC90n
O0nS1hZAJt8HxgQGsvUVCtamdKcz8DMLDdR6AZXFFsO/lqxAQ5bfAgcKwV/rrSqx
sFOZKq/Kdn5gbgV3So5j/P9HhcAETD7finf/3dpzEcYQ8820kyZTvMHowbydQpZx
TQxEVl5Bdk75zEawQVeHx/bdLGygsQayoonEprAiBbr8qGLUxDehZF5OjDx+55rn
HC0cHy1jvJY=
=RIiE
-----END PGP SIGNATURE-----

--nextPart2458057.QiVlsy2Ddz--

--===============1259371249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1259371249==--
