Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id AEB924840
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Nov 2003 00:31:56 -0700 (MST)
Date: Wed, 19 Nov 2003 08:31:55 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Boot-up challenges on a 715/75
Message-ID: <20031119073155.GO1037@lug-owl.de>
References: <1e2.13b31f0d.2cebe9ab@aol.com> <Pine.LNX.4.58.0311182035020.17277@brain.fop.ns.ca> <20031119055936.GA17873@colo.lackof.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OAiy6VLsECigG9dy"
In-Reply-To: <20031119055936.GA17873@colo.lackof.org>
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

--OAiy6VLsECigG9dy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-11-18 22:59:36 -0700, Grant Grundler <grundler@parisc-linux.or=
g>
wrote in message <20031119055936.GA17873@colo.lackof.org>:
> On Tue, Nov 18, 2003 at 08:38:00PM -0400, Steve Bromwich wrote:
> I'm only aware of HP using 2k sectors for CD-RO.
>=20
> I've never heard of 512 byte sectors in a CD Drive.

Most machines !=3D i386 actually want to have 512-Byte/Sector-capable CD
drives. These need to be equipped with appropriate firmware. It's just
because that does fit very well to 512 byte blocks from other storage
devices (like HDDs:).

> Is that a feature unique to CD-RW?

No, it's a (rare) feature ot CD-RO drives, mostly used by MIPS and SUN
machines.

> > Alternatively, you might have better luck doing a netboot, which I've u=
sed
> > with success before on a 715/75.
>=20
> that's a good idea too. "lifimage" files are also available that one

Right. To anybody who's facing non-i386 machines (or even newer i386
machines with net-bootable network cards), I can only suggest to prepare
yourself with a bootserver that does everything you need for you. I've
configured some old box to do that (that is, you need dhcp/bootp, rarp,
tftp, rbootd, NFS and most probably some additional kernel configuration
like "echo 1 > /proc/sys/net/ipv4/ip_no_pmtu_disc" and maybe a more
limited ip_local_port_range due to SGI firmware bugs...).

Netbooting saves lots of time and even eases the task of backing-up your
test boxes if they use nfsroot:)

MfG, JBG (->going away now to play with his vax...)

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--OAiy6VLsECigG9dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/uxxrHb1edYOZ4bsRAtYGAJ9WmNqCnvodK/BRK7yoNztdoJ8EzwCfR/m7
TLv5PhrhcCc+ZZysklH28Vg=
=4OJx
-----END PGP SIGNATURE-----

--OAiy6VLsECigG9dy--
