Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tisch.mail.mindspring.net (tisch.mail.mindspring.net [207.69.200.157])
	by dsl2.external.hp.com (Postfix) with ESMTP id CBDBA482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Dec 2001 12:07:37 -0700 (MST)
Received: from archimedes.localnetsolutions.com ([199.174.105.194])
	by tisch.mail.mindspring.net with esmtp (Exim 3.33 #1)
	id 16DsFb-00021W-00
	for parisc-linux@lists.parisc-linux.org; Tue, 11 Dec 2001 14:07:35 -0500
Received: (from jkinney@localhost)
	by archimedes.localnetsolutions.com (8.11.6/linuxconf) id fBBJ7Va07581;
	Tue, 11 Dec 2001 14:07:31 -0500
Subject: Re: [parisc-linux] console switching with C160 Hyperdrive option
	card
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
Cc: palinux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <E16DicI-0000Xi-00@linuxlab.wdf.sap-ag.de>
References: <1008039310.31094.29.camel@archimedes.localnetsolutions.com>
	<E16DicI-0000Xi-00@linuxlab.wdf.sap-ag.de>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-bP3Pa2cuhzKT5GEOhg1R"
Date: 11 Dec 2001 14:07:31 -0500
Message-Id: <1008097651.31094.35.camel@archimedes.localnetsolutions.com>
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

--=-bP3Pa2cuhzKT5GEOhg1R
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Ah, Ha! Lots of sti stuff in dmesg output. All positive. Found
everything.=20

Grabbed a new kernel source from kernel.org and ran make oldconfig. I
think it uses the current running kernel for a starting point.

Looked at the .config file afterwards. No sti frame buffer configured.
Hmm.=20

More research. Current firmware is 2.1. Latest firmware from HP is 6.1.
And it "fixes" some 3rd  party graphics card problems.

As soon as I get a blank tape, I'll upgrade the firmware (scary
process!).

Did the sti framebuffer get compiled into the kernel on the 0.9.3-rc6
iso or am I missing something?

On Tue, 2001-12-11 at 03:50, Helge Deller wrote:
> On Tuesday 11 December 2001 03:55, James P. Kinney III wrote:
> > I loaded up the 0.9.3-rc6 iso. Loaded great onto a C160. I have a
> > Hyperdrive optional graphics card that my A4033A monitor is attached to=
.
> > The main Gecko GSC core graphics is not used. I can get a serial consol=
e
> > with no problem.
> >
> > How do I tell palo to use the Hyperdrive card?
> >
> > I tried telling it console=3Dfb0, but never got anything. I tried telli=
ng
> > it sti=3D1, no luck there. Tried both.
> >
> > Suggestions welcome !
>=20
> Hi James,
>=20
> sti=3D1 should be the right value if the stifb driver detects and support=
s your=20
> hyperdrive. Maybe you could post the boot-messages regarding your=20
> graphic cards (`dmesg | grep sti`) ?
>=20
> Helge
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>=20
--=20
James P. Kinney III   \Changing the mobile computing world/
President and COO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20



--=-bP3Pa2cuhzKT5GEOhg1R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8FllyYZCtw4KcbKcRArzxAKC9IKiFyyDdyUIuvOWGQHuAQtpbcACg8DsR
eew0lCMcNKZ/f+ADps8rfPM=
=Lm3q
-----END PGP SIGNATURE-----

--=-bP3Pa2cuhzKT5GEOhg1R--
