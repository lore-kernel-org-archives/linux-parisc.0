Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blount.mail.mindspring.net (blount.mail.mindspring.net [207.69.200.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 11228482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Jan 2002 17:43:24 -0700 (MST)
Received: (from jkinney@localhost)
	by archimedes.localnetsolutions.com (8.11.6/linuxconf) id g0M0h6P29623;
	Mon, 21 Jan 2002 19:43:06 -0500
Subject: Re: [parisc-linux] vmlinux header for savecrash.
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3C4C53B7.67DA24E@admin.france.hp.com>
References: <3C4C53B7.67DA24E@admin.france.hp.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-a0rn1ys1/B6h9Jsjwvmv"
Date: 21 Jan 2002 19:43:05 -0500
Message-Id: <1011660185.22455.118.camel@archimedes.localnetsolutions.com>
Mime-Version: 1.0
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--=-a0rn1ys1/B6h9Jsjwvmv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I think the palo command line is listed in dmesg. That will tell exactly
which kernel was booted.

On Mon, 2002-01-21 at 12:45, Bruno Vidal wrote:
> 	Hi
> As I said few days ago, I've a dump driver ready.
> Now I'm working on a savecrash command. It works fine
> for the dump, but I need to save with the dump some
> informations like the running kernel at dump time.
> So in the dump I've got this informations:
> utsname_release and utsname_version. Now, how can
> I found the right kernel in /boot ? In other
> word, how can I retrieve utsname informations in a
> binary file (without system.map and gdb) ?
>=20
> 	Thanks.
>=20
> --=20
> 	Vidal Bruno, (770-4271)
>         SSD-HA Team, HP-UX & LINUX Support
> 	bruno_vidal@admin.france.hp.com
--=20
James P. Kinney III   \Changing the mobile computing world/
President and COO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20



--=-a0rn1ys1/B6h9Jsjwvmv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8TLWZYZCtw4KcbKcRAvChAKDj9oL1/T6nXZsL3NC3ZgZ5LdCUOgCcCMYq
I/u2QikOW/t3I6uHRb1Lzu8=
=9dh/
-----END PGP SIGNATURE-----

--=-a0rn1ys1/B6h9Jsjwvmv--
