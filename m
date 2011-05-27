From: dann frazier <dannf@dannf.org>
Subject: Re: debian hppa
Date: Fri, 27 May 2011 10:35:18 -0600
Message-ID: <20110527163518.GD21744@dannf.org>
References: <BANLkTikFc1Euw-c+qiUaUznMg7b_1a+4Hg@mail.gmail.com>
 <20110525234205.GB2556@dannf.org>
 <20110526012304.GB1912@hiauly1.hia.nrc.ca>
 <20110526144610.GC2556@dannf.org>
 <20110526152900.GA5200@hiauly1.hia.nrc.ca>
 <20110526160951.GA19134@dannf.org>
 <BANLkTimmzyQWPD0BribiDgM7W6yvOJwUJA@mail.gmail.com>
 <20110527145656.GB21744@dannf.org>
 <BANLkTi=BODRACq5N1XBrN+JovNjE2VTibQ@mail.gmail.com>
 <20110527162453.GA10333@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110527162453.GA10333@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, May 27, 2011 at 12:24:54PM -0400, John David Anglin wrote:
> On Fri, 27 May 2011, Carlos O'Donell wrote:
> 
> > On Fri, May 27, 2011 at 10:56 AM, dann frazier <dannf@dannf.org> wrote:
> > > Probably. debian-ports is the only other option I know of - but it
> > > means we need people to step up and do random bits of release work
> > > (keeping a working installer, etc). I also think we'd need to have
> > > some notion of a "stable" release - I don't think an unstable-only
> > > release is very useful outside of a developer's basement, and not
> > > something I'd want to host our infrastructure systems on.
> > >
> > > Since I don't see that happening, yes, Gentoo.
> > >
> > 
> > We need like 3-4 more people on the project to properly support
> > debian-ports for hppa. I don't think that type of support is going to
> > materialize any time soon.
> 
> It's unclear whether any volunteer support for hppa remains within
> "debian".  I added the parisc-linux list to the cc list to make people
> aware of the situation.
> 
> Aside from the issue about releases, the buildd process is stuck
> due to unresolved dependencies.  Maybe it should be shutdown to
> preserve state.

Stuck? Why do you say that? We are only building updates for lenny
currently, and that seems to be working just fine.

> > Therefore I think Gentoo is probably the best option for the community.
> > 
> > I don't care how we achieve a sustainable distribution for hppa, only
> > that we continue to provide value to our user community.
> 
> There is some hppa work still being done in Gentoo, so I tend to agree
> but I have no direct experience with it.
> 
> Dave
