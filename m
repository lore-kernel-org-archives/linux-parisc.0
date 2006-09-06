From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Tue, 5 Sep 2006 20:24:00 -0400 (EDT)
Message-ID: <200609060024.k860O0Br009253@hiauly1.hia.nrc.ca>
References: <20060905051247.GB12278@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@SteelEye.com,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060905051247.GB12278@colo.lackof.org> from "Grant Grundler" at
	Sep 4, 2006 11:12:47 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> >  Integer division and multiplation are very expensive, particularly when
> > running in 64-bit mode.  We don't have optimized millicode to do it.
> > So, I don't much like falling into the unlikely case if we are just
> > delayed one tick.
> 
> How many loops would be a reasonable tradeoff? 5? 10?
> We'd need a histogram from a "slow" machine to see that tradeoff.

The decision to loop versus division/multiplication can be made
based on the average number of cycles needed for the former versus
the latter.  If now - next_tick is less than nticks, then loop.
I'm sure the average number of cycles for division/multiplication
depends on whether the code is 32 bits or 64 bits.  Take a look
at __divdi3 if you want to see how horrible integer division is.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
