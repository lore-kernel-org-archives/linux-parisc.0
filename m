Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from granger.mail.mindspring.net (granger.mail.mindspring.net [207.69.200.148])
	by dsl2.external.hp.com (Postfix) with ESMTP id 048E2482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 12:34:40 -0700 (MST)
Received: from archimedes.localnetsolutions.com ([199.174.105.194])
	by granger.mail.mindspring.net with esmtp (Exim 3.33 #1)
	id 16EF9L-0002CD-00
	for parisc-linux@lists.parisc-linux.org; Wed, 12 Dec 2001 14:34:39 -0500
Received: (from jkinney@localhost)
	by archimedes.localnetsolutions.com (8.11.6/linuxconf) id fBCJYZx14182;
	Wed, 12 Dec 2001 14:34:35 -0500
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
To: palinux <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-VIDXBrtx3YhMpP9/fY4b"
Date: 12 Dec 2001 14:34:35 -0500
Message-Id: <1008185675.31094.49.camel@archimedes.localnetsolutions.com>
Mime-Version: 1.0
Subject: [parisc-linux] Firmware upgraded, STI console problem
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

--=-VIDXBrtx3YhMpP9/fY4b
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

My C160 is running the old, broken, no-working-pci, firmware version
2.1. The ftp://us-ffs.external.hp.com/firmware_patches/hp/cpu/ lists the
latest version (PF_CC2X0061) as 6.1.=20

So I upgraded my firmware. Still no sti console nor X on frame buffer. I
can see in /proc that the frame buffers are running (stifb). When X
starts, it fails on a framebuffer call.=20

When IPL

dmesg mentions: Dino: No PCI devices enabled.

Also, my processor is listed in firmware and docs as a PA8000. So why
not 64-bit cpu. If I boot the 2.4.16-64 kernel, it hangs after the
"branching" messege screen.=20
--=20
James P. Kinney III   \Changing the mobile computing world/
President and COO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20



--=-VIDXBrtx3YhMpP9/fY4b
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8F7FLYZCtw4KcbKcRAqZdAKCf33tKHJawoMPWDFk1mOTj8pPTtQCgre1f
gsOqSjxf/HJhmMs57+rCJWk=
=1EHK
-----END PGP SIGNATURE-----

--=-VIDXBrtx3YhMpP9/fY4b--
