Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blount.mail.mindspring.net (blount.mail.mindspring.net [207.69.200.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 923D74829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Sep 2002 20:32:09 -0600 (MDT)
Received: from archimedes.localnetsolutions.com (archimedes.localnetsolutions.com [192.168.0.2])
	by castle.localnetsolutions.com (8.11.6/linuxconf) with ESMTP id g8G2WEB15927;
	Sun, 15 Sep 2002 22:32:14 -0400
Subject: RE: [parisc-linux] Re: [PATCH] Voodoo framebuffer on PARISC
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
To: Tobias Giesen <tobias_subscriber@tgtools.com>
Cc: palinux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <000001c25d16$80be8b30$0100a8c0@PLUTO>
References: <000001c25d16$80be8b30$0100a8c0@PLUTO>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-Y7wnlyzpNsPLiwMOjziS"
Date: 15 Sep 2002 22:31:54 -0400
Message-Id: <1032143514.31738.289.camel@archimedes.localnetsolutions.com>
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

--=-Y7wnlyzpNsPLiwMOjziS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

As I don't have the Voodoo card, I didn't keep the patch, but, are there
settings in the sstfb patch that can be used to define the default
frequencies?  The only other alternative will be to get a very high
frequency monitor that supports 1280x1024@72Hz. My HP A4033A monitor has
no problem with that. But my Digiview croaked on it on my SGI Octane. So
now I have to switch out between the two boxes (Octane and C160) with
the A4033A. I haven't tried my Panasonic E21. It supports 1600x1280@60
so it should handle it OK.

On Sun, 2002-09-15 at 20:17, Tobias Giesen wrote:
> Hello,
>=20
> I think I need some more help with this. Here's what I did:
>=20
> - grabbed fresh 2.4.19-pa17 sources
> - applied sstfb.c and .h patch
> - set kernel options to include sst1
> - compiled & installed new kernel
>=20
> The new kernel seems to try to activate a Voodoo console shortly after
> the "If this is the last message you see ..." warning. However, my
> monitor says the frequencies are out of range and switches itself off.
> The main sti console is then dead also.
>=20
> Any ideas? Maybe could I try a precompiled kernel with Voodoo support?
>=20
> Thanks.
>=20
> Best wishes,
> Tobias Giesen
>=20
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--=20
James P. Kinney III   \Changing the mobile computing world/
President and CEO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20



--=-Y7wnlyzpNsPLiwMOjziS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9hUKZYZCtw4KcbKcRAkEDAJwNXVoGaQi99aHhFn9Wa7sACgWzUACeI9qK
FRX2osoV4k/uVbS8ZOImVXk=
=ctY6
-----END PGP SIGNATURE-----

--=-Y7wnlyzpNsPLiwMOjziS--
