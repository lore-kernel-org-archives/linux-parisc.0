From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Thu, 28 Oct 2010 02:04:37 -0400 (EDT)
Message-ID: <20101028060439.5FA924CFC@hiauly1.hia.nrc.ca>
References: <1288199246.6886.9.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: mikulas@artax.karlin.mff.cuni.cz, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1288199246.6886.9.camel@mulgrave.site> from "James Bottomley" at Oct 27, 2010 12:07:26 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, 2010-10-27 at 18:50 +0200, Mikulas Patocka wrote:
> > > > Why is Kyle than suggesting that I am lucky because I have no L2 cache 
> > > > (and therefore, Linux runs faster)?
> > > > 
> > > > Why are people talking here about flushing 32MB or 64MB L2 on fork()?
> > > > 
> > > > Or is it that you need to flush only L1 cache but the architecture forces 
> > > > flush of both caches?
> > > 
> > > There's only a couple of flush instructions: fic and fdc ... they have
> > > to flush all caches.  We did argue the toss on this with the HP
> > > processor people since aliasing, which is primarily where we need
> > > flushes for control, only occurs in the L1 cache.  However, they pointed
> > > out that if they made fic and fdc L1 specific, we'd have no control over
> > > DMA type ops which have to reach physical memory.
> > > 
> > > > I'd still like to see if someone with PA8800 or PA8900 with L2 ran that 
> > > > shared memory experiment to actually *prove* that L2 is physically indexed 
> > > > and that the L1 equivalency modulus is 4MB. I.e. not rely on what you 
> > > > heard somewhere, but rely on what you see.
> > > 
> > > We already did all of that years ago just trying to make the pa8x00
> > 
> > If it is really proved, OK.
> > 
> > So, the CPU takes a hash of bits some bits up to 4MB and uses them to 
> > calculate an index into 4-way not-power-of-two-sized L1 cache?
> > 
> > > chips work with linux ... they didn't for about 18 months.
> > > 
> > > James
> > 
> > Unfortunatelly, I still get some userspace crashes on SMP, I already found 
> > one reproducible crash (running "make install" on gcc-4.5.1). The crash 
> > happens with some probability, but the probability is high enough so that 
> > it's reproducible.
> > 
> > Do you have some idea where cache flushing is missing so that I could try 
> > if it fixes my case?

I also see random userspace segmentation faults on SMP.  This is not
restricted to PA8800/PA8900 processors, although it is less frequent
on earlier processors.  The probability of completing a full GCC build
on a SMP system is relatively low.

Some kernels (e.g., 2.6.19) have been better than others but the reason
is unknown.

> This is what we know
> 
> http://wiki.parisc-linux.org/TestCases

The wiki certainly has a number of testcases that fail with high probability.
The testcases all involve multiple threads and near simultaneous execution
of a clone and a fork.  The parent forks after the clone.  The segvs always
occur in the thread created by the clone syscall.  The stack created for
the thread is corrupted by the fork.  It is allocated by a mmap call.
If the fork is delayed, the segvs don't occur.

However, I'm totally convinced there are more problems than the one above.
They are just harder to reproduce.  In general, GCC builds don't involve
multithreaded applications.

> > BTW. if you flush cache on kmap, I think it couldn't work in multithreaded 
> > environment at all --- i.e. the program has "int a, b;" both variables 
> > share the cacheline, one thread is accessing "a" via kmap and the other 
> > thread writes to b directly, for example "b = 5". Then, cache flushing 
> > won't help and one of the variables will be trashed. You need kmap address 
> > to be congruent with the linear address. But I think it's not reason for 
> > my crash because neither gmake nor bash (that crashes) is multithreaded.

Agree.

> That statement assumes the threads share a data structure but are not
> congruent ... which certainly isn't true for userspace.  Our only
> incongruency which gives rise to aliasing is between the kernel and user
> address spaces and we don't do data sharing between the two without
> pretty severe accessor restrictions.

My sense is the above isn't correct.  Even if userspace is congruent,
it would seem to me that another thread could dirty the cache line after
kmap does its flush.  The design of the Linux memory management system
might prevent this from happening, but it's not obvious.  That's why
I thought the kernel should use also use congruent mappings.

My 32-bit UP c3750 is fully stable.  It has run for months and I don't
see any wierd segmentation faults in userspace doing gcc builds.  On
the otherhand, the testcases on the wiki crash with high probabiity.
So, I think we are dealing with two different, but possibly related
issues.  One is a MP issue.  The other is a clone/fork race.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
