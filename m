From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] check_ivt panic / binutils
Date: Mon, 02 Oct 2006 22:17:19 -0400
Message-ID: <1159841839.5737.13.camel@localhost.localdomain>
References: <200610030211.k932BbeR023905@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0520993705=="
Cc: parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <200610030211.k932BbeR023905@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0520993705==
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-ZVw12ZV2efOwHwkBNedL"


--=-ZVw12ZV2efOwHwkBNedL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le lundi 02 octobre 2006 =C3=A0 22:11 -0400, John David Anglin a =C3=A9crit=
 :
> > I bisected the binutils CVS until I found the failure point.  It seems
> > that with 2006-04-30 I don't get the check_ivt failure (although the
> > kernel does die immediately after e100 is initialised), but at
> > 2006-05-01, I get the check_ivt failure.
>=20
> It's not at all obvious why you think this is a binutils bug.

Sorry, the first part of the conversation happened on IRC, my bad.

I was trying to figure out why I was seeing a problem that Joel had
reported before and no-one else was.  Kyle got me to try a sid chroot,
and it didn't happen there.  Eventually I narrowed down the difference
between a working kernel and a non-working one was whether I was using a
bleeding edge CVS snapshot, or whether I was using the released
binutils-2.17 package.

I'm not claiming I know where the bug is, but I wanted to know what the
change was that happened between a bootable kernel and a non-bootable
kernel.

> >  IIR: 0e60109c    ISR: 0000000000000000  IOR: 0000000100000000
>=20
> $ disasm 0x0e60109c
>    0:   0e 60 10 9c     ldw 0(r19),ret0
>=20
> > r16-19  00000000f00003b0 00000000f000024c 00000000f0002b4c 000000010000=
0000
>=20
> The r19 value is the problem.

--=20
Although when you're in the situation that RMS is telling you that
you're being too ideological about freedom, maybe, just maybe, it's
true.
- Matthew Wilcox

--=-ZVw12ZV2efOwHwkBNedL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFIcgv5M5hmdCYCpkRAuqUAKDfMmpoT0vbi6oul/YatfF8/eNPxACcD7Pq
c25VNXQg4gSlfq1/bszPLcY=
=j+30
-----END PGP SIGNATURE-----

--=-ZVw12ZV2efOwHwkBNedL--


--===============0520993705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0520993705==--
