From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] Remove needless flush_dcache_page call
Date: Fri, 16 Jan 2009 11:28:09 -0500
Message-ID: <20090116162809.GA5697@bombadil.infradead.org>
References: <20090116052804.GA18737@barrios-desktop> <20090116053338.GC31013@parisc-linux.org> <20090116055119.GA6515@barrios-desktop> <20090116055927.GA22810@wotan.suse.de> <20090116060124.GG31013@parisc-linux.org> <20090116073413.GC22810@wotan.suse.de> <1232116101.3224.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Nick Piggin <npiggin@suse.de>, Matthew Wilcox <matthew@wil.cx>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1232116101.3224.14.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 16, 2009 at 09:28:21AM -0500, James Bottomley wrote:
> On Fri, 2009-01-16 at 08:34 +0100, Nick Piggin wrote:
> > On Thu, Jan 15, 2009 at 11:01:24PM -0700, Matthew Wilcox wrote:
> > > On Fri, Jan 16, 2009 at 06:59:27AM +0100, Nick Piggin wrote:
> > > > But there are quite possibly holes around here because not as m=
uch testing
> > > > is done on CPUs with these kinds of caches. Eg. brd probably sh=
ould be
> > > > doing a flush_dcache_page in the rw =3D=3D WRITE direction AFAI=
KS, so it picks
> > > > up user aliases here.
> > >=20
> > > Nick, if you wanted me to schlep a parisc machine to LCA for you,=
 you
> > > needed to ask me *before* I got as far as Vancouver ;-)
> >=20
> > ;)
> >=20
> > That actually might not be a bad idea if I had access to one of you=
r crazy
> > systems. Would it really fit on an aeroplane or would you need a sh=
ipping
> > container? :)
>=20
> They can be taken as checked luggage ... however, what Matthew means =
is
> that by being in Vancouver he's already in transit to Australia.
> However, we can give you access to the several remote test rings we
> have, either Cupertino (send ssh key to Rick Jones <raj@netperf.org> =
or
> Thiabut Var=E8ne <varenet@parisc-linux.org>)
>=20

I think Nick already has access to the gsyprf* systems, as I've seen hi=
m
logged in there before. ;-)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
