Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tisch.mail.mindspring.net (tisch.mail.mindspring.net [207.69.200.157])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7FAA482B
	for <parisc-linux@parisc-linux.org>; Sat,  2 Feb 2002 08:19:32 -0700 (MST)
Received: from user-119b1cf.biz.mindspring.com ([66.149.133.143] helo=archimedes.localnetsolutions.com)
	by tisch.mail.mindspring.net with esmtp (Exim 3.33 #1)
	id 16X1wo-0006Np-00
	for parisc-linux@parisc-linux.org; Sat, 02 Feb 2002 10:19:22 -0500
Received: (from jkinney@localhost)
	by archimedes.localnetsolutions.com (8.11.6/linuxconf) id g12FJJs26898;
	Sat, 2 Feb 2002 10:19:19 -0500
Subject: Re: [parisc-linux] Rsync...
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020202140147.C26868@parcelfarce.linux.theplanet.co.uk>
References: <20020202120256.U27172@lug-owl.de>
	<20020202140147.C26868@parcelfarce.linux.theplanet.co.uk>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-4T+WVrt2NLkQ+bg4GVA7"
Date: 02 Feb 2002 10:19:19 -0500
Message-Id: <1012663159.7003.4098.camel@archimedes.localnetsolutions.com>
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

--=-4T+WVrt2NLkQ+bg4GVA7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I think that the rsync security and corruption bug were just fixed in a
recent update to v. 2.4.6.  The security hole was patched, but I'm
unclear about the repair of the corruption problem.

On Sat, 2002-02-02 at 09:01, Matthew Wilcox wrote:
> On Sat, Feb 02, 2002 at 12:02:56PM +0100, Jan-Benedict Glaw wrote:
> > Hi!
> >=20
> > For some time, there was rsync access to a checked-out version
> > of current CVS. This is gone recently, and I don't know why.
> > I'd really love to again use rsync for fetching sources
> > (and as you know, I'd also like to rsync the CVS repository
> > itself).
> >=20
> > Any chances?
>=20
> you may have noticed a certain amont of security-related kerfuffle around
> rsync recently.  until this is fixed and the data-corruption bugs are fix=
ed,
> rsync has been disabled on {ftp,www,cvs}.parisc-linux.org.  sorry.
>=20
> --=20
> Revolutions do not require corporate support.
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



--=-4T+WVrt2NLkQ+bg4GVA7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8XAN3YZCtw4KcbKcRArhWAJ9CIi2V7vELnHkd5BxpBORP12v1XQCgg8cY
E9Jeczcw92ng14OU3wQ8n2Y=
=1Xpq
-----END PGP SIGNATURE-----

--=-4T+WVrt2NLkQ+bg4GVA7--
