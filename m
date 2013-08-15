From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: New Debian Kernel Packages
Date: Wed, 14 Aug 2013 17:38:47 -0700
Message-ID: <1376527127.2028.67.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP89A9F5D677CA80946A5DB097550@phx.gbl>
	 <51FADF39.4020505@gmx.de> <BLU0-SMTP3529F28468423082C0A26797500@phx.gbl>
	 <1375397525.2070.17.camel@dabdike>
	 <BLU0-SMTP4320CF464D6486AAAC10C97450@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP4320CF464D6486AAAC10C97450@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2013-08-14 at 19:43 -0400, John David Anglin wrote:
> On 1-Aug-13, at 6:52 PM, James Bottomley wrote:
> 
> > On Thu, 2013-08-01 at 18:39 -0400, John David Anglin wrote:
> >> On 1-Aug-13, at 6:20 PM, Helge Deller wrote:
> >>
> >>> Hi Dave,
> >>>
> >>> On 07/30/2013 12:46 AM, John David Anglin wrote:
> >>>> The following kernel packages are now in the parisc-linux.org
> >>>> archive:
> >>>>
> >>>> linux-image-3.10-1-parisc-smp_3.10.3-1_hppa.deb
> >>>> linux-image-3.10-1-parisc64-smp_3.10.3-1_hppa.deb
> >>>> linux-image-3.10-1-parisc64_3.10.3-1_hppa.deb
> >>>> linux-image-3.10-1-parisc_3.10.3-1_hppa.deb
> >>>
> >>> That's fantastic!
> >>> This brings us one big step further to being able to build a real
> >>> debian-unstable-installer boot CD.
> >>>
> >>> I'm still hoping the C8000 patches I pushed for inclusion into 3.11
> >>> will then
> >>> show up in stable 3.10 series soon as well. If that happens we will
> >>> have a kernel
> >>> which should boot on all machines - including the c8000.
> >>
> >>
> >> I have bootstrap tested the linux-image-3.10-1-parisc64-
> >> smp_3.10.3-1_hppa.deb package.  We'll
> >> have to see if 3.10 will be the Debian choice for the next release.
> >>
> >> As I mentioned in private, I have found that flush_cache_all() is the
> >> principal problem causing random
> >> segmentation faults on SMP systems.
> >
> > That would tend to indicate the architectural flush code is wrong: it
> > isn't flushing all as it should be.
> 
> 
> After looking at this, I think there is an irq problem.  It looks like  
> we loose IPI
> interrupts on occasion,

I don't really think this can be the case.  Our flushes are all done via
the generic function on_each_cpu() with wait set to true.  If we were
losing IPIs, this would cause the wait to wait forever and you should
see a system hang (or at least one CPU spinning in cpu_relax while it
waits).  on_each_cpu() uses a list to process and store invocations, so
even two simultaneous calls to the flush functions should be strictly
sequenced on each cpu.

>  or there is a sequencing issue in processing  
> them.
> In particular, it would be bad if we simultaneously tried to purge  
> both theTLB
> and cache at the same time.  However, this isn't the whole answer.

I can't really see how: the architectural TLB flush will, of course,
purge TLBs in the tmpalias region, but they'll just refill on the next
access for a flush, so I could see simultaneous TLB flush and cache
flush slowing each other down, but I can't see a problem arising, unless
I've missed something?

James


