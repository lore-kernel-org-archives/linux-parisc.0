From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 3/9] parisc: Fix asm/mman.h regarding MAP_HUGETLB and
 MADV_XX flags
Date: Sat, 21 Nov 2015 20:57:07 +0000
Message-ID: <1448139427.17638.16.camel@decadent.org.uk>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
	 <1448055522-11594-4-git-send-email-deller@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Zow28y2QG6mWn9emtO+N"
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	stable@vger.kernel.org
To: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448055522-11594-4-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--=-Zow28y2QG6mWn9emtO+N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-11-20 at 22:38 +0100, Helge Deller wrote:
> On parisc we have up to now never supported Huge Pages, even glibc did
> not defined MAP_HUGETLB for parisc. Since the Huge Page support is being
> added now, clean up existing definitions for MAP_HUGETLB and friends.
>=20
> Drop lots of MADV_xxK_PAGES flags, which were never used and were
> designed for a patch which was never integrated into the Linux
> kernel. Instead move other MADV_ flags to make them more compatible to
> other linux architectures.

Changing the unimplemented values seems fine, but how can it be OK to
renumber MAP_GROWSUP, MADV_DONTDUMP and MADV_DODUMP?

Ben.

> Cc: stable@vger.kernel.org
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
> =C2=A0arch/parisc/include/uapi/asm/mman.h | 29 ++++++++++----------------=
---
> =C2=A01 file changed, 10 insertions(+), 19 deletions(-)
>=20
> diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/ua=
pi/asm/mman.h
> index 294d251..9ac77f1 100644
> --- a/arch/parisc/include/uapi/asm/mman.h
> +++ b/arch/parisc/include/uapi/asm/mman.h
> @@ -19,11 +19,12 @@
> =C2=A0#define MAP_EXECUTABLE> 	> 0x1000> 	> 	> /* mark it as an executabl=
e */
> =C2=A0#define MAP_LOCKED> 	> 0x2000> 	> 	> /* pages are locked */
> =C2=A0#define MAP_NORESERVE> 	> 0x4000> 	> 	> /* don't check for reservat=
ions */
> -#define MAP_GROWSDOWN> 	> 0x8000> 	> 	> /* stack-like segment */
> +#define MAP_GROWSDOWN> 	> 0x8000> 	> 	> /* x86 stack-like segment */
> =C2=A0#define MAP_POPULATE> 	> 0x10000> 	> 	> /* populate (prefault) page=
tables */
> =C2=A0#define MAP_NONBLOCK> 	> 0x20000> 	> 	> /* do not block on IO */
> -#define MAP_STACK> 	> 0x40000> 	> 	> /* give out an address that is best=
 suited for process/thread stacks */
> -#define MAP_HUGETLB> 	> 0x80000> 	> 	> /* create a huge page mapping */
> +#define MAP_HUGETLB> 	> 0x40000> 	> 	> /* create a huge page mapping */
> +#define MAP_GROWSUP> 	> 0x80000> 	> 	> /* parisc stack-like segment */
> +#define MAP_STACK> 	> MAP_GROWSUP> 	> /* give out an address that is bes=
t suited for process/thread stacks */
> =C2=A0
> =C2=A0#define MS_SYNC> 	> 	> 1> 	> 	> /* synchronous memory sync */
> =C2=A0#define MS_ASYNC> 	> 2> 	> 	> /* sync memory asynchronously */
> @@ -46,25 +47,15 @@
> =C2=A0#define MADV_DONTFORK> 	> 10> 	> 	> /* don't inherit across fork */
> =C2=A0#define MADV_DOFORK> 	> 11> 	> 	> /* do inherit across fork */
> =C2=A0
> -/* The range 12-64 is reserved for page size specification. */
> -#define MADV_4K_PAGES=C2=A0=C2=A0=C2=A012=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Use 4K pages=C2=A0=
=C2=A0*/
> -#define MADV_16K_PAGES=C2=A0=C2=A014=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Use 16K pages */
> -#define MADV_64K_PAGES=C2=A0=C2=A016=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Use 64K pages */
> -#define MADV_256K_PAGES 18=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Use 256K pages */
> -#define MADV_1M_PAGES=C2=A0=C2=A0=C2=A020=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Use 1 Megabyte pag=
es */
> -#define MADV_4M_PAGES=C2=A0=C2=A0=C2=A022=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Use 4 Megabyte pag=
es */
> -#define MADV_16M_PAGES=C2=A0=C2=A024=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Use 16 Megabyte pages */
> -#define MADV_64M_PAGES=C2=A0=C2=A026=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Use 64 Megabyte pages */
> +#define MADV_MERGEABLE=C2=A0=C2=A0=C2=A012> 	> 	> /* KSM may merge ident=
ical pages */
> +#define MADV_UNMERGEABLE 13> 	> 	> /* KSM may not merge identical pages =
*/
> =C2=A0
> -#define MADV_MERGEABLE=C2=A0=C2=A0=C2=A065> 	> 	> /* KSM may merge ident=
ical pages */
> -#define MADV_UNMERGEABLE 66> 	> 	> /* KSM may not merge identical pages =
*/
> +#define MADV_HUGEPAGE> 	> 14> 	> 	> /* Worth backing with hugepages */
> +#define MADV_NOHUGEPAGE> 	> 15> 	> 	> /* Not worth backing with hugepage=
s */
> =C2=A0
> -#define MADV_HUGEPAGE> 	> 67> 	> 	> /* Worth backing with hugepages */
> -#define MADV_NOHUGEPAGE> 	> 68> 	> 	> /* Not worth backing with hugepage=
s */
> -
> -#define MADV_DONTDUMP=C2=A0=C2=A0=C2=A069> 	> 	> /* Explicity exclude fr=
om the core dump,
> +#define MADV_DONTDUMP=C2=A0=C2=A0=C2=A016> 	> 	> /* Explicity exclude fr=
om the core dump,
> =C2=A0> 	> 	> 	> 	> 	> =C2=A0=C2=A0=C2=A0overrides the coredump filter bi=
ts */
> -#define MADV_DODUMP> 	> 70> 	> 	> /* Clear the MADV_NODUMP flag */
> +#define MADV_DODUMP> 	> 17> 	> 	> /* Clear the MADV_NODUMP flag */
> =C2=A0
> =C2=A0/* compatibility flags */
> =C2=A0#define MAP_FILE> 	> 0
--=20
Ben Hutchings
If you seem to know what you are doing, you'll be given more to do.
--=-Zow28y2QG6mWn9emtO+N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVlDao+e/yOyVhhEJAQpLQQ/8CIeIOoARdyox/AL27LzUs6tOGKNsLfPu
v37dCxhrsHk5mTC8dGgDPF8R3gmyzjg7kJJFSlGgd1Kq65QYK2cnR2g4Za2HaRuZ
sX0C92NH68/3p1nnT4kc5V2+7R+S1jDgBSXyE6WV5Cb3cmeL+dCZzf1PjzvjAfR9
FHup4bAEmLyaEBO4umcQ7hxXQOtvWPcMmxibZHGZkHD42nx2tNhe+3nkGS2Uqn8U
MU/IRotvzw9hgD/sZ8uV+v5cEv0aY87bTNQtSPvJ8xwVcIfWNl/ixl+lUMUcYfcE
VmcyDCm/+mWC98w6KeDAGxE2HTD3w6XO2A4j0oRjifXs8y/G1JjUIK5czt5BEFht
Mk0BZzW0JQPV5GEZK037Sv2xtP/OjvvIoSaten+UBIKjmLdBG/8i1gAStAcb7tlh
Lkzxzj4XvOtMi/UAMUWA4boeZbth2recVCen1AT+/IKJTM61tb9I1JcbFBWJgxwM
+bb90sVYD2fCTmwONl5PwUAzgB5E19KaB9u0NVICodGsjAA7eoVWvLx40q1zGZje
dAaCkyhVthkjMBnvijCHW/ti81j0Roay4dDsW96PgNB39u1fzabU0NmSV2X6HNxY
nHKf3h3EQtOh8NEdJIdGcOGJsEuehutQ1297XfKRSGsRT5cfTUzfvDdpUGI/RtOI
jKWXZDgqNhQ=
=GW2N
-----END PGP SIGNATURE-----

--=-Zow28y2QG6mWn9emtO+N--
