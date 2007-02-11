From: Adrian Bunk <bunk@stusta.de>
Subject: [parisc-linux] Re: Fw: Another problem with making things static
Date: Sun, 11 Feb 2007 08:35:20 +0100
Message-ID: <20070211073520.GR12958__42552.4886385121$1416624282$gmane$org@stusta.de>
References: <20070210130136.9538498b.akpm@linux-foundation.org>
	<20070210214309.GP12958@stusta.de>
	<1171158436.3373.51.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Parisc List <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1171158436.3373.51.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 10, 2007 at 07:47:16PM -0600, James Bottomley wrote:
> On Sat, 2007-02-10 at 22:43 +0100, Adrian Bunk wrote:
> > First of all thanks to Andrew for forwarding this email to me - it's 
> > otherwise a bit hard to defend against an email that doesn't reach me.
> 
> I think if you read the email you'll find it didn't actually attack you
> at all ... I was careful only to ask for a change of policy before
> accepting a patch that does nothing but make a function static.

Then let's call it "trying to establish rule forbidding something 
established without even informing the people whose actions you want to 
become forbidden".

> > >...
> > > 
> > > We're going to need this one reverting for parisc.  If you remember
> > > we've been trying to push a compat_sys_rt_sigqueueinfo but Andi keeps
> > > objecting, so it's remained local to our tree (an hence so has the
> > > symbol usage).
> > > 
> > > However, can we *please* stop this indiscriminate rampage through all
> > > the sybsystems making things static just because we can.  The true test
> > > of whether a symbol should be static or not is whether it forms part of
> > > a sensible API or not.  For subsystems with a well defined API, this is
> > > quite easy (although it hasn't prevented attempts to make even those
> > > symbols static).  For some of our core subsystems (like the kernel API
> > > in this case) it's much less well defined ... although we have a good
> > > solid white area of things that must be part of the API and a good solid
> > > black area of things that mustn't, we still have a large grey area which
> > > things like kill_proc_info() fall into.
> > > 
> > > For any person who wants to make a static symbol exported, we force an
> > > explanation out of them about what they're trying to do and why.  Might
> > > I suggest we apply the same standard to anyone trying to make something
> > > static?  i.e. they need to explain clearly why the symbol shouldn't be
> > > part of any rational API.
> > 
> > And by how many percent will this bloat the kernel more in the long 
> > term?
> 
> That's something I'm more than willing to live with if the tradeoff is
> we think before making things static.

The big kernel size increase is a reason why many people in the embedded 
world stay at kernel 2.4.

The fact that you can't get a 2.6 kernel as small as a 2.4 kernel is a 
serious regression. And the last time I checked it wasn't that there's 
some well-defined area where the size increase comes from - it's more or 
less evenly distributed between all not unmaintained parts of the 
kernel.

> > > Thanks,
> > > 
> > > James
> > > Date: Thu, 8 Feb 2007 22:33:21 -0500
> > > From: Kyle McMartin <kyle@mcmartin.ca>
> > > To: Matthew Wilcox <matthew@wil.cx>
> > > Cc: Kyle McMartin <kyle@mcmartin.ca>,
> > > 	parisc-linux <parisc-linux@lists.parisc-linux.org>
> > > Subject: Re: [parisc-linux] 64-bit kernel broken.
> > > 
> > > On Thu, Feb 08, 2007 at 08:24:54PM -0700, Matthew Wilcox wrote:
> > > > On Thu, Feb 08, 2007 at 07:43:14PM -0500, Kyle McMartin wrote:
> > > > > > Right. This got inadvertantly reverted with some other stuff. Fixed in a
> > > > > > second.
> > > > > 
> > > > > Fixed in 1736b4bbf2bbfebaad06114d569f3617517524d1.
> > > > 
> > > > make.err:/home/willy/nicol-2.6/arch/parisc/kernel/signal32.c:519:
> > > > warning: implicit declaration of function 'kill_proc_info'
> > > > make.err:(.text.compat_sys_rt_sigqueueinfo+0x80): undefined reference to
> > > > `kill_proc_info'
> > > > 
> > > 
> > > Guess who came home for Christmas
> > > 
> > > commit d3228a887cae75ef2b8b1211c31c539bef5a5698
> > > Author: Adrian Bunk <bunk@stusta.de>
> > > Date:   Wed Dec 6 20:38:22 2006 -0800
> > > 
> > >     [PATCH] make kernel/signal.c:kill_proc_info() static
> > > 
> > >     Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > >     Signed-off-by: Andrew Morton <akpm@osdl.org>
> > >     Signed-off-by: Linus Torvalds <torvalds@osdl.org>
> > 
> > There are hundreds of such patches of mine that got included in Linus' 
> > tree and that didn't cause problems. Besides making the kernel smaller, 
> > they regularly find "it should have been used" bugs.
> 
> > In this one case, a patch that made something static that wasn't used 
> > from other files during the over 9 years of it's existence clashes with 
> > another patch that adds a user.
> 
> I'm really not that interested in the number of users ... that's only
> one part of the measure of the relevance of an API.  However, if we're
> actually going to revoke an API I'd like it to be done on the API's
> merits (or lack of them) rather than simply whether there are any
> current in-kernel users.
> 
> > Can we agree that it's not a usual case that the first user gets added 
> > after more than 9 years?
> 
> Actually, the compat_rtsiginfo patch has been argued over and honed for
> at least 3 years, so I'd say your statement isn't necessarily correct.
> For some of its life, it was even in -mm.
> 
> > And making it global again when a user gets included isn't really that 
> > hard.
> 
> The life of a non-x86 architecture maintainer is hard ... it involves
> having lots of volunteers tirelessly chasing down things that broke
> during the big two week merge frenzy.  It would be really helpful if
> things like this didn't add to that burden.

The change was not in -mm recently.

The simple rules:
- get your changes in -mm and
- test -mm kernels and scream if someone broke your architecture
would discover many problems before the 2 weeks merge window (and before 
problems hit Linus' tree).

This would also eliminate problems like the parisc defconfig not 
compiling in 2.6.20 due to the work_struct changes.

> James

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
