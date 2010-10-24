From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: C8000 cpu upgrade problem
Date: Sun, 24 Oct 2010 05:03:25 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010240432390.30241@artax.karlin.mff.cuni.cz>
References: <20101024020337.725094D30@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101024020337.725094D30@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sat, 23 Oct 2010, John David Anglin wrote:

> > I'm still thinking the processor module shown above is the base
> > model with 3 MB L1 and no L2, and it's not consistent with upgrade
> > module.
> 
> I just noticed the following wording in the online specifications:
> 
> 1 or 2 dual-core PA-8800 or PA-8900 processors
>   (2-way 900 MHz PA-8800 with 3 MB L1 cache,
>    2 or 4-way 900 MHz or 1 GHz PA-8800 3 MB L1 and 32 MB L2 cache or
>    2 or 4-way 1.1 GHz PA-8900 with 3 MB L1 cache and 64 MB L2 cache)
> 
> Note the base model with no L2 appears to be only 2-way.  If it
> can be upgraded, I think you would need a AB665A kit.  Kits with
> L2 cache seem more common.  To do this right, you need to start
> with the specific workstation model number.
> 
> See HP PartSurfer.
> 
> I also found a QuickSpecs document with PA-8900 processors.  It looks
> like the 2-way base is not upgradeable as the second processor options
> only have 64 MB L2.  The document lists a 2nd processor as an after-market
> option (AB675A or AB676A).  There is a note that the second processor
> must be the same as the first.
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

I tried to measure the cache size, sequential memory read showed cutoff at 
700kB and no cutoff at 32MB. It shows 1.7GB/s below 700kB and 612MB/s 
above. Latency measurements (chasing pointer chain) showed drastic cutoff 
at 700kB (from 3ns to 300ns) and no cutoff at 32MB.

It may be that the lack of L2 cache is the reason why the CPUs don't 
support multiprocessing ... I may buy two better CPUs, if I had actually 
guarantee that the machine isn't locked (I don't want to waste more money 
just to find out that the firmware lock doesn't go away).

Mikulas
