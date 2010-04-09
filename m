From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Fri, 09 Apr 2010 12:31:39 -0400
Message-ID: <1270830699.8319.175.camel@mulgrave.site>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca>
	 <20100408224446.96F294FA3@hiauly1.hia.nrc.ca>
	 <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
	 <20100409151330.GA23889@hiauly1.hia.nrc.ca>
	 <1270828136.8319.126.camel@mulgrave.site>
	 <20100409162247.GA24334@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Carlos O'Donell <carlos@systemhalted.org>, deller@gmx.de,
	gniibe@fsij.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100409162247.GA24334@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2010-04-09 at 12:22 -0400, John David Anglin wrote:
> On Fri, 09 Apr 2010, James Bottomley wrote:
> 
> > > I posted the change to not clobber r19 on fork/clone syscalls,
> > > but there has been no response to it.
> > 
> > Theory looks fine to me ... although Helge sees no difference in
> > behaviour, I'd be happy to apply on the principle of no harm and
> > theoretically necessary.
> 
> Testcase is below.  Compile with `-static' to link with libc.a.
> Testcase prints incorrect parent pid.
> 
> Carlos recently updated glibc so it saves/restores r19 across syscalls
> in non-PIC code.  I thought Helge tested this update, so he wouldn't
> see the problem unless he tested with an "old" version of glibc.
> 
> While there isn't a lot of code linked with -static (I mainly
> use for debugging), there's no real reason that the kernel needs
> to clobber r19 across fork/clone.
> 
> If we want to preserve pad0 for some future use, I think that it
> should be possible to use another syscall clobbered register to
> save the return pointer for the child.
> 
> > I'm fairly convinced we need the flush on kmap(_atomic) as well if the
> > user had dirtied the page.  Right at the moment if the aliases are
> > inequivalent (which they are about 99.9% of the time) we're in danger of
> > using stale data in the kernel.  We also need a flush on kunmap if the
> > kernel has dirtied the page.
> 
> This is presumably for PA8800/PA8900 processors?

No the pa88/89 problem was a clean alias resolution issue, which doesn't
exist on earlier processors that don't have the L3 PIPT cache.  The
problem I think we see infrequently (very infrequently) is that we kmap
a user page that has dirty cache lines and access it through the kernel
alias before the lines get cleaned.  This only occurs in a very few
areas of the kernel (like copy_user_highpage), but it's a potential
source of stale data through inequivalent aliasing.

>   I'm a bit surprised
> that HP would change the cache coherency requirement for these processors
> alone given the performance hit in maintaining coherency.  Is this an
> issue for all systems with more than two processors?

The requirement has always been flush the dirty line before accessing
via another alias (appendix F says that) I just think we've been playing
it a bit loose in the kmap area.

> I've wondered if checking the dirty bit in kunmap would help performance.

It would ... enormously ...  and also on kmap.  The latter is much
harder to do since we need the vaddr of the page and we don't get it fed
in via the API.

James


