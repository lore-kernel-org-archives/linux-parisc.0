From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk-X3B1VOXEql0@public.gmane.org>
Subject: front-panel LED and switch support broken (was: 2.6.10-pa1 compile
 fails)
Date: Thu, 30 Dec 2004 13:15:46 +0200 (EET)
Message-ID: <Pine.LNX.4.21.0412301311180.17049-100000__12007.20011625$1416624521$gmane$org@hal.pp.fishpool.fi>
References: <Pine.LNX.4.21.0412300029010.28533-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=iso-8859-1
Cc: parisc-linux-6jwH94ZQLHl74goWV3ctuw@public.gmane.org,
 debian-hppa-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
To: debian-hppa-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
Return-Path: <bounce-debian-hppa=deller=gmx.de-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
In-Reply-To: <Pine.LNX.4.21.0412300029010.28533-100000-4o3fW2yq+lqHldeZ0cibK8c4bpwCjbIv@public.gmane.org>
Resent-Message-ID: <HER2XC.A.6HH.xN-0BB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
List-Help: <mailto:debian-hppa-request-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Thu, 30 Dec 2004, Martin-=C9ric Racine wrote:

>    1    551 lines   Text/PLAIN
>    2    107 lines   Text/PLAIN (Name: "drivers_parport_parport_gsc.c.diff=
")
>    3    196 lines   Text/PLAIN (Name: "include_asm-parisc_parport_gsc.h.d=
iff")
>    4    225 lines   Text/PLAIN (Name: "drivers_parport_parport_gsc.h.diff=
")
>=20
> Thanks Joel!  The patches finally made it possible to compile 2.6.10-pa1 =
using:
>=20
> binutils-hppa-linux       2.15-1
> gcc-hppa-linux            3.4.1-1
>=20
> Unless the parisc-linux team sees anything wrong with these patches, woul=
d it be
> possible to merge them into the current CVS tree?=20

However, support for the front-panel LEDs and switches is BROKEN in 2.6.10-=
pa1:
when I press the power switch, it kills the AC power instead of sending a s=
ignal
to the kernel to shut itself down.  OUCH!  The power/status LED is also off=
=2E

--=20
Martin-=C9ric Racine, ICT Consultant
http://www.iki.fi/q-funk/
