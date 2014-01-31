From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] Make EWOULDBLOCK be equal to EAGAIN on parisc.
Date: Fri, 31 Jan 2014 18:16:34 -0500
Message-ID: <7911201.yPtbiLNu8K@vapier>
References: <7b86ec9f26dd9a18e7fae7a39e6a3382@tuxicoman.be> <52EBD4F1.3020704@gmx.de> <CAE2sS1jkGKLYFG_Wv560POhd9nvY4yA0o3M9KRi4HFz5DCd9-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1699067.sTjQBsOEt3"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Helge Deller <deller@gmx.de>, Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1jkGKLYFG_Wv560POhd9nvY4yA0o3M9KRi4HFz5DCd9-A@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1699067.sTjQBsOEt3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday, January 31, 2014 12:24:10 Carlos O'Donell wrote:
> On Fri, Jan 31, 2014 at 11:53 AM, Helge Deller <deller@gmx.de> wrote:=

> > On 01/16/2014 05:17 PM, Guy Martin wrote:
> >> On Linux, only parisc uses a different value for EWOULDBLOCK which=

> >> causes a lot of troubles for applications not checking for both va=
lues.
> >> Since the hpux compat is long dead, make EWOULDBLOCK behave the sa=
me as
> >> all other architectures.
> >>=20
> >> Signed-off-by: Guy Martin  <gmsoft@tuxicoman.be>
> >=20
> > What's our final decision regarding this patch now?
> > Shall we target it for inclusion into 3.14 ?
> > If yes, I can include it with my next push request...
> >=20
> > Please speak up now...!
> >=20
> > Helge
> >=20
> >> ---
> >>=20
> >>  arch/parisc/include/uapi/asm/errno.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>=20
> >> diff --git a/arch/parisc/include/uapi/asm/errno.h
> >> b/arch/parisc/include/uapi/asm/errno.h index f3a8aa5..c0ae625 1006=
44
> >> --- a/arch/parisc/include/uapi/asm/errno.h
> >> +++ b/arch/parisc/include/uapi/asm/errno.h
> >> @@ -106,7 +106,7 @@
> >>=20
> >>  #define    EALREADY    244    /* Operation already in progress */=

> >>  #define    EINPROGRESS    245    /* Operation now in progress */
> >>=20
> >> -#define    EWOULDBLOCK    246    /* Operation would block (Linux =
returns
> >> EAGAIN) */ +#define    EWOULDBLOCK    EAGAIN    /* Operation would=
 block
> >> (Not HPUX compliant) */>>=20
> >>  #define    ENOTEMPTY    247    /* Directory not empty */
> >>  #define    ENAMETOOLONG    248    /* File name too long */
> >>  #define    ELOOP        249    /* Too many symbolic links encount=
ered */
>=20
> I think we should do it and fix the userspace fallout by rebuilding.

i'm not sure userspace will break ?  we've got two classes of code:
 - stuff that checks both EAGAIN & EWOULDBLOCK and treats them the same=

 - stuff that checks EAGAIN only (and probably should check both, but d=
oesn't)
both of those will continue to work after we change EWOULDBLOCK

i don't think there's really any code out there that only looks at EWOU=
LDBLOCK=20
(or does so differently from EAGAIN).  if there is, then they'd break. =
 but if=20
they never sh*t in the woods in the first place, then who cares if they=
 would=20
have made noise ? :)
=2Dmike
--nextPart1699067.sTjQBsOEt3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJS7C7cAAoJEEFjO5/oN/WBG3EQAMP5chblgHW/00wD0prbX/ah
I3Ke5AOkU6xRMl1gF4Ij9C61EG68sdRJceku6KqInvwiyELnm/E8bjYClFlco+T1
MS6033usbzz9t7ujXXL7CVwMbh3ulMMfkIynopB4WmyGcCJhEz+YWN1DsXVHJnT9
iJymUAJqz0Kw+z29SefmoeFMCcjmyLPr330t3fX1lNXnqTiBKkhawY21XX8xlBrc
EmOyyTqK3YDls+cA3j4jGGdiWy54pqTm/cE7ag+oM7Df3pGf/MDgH5G6SJBCKdT3
XBaPZmbBs16NM5ZXvmJSNOx3RG4kULtFlvB0flet7ESiSSTwasvrx/Xg5bFOqODk
qeQR+kQLTp0pDMBzIh6XQjhYfcYni9fTbvOKrL3fAbJH2nEPWUSCWPheuIN6joiG
I6qHRoKcZucTKRH0h0BUo9yTpIuBAi2bO7RJQTtEUA2IphEvYavoF43cYJcqyPRz
oW0ORUnP6HPv31wovhZmN6jDTFdkkiXTs5n4gGZug6RIurFaZCV4SN7N376ZtmEK
JWer/mY5tB1MqhFxYtfzNR7CBMeinSa7KhXP3+3BWODmc+ET9Gej0DPtJfb6dtnm
3JSnauwLsE8wb2yCSxXXySjmwfp4UyYR6WqvbR+rlygDEKe6WmMYWFeXyqcWCEW1
asjjFbZHgOctZ//g2uol
=FgKx
-----END PGP SIGNATURE-----

--nextPart1699067.sTjQBsOEt3--

