Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44135482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Apr 2002 09:06:45 -0600 (MDT)
Date: Mon, 8 Apr 2002 17:06:42 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] K220 - Setup via. Console
Message-ID: <20020408150642.GF12289@lug-owl.de>
References: <3CB12C3E.B6FB23DB@attbi.com> <20020408155644.F27547@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
In-Reply-To: <20020408155644.F27547@parcelfarce.linux.theplanet.co.uk>
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

--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2002-04-08 15:56:44 +0100, Matthew Wilcox <willy@debian.org>
wrote in message <20020408155644.F27547@parcelfarce.linux.theplanet.co.uk>:
> On Sun, Apr 07, 2002 at 10:35:58PM -0700, Ahbaid Gaffoor wrote:
> > I am trying to use the console cable I have used with Sun boxes on this
> > machine, however I just cannot get it to work? My terminal emulation is
> > done via HyperTerminal on a laptopb via. COM1
>=20
> I think Sun have their own strange pinout whereas HP use a standard
> null-modem cable.

Older Suns use a jack that's identical to what Macs use; newer Systems
do have a female (!) DM25 jack which contains two serial ports: one
on the "standard" pins (you only need a genderchanger and a DB25 -> DB9
converter), the other port is on the unused pins (you can buy
split cables for 10 US-$ on ebay).

The round jack on those Macs/SGIs/Suns do have three important pins:
If you look at it, it looks like this:



        1     2     3

=20

   4            5        6


   =20
         7        8


(Yes, it's assymmetric). 4 and 6 are RxD and TxD, 5 is Ground. Happy

MfG, JBG
PS: I don't know which one of pin 4 and 6 is RxD and which one is TxD.
You maybe have to try and error...

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAjyxsgEACgkQHb1edYOZ4btJdACghkxEZicx0diNWtK0w2VVTO4d
rT8An3Me+/mXoE8gSE1jBT5+8fG+s/E2
=FrJ1
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--
