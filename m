Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mclean.mail.mindspring.net (mclean.mail.mindspring.net [207.69.200.57])
	by dsl2.external.hp.com (Postfix) with ESMTP id E1E0B482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Jul 2002 10:19:41 -0600 (MDT)
Received: from archimedes.localnetsolutions.com (archimedes.localnetsolutions.com [192.168.0.2])
	by castle.localnetsolutions.com (8.11.6/linuxconf) with ESMTP id g6PGJkr08909;
	Thu, 25 Jul 2002 12:19:46 -0400
Subject: Re: [parisc-linux] i dont know jack
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
To: Rick Vernam <rickvernam@hotmail.com>
Cc: palinux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <DAV66Z9F2u1YOyJvAiS00005c0c@hotmail.com>
References: <DAV66Z9F2u1YOyJvAiS00005c0c@hotmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-OnmoTH286cmyqrJ27Gul"
Date: 25 Jul 2002 12:19:35 -0400
Message-Id: <1027613975.12732.358.camel@archimedes.localnetsolutions.com>
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

--=-OnmoTH286cmyqrJ27Gul
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

During the install process, one must create partitions to format then
install onto. Getting to that point is not too slow. Doing it from any
ol' HP box that comes in the door may be the biggest challenge.=20

If you can get one box to run with SCSI connections available for other
drives, boot the working boox with all the drives you want blanked,
fdisk them to one big linux partition, then shutdown. It will require
that you pull the drives, but in batch mode of 6 at a time, it will
likely be faster than 6 boots and partial setups.

Any of that old junk you want to throw my way (Atlanta) would be fun :)
My office already looks like a museum.

On Thu, 2002-07-25 at 11:43, Rick Vernam wrote:
> i work at place that gets tons of computer junk from companies that are g=
etting rid of their equip.  one of our requirements is to kill the partitio=
ns on the HDs ( it is known that will no completely remove data, just make =
is a little more difficult to get too ).  so we are getting HP machines wit=
h pa-risc stuff and most wont boot ( i know enough to know how to initiate =
a boot ).  is there some way, using this parisc-linux that i can quickly ki=
ll partitions?
>=20
> -Rick
> rickvernam@hotmail.com
--=20
James P. Kinney III   \Changing the mobile computing world/
President and CEO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint =3D 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7=20



--=-OnmoTH286cmyqrJ27Gul
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9QCUXYZCtw4KcbKcRAkqLAKDuBI+8KCUDWHHU5vdag1/MqkhK6wCg7IRx
rI7kLD563na37D4F/9KGGEY=
=N0mq
-----END PGP SIGNATURE-----

--=-OnmoTH286cmyqrJ27Gul--
