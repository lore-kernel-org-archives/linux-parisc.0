From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk-x+5WvRp7yOp+8FyH61/OPw@public.gmane.org>
Subject: [parisc-linux] Re: hwinfo_7.30-2: suggested patch
Date: Sun, 2 May 2004 16:33:54 +0300 (EEST)
Message-ID: <Pine.LNX.4.21.0405021145030.30865-100000__180.659702937369$1416623431$gmane$org@hal.pp.fishpool.fi>
References: <20040501142755.GB28250@austin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Cc: PARISC list <parisc-linux-T/XaZq8tFt7U4lJK3ijXoz+iFHGzDt/a@public.gmane.org>,
	debian-hppa-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
To: Morten Werner Olsen <werner-0LiWvn2yMWjUKW2QJMybhA@public.gmane.org>
Return-Path: <q-funk-x+5WvRp7yOp+8FyH61/OPw@public.gmane.org>
In-Reply-To: <20040501142755.GB28250@austin>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request-T/XaZq8tFt7U4lJK3ijXoz+iFHGzDt/a@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux-T/XaZq8tFt7U4lJK3ijXoz+iFHGzDt/a@public.gmane.org>
List-Help: <mailto:parisc-linux-request-T/XaZq8tFt7U4lJK3ijXoz+iFHGzDt/a@public.gmane.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request-T/XaZq8tFt7U4lJK3ijXoz+iFHGzDt/a@public.gmane.org?subject=subscribe>

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
