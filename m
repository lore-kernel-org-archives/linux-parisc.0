Return-Path: <q-funk@pp.fishpool.fi>
Received: from hal.pp.fishpool.fi (seven.fishpool.fi [195.197.229.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B0C8482E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 12:25:07 -0600 (MDT)
Date: Wed, 28 Apr 2004 21:23:56 +0300 (EEST)
From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>
To: Joel Soete <soete.joel@tiscali.be>
In-Reply-To: <408D4360000013CF@ocpmta2.freegates.net>
Message-ID: <Pine.LNX.4.21.0404282123040.27664-100000@hal.pp.fishpool.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Cc: Morten Werner Olsen <werner@skolelinux.no>,
	PARISC list <parisc-linux@lists.parisc-linux.org>,
	debian-hppa@lists.debian.org
Subject: [parisc-linux] Re: hwinfo_7.30-2: suggested patch
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Is any other work required beyond the patch you already submitted to the
maintainer?  If so, just how much is needed?  I have some time to spare.

On Wed, 28 Apr 2004, Joel Soete wrote:

> Hello all,
>=20
> Is there some interest to port this pkg on hppa?
> I think so but I haven't enough time to help more for the moment.
>=20
> Please advise,
>     Joel
>=20
> > -- Original Message --
> > Date: Tue, 27 Apr 2004 22:14:31 +0200
> > From: Morten Werner Olsen <werner@skolelinux.no>
> > To: Joel Soete <soete.joel@tiscali.be>
> > Subject: Re: hwinfo_7.30-2: suggested patch
> >=20
> >=20
> > On Fri, Apr 23, 2004 at 06:38:21PM +0200, Joel Soete wrote:
>=20
> > > - where is the file modules.dep located? (I see hwinfo can't find
> > >   /lib/modules/2.6.6-rc1-pa0/modules.dep) or do you have a kernel
> > >   without module support?
> >=20
> > As explain
> > it is just a draft because it is just a test of 2.6.6-rc1 and
> > I forget to install /lib/modules/2.6.6-rc1-pa0/modules.dep because the
> kernel
> > is well build with module support but for this platform (by default) al=
l
> > drivers are buildin (again it=20
> > s just testing)
> >=20
> > That said, I well understood that it may need some more work to
> > improve support of hppa.
> >=20
> > But may be can we put the question of actual interest to the parisc-lin=
ux.org
> > or better to debian-hppa ml?=20
> > (I would like to
> > help you more (more test on different model,
> > different kernel 2.4, 2.6) but right now I don't have enough time to
> > do more, sorry)
>=20
> If you think the hppa-community will use the hwinfo package and you'll
> help me make it work on the architecture,
> > I'll include your patch! :)
>=20
> Just give me a sign, and I'll include it. I will not do it until next
> week, as I hope to get the package (v7.30-2) into Sarge when the
> 10days period is finished [1].
>=20
>=20
> - Werner
>=20
> [1] http://packages.qa.debian.org/h/
> > winfo.html
>=20
>=20
>=20
> -------------------------------------------------------------------------=
---------------
> Tiscali ADSL: 35 =80/mois, la meilleure offre du march=E9!
> http://reg.tiscali.be/default.asp?lg=3Dfr
>=20
>=20
>=20
>=20
>=20

--=20
Martin-=C9ric Racine, ICT Consultant
http://www.pp.fishpool.fi/~q-funk/
