Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hall.mail.mindspring.net (hall.mail.mindspring.net [207.69.200.60])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EA3F482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 05:05:41 -0700 (MST)
Received: from archimedes.localnetsolutions.com ([199.174.105.194])
	by hall.mail.mindspring.net with esmtp (Exim 3.33 #1)
	id 16SzgJ-0001qj-00
	for parisc-linux@lists.parisc-linux.org; Tue, 22 Jan 2002 07:05:39 -0500
Received: (from jkinney@localhost)
	by archimedes.localnetsolutions.com (8.11.6/linuxconf) id g0MC5bS00539;
	Tue, 22 Jan 2002 07:05:37 -0500
Subject: Re: [parisc-linux] vmlinux header for savecrash.
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3C4D2EFB.F82671C2@admin.france.hp.com>
References: <3C4C53B7.67DA24E@admin.france.hp.com>
	<20020121202539.994A5482A@dsl2.external.hp.com>
	<3C4D2EFB.F82671C2@admin.france.hp.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-9bspbxO+wnseFGXEEyPg"
Date: 22 Jan 2002 07:05:37 -0500
Message-Id: <1011701137.21924.137.camel@archimedes.localnetsolutions.com>
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

--=-9bspbxO+wnseFGXEEyPg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2002-01-22 at 04:20, Bruno Vidal wrote:
> 	Sorry, but on my system, fgrep gives nothing
> (and by using strings, I found nothing also). And I
> can't use dmesg buffer, because by definition it is a buffer,
> so after running sometime, the palo boot strings is not
> in the buffer anymore. Some new ideas ?
>=20

I'm not at my PaLinux box, but my intel linux has a dmesg file in
/var/log. I seem to recall that HPUX uses a buffer for dmesg. I'll check
the PaLinux shortly.

--=20
James P. Kinney III   \Changing the mobile computing world/
President and COO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20



--=-9bspbxO+wnseFGXEEyPg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8TVWRYZCtw4KcbKcRAuEBAKDzH1l0QhZCaExbiRpOfrFCVX8MMgCg1X5w
BXME38xnshesQOMX8Iw2H4s=
=cROj
-----END PGP SIGNATURE-----

--=-9bspbxO+wnseFGXEEyPg--
