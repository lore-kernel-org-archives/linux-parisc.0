From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] ELF ABI Documents
Date: Mon, 17 Apr 2006 23:11:23 -0400
Message-ID: <1145329883.24150.17.camel@localhost.localdomain>
References: <1145324814.24150.12.camel@localhost.localdomain>
	<44445648.5050004@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0705205181=="
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <44445648.5050004@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0705205181==
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-tTY/wEoPmEJ2QLKCwLOy"


--=-tTY/wEoPmEJ2QLKCwLOy
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le mardi 18 avril 2006 =C3=A0 11:00 +0800, Randolph Chung a =C3=A9crit :

> I don't think the ELF spec talks about calling conventions and syscall
> conventions though. For that, parisc-linux mostly follows the SOM spec
> for calling conventions
> (http://ftp.parisc-linux.org/docs/arch/pa-runtime-32-SOM.pdf)

Right.  This is where the LSB document comes it.  It does wind up
defining those for Linux at least.  The "Mostly follows SOM" is largely
what's inspired me on this quest.  I'd love to see a definitive document
that defines this and am willing to go through the effort to do it.

Tks,
Jeff Bailey

--=20
Although when you're in the situation that RMS is telling you that
you're being too ideological about freedom, maybe, just maybe, it's
true.
- Matthew Wilcox

--=-tTY/wEoPmEJ2QLKCwLOy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBERFjb5M5hmdCYCpkRApVNAKDLvnNpbqYLSpEYlcHZO+71cufOTQCePklm
LKp8DyUTN5fSR6pQOMss2R0=
=tY0n
-----END PGP SIGNATURE-----

--=-tTY/wEoPmEJ2QLKCwLOy--


--===============0705205181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0705205181==--
