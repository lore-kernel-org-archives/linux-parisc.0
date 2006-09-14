From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Good news for d380 but sad news for n4k
	with	newest rwlock implementation ; -)
Date: Wed, 13 Sep 2006 23:16:00 -0500
Message-ID: <200609132316.00952.mszick@morethan.org>
References: <4508505F.8030407@scarlet.be>
	<200609131410.51839.mszick@morethan.org>
	<45086ED6.2070109@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45086ED6.2070109@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed September 13 2006 15:49, Joel Soete wrote:
> 
> Michael S. Zick wrote:
> > On Wed September 13 2006 13:39, Joel Soete wrote:
> >> Hello all,
> >>
> >> The good point is that k 2.6.18-rc5-pa1 (32bit smp) already run my kernel build loop for 10 days of test without any pb ;-)
> >>

That is progress - the D380 used to be the one that failed first - now
that is around 5 times longer than ever before.

> >> Otoh, the 2.6.18-rc7-pa0 (64bit smp) boot well on n4k but didn't survive 10 minutes (here there are an additional tar/untar 
> >> loop) to stress test.
> >>

This may also be good news - with the general problems taken care of, now
we have something specific to the N4K to locate.

And having it fail in 10 minutes is a lot nicer than failing in 10 days.

> > 
> > Finally, I think we forced the kernel to give us some usable information!
> > 
> > Besides the kernel version and kernel width (32-bit & 64-bit) your earlier
> > posting of the /proc/cpuinfo messages shows the d380 is a 32-byte cache-line
> for c110 yes but for d380 I would like to check (this a p8000 but runing 32bit kernel so?)
>

My bad, it was the c110 with the 32-byte cache-line, I lost track of what was what.

> (specialy usefull to me to learn how to finish the jda stuff)
>

IIRC, Since spinlock_t is a compile-time size, Dave thought that all we could do
was print a warning if the kernel was booted on a machine with a cache-line size
different than what it was compiled for.

To do that requires the cache-line size be put into that pdc data structure;
which is part of the /proc/cpuinfo and dmesg changes.

Since application programs may not have to be compile-time sized, having the
cache-line size in /proc/cpuinfo could be useful for other purposes also.

I seem to recall that Dave passed on those changes to Kyle, but I may be
wrong in my recollection.
 
> > and the n4k is a 64-byte cache-line machine.
> > 
> Curious to read results on pa8800 system (if somebody could take try on such system?)
> 
> > What patches where applied to this kernel?
> > Willy's spinlock changes?
> > The timer changes?
> > The interrupt nesting changes?
> > The /proc/cpuinfo changes?
> > 
> on d180 only "Willy's spinlock changes" (as per pa1)
> on n4k all.
>

Perhaps those changes should get another look for 64-bit problems before
pulling them to locate the one that took the machine down so fast.
 
> Joel
Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
