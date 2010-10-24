From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: C8000 cpu upgrade problem
Date: Sun, 24 Oct 2010 00:01:19 -0400 (EDT)
Message-ID: <20101024040120.5DB054D30@hiauly1.hia.nrc.ca>
References: <alpine.DEB.1.10.1010240432390.30241@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: mikulas@artax.karlin.mff.cuni.cz (Mikulas Patocka)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010240432390.30241@artax.karlin.mff.cuni.cz> from "Mikulas Patocka" at Oct 24, 2010 05:03:25 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> It may be that the lack of L2 cache is the reason why the CPUs don't 
> support multiprocessing ... I may buy two better CPUs, if I had actually 
> guarantee that the machine isn't locked (I don't want to waste more money 
> just to find out that the firmware lock doesn't go away).

Are you sure the part numbers for the two processor modules that you
have are the same?  Parts with cache seem much more common.  There
also seem to be quite a few obsolete parts.

It might be Linux would work better without the L2 cache.  There are
are some cache coherency issues that haven't been resolved in SMP.
These problems are aggrevated by the L2 cache which takes a long
time to flush.

It's just not clear that your machine is locked.  The c8000 model
name doesn't change depending on number of processors.  If you search
on rp3410 processor upgrade, you will find that a processor update
license is needed to go from one to two processor.  This is clear
in the documentation.  I couldn't find anything similar for c8000.
Indeed, there are many indications that an after-market processor
update is possible for it.

Good luck,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
