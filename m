Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maynard.mail.mindspring.net (maynard.mail.mindspring.net [207.69.200.243])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9CCCC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Dec 2001 15:25:52 -0700 (MST)
Received: from archimedes.localnetsolutions.com ([199.174.105.194])
	by maynard.mail.mindspring.net with esmtp (Exim 3.33 #1)
	id 16F0m6-0002uo-00
	for parisc-linux@lists.parisc-linux.org; Fri, 14 Dec 2001 17:25:50 -0500
Received: (from jkinney@localhost)
	by archimedes.localnetsolutions.com (8.11.6/linuxconf) id fBEMPNr05580;
	Fri, 14 Dec 2001 17:25:23 -0500
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
To: palinux <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-MaJqueg6FRNwDMnuA6A+"
Date: 14 Dec 2001 17:25:23 -0500
Message-Id: <1008368723.3023.6.camel@archimedes.localnetsolutions.com>
Mime-Version: 1.0
Subject: [parisc-linux] Hardware? nothing boots.
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

--=-MaJqueg6FRNwDMnuA6A+
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I was installing 0.9.3. Serial console installation. For some reason, my
keyboard is seen as sending double carriage returns in palinux. This is,
of course, a major problem during the config process. I got as far as
the second stage "you have a minimal system", had
downloaded/apt-get/CD'ed EVERYTHING since I can't select from the menu's
with the keyboard. During the dpkg configure all this stuff phase, I got
stuck. tab wouldn't advance me to the next control item and I would up
with a "help" screen that would only close with an "enter" which doubles
and reopens the same help screen. Aargh!

So I hit the power switch after about an hour of trying everything I can
find.

Big problems. No console. No keyboard. The boot process hangs and has
every status light on but the heartbeat. The big monitor has a video
signal, but no text. The serial console monitor is on, blinking curser.
It responds keyboard (echos to screen).

Any suggestions?
--=20
James P. Kinney III   \Changing the mobile computing world/
President and COO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20



--=-MaJqueg6FRNwDMnuA6A+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8GnxTYZCtw4KcbKcRApa6AKDxUKD3Xtvjjpa32+LeSm260kyFfgCgwqqt
lmFShq9jb0hAOnvxCdM11EY=
=oVwA
-----END PGP SIGNATURE-----

--=-MaJqueg6FRNwDMnuA6A+--
