From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] parisc fixes for kernel v4.19
Date: Tue, 2 Oct 2018 15:24:52 -0700
Message-ID: <20181002222452.GB11788@kroah.com>
References: <20181002210213.GA17826@ls3530.fritz.box>
 <20181002211645.GA6454@kroah.com>
 <ad45f249-e064-d5a4-c658-eaa03bb3a04a@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ad45f249-e064-d5a4-c658-eaa03bb3a04a@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 02, 2018 at 11:46:11PM +0200, Helge Deller wrote:
> Hi Greg,
> 
> On 02.10.2018 23:16, Greg Kroah-Hartman wrote:
> > On Tue, Oct 02, 2018 at 11:02:13PM +0200, Helge Deller wrote:
> >> please pull a last set of fixes for the parisc architecture for kernel 4.19 from:
> >>
> >>   git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.19-3
> >>
> >> The major change is for parisc64 to use a 64-bit suseconds_t type to
> >> match what glibc expects for 64-bit userspace. It's an ABI change, but
> >> since we don't have a 64-bit userspace on parisc yet, it won't introduce
> >> a breakage.
> > 
> > Isn't it a bit "late" in the release cycle for such a change?  Why not
> > do this on the -rc1 release?
> 
> I've tagged it for stable release.
> So, it can go in now, or just wait until -rc1 and go in later.

Why is a major API change a viable stable change?  What bugfix does it
provide?

> >> Other than that we simply drop unused code and outdated gcc version
> >> checks.
> > 
> > Why are those needed now?
> 
> The patch in there which is by me changes one line simply cleans up a patch which
> went in during the 4.19 merge cycle. So it would be nice to have it
> added now before v4.19 gets released.
> The other two patches are trivial and just remove dead code.
> I rate them all as non-critical, but nice-to-have-in-v4.19. 
> 
> If you disagree I'm absolutely fine to wait with all of them 
> for the next merge window.

Normally I only let "bugfixes" into my trees at this point in time.
cleanups always wait for the next -rc1 merge window as that's what it is
there for.  So I'd recommend waiting as well.

I'm more "worried" about the api change listed above.

thanks,

greg k-h
