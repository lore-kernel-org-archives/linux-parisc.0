From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] [patch] Remove magic constant from gas/tc-hppa.c
Date: Sun, 22 Oct 2006 19:31:40 -0400
Message-ID: <1161559900.5629.37.camel__223.970253910188$1416624199$gmane$org@localhost.localdomain>
References: <200610211944.k9LJiE77010509@hiauly1.hia.nrc.ca>
	<1161466446.7854.86.camel@localhost.localdomain>
	<20061021233857.GA12282@hiauly1.hia.nrc.ca>
	<1161537558.5629.15.camel@localhost.localdomain>
	<20061022181315.GA21547@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0542292821=="
Cc: binutils@sources.redhat.com,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20061022181315.GA21547@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0542292821==
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-jf33ZoXVf0oEp4QDfkzs"


--=-jf33ZoXVf0oEp4QDfkzs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le dimanche 22 octobre 2006 =C3=A0 14:13 -0400, John David Anglin a =C3=A9c=
rit :
> > +  {"%fr10",  bfd_mach_hppa10,  10 + FP_REG_BASE},
> > +  {"%fr10l", bfd_mach_hppa10,  10 + FP_REG_BASE},
> > +  {"%fr10r", bfd_mach_hppa10,  10 + FP_REG_BASE + FP_REG_RSEL},
>=20
> The "fr" entries needs more work now that you have added bfd_mach
> values.  bfd_mach_hppa10 only had 16 FP registers (0 to 15) and
> the left and right halves were not accessible.  In bfd_mach_hppa11,
> 16 additional FP registers were added and the left and right
> halves became independently accessible.

Thanks, I've updated the table with this now.  It occurs to me that I'm
initializing the table too early, though.  A LEVEL op would come too
late to do anything.  I'll rework the logic on that before I resend.

> > +#  ifdef TE_NetBSD
> > +#  define ELF_TARGET_FORMAT       "elf32-hppa-netbsd"
> > +#  define ELF64_TARGET_FORMAT     "elf64-hppa-linux"
>=20
> The above line appears to be a typo.  However, the elf64-hppa-netbsd
> output format isn't defined yet.

The current tc-hppa.c has:

#if TARGET_ARCH_SIZE =3D=3D 64
#include "bfd/elf64-hppa.h"
#if defined (TE_LINUX) || defined (TE_NetBSD)
#define TARGET_FORMAT "elf64-hppa-linux"

So this preserves current behaviour.

--
Jeff Bailey - http://www.raspberryginger.com/jbailey/

--=-jf33ZoXVf0oEp4QDfkzs
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFO/9c5M5hmdCYCpkRAu00AKDE0mCEJOZdYpiGUWQvfZb3y6FDmACeMsCB
X/DzKHGpMqc5/4y2MjDrsm8=
=rhSf
-----END PGP SIGNATURE-----

--=-jf33ZoXVf0oEp4QDfkzs--


--===============0542292821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0542292821==--
