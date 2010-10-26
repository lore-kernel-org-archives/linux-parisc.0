From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: C8000 cpu upgrade problem
Date: Tue, 26 Oct 2010 04:04:16 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010260401420.6982@artax.karlin.mff.cuni.cz>
References: <20101024040120.5DB054D30@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101024040120.5DB054D30@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 24 Oct 2010, John David Anglin wrote:

> > It may be that the lack of L2 cache is the reason why the CPUs don't 
> > support multiprocessing ... I may buy two better CPUs, if I had actually 
> > guarantee that the machine isn't locked (I don't want to waste more money 
> > just to find out that the firmware lock doesn't go away).
> 
> Are you sure the part numbers for the two processor modules that you
> have are the same?  Parts with cache seem much more common.  There
> also seem to be quite a few obsolete parts.

They are the same (I posted the version numbers written by PDC). But as 
you noted, the versions without L2 cache may not be smp aware.

> It might be Linux would work better without the L2 cache.

What is the exact problem with L2 cache? Is it virtually indexed too?

> There are are some cache coherency issues that haven't been resolved in 
> SMP.

What exactly do you mean?

> These problems are aggrevated by the L2 cache which takes a long 
> time to flush.
> 
> It's just not clear that your machine is locked.  The c8000 model
> name doesn't change depending on number of processors.  If you search
> on rp3410 processor upgrade, you will find that a processor update
> license is needed to go from one to two processor.  This is clear
> in the documentation.  I couldn't find anything similar for c8000.
> Indeed, there are many indications that an after-market processor
> update is possible for it.

I don't know. Before I buy two CPUs to get a quad-core system, I'd like to 
make sure it isn't locked. Can the lock be detected somehow?

Mikulas

> Good luck,
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
> 
