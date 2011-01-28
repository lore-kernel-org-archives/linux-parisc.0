From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Need to start dismantling Cupertino PA-RISC Linux
Date: Thu, 27 Jan 2011 21:38:27 -0500
Message-ID: <20110128023827.GA27517@hiauly1.hia.nrc.ca>
References: <20100622231714.GE8644@lackof.org> <20100623003317.B9F974E77@hiauly1.hia.nrc.ca> <20100623003615.GG20317@bombadil.infradead.org> <20110124040815.GB10768@parisc-linux.org> <20110124150813.GI27353@bombadil.infradead.org>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110124150813.GI27353@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 24 Jan 2011, Kyle McMartin wrote:

> On Sun, Jan 23, 2011 at 09:08:15PM -0700, Grant Grundler wrote:
> > On Tue, Jun 22, 2010 at 08:36:15PM -0400, Kyle McMartin wrote:
> > > On Tue, Jun 22, 2010 at 08:33:16PM -0400, John David Anglin wrote:
> > > > I have used up all the spare drives that Grant provided me servicing
> > > > the RS11 and the disk array on hiauly2.  I know Kyle has a spare RS11
> > > > and maybe parts.  Probably, some spare parts for the above would be
> > > > useful but I don't have a huge amount of free time to debug hardware
> > > > issues at the moment.
> > > > 
> > > 
> > > You're welcome to whatever hardware I have here in Ottawa. I'll try to
> > > make a list when I get back to Canada in a few weeks.
> > 
> > Kyle,
> > In case this HW is still laying around, can you generate a HW list please?
> > 
> 
> C3750
> J6700
> RP3440 (quad 1GHz)
> RX2600 (from Martin Hicks, probably WOS's)
> ZX6000
> Bigmama (destined for the scrap heap, has bogus PAL fw that doesn't
> support new PAL cache flush.)
> 712
> 715
> B180
> Various A500
> C8000
> 
> I only really want to keep the C8000, I think, but maybe I'll look and
> see if there's a production one on Ebay. I'm going to talk to various
> people about hosting the RP3440 maybe, but if JDA wants it, he's welcome
> to it. I need to move on to new projects. :/ (I have some newer Sun and
> SGI gear that might need some love someday if I can get the time.)

Kyle has more than enough stuff here in Ottawa to keep GCC support
going, and to help with further kernel development.  A few WD drives
would be useful if there are any still around.

I'm thinking the rp3440 running hpux 11.31 would be very useful as a
comparison base.  If that could be arranged, it would be great.  A
issue came up this week where a 11.31 had a different behavior from
11.11 and 11.23.

Currently, I'm seeing improved stability on my rp3440 running SMP.
James' last patch to improve vmap flush/invalidate seems to be a
a very important change.  Comparing it versus the current code in
update_mmu_cache, it seems we should limit the flush to when
pfn_valid(page_to_pfn(page)) && page_mapping(page) is true.
This seems to have further improved stability and I actually got
through a full GCC build with make -j4 build.  This was something
of a build record, but running the testsuite is still painfully slow.

I'm continuing to test, but I'm hopeful that we are finally gaining
an understanding of the cache issues and the random segvs that result
from cache corruption.  This will make a broader range of machines
usable.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
