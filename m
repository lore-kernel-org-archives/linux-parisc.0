Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from granger.mail.mindspring.net (granger.mail.mindspring.net [207.69.200.148])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C9E8482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Dec 2001 17:45:31 -0700 (MST)
Received: from archimedes.localnetsolutions.com ([199.174.105.194])
	by granger.mail.mindspring.net with esmtp (Exim 3.33 #1)
	id 16F2xG-000432-00
	for parisc-linux@lists.parisc-linux.org; Fri, 14 Dec 2001 19:45:30 -0500
Received: (from jkinney@localhost)
	by archimedes.localnetsolutions.com (8.11.6/linuxconf) id fBF0j3F06249;
	Fri, 14 Dec 2001 19:45:03 -0500
Subject: Re: [parisc-linux] Hardware? nothing boots.
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
To: palinux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <1008373989.3027.10.camel@archimedes.localnetsolutions.com>
References: <1008368723.3023.6.camel@archimedes.localnetsolutions.com>  
	<E16F1x5-0006hT-00@noam.fc.hp.com>
	<1008373989.3027.10.camel@archimedes.localnetsolutions.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-dt0MaK7SwHb6rAWRIX50"
Date: 14 Dec 2001 19:45:03 -0500
Message-Id: <1008377103.3023.14.camel@archimedes.localnetsolutions.com>
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

--=-dt0MaK7SwHb6rAWRIX50
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

OK. After some brain dead moments with minicom (reset after changing com
ports!) I'm into the C160. I think the 700/96 just died. Not sure yet.

BTW. 0.9.3 is overall very well done. Many thanks to those who made it
happen.=20

On Fri, 2001-12-14 at 18:53, James P. Kinney III wrote:
> Oops. I forgot to include the details.
>=20
> C160, HP 700/96 console. The big monitor is a 4033A connected to a
> 4071B_LZ graphics card. I don't have an adapter for the onboard Gecko
> graphics. I have yet to get console on the STI graphics.
>=20
> The box is booting now. (???) I can ping it and it has a heartbeat. No
> screen access or keyboard. I've tried moving the console to serial_2 on
> the box. No luck.=20
>=20
> On Fri, 2001-12-14 at 18:41, Paul Bame wrote:
> > =3D Big problems. No console. No keyboard.
> >=20
> > And no information.  What kind of parisc box?  What is your
> > serial console?  Terminal?  Terminal software?  What kind?  etc
> >=20
> >=20
> > 	-P
> --=20
> James P. Kinney III   \Changing the mobile computing world/
> President and COO      \          one Linux user         /
> Local Net Solutions,LLC \           at a time.          /
> 770-493-8244             \.___________________________./
>=20
> GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
> <jkinney@localnetsolutions.com>
> Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20
>=20
>=20
--=20
James P. Kinney III   \Changing the mobile computing world/
President and COO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20



--=-dt0MaK7SwHb6rAWRIX50
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8Gp0OYZCtw4KcbKcRAmR4AJ4q+kgB+NR4rZfIjBSxx74edY/X9wCg1g8M
rdHI8xMLgUeAI79q8p+IVRI=
=cj8s
-----END PGP SIGNATURE-----

--=-dt0MaK7SwHb6rAWRIX50--
