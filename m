Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp6.mindspring.com (smtp6.mindspring.com [207.69.200.110])
	by dsl2.external.hp.com (Postfix) with ESMTP id 255346121
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 15:33:57 -0700 (MST)
Received: from archimedes.localnetsolutions.com ([199.174.105.194])
	by smtp6.mindspring.com with esmtp (Exim 3.33 #1)
	id 16EHwi-0001rU-00
	for parisc-linux@lists.parisc-linux.org; Wed, 12 Dec 2001 17:33:48 -0500
Received: (from jkinney@localhost)
	by archimedes.localnetsolutions.com (8.11.6/linuxconf) id fBCMXhg15092;
	Wed, 12 Dec 2001 17:33:43 -0500
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
To: palinux <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-T3sfHLzT2ul/rcAawWx6"
Date: 12 Dec 2001 17:33:43 -0500
Message-Id: <1008196423.31094.55.camel@archimedes.localnetsolutions.com>
Mime-Version: 1.0
Subject: [parisc-linux] C160 STI console woes
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

--=-T3sfHLzT2ul/rcAawWx6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

OK, I've enclosed the dmesg output. The card had a sticker which lists
it as a 4017B. dmesg calls it a 4017b-lz. There is an expansion card on
it with a bunch of Motorola chips and a large one with a heat sink. It
is plugged into the GSC socket, not the PCI socket. (Why is the PCI
socket "backwards"? I've got a great Matrox Millineum ...)

grep -i sti dmesg.txt
Kernel command line: root=3D/dev/sda5 HOME=3D/ console=3Dtty0 sti=3D0
sti_font=3DVGA8x16 TERM=3Dlinux
POSIX conformance testing by UNIFIX
STI word mode ROM at f0026000, hpa=3Dfa000000
STI word mode ROM, id 2d08c0a7-9a02587, conforms to spec rev. 8.07
STI device: INTERNAL_EG_1280
STI byte mode ROM at f8000000, hpa=3Df8000000
STI byte mode ROM, id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071B_LZ
fb0: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio:
0xfa100000
fb1: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio:
0xf8100000
sticonsole_init: searching for STI ROMs

grep -i graphics dmesg.txt
18. Gecko GSC Core Graphics (10) at 0xfa000000 [8/24], versions 0x16,
0x0, 0x85
21. Coral SGC Graphics (10) at 0xf8000000 [10/8], versions 0x4, 0x0,
0x77

Before the firmware upgrade, the Coral SGC card was listed as a
"Hyperdrive optional graphics (10) at 0xf8000000 [10/8], versions 0x5,
0x0, 0x77

It seems that sti=3D1 should turn on console on the graphics monitor.
Unless I need a different graphics terminal other than tty0 or tty1.

--=20
James P. Kinney III   \Changing the mobile computing world/
President and COO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20



--=-T3sfHLzT2ul/rcAawWx6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8F9tHYZCtw4KcbKcRAj8/AJwPW3rdoRR8jnNS0C0QYR/hTN6CMgCg48T+
bvboKy4KGUAQ3zh05XUHjlk=
=KnBT
-----END PGP SIGNATURE-----

--=-T3sfHLzT2ul/rcAawWx6--
