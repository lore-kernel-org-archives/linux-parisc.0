From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Wed, 27 Oct 2010 18:50:47 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010271837040.18202@artax.karlin.mff.cuni.cz>
References: <20101027012932.3CB6E4FB4@hiauly1.hia.nrc.ca>  <1288155041.19649.354.camel@mulgrave.site>  <alpine.DEB.1.10.1010270957110.31946@artax.karlin.mff.cuni.cz>  <1288188465.4692.0.camel@mulgrave.site>  <alpine.DEB.1.10.1010271820320.18202@artax.karlin.mff.cuni.cz>
 <1288197324.6886.2.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1288197324.6886.2.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Why is Kyle than suggesting that I am lucky because I have no L2 cache 
> > (and therefore, Linux runs faster)?
> > 
> > Why are people talking here about flushing 32MB or 64MB L2 on fork()?
> > 
> > Or is it that you need to flush only L1 cache but the architecture forces 
> > flush of both caches?
> 
> There's only a couple of flush instructions: fic and fdc ... they have
> to flush all caches.  We did argue the toss on this with the HP
> processor people since aliasing, which is primarily where we need
> flushes for control, only occurs in the L1 cache.  However, they pointed
> out that if they made fic and fdc L1 specific, we'd have no control over
> DMA type ops which have to reach physical memory.
> 
> > I'd still like to see if someone with PA8800 or PA8900 with L2 ran that 
> > shared memory experiment to actually *prove* that L2 is physically indexed 
> > and that the L1 equivalency modulus is 4MB. I.e. not rely on what you 
> > heard somewhere, but rely on what you see.
> 
> We already did all of that years ago just trying to make the pa8x00

If it is really proved, OK.

So, the CPU takes a hash of bits some bits up to 4MB and uses them to 
calculate an index into 4-way not-power-of-two-sized L1 cache?

> chips work with linux ... they didn't for about 18 months.
> 
> James

Unfortunatelly, I still get some userspace crashes on SMP, I already found 
one reproducible crash (running "make install" on gcc-4.5.1). The crash 
happens with some probability, but the probability is high enough so that 
it's reproducible.

Do you have some idea where cache flushing is missing so that I could try 
if it fixes my case?

BTW. if you flush cache on kmap, I think it couldn't work in multithreaded 
environment at all --- i.e. the program has "int a, b;" both variables 
share the cacheline, one thread is accessing "a" via kmap and the other 
thread writes to b directly, for example "b = 5". Then, cache flushing 
won't help and one of the variables will be trashed. You need kmap address 
to be congruent with the linear address. But I think it's not reason for 
my crash because neither gmake nor bash (that crashes) is multithreaded.

Mikulas
