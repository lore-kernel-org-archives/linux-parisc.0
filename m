From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Wed, 28 Nov 2007 09:25:51 +0100
Message-ID: <JS7JF3$B26560F4AD894A9D4B4501FF960EB990@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: "grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Tue, Nov 27, 2007 at 01:48:32PM +0100, Joel Soete wrote:
> > grr even thought I read well:
> > "[snip]
> > Hardware Implications
> > Cache memory is defined as a small, high-speed block of memory located close
> > to the processor. On the HP PA 7200 and PA8000 processors, a portion of the
> > software virtual address (called the virtual index) is used as the cache
lookup.
> > [snip]"
> > 
> > That's what confusing me, sorry.
> 
> You need to read about "VIVT" caches (Virtual Indexed, Virtual Tagged).
> The "Virtual Index" bits have to be provided by any cache coherent traffic
> in order to be cache coherent. That's how the caches know _where_ in the
> cache to find potential hits for a given cacheline.
> 
For sure I need more reading but imho this paper is already clear on subject:
my understanding (in short terms) is that cpu cache entry should be the same
virtual address as DMA cache else it would need additional stuff to check
physical address, right?

> ...
> > >  AFAIK U2/U-Turn both are fixed
> > > on which page size the support. That would work fine with linux since we
> > > just increase the base page size (e.g. 16k or 64k pages for IA64).
> > >
> > Well, reading further, even thought it seems to be 'programmable':
> > "[snip]
> > A second feature of this scheme is that it helps limit the overhead of the I/O
> > page directory. Recall that the I/O page directory contains all active address
> > translations and must be memory-resident. I/O page directory size is equal to
> > the size of one entry times 2^k, where k is the number of chain ID bits plus
> > the number of block ID bits. The division between the chain ID and the block
> > ID is programmable, as is the total number of bits (k), so software can reduce
> > the memory overhead of the I/O page directory for systems with smaller I/O
> > subsystems if we guarantee that the leading address bits are zero for these
> > smaller systems.
> > [snip]"
> > 
> > That said I discover a difference between my d380 and c110 config:
> > for c110 no CONFIG_EISA support,
> > for d380 CONFIG_EISA yes
> 
> EISA introduces a different IOMMU that we haven't written any code for.
> We need the "WAX ERS" IIRC.
> parisc-linux currently does not support DMA by EISA devices.
> 
That's for this last reason that I disable it in the config of my c110 (but I
don't remember why I didn't reproduce it on the d380?)
 
> ...
> > So make a difference in HINT_STOP_MOST value.
> > Anyway, may be could it help to delay also a bit issue on c110 as on d380 (may
> > be enough to re-install the system?)
> 
> You can try it and see if it helps.
> I don't have U2/U-Turn ERS anymore and thus can not review
> the original source of information.
> 
The hp engineer who help us to maintain our park of hp9000 made a few effort
to look for ERS doc but without success.

> > That siad, the above mentioned paper spoke about "Atomic or locked mode": is
> > it this HINT_STOP_MOST which enable this mode?
> 
> Sorry - I don't know. My guess is the ERS probably has that info.
> 
No worry, I just continue to play with this driver because this is the only
type of box on which I can still play p-l :-)

> 
> ...
> > What's your idea (afaik a500 didn't use ccio nor ncr53c720)?
> 
> You mean "Why test on a500 given A500 doesn't use ccio"?
> Just to make sure it's not a generic problem.
> 
I guess but would like to be sure that well undertood ;-)

> In general, I was expecting James Bottomley to have seen issues
> with ccio when testing on his C360 (in the past, not recently).
> 
I remember to have some few feedback from jejb but don't remember if he could
reproduce this test?

> hth,
> grant
> 
> 
In the mean time I will continue my reading, ...

Many thanks for your attention,
    J.
---
Pack Scarlet One, ADSL 6 Mbps + Telephonie, a partir de EUR 29,95...
http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
