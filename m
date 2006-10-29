From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] [patch] Remove magic constant from gas/tc-hppa.c
Date: Sun, 29 Oct 2006 09:33:11 -0500
Message-ID: <1162132391.5690.13.camel__39035.5550837286$1416624202$gmane$org@localhost.localdomain>
References: <200610230214.k9N2E1iI018209@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1708411661=="
Cc: binutils@sources.redhat.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <200610230214.k9N2E1iI018209@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============1708411661==
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-c78SLOb1SdDB6CvOPRHB"


--=-c78SLOb1SdDB6CvOPRHB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le dimanche 22 octobre 2006 =C3=A0 22:14 -0400, John David Anglin a =C3=A9c=
rit :
> > > Yes, but it's wrong.  I'm not worried about changing it since
> > > there isn't really a 64-bit netbsd target.  Also, GCC doesn't
> > > support hppa64-netbsd.
> >=20
> > Fair enough. =3D)  I've so far been trying to preserve behaviour.  I'm
> > happy to change it to just elf64-hppa for now if that's better.

In exploring how other arches handle unifying 32 and 64 bit binutils, it
looks like they rely on a command line switch to get things set early
enough.  output_file_create calls TARGET_FORMAT before the asm file is
read, so we can't use the .LEVEL instruction to tell is if we're
elf32-hppa or elf64-hppa.

It looks like the best thing to do is to support the -march parameter,
similar to gcc.  gcc supports:

-march=3D{1.0,1.1,2.0}

Should I add 2.0w to this for 64bit?  Talking about it with Randolph on
IRC, he pointed out that hppa2.0w-hp-hpux11.11 targets a 32 bit
userspace on a wide kernel.

HP/UX as supports the syntax:

+DAarchitecture

But I'd rather stick with something that feels more like the rest of the
arches and toolchain.

Thanks!

--
Jeff Bailey - http://www.raspberryginger.com/jbailey/

--=-c78SLOb1SdDB6CvOPRHB
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFRLun5M5hmdCYCpkRAso5AKDOQaEKd3NRPWLXcpTs8Un6sI5rsACguXoV
BU3LaPP61VG8ZbUkHbWJEHg=
=xB0W
-----END PGP SIGNATURE-----

--=-c78SLOb1SdDB6CvOPRHB--


--===============1708411661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1708411661==--
