Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from grass.darkmist.net (landmine.darkmist.net [63.226.105.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF3804851
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 13:27:52 -0700 (MST)
Date: Wed, 18 Dec 2002 13:27:40 -0700
From: Ed Schaller <schallee@darkmist.net>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: jsoe0708@tiscali.be, Ed Schaller <schallee@darkmist.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] quad tulip now not functional in 2.4.20
Message-ID: <20021218202740.GA2686@darkmist.net>
References: <20021216231132.GC854@dsl2.external.hp.com> <3DED9BBD0000213A@ocpmta7.freegates.net> <20021218165813.GA17944@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
In-Reply-To: <20021218165813.GA17944@dsl2.external.hp.com>
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

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Like I suspected, backing out this change made add-on boards work again.
> I've reverted that change in 2.4.20-pa15 along with a traps.c change.
> Please apply by hand and try the 4-port again.

Seems to work fine. Thanks for all the help!

>>>------>

--

+-------------+-----------------------+---------------+
| Ed Schaller | Dark Mist Networking  | psuedoshroom  |
+-------------+-----------------------+---------------+

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+ANo88kiOCKEpeEERAkzgAJ4gDhK9uZJhVNioSayrG4EWT5yuRACdF5rb
tCdqn52XZgwcpwjdCyhjT0k=
=ackY
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
