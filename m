Return-Path: <q-funk@pp.fishpool.fi>
Received: from hal.pp.fishpool.fi (seven.fishpool.fi [195.197.229.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30881487C
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  3 May 2004 19:49:22 -0600 (MDT)
Date: Sun, 2 May 2004 16:33:54 +0300 (EEST)
From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>
To: Morten Werner Olsen <werner@skolelinux.no>
In-Reply-To: <20040501142755.GB28250@austin>
Message-ID: <Pine.LNX.4.21.0405021145030.30865-100000@hal.pp.fishpool.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
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

On Sat, 1 May 2004, Morten Werner Olsen wrote:

> On Wed, Apr 28, 2004 at 09:23:56PM +0300, Martin-=C9ric Racine wrote:
>=20
> > Is any other work required beyond the patch you already submitted to th=
e
> > maintainer?  If so, just how much is needed?  I have some time to spare=
=2E
>=20
> I don't think there is more work than including the already written
> patch to get the package compiling on hppa.
>=20
> The important issue is that I will not include support for hppa if the
> package is not of any use for the hppa users and developers. So please te=
st
> it and see if you find the information that is provided of any interest.

Joel had built and tested it on a B180 and found the results usefull.

I just applied the patch and tested on a 712. Works great. I'm not sure if =
all
the PA-RISC specific hardware gets tested, but at least what I get out of t=
his
patch is already quite usefull to me.  I'd say merge it.

--=20
Martin-=C9ric Racine, ICT Consultant
http://www.pp.fishpool.fi/~q-funk/
