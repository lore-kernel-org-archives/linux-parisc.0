Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gerald.kyllikki.org (pc3-heck1-6-cust211.hudd.cable.ntl.com [80.7.100.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id D17B8482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 May 2003 11:50:09 -0600 (MDT)
Received: from vince by gerald.kyllikki.org with local (Exim 3.36 #1 (Debian))
	id 19GMro-00014f-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 May 2003 18:50:08 +0100
Date: Thu, 15 May 2003 18:50:08 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030515175008.GC23024@kyllikki.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
From: Vincent Sanders <vince@kyllikki.org>
Subject: [parisc-linux] Serial console on a 715/33
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

--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have recently aquired a HP 715/33 machine.
It has 32Mb fitted in a pair of simms and a 2Gb hard disc

I have aquired the machine without keyboard or monitor and as i
intended it to run as a headless system this wasnt an issue. However I
have discovered I need to gain access to the boot prom to change the
settings (I am very familiar with such things from SUN kit). I have
discovered how to get a sensible graphics (1024x768) mode by changing
the dip switches at the back of the board but still dont have a
keyboard.

I have attempted a number of times to get serial console to work by
holding down TOC at boot time to no avail (suggested by mathew
wilcox). I have managed to get the system to boot from the network
using rboot and disconnecting the hard disc then reconnecting the hard
drive and installing debian :-)

This means i have a working debian system but i still cannot get
access to the boot monitor to change any settings.

Does anyone have any clues to get the boot monitor to switch to serial
console without acess to a keyboard or hpux.

--=20
Regards Vincent
http://www.kyllikki.org/

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE+w9NQiUwwPOvjHvURAn+MAJsEUp8qSSQaZ9onliG1tTRO3+2zXQCdFRJS
O30I/7LQpL0jtp8qq/pkkIE=
=z0kS
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
