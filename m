Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.maybe.net (12-203-17-50.client.attbi.com [12.203.17.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34762482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Jul 2003 20:41:36 -0600 (MDT)
Date: Mon, 28 Jul 2003 19:41:35 -0700
From: Chris Jantzen <chris-parisc@maybe.net>
To: Diego Francisco de Gastal Morales <Morales@tj.rs.gov.br>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] eisa nic: intel 82556. Driver?
Message-ID: <20030729024135.GE21158@maybe.net>
References: <41001F95FE172B4593DE6F50CAAF2D581AA227@mailserver.tj.rs.gov.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
In-Reply-To: <41001F95FE172B4593DE6F50CAAF2D581AA227@mailserver.tj.rs.gov.br>
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

--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2003 at 04:55:25PM -0300, Diego Francisco de Gastal Morales=
 wrote:
> Hello,
>=20
> 	I just installed linux on a HP9000/D280. It's all fine, except the machi=
ne has two eisa fast ethernet cards, with intel 82556 chipset, and I can't =
make it work.
> 	I've already searched a lot the internet, this list archives, recompiled=
 my kernel with various modules, and I am just about to loose my faith. I'v=
e found a message just like "with this chipset on eisa, you're out of luck".
>=20
> 	Is it really so? Does anyone here heard of this nic working on linux par=
isc? Without fast ethernet, I'm afraid we'll have to give up putting linux =
on it.


I gave up on installing some EISA 3com cards in my C180. I believe the
dmac bridge in Linux isn't (yet) general enough to support anything
other than PCI.

That said, is Fast Ethernet really *that* important? You'd have to be
using the host to do fairly trivial tasks thousands of times per second
to saturate 100Mbps. In other words: at these CPU speeds, anything
seriously taxing will obviate your need for that much bandwidth. I do
builds over NFS and notice no appreciable performance hits. (And
certainly bandwidth monitors are never pegged on the network.)

--=20
chris jantzen kb7rnl =3D->         __O
Insert witty comment here.     _`\<,_
http://www.maybe.net/         (*)/ (*)

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/Jd7f97VrQBIVkcQRArlwAJ9ovIU/EAK2pBDkiLYEU7HLPjMp7ACdHSaP
2p3NKboyn90Xhee1dlPsXAQ=
=NGtu
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
