From: dann frazier <dannf@dannf.org>
Subject: Re: NTPL transition
Date: Thu, 4 Sep 2008 09:23:29 -0600
Message-ID: <20080904152329.GA24316@colo.lackof.org>
References: <20080904114551.GA18877@tilt.dandreoli.com> <119aab440809040713m2a448cd4sea02cd2df7d7b42c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440809040713m2a448cd4sea02cd2df7d7b42c@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On Thu, Sep 04, 2008 at 10:13:15AM -0400, Carlos O'Donell wrote:
> On Thu, Sep 4, 2008 at 7:45 AM, Domenico Andreoli <cavok@dandreoli.com> wrote:
> >  I would set NPTL transition as a goal for queeze.
> >
> > Are we available to agree on a shared path to push new life to this port?
> > I mean, this issue will bite more and more frequently, it must be fixed.
> 
> I agree. I'm available and willing. I'm just not a DD nor am I
> familiar with debians sbuild or buildds.
> 
> > I am available to follow the required steps but obviously the more eyes
> > the better. This is the first time I work on a big transition like this.
> 
> I'm available at OFTC on #debian-glibc. I act as a debian-hppa porter
> and help Aurelian when glibc hppa issues arise.
> 
> > I think the first packages have to be cross-built, until a minimal
> > build system is ready to run on the new libc6.1 (chroot?). Then start
> > an archive rebuild. It looks easy, where is the trap? :)
> 
> I'm not familiar with the debian build infrastructure, but I am *very*
> familiar with libc since I'm the upstream ports maintainer for hppa.
> 
> I don't think there is any trap.

I've already done the initial bootstrapping and John Wright and I have
a buildd actively rebuilding bits against sid. We're rsyncing the
results out to here:
  http://parisc-linux.org/~dannf/hppa-nptl-mirror/unstable/

Suffice to say, the rebuild is going fairly smoothly. But, I wonder
how we're going to transition systems over to an NPTL userspace. Does
anyone have a plan for that?

-- 
dann frazier

