From: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] Re: kernel 2.6 for hppa status?
Date: Tue, 26 Aug 2003 23:38:41 +0200
Message-ID: <20030826233841.655ec3b2.varenet__20629.9751917415$1416622731$gmane$org@esiee.fr>
References: <200308261202100660.00729583@smtp1.sympatico.ca>
	<Pine.LNX.4.21.0308262125490.16192-100000@hal.pp.fishpool.fi>
	<20030826200354.GT22294@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1"; boundary="=.Qjpr3j(rw5Je4."
Cc: willy@debian.org,
	=?ISO-8859-1?Q?Martin-=C9ric?= Racine <q-funk@pp.fishpool.fi>,
	debian-hppa@lists.debian.org
To: parisc-linux@parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030826200354.GT22294@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--=.Qjpr3j(rw5Je4.
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Aug 2003 21:03:54 +0100
Matthew Wilcox <willy@debian.org> wrote:

> On Tue, Aug 26, 2003 at 09:29:35PM +0300, Martin-=C9ric Racine wrote:
> > Greetings,
> >=20
> > Having just tried kernel 2.6 (the release candidate found in unstable)
> > on i386, I found it to bring a _tremendous_ improvement in
> > responsiveness and especially in userspace stuff like XFree. Given how
> > this 712 is the slowest machine in my LAN, I was wondering if any work
> > is being done on 2.6 for hppa and when is the first release expected?=20
> > Thanks!
>=20
> -> parisc-linux.org where we have 2.6.0-test4.
> When might there be a debian package for it?  Don't know, not my
> department.

If it was up to me i guess it wouldn't take much time. I have to discuss
that with either you and bdale, to state *how* we want it done...

Anyway, let me remind you that as for generating 2.6 netinsts, i _do_ need
arch/parisc/debian-configs/* files to provide you with a 2.6 package.

Since i'm not willing to find out by myself what we want and what we don't
want in 2.6 "debian stock" kernel configs (that's a matter for the b-f
maintainer i guess, or maybe my kernel package mentor - aka bdale - has
some ideas about it ;), i won't be able to do anything _prior_ to these
files appearance in our CVS tree...

> But the -pa patch is a tiny fraction of the size of the 2.4 patch, so
> it'll be much easier for everyone.

that's for sure!

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

--=.Qjpr3j(rw5Je4.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/S9NmHjLD2rfS8GMRAgrhAJ0fbGX5Yos7ixDt493Nm5lAaqm3OgCfX0qn
Y+dO2QXp9Zudfsasu+Y96NY=
=nlpT
-----END PGP SIGNATURE-----

--=.Qjpr3j(rw5Je4.--
