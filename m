Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from grass.darkmist.net (landmine.darkmist.net [63.226.105.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 521A9482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Dec 2002 23:45:20 -0700 (MST)
Date: Sun, 15 Dec 2002 23:45:12 -0700
From: Ed Schaller <schallee@darkmist.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20021216064512.GA1983@darkmist.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Subject: [parisc-linux] quad tulip now not functional in 2.4.20
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

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I have a B180 that I have been using as a firewall/router for some time
now. Along with the built in tulip ethernet card, I also have a Adaptec
quad ethernet card that is also tulip based. This has worked fine in
2.4.17-2.4.19 but no longer works in 2.4.20-pa13. Although I can
ifconfig up the interfaces, no traffic goes through and mii-tool reports
that the interfaces do not exist (except for the built in one).

In the following dmesg out takes for 2.4.20-pa13 and 2.4.19-32 (debian),
it seems that the older kernel is finding the transceiver and
successfully auto-negotiating the link while the newer is not.

Any ideas how to solve this? Any help would be greatly appreciated.

Linux version 2.4.20-pa13 (root@landmine) (gcc version 3.0.4) #3 Tue Dec 10 01:35:34 MST 2002
...
Linux Tulip driver version 0.9.15-pre12 (Aug 9, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 48 at 0xf0fff000, 00:60:B0:C4:5E:7B, IRQ 96.
eth1: Digital DS21140 Tulip rev 34 at 0xf0efc000, 00:00:D1:1B:C8:90, IRQ 98.
eth2: Digital DS21140 Tulip rev 34 at 0xf0efd000, 00:00:D1:1B:C8:B5, IRQ 99.
eth3: Digital DS21140 Tulip rev 34 at 0xf0efe000, 00:00:D1:1B:C8:95, IRQ 96.
eth4: Digital DS21140 Tulip rev 34 at 0xf0eff000, 00:00:D1:1B:70:33, IRQ 97.
...until ifconfig eth0-eth4
eth0: Setting full-duplex based on MII#1 link partner capability of 45e1.

Linux version 2.4.19-32 (root@j5k) (gcc version 3.0.4) #1 Fri Nov 22 23:27:00 MST 2002
...
Linux Tulip driver version 0.9.15-pre11 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 48 at 0xff00, 00:60:B0:C4:5E:7B, IRQ 96.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 01e1.
eth1: Digital DS21140 Tulip rev 34 at 0xec00, 00:00:D1:1B:C8:90, IRQ 98.
tulip2:  EEPROM default media type Autosense.
tulip2:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
tulip2:  MII transceiver #1 config 3100 status 7849 advertising 01e1.
eth2: Digital DS21140 Tulip rev 34 at 0xed00, 00:00:D1:1B:C8:B5, IRQ 99.
tulip3:  EEPROM default media type Autosense.
tulip3:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
tulip3:  MII transceiver #1 config 3100 status 7849 advertising 01e1.
eth3: Digital DS21140 Tulip rev 34 at 0xee00, 00:00:D1:1B:C8:95, IRQ 96.
tulip4:  EEPROM default media type Autosense.
tulip4:  Index #0 - Media MII (#11) described by a 21140 MII PHY (1) block.
tulip4:  MII transceiver #1 config 3100 status 7849 advertising 01e1.
eth4: Digital DS21140 Tulip rev 34 at 0xef00, 00:00:D1:1B:70:33, IRQ 97.
...until ifconfig eth0-eth4
eth0: Setting full-duplex based on MII#1 link partner capability of 45e1.
eth1: Setting full-duplex based on MII#1 link partner capability of 45e1.
eth2: Setting full-duplex based on MII#1 link partner capability of 45e1.
eth3: Setting full-duplex based on MII#1 link partner capability of 41e1.
eth4: Setting full-duplex based on MII#1 link partner capability of 41e1.

>>>------>

--

+-------------+-----------------------+---------------+
| Ed Schaller | Dark Mist Networking  | psuedoshroom  |
+-------------+-----------------------+---------------+

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE9/XZ48kiOCKEpeEERAt/RAJ40HoGEVtPmIkVd5TpXMvsbotLs+QCghCCm
4GlTWn6yU5s7OQ2Umyi8Mgc=
=NKHA
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
