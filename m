Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from barry.mail.mindspring.net (barry.mail.mindspring.net [207.69.200.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C87D482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Dec 2001 19:55:37 -0700 (MST)
Received: from archimedes.localnetsolutions.com ([199.174.105.194])
	by barry.mail.mindspring.net with esmtp (Exim 3.33 #1)
	id 16Dd4w-00050w-00
	for parisc-linux@lists.parisc-linux.org; Mon, 10 Dec 2001 21:55:34 -0500
Received: (from jkinney@localhost)
	by archimedes.localnetsolutions.com (8.11.6/linuxconf) id fBB2tA703230;
	Mon, 10 Dec 2001 21:55:10 -0500
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
To: palinux <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-SMZl9pxMOWZvwxHSLLgF"
Date: 10 Dec 2001 21:55:10 -0500
Message-Id: <1008039310.31094.29.camel@archimedes.localnetsolutions.com>
Mime-Version: 1.0
Subject: [parisc-linux] console switching with C160 Hyperdrive option card
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

--=-SMZl9pxMOWZvwxHSLLgF
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I loaded up the 0.9.3-rc6 iso. Loaded great onto a C160. I have a
Hyperdrive optional graphics card that my A4033A monitor is attached to.
The main Gecko GSC core graphics is not used. I can get a serial console
with no problem.

How do I tell palo to use the Hyperdrive card?=20

I tried telling it console=3Dfb0, but never got anything. I tried telling
it sti=3D1, no luck there. Tried both.=20

Suggestions welcome !
--=20
James P. Kinney III   \Changing the mobile computing world/
President and COO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20



--=-SMZl9pxMOWZvwxHSLLgF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8FXWOYZCtw4KcbKcRAnOYAKD0aLJZw66HHUv4LjQL0N1XQRlg0wCeL77/
IhuaGqrb0QrKlawPSCynqoQ=
=Xrzc
-----END PGP SIGNATURE-----

--=-SMZl9pxMOWZvwxHSLLgF--
