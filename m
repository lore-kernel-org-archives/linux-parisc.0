From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] Remove needless flush_dcache_page call
Date: Fri, 16 Jan 2009 09:28:21 -0500
Message-ID: <1232116101.3224.14.camel@localhost.localdomain>
References: <20090116052804.GA18737@barrios-desktop>
	 <20090116053338.GC31013@parisc-linux.org>
	 <20090116055119.GA6515@barrios-desktop>
	 <20090116055927.GA22810@wotan.suse.de>
	 <20090116060124.GG31013@parisc-linux.org>
	 <20090116073413.GC22810@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Matthew Wilcox <matthew@wil.cx>, linux-parisc@vger.kernel.org
To: Nick Piggin <npiggin@suse.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090116073413.GC22810@wotan.suse.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2009-01-16 at 08:34 +0100, Nick Piggin wrote:
> On Thu, Jan 15, 2009 at 11:01:24PM -0700, Matthew Wilcox wrote:
> > On Fri, Jan 16, 2009 at 06:59:27AM +0100, Nick Piggin wrote:
> > > But there are quite possibly holes around here because not as muc=
h testing
> > > is done on CPUs with these kinds of caches. Eg. brd probably shou=
ld be
> > > doing a flush_dcache_page in the rw =3D=3D WRITE direction AFAIKS=
, so it picks
> > > up user aliases here.
> >=20
> > Nick, if you wanted me to schlep a parisc machine to LCA for you, y=
ou
> > needed to ask me *before* I got as far as Vancouver ;-)
>=20
> ;)
>=20
> That actually might not be a bad idea if I had access to one of your =
crazy
> systems. Would it really fit on an aeroplane or would you need a ship=
ping
> container? :)

They can be taken as checked luggage ... however, what Matthew means is
that by being in Vancouver he's already in transit to Australia.
However, we can give you access to the several remote test rings we
have, either Cupertino (send ssh key to Rick Jones <raj@netperf.org> or
Thiabut Var=C3=A8ne <varenet@parisc-linux.org>)

I thought we also had a wiki page listing all the machines, but I can't
find it.  They all use the HP Guardian Service Processor console, which
gives you remote console, power and all the other good things you need.

James


--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
